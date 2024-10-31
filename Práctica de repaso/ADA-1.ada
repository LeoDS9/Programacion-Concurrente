procedure ADA-1 is
    
    type Banco_API is task
        entry cotizacion(compra, venta: out String);
    end Banco_API;

    Bancos : array(1..5) of Banco_API;

    task body Banco_API is
        cotizacion_compra, cotizacion_venta : String;
    begin
        loop
            accept cotizacion(compra, venta: out String) do
                --llamado a la api
            end cotizacion;
        end loop;
    end Banco_API;

    task Tarea_programada;

    type Cotizacion is array (1 .. 20) of String;

    task body Tarea_programada is
        cotizacion_compra, cotizacion_venta : Cotizacion;
    begin
        loop
            for i in 1 .. 20 loop
                select
                    Bancos(i).cotizacion(cotizacion_compra(i), cotizacion_venta(i));
                or delay 300
                    cotizacion_compra(i) := " ";
                    cotizacion_venta(i) := " ";
                end select;
            end loop;
            recargar_pagina(cotizacion_compra, cotizacion_venta); --funcion que recarga la pagina con las cotizaciones
        end loop;
    end Tarea_programada;
begin
    null;
end ADA-1;