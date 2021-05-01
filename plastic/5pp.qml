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

    title: "5 PP/ПП"

    ColumnLayout {

        /*Image {
            Layout.leftMargin: leftMargin
            Layout.alignment: Qt.AlignHCenter
            Layout.topMargin: 10
            source: "../icons/plastic/5pp/page-icon.png"
        }*/

        Custom.WSTextHeader {
            Layout.topMargin: 10
            Layout.leftMargin: leftMargin
            labelText: "Принимается"
        }

        Custom.WSTextButton {
            Layout.topMargin: 20
            Layout.leftMargin: leftMargin
            width: 300
            header: "Твердый пластик"
            text: "<ul>
                   <li>Тазы</li>
                   <li>Ведра</li>
                   <li>Соломинки</li>
                   <li>Баночки из-под сметаны</li>
                   <li>Одноразовая посуда</li>
                   <li>Контейнеры</li>
                   </ul>"
            onClicked: function() {
                view.push("../prepare_page/how_2_prep.qml",
                          {"view": view,
                           "mapView": mapView,
                           "pageTitle": header,
                           "mapPrepareText": "Опустошить, этикетку не снимать, \"кидать\" без пакетов.",
                           "mapPrepareTextHeight": "50",
                           "ecoPrepareText": "Вымыть, высушить, снять или вырезать все бумажные бумажные наклейки, сложить друг в друга / за  дополнительную плату можно весь пластик сдать в одном пакете.",
                           "ecoPrepareTextHeight": "100",
                           "placePrepareText": "Вымыть, высушить, снять или вырезать все бумажные бумажные наклейки, сложить друг в друга.",
                           "placePrepareTextHeight": "80",
                           "squirrelPrepareText": "Вымыть, высушить, снять или вырезать все бумажные бумажные наклейки, сложить друг в друга.",
                           "squirrelPrepareTextHeight": "80",
                           "jsScript": "updatePoints(\"hdpe_ldpe_pp_ps_fe-cans_alu-aluminum-cans\")" })
            }
        }

        Custom.WSTextButton {
            Layout.topMargin: 10
            Layout.leftMargin: leftMargin
            width: 300
            header: "Мягкий пластик"
            text: "<ul>
                   <li>Упаковки от круп</li>
                   <li>Упаковки от макаронных изделий</li>
                   <li>Упаковки от сладостей</li>
                   </ul>"
            onClicked: function() {
                view.push("../prepare_page/how_2_prep.qml",
                          {"view": view,
                           "mapView": mapView,
                           "pageTitle": header,
                           "ecoPrepareText": "Снять или вырезать бумажные наклейки, отмыть от грязи и жира, высушить. Сложить все пакеты в один 5-PP пакет.",
                           "ecoPrepareTextHeight": "80",
                           "placePrepareText": "Снять или вырезать бумажные наклейки (если маркировка только там, перенести её маркером на пластик), отмыть от грязи и жира, высушить. Сложить все пакеты в один 5-PP пакет.",
                           "placePrepareTextHeight": "110",
                           "squirrelPrepareText": "Снять или вырезать бумажные наклейки, отмыть от грязи и жира, высушить. Сложить все пакеты в один 5-PP пакет (за дополнительную плату можно весь пластик сдать в одном пакете).",
                           "squirrelPrepareTextHeight": "130",
                           "jsScript": "updatePoints(\"hdpe_ldpe_pp_ps_fe-cans_alu-aluminum-cans\")" })
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
                   <li>Отходы с маркировкой C/PP</li>
                   <li>Флаконы от средств \"Чистая линия\"</li>
                   <li>Фольгированные упаковки (с<br/>отражающими поверхностями)</li>
                   </ul>"
            font.pixelSize: 14
        }
    }
}
