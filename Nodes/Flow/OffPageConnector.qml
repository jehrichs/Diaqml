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

import "../"

NodeFrame {
    id: node

    property real minimumWidth: 100
    property real minimumHeight: 100

    LinkSocket {
        id: top
        z: 10
        x: parent.width/2-top.width/2
    }
    LinkSocket {
        id: bottom
        z: 10
        x: parent.width/2-bottom.width/2
        y: parent.height-bottom.height
    }

    LinkSocket {
        id: left
        z: 10
        y: parent.height/2-left.height/2
    }
    LinkSocket {
        id: right
        z: 10
        x: parent.width-right.width
        y: parent.height/2-right.height/2
    }
    LinkSocket {
        id: center
        z: 10
        x: parent.width/2-center.width/2
        y: parent.height/2-center.height/2
    }

    onHeightChanged: {
        canvas.requestPaint();
    }
    onWidthChanged: {
        canvas.requestPaint()
    }
    onNbgColorChanged: {
        canvas.requestPaint()
    }
    onNfillChanged: {
        canvas.requestPaint()
    }
    onNborderColorChanged: {
        canvas.requestPaint()
    }
    onNborderChanged: {
        canvas.requestPaint()
    }
    onNborderWidthChanged: {
        canvas.requestPaint()
    }

    Canvas {
        id: canvas
        anchors.fill: node
        antialiasing: true
        renderStrategy: Canvas.Threaded;

        property int x0: node.gap
        property int y0: node.gap

        property int x1: node.width-node.gap
        property int y1: y0

        property int x2: x1
        property int y2: node.height*0.7

        property int x3: node.width/2
        property int y3: node.height-node.gap

        property int x4: gap
        property int y4: y2

        onPaint: {
            var ctx = getContext("2d");
            ctx.reset();
            ctx.save();
            ctx.clearRect(0,0,width, height);

            ctx.strokeStyle = node.nborderColor;
            ctx.lineWidth = node.nborderWidth;
            ctx.fillStyle = node.nbgColor;
            ctx.globalAlpha = node.nalpha;

            ctx.beginPath();
            ctx.moveTo(x0, y0);
            ctx.lineTo(x1, y1);
            ctx.lineTo(x2, y2);
            ctx.lineTo(x3, y3);
            ctx.lineTo(x4, y4);
            ctx.closePath();

            if (node.nfill) {
                ctx.fill();
            }
            if (node.nborder) {
                ctx.stroke();
            }

            ctx.restore();
        }
    }

    Text {
        width: node.width-2*node.gap
        height: node.height*0.7
        x: node.gap
        y: node.gap
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter

        text: node.ntext
        elide: Text.ElideMiddle
        wrapMode: Text.Wrap
        font.family: node.nfamily
        font.pointSize: node.npointSize
        color: node.ntextColor
    }
}
