DROP DATABASE IF EXISTS SaboresMundo;
CREATE DATABASE SaboresMundo;
USE SaboresMundo;

CREATE TABLE ROLES (
  ID_rol INT NOT NULL AUTO_INCREMENT,
  Nom_rol VARCHAR(50) NOT NULL,
  CONSTRAINT pk_roles PRIMARY KEY (ID_rol),
  CONSTRAINT uq_roles_nombre UNIQUE (Nom_rol)
);

CREATE TABLE COMENTARIOS (
  ID_comentario INT NOT NULL AUTO_INCREMENT,
  Contenido TEXT NOT NULL,
  Fecha DATE NOT NULL,
  CONSTRAINT pk_comentarios PRIMARY KEY (ID_comentario)
);

CREATE TABLE PAISES (
  ID_pais INT NOT NULL AUTO_INCREMENT,
  Nom_pais VARCHAR(50) NOT NULL,
  CONSTRAINT pk_paises PRIMARY KEY (ID_pais),
  CONSTRAINT uq_paises_nombre UNIQUE (Nom_pais)
);

CREATE TABLE CATEGORIAS (
  ID_categ INT NOT NULL AUTO_INCREMENT,
  Nom_categ VARCHAR(50) NOT NULL,
  CONSTRAINT pk_categorias PRIMARY KEY (ID_categ),
  CONSTRAINT uq_categorias_nombre UNIQUE (Nom_categ)
);

CREATE TABLE INGREDIENTES (
  ID_ingrediente INT NOT NULL AUTO_INCREMENT,
  Nom_ingrediente VARCHAR(100) NOT NULL,
  CONSTRAINT pk_ingredientes PRIMARY KEY (ID_ingrediente)
);

CREATE TABLE UNIDADES (
  ID_unidad INT NOT NULL AUTO_INCREMENT,
  Nom_unidad VARCHAR(50) NOT NULL,
  CONSTRAINT pk_unidades PRIMARY KEY (ID_unidad),
  CONSTRAINT uq_unidades_nombre UNIQUE (Nom_unidad)
);

CREATE TABLE ETIQUETAS (
  ID_etiqueta INT NOT NULL AUTO_INCREMENT,
  Nombre VARCHAR(50) NOT NULL,
  CONSTRAINT pk_etiquetas PRIMARY KEY (ID_etiqueta),
  CONSTRAINT uq_etiquetas_nombre UNIQUE (Nombre)
);

CREATE TABLE USUARIOS (
  ID_usuar INT NOT NULL AUTO_INCREMENT,
  Nombre VARCHAR(100) NOT NULL,
  Mail VARCHAR(100) NOT NULL,
  Passwd VARCHAR(100) NOT NULL,
  Fecha_registro DATE NOT NULL,
  ID_rol INT NOT NULL,
  CONSTRAINT pk_usuarios PRIMARY KEY (ID_usuar),
  CONSTRAINT uq_usuarios_mail UNIQUE (Mail),
  CONSTRAINT fk_usuarios_roles FOREIGN KEY (ID_rol) REFERENCES ROLES(ID_rol)
);

CREATE TABLE RECETAS (
  ID_receta INT NOT NULL AUTO_INCREMENT,
  Titulo VARCHAR(150) NOT NULL,
  Tiempo_prepa INT NOT NULL,
  Fecha_prepa DATE NOT NULL,
  Dificultad ENUM('Fácil', 'Media', 'Difícil') NOT NULL,
  Descripcion TEXT NOT NULL,
  ID_usuario INT NOT NULL,
  ID_comentario INT NOT NULL,
  ID_categoria INT NOT NULL,
  ID_pais INT NOT NULL,
  CONSTRAINT pk_recetas PRIMARY KEY (ID_receta),
  CONSTRAINT fk_recetas_usuario FOREIGN KEY (ID_usuario) REFERENCES USUARIOS(ID_usuar),
  CONSTRAINT fk_recetas_comentario FOREIGN KEY (ID_comentario) REFERENCES COMENTARIOS(ID_comentario),
  CONSTRAINT fk_recetas_categoria FOREIGN KEY (ID_categoria) REFERENCES CATEGORIAS(ID_categ),
  CONSTRAINT fk_recetas_pais FOREIGN KEY (ID_pais) REFERENCES PAISES(ID_pais)
);


CREATE TABLE INGREDIENTE_RECETAS (
  ID_receta INT NOT NULL,
  ID_ingrediente INT NOT NULL,
  ID_unidad INT NOT NULL,
  Cantidad DECIMAL(6,2) NOT NULL,
  CONSTRAINT pk_ingrediente_recetas PRIMARY KEY (ID_receta, ID_ingrediente, ID_unidad),
  CONSTRAINT fk_ir_receta FOREIGN KEY (ID_receta) REFERENCES RECETAS(ID_receta),
  CONSTRAINT fk_ir_ingrediente FOREIGN KEY (ID_ingrediente) REFERENCES INGREDIENTES(ID_ingrediente),
  CONSTRAINT fk_ir_unidad FOREIGN KEY (ID_unidad) REFERENCES UNIDADES(ID_unidad)
);

