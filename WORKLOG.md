# Work Log

## Hellen Luo

### 5/22/23

Worked on a slider class that can be used to adjust initial conditions of the molecular cloud or other setups of the star stages.

### 5/23/23

Finished the particle and molecular cloud classes (more features will be added but they are currently functional). The slider can now change the density of the molecular cloud.

### 5/24/23

Created the button class so that whenever it is pressed, all the set-up sliders can no longer be changed unless the button is pressed again. This is because a set of initial conditions can only correspond to one life cycle path.

### 5/25/23

Created the stats class to display the numerical information about the characteristics of the star (which will update automatically once the simulation begins). Also added on to the button class for the "start simulation" button.

### 5/26/23

Changed up the display of stats and the star so they are true to real science. Began working on simulating the red giant branch.

### 5/27/23

Gathered astronomical formulas to calculate the characteristics of the star (luminosity, radius, temperature, etc.) and updated them in the Stats class.

### 5/28/23

Added color to the star so the color changes as the star grows bigger. However, the color is uniform for all densities.

### 5/29/23

Added different colors for different initial densities based on stellar classifications (OBAGBKM, meaning that different temperatures and masses indicate different colors the star appears to be).

### 5/31/23

Began creating the luminosity graph, which constantly updates and plots the luminosity as the star life cycle progresses.

### 6/1/23

Fixed the luminosity graph so that it starts and ends at the right place. Additionally, the scale of the luminosity graph automatically updates if the previous scale is exceeded.

Fixed the setup button so that it resets the simulation even if the molecular cloud density is unchanged (previously, resetting only works if the user manually changes the molecular cloud density).

### 6/4/23
Added colors to the main sequence stage so that the vibrance of the color decreases (becomes more pale) as the star fuses more atoms.

### 6/5/23
Created a new button to display the information about the current stage. Added a method to the Stats class that will show the information when the button is clicked.

### 6/6/23
Fixed glitches in the reset button and other technical issues in the stats class.

### 6/7/23 - 6/8/23
Changed the luminosity graph so it always shows (removed the button). Added an intro slide show to the simulation.

### 6/9/23 - 6/10/23
Fixed the learn more button so the information displayed updates automatically depending on the stage the star is on. Added the group info and overview in the README. Wrote the supernova class and its corresponding methods in Particle (not implemented in draw yet).

### 6/11/23
Beginning to finalize the stages. Finished the red giant phase. Wrote the instructions in the README file and remade the UML diagram for final submission.


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

### 5/26/23
Fixed light effect lagginess, created basic glow effect for the star using HSB colorMode, started basic circular motion of particles in protostar phase using rotate.

### 5/31/23
Saturation of glow method changes based on luminosity values, different densities now result in different hues(colors).

### 6/1/23
Transition from protostar to main sequence star phase happens when all particles absorbed by center of gravity. Centripetal motion of particles in stellar nebula phase works as intended now.

### 6/2/23
Started work on the red giant and red super giant animation methods.

### 6/6/23
Finished red giant and red super giant methods, implemented nebula class and created the first version of stellar nebula.

### 6/8/23
Created supernova animation and black hole animation.

#### 6/11/23
Fixed issues with timing of transition between phases, fixed stellar nebula.
