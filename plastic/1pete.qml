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

    title: "1 PET/ПЭТ"

    ColumnLayout {
        spacing: 0

        /*Image {
            Layout.leftMargin: leftMargin
            Layout.alignment: Qt.AlignHCenter
            Layout.topMargin: 10
            source: "../icons/plastic/1pete/page-icon.png"
        }*/

        Custom.WSTextHeader {
            Layout.topMargin: 10
            Layout.leftMargin: leftMargin
            labelText: "Принимается"
        }

        Custom.WSCategoryTextButton {
            Layout.topMargin: 20
            //Layout.leftMargin: leftMargin
            width: page.width
            header: "Бутылки"
            text: "<ul>
                   <li>Бутылки любых цветов</li>
                   </ul>"
            onClicked: function() {
                view.push("../prepare_page/how_2_prep.qml",
                          {"view": view,
                           "pageTitle": header,
                           "mapPrepareText": "Опустошить, этикетку не снимать, сжать, кидать без пакетов./nКрышки можно снять и сдать на переработку отдельно.",
                           "mapPrepareTextHeight": "70",
                           "ecoPrepareText": "Крышки снять и сложить отдельно, этикетки оставить, сжать, сложить в отдельный пакет (за дополнительную плату можно весь пластик сдать в одном пакете).",
                           "ecoPrepareTextHeight": "100",
                           "placePrepareText": "Вымыть, высушить, крышки снять и сложить отдельно, этикетки оставить, сжать, сложить в отдельный пакет.",
                           "placePrepareTextHeight": "70",
                           "squirrelPrepareText": "Вымыть, высушить, крышки снять и сложить отдельно, этикетки оставить, сжать, сложить в отдельный пакет.",
                           "squirrelPrepareTextHeight": "80",
                           "pointsType": "pete_metall-general" })
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
                   <li>Отходы с маркировкой C/PET</li>
                   <li>Контейнеры</li>
                   <li>Стаканчики</li>
                   <li>Мягкие упаковки</li>
                   <li>Другое</li>
                   </ul>"
            font.pixelSize: 14
            wrapMode: Text.WordWrap
            Layout.preferredWidth: page.width - leftMargin
        }
    }
}
