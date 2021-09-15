# frozen_string_literal: true

module BinarySearchTrees
  # objects representing a node in a BST
  class Node
    include Comparable
    attr_accessor :data, :left_child, :right_child

    def <=>(other)
      data <=> other.data
    end

    def initialize(data = nil)
      @data = data
      @left_child = nil
      @right_child = nil
    end
  end
end
