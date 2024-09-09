# Regalos_sava
Regalos_Sava es una plataforma en línea dedicada a la creación y venta de regalos personalizados en todo el Ecuador, el cual se especializa en ofrecer una amplia gama de productos únicos que pueden ser personalizados según las preferencias y ocasiones específicas de los clientes, desde regalos para cumpleaños hasta detalles corporativos. Cada artículo en "Regalos_Sava" se diseña con atención al detalle y calidad superior para garantizar una experiencia de regalo memorable y significativo.

# Catálogo de productos
* Ramos de hot wheels: $22
* Cajita de corazón: $20
* Ramo de flores eternas: $15, $20, $30 y $100 (colores personalizados).
* Letras de gomitas: $9 y $11 (gomitas opcionales).
* Girasol eterno: $13
* Ramo de chocolates + oso + flores: $16.99
* Ramo de tulipanes con luces $10.99.
* Ramo de 24 rosas naturales y ferreros: $25
* Box Girl I: $18
* Box Girl II: $25
* Box Peluche: $20
* Regalos de cumpleaños: $40
* Ramo buchon de 100 rosas eternas: $100
* Spiderman Box: $17

## Modelo relacional
![image](https://github.com/Valezzz14/Regalos_sava/assets/169208862/7921cb82-b4db-452c-bbb9-3978d746bb6a)



**Tablas Principales**
* Clientes: Almacena información sobre los clientes.
* Productos: Contiene detalles sobre los regalos disponibles para la venta.
* Pedidos: Registra los pedidos realizados por los clientes.
* Detalles de pedidos: Detalles específicos de cada pedido, incluyendo la forma de pago.
* Empleados: Almacena información sobre los empleados, icluyendo su contacto.
* Proveedores: Almacena informaci{on sobre los proveedores, icluyendo su contacto.
* Formas de pago: Registra la forma de pago que nos da el cliente.
* Categoría de producto: Registra el producto en diferentes categorías.
* Promociones: Se registra las promociones que puede tener nuestro producto.
* Valoración de producto: Registra las valoraciones que nos ofrece nuestros clientes.

## Reportes del problema.
En el competitivo mundo de los negocios de regalos, la organización y la eficiencia son claves para el éxito. Regalos Sava, una empresa reconocida en el sector, se enfrenta al desafío de optimizar sus operaciones. En este reportaje, exploraremos cinco soluciones innovadoras en MySQL que prometen transformar la forma en que la empresa gestiona su inventario y pedidos, mejorando significativamente su flujo de trabajo y organización.







*4.- Encontrar los productos con el Precio Máximo en su Categoría

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
        WHERE p2.ID_Categoria = p.ID_Categoria
    );

*5.- Productos con el Precio Máximo en su Categoría
Encuentra los productos cuyo precio es el máximo en su categoría.



