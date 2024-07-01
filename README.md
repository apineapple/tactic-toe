# Tactic-Toe

A block-pushing puzzle game developed by Ben Go ldstein/ttlieb. 

Use arrow keys to move the cursor, *c* to select/move blocks, and *x* to undo. 

The main objective of each level is to cover all "target" squares with a block. However, blocks can only move in the direction opposite its neighbors. For example, a block with a neighbor up and left can be pushed down and right, like so:

![](/data/tutorial1.1.png)
![](/data/tutorial1.2.png)
![](/data/tutorial1.3.png)
![](/data/tutorial1.4.png)

Or if a block has a neighbor to its left, it can be pushed to the right:

![](/data/tutorial2.1.png)
![](/data/tutorial2.2.png)
![](/data/tutorial2.3.png)
![](/data/tutorial2.4.png)

Furthermore, a block with neighbors on two adjaceny sides can be pushed diagonally:

![](/data/tutorial3.1.png)
![](/data/tutorial3.2.png)
![](/data/tutorial3.3.png)
![](/data/tutorial3.4.png)

And similarly for diagonal neighbors:

![](/data/tutorial4.1.png)
![](/data/tutorial4.2.png)
![](/data/tutorial4.3.png)
![](/data/tutorial4.4.png)

Once all target blocks are covered, the game will move to the next level. 

### How to Use:

To play online, click [here](https://apineapple.github.io/tactic-toe/).

To embed, download the .html and .js file.

To play on Pico8 software, downoload the .p8 file and place it in your carts folder.

### Modding: 

The map is 6x6 with coordinate (1,1) being the top left corner. 

Level data is stored the two arrays _b_ and _g_ at the top of the .p8 script. _b_ stores the locations for all blocks, while _g_ stores the locations for the targets. The ith entry of _b_ and _g_ contains the locations for the ith level of the game. 

To make your own levels, simply enter new level data into these arrays in the following fashion:

b{  
     {{x1, y1, [c]}, {x2, y2, [c]}, {x3, y3, [c]},...},  
}

g{  
     {{x1,y1}},   
}

Where x and y are the coordinates of each block/target, and [c] is an optional code to change the block type. Current supported block types are:

1: Stone block; can be pushed off, but cannot be moved

(More coming soon)

Remember to align the block data and goal data for each level!

### Tools:

* bfs_dfs .p8 files (requires pico-8 software). uses breadth- or depth-first search to find a solution to a level. Currently supports regular blocks and stone blocks. Note that bfs mode will take much longer and sometimes runs out of memory, while dfs mode will often find inefficient solutions. to use: open in p8, change the tables _b_ and _g_ as before (note they only support a single level, not a table of levels) and call search() with single argument 1 or 0 (see comments in code).
* priority bfs .p8 (requires pico-8 software). uses a modified bfs that calculates "best" direction to travel based on the initial layout. use single-level script as above. use multi-level script by entering each level and goal into tables _big_ and _bigg_ (note levels will not animate, only show times for each level). 
