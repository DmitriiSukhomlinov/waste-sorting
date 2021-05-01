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

    title: "41 ALU/Алюминий"

    ColumnLayout {

        Custom.WSTextHeader {
            Layout.topMargin: 30
            Layout.leftMargin: leftMargin
            labelText: "Что можно переработать?"
        }

        Custom.WSTextButton {
            Layout.topMargin: 10
            Layout.leftMargin: leftMargin
            width: 300
            header: "Разное"
            text: "<ul>
                   <li>Алюминиевые банки</li>
                   <li>Фольга</li>
                   <li>Баллоны под давлением</li>
                   <li>Одноразовые формы для выпечки</li>
                   </ul>"
            onClicked: function() {
                view.push("../prepare_page/how_2_prep.qml",
                          {"view": view,
                           "mapView": mapView,
                           "pageTitle": header,
                           "mapPrepareText": "Опустошить, сжать, кидать без пакетов. Предметы мельче алюминиевой банки сдавать другим способом.",
                           "mapPrepareTextHeight": "100",
                           "ecoPrepareText": "Опустошить, сложить в отдельный пакет.",
                           "ecoPrepareTextHeight": "50",
                           "placePrepareText": "Вымыть, высушить, сжать или компактно сложить.",
                           "placePrepareTextHeight": "50",
                           "squirrelPrepareText": "Вымыть, высушить, сжать или компактно сложить.",
                           "squirrelPrepareTextHeight": "70",
                           "jsScript": "updatePoints(\"hdpe_ldpe_pp_ps_fe-cans_alu-aluminum-cans\")" })
            }
        }

        Custom.WSTextHeader {
            Layout.topMargin: 30
            Layout.leftMargin: leftMargin
            labelText: "Что нельзя переработать?"
        }

        Label {
            Layout.topMargin: 10
            Layout.leftMargin: leftMargin
            text: "Посуда для готовки с покрытием\n(антипригарное и др.)"
            font.pixelSize: 14
        }

        Label {
            Layout.topMargin: 10
            Layout.leftMargin: leftMargin
            text: "Кофейные капсулы"
            font.pixelSize: 14
        }
    }
}
