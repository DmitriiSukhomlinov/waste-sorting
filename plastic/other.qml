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

    title: "EXTRA"

    ColumnLayout {
        Custom.WSTextHeader {
            Layout.topMargin: 10
            Layout.leftMargin: leftMargin
            labelText: "Без маркировки"
        }

        Label {
            Layout.leftMargin: leftMargin
            text: "<ul>
                   <li>Крышки</li>
                   <li>Пакеты</li>
                   <li>Строительная стретч-пленка</li>
                   <li>Воздушно-пузырьковая плёнка</li>
                   <li>Пластиковые карты</li>
                   </ul>"
            font.pixelSize: 14
        }
    }
}
