import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.12

ApplicationWindow {
    id: window
    //width: 640
    //height: 480
    width: 488
    height: 812
    visible: true
    title: "Garbage Collector"

    header: ToolBar {
        Material.background: "#00d09f"

        ToolButton {
            id: toolButton
            text: stackView.depth > 1 ? "<" : ""
            font.pixelSize: Qt.application.font.pixelSize * 1.6
            onClicked: {
                if (stackView.depth > 1) {
                    stackView.pop()
                }
            }
        }

        Label {
            text: stackView.currentItem.title
            anchors.centerIn: parent
        }
    }

    StackView {
        id: stackView
        initialItem: ChooseCathegoryPage {
            id: chooseCathegory
            height: stackView.height
            width: stackView.width
            view: stackView
            mapView: mapView
            //mainStack: stackView
        }

        Map {
            id: mapView
            view: stackView
            pageUrl: htmlUrl
            visible: false
        }


        anchors.fill: parent
    }
}
