ymaps.ready(init);

var map

const typesAndColors = new Map([
   ["PETE", "#00FF00"],
   ["HDPE", "#FF0000"],
   ["PVC", "#FFFF00"],
   ["LDPE", "#FF00FF"]
]);

function init() {
  map = new ymaps.Map("map", {
    center: [55.76, 37.57],
    zoom: 5,
    controls: ['zoomControl', 'searchControl']
  });

  updatePoints("HDPE")
}

function updatePoints(newPointsType) {
    $.getJSON('data.json', function(data) {
      // Создадим объект точек из data.Points
      var color = typesAndColors.get(newPointsType)
      var myGeoObjects = data.Points.map(item => {
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
              '<b>Данные: </b>' + item.MapPoinName + '<br>',
              '<b>Данные: </b>ФИО Главы МО<br>',
              '</address>'
            ].join('')
          }
        }, {
          preset: "islands#darkGreenDotIcon",
          iconColor: color
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
      /*map.setBounds(clusterer.getBounds(), {
        checkZoomRange: true
      });*/
    })
}
