use <latch.scad>

eps = 0.01;

module shape( l , w, h ) {
    union() {
        translate( [ - l / 2, 0 , 0 ] )
            cylinder(h = h, r1 = w / 2, r2 = w / 2, center = true, $fn=100);
        
        translate( [ + l / 2, 0 , 0 ] )
            cylinder(h = h, r1 = w / 2, r2 = w / 2, center = true, $fn=100);
        
        cube( [ l, w, h ], center = true );
    }
}

// this part is not reused, so to make it easier I've just hardcoded
// values related to this opening
module latch_opening() {
    r = 6;
    tmpR = r * sqrt( 2 ) ;
        rotate( [ -90, 0, 0 ] )
            rotate( [ 0, 0, 45 ] )
                cylinder( h = tmpR, r1 = tmpR, r2 = 0, $fn=4);
}

module latch_2( l, w, h ) {
    difference() {
        shape( l, w, h );
        
        shape( l - 4, w - 4, h + eps );
        
        
        translate( [ 0, -7, 6 ] )
            latch_opening();
        
        translate( [ 0, -7, -6 ] )
            latch_opening();
    }
}

module lever() {
    union() {
        l = 100;
        w = 6;
        h = 6;
        cube( [ l, w, h ], center = true );
        
        l2 = 8;
        alfa = 45;
        translate( [ l / 2, - w / 2 , - h / 2 ] )
            rotate( [ 0, 0, alfa ] )
                cube( [ l2, w, h ], center = false );
        
        l3 = 15;
        beta = atan( 2.5 / l3 );
        w3 = w * cos( beta );
        translate( [ - l / 2, w3 / 2 , - h / 2 ] )
            rotate( [ 0, 0, 180 + beta ] )
                cube( [ l3, w3, h ], center = false );
        
        d1 = 8;
        d2 = 3;
        translate( [ - l / 2 - l3 * cos( beta ) - d2 / 2, -w3 /2 , 0 ] )
            latch_1( 6.98, d1, d2 );
            
        translate( [ l / 2 + l2 * cos( alfa ) + 3.5, l2 * sin( alfa ) , 0 ] )
            latch_2( 8, 8, 10 );
    }
}


lever();