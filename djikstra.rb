require_relative 'graph.rb'
require_relative 'min_priority_queue.rb'

# implementations using priority queue
# every call to new source resets data
# uses maps over arrays to allow any representation of a vertex

class Djikstra
  attr_accessor :dist, :prev
  def initialize(graph)
    @graph = graph
    @prev = {}
    @dist = {}
  end

  def source(vertex)
    set_data_structures
    @min_pq.insert(WeightedVertex.new(vertex,0))
    @dist[vertex] = 0
    set_paths
  end

  private

  def set_data_structures
    @graph.vertices.each do |vertex|
      @prev[vertex] = -1
      @dist[vertex] = Float::INFINITY
    end
    @min_pq = MinPriorityQueue.new
  end

  def set_paths
    while !@min_pq.empty?
      # ensures processing closest neighbor
      u = @min_pq.delete_min.vertex
      # each neighbor is a Neighbor Node as defined in Graph
      neighbor_list = @graph.neighbors(u)
      neighbor_node = neighbor_list.head
      # check all neighbors and update data structures if distance to source is shorter
      while neighbor_node
        v = neighbor_node.vertex
        weight = neighbor_node.distance
        new_distance = @dist[u] + weight
        if new_distance < @dist[v]
          @prev[v] = u
          @dist[v] = new_distance
          @min_pq.insert(WeightedVertex.new(v, new_distance))
        end
        neighbor_node = neighbor_node.next
      end
    end
  end

end

# class to manage priority for queue
class WeightedVertex
  include Comparable
  attr_reader :vertex, :weight

  def initialize(vertex, weight)
    @vertex = vertex
    @weight = weight
  end

  def <=>(object)
    self.weight <=> object.weight
  end
end
