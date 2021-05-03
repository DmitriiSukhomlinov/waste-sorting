import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12

import "../custom" as Custom
import "../"

Page {
    id: page
    property StackView view
    property Map mapView

    property int leftMargin: 40

    height: view.height
    width: view.width

    title: "Стекло"

    ColumnLayout {

        Custom.WSTextHeader {
            Layout.topMargin: 10
            Layout.leftMargin: leftMargin
            labelText: "Принимается"
        }

        Custom.WSCategoryTextButton {
            Layout.topMargin: 20
            width: page.width
            header: "Стеклянные изделия"
            text: "<ul>
                   <li>Бутылки и банки</li>
                   <li>Баночки от детского питания</li>
                   <li>Флаконы от лекарств, духов</li>
                   <li>Стеклянная посуда</li>
                   <li>Оконное стекло</li>
                   </ul>"
            onClicked: function() {
                view.push("../prepare_page/how_2_prep.qml",
                          {"view": view,
                           "mapView": mapView,
                           "pageTitle": header,
                           "mapPrepareText": "Опустошить, этикетку не снимать, кидать без пакетов.",
                           "mapPrepareTextHeight": "50",
                           "ecoPrepareText": "Вымыть, высушить, снять крышки, этикетки оставить, безопасно упаковать.",
                           "ecoPrepareTextHeight": "60",
                           "placePrepareText": "Вымыть, высушить, снять крышки, этикетки оставить, безопасно упаковать.",
                           "placePrepareTextHeight": "60",
                           "squirrelPrepareText": "Вымыть, высушить, снять крышки, этикетки оставить, безопасно упаковать. Битую тару упаковать отдельно.",
                           "squirrelPrepareTextHeight": "100",
                           "jsScript": "updatePoints(\"glass\")" })
            }
        }

        Custom.WSTextHeader {
            Layout.topMargin: 20
            Layout.leftMargin: leftMargin
            labelText: "Не принимается"
        }

        Label {
            Layout.leftMargin: leftMargin
            text: "<ul>
                   <li>Хрустальная посуда</li>
                   <li>Керамическая посуда</li>
                   <li>Фарфоровая посуда</li>
                   <li>Лампы</li>
                   <li>Противоударная посуда</li>
                   <li>Зеркала</li>
                   </ul>"
            font.pixelSize: 14
            wrapMode: Text.WordWrap
            Layout.preferredWidth: page.width - leftMargin
        }
    }
}
