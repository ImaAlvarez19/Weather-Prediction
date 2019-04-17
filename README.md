# Weather-Prediction

## Problemática
En una galaxia existen tres civilizaciones en sus respectivos planetas: Vulcanos, Ferengis y Betasoides.
Dominan la predicción del clima mediante un complejo sistema informático.
Cada planeta tiene las siguientes características:

- El **Ferengi**, se desplaza con una velocidad angular de 1 grados/día en sentido
horario. Su distancia con respecto al sol es de 500Km.
- El **Betasoide**, se desplaza con una velocidad angular de 3 grados/día en sentido
horario. Su distancia con respecto al sol es de 2000Km.
- El **Vulcano**, se desplaza con una velocidad angular de 5 grados/día en sentido
anti-horario. Su distancia con respecto al sol es de 1000Km.
Tener en cuenta que todas las órbitas son circulares.

## Predicciones

- Cuando los tres planetas están alineados entre sí y a su vez alineados con respecto al sol, el sistema solar se encuentra en un periodo de sequía.
- Cuando los tres planetas forma un triangulo entre sí y el sol se encuentra dentro del mismo, el sistema solar se encuentra en un periodo de lluivia.
- Cuando se encuentra en un período de lluvía, el máximo perímetro formado por por el triángulo determina que será el máximo pico de intensidad de lluvia.
- Cuando los 3 planetas esán alineados entre sí pero no con respecto al sol, el sistema solar se encuentra en un periodo de óptimas condiciones de presión y temperatura.

## Objetivos
- Predecir las siguientes condiciones del clima para los proximos diez años:
  - ¿Cuántos periodos de sequía habrá?
  - ¿Cuántos periodos de lluvia habrá?
  - ¿Qué día será el pico máximo de lluvia?
  - ¿Cuántos periodos de condiciones óptimas de presión y temperatura habrá?
 - Generar un modelo de datos para almacenar las predicciones climáticas para los próximos 10 años.
 - Implementar un API Rest para la consulta de la predicción del clima para un dia particualr.
 - Hostear el modelo de datos y la API REST en un cloud computing libre.
 
 ## Precondiciones del sistema
 - Un año está conformado por 360 días.
 - El dia inicial es el dia 0 (cero).
 - En el caso que los planetas no cumplen con las condiciones de ninguna de las predicciones dadas, se asume que no hay ningun evento meteorológico y el sistema solar se encuentra en un estado "Normal".
 
 ## Tests
 Se implementaron los tests con la gema [Rspec](https://github.com/rspec/rspec-rails/) ejecutando el comando ```rspec```
 
 ## Version
 - Ruby 2.60
 - Rails 5.2.3
 
 
