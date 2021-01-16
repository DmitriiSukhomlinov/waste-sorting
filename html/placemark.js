ymaps.ready(init);

var map

function init() {
  map = new ymaps.Map("map", {
    center: [55.76, 37.57],
    zoom: 5,
    controls: ['zoomControl']
  });

  //updatePoints("HDPE")
}

function updatePoints(newPointsType) {

    $.getJSON("https://raw.githubusercontent.com/DmitriiSukhomlinov/waste-sorting/master/resources/data.json", function(data) {
      //Найдем в json файле раздел, соответствующий необходимому нам
      var currentData
      $.each( data, function( key, val ) {
        if (key === newPointsType) {
            currentData = val
        }
      });
      var myGeoObjects = currentData.MapData.map(item => {
        return new ymaps.GeoObject({
          geometry: {
            type: "Point",
            // Переведем строку с координатами в массив
            coordinates: item.MapPointCoordinates.split(', ')
          },
          properties: {
            clusterCaption: 'Описание в кластере',
            balloonContentBody: [
              '<address style="font-style: normal">',
              '<h3>Данные</h3>',
              '<b>Название: </b>' + item.MapPoinName + '<br>',
              '<b>Описание: </b>' + item.MapPointDescription + '<br>',
              '</address>'
            ].join('')
          }
        }, {
          preset: "islands#darkGreenDotIcon",
          iconColor: currentData.Color
        });
      })
      // Создадим кластеризатор после получения и добавления точек
      var clusterer = new ymaps.Clusterer({
        preset: 'islands#invertedDarkGreenClusterIcons',
        clusterDisableClickZoom: true,
        clusterBalloonContentLayoutWidth: 800,
        clusterBalloonLeftColumnWidth: 160
      });
      clusterer.add(myGeoObjects);
      map.geoObjects.add(clusterer);
      map.setBounds(clusterer.getBounds(), {
        checkZoomRange: true
      });
    })
}
