@ECOFLOR @Sprint1
Feature: Backlog ECOFLOR, criterios de aceptación de las historias clave
  Criterios de aceptación en Gherkin de 7 historias de usuario (13 escenarios).
  Cada Rule corresponde a una historia HU-nn y a su requisito RF-nn.

  Rule: HU-01 Registrar cosecha (RF-01)
    Como cosechador
    Quiero registrar los paquetes cosechados por color y tamaño de tallo
    Para saber cuánto se produce cada día

    @HU-01 @RF-01
    Scenario: Registro válido de cosecha
      Given soy un trabajador autorizado y estoy en la pantalla de cosecha
      When registro 10 paquetes de rosas rojas de tallo 60cm
      Then el sistema guarda el registro con fecha y hora
      And el stock de rojas 60cm aumenta en 10 paquetes

    @HU-01 @RF-01
    Scenario: Cantidad inválida
      Given estoy en la pantalla de cosecha
      When ingreso una cantidad de 0 o negativa
      Then el sistema no guarda el registro
      And muestra el mensaje "La cantidad debe ser mayor a 0"

