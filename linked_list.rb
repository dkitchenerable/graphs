require_relative 'node.rb'

class LinkedList
  attr_accessor :head, :tail, :size

  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end

  def push_front(node)
    second_node = @head
    @head = node
    @head.next = second_node
    @size += 1
    update_tail
  end

  def pop_front
    node = @head
    @head = node.next
    @size -= 1
    update_tail
    node
  end

  def empty?
    @head.nil?
  end

  def search(key)
    node = @head
    while node != nil
      return node.value if node.key == key
      node = node.next
    end
    return nil
  end

  def push_back(node)
    @tail.next = node if @tail
    @tail = node
    @size += 1
    @head = @tail if @size == 1
  end

  def pop_back
    back_node = @tail
    @size -= 1
    if @size == 1
      @tail = @head
      @head.next = nil
    elsif @size == 0
      @head = nil
      @tail = nil
    else
      node = @head
      while node.next != back_node
        node = node.next
      end
      @tail = node
      node.next = nil
    end
    back_node
  end


  private
 
  def update_tail
    @tail = @head.next if @size == 2
    @tail = @head if (@head == nil || @head.next == nil)
  end
end
