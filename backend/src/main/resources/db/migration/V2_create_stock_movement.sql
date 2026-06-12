-- ===================================================================
-- V2__create_stock_movement.sql
-- Crea la tabla de movimientos de stock (historial de entradas/salidas).
-- Depende de la tabla products (creada en V1).
-- ===================================================================

CREATE TABLE stock_movements (
    id UUID PRIMARY KEY,
    product_id UUID NOT NULL REFERENCES products (id),
    movement_type VARCHAR(20) NOT NULL CHECK (
        movement_type IN ('ENTRADA', 'SALIDA', 'AJUSTE')
    ),
    previous_quantity INTEGER NOT NULL CHECK (previous_quantity >= 0),
    new_quantity INTEGER NOT NULL CHECK (new_quantity >= 0),
    movement_date TIMESTAMP NOT NULL DEFAULT NOW(),
    username VARCHAR(255) NOT NULL,
    observations TEXT
);

CREATE INDEX idx_stock_movements_product ON stock_movements (product_id);

COMMENT ON
TABLE stock_movements IS 'Historial de entradas, salidas y ajustes de inventario.';

COMMENT ON COLUMN stock_movements.movement_type IS 'Tipo de movimiento: ENTRADA, SALIDA o AJUSTE.';

COMMENT ON COLUMN stock_movements.previous_quantity IS 'Cantidad antes del movimiento.';

COMMENT ON COLUMN stock_movements.new_quantity IS 'Cantidad después del movimiento.';