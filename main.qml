import QtQuick 2.12
import QtQuick.Controls 2.5

ApplicationWindow {
    id: window
    //width: 640
    //height: 480
    width: 432
    height: 864
    visible: true
    title: "Придумать название"

    header: ToolBar {
        //contentHeight: toolButton.implicitHeight

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


    Drawer {
        id: drawer
        width: window.width
        height: window.height

        Column {
            anchors.fill: parent

            ItemDelegate {
                text: qsTr("Page 1")
                width: parent.width
                onClicked: {
                    stackView.push("Page1Form.qml", {"width": stackView.width, "height": stackView.height})
                    drawer.close()
                }

            }

            ItemDelegate {
                text: qsTr("Page 2")
                width: parent.width
                onClicked: {
                    stackView.push("Page2Form.qml", {"width": stackView.width, "height": stackView.height})
                    drawer.close()
                }
            }
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
