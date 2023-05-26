# Work Log

## Hellen Luo

### 5/22/23

Worked on a slider class that can be used to adjust initial conditions of the molecular cloud or other setups of the star stages.

### 5/23/23

Finished the particle and molecular cloud classes (more features will be added but they are currently functional). The slider can now change the density of the molecular cloud.

### 5/24/23

Created the button class so that whenever it is pressed, all the set-up sliders can no longer be changed unless the button is pressed again. This is because a set of initial conditions can only correspond to one life cycle path.


## Tazrian Sazzad

### 5/22/23

Created initial star class with PShape and PImage for texturing.
Implemented 3D camera through PeasyCam library.
Created 3D sun object through setup() and draw() methods, with downloaded texture.

### 5/23/23

Wrote expand, contract, and rotate methods for star class.
Created initial core class and implemented instance of core in every star.
Created display for temperature and mass values of star object, wrote tick() method to update temp and mass using getter and setter methods.

### 5/24/23
Converted the 3D star and core classes to 2D, implemented light emission effect on particle class, albeit very laggy. FORGOT TO PUSH!

### 5/25/23
Created timeline slider that updates based on frameCount, resets whenever the density is reset.
Implemented gravitational attraction between particles and a "center of gravity," works for all densities and with the rate easily changeable.
Simulated growth of star core dependent on how many molecules collapse into the center.
Tried to fix super laggy light effect (not successful)
