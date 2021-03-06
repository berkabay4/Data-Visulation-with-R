# -- MAPS --

if("leaflet" %in% rownames(installed.packages()) == FALSE) {install.packages("leaflet")}
library(leaflet)

if("sp" %in% rownames(installed.packages()) == FALSE) {install.packages("sp")}
library(sp)


if("rgdal" %in% rownames(installed.packages()) == FALSE) {install.packages("rgdal")}


if("leaflet" %in% rownames(installed.packages()) == FALSE) {install.packages("dplyr")}
library(dplyr)


#Packages used to display the maps in this notebook
if("htmlwidgets" %in% rownames(installed.packages()) == FALSE) {install.packages("htmlwidgets")}
library(htmlwidgets)

if("IRdisplay" %in% rownames(installed.packages()) == FALSE) {install.packages("IRdisplay")}
library(IRdisplay)


download.file("https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DV0103EN-SkillsNetwork/labs/module%201/countries.txt",
              "C:/Users/Berkay ABAY/Downloads/txtfiles/wordcloud/energy.csv", quiet = TRUE)

download.file("https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DV0103EN-SkillsNetwork/labs/module%201/energy.csv",
              destfile = "C:/Users/Berkay ABAY/Downloads/txtfiles/wordcloud/energy.csv", quiet = TRUE)


# Bo� bir map sayfas� olu�turur
map <- leaflet()


# D�nya haritas� g�r�n�m� eklemek i�in; 
map <- leaflet() %>% addTiles()



map <-leaflet() %>% addTiles() %>% setView(lng = 86.92, lat = 27.99, zoom = 5)


#Using default base map
map1 <- leaflet() %>% fitBounds(86.8, 27.9, 87, 28) %>% addTiles()
saveWidget(map1, file="map1.html", selfcontained = F)
display_html(paste("<iframe src=' ", 'map1.html', " ' width='100%' height='300'","/>"))




# http://leaflet-extras.github.io/leaflet-providers/preview/index.html



#Using a third-party base map
map2 <- leaflet() %>% fitBounds(86.8, 27.9, 87, 28) %>% addProviderTiles("Stamen.Watercolor")
saveWidget(map2, file="map2.html", selfcontained = F)
display_html(paste("<iframe src=' ", 'map2.html', " ' width='100%' height='300'","/>"))



# Deprem noktalar�n� map �zerinde i�aretleme;
map3 <- leaflet(quakes) %>% addTiles(
) %>% addMarkers(lng = quakes$long[1:10],
                 lat = quakes$lat[1:10])
saveWidget(map3, file="map3.html", selfcontained = F)
display_html(paste("<iframe src=' ", 'map3.html', " ' width='100%' height='300'","/>"))


# ��aretler de�i�tirilmek istenirse;
map4 <- leaflet(quakes) %>% addTiles(
) %>% addCircleMarkers(lng = quakes$long[1:10],
                       lat = quakes$lat[1:10])
saveWidget(map4, file="map4.html", selfcontained = F)
display_html(paste("<iframe src=' ", 'map4.html', " ' width='100%' height='300'","/>"))


# Pop-up ile not veya isim ekleme; 
map5 <- leaflet() %>% fitBounds(86.8, 27.9, 87, 28) %>% addTiles(
) %>% addMarkers(lng = 86.92, lat = 27.99, popup = "Mount Everest")
saveWidget(map5, file="map5.html", selfcontained = F)
display_html(paste("<iframe src=' ", 'map5.html', " ' width='100%' height='300'","/>"))


# Her bir noktay� tek tek g�ster;
map6 <- leaflet(quakes) %>% addTiles() %>% addCircleMarkers()
saveWidget(map6, file="map6.html", selfcontained = F)
display_html(paste("<iframe src=' ", 'map6.html', " ' width='100%' height='300'","/>"))


