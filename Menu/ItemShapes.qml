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
        width: parent.width+50 //+50 dut t oa bug that shows a horizontal slider where no should be
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
