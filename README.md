![alt text](https://ganausi.com/image/wfcscreenshoot.png)
**In the GridMap node of the the_game scene, there is a script called `terrain.gd`. Set `Update` to true to update the terrain**

The script is written in Godot and designed to procedurally generate terrain by assigning a specific 3D model (created in Blender) to each tile in a grid, following a set of predefined rules. The rules are stored in a dictionary, where each entry consists of:
1. A unique identifier (ID) for a model/mesh.
2. A pattern representing possible neighboring tile configurations.
   
The neighbor configuration for each tile is represented as a 3x3 array (including the current tile) using binary values:
1. 1 indicates the presence of a neighbor.
2. 0 indicates the absence of a neighbor.
   
For every tile in the grid:
1. The script scans the surrounding tiles to generate an array that describes the neighbor configuration.
2. This array is then matched against the patterns stored in the dictionary to find a corresponding model/mesh ID and, optionally, its rotation.
3. The selected model/mesh is assigned to the tile in the grid.
   
This method is inspired by the Wave Function Collapse algorithm, where each tile in the grid is assigned a model based on its neighboring tiles configurations. The algorithm scans the neighbors (horizontal, vertical, and diagonal) and generates an array representing the neighbors relationships. It then looks up this array in a dictionary to find the corresponding model and any necessary rotations, assigning the model to the tile in the grid. This process ensures that each tile follows specific adjacency rules, similar to how the WFC algorithm enforces constraints in its tile selection.
