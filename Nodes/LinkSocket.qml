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

import "node_handling.js" as Node

Rectangle {
    id: socket

    width: 5
    height: 5

    color: "black"
    border.color: "black"
    border.width: 3

    property bool mouseOver: false
    opacity: mouseOver ? 1 : parent.hoverFrameEnabled

    property list<Item> links

    onXChanged: {
        console.log("x changed: ", links.length)
        for (var i = 0; i < links.length; i++) {
            links[i].updateCanvas
        }
    }
    onYChanged: {
        for (var i = 0; i < links.length; i++) {
            links[i].updateCanvas
        }
    }

    MouseArea {
        id: socketArea
        anchors.fill: parent
        hoverEnabled: true

        onEntered: { if(socket.parent.dynamic) {
                        parent.mouseOver=true;
                        parent.color = "red";
                        parent.width=10;
                        parent.height=10;
                    }
        }
        onExited: { parent.mouseOver=false; parent.color = "black"; parent.width=5;parent.height=5;}

        onClicked: { Node.drawLink(socket); }

        onPositionChanged: {
            if(Node.curLink) {
                var tPos = socket.mapToItem(Node.documentArea, socket.width/2, socket.height/2);
                Node.curLink.updateCanvas(tPos);
            }
        }
    }
}
