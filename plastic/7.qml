import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12

import "../custom" as Custom
import "../"

Page {
    id: page
    property StackView view

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

        Custom.WSNoClickTextButton {
            Layout.topMargin: 20
            Layout.leftMargin: leftMargin
            Layout.preferredWidth: page.width - leftMargin
            labelText: "Пластик с данной маркировкой не перерабатывается."
        }
    }
}
