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

    title: "3 PVC/ПВХ"

    ColumnLayout {
        Custom.WSTextHeader {
            Layout.topMargin: 30
            Layout.leftMargin: leftMargin
            labelText: "Не перерабатывается"
        }
    }
}
