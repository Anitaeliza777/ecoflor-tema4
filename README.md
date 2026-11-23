# ECOFLOR: backlog, criterios de aceptación y priorización (Tema 4)

Entrega del laboratorio del Tema 4 del curso **CIIN1322P: Modelado y Desarrollo de Aplicaciones** (Universidad Privada del Norte, 2026-2). ECOFLOR es una cooperativa de viveros de rosas de Baños del Inca, Cajamarca. El **objetivo del Sprint 1** es registrar cosechas y pedidos de rosas con el total de cobro correcto.

**Versión:** `v1.0-tema4`  
**Autora:** Ana Elizabeth Yopla Huamán

## Enlaces

| Recurso | Enlace |
| --- | --- |
| Tablero Kanban en GitHub Projects (público) | [ECOFLOR Sprint 1](https://github.com/users/Anitaeliza777/projects/1) |
| Repositorio GitHub | [ecoflor-tema4](https://github.com/Anitaeliza777/ecoflor-tema4) |
| Informe (PDF) | [docs/Tema4_YoplaHuamanAnaElizabeth.pdf](docs/Tema4_YoplaHuamanAnaElizabeth.pdf) |
| Criterios Gherkin (13 escenarios) | [features/Tema4_YoplaHuamanAnaElizabeth.feature](features/Tema4_YoplaHuamanAnaElizabeth.feature) |
| Matriz WSJF y MoSCoW | [planning/Tema4_WSJF_matriz.xlsx](planning/Tema4_WSJF_matriz.xlsx) |

## Estructura

```
docs/        Informe en PDF y captura del tablero Kanban
features/    Criterios de aceptación en Gherkin (Cucumber o Behave)
planning/    Matriz de priorización WSJF (.xlsx, con fórmulas)
```

## Trazabilidad HU / RF

Cada historia HU-nn deriva del requisito funcional RF-nn del mismo número. WSJF = CoD / tamaño.

| HU | RF | Historia (resumen) | Tamaño | WSJF | MoSCoW | Escenarios Gherkin | Estado inicial |
| --- | --- | --- | --- | --- | --- | --- | --- |
| HU-01 | RF-01 | Registrar cosecha por color y tallo | 3 | 7.00 | Must | 2 (válido, cantidad inválida) | Sprint 1 |
| HU-02 | RF-02 | Consultar stock por color y tallo | 2 | 6.50 | Must | 2 (consulta, sin stock) | Sprint 1 |
| HU-03 | RF-03 | Registrar pedido | 5 | 5.80 | Must | 2 (válido, sin cliente) | Sprint 1 |
| HU-04 | RF-04 | Registrar cliente mayorista | 2 | 4.00 | Should | 1 (cliente válido) | Sprint 1 |
| HU-05 | RF-05 | Estado del pedido | 3 | 3.67 | Should | 2 (cambio, retroceso) | Backlog |
| HU-06 | RF-06 | Registrar envío por bus | 3 | 3.33 | Should | 0 | Backlog |
| HU-07 | RF-07 | Total automático según tallo | 2 | 9.00 | Must | 2 (cálculo, tallo sin tarifa) | Sprint 1 |
| HU-08 | RF-08 | Registrar pagos por pedido | 5 | 3.60 | Should | 2 (pago parcial, pago excedido) | Backlog |
| HU-09 | RF-09 | Trabajadores y asistencia | 3 | 2.67 | Could | 0 | Backlog |
| HU-10 | RF-10 | Reporte semanal cosecha vs. ventas | 5 | 1.80 | Could | 0 | Backlog |
| HU-11 | RF-11 | Uso sin internet y sincronización | 13 | 1.62 | Won't | 0 | Backlog (se divide en HU-11a y HU-11b) |
| HU-12 | RF-12 | Acceso con usuario y contraseña | 5 | 2.00 | Could | 0 | Backlog |

El Sprint 1 reúne HU-07, 01, 02, 03 y 04 (14 puntos, 27 horas planificadas).

## Convención de commits

Cada commit cita el ID de la historia, como exige la Definition of Done: `tipo(HU-nn): descripción (RF-nn)`.

## Cómo ejecutar los criterios

Los escenarios están en Gherkin estándar (un `Feature` con siete `Rule`, una por historia). Son compatibles con Cucumber y Behave; aún no tienen pasos implementados.
