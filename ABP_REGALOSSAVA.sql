DROP DATABASE IF EXISTS regaloSava;
CREATE DATABASE regaloSava;
USE regaloSava;

-- Tabla Clientes
CREATE TABLE Clientes (
  ID_Cliente INT AUTO_INCREMENT PRIMARY KEY,
  Nombre VARCHAR(100) NOT NULL,
  Apellido VARCHAR(100) NOT NULL,
  Email VARCHAR(100) NOT NULL,
  Celular VARCHAR(100),
  Direccion VARCHAR(100)
);

-- Tabla Empleados
CREATE TABLE empleados (
  idempleados INT AUTO_INCREMENT PRIMARY KEY,
  Nombre_Apellido VARCHAR(100) NOT NULL,
  Cargo VARCHAR(45),
  correo VARCHAR(45),
  telefono VARCHAR(45)
);

-- Tabla Formas de Pago
CREATE TABLE Formas_de_Pago (
  ID_Pago INT AUTO_INCREMENT PRIMARY KEY,
  Tipo_de_pago VARCHAR(45) NOT NULL
);

-- Tabla Pedidos
CREATE TABLE Pedidos (
  ID_Pedidos INT AUTO_INCREMENT PRIMARY KEY,
  Fecha_de_pedido DATE,
  Total DECIMAL(10, 2),
  Clientes_ID_Cliente INT,
  FOREIGN KEY (Clientes_ID_Cliente) REFERENCES Clientes(ID_Cliente)
);

-- Tabla Producto
CREATE TABLE Producto (
  Id_Producto INT AUTO_INCREMENT PRIMARY KEY,
  Nombre VARCHAR(45) NOT NULL,
  Descripcion VARCHAR(45),
  Precio DECIMAL(10, 2),
  Stock INT
 
);

-- Tabla Proveedores
CREATE TABLE Proveedores (
  ID_Proveedor INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(45) NOT NULL,
  telefono VARCHAR(45),
  Email VARCHAR(45),
  direccion VARCHAR(45),
  Producto_Id_Producto INT,
  FOREIGN KEY (Producto_Id_Producto) REFERENCES Producto(Id_Producto)
);

-- Tabla Promociones
CREATE TABLE Promociones (
  idPromociones INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(45),
  fecha_de_inicio DATE,
  fecha_de_finalizacion DATE,
  descuento TINYINT(2)
);


-- Tabla Categoria_producto
CREATE TABLE Categoria_producto (
  idCategoria_producto INT AUTO_INCREMENT PRIMARY KEY,
  Nombre VARCHAR(45),
  Producto_Id_Producto INT,
  Promociones_idPromociones INT,
  FOREIGN KEY (Producto_Id_Producto) REFERENCES Producto(Id_Producto),
  FOREIGN KEY (Promociones_idPromociones) REFERENCES Promociones(idPromociones)
);

-- Tabla Valoracion_producto
CREATE TABLE Valoracion_producto (
  idvaloracion_producto INT AUTO_INCREMENT PRIMARY KEY,
  puntuación INT,
  Comentario VARCHAR(45),
  fecha_de_valoracion DATE,
  Clientes_ID_Cliente INT,
  Producto_Id_Producto INT,
  FOREIGN KEY (Clientes_ID_Cliente) REFERENCES Clientes(ID_Cliente),
  FOREIGN KEY (Producto_Id_Producto) REFERENCES Producto(Id_Producto)
);

-- Tabla detalle_de_pedido
CREATE TABLE detalle_de_pedido (
  Producto_Id_Producto INT,
  Pedidos_ID_Pedidos INT,
  Formas_de_Pago_ID_Pago INT,
  cantidad INT,
  precio_unitario DECIMAL(10, 2),
  PRIMARY KEY (Producto_Id_Producto, Pedidos_ID_Pedidos, Formas_de_Pago_ID_Pago),
  FOREIGN KEY (Producto_Id_Producto) REFERENCES Producto(Id_Producto),
  FOREIGN KEY (Pedidos_ID_Pedidos) REFERENCES Pedidos(ID_Pedidos),
  FOREIGN KEY (Formas_de_Pago_ID_Pago) REFERENCES Formas_de_Pago(ID_Pago)
);


-- Insertar datos en la tabla producto
insert INTO Clientes values
('C001', 'Mary', 'Portugal','mary@gmail.com', '0923459810', 'Sauces' ),
('C002', 'Ashley', 'Ponce','ashley@gmail.com', '0932517823', 'Bastión' ),
('C003', 'Alfredo', 'Arias','fredo@gmail.com', '0919839870', 'Alborada' ),
('C004', 'Tahis', 'Angulo','tahis@gmail.com', '0998379827', 'Alborada' ),
('C005', 'Roger', 'Briones','roger@gmail.com', '0909182081', 'Sauces' ),
('C006', 'Oswaldo', 'Apolo','Oswaldo@gmail.com', '090412809233', 'Alborada' ),
('C007', 'Andrés', 'Apolo','andres@gmail.com', '0989368761', 'Alborada' ),
('C008', 'Jennifer', 'Vergara','Jenny@gmail.com', '0978638723', 'Vía Daule' ),
('C009', 'Ericka', 'Yuquilema','eri@gmail.com', '0909818322', 'Bation' ),
('C010', 'Liria', 'Baque','lili@gmail.com', '0900128034', 'Olmedos' );

