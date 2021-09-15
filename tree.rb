# frozen_string_literal: true

module BinarySearchTrees
  # object representing a Binary Search Tree
  class Tree
    def initialize(array = [])
      # sort and remove duplicates
      @array = array.sort.uniq
      @root = build_tree(@array, 0, @array.length - 1)
    end

    def pretty_print(node = @root, prefix = '', is_left = true)
      pretty_print(node.right_child, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right_child
      puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
      pretty_print(node.left_child, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left_child
    end

    def insert(value)
    end

    def delete(value)
    end

    private

    def build_tree(array, start_index, end_index)
      # base case
      return nil if start_index > end_index

      middle_index = (end_index + start_index) / 2

      root = Node.new(array[middle_index])
      root.left_child = build_tree(array, start_index, middle_index - 1)
      root.right_child = build_tree(array, middle_index + 1, end_index)

      root
    end
  end
end
