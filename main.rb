# frozen_string_literal: true

require_relative 'node'
require_relative 'tree'

# array_of_random_numbers = (Array.new(15) { rand(1..100) })

array_of_random_numbers = [48, 84, 5, 95, 30, 66, 8, 26, 75, 17, 23, 79, 22, 80, 56]
# array_simple = [1, 2, 3, 4, 5, 6, 7]

my_tree = BinarySearchTrees::Tree.new(array_of_random_numbers)
# my_tree_simple = BinarySearchTrees::Tree.new(array_simple)
# my_tree_empty = BinarySearchTrees::Tree.new

# my_tree_simple.pretty_print

# puts my_tree_simple.height(my_tree_simple.find(7))

# my_tree_simple.insert(3.5)

# my_tree_simple.pretty_print

# puts my_tree_simple.height_using_recursion(my_tree_simple.find(4))

my_tree.insert(45)

my_tree.insert(44)

my_tree.pretty_print

puts my_tree.height(my_tree.find(48))
