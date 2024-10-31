procedure ej3 is
    task type Periferico is
        entry ident(num: in Integer);
    end Periferico;

    per1, per2 : Periferico;

    task body Periferico is
        id : Integer;
    body Periferico is
        accept ident(num: in Integer) do
            id := num;
        end ident;
        if (id = 1) then
            loop
                select
                    Central.señalP1();
                or delay 120
                    null;
                end select;
            end loop;
        else
            loop
                select
                    Central.señalP2();
                else
                    delay 60;
                end select;
            end loop;
        end if;
        
    end Periferico;

    task Central is
        entry señalP1();
        entry señalP2();
        entry finish();
    end Central;

    task body Central is
        finished : Boolean := False;
    begin
        accept señalP1() do
            
        end señalP1;
        loop
            select
                accept señalP1() do
                    
                end señalP1;
                
            or
                accept señalP2() do
                    
                end señalP2;
                Timer.start();
                select
                    when (not finished) => 
                        accept señalP2() do
                        
                        end señalP2;
                
                or
                    accept finish() do
                        finished := True;
                    end finish;
                end select;
                finished := False;
            end select;
        end loop;
    end Central;


    task Timer is
        entry start();
    end Timer;
    task body Timer is
        
    begin
        loop
            accept start() do

            end start;
            delay 180;
            Central.finish();
    end Timer;
begin
    per1.ident(1);
    per2.ident(2);
end ej3;