thickness = 7.5;
hole_d = 20;
space =2.5;
screw_h = 7.5;

module base(){
    difference(){
    hull(){    
    cube([(3*thickness)+(4*space),hole_d+(2*space),thickness]);
    translate([-space,space,0])cube([(3*thickness)+(6*space),hole_d,thickness]);
    }
    union(){
    translate([1.5,(hole_d+(2*space))/2,0]) cylinder(d=3,h=thickness);    
    translate([(3*thickness)+(4*space)-1.5,(hole_d+(2*space))/2,0]) cylinder(d=3,h=thickness);    
    }}
    
    difference(){
    union(){
    //hinges
    translate([2*space,0,thickness]) cube([thickness,hole_d+(2*space),(hole_d+(2*space))/2]);
    translate([2*space,(hole_d/2)+space,hole_d]) rotate([0,90,0]) cylinder(d=hole_d+(2*space),h=thickness);
    translate([(2*space)+(2*thickness),0,thickness]) cube([thickness,hole_d+(2*space),(hole_d+(2*space))/2]);
    translate([2*space+(2*thickness),(hole_d/2)+space,hole_d]) rotate([0,90,0]) cylinder(d=hole_d+(2*space),h=thickness);
    }
    translate([0,(hole_d/2)+space,hole_d]) rotate([0,90,0]) cylinder(d=screw_h,h=(3*thickness)+(4*space));
}
}

module holder(){
    
    difference(){
    translate([(2*space),0,thickness+hole_d+(2*space)]) cube([3*thickness,hole_d+(2*space),hole_d]);
    translate([hole_d,(hole_d/2)+space,thickness+hole_d+(3*space)]){
        translate([0,-hole_d/2,0])cube([hole_d,hole_d,hole_d+space]);
        cylinder(d=hole_d,h=hole_d-space);
    }
    }
    difference(){
    union(){
    translate([(2*space)+(thickness)+0.25,0,(hole_d)]) cube([thickness-0.5,hole_d+(2*space),(hole_d/2)+(2*space)]);
    translate([2*space+(thickness)+0.25,(hole_d/2)+space,hole_d]) rotate([0,90,0]) cylinder(d=hole_d+(2*space),h=thickness-0.5);
    }
    translate([0,(hole_d/2)+space,hole_d]) rotate([0,90,0]) cylinder(d=screw_h,h=(3*thickness)+(4*space));
    }
    
}

base();
holder();