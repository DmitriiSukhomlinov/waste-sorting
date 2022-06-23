import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12

import "../custom" as Custom
import "../"
import "../html/placemark.js" as PlacemarkScript

Page {
    property StackView view

    property int leftMargin: 40
    property string pageTitle: ""
    property string howPrepare: ""
    property string pointsType: ""

    property alias mapPrepareText: map.prepareText
    property int mapPrepareTextHeight: 0
    property alias ecoPrepareText: eco.prepareText
    property int ecoPrepareTextHeight: 0
    property alias placePrepareText: place.prepareText
    property int placePrepareTextHeight: 0
    property alias squirrelPrepareText: squirrel.prepareText
    property int squirrelPrepareTextHeight: 0
    property alias raccoonPrepareText: raccoon.prepareText
    property int raccoonPrepareTextHeight: 0
    property alias adressPrepareText: adress.prepareText
    property int adressPrepareTextHeight: 0
    property alias servicePrepareText: service.prepareText
    property int servicePrepareTextHeight: 0

    title: pageTitle

    Flickable{
        height: view.height
        width: view.width
        contentHeight: columnLayout.height
        ScrollBar.vertical: ScrollBar { }

        ColumnLayout {
            id: columnLayout
            width: parent.width
            spacing: 0

            Custom.WSTextHeader {
                Layout.topMargin: 10
                Layout.leftMargin: leftMargin
                labelText: "Как сдать?"
            }

            Custom.WSPrepareTextButton {
                id: map
                Layout.topMargin: 20
                width: parent.width
                header: "Найти контейнер"
                text: "Вторсырье лучше отнести в ближайший подходящий контейнер. Это снизит нагрузку на волонтеров организаций."
                visible: mapPrepareTextHeight != 0
                onClicked: function() {
                    view.push("../Map.qml",
                              {"view": view,
                               pageUrl: "https://dmitriisukhomlinov.github.io?" + pointsType})
                }
            }

            Custom.WSPrepareTextButton {
                id: eco
                showExternalLink: true
                width: parent.width
                header: "Заказать экотакси"
                text: "Вторсырье могут забрать у вашего дома в один из дней выезда, устанавливаемых организацией. Стоимость услуги зависит от региона. Узнать стоимость и оставить заявку можно в группе организации."
                visible: ecoPrepareTextHeight != 0
                onClicked: function() {
                    Qt.openUrlExternally("https://vk.com/ecotaxi_nsk")
                }
            }

            Custom.WSPrepareTextButton {
                id: place
                showExternalLink: true
                width: parent.width
                header: "Отнести в пункт приема"
                text: "Экоцентр ProZero (Восход 1)\nГрафик работы: сб, вс с 12:00 до 20:00"
                visible: placePrepareTextHeight != 0
                onClicked: function() {
                    Qt.openUrlExternally("https://vk.com/prozero_eco")
                }
            }

            Custom.WSPrepareTextButton {
                id: squirrel
                showExternalLink: true
                width: parent.width
                header: "Сдать на акции \"Зеленая белка\""
                text: "Предварительно разобранное вторсырье можно сдать на одной из точек сбора в день проведения акции. Расписание и расположение точек указано в группе акции."
                visible: squirrelPrepareTextHeight != 0
                onClicked: function() {
                    Qt.openUrlExternally("https://vk.com/eco_week")
                }
            }

            Custom.WSPrepareTextButton {
                id: raccoon
                showExternalLink: true
                width: parent.width
                header: "Найти адрес партнёра акции\n  \"Крышки Енота\""
                text: "Пластиковые крышки можно отнести в один из пунктов приёма, организованных партнёрами акции \"Крышки Енота\". Адреса пунктов указаны в группе."
                visible: raccoonPrepareTextHeight != 0
                onClicked: function() {
                    Qt.openUrlExternally("https://vk.com/pages?oid=-145269495&p=%D0%90%D0%B4%D1%80%D0%B5%D1%81%D0%B0%20%D0%BF%D1%83%D0%BD%D0%BA%D1%82%D0%BE%D0%B2%20%D0%BF%D1%80%D0%B8%D0%B5%D0%BC%D0%B0%20%D0%BA%D1%80%D1%8B%D1%88%D0%B5%D1%87%D0%B5%D0%BA")
                }
            }

            Custom.WSPrepareTextButton {
                id: adress
                showExternalLink: true
                width: parent.width
                header: "Найти адрес приёма"
                text: "Адреса приёма отработанных ртутьсодержащих ламп перечислены на сайте."
                visible: adressPrepareTextHeight != 0
                onClicked: function() {
                    Qt.openUrlExternally("http://xn--80aakvgeiqin5a0c.xn--p1ai/rtut")
                }
            }

            Custom.WSPrepareTextButton {
                id: service
                hasIcon: false
                clickable: false
                width: parent.width
                header: "Сдать в аварийно-спасательную\n  службу"
                text: "ул. Колыванская, 4\nГрафик работы: пн-вс 10:00 - 17:00"
                visible: servicePrepareTextHeight != 0
                /*onClicked: function() {
                    Qt.openUrlExternally("http://xn--80aakvgeiqin5a0c.xn--p1ai/rtut")
                }*/
            }
        }
    }
}
