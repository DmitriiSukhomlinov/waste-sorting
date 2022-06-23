import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12

import "../custom" as Custom
import "../"

Page {
    property StackView view

    property int leftMargin: 40
    property string pageTitle: ""
    property string howPrepare: ""
    property string jsScript: ""


    height: view.height
    width: view.width

    title: pageTitle

    ColumnLayout {
        width: parent.width

        Custom.WSTextHeader {
            Layout.topMargin: 30
            Layout.leftMargin: leftMargin
            labelText: "Как подготовить к сдаче?"
        }

        Label {
            Layout.topMargin: 10
            Layout.leftMargin: leftMargin
            text: howPrepare
            font.pixelSize: 14
            Layout.preferredWidth: parent.width - 100
            width: parent.width - 100
            wrapMode: Text.WordWrap
        }
    }

    Button {
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width
        id: button
        text: "Открыть карту"
        background: Rectangle {
            id: rect
            radius: 100
            color: "lightgreen"
            width: parent.width
            height: 70
        }

        onClicked: function() {
            //view.push(mapView)
            //mapView.web.runJavaScript(jsScript)
        }

        MouseArea {
            anchors.fill: button
            onClicked: { button.clicked();}
            onPressed: {
                rect.color = "green"
            }
            onReleased: {
                rect.color = "lightgreen"
            }
        }
    }
}
