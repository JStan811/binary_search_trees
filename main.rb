# frozen_string_literal: true

require_relative 'node'
require_relative 'tree'

array_of_random_numbers = (Array.new(15) { rand(1..100) })

my_tree = BinarySearchTrees::Tree.new(array_of_random_numbers)

puts 'Original Tree'
my_tree.pretty_print
puts "Balanced? #{my_tree.balanced?}"
puts "Level-order: #{my_tree.level_order_using_recursion}"
puts "Preorder: #{my_tree.preorder}"
puts "Postorder: #{my_tree.postorder}"
puts "Inorder: #{my_tree.inorder}"

puts ''
puts 'Unbalance'
my_tree.insert(105)
my_tree.insert(101)
my_tree.insert(110)
my_tree.insert(1000)
my_tree.pretty_print
puts "Balanced? #{my_tree.balanced?}"

puts ''
puts 'Rebalance'
my_tree.rebalance
my_tree.pretty_print
puts "Balanced? #{my_tree.balanced?}"
puts "Level-order: #{my_tree.level_order_using_recursion}"
puts "Preorder: #{my_tree.preorder}"
puts "Postorder: #{my_tree.postorder}"
puts "Inorder: #{my_tree.inorder}"
