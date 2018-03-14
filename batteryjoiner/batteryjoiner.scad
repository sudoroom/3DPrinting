THICKNESS=3.5; // mm
WALLTHICK=5; // thickness of walls around holes
SHAFTWIDTH=9; // 8.8;
SHAFTHEIGHT=1.3; // exposed part of shaft when screwed down
PLUSSPACING=41.2; // spacing between screws on two-post (+) side
HANDLEWIDTH=14; // 13.1;
SLOTLENGTH=15;
TERMDISTANCE=129.3;
ABIT=0.1; // for differences, which should be a bit larger
$fn=50;

difference() {
  hull() {
    translate([0,PLUSSPACING/2,0]) cylinder(r=HANDLEWIDTH/2+WALLTHICK,h=THICKNESS);
    translate([0,-1*PLUSSPACING/2,0]) cylinder(r=HANDLEWIDTH/2+WALLTHICK,h=THICKNESS);
    translate([TERMDISTANCE,0,0]) cylinder(r=HANDLEWIDTH/2+WALLTHICK,h=THICKNESS);
  }
  translate([0,PLUSSPACING/2,0]) screwhole(1);
  translate([0,-1*PLUSSPACING/2,0]) screwhole(1);
  translate([TERMDISTANCE,0,0]) screwhole(-1);
}

module screwhole(direction) { // direction is 1 or -1
  translate([0,0,-0.5*ABIT]) { // move subtracted part down so it's outside
    hull() { // handle path
      translate([SLOTLENGTH*direction,0,0]) cylinder(r=HANDLEWIDTH/2,h=THICKNESS+ABIT); // handle hole for entry
      translate([0,0,SHAFTHEIGHT]) cylinder(r=HANDLEWIDTH/2,h=THICKNESS); // handle hole when screwed down
    }
    hull() { // shaft path
      translate([SLOTLENGTH*direction,0,0]) cylinder(r=SHAFTWIDTH/2,h=THICKNESS+ABIT);
      translate([0,0,0]) cylinder(r=SHAFTWIDTH/2,h=THICKNESS+ABIT);
    }
  }
}
