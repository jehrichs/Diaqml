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
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.0

import QtQuick.Dialogs 1.1

import "../Nodes/node_handling.js" as Node

Rectangle {
    id: propertiesMenu
    anchors.fill:parent

    Column {
        anchors.fill:parent

        GroupBox {
            width:propertiesMenu.width
            title: qsTr("Position")
            GridLayout {
                columns: 2
                flow: GridLayout.LeftToRight
                width:parent.width

                Label { text: "Width" }
                SpinBox {
                    id: itemWidth
                    maximumValue: 65000
                    minimumValue: 10
                    Component.onCompleted: Node.setItemWidth = itemWidth;
                    onValueChanged: if(Node.lastSelectedNode) { Node.lastSelectedNode.parent.width = itemWidth.value; }
                }

                Label { text: "Height" }
                SpinBox {
                    id: itemHeight
                    maximumValue: 65000
                    minimumValue: 10
                    Component.onCompleted: Node.setItemHeight = itemHeight;
                    onValueChanged: if(Node.lastSelectedNode) { Node.lastSelectedNode.parent.height = itemHeight.value; }
                }

                Label { text: "X" }
                SpinBox {
                    id: itemX
                    maximumValue: 65000
                    minimumValue: -65000
                    Component.onCompleted: Node.setItemX = itemX;
                    onValueChanged: if(Node.lastSelectedNode) { Node.lastSelectedNode.parent.x = itemX.value; }
                }

                Label { text: "Y" }
                SpinBox {
                    id: itemY
                    maximumValue: 65000
                    minimumValue: -65000
                    Component.onCompleted: Node.setItemY = itemY;
                    onValueChanged: if(Node.lastSelectedNode) { Node.lastSelectedNode.parent.y = itemY.value; }
                }

                Label { text: "Z" }
                SpinBox {
                    id: itemZ
                    maximumValue: 65000
                    minimumValue: 1
                    Component.onCompleted: Node.setItemZ = itemZ;
                    onValueChanged: if(Node.lastSelectedNode) { Node.lastSelectedNode.parent.z = itemZ.value; }
                }
            }
        }


        GroupBox {
            width:propertiesMenu.width
            title: qsTr("Appereance")
            GridLayout {
                columns: 2
                flow: GridLayout.LeftToRight
                width:propertiesMenu.width

                Label { text: "Opacity" }
                SpinBox {
                    id: itemOpacity
                    maximumValue: 1
                    minimumValue: 0
                    decimals: 2
                    stepSize: 0.1
                    Component.onCompleted: Node.setItemOpacity= itemOpacity;
                    onValueChanged: if(Node.lastSelectedNode) { Node.lastSelectedNode.parent.opacity = itemOpacity.value; }
                }

                CheckBox {
                    id: itemFillBackground
                    text: qsTr("Fill background")
                    Layout.columnSpan: 2
                    Component.onCompleted: Node.setItemFillBackground = itemFillBackground;
                    onCheckedChanged: if(Node.lastSelectedNode) { Node.lastSelectedNode.parent.nfill = itemFillBackground.checked; }
                }
                Label { text: "Color" }
                Rectangle {
                    id: itemBgColor
                    width: 30
                    height: 15
                    border.width: 1
                    border.color: "black"
                    Component.onCompleted: Node.setItemBgColor = itemBgColor;

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            if(Node.lastSelectedNode) {
                                bgColorDialog.currentColor = Node.lastSelectedNode.parent.nbgColor;
                                bgColorDialog.color = Node.lastSelectedNode.parent.nbgColor;
                            }
                            bgColorDialog.visible = true;
                        }

                        ColorDialog {
                            id: bgColorDialog
                            title: "Please choose a background color"
                            onAccepted: {
                                itemBgColor.color = bgColorDialog.color
                                if(Node.lastSelectedNode) {
                                    Node.lastSelectedNode.parent.nbgColor = bgColorDialog.color
                                }
                                bgColorDialog.visible = false
                                Node.lastSelectedBgColor = bgColorDialog.color;
                            }
                        }
                    }
                }

                CheckBox {
                    id: itemDrawBorder
                    text: qsTr("Draw Border")
                    Layout.columnSpan: 2
                    Component.onCompleted: Node.setItemDrawBorder = itemDrawBorder;
                    onCheckedChanged: if(Node.lastSelectedNode) { Node.lastSelectedNode.parent.nborder = itemDrawBorder.checked; }
                }

                Label { text: "Width" }
                SpinBox {
                    id: itemLineWidth
                    maximumValue: 10
                    minimumValue: 0
                    Component.onCompleted: Node.setItemLineWidth= itemLineWidth;
                    onValueChanged: if(Node.lastSelectedNode) { Node.lastSelectedNode.parent.nborderWidth = itemLineWidth.value; }
                }

                Label { text: "Color" }
                Rectangle {
                    id: itemBorderColor
                    width: 30
                    height: 15
                    border.width: 1
                    border.color: "black"
                    Component.onCompleted: Node.setItemBorderColor = itemBorderColor;

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            if(Node.lastSelectedNode) {
                                borderColorDialog.currentColor = Node.lastSelectedNode.parent.nborderColor;
                                borderColorDialog.color = Node.lastSelectedNode.parent.nborderColor;
                            }
                            borderColorDialog.visible = true;
                        }

                        ColorDialog {
                            id: borderColorDialog
                            title: "Please choose a border color"
                            onAccepted: {
                                itemBorderColor.color = borderColorDialog.color

                                if(Node.lastSelectedNode) {
                                    Node.lastSelectedNode.parent.nborderColor = borderColorDialog.color;
                                    Node.lastSelectedBorderColor = borderColorDialog.color;
                                }
                                borderColorDialog.visible = false;
                            }
                        }
                    }
                }
            }
        }


        GroupBox {
            width:propertiesMenu.width
            title: qsTr("Text")
            GridLayout {
                columns: 2
                flow: GridLayout.LeftToRight
                width:propertiesMenu.width

                Label { text: "Size" }
                SpinBox {
                    id: itemFontSize
                    maximumValue: 60
                    minimumValue: 0
                    Component.onCompleted: Node.setItemFontSize = itemFontSize;
                    onValueChanged: if(Node.lastSelectedNode) {
                        Node.lastSelectedNode.parent.npointSize = itemFontSize.value;
                        Node.lastSelectedTextSize = itemFontSize.value;
                    }
                }

                Label { text: "Color" }
                Rectangle {
                    id: itemTextColor
                    width: 30
                    height: 15
                    border.width: 1
                    border.color: "black"
                    Component.onCompleted: Node.setItemTextColor = itemTextColor;

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            if(Node.lastSelectedNode) {
                                textColorDialog.currentColor = Node.lastSelectedNode.parent.ntextColor;
                                textColorDialog.color = Node.lastSelectedNode.parent.ntextColor;
                            }
                            textColorDialog.visible = true;
                        }

                        ColorDialog {
                            id: textColorDialog
                            title: "Please choose a text color"
                            onAccepted: {
                                itemTextColor.color = textColorDialog.color
                                if(Node.lastSelectedNode) {
                                    Node.lastSelectedNode.parent.ntextColor = textColorDialog.color;
                                    Node.lastSelectedTextColor = textColorDialog.color;
                                }
                                textColorDialog.visible = false;
                            }
                        }
                    }
                }

                Label { text: "Family" }
                TextField { }

                Label { text: "Text:"; Layout.columnSpan: 2 }
                TextArea {
                    id: itemText
                    text: "This widget spans over three rows in the GridLayout.\n"
                    + "All items in the GridLayout are implicitly positioned from top to bottom."
                    Layout.columnSpan: 2
                    Layout.fillHeight: true
                    Layout.fillWidth: true

                    Component.onCompleted: Node.setItemText = itemText;
                    onTextChanged: {
                        if(Node.lastSelectedNode) {
                            Node.lastSelectedNode.parent.ntext = itemText.text;
                            Node.lastSelectedTextColor = itemText.text;
                        }
                    }
                }

            }
        }
    }





}
