# Documentación de Configuración de Keycloak

Este directorio contiene la configuración de seguridad del "Sistema de Gestión de Inventarios Empresarial" exportada desde Keycloak.

Dado que la especificación estricta de Keycloak en sus últimas versiones (basadas en Quarkus) no permite campos no reconocidos (como `description` en el nivel raíz del Realm) ni comentarios (por ser formato JSON estándar), se documenta aquí detalladamente la configuración aplicada en `realm-export.json`.

## Realm: `Inventario`
Realm principal para el Sistema de Gestión de Inventarios. Administra la seguridad, usuarios, y clientes (como el frontend y backend) de manera centralizada mediante OAuth2/OIDC.

## Cliente: `inventory-client`
- **Tipo**: Cliente confidencial (`publicClient: false`).
- **Autenticación**: `client-secret`
- **Standard Flow (`standardFlowEnabled: true`)**: Habilita el flujo de código de autorización (Authorization Code Flow) recomendado para aplicaciones web.
- **Direct Access Grants (`directAccessGrantsEnabled: true`)**: Permite el Resource Owner Password Credentials Grant, útil para pruebas de API y automatizaciones de backend.

## Roles Granulares de Realm (Permisos)
- `product:view`: Otorga al usuario el derecho de visualizar la información, listados y detalles del catálogo de productos.
- `product:manage`: Otorga al usuario el derecho de crear nuevos productos, editar productos existentes y eliminar o desactivar productos.
- `stock:view`: Otorga al usuario el derecho de visualizar los niveles actuales de inventario, stock por almacén y movimientos históricos.
- `stock:manage`: Otorga al usuario el derecho de registrar entradas de inventario, salidas, transferencias y ajustes manuales de stock.
- `report:view`: Otorga al usuario el derecho de acceder a la sección de reportes operativos, financieros y gerenciales, así como exportar datos.
- `user:manage`: Otorga al usuario el derecho administrativo de gestionar otros usuarios del sistema, asignar roles, y configurar niveles de acceso.
- `audit:view`: Otorga al usuario el derecho de consultar los registros de auditoría y bitácoras de acciones realizadas por los usuarios en el sistema.

## Usuarios
- `admin-user`: Usuario de prueba administrativo habilitado por defecto.
- **Contraseña**: `admin123`
- **Permisos**: Tiene asignados absolutamente todos los roles listados anteriormente para facilitar las pruebas durante el desarrollo.
