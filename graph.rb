require_relative 'linked_list.rb'
# an undirected, weighted graph implementation
# represented by an adjacency list
# the traditional array is replaced with a map to simplify using class vertex
# edges are added by an array containing [vertex, neighbor vertex, weight]

class Graph
  def initialize(vertices, edges)
    @adj_list = {}
    vertices.each do |vertex|
      add_vertex(vertex)
    end
    edges.each do |edge_array|
      add_edge(edge_array)
    end
  end

  def add_vertex(v)
    @adj_list[v] = LinkedList.new
  end

  def add_edge(edge_array)
    v1 = edge_array[0]
    v2 = edge_array[1]
    distance = edge_array[2]
    node1 = NeighborNode.new(v1, distance)
    node2 = NeighborNode.new(v2, distance)
    @adj_list[v1].push_front(node2)
    @adj_list[v2].push_front(node1)
  end

  def neighbors(vertex)
    @adj_list[vertex]
  end

  def vertices
    @adj_list.keys
  end

  def any_vertex
    @adj_list.keys.sample
  end
end

class Vertex
  attr_accessor :key, :value
  def initialize(k, v)
    @key = k
    @value = v
  end
end

class NeighborNode < Node
  attr_accessor :vertex, :distance
  def initialize(vertex, distance)
    @vertex = vertex
    @distance = distance
    super
  end
end
