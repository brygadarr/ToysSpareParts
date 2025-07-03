use <lever.scad>
use <actuator.scad>

eps = 0.2;

translate( [ 0, 0, 8.48 / 2 ] )
    actuator( 80 );

translate( [ 0, 20, 8.48 / 2 ] )
    actuator( 80 );

translate( [ 0, -20, 5 ] )    
    lever();