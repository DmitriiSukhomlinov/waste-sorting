import QtQuick 2.12
import QtQuick.Controls 2.5

ApplicationWindow {
    id: window
    //width: 640
    //height: 480
    width: 432
    height: 864
    visible: true
    title: qsTr("Stack")

    header: ToolBar {
        //contentHeight: toolButton.implicitHeight

        /*ToolButton {
            id: toolButton
            text: stackView.depth > 1 ? "\u25C0" : "\u2630"
            font.pixelSize: Qt.application.font.pixelSize * 1.6
            onClicked: {
                if (stackView.depth > 1) {
                    stackView.pop()
                } else {
                    drawer.open()
                }
            }
        }*/

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
            //mainStack: stackView
        }

        anchors.fill: parent
    }
}
