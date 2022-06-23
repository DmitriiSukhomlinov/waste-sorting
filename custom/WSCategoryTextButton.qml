import QtQuick 2.12
import QtQuick.Controls 2.12

Rectangle {
    id: container

    property alias header: header.text
    property alias text: label.text
    property int leftMargin: 40
    property int offset: 5

    signal clicked

    width: label.width + 20;
    height: topOffset.height +
            header.height +
            label.height +
            bottomOffset.height

    color: "#FAFAFA"
    WSCustomBorder {
        commonBorder: false
        lBorderwidth: 0
        rBorderwidth: 0
        borderColor: "#d3d3d3"
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        onClicked: { container.clicked() }
    }

    Row {


        Item {
            width: leftMargin
            height: 1
        }

        Column {

            anchors.top: parent.top

            Item {
                id: topOffset
                width: 1
                height: offset
            }

            Row {
                spacing: 10

                Text {
                    id: header
                    x: 10
                    font.pixelSize: 18
                    font.bold: true
                    color: "#33cccc"
                    Component.onCompleted: function() {
                        text = "  "+ text
                    }
                }

                Image {
                    id: externalLink
                    source: "../icons/chevron_right.png"
                }
            }

            Text {
                id: label
                x: 10
                font.pixelSize: 14
                wrapMode: Text.WordWrap
                width: container.parent.width - 70
            }

            Item {
                id: bottomOffset
                width: 1
                height: offset
            }

        }


    }

    states: State {
        name: "pressed"
        when: mouseArea.pressed
        PropertyChanges { target: container; color: "#e6e6e6" }
    }
}
