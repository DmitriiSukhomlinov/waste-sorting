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

    title: "3 PVC/ПВХ"

    ColumnLayout {

        Custom.WSNoClickTextButton {
            Layout.topMargin: 20
            Layout.leftMargin: leftMargin
            Layout.preferredWidth: page.width - leftMargin
            labelText:"Пластик с данной маркировкой не перерабатывается."
        }
    }
}
