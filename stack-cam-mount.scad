$fs = 0.1/1;
$fa = 0.1/1;

stackSize = 30.5;
stackScrewRadius = 1.5;
stackScrewClearance = 1.5;
bottomSize = stackSize + stackScrewRadius*2 + stackScrewClearance*2;
bottomThickness = 2;

camSize = 19;

camMountThickness = 2;
camScrewRadius = 1;
camScrewHeight = 15;

difference() {
	hull() {
		fourHoles(bottomThickness, stackScrewRadius+stackScrewClearance, stackSize);
	}
	translate([stackScrewClearance, stackScrewClearance, -0.1]) {
		fourHoles(bottomThickness+0.2, stackScrewRadius, stackSize);
	}
}
translate([0, bottomSize/2-camSize/2-camMountThickness, bottomThickness]) {
	side();
}
translate([0, bottomSize/2+camSize/2, bottomThickness]) {
	side();
}

module side() {
	difference() {
		translate([bottomSize/2, 0, camMountThickness]) {
			resize([0, 0, camScrewHeight*4-camMountThickness*2]) {
				rotate([-90, 0, 0]) {
					cylinder(camMountThickness, bottomSize/2, bottomSize/2);
				}
			}
		}
		translate([0, -0.1, camMountThickness-camScrewHeight*2-0.1]) {
			cube([bottomSize, camMountThickness+0.2, camScrewHeight*2+0.1]);
		}
		translate([bottomSize/2, -0.1, camScrewHeight]) {
			rotate([-90, 0, 0]) {
				cylinder(camMountThickness+0.2, camScrewRadius, camScrewRadius);
			}
		}
	}
	difference() {
		translate([0, -camMountThickness, 0]) {
			cube([bottomSize, camMountThickness*3, camMountThickness]);
		}
		translate([-0.10, -camMountThickness, camMountThickness]) {
			rotate([0, 90, 0]) {
				cylinder(bottomSize+0.2, camMountThickness, camMountThickness);
			}
		}
		translate([-0.1, camMountThickness*2, camMountThickness]) {
			rotate([0, 90, 0]) {
				cylinder(bottomSize+0.2, camMountThickness, camMountThickness);
			}
		}
	}
}

module fourHoles(height, radius, distance) {
	for (i = [-1 : 2 : 1]) {
		for (j = [-1 : 2 : 1]) {
			translate([radius + distance/2 + i * distance/2, radius + distance/2 + j * distance/2, 0]) {
				cylinder(height, radius, radius);
			}
		}
	}
}