CREATE TABLE ETIQUETAS_RECETAS (
  ID_receta INT NOT NULL,
  ID_etiqueta INT NOT NULL,
  CONSTRAINT pk_etiquetas_recetas PRIMARY KEY (ID_receta, ID_etiqueta),
  CONSTRAINT fk_er_receta FOREIGN KEY (ID_receta) REFERENCES RECETAS(ID_receta),
  CONSTRAINT fk_er_etiqueta FOREIGN KEY (ID_etiqueta) REFERENCES ETIQUETAS(ID_etiqueta)
);



INSERT INTO ROLES (ID_rol, Nom_rol) VALUES
(1, 'Administrador'),
(2, 'Editor'),
(3, 'Usuario'),
(4, 'Invitado'),
(5, 'Chef'),
(6, 'Cocinero'),
(7, 'Moderador'),
(8, 'Analista'),
(9, 'Diseñador'),
(10, 'Probador');

INSERT INTO COMENTARIOS (ID_comentario, Contenido, Fecha) VALUES
(1, 'Excelente receta, muy fácil de seguir.', '2024-04-01'),
(2, 'Me encantó el sabor, la volveré a hacer.', '2024-04-02'),
(3, 'Muy buena, pero tardé más tiempo del indicado.', '2024-04-03'),
(4, 'No me gustó mucho el resultado.', '2024-04-04'),
(5, 'Fácil y sabrosa.', '2024-04-05'),
(6, 'Perfecta para una cena rápida.', '2024-04-06'),
(7, 'Necesita más sal a mi gusto.', '2024-04-07'),
(8, 'Mis hijos la amaron.', '2024-04-08'),
(9, 'La presentación quedó genial.', '2024-04-09'),
(10, 'La usaré para mi canal de cocina.', '2024-04-10');


INSERT INTO PAISES (ID_pais, Nom_pais) VALUES
(1, 'México'),
(2, 'Italia'),
(3, 'España'),
(4, 'India'),
(5, 'Japón'),
(6, 'Perú'),
(7, 'Francia'),
(8, 'Argentina'),
(9, 'Estados Unidos'),
(10, 'China');

INSERT INTO CATEGORIAS (ID_categ, Nom_categ) VALUES
(1, 'Desayuno'),
(2, 'Almuerzo'),
(3, 'Cena'),
(4, 'Postre'),
(5, 'Entrada'),
(6, 'Sopa'),
(7, 'Vegetariano'),
(8, 'Rápida'),
(9, 'Saludable'),
(10, 'Bebidas');

INSERT INTO INGREDIENTES (ID_ingrediente, Nom_ingrediente) VALUES
(1, 'Harina'),
(2, 'Azúcar'),
(3, 'Huevos'),
(4, 'Leche'),
(5, 'Sal'),
(6, 'Aceite de oliva'),
(7, 'Ajo'),
(8, 'Cebolla'),
(9, 'Pollo'),
(10, 'Tomate');

INSERT INTO UNIDADES (ID_unidad, Nom_unidad) VALUES
(1, 'gramos'),
(2, 'mililitros'),
(3, 'tazas'),
(4, 'cucharadas'),
(5, 'cucharaditas'),
(6, 'litros'),
(7, 'piezas'),
(8, 'unidades'),
(9, 'porciones'),
(10, 'rebanadas');


INSERT INTO ETIQUETAS (ID_etiqueta, Nombre) VALUES
(1, 'Sin gluten'),
(2, 'Vegana'),
(3, 'Rápida'),
(4, 'Económica'),
(5, 'Gourmet'),
(6, 'Casera'),
(7, 'Internacional'),
(8, 'Dulce'),
(9, 'Picante'),
(10, 'Navideña');

INSERT INTO USUARIOS (ID_usuar, Nombre, Mail, Passwd, Fecha_registro, ID_rol) VALUES
(1, 'Juan Pérez', 'juan@example.com', 'clave123', '2024-01-01', 1),
(2, 'Ana López', 'ana@example.com', 'clave456', '2024-01-02', 2),
(3, 'Carlos García', 'carlos@example.com', 'clave789', '2024-01-03', 3),
(4, 'Lucía Méndez', 'lucia@example.com', 'clave111', '2024-01-04', 4),
(5, 'Pedro Gómez', 'pedro@example.com', 'clave222', '2024-01-05', 5),
(6, 'Laura Ruiz', 'laura@example.com', 'clave333', '2024-01-06', 6),
(7, 'Sofía Torres', 'sofia@example.com', 'clave444', '2024-01-07', 7),
(8, 'Luis Martínez', 'luis@example.com', 'clave555', '2024-01-08', 8),
(9, 'Valentina Díaz', 'valen@example.com', 'clave666', '2024-01-09', 9),
(10, 'Mateo Herrera', 'mateo@example.com', 'clave777', '2024-01-10', 10);


