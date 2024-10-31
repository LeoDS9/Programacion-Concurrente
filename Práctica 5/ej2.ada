procedure ej2a is
    task Empleado is
        entry atender(pago: IN Integer, comprobante: OUT text);
    end Empleado;

    task body Empleado is
    begin
        loop
            accept atender(pago: IN Integer, comprobante: OUT text) do
                comcomprobante := generarComprobante(pago);
            end atender;
        end loop;
    end Empleado;

    task Cliente;

    task body Cliente is
        pago: Integer;
        comprobante: text;
    begin
        Empleado.atender(pago, comprobante);
    end Cliente;
begin
    null
end ej2a;



procedure ej2b is
    task Empleado is
        entry atender(pago: IN Integer, comprobante: OUT text);
    end Empleado;

    task body Empleado is
    begin
        loop
            accept atender(pago: IN Integer, comprobante: OUT text) do
                comcomprobante := generarComprobante(pago);
            end atender;
        end loop;
    end Empleado;

    task Cliente;

    task body Cliente is
        pago: Integer;
        comprobante: text;
    begin
        SELECT
            Empleado.atender(pago, comprobante);
        OR DELAY 600.0
            NULL;
        END SELECT;
    end Cliente;
begin
    null
end ej2b;






procedure ej2c is
    task Empleado is
        entry atender(pago: IN Integer, comprobante: OUT text);
    end Empleado;

    task body Empleado is
    begin
        loop
            accept atender(pago: IN Integer, comprobante: OUT text) do
                comcomprobante := generarComprobante(pago);
            end atender;
        end loop;
    end Empleado;

    task Cliente;

    task body Cliente is
        pago: Integer;
        comprobante: text;
    begin
        SELECT
            Empleado.atender(pago, comprobante);
        ELSE
            NULL;
        END SELECT;
    end Cliente;
begin
    null
end ej2c;





procedure ej2d is
    task Empleado is
        entry atender(pago: IN Integer, comprobante: OUT text);
    end Empleado;

    task body Empleado is
    begin
        loop
            accept atender(pago: IN Integer, comprobante: OUT text) do
                comcomprobante := generarComprobante(pago);
            end atender;
        end loop;
    end Empleado;

    task Cliente;

    task body Cliente is
        pago: Integer;
        comprobante: text;
    begin
        SELECT
            Empleado.atender(pago, comprobante);
        OR DELAY 600.0
            SELECT
                Empleado.atender(pago, comprobante);
            ELSE
                NULL;
            END SELECT;
        END SELECT;
    end Cliente;
begin
    null
end ej2d;