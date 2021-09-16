# frozen_string_literal: true

module BinarySearchTrees
  # rubocop: disable Metrics/ClassLength
  # object representing a Binary Search Tree
  class Tree
    attr_reader :root

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

    # rubocop: disable Metrics/MethodLength
    # rubocop: disable Metrics/AbcSize
    # rubocop: disable Metrics/PerceivedComplexity
    # rubocop: disable Metrics/CyclomaticComplexity
    def insert(value)
      unless find(value).nil?
        puts 'Value already exists in tree.'
        return
      end

      new_node = Node.new(value)
      current_node = @root
      until (current_node.left_child.nil? && value < current_node.data) || (current_node.right_child.nil? && value > current_node.data)
        current_node = if value < current_node.data && !current_node.left_child.nil?
                         current_node.left_child
                       else
                         current_node.right_child
                       end
      end

      if value < current_node.data
        current_node.left_child = new_node
      else
        current_node.right_child = new_node
      end
      new_node
    end
    # rubocop: enable Metrics/MethodLength
    # rubocop: enable Metrics/AbcSize
    # rubocop: enable Metrics/PerceivedComplexity
    # rubocop: enable Metrics/CyclomaticComplexity

    # rubocop: disable Metrics/MethodLength
    # rubocop: disable Metrics/AbcSize
    # rubocop: disable Metrics/PerceivedComplexity
    # rubocop: disable Metrics/CyclomaticComplexity
    def delete(value)
      if find(value).nil?
        puts 'Value does not exist in tree.'
        return
      end

      current_node = @root
      previous_node = nil
      until current_node.data == value
        previous_node = current_node
        current_node = if value < current_node.data && !current_node.left_child.nil?
                         current_node.left_child
                       else
                         current_node.right_child
                       end
      end

      # case where node to be deleted is a leaf
      if current_node.left_child.nil? && current_node.right_child.nil?
        if previous_node.left_child == current_node
          previous_node.left_child = nil
        else
          previous_node.right_child = nil
        end
      # case where node to be deleted has only one child
      elsif current_node.left_child.nil?
        if previous_node.left_child == current_node
          previous_node.left_child = current_node.right_child
        else
          previous_node.right_child = current_node.right_child
        end
      elsif current_node.right_child.nil?
        if previous_node.left_child == current_node
          previous_node.left_child = current_node.left_child
        else
          previous_node.right_child = current_node.left_child
        end
      # case where node to be deleted has two children
      else
        next_highest_node = current_node.right_child
        next_highest_node_previous_node = current_node
        until next_highest_node.left_child.nil?
          next_highest_node_previous_node = next_highest_node
          next_highest_node = next_highest_node.left_child
        end
        # covers case where the next highest node has a right child
        if !(next_highest_node.right_child.nil?)
          next_highest_node_previous_node.left_child = next_highest_node.right_child
        else
          next_highest_node_previous_node.left_child = nil
        end
        next_highest_node.left_child = current_node.left_child
        next_highest_node.right_child = current_node.right_child unless current_node.right_child == next_highest_nodel
        if current_node == @root
          @root = next_highest_node
        elsif previous_node.left_child == current_node
          previous_node.left_child = next_highest_node
        else
          previous_node.right_child = next_highest_node
        end
      end
      current_node
    end
    # rubocop: enable Metrics/MethodLength
    # rubocop: enable Metrics/AbcSize
    # rubocop: enable Metrics/PerceivedComplexity
    # rubocop: enable Metrics/CyclomaticComplexity

    def find(value, root = @root)
      return root if root.nil? || root.data == value

      if value < root.data
        find(value, root.left_child)
      else
        find(value, root.right_child)
      end
    end

    # rubocop: disable Metrics/MethodLength
    # rubocop: disable Metrics/AbcSize
    def level_order_using_iteration
      # guard clause in case tree is empty
      return if @root.nil?

      result_array = []
      queue = []

      current_node = @root
      result_array << current_node.data
      queue << current_node.left_child unless current_node.left_child.nil?
      queue << current_node.right_child unless current_node.right_child.nil?

      until queue.empty?
        current_node = queue.shift
        result_array << current_node.data
        queue << current_node.left_child unless current_node.left_child.nil?
        queue << current_node.right_child unless current_node.right_child.nil?
      end

      result_array
    end
    # rubocop: enable Metrics/MethodLength
    # rubocop: enable Metrics/AbcSize

    def level_order_using_recursion(root = @root, result_array = [], queue = [])
      # base case
      return result_array if root.nil?

      result_array << root.data
      queue << root.left_child unless root.left_child.nil?
      queue << root.right_child unless root.right_child.nil?
      root = queue.shift
      level_order_using_recursion(root, result_array, queue)
    end

    def preorder(root = @root, result_array = [])
      # base case
      return result_array if root.nil?

      result_array << root.data
      preorder(root.left_child, result_array)
      preorder(root.right_child, result_array)
    end

    def inorder(root = @root, result_array = [])
      # base case
      return result_array if root.nil?

      inorder(root.left_child, result_array)
      result_array << root.data
      inorder(root.right_child, result_array)
    end

    def postorder(root = @root, result_array = [])
      # base case
      return result_array if root.nil?

      postorder(root.left_child, result_array)
      postorder(root.right_child, result_array)
      result_array << root.data
    end

    # this #height I grabbed from geeksforgeeks.org
    def height(node)
      # base condition when binary tree is empty
      return 0 if node.nil?

      [height(node.left_child), height(node.right_child)].max + 1
    end

    # this was my original attempt at height. It worked at first but then
    # caused issues when I tried to use it with #balanced?
    def height_old(node, level_change_count = 0, height = 0)
      # base case
      return height if node.data == inorder.last

      height = level_change_count if height < level_change_count

      height = height(node.left_child, level_change_count + 1, height) unless node.left_child.nil?
      height = height(node.right_child, level_change_count + 1, height) unless node.right_child.nil?
      height
    end

    def depth(node, root = @root, level_change_count = 0, depth = 0)
      # base case
      return depth if node == root

      depth = level_change_count + 1 if root.left_child == node || root.right_child == node

      depth = depth(node, root.left_child, level_change_count + 1, depth) unless root.left_child.nil?
      depth = depth(node, root.right_child, level_change_count + 1, depth) unless root.right_child.nil?
      depth
    end

    # I adopted some of the logic in this from geeksforgeeks.org as I have just
    # spent too much time on this
    def balanced?(root = @root)
      return true if root.nil?

      left_height = height(root.left_child)
      right_height = height(root.right_child)
      if (left_height - right_height).abs <= 1 && balanced?(root.left_child) == true && balanced?(root.right_child) == true
        return true
      end

      false
    end

    def rebalance
      # guard clause in case tree is already balanced
      return self if balanced?

      array_to_build_with = inorder
      @root = build_tree(array_to_build_with, 0, array_to_build_with.length - 1)
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
  # rubocop: enable Metrics/ClassLength
end
