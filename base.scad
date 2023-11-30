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

include <common.scad>

module cmd_slot() {
    translate([-cmd_w/2, -cmd_d/2, 0]) {
        minkowski() {
            cube([cmd_w-mink_d, cmd_d, hex_bh+2]);
            sphere(d=mink_d, $fn=20);
        }
    }
}

difference() {
    cylinder(d=1.2*dia, h=hex_h, $fn=6);
    translate([0, 0, hex_h-1.5*cover_h]) metric_thread(dia+basethd_tol, pitch, 1.5*cover_h, internal=true, leadin=1);
    translate([0, 0, hex_bh]) cylinder(d=dia+basethd_tol-1.082532*pitch, h=hex_h-hex_bh-1.5*cover_h, $fn=cylinder_fn);
    translate([cmd_w, 0, 0]) cmd_slot();
    translate([-cmd_w, 0, 0]) cmd_slot();
}
