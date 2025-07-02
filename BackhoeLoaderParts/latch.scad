eps = 0.01;

module latch_1( h, d1, d2) {
    r1 = d1 / 2;
    r2 = d2 / 2;

    d = sqrt( r1 * r1 - r2 * r2 );
    d_2 = d / 2;
    h1 = 0.5;
    R = ( d_2 * d_2  + h1 * h1 ) / ( 2 * h1 );
    
    module aux() {
        translate( [ R - h1, 0, 0 ] )
            difference() {
                cylinder(h = h, r1 = R, r2 = R, center = true, $fn=100);
            
                translate( [ h1, 0 ,0 ] )
                    cube( [ 2 * R, 2 * R, h + eps ], center = true );
            }
    }
 
    module aux_2() {
        difference() {
            union() {
                translate( [ r2 + eps, d_2, 0 ] )
                    aux();
                
                translate( [ -r2 - eps, d_2, 0 ] )
                    rotate( [ 0, 0, 180 ] )
                        aux();
            }
            
            cylinder(h = h + eps, r1 = r2, r2 = r2, center = true, $fn=100);
        }
    }

    union() {
        difference() {
            cylinder(h = h, r1 = r1, r2 = r1, center = true, $fn=100);
            
            cylinder(h = h + eps, r1 = r2, r2 = r2, center = true, $fn=100);
            translate( [ 0, r1 / 2, 0 ] )
                cube( [ 2 * r2, r1, h + eps ],center = true);
        }
    
        aux_2();
    }
}