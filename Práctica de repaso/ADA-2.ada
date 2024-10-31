procedure ADA-2 is
    task Cajero is
        entry pedido_anciana(boletas: IN text, recibo: OUT, dinero: IN/OUT int);
        entry pedido_menos_5_bol(boletas: IN text, recibo: OUT, dinero: IN/OUT int)
        entry pedidos(boletas: IN text, recibo: OUT, dinero: IN/OUT int);
    end Cajero;

    task Persona;

    personas: array(0..P-1) of Persona;

    task body Persona is
        bool anciana;
        int dinero, cantBoletas;
        text boletas, recibo;
    begin
        if (anciana) then
            Cajero.pedido_anciana(boletas, recibo, dinero);
        else
            if (cantBoletas < 5) then
                Cajero.pedido_menos_5_bol(boletas, recibo, dinero);
            else
                Cajero.pedidos(boletas, recibo, dinero);
            end if;
        end if;

    end Persona;

    task body Cajero is
        vuelto: Integer;
    begin
        loop
            select
                accept pedido_anciana(boletas: IN text, recibo: OUT text, dinero: IN/OUT Integer) do
                    vuelto = generar_vuelto(boletas, dinero);
                    recibo = generar_recibo(boletas, dinero,vuelto);
                    dinero = vuelto;
                end pedido_anciana;
            or
                when (pedido_anciana'count = 0) =>
                    accept pedido_menos_5_bol(boletas: IN text, recibo: OUT text, dinero: IN/OUT Integer) do
                        vuelto = generar_vuelto(boletas, dinero);
                        recibo = generar_recibo(boletas, dinero,vuelto);
                        dinero = vuelto;
                    end pedido_menos_5_bol;
            or
                when (pedido_anciana'count = 0 and pedido_menos_5_bol'count = 0) =>
                    accept pedidos(boletas: IN text, recibo: OUT text, dinero: IN/OUT Integer) do
                        vuelto = generar_vuelto(boletas, dinero);
                        recibo = generar_recibo(boletas, dinero,vuelto);
                        dinero = vuelto;
                    end pedidos;
        end loop;
    end Cajero;
begin
    null;
end ADA-2;