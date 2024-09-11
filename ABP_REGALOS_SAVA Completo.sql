DROP DATABASE IF EXISTS regaloSava;
CREATE DATABASE regaloSava;
USE regaloSava;

-- Tabla de Clientes
CREATE TABLE Clientes (
  ID_Cliente INT AUTO_INCREMENT PRIMARY KEY,
  Nombre VARCHAR(100) NOT NULL,
  Apellido VARCHAR(100) NOT NULL,
  Email VARCHAR(100) NOT NULL,
  Celular VARCHAR(100),
  Direccion VARCHAR(100)
);

-- Tabla de Empleados
CREATE TABLE Empleados (
  ID_Empleado INT AUTO_INCREMENT PRIMARY KEY,
  Nombre_Apellido VARCHAR(100) NOT NULL,
  Cargo VARCHAR(45),
  Correo VARCHAR(45),
  Telefono VARCHAR(45)
);

-- Tabla de Formas de Pago
CREATE TABLE Formas_de_Pago (
  ID_Pago INT AUTO_INCREMENT PRIMARY KEY,
  Tipo_de_Pago VARCHAR(45) NOT NULL
);

-- Tabla de Promociones
CREATE TABLE Promociones (
  ID_Promociones INT AUTO_INCREMENT PRIMARY KEY,
  Nombre VARCHAR(45),
  Fecha_de_Inicio DATE,
  Fecha_de_Finalizacion DATE,
  Descuento TINYINT(2)
);

-- Tabla de Categoría de Producto
CREATE TABLE Categoria_producto (
  ID_Categoria_producto INT AUTO_INCREMENT PRIMARY KEY,
  Nombre VARCHAR(45)
);

-- Tabla de Producto
CREATE TABLE Producto (
  ID_Producto INT AUTO_INCREMENT PRIMARY KEY,
  Nombre VARCHAR(45) NOT NULL,
  Descripcion VARCHAR(100),
  Precio DECIMAL(10, 2),
  Stock INT,
  ID_Categoria INT,
  FOREIGN KEY (ID_Categoria) REFERENCES Categoria_producto(ID_Categoria_producto)
);


-- Tabla de Proveedor
CREATE TABLE Proveedor (
  ID_Proveedor INT AUTO_INCREMENT PRIMARY KEY,
  Nombre VARCHAR(45) NOT NULL,
  Telefono VARCHAR(45),
  Email VARCHAR(45),
  Direccion VARCHAR(45)
);

-- Tabla de Pedidos
CREATE TABLE Pedidos (
  ID_Pedidos INT AUTO_INCREMENT PRIMARY KEY,
  Fecha_de_Pedido DATE,
  Total DECIMAL(10, 2),
  Clientes_ID_Cliente INT,
  FOREIGN KEY (Clientes_ID_Cliente) REFERENCES Clientes(ID_Cliente)
);

-- Tabla de Detalles de Pedidos
CREATE TABLE Detalle_de_Pedido (
  ID_Detalle INT AUTO_INCREMENT PRIMARY KEY,
  Producto_ID_Producto INT,
  Pedidos_ID_Pedidos INT,
  Cantidad INT,
  Precio_Unitario DECIMAL(10, 2),
  FOREIGN KEY (Producto_ID_Producto) REFERENCES Producto(ID_Producto),
  FOREIGN KEY (Pedidos_ID_Pedidos) REFERENCES Pedidos(ID_Pedidos)
);

-- Tabla de Valoración de Producto
CREATE TABLE Valoracion_producto (
  ID_Valoracion_producto INT AUTO_INCREMENT PRIMARY KEY,
  Puntuacion INT CHECK (Puntuacion BETWEEN 1 AND 5),
  Comentario VARCHAR(255),
  Fecha_de_Valoracion DATE,
  Clientes_ID_Cliente INT,
  Producto_ID_Producto INT,
  FOREIGN KEY (Clientes_ID_Cliente) REFERENCES Clientes(ID_Cliente),
  FOREIGN KEY (Producto_ID_Producto) REFERENCES Producto(ID_Producto)
);

