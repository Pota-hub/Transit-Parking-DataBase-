/* en el siguiente modelo relacional sql de la manera "Etidad:Atributos,..;": 
'''
Agente:IDAgente,Nombre,apellido,numero de registro;
Casa Autimotriz:ID casa automotriz,Nombre,Direccion;
Expediente:ID Expediente,NIT,ID Multa;
Marca:ID Marca, Nombre,id_Punto_de_venta;
Multa:IDMulta,placa,ID agente,Importe,Direccion de infraccion,fecha,Id Expediente;
Model: ID modelo,Nombre, Potencia,ID marca;
Persona infractora: ID,nombre,apellido,fecha de nacimiento,direccion completa;
propietaro: NIT,nombre,apellidos,fecha de nacimiento,domicilio completo;
vehiculo:placa ,fecha de matricula,Id modelo,propietario.Id;
'''

y sus relaciones escritas de la manera < tipo Entidad.Campo,Entidad.Campo >
---
1:N Propietario.NIT,Vehiculo.IDPropietario
1:N Marca.IDMarca,Modelo.IDmarca
1:N Casa Automotriz.IDcasaAutomotriz,Marca.Punto de 
1:N Vehiculo.IdModelo,modelo.IDModelo
1:N Multa .IDMulta, Expediente.IdMulta
1:N PersonaInfractora.NIT, Expediente.NIT
1:N Agente.IDAgente, Multa.IdAgente
---
Se Crean las siguientes sentencias, comentando su proposito.
6 sentencias - INSERT
2 sentencias - UPDATE
1 sentencias - DELETE
2 sentencias - SELECT - WHERE
4 sentencias - SELECT (Join)
5 sentencias - SELECT (Alias)

SENTENCIAS: 
*/
INSERT INTO Agente (IDAgente, Nombre, Apellido, NumeroDeRegistro) 
VALUES (1, 'John', 'Smith', 12345);

-- Propósito: Inserta un nuevo agente en la tabla "Agente" con sus respectivos atributos.

INSERT INTO CasaAutomotriz (IDCasaAutomotriz, Nombre, Direccion) 
VALUES (1, 'Swift Autos', '123 Main Street');

-- Propósito: Inserta una nueva casa automotriz en la tabla "CasaAutomotriz" con sus respectivos atributos.

INSERT INTO Expediente (IDExpediente, NIT, IDMulta) 
VALUES (1, '123456789', 'M123');

-- Propósito: Inserta un nuevo expediente en la tabla "Expediente" con sus respectivos atributos.

UPDATE Marca 
SET PuntoDeVenta = '001' 
WHERE IDMarca = 1;

-- Propósito: Actualiza el punto de venta de una marca específica en la tabla "Marca".

UPDATE Vehiculo 
SET FechaDeMatricula = '2023-01-01' 
WHERE Placa = 'ABC123';

-- Propósito: Actualiza la fecha de matrícula de un vehículo específico en la tabla "Vehiculo".

DELETE FROM Multa 
WHERE IDMulta = 1;

-- Propósito: Elimina una multa específica de la tabla "Multa".

SELECT * 
FROM PersonaInfractora 
WHERE NIT = '123456789';

-- Propósito: Selecciona todos los campos de la tabla "PersonaInfractora" donde el NIT sea igual a '123456789'.

SELECT M.IDMulta, M.Placa, P.Nombre, P.Apellido
FROM Multa M
JOIN PersonaInfractora P ON M.NIT = P.NIT;

-- Propósito: Selecciona el ID de multa, placa y los nombres y apellidos de las personas infractoras de la tabla "Multa" y "PersonaInfractora" respectivamente, donde los NIT coincidan.

SELECT A.Nombre AS NombreAgente, M.Importe, E.IDExpediente
FROM Agente A
JOIN Multa M ON A.IDAgente = M.IDAgente
JOIN Expediente E ON M.IDExpediente = E.IDExpediente;

-- Propósito: Selecciona el nombre del agente, el importe de la multa y el ID del expediente de las tablas "Agente", "Multa" y "Expediente" respectivamente, utilizando alias para los campos seleccionados.

SELECT C.Nombre AS CasaAutomotriz, M.Nombre AS Marca, MO.Nombre AS Modelo
FROM CasaAutomotriz C
JOIN Marca M ON C.IDCasaAutomotriz = M.IDCasaAutomotriz
JOIN Modelo MO ON M.IDMarca = MO.IDMarca;

-- Propósito: Selecciona el nombre de la casa automotriz, el nombre de la marca y el nombre del modelo de las tablas "CasaAutomotriz", "Marca" y "Modelo" respectivamente, utilizando alias para los campos seleccionados.


INSERT INTO Agente (IDAgente, Nombre, Apellido, NumeroDeRegistro)
VALUES (1, 'John', 'Smith', 12345);

-- Propósito: Inserta un nuevo agente en la tabla "Agente" con sus respectivos atributos.

INSERT INTO CasaAutomotriz (IDCasaAutomotriz, Nombre, Direccion)
VALUES (1, 'Swift Autos', '123 Main Street');

-- Propósito: Inserta una nueva casa automotriz en la tabla "CasaAutomotriz" con sus respectivos atributos.

INSERT INTO Expediente (IDExpediente, NIT, IDMulta)
VALUES (1, '123456789', 'M123');

-- Propósito: Inserta un nuevo expediente en la tabla "Expediente" con sus respectivos atributos.

INSERT INTO Marca (IDMarca, Nombre, PuntoDeVenta)
VALUES (1, 'Ford', '001');

-- Propósito: Inserta una nueva marca en la tabla "Marca" con sus respectivos atributos.

INSERT INTO Multa (IDMulta, Placa, IDAgente, Importe, DireccionDeInfraccion, Fecha, IDExpediente)
VALUES (1, 'ABC123', 1, 100, '123 Main Street', '2023-05-10', 1);

-- Propósito: Inserta una nueva multa en la tabla "Multa" con sus respectivos atributos.

INSERT INTO Modelo (IDModelo, Nombre, Potencia, IDMarca)
VALUES (1, 'Sedan A', 150, 1);

-- Propósito: Inserta un nuevo modelo en la tabla "Modelo" con sus respectivos atributos.

INSERT INTO PersonaInfractora (ID, Nombre, Apellido, FechaDeNacimiento, DireccionCompleta)
VALUES (1, 'Laura', 'García', '1985-07-15', 'Calle 123, Ciudad XYZ');

-- Propósito: Inserta una nueva persona infractora en la tabla "PersonaInfractora" con sus respectivos atributos.

INSERT INTO Propietario (NIT, Nombre, Apellidos, FechaDeNacimiento, DomicilioCompleto)
VALUES ('123456789', 'Carlos', 'Ramírez', '1980-12-28', 'Calle 456, Ciudad XYZ');

-- Propósito: Inserta un nuevo propietario en la tabla "Propietario" con sus respectivos atributos.

INSERT INTO Vehiculo (Placa, FechaDeMatricula, IDModelo, IDPropietario)
VALUES ('ABC123', '2022-01-01', 1, '123456789');

-- Propósito: Inserta un nuevo vehículo en la tabla "Vehiculo" con sus respectivos atributos.