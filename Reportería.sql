/*1.- Listado con todos los pedidos ordenados por fecha de realización (más recientes primero) junto con la cantidad de productos en cada pedido*/
SELECT 
    p.ID_Pedidos, 
    p.Fecha_de_Pedido, 
    p.Total, 
    c.Nombre AS Cliente_Nombre, 
    c.Apellido AS Cliente_Apellido,
    COUNT(dp.ID_Detalle) AS Cantidad_Productos
FROM 
    Pedidos p
JOIN 
    Clientes c ON p.Clientes_ID_Cliente = c.ID_Cliente
JOIN 
    Detalle_de_Pedido dp ON p.ID_Pedidos = dp.Pedidos_ID_Pedidos
GROUP BY 
    p.ID_Pedidos, p.Fecha_de_Pedido, p.Total, c.Nombre, c.Apellido
ORDER BY 
    p.Fecha_de_Pedido DESC;

/*2.- Identificador, nombre y primer apellido de los clientes cuyo segundo apellido no es NULL, junto con el número de pedidos realizados, ordenado alfabéticamente*/
SELECT 
    c.ID_Cliente, 
    c.Nombre, 
    c.Apellido,
    COUNT(p.ID_Pedidos) AS Numero_Pedidos
FROM 
    Clientes c
LEFT JOIN 
    Pedidos p ON c.ID_Cliente = p.Clientes_ID_Cliente
GROUP BY 
    c.ID_Cliente, c.Nombre, c.Apellido
ORDER BY 
    c.Apellido, c.Nombre;
    
/*3.- Datos de los dos pedidos de mayor valor, incluyendo detalles de productos y valor total de cada producto*/
WITH Top_Pedidos AS (
    SELECT 
        p.ID_Pedidos, 
        p.Total,
        ROW_NUMBER() OVER (ORDER BY p.Total DESC) AS rn
    FROM 
        Pedidos p
)
SELECT 
    tp.ID_Pedidos, 
    tp.Total, 
    p.Nombre AS Producto_Nombre,
    dp.Cantidad,
    dp.Precio_Unitario,
    (dp.Cantidad * dp.Precio_Unitario) AS Valor_Producto
FROM 
    Top_Pedidos tp
JOIN 
    Detalle_de_Pedido dp ON tp.ID_Pedidos = dp.Pedidos_ID_Pedidos
JOIN 
    Producto p ON dp.Producto_ID_Producto = p.ID_Producto
WHERE 
    tp.rn <= 2;
    
/*4.- Encontrar los productos con el Precio Máximo en su Categoría*/
SELECT 
    p.ID_Producto, 
    p.Nombre AS Nombre_Producto, 
    p.Precio, 
    p.ID_Categoria
FROM 
    producto p
WHERE 
    p.Precio = (
        SELECT MAX(p2.Precio)
        FROM producto p2
        WHERE p2.ID_Categoria = p.ID_Categoria);
        
/*5.- Mostar cuáles son los productos con menos de 20 unidades en el stock para realizar su debida compra.*/
SELECT ID_Producto, nombre, Stock
FROM producto
WHERE stock < 20;