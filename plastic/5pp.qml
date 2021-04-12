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

    title: "5 PP/ПП"

    ColumnLayout {

        Image {
            Layout.leftMargin: leftMargin
            Layout.alignment: Qt.AlignHCenter
            Layout.preferredWidth: parent.width / 2
            Layout.preferredHeight: Layout.preferredWidth / 2.75
            source: "../icons/plastic/5pp/page-icon.png"
        }

        Custom.WSTextHeader {
            Layout.leftMargin: leftMargin
            labelText: "Принимается"
        }

        Custom.WSTextButton {
            Layout.topMargin: 20
            Layout.leftMargin: leftMargin
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
                           "prepareText": "Опустошить, этикетку не снимать, \"кидать\" без пакетов.",
                           "prepareTextHeight": "50",
                           "ecoPrepareText": "Вымыть, высушить, снять или вырезать все бумажные бумажные наклейки, сложить друг в друга / за  дополнительную плату можно весь пластик сдать в одном пакете.",
                           "ecoPrepareTextHeight": "80",
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
                           "howPrepare": "Канистры ПВД описание.",
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
