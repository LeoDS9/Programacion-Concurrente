procedure ej3 () is
    task type Cliente is
        entry ident(num: in Integer);
        entry resultado(res: IN text);
    end Cliente;

    clientes: array(1...N) of Cliente;

    task body Cliente is
        result: text;
        s: Secuencia;
        id: Integer;
    begin
        accept ident (num: in Integer) do
            id := num;
        end ident;
        loop
            --Genera la secuencia de adn
            Coordinador.envio_secuencia(id, s);
            accept resultado(res: IN text) do
                result := res;
            end resultado;
        end loop;
    end Cliente;



    task Coordinador is
        entry envio_secuencia(id: in Integer, s: in Secuencia);
        entry siguiente(idCliente: out Integer, SC: out Secuencia);
    end Coordinador;

    task body Coordinador is
    begin
        loop
            accept siguiente(idCliente: out Integer, SC: out Secuencia) do
                accept envio_secuencia(id: in Integer, s: in Secuencia) do
                    SC := s;
                    idCliente := id;
                end envio_secuencia;
            end siguiente;
        end loop;
    end Coordinador;



    task type Servidor;

    Servidor1, Servidor2, Servidor3, Servidor4, Servidor5: Servidor;

    task body Servidor is
        sec: Secuencia;
        res: text;
        idC: Integer;
    begin
        loop
            Coordinador.siguiente(idC, sec);
            res := ResolverAnalisis(sec);
            clientes(idC).resultado(res);
        end loop;
    end Servidor;


begin
    for i in 1..N loop
        clientes(i).ident(i);
    end loop;
end ej3;