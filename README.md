# oh-so-fine
Dong Shin & Abhimannu Majumder
Team Name: oh. so. fine.

Proposal:
The project is mainly a first person view game, where the player can collect objects, the world is randomly generated, and so on. It will involve random spawning of rooms and hallways which the player can explore in addition to various "objects" which can be pretty random and may be collectable. The player would have a bow and arrow and can shoot. There wouldbe no lose condition, but it wins when it collects enought objects. Each "structure" or rooms/hallways would be a node, and each time the player passes through from one structure to another it will calculate node distances and despawn and spawn appropriate structures. It will also have a HUD, a menu, maybe music and sound effects.

  Things to do
- 3d Structures (Rooms, hallways, doors)
- Tree that contains structures
- First person view/movement
- Collision detection
- Textures
- Bow and Arrow
- Objects
- HUD/interface
- Menu
- music+sound

5/21/15 first day of project
The project will be on processing, and will be a first person view game with randomly generated map. The world will be composed of indoor environments like rooms, hallways, etc. The object is to collect certain objects.

First, files for interfaces and classes have been added with no codes right now.

5/25/15

Obi made Wall class, and Prism class for Door generation

5/25/15

Dong completed first person view, made basics for each classes/interfaces

5/31/15

Dong finished basic Tree/Node structure for random generation, fixed doors and created Hallway


Finished:
  First person view/movement
  Structure Tree
  
  
In progress:
  3d Structures
  Collision detection
  
  
Unstarted:
  Textures
  Bow/Arrow
  Objects
  HUD
  Menu
  Sounds


June 1 Demo
  "Demo1" branch: https://github.com/map32/oh-so-fine/tree/Demo1/Game The structures will spawn as the game starts, and as the player walks inside the structures and moves through doors it will be shown that it keeps generation rooms or hallways beyond doors. However there is no collision check so the structures will overlap very often.


6/7/15

Obi worked on basic collision detection for player with the walls.

Dong worked on properly orienting the structures so that they spawn properly with the doors.

Dong worked on Arrow class and its collision detection with the walls.
(** the 50000+ lines of code is due to the model file of arrow.)

June 8 Demo
The structures now spawn properly, however they may overlap due to it requireing n^2 check of locations. The arrow shoots but it does not go through doors.

Finished:
  First person view/movement
  Structure Tree
  3d Structures
  
In progress:
  Collision detection
  Bow/Arrow
  
  
Unstarted:
  Textures
  Objects
  HUD
  Menu
  Sounds

6/10/15

Dong created arrow class; the arrow has a hitbox, and blocks when it collides with a structure. However it needs to be fixed so that they can go through doors.

6/11/15

Obi worked on colliding function and strated working on HUD. 

6/12/15

Dong revamped the general code structure; the World class now contains most of the gameplay aspects such as players structures arrows etc. Only hud and Menu are not part of world. Also he worked more on general collision detection of players and others through hitboxes.

6/15/15

Obi worked more on HUD and finished Menu and HUD classes. Dong fixed arrow curving, created Object classes which aretargets of the arrows and players can gain points from it. When the player runs out of arrows or 
