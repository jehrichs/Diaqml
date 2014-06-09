/*
 * Diaqml - [Proof of Concept] Diagram editor
 * Copyright (C) 2014  Joerg Ehrichs
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

import QtQuick 2.2

Item {
     id: root

     property real tailX
     property real tailY
     property real headX
     property real headY

     property item start
     property item end

     //Component.onCompleted: console.log("Link onCompleted", "tailX", tailX, "tailY", tailY, "headX", headX, "headY", headY)
     //onTailXChanged: console.log("Link", "tailX", tailX)
     //onHeadXChanged: console.log("Link", "headX", headX)
 }
