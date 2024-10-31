procedure ADA-3 () is
    task Central is
        entry articulo(id: OUT Integer);
        entry resultado(cant: IN Integer);
    end Central;

    task Sucursal;

    sucursales: array(1..100) of Sucursal;

    task body Sucursal is
        cant, id_art: Integer;
    begin
        loop
            Central.articulo(id_art);
            cant = ObtenerVentas(id_art);
            Central.resultado(cant);
        end loop;
    end Sucursal;

    task body Central is
        id_art, total: Integer;
    begin
        loop
            id_art = generarArticulo();
            for i in 1..200 loop
                select
                    accept articulo(id: OUT Integer) do
                        id_art := id_art;
                    end articulo;
                or
                    accept resultado(cant: IN Integer) do
                        total := total + cant;
                    end resultado;
                end select;
            end loop;
        end loop;
    end Central;
begin
    null;
end ADA-3;