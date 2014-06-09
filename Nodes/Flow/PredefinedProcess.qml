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
    id: inout

    property real minimumWidth: 150
    property real minimumHeight: 100

    Item {
        id: bodyContainer
        x: parent.gap
        y: parent.gap
        width: parent.width - parent.gap*2
        height: parent.height - parent.gap*2

        Row {
            id: body

            Rectangle {
                id: left
                width: bodyContainer.width*0.1
                height: bodyContainer.height

                color: inout.nfill ? inout.nbgColor : "transparent"
                border.width: nborder ? inout.nborderWidth : 0
                border.color: inout.nborderColor
            }

            Rectangle {
                id: middle
                width: bodyContainer.width*0.8
                height: bodyContainer.height

                color: inout.nfill ? inout.nbgColor : "transparent"
                border.width: nborder ? inout.nborderWidth : 0
                border.color: inout.nborderColor


                Text {
                    anchors.fill: parent

                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    elide: Text.ElideMiddle
                    wrapMode: Text.Wrap

                    text: inout.ntext
                    font.family: inout.nfamily
                    font.pointSize: inout.npointSize
                    color: inout.ntextColor
                }
            }

            Rectangle {
                id: right
                width: bodyContainer.width*0.1
                height: bodyContainer.height

                color: inout.nfill ? inout.nbgColor : "transparent"
                border.width: nborder ? inout.nborderWidth : 0
                border.color: inout.nborderColor
            }
        }
    }
}