-- Insertar datos en la tabla producto
insert INTO Clientes values
(001, 'Mary', 'Portugal', 'mary@gmail.com', '0923459810', 'Sauces'),
(002, 'Ashley', 'Ponce', 'ashley@gmail.com', '0932517823', 'Bastión'),
(003, 'Alfredo', 'Arias', 'fredo@gmail.com', '0919839870', 'Alborada'),
(004, 'Tahis', 'Angulo', 'tahis@gmail.com', '0998379827', 'Alborada'),
(005, 'Roger', 'Briones', 'roger@gmail.com', '0909182081', 'Sauces'),
(006, 'Oswaldo', 'Apolo', 'oswaldo@gmail.com', '0904128092', 'Alborada'),
(007, 'Andrés', 'Apolo', 'andres@gmail.com', '0989368761', 'Alborada'),
(008, 'Jennifer', 'Vergara', 'jenny@gmail.com', '0978638723', 'Vía Daule'),
(009, 'Ericka', 'Yuquilema', 'eri@gmail.com', '0909818322', 'Bastión'),
(010, 'Liria', 'Baque', 'lili@gmail.com', '0900128034', 'Olmedos');


Insert INTO empleados values
(101, 'Ana Pérez', 'Asistente Administrativo', 'ana@gmail.com', '0978654321'),
(102, 'Luis Rodríguez', 'Gerente de Ventas', 'luis@gmail.com', '0981234567'),
(103, 'María Gómez', 'Diseñador', 'mariagom@gmail.com', '0998765432'),
(104, 'Laura Martínez', 'Diseñador gráfico', 'laura@gmail.com', '0912345678'),
(105, 'José García', 'Administrador de inventario', 'jose@gmail.com', '0923456789'),
(106, 'Marta Sánchez', 'Atención al cliente', 'marta@gmail.com', '0934567890'),
(107, 'Carlos Fernández', 'Desarrollador web', 'carlos@gmail.com', '0945678901'),
(108, 'Pablo Torres', 'Vendedor', 'pablo@gmail.com', '0956789012'),
(109, 'Sofía López', 'Repartidor', 'sofia@gmail.com', '0967890123'),
(110, 'Javier Ramírez', 'Coordinador de logísticas y envíos', 'javier@gmail.com', '0978901234');

INSERT INTO Formas_de_pago VALUES
(201, 'Tarjeta'),
(202, 'Efectivo'),
(203, 'Efectivo'),
(204, 'Tarjeta'),
(205, 'Tarjeta'),
(206, 'Efectivo'),
(207, 'Tarjeta'),
(208, 'Efectivo'),
(209, 'Tarjeta'),
(210, 'Tarjeta');

INSERT INTO pedidos VALUES
(301, '2023-03-15', 28.00, 3),
(302, '2024-08-07', 32.00, 5),
(303, '2024-01-22', 46.00, 9),
(304, '2023-11-10', 14.00, 10),
(305, '2023-05-05', 12.00, 2),
(306, '2024-06-19', 100.00, 1),
(307, '2023-02-12', 30.00, 7),
(308, '2023-07-28', 25.00, 4),
(309, '2024-04-30', 13.00, 8),
(310, '2024-10-17', 26.00, 6);

INSERT INTO proveedor Values
(401, 'Diego', '0987654321', 'diego@gmail.com', 'Av. Principal 123, Ciudad A'),
(402, 'Marta', '0987454665', 'martaa@gmail.com', 'Calle Secundaria 456, Ciudad B'),
(403, 'Ismael', '0952441674', 'ismail@gmail.com', 'Carr. Central 789, Ciudad C'),
(404, 'Luis', '0946564242', 'luis@gmail.com', 'Blvd. Industrial 321, Ciudad D'),
(405, 'Julián', '0998415648', 'julian@gmail.com', 'Plaza del Comercio 654, Ciudad E'),
(406, 'Pedro', '0942325545', 'pedro@gmail.com', 'Av. Tecnológica 567, Ciudad F'),
(407, 'Luisa', '0978524852', 'luisa@gmail.com', 'Calle Comercio 890, Ciudad G'),
(408, 'Carmen', '0983158910', 'carmen12@gmail.com', 'Carr. Norte 321, Ciudad H'),
(409, 'Paquita', '0992018582', 'paquita@gmail.com', 'Av. Libertad 654, Ciudad I'),
(410, 'Dolores', '0984548212', 'dolores@gmail.com', 'Calle Central 987, Ciudad J');

