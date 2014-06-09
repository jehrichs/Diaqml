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
    id: sizeMoveHandle
    anchors.fill: parent
    border.width: 3
    border.color: "gray"
    color: "transparent"
    opacity: 1

    state: "hoverOff"

    property int minHandleSize: 10
    property int maxHandleSize: 10
    property bool selected: false


    states: [
        State {
            name: "hoverOn"
            PropertyChanges { target: sizeMoveHandle; opacity: 1; }
        },
        State {
            name: "hoverOff"
            PropertyChanges { target: sizeMoveHandle; opacity: 0;  }
        }
    ]

    MouseArea {
        id: moveHandle
        cursorShape: Qt.DragMoveCursor;
        anchors.fill: parent
        hoverEnabled: true

        onEntered: { if(sizeMoveHandle.parent.dynamic) { sizeMoveHandle.state = "hoverOn" }}
        onExited: { if(!selected) { sizeMoveHandle.state = "hoverOff" }}
        onClicked: { if(sizeMoveHandle.parent.dynamic)  { Node.select(sizeMoveHandle) }}

        drag.target: parent.parent
        drag.axis: Drag.XandYAxis

        MouseArea {
            id: resizeTophandle
            cursorShape: Qt.SizeVerCursor;
            width: parent.width
            height: minHandleSize
            hoverEnabled: true

            property int courserPos: 0
            property bool resize: false

            onPressed: {
                courserPos = mouseY
                resize = true
            }

            onReleased: { resize = false }

            onPositionChanged: {
                if(resize) {
                    var diff = courserPos - mouseY;

                    frame.height = frame.height+diff;
                    frame.y = frame.y - diff;
                    courserPos = mouseY;
                }
            }


            onEntered: { topHandle.opacity = 0.5 }
            onExited: { topHandle.opacity = 0 }

            Rectangle {
                id: topHandle
                anchors.fill: parent
                color: "red"
                opacity: 0
            }
        }

        MouseArea {
            id: resizeBottomhandle
            cursorShape: Qt.SizeVerCursor;
            y:parent.height-minHandleSize
            width: parent.width
            height: minHandleSize
            hoverEnabled: true

            property int courserPos: 0
            property bool resize: false

            onPressed: {
                courserPos = mouseY
                resize = true
            }

            onReleased: { resize = false }

            onEntered: { bottomHandle.opacity = 0.5 }
            onExited: { bottomHandle.opacity = 0 }

            onPositionChanged: {
                if(resize) {
                    var diff = courserPos - mouseY;

                    frame.height = frame.height-diff;
                    courserPos = mouseY;
                }
            }

            Rectangle {
                id: bottomHandle
                anchors.fill: parent
                color: "blue"
                opacity: 0
            }
        }

        MouseArea {
            id: resizeRighthandle
            cursorShape: Qt.SizeHorCursor;
            x: parent.width-minHandleSize
            width: minHandleSize
            height: parent.height
            hoverEnabled: true

            property int courserPos: 0
            property bool resize: false

            onPressed: {
                courserPos = mouseX
                resize = true
            }

            onReleased: { resize = false }

            onPositionChanged: {
                if(resize) {
                    var diff = courserPos - mouseX;

                    frame.width = frame.width-diff;
                    courserPos = mouseX;
                }
            }

            onEntered: { rightHandle.opacity = 0.5 }
            onExited: { rightHandle.opacity = 0 }

            Rectangle {
                id: rightHandle
                anchors.fill: parent
                color: "green"
                opacity: 0
            }
        }

        MouseArea {
            id: resizeLefthandle
            cursorShape: Qt.SizeHorCursor;
            width: minHandleSize
            height: parent.height
            hoverEnabled: true

            property int courserPos: 0
            property bool resize: false

            onPressed: {
                courserPos = mouseX
                resize = true
            }

            onReleased: { resize = false }

            onPositionChanged: {
                if(resize) {
                    var diff = courserPos - mouseX;

                    frame.width = frame.width+diff;
                    frame.x = frame.x - diff;
                    courserPos = mouseX;
                }
            }

            onEntered: { leftHandle.opacity = 0.5 }
            onExited: { leftHandle.opacity = 0 }

            Rectangle {
                id: leftHandle
                anchors.fill: parent
                color: "black"
                opacity:0
            }
        }
    }
}