INSERT INTO RECETAS (
  ID_receta, Titulo, Tiempo_prepa, Fecha_prepa, Dificultad, Descripcion,
  ID_usuario, ID_comentario, ID_categoria, ID_pais
) VALUES
(1, 'Tacos al Pastor', 30, '2024-04-01', 'Media', 'Receta tradicional mexicana', 1, 1, 2, 1),
(2, 'Pizza Margarita', 40, '2024-04-02', 'Fácil', 'Receta clásica italiana', 2, 2, 3, 2),
(3, 'Paella Valenciana', 60, '2024-04-03', 'Difícil', 'Paella con mariscos y verduras', 3, 3, 3, 3),
(4, 'Curry de Pollo', 50, '2024-04-04', 'Media', 'Curry con leche de coco', 4, 4, 2, 4),
(5, 'Sushi de salmón', 45, '2024-04-05', 'Difícil', 'Sushi fresco con arroz y salmón', 5, 5, 3, 5),
(6, 'Causa Limeña', 35, '2024-04-06', 'Fácil', 'Plato frío con papa y atún', 6, 6, 4, 6),
(7, 'Crepas dulces', 20, '2024-04-07', 'Fácil', 'Postre francés clásico', 7, 7, 4, 7),
(8, 'Milanesa', 30, '2024-04-08', 'Media', 'Milanesa con papas', 8, 8, 2, 8),
(9, 'Hamburguesa casera', 25, '2024-04-09', 'Fácil', 'Hamburguesa con ingredientes caseros', 9, 9, 2, 9),
(10, 'Arroz frito', 15, '2024-04-10', 'Fácil', 'Arroz frito con verduras', 10, 10, 2, 10);


INSERT INTO INGREDIENTE_RECETAS (ID_receta, ID_ingrediente, ID_unidad, Cantidad) VALUES
(1, 1, 1, 250.00),
(1, 9, 7, 1.00),
(2, 1, 1, 300.00),
(2, 3, 7, 2.00),
(3, 10, 1, 150.00),
(3, 5, 5, 1.00),
(4, 9, 7, 2.00),
(4, 7, 4, 1.00),
(5, 4, 2, 100.00),
(5, 3, 7, 1.00);


INSERT INTO ETIQUETAS_RECETAS (ID_receta, ID_etiqueta) VALUES
(1, 4),
(2, 3),
(3, 7),
(4, 9),
(5, 1),
(6, 2),
(7, 8),
(8, 6),
(9, 5),
(10, 10);



-- CONSULTAS --

SELECT Nombre FROM USUARIOS;

SELECT Titulo, Descripcion FROM RECETAS;

SELECT Nom_pais FROM PAISES;

SELECT Titulo, Dificultad FROM RECETAS
WHERE Dificultad = 'Fácil';

SELECT RECETAS.Titulo, RECETAS.Descripcion, PAISES.Nom_pais
FROM RECETAS
JOIN PAISES ON RECETAS.ID_pais = PAISES.ID_pais
WHERE PAISES.Nom_pais = 'México';

SELECT USUARIOS.Nombre, RECETAS.Titulo, COMENTARIOS.Contenido
FROM RECETAS
JOIN USUARIOS ON RECETAS.ID_usuario = USUARIOS.ID_usuar
JOIN COMENTARIOS ON RECETAS.ID_comentario = COMENTARIOS.ID_comentario;

SELECT 
RECETAS.Titulo AS Receta, 
CATEGORIAS.Nom_categ AS Categoria
FROM RECETAS
INNER JOIN CATEGORIAS ON RECETAS.ID_categoria = CATEGORIAS.ID_categ
WHERE CATEGORIAS.Nom_categ = 'Postre';

SELECT Titulo, Tiempo_prepa FROM RECETAS
WHERE Tiempo_prepa < 30;

SELECT Titulo, Fecha_prepa FROM RECETAS
WHERE Fecha_prepa > '2024-04-05';


SELECT Nombre FROM ETIQUETAS
WHERE Nombre = 'Casera';

SELECT RECETAS.Titulo, ETIQUETAS.Nombre
FROM RECETAS
JOIN ETIQUETAS_RECETAS ON RECETAS.ID_receta = ETIQUETAS_RECETAS.ID_receta
JOIN ETIQUETAS ON ETIQUETAS_RECETAS.ID_etiqueta = ETIQUETAS.ID_etiqueta;




