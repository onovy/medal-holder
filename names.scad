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

module cover_name(text) {
    metric_thread(dia-coverthd_tol, pitch,cover_h, leadin=2);
    color([0, 0, 1]) translate([0, 0, cover_h]) linear_extrude(1) text(text, font = "Purisa:style=Bold", halign="center", valign="center", size=20);
}

cover_name("Name");
