procedure Ej1a is
    task type Auto;
    task type Camioneta;
    task type Camion;

    task Puente is
        entry pasar_auto;
        entry pasar_camioneta;
        entry pasar_camion;
        entry salir_auto;
        entry salir_camioneta;
        entry salir_camion;
    end Puente;

    autos: array(1..A) of Auto;
    camionetas: array(1..B) of Camioneta;
    camiones: array(1..C) of Camion;


    task body Puente is
        limite : Integer := 5;
        peso_act : Integer := 0;
    begin
        loop
            select
                when (peso_act + 1 < limite) =>
                    accept pasar_auto do
                        peso_act := peso_act + 1;
                    end pasar;
                
                or
                    when (peso_act + 2 < limite) =>
                        accept pasar_camioneta do
                            peso_act := peso_act + 2;
                        end pasar_camioneta;
                
                or
                    when (peso_act + 3 < limite) =>
                        accept pasar_camion do
                            peso_act := peso_act + 3;
                        end pasar_camion;
                or
                    accept salir_auto do
                        peso_act := peso_act - 1;
                    end salir_auto;
                
                or
                    accept salir_camioneta do
                        peso_act := peso_act - 2;
                    end salir_camioneta;
                
                or
                    accept salir_camion do
                        peso_act := peso_act - 3;
                    end salir_camion;
            end select;
        end loop;
    end Puente;

begin
    null;
end Ej1a;





procedure Ej1b is
    task type Auto;
    task type Camioneta;
    task type Camion;

    task Puente is
        entry pasar_auto;
        entry pasar_camioneta;
        entry pasar_camion;
        entry salir_auto;
        entry salir_camioneta;
        entry salir_camion;
    end Puente;

    autos: array(1..A) of Auto;
    camionetas: array(1..B) of Camioneta;
    camiones: array(1..C) of Camion;


    task body Puente is
        limite : Integer := 5;
        peso_act : Integer := 0;
    begin
        loop
            select
                when (pasar_camion'count = 0) and (peso_act + 1 < limite) =>
                    accept pasar_auto do
                        peso_act := peso_act + 1;
                    end pasar;
                
                or
                    when (pasar_camion'count = 0) and (peso_act + 2 < limite) =>
                        accept pasar_camioneta do
                            peso_act := peso_act + 2;
                        end pasar_camioneta;
                
                or
                    when (peso_act + 3 < limite) =>
                        accept pasar_camion do
                            peso_act := peso_act + 3;
                        end pasar_camion;
                or
                    accept salir_auto do
                        peso_act := peso_act - 1;
                    end salir_auto;
                
                or
                    accept salir_camioneta do
                        peso_act := peso_act - 2;
                    end salir_camioneta;
                
                or
                    accept salir_camion do
                        peso_act := peso_act - 3;
                    end salir_camion;
            end select;
        end loop;
    end Puente;
begin
    null;
end Ej1b;