# Noktalar�n hepsini tek tek g�stermektense yo�unluklar�n� g�stermek i�i;
map7 <- leaflet(quakes) %>% addTiles() %>% addMarkers(clusterOptions = markerClusterOptions())
saveWidget(map7, file="map7.html", selfcontained = F)
display_html(paste("<iframe src=' ", 'map7.html', " ' width='100%' height='300'","/>"))


#Zoom yap�ld���nda noktalar aras�ndaki uzakl�k de�i�sin istenirse;
map8 <- leaflet(quakes) %>% addTiles() %>% addCircleMarkers(lng = quakes$long[1:5],
                                                            lat = quakes$lat[1:5]) %>% addCircles(lng = quakes$long[5:10],
                                                                                                  lat = quakes$lat[5:10], color = 'red')
# html format�nda kaydetme;
saveWidget(map8, file="map8.html", selfcontained = F)
display_html(paste("<iframe src=' ", 'map8.html', " ' width='100%' height='300'","/>"))



map9 <- leaflet() %>% addTiles() %>% addMarkers(lng = 86.92, lat = 27.99,
                                                popup = "Mount Everest") %>% addRectangles(86.9, 27.95, 87, 28.05)
saveWidget(map9, file="map9.html", selfcontained = F)
display_html(paste("<iframe src=' ", 'map9.html', " ' width='100%' height='300'","/>"))




# Bir noktay� geometrik olarak i�aretlemek istenirse;

# ilk �nce i�aretlenecek noktalar�n koordinatlar�n� i�eren bir matrix olu�turulur.
tri <- matrix(c(86.87, 27.95, 86.97, 27.95, 86.92, 28.05), ncol = 2, byrow = TRUE)

map10 <- leaflet() %>% addTiles() %>% addMarkers(lng = 86.92, lat = 27.99,
                                                 popup = "Mount Everest") %>% addPolygons(lng = tri[, 1],
                                                                                          lat = tri[, 2])
saveWidget(map10, file="map10.html", selfcontained = F)
display_html(paste("<iframe src=' ", 'map10.html', " ' width='100%' height='300'","/>"))


##############################################################


#    library(rgdal)
#    countries <- readOGR("C:/Users/Berkay ABAY/Downloads/txtfiles/wordcloud/countries.txt", "OGRGeoJSON")
#    map11 <- leaflet(countries) %>% addTiles() %>% addPolygons(weight = 1)
#    saveWidget(map11, file="map11.html", selfcontained = F)
#    display_html(paste("<iframe src=' ", 'map11.html', " ' width='100%' height='300'","/>"))


#################################################################


energy <- read.csv("/resources/data/energy.csv")
#merge the energy data frame with countries
countries <- sp::merge(countries, energy[, c(1, 3)], by = "geounit", all.x = T)
color <- colorNumeric("YlOrRd", energy$Value)
map12 <- leaflet(countries) %>% addTiles() %>% addPolygons(stroke = FALSE, 
                                                           fillColor = ~color(Value),
                                                           fillOpacity = 1) %>% addLegend("topright",
                                                                                          pal = color,
                                                                                          values = countries@data$Value,
                                                                                          title = "kWh per capita",
                                                                                          opacity = 1)

saveWidget(map12, file="map12.html", selfcontained = F)
display_html(paste("<iframe src=' ", 'map12.html', " ' width='100%' height='300'","/>"))





color <- colorFactor("Set1", countries$continent)
map13 <- leaflet(countries) %>% addTiles() %>% addPolygons(stroke = F,
                                                           fillColor = ~color(continent),
                                                           fillOpacity = 1) %>% addLegend("bottomleft",
                                                                                          pal = color,
                                                                                          values = ~continent,
                                                                                          opacity = 1,
                                                                                          title = "Continent")
saveWidget(map13, file="map13.html", selfcontained = F)
display_html(paste("<iframe src=' ", 'map13.html', " ' width='100%' height='300'","/>"))
