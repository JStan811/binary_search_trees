# binary_search_trees

This repo is for the Binary Search Trees project from [The Odin Project](https://www.theodinproject.com/paths/full-stack-ruby-on-rails/courses/ruby-programming/lessons/binary-search-trees).

Thoughts:
This was probably the most difficult project yet in TOP. I struggled to grasp the concept of recursion, especially figuring out what the base case is and what each method should be passing to itself. I do believe I have a better grasp of it now after completing the project. One of the most challenging problems was the #delete method. I ended up with a monster of a loop chain because there were so many conditions I had to account for. I wonder if using recursion for this method may have been easier. Also, #height and #depth were difficult because I couldn't figure out how to tell the program to recursively traverse through every node and only update the return value (height/depth) if a certain condition was met. IE only update height if the new height is greater than the already set height.

Anyways, I'm pretty happy with how this turned out. It certainly has room for improvement but in the interest of time I'm going to move on.

Most recent commit:

Finished #balance and #rebalance methods. For #balance, I had to get help from the web. I just couldn't get it to work with my current methods. I ended up replacing my #height with one from geeksforgeeks.org and then using some of their #balance method logic in mine as well. #rebalance was much easier - I just grabbed the inorder array from the unbalanced tree then created a new tree using that. I'm not sure if its right though since TOP recommends grabbing the level-order array instead. Finally I created a driver script to test my work in main.rb. In the end, I'm happy with the result of this project. It took me about 8-9 hours of work in total. Huzzah...

Jake
