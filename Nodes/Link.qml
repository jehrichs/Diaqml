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

Item {
    id: root

    property LinkSocket tail
    property LinkSocket head

    property bool followMouseMode: false
    property bool acceptMouseInput: true

    onTailChanged: { updateCanvas() }
    onHeadChanged: { updateCanvas() }

    function updateCanvas(mouse) {
        if(mouse)
            Node.mouseLinkCursorArea = mouse;
        else
            Node.mouseLinkCursorArea = null;

        canvas.requestPaint()
    }

    Canvas {
        id: canvas
        anchors.fill: parent
        antialiasing: true
        renderStrategy: Canvas.Threaded;

        onPaint: {
            var ctx = getContext("2d");
            ctx.reset();
            ctx.save();
            ctx.clearRect(0,0,width, height);

            //ctx.strokeStyle = node.nborderColor;
            //ctx.lineWidth = node.nborderWidth;
            ctx.lineWidth = 2
            ctx.strokeStyle = "#000000"
            ctx.lineJoin = "miter"
            //ctx.fillStyle = node.nbgColor;
            //ctx.globalAlpha = node.nalpha;

            ctx.beginPath();
            var tPos = tail.mapToItem(canvas, 0, 0);
            ctx.moveTo(tPos.x+tail.width/2+tail.width/2, tPos.y+tail.height/2+tail.height/2);

            if (followMouseMode) {
                if(Node.mouseLinkCursorArea) {
                    ctx.lineTo(Node.mouseLinkCursorArea.x, Node.mouseLinkCursorArea.y)
                }
                else {
                    ctx.lineTo(linkMouseArea.mouseX, linkMouseArea.mouseY)
                }
            }
            else {
                var hPos = head.mapToItem(canvas, 0, 0);
                //console.log("head",hPos.x,"w",head.width,"h",head.height)
                ctx.lineTo(hPos.x+head.width/2, hPos.y+head.height/2)
            }
            ctx.closePath();

            ctx.stroke();

            ctx.restore();
        }
    }

    MouseArea {
        id: linkMouseArea
        enabled: acceptMouseInput
        anchors.fill: parent
        hoverEnabled: parent.followMouseMode
        onPositionChanged: updateCanvas()
    }
}
