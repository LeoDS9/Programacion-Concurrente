procedure ej4 is
    task Medico is
        entry pedido_persona();
        entry pedido_enfermera(papel: IN/OUT text);
        
    end Medico;

    task Escritorio is
        entry dejar_nota(nota: IN text);
        entry leer_nota(nota: OUT text);
    end Escritorio;

    task Persona;

    task Enfermera;


    task body Escritorio is
        notas : Cola;
    begin
        loop
            select
                accept dejar_nota(nota: IN text) do
                    notas.push(nota);
                end dejar_nota;
            or
                when(not empty(notas)) =>
                    accept leer_nota(nota: OUT text) do
                        nota = notas.pop(nota);
                    end leer_nota;
            end select;
        end loop;
    end Escritorio;

    task body Persona is
        contador : integer := 0;
        atendido : boolean := false;
    begin
        while (contador < 3) and (not atendido) loop
            select
                Medico.pedido_persona();
                atendido := true;
            or delay 300
                delay 600;
                contador := contador + 1;
            end select;
        end loop;
    end Persona;
    
    task body Enfermera is
        papel : text;
        nota : text;
    begin
        loop
            select
                Medico.pedido_enfermera(papel);
            else
                Escritorio.dejar_nota(nota);
            end select;
        end loop;
    end Enfermera;

    task body Medico is
        papel : text;
        nota : text;
    begin
        loop
            select
                accept pedido_persona() do
                    --atiende a la persona
                end pedido_persona;
            or
                when(pedido_persona'count = 0) =>
                    accept pedido_enfermera(papel: IN/OUT text) do
                        firmar_papel(papel);
                    end pedido_enfermera;
            else
                select
                    Escritorio.leer_nota(nota);
                    procesar_nota(nota);
                else
                    null;
                end select;
            end select;
        end loop;
begin
    
end ej4;