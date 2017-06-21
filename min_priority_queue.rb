require_relative 'utility.rb'

class MinPriorityQueue
  attr_reader :size

  def initialize
    @binary_heap = []
    @size = 0
  end

  def empty?
    @size == 0
  end

  def insert(key)
    @size += 1
    @binary_heap[size] = key
    sift(@size)
  end
 
  def min
    @binary_heap[1]
  end

  def delete_min
    return nil if empty?
    min = @binary_heap[1]
    @binary_heap[1] = @binary_heap[@size]
    @size -= 1
    swim(1)
    return min
  end

  private 

  # restore heap order from bottom up
  def sift(index)
    return if index == 1
    parent_index = (index / 2).floor
    if @binary_heap[parent_index] > @binary_heap[index]
      Utility.swap(@binary_heap, parent_index, index)
      sift(parent_index)
    end
  end
  
  # restore heap order from top
  def swim(index)
    left = index * 2
    right = left + 1
    root = index
    # replace root with the largest of the two children
    if left <= @size
      root = left if @binary_heap[left] < @binary_heap[root]
    end
    if right <= @size
      root = right if @binary_heap[right] < @binary_heap[root]
    end

    # if root changed, need to swap and restore heap with new root
    if root != index
      Utility.swap(@binary_heap, root, index)
      swim(root)
    end
  end

end
