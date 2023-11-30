/*
    Copyright (C) 2021  Adam Schreiber <adam.schreiber@gmail.com>
    Copyright (C) 2023  Ondrej Novy <novy@ondrej.org>

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>.
*/

use <threads.scad>

cylinder_fn = 150;
mink_d = 2;
cover_h = 5;
hex_h = 19;
hex_bh = 2.5;
cmd_w = 18;
cmd_d = 2;
dia = 120;
hex_dia = 140;
pitch = 1.67;
basethd_tol = .5;
coverthd_tol = .3;

module ribbon_slot() {
    translate([mink_d/2, mink_d/2, 0])
        minkowski() {
            cube([ribbon_w-mink_d, ribbon_2d-mink_d,cover_h]);
            cylinder(d=mink_d, h=1, $fn=20);
        }
}

module cover() {
    difference(){
        metric_thread(dia-coverthd_tol, pitch,cover_h, leadin=2);
        translate([-ribbon_w/2, ribbon_pos1*dia/2, 0]) ribbon_slot();
        translate([-ribbon_w/2, .3*dia/2, 0]) ribbon_slot();
        translate([-ribbon_w/2, -.3*dia/2, 0]) ribbon_slot();

        rotate([0, 0, 90]) translate([-ribbon_w/2, -.75*dia/2, 0]) ribbon_slot();
        rotate([0, 0, -90]) translate([-ribbon_w/2, -.75*dia/2, 0]) ribbon_slot();
    }
}
