/*
 Diaqml - [Proof of Concept] Diagram editor
 Copyright (C) 2014  Joerg Ehrichs

 This program is free software: you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation, either version 3 of the License, or
 (at your option) any later version.

 This program is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.

 You should have received a copy of the GNU General Public License
 along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

import QtQuick 2.2
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.0
import QtQuick.Window 2.0


import "Menu"
import "Nodes/node_handling.js" as Node

ApplicationWindow {
    id: application
    title: qsTr("Diaqml - Diagram Editor in QML")
    width: 800
    height: 600

    property int itemShapeGridSize: 40

    menuBar: MenuBar {
        Menu {
            title: qsTr("File")
            MenuItem {
                text: qsTr("Flip")
                onTriggered: Node.flipable.flipped = !Node.flipable.flipped;
            }
            MenuItem {
                text: qsTr("Exit")
                onTriggered: Qt.quit();
            }
        }
    }



    SplitView {
        id: window
        anchors.fill: parent
        orientation: Qt.Horizontal

        Component.onCompleted: Node.window = window;

        Flipable {
            id: flipable
            Layout.minimumWidth: 200
            Layout.maximumWidth: 400

            property bool flipped: false

            front: ItemShapes {
                                id: testdocument
                                anchors.fill:parent

                                documentArea: documentArea
                                }
            back: ItemPropertiesMenu { anchors.fill:parent }

            transform: Rotation {
                id: rotation
                origin.x: flipable.width/2
                origin.y: flipable.height/2
                axis.x: 0; axis.y: 1; axis.z: 0     // set axis.y to 1 to rotate around y-axis
                angle: 0    // the default angle
            }

            states: State {
                name: "back"
                PropertyChanges { target: rotation; angle: 180 }
                PropertyChanges { target: flipable.front; enabled: false }
                PropertyChanges { target: flipable.back; enabled: true }
                when: flipable.flipped
            }

            transitions: Transition {
                NumberAnimation { target: rotation; property: "angle"; duration: 440 }
            }

            Component.onCompleted: Node.setFlipable(flipable);
        }


        Rectangle {
            id: documentArea
            Layout.minimumWidth: 50
            Layout.fillWidth: true
            color: "darkgray"


            MouseArea {
                anchors.fill: parent

                onClicked: { Node.select(null) }
            }

            Component.onCompleted: Node.documentArea = documentArea;
        }
    }
}
