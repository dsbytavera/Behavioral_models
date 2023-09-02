# El siguiente código contiene la simulación del aprendizaje asociativo 
# segúin el modelo Rescola Wagner... 

# En las siguientes lineas se encuentran los parametros del modelo mismos
# que pueden ser manipulados para observar el cambio en la fuerza de asociación
# en función de los ensayos. 


alpha <- 0.1 # Tasa de aprendizaje
beta <- 0.5   # Sensibilidad del estímulo (saliencia del estímulo)

# Número de ensayos de aprendizaje
n_ensayos <- 100

# Valor inicial de la fuerza de la asociación
V <- 0

# Vectores para almacenar datos
ensayos <- 1:n_ensayos
asociacion <- numeric(n_ensayos)

# Simulación del modelo de Rescorla-Wagner
for (x in 1:n_ensayos) {
  # Estímulo incondicionado (En este ejemplo siempre se presenta, pero podría
  # simularse su ausencia en algunos ensayos descomentando en la siguiente linea
  # y quitando el 1)
  U <- 1#sample(c(0, 1), size = 1)
  
  # Error de predicción
  delta <- U - V
  
  # Actualización de la fuerza de la asociación
  V <- V + alpha * beta * delta
  
  # Almacenar la fuerza de la asociación en este ensayo
  asociacion[x] <- V
}

#  Fuerza asociativa en funcion del número de ensayos
plot(ensayos, asociacion, type = "l", xlab = "Ensayo", ylab = "Fuerza Asociativa", main = "Modelo Rescorla-Wagner")
