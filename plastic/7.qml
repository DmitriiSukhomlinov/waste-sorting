import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12

import "../custom" as Custom
import "../"

Page {
    property StackView view
    property Map mapView

    property int leftMargin: 40

    height: view.height
    width: view.width

    title: "7 OTHER"

    ColumnLayout {

        /*Image {
            Layout.leftMargin: leftMargin
            Layout.alignment: Qt.AlignHCenter
            Layout.topMargin: 10
            source: "../icons/plastic/7other/page-icon.png"
        }*/

        Label {
            Layout.topMargin: 10
            Layout.leftMargin: leftMargin
            text: "Пластик с данной маркировкой\nне перерабатывается."
            font.pixelSize: 14
        }
    }
}
