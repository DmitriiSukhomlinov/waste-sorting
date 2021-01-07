import QtQuick 2.12
import QtQuick.Controls 2.5

Page {
    property StackView view

    height: view.height
    width: view.width

    title: "2 HDPE/ПЭНД"

    Label {
        text: qsTr("You are on Page 2.")
        anchors.centerIn: parent
    }
}
