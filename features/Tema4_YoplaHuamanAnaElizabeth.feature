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

  Rule: HU-02 Consultar stock (RF-02)
    Como administrador
    Quiero consultar el stock de paquetes por color y tallo
    Para saber qué puedo ofrecer a los clientes

    @HU-02 @RF-02
    Scenario: Consulta de stock
      Given existen cosechas y pedidos registrados
      When consulto el stock
      Then el sistema muestra los paquetes disponibles por color y tallo
      And cada valor es lo cosechado menos lo pedido

    @HU-02 @RF-02
    Scenario: Sin stock
      Given no existen cosechas registradas
      When consulto el stock
      Then el sistema muestra 0 paquetes por color y tallo
      And muestra el mensaje "Sin stock disponible"

  Rule: HU-03 Registrar pedido (RF-03)
    Como administrador
    Quiero registrar un pedido (cliente, cantidad, colores y tallo)
    Para dejar de depender de mensajes sueltos de WhatsApp

    @HU-03 @RF-03
    Scenario: Pedido válido
      Given el cliente existe en el sistema
      When registro un pedido de 30 paquetes (15 rosados y 15 rojos)
      Then el sistema crea el pedido con estado "Pendiente"
      And genera un número único de pedido

    @HU-03 @RF-03
    Scenario: Pedido sin cliente
      Given estoy registrando un pedido
      When intento guardarlo sin elegir cliente
      Then el sistema no guarda el pedido
      And muestra "Seleccione un cliente"

  Rule: HU-04 Registrar cliente mayorista (RF-04)
    Como administrador
    Quiero registrar a cada cliente mayorista (nombre, teléfono, ciudad)
    Para contactarlo rápido y ligarlo a sus pedidos

    @HU-04 @RF-04
    Scenario: Cliente válido
      Given estoy en la pantalla de clientes
      When registro un cliente con nombre "Florería Norte", teléfono 987654321 y ciudad Chiclayo
      Then el sistema guarda el cliente
      And queda disponible para elegirlo en un pedido

  Rule: HU-05 Estado del pedido (RF-05)
    Como administrador
    Quiero ver y cambiar el estado del pedido (Pendiente, Enviado, Entregado)
    Para saber qué pedidos faltan enviar

    @HU-05 @RF-05
    Scenario: Cambio de estado
      Given un pedido en estado "Pendiente"
      When registro que fue entregado al bus
      Then el estado cambia a "Enviado"
      And queda guardada la fecha del cambio

    @HU-05 @RF-05
    Scenario: Retroceso de estado
      Given un pedido en estado "Entregado"
      When intento cambiarlo a "Pendiente"
      Then el sistema no cambia el estado
      And muestra "No se puede retroceder el estado"

  Rule: HU-07 Total automático del pedido (RF-07)
    Como administrador
    Quiero que el sistema calcule el total según tallo (50cm S/20, 60cm S/23, 70-90cm S/26)
    Para evitar errores de cobro

    @HU-07 @RF-07
    Scenario: Cálculo del total
      Given un pedido con 10 paquetes de tallo 50cm y 5 de tallo 70cm
      When el sistema calcula el total
      Then el total es S/ 330 (10 x 20 + 5 x 26)

    @HU-07 @RF-07
    Scenario: Tallo sin tarifa
      Given un pedido con 5 paquetes de tallo 40cm
      When el sistema calcula el total
      Then el sistema no calcula el total
      And muestra "Tallo sin tarifa definida"

  Rule: HU-08 Registrar pagos (RF-08)
    Como socio
    Quiero registrar los pagos recibidos por pedido
    Para saber cuánto me debe cada cliente

    @HU-08 @RF-08
    Scenario: Pago parcial
      Given un pedido con total S/ 330
      When registro un pago de S/ 200
      Then el saldo pendiente es S/ 130
      And el pedido figura como "Pago parcial"

    @HU-08 @RF-08
    Scenario: Pago mayor al saldo
      Given un pedido con saldo pendiente S/ 130
      When registro un pago de S/ 150
      Then el sistema no registra el pago
      And muestra "El pago excede el saldo pendiente"