Insert INTO empleados values
('E001','Ana Pérez', 'Asistente Administrativo', 'ana@gmail.com', '0978654321'),
('E002','Luis Rodríguez', 'Gerente de Ventas', 'luis@gmail.com', '0981234567'),
('E003','María Gómez', 'Diseñador', 'mariagom@gmail.com', '0998765432'),
('E004','Laura Martínez', 'Diseñador gráfico', 'laura@gmail.com', '0912345678'),
('E005','José García', 'Administrador de inventario', 'jose@gmail.com', '0923456789'),
('E006','Marta Sánchez', 'Atención al cliente', 'marta@gmail.com', '0934567890'),
('E007','Carlos Fernández', 'Desarrollador web', 'carlos@gmail.com', '0945678901'),
('E008','Pablo Torres', 'Vendedor', 'pablo@gmail.com', '0956789012'),
('E009','Sofía López', 'Repartidor', 'sofia@gmail.com', '0967890123'),
('E010','Javier Ramírez', 'Cordinador de logísticas y envíos', 'javier@gmail.com', '0990123456');

INSERT INTO Formas_de_Pago VALUES
('FP001','Tarjeta'),
('FP002','Efectivo'),
('FP003','Efectivo'),
('FP004','Tarjeta'),
('FP005','Tarjeta'),
('FP006','Efectivo'),
('FP007','Tarjeta'),
('FP008','Efectivo'),
('FP009','Tarjeta'),
('FP010','Tarjeta');

INSERT INTO Pedidos VALUES
('P001', '15/03/2023', '$28', 'C003'),
('P002', '07/08/2024', '$32', 'C005'),
('P003', '22/01/2024', '$46', 'C009'),
('P004', '10/11/2023', '$14', 'C010'),
('P005', '05/05/2023', '$12', 'C002'),
('P006', '19/06/2024', '$100', 'C001'),
('P007', '12/02/2023', '$30', 'C007'),
('P008', '28/07/2023', '$25', 'C004'),
('P009', '30/04/2024', '$13', 'C008'),
('P010', '17/10/2024', '$26', 'C006');

INSERT INTO Proveedores Values
('PV001', 'Diego', '0987654321', 'diego@gmail.com','Av. Principal 123, Ciudad A'),
('PV002', 'Marta', '0987454665', 'martaa@gmail.com','Calle Secundaria 456, Ciudad B'),
('PV003', 'Ismael', '0952441674', 'ismall@gmail.com','Carr. Central 789, Ciudad C'),
('PV004', 'Luis', '0946564242', 'lluiisgmail.com','Blvd. Industrial 321, Ciudad D'),
('PV005', 'Julián', '0998415648', 'julian@gmail.com','Plaza del Comercio 654, Ciudad E'),
('PV006', 'Pedro', '0942325545', 'pedrito@gmail.com','Av. Tecnológica 567, Ciudad F'),
('PV007', 'Luisa', '0978524852', 'luisagmail.com','Calle Comercio 890, Ciudad G'),
('PV008', 'Carmen', '0983158910', 'carmen12@gmail.com','Carr. Norte 321, Ciudad H'),
('PV009', 'Paquita', '0992018582', 'paquitalle2gmail.com','Av. Libertad 654, Ciudad I'),
('PV010', 'Dolores', '0984548212', 'dolores@gmail.com','Calle Central 987, Ciudad J');

INSERT INTO producto VALUES
('G001''Ramos hot wheels','Contiene carros hot wheels a su gusto','$22', 10),
('G002''Cajita de corazón','Una cajita de regalo en forma de corazón con contenido personalizado','$20', 22),
('G003''Ramo de flores eternas','ramo pequeño personalizado','$15', 12),
('G004''Ramo de flores eternas','ramo mediano personalizado','$20', 20),
('G005''Ramo de flores eternas','ramo grande personalizado','$30', 15),
('G006''Ramo de flores eternas','ramo buchon personalizado','$100', 18),
('G007''Letras de gomitas','Letra personalizada sin tapa, pequeña con gomitas al gusto','$9', 19),
('G008''Letras de gomitas','Letra personalizada con tapa, grande con gomitas al gusto','$11', 17),
('G009''Girasol eterno','Un girasol eterno de cualquier color','$13', 23),
('G010''Bear bouquet','Ramo de chocolates + oso + flores','$16.99', 17),
('G011''Tulip special bouquet','Ramo de tulipanes con luces','$10.99', 14),
('G012''Love flower bouquet','Ramo de 24 rosas naturales y ferreros','$25', 18),
('G013''Box Girl I','Contiene maquillaje y dulces','$18', 30),
('G014''Box Girl II','Contiene dulces, perfume y fotos personalizadas','$25', 28),
('G015''Box Peluche','Contiene chocolates, dulces y un peluche al gusto','$20', 25),
('G016''Regalos de cumpleaños','Contiene un combo de ramo, torta y regalo personalizado al gusto del cliente','$40', 32),
('G017''Spiderman Box','Contiene un peluche, ferreros, un carrito hot wheels y una carta','$17', 22);