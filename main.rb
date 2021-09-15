# frozen_string_literal: true

require_relative 'node'
require_relative 'tree'

array_of_random_numbers = (Array.new(15) { rand(1..100) })

p array_of_random_numbers

my_tree = BinarySearchTrees::Tree.new(array_of_random_numbers)

puts my_tree

p my_tree

my_tree.pretty_print
