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

    title: "6 PS/ПC"

    ColumnLayout {

        /*Image {
            Layout.leftMargin: leftMargin
            Layout.alignment: Qt.AlignHCenter
            Layout.topMargin: 10
            source: "../icons/plastic/6ps/page-icon.png"
        }*/

        Custom.WSTextHeader {
            Layout.topMargin: 10
            Layout.leftMargin: leftMargin
            labelText: "Принимается"
        }

        Custom.WSTextButton {
            Layout.topMargin: 10
            Layout.leftMargin: leftMargin
            width: 300
            header: "Разное"
            text: "<ul>
                   <li>Лотки из-под яиц</li>
                   <li>Контейнеры от тортов</li>
                   <li>Пищевые контейнеры</li>
                   <li>Крышки от кофейных стаканов</li>
                   <li>Вспененные подложки</li>
                   <li>Пенопласт</li>
                   </ul>"
            onClicked: function() {
                view.push("../prepare_page/how_2_prep.qml",
                          {"view": view,
                           "mapView": mapView,
                           "pageTitle": header,
                           "mapPrepareText": "Опустошить, этикетку не снимать, сжать, кидать без пакетов.",
                           "mapPrepareTextHeight": "50",
                           "ecoPrepareText": "Вымыть, высушить, снять или вырезать бумажные наклейки, сложить друг в друга (за дополнительную плату можно весь пластик сдать в одном пакете).",
                           "ecoPrepareTextHeight": "100",
                           "placePrepareText": "Вымыть, высушить, снять или вырезать бумажные наклейки, сложить друг в друга.",
                           "placePrepareTextHeight": "70",
                           "squirrelPrepareText": "Вымыть, высушить, снять или вырезать бумажные наклейки, сложить друг в друга.",
                           "squirrelPrepareTextHeight": "80",
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
                   <li>Отходы с маркировкой C/PS</li>
                   <li>Перфорированные обложки от мяса</li>
                   </ul>"
            font.pixelSize: 14
        }
    }
}
