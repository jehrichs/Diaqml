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
import QtQml.Models 2.1
import QtQuick.Layouts 1.0
import QtQuick.Controls 1.2

Rectangle {
    id: listOfAvailableShapes
    height: parent.height
    color:"black"

    property Item documentArea

    ObjectModel {
        id: flowShapesModel

        ShapePreset {
            componentFile: "../Nodes/Flow/InOutput.qml"
            documentArea: listOfAvailableShapes.documentArea
        }
        ShapePreset {
            componentFile: "../Nodes/Flow/PredefinedProcess.qml"
            documentArea: listOfAvailableShapes.documentArea
        }
        ShapePreset {
            componentFile: "../Nodes/Flow/Connector.qml"
            documentArea: listOfAvailableShapes.documentArea
        }
        ShapePreset {
            componentFile: "../Nodes/Flow/Process.qml"
            documentArea: listOfAvailableShapes.documentArea
        }
        ShapePreset {
            componentFile: "../Nodes/Flow/OffPageConnector.qml"
            documentArea: listOfAvailableShapes.documentArea
        }
        ShapePreset {
            componentFile: "../Nodes/Flow/Decision.qml"
            documentArea: listOfAvailableShapes.documentArea
        }
    }

    ObjectModel {
        id: umlShapesModel

        ShapePreset {
            componentFile: "../Nodes/Flow/InOutput.qml"
            documentArea: listOfAvailableShapes.documentArea
        }
        ShapePreset {
            componentFile: "../Nodes/Flow/PredefinedProcess.qml"
            documentArea: listOfAvailableShapes.documentArea
        }
        ShapePreset {
            componentFile: "../Nodes/Flow/Connector.qml"
            documentArea: listOfAvailableShapes.documentArea
        }
        ShapePreset {
            componentFile: "../Nodes/Flow/Process.qml"
            documentArea: listOfAvailableShapes.documentArea
        }
    }

    ObjectModel {
        id: testShapesModel

        ShapePreset {
            componentFile: "../Nodes/Flow/InOutput.qml"
            documentArea: listOfAvailableShapes.documentArea
        }
        ShapePreset {
            componentFile: "../Nodes/Flow/PredefinedProcess.qml"
            documentArea: listOfAvailableShapes.documentArea
        }
        ShapePreset {
            componentFile: "../Nodes/Flow/Connector.qml"
            documentArea: listOfAvailableShapes.documentArea
        }
        ShapePreset {
            componentFile: "../Nodes/Flow/Process.qml"
            documentArea: listOfAvailableShapes.documentArea
        }
    }

    ScrollView {
        width: parent.width+50 //+50 due to a bug that shows a horizontal slider where no should be
        height: parent.height

    Column {
        id: toolbox
        spacing: 2
        width:listOfAvailableShapes.width
        height: flowShapes.height+umlShapes.height+testShapes.height

        ItemShapeList {
            id: flowShapes
            width: parent.width
            customModel: flowShapesModel
            titleText: "Flow Diagram"
        }

        ItemShapeList {
            id: umlShapes
            width: parent.width
            titleText: "UML Diagram"
            customModel: umlShapesModel
        }

        ItemShapeList {
            id: testShapes
            width: parent.width
            titleText: "Test Diagram"
            customModel: testShapesModel
        }
    }
    }
}
