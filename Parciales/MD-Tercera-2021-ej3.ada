procedure ej3 is
    task type Cliente;

    clientes: array(1..N) of Cliente;

    task body Cliente is
        embarazada: boolean;
        anciana: boolean;
    begin
        if (embarazada) then
            select
                Empleado.pedido_embarazada();
            else
                null;
            end select;
        elsif (anciana) then
            select
                Empleado.pedido_anciana();
            or delay 300
                null;
            end select;
        else
            Empleado.pedido();
        end if;
    end Cliente;

    task Empleado is
        entry pedido_embarazada();
        entry pedido_anciana();
        entry pedido();
    end Empleado;

    task body Empleado is
    begin
        loop
            select
                accept pedido_embarazada() do
                     AtenderPedido();
                end pedido_embarazada;
            or
                when (pedido_embarazada'count = 0) =>
                    accept pedido_anciana() do
                         AtenderPedido();
                    end pedido_anciana;
            or
                when (pedido_embarazada'count = 0 and pedido_anciana'count = 0) =>
                    accept pedido() do
                         AtenderPedido();
                    end pedido;
            end select;
        end loop;
    end Empleado;
begin
    null;
end ej3;