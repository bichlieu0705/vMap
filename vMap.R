library(raster)
library(ggplot2)
library(maps)
library(mapdata)
library(manipulate)
library(lubridate)
library(rgdal)
library(raster)
library(dplyr)

world<-map_data("world")
vietnam<-subset(world, region %in% c("Vietnam","Cambodia", "Laos", "China", "Thailand"))


# Downloaded river data from http://www.diva-gis.org
# Note the absolute path below
# Read in the streams data

#polyStreams<-readOGR("/Users/mac/Dropbox/SEDES Workshop/vMap/VNM_wat/VNM_water_lines_dcw.shp","VNM_water_lines_dcw")
#polyStreamsdf<-fortify(polyStreams)
#which rivers are named?
#levels(polyStreams$NAM)

#https://stackoverflow.com/questions/5831794/opposite-of-in
#'%!in%' <- function(x,y)!('%in%'(x,y))

#majorRivers<-subset(polyStreams, NAM %!in% c("UNK" ))
#polyStreamsdf<-fortify(majorRivers)
#tibble<-tbl_df(polyStreamsdf)
#reduced<- tibble %>% group_by(group) %>% count(group) %>% filter (n >= 20) %>% left_join(tibble)

#One source
  #rivers<-map_data("rivers")
  #riversSub<-rivers %>% filter(long > xmin) %>% filter(long< xmax) %>% 
  # filter(lat < ymax) %>% filter(lat > ymin)
  
xmin<-102
xmax<-110
ymin<-8
ymax<-25

ggplot() + 
  geom_polygon(data = vietnam, aes(x=long, y = lat, group = group), fill = NA, color = "black") + 
 # geom_path(data = polyStreamsdf, 
  #         aes(x = long, y = lat, group = group),
   #         color = 'black', size = .1)+
  xlab("Longitude")+
  ylab("Latitude")+
  theme_classic()+
  theme(axis.text=element_text(size=10, family="Times"),
        axis.title=element_text(size=12, face="bold", family="Times")) +
  coord_fixed(1) +
  #xlim(102, 110)+ylim(8,25)+
  coord_fixed(xlim = c(xmin, xmax), ylim = c(ymin, ymax))