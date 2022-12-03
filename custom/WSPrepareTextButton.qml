import QtQuick 2.12
import QtQuick.Controls 2.12

Rectangle {
    id: container

    property alias header: header.text
    property alias text: label.text
    property alias prepareText: prepareLabel.text
    property bool hasIcon: true
    property bool showExternalLink: false
    property bool clickable: true
    property int leftMargin: 40
    property int offset: 30

    signal clicked

    width: label.width + 20;
    height: topOffset.height +
            header.height +
            label.height +
            separateSpacerColumn.spacing +
            prepareHeader.height +
            prepareLabel.height +
            bottomOffset.height

    color: "#FAFAFA"
    WSCustomBorder {
        commonBorder: false
        lBorderwidth: 0
        rBorderwidth: 0
        borderColor: "#d3d3d3"

        Component.onCompleted: function() {
            if (!clickable) {
                tBorderwidth = 0
                bBorderwidth = 0
            }
        }
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
            id: separateSpacerColumn
            anchors.top: parent.top
            spacing: 10

            Column {

                Item {
                    id: topOffset
                    width: 1
                    height: offset
                }

                Row {
                    spacing: 10

                    Text {
                        wrapMode: Text.WordWrap
                        id: header
                        x: 10
                        font.pixelSize: 54
                        font.bold: true
                        color: "#33cccc"
                        Component.onCompleted: function() {
                            text = "  "+ text
                            width = Math.min(width, container.parent.width - 200)
                        }
                    }

                    Image {
                        id: externalLink
                        height: parent.height
                        width: height
                        Component.onCompleted: function() {
                            if (!hasIcon) {
                                width = container.parent.width - 70
                                return
                            }

                            if (showExternalLink) {
                                source = "../icons/external_link.png"
                            } else {
                                source = "../icons/chevron_right.png"
                            }
                        }
                    }
                }

                Text {
                    id: label
                    x: 10
                    font.pixelSize: 42
                    wrapMode: Text.WordWrap
                    width: container.parent.width - 70
                }

            }

            Column {

                Text {
                    id: prepareHeader
                    x: 10
                    font.pixelSize: 50
                    color: "#216184"
                    text: "Подготовка"
                }

                Text {
                    id: prepareLabel
                    x: 10
                    font.pixelSize: 42
                    wrapMode: Text.WordWrap
                    width: container.parent.width - 100
                }

                Item {
                    id: bottomOffset
                    width: 1
                    height: offset
                }

            }


        }

    }

    states: State {
        name: "pressed"
        when: mouseArea.pressed && clickable
        PropertyChanges { target: container; color: "#e6e6e6" }
    }
}