INSERT INTO Categoria_producto VALUES
(601,'Ramos de Flores'),
(602,'Cajas de Regalo'),
(603,'Gomitas Personalizadas'),
(604,'Artículos Especiales');
 
INSERT INTO Promociones VALUES
(701, 'Descuento de Primavera', '2024-03-01', '2024-05-31', 10),
(702, 'Oferta de Verano', '2024-06-01', '2024-08-31', 15),
(703, 'Descuento de Fin de Año', '2024-12-01', '2024-12-31', 20);

INSERT INTO producto VALUES
(501, 'Ramos Hot Wheels', 'Contiene carros hot wheels a su gusto', 22.00, 10, 604),
(502, 'Cajita de Corazón', 'Una cajita de regalo en forma de corazón con contenido personalizado', 20.00, 22, 602),
(503, 'Ramo de Flores Eternas Pequeño', 'Ramo pequeño personalizado', 15.00, 12, 601),
(504, 'Ramo de Flores Eternas Mediano', 'Ramo mediano personalizado', 20.00, 20, 601),
(505, 'Ramo de Flores Eternas Grande', 'Ramo grande personalizado', 30.00, 15, 601),
(506, 'Ramo de Flores Eternas Buchón', 'Ramo buchón personalizado', 100.00, 18, 601),
(507, 'Letras de Gomitas Pequeñas', 'Letra personalizada sin tapa, pequeña con gomitas al gusto', 9.00, 19, 603),
(508, 'Letras de Gomitas Grandes', 'Letra personalizada con tapa, grande con gomitas al gusto', 11.00, 17, 603),
(509, 'Girasol Eterno', 'Un girasol eterno de cualquier color', 13.00, 23, 604),
(510, 'Bear Bouquet', 'Ramo de chocolates + oso + flores', 16.99, 17, 604),
(511, 'Tulip Special Bouquet', 'Ramo de tulipanes con luces', 10.99, 14, 604),
(512, 'Love Flower Bouquet', 'Ramo de 24 rosas naturales y Ferreros', 25.00, 18, 601),
(513, 'Box Girl I', 'Contiene maquillaje y dulces', 18.00, 30, 602),
(514, 'Box Girl II', 'Contiene dulces, perfume y fotos personalizadas', 25.00, 28, 602),
(515, 'Box Peluche', 'Contiene chocolates, dulces y un peluche al gusto', 20.00, 25, 602),
(516, 'Regalos de Cumpleaños', 'Contiene un combo de ramo, torta y regalo personalizado al gusto del cliente', 40.00, 32, 604),
(517, 'Spiderman Box', 'Contiene un peluche, Ferreros, un carrito Hot Wheels y una carta', 17.00, 22, 602);

INSERT INTO Detalle_de_Pedido VALUES
(801,501, 301, 1, 22.00),
(802,502, 302, 2, 20.00),
(803,503, 303, 3, 15.00),
(804,504, 304, 1, 20.00),
(805,505, 305, 1, 30.00),
(806,506, 306, 1, 100.00),
(807,507, 307, 2, 9.00),
(808,508, 308, 1, 11.00),
(809,509, 309, 1, 13.00),
(819,510, 310, 1, 16.99);
 
INSERT INTO Valoracion_producto VALUES
(901,5, 'Excelente producto, muy bonito.', '2024-03-10', 001, 501),
(902,4, 'Buen producto, aunque un poco caro.', '2024-03-15', 002, 502),
(903,3, 'No cumplió con mis expectativas.', '2024-03-20', 003, 503),
(904,5, 'Superó mis expectativas, lo recomiendo.', '2024-04-01', 004, 504),
(905,4, 'Buena calidad, pero el envío fue lento.', '2024-04-15', 005, 505),
(906,5, 'Increíble calidad y servicio.', '2024-05-05', 006, 506),
(907,3, 'El producto es bueno, pero el empaque podría mejorar.', '2024-05-10', 007, 507),
(908,4, 'Me gustó mucho, pero el precio es alto.', '2024-05-15', 008, 508),
(909,5, 'Perfecto para lo que necesitaba.', '2024-06-01', 009, 509),
(910,4, 'Bonito ramo, aunque el precio podría ser mejor.', '2024-06-10', 010, 510);
 
 
        