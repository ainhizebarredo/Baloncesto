library(dplyr)

df<-read.csv('game_scores.csv')
str(df)
summary(df)
character <- df %>% select_if(is.character)
apply(character, 2, table)
summary(df %>% select_if(is.numeric))


#1.Equipos con mÃ¡s puntos y menos puntos marcados en casa en una determinada temporada
x <- function (temporada="") {

  equipo<- df%>%
    filter(SEASON == temporada)%>%
    group_by(HOME)%>%
    summarise(total_puntos = (HOME_PTS))%>%
    arrange(desc(total_puntos))
  
  equipo_mas<-equipo[1,1]
  
  puntos_casa_temp <- arrange(equipo, total_puntos)
  
  equipo_min <- puntos_casa_temp[1,1]
  
  list(paste0("En la temporada ", temporada, " el quipo con mas puntos en casa fue ", equipo_mas, " y el que consiguio menos fue ", equipo_min))
}

x("2018-19")


#2.Introduciendo una temporada, Â¿quÃ© equipo ha ganado mÃ¡s partidos?

u <- function (temporada="") {
  equipo<- df%>%
    filter(SEASON == temporada)%>%
    group_by(HOME)%>%
    summarise(partidos_casa=sum(W_HOME), partidos_fuera=sum(W_AWAY))
  
  partidos$total<-partidos$partidos_casa + partidos$partidos_fuera
  ordenado<-partidos%>%
    arrange(desc(total))
  ganador<-ordenado[1,1]
  
  paste0('En la temporada ', temporada, ' el equipo que más partidos ha ganado ha sido ', ganador )
}

u("2018-19")

#3.Con el nombre de un equipo, Â¿quÃ© tempoarada gano mÃ¡s partidos?

z<- function(equipo=''){
  x<- df%>%
    group_by(HOME,SEASON)%>%
    summarise(partidos_casa=sum(W_HOME), partidos_fuera=sum(W_AWAY))
  x$total<-partidos$partidos_casa + partidos$partidos_fuera
  temporada<-x%>%
    filter(HOME==equipo)%>%
    arrange(desc(total))
  temporada_ganador<-temporada[1,2]
  paste0('Los ', equipo, ' en la temporada', temporada_ganador )
  
}
z('76ers')
