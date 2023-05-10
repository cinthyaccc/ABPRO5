use telovendohorario;
#Parte 2: Crear dos tablas.
CREATE TABLE usuarios (
  id_usuario INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(50) NOT NULL,
  apellido VARCHAR(50) NOT NULL,
  contraseña VARCHAR(50) NOT NULL,
  zona_horaria VARCHAR(50) DEFAULT 'UTC-3',
  género ENUM('Masculino', 'Femenino', 'Otro') NOT NULL,
  teléfono VARCHAR(20) NOT NULL
);
CREATE TABLE ingresos (
  id_ingreso INT PRIMARY KEY AUTO_INCREMENT,
  id_usuario INT NOT NULL,
  fecha_hora_ingreso DATETIME DEFAULT NOW(),
  FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);

#Parte 3: Modificación de la tabla - Modifique el UTC por defecto. Desde UTC-3 a UTC-2.
ALTER TABLE usuarios MODIFY zona_horaria VARCHAR(50) DEFAULT 'UTC-2';

#Parte 4: Creación de registros. - Para cada tabla crea 8 registros.

#Para la tabla "usuarios"
INSERT INTO usuarios (nombre, apellido, contraseña, género, teléfono) 
VALUES 
('Juan', 'Pérez', 'password1', 'Masculino', '12345678'),
('María', 'García', 'password2', 'Femenino', '87654321'),
('Pedro', 'Ramírez', 'password3', 'Masculino', '55555555'),
('Ana', 'Martínez', 'password4', 'Femenino', '44444444'),
('Luis', 'Rodríguez', 'password5', 'Masculino', '33333333'),
('Lucía', 'López', 'password6', 'Femenino', '22222222'),
('Jorge', 'Sánchez', 'password7', 'Masculino', '11111111'),
('Marta', 'Fernández', 'password8', 'Femenino', '99999999');

#Para la tabla "ingresos"
INSERT INTO ingresos (id_usuario) VALUES (1), (2), (3), (4), (5), (6), (7), (8);

#Parte 5: Justifique cada tipo de dato utilizado. ¿Es el óptimo en cada caso?
# RE: Se determina la forma átomica de cada uno de los datos ingresados, siendo el tipo de dato más óptimo para cada uno de ellos.

#Parte 6: Creen una nueva tabla llamada Contactos (id_contacto, id_usuario, numero de telefono, correo electronico).
CREATE TABLE Contactos (
  id_contacto INT PRIMARY KEY AUTO_INCREMENT,
  id_usuario INT NOT NULL,
  teléfono VARCHAR(20) NOT NULL,
  correo_electronico VARCHAR(50) NOT NULL,
  FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);

#Parte 7: Modifique la columna teléfono de contacto, para crear un vínculo entre la tabla Usuarios y la tabla Contactos.
ALTER TABLE usuarios ADD COLUMN id_contacto INT DEFAULT NULL, ADD FOREIGN KEY (id_contacto) REFERENCES contactos(id_contacto);

#Integrantes: Juan Barrientos(https://github.com/JuanC4m1l0B), Cinthya Caldera(https://github.com/cinthyaccc), Sebastián Fernández(https://github.com/SebastianFdezT/EjercicioGrupal5_M-dulo3) y Omar Sepúlveda(https://github.com/OmarSepulveda1/Ejercicio-grupal-5-Mysql).