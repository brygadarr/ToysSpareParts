use <latch.scad>

eps = 0.01;

module actuator( l ) {
    d1 = 9;
    d2 = 4;
    r1 = d1 / 2;
    r2 = d2 / 2;

    la = l - 2 * r2;
    l1 = 0.35 * la;
    l2 = 0.65 * la;
    
    c1 = l1 / 2 + r2 + eps;
    c2 = l1 + l2 / 2 + r2 - eps;

    union() {
        latch_1( 6.78, d1, d2 );

        translate( [ c1, 0, 0 ] )
            rotate( [ 0, 90, 0 ] )
                cylinder(h = l1, r1 = 5.5 / 2, r2 = 5.5 / 2, center = true, $fn=100);

        translate( [ c2, 0, 0 ] )
            rotate( [ 0, 90, 0 ] )
                cylinder(h = l2, r1 = 7 / 2, r2 = 7 / 2, center = true, $fn=100);

        translate( [ l, 0 , 0 ] )
            latch_1( 8.48, d1, d2 );
    }
}

actuator( 80 );
