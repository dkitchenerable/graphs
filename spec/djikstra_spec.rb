require_relative '../graph.rb'
require_relative '../djikstra.rb'

describe Djikstra do
  before(:each) do
    # create vertices
    @v1 = Vertex.new("A",1)
    @v2 = Vertex.new("B",2)
    @v3 = Vertex.new("C",3)
    @v4 = Vertex.new("D",4)
    e1 = [@v1,@v2,1]
    e2 = [@v2,@v3,3]
    e3 = [@v3,@v4,4]
    e4 = [@v1,@v4,10]
    graph = Graph.new([@v1,@v2,@v3,@v4], [e1,e2,e3,e4])
    @djikstra = Djikstra.new(graph)
  end

  context "shortest path calculations" do
    it "distance map contains shorted distances" do
      @djikstra.source(@v4)
      expect(@djikstra.dist[@v1]).to eq(8)
      expect(@djikstra.dist[@v2]).to eq(7)
      expect(@djikstra.dist[@v3]).to eq(4)
      expect(@djikstra.dist[@v4]).to eq(0)
    end
  end

  context "previous calculations" do
    it "previous map contains correct vertexes" do
      @djikstra.source(@v4)
      expect(@djikstra.prev[@v1]).to eq(@v2)
      expect(@djikstra.prev[@v2]).to eq(@v3)
      expect(@djikstra.prev[@v3]).to eq(@v4)
      expect(@djikstra.prev[@v4]).to eq(-1)
    end
  end
  
end
