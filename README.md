PIPL --- (P)oint cloud registration (I)nspired by (P)hysics (L)aws framework

PIPL is a new concept for rigid point cloud registration. In contrast to existing approaches, it is based on the physics laws of classical mechanics, electrostatics and thermodynamics. The registration problem is solved by modelling point clouds as manyparticle systems. Forces acting on the individual particles concentrate on the respective centre of mass of the cloud. Due to the application of force, a successive movement of the point cloud to be registered occurs in the direction of the static reference point cloud until both are aligned. The point cloud motion is derived from the physical model of rigid-body transformation. Force fields represent the metric of the registration and can be freely modeled. The sample metrics presented in this thesis are inspired by both, Newton’s law of gravitation and Coulomb’s law of electrostatics. Accordingly, the position of the point clouds can be described not only by their spatial point distribution, but also by additional characteristics such as color or intensity values.
Furthermore, an efficient algorithm is presented which implements the new registration approach. The regularization of point cloud movements is based on the method of simulated annealing. In order to keep the runtime complexity as low as possible even with very high-resolution point clouds, the Monte-Carlo-method is used. Furthermore, the algorithm can be parallelized and can be executed on multi-core processing architectures such as graphics processor units.

Author: 	Philipp Jauer ( jauer@rob.uni-luebeck.de )
				Institute für Robotik und Kognitive Systeme
				- Universität zu Lübeck -

Date:       July 2016

Version:    0.1


To run the framework:

- compile the 'KernelMatching.cu' located in folder called 'cuda', using
    
    nvcc -ptx KernelMatching.cu

- the 'KernelMatching.ptx' file also has to be located in the 'cuda' folder

- run the 'example1.m' or 'example2.m' 


More detailed information can be found at:
https://ieeexplore.ieee.org/document/8352814
https://www.rob.uni-luebeck.de/index.php?id=336&L=1 