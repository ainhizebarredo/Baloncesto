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


#3.Con el nombre de un equipo, Â¿quÃ© tempoarada gano mÃ¡s partidos?