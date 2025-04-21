-- Szymon Tomaszewski
with Ada.Text_IO ;
use Ada.Text_IO;




package body Rozwiazanie is

task body Skrzyzowanie is

-- type Kierunek is (Polnoc, Poludnie, Wschod, Zachod);

quit: Integer :=0;

Tablica : array(1..100) of Integer := (others => -1);

choose: Kierunek := Polnoc;--zmienna do ustalenia kierunku wjazdu


TablicPolnoc : array(1..100) of Integer := (others => -1);
TablicPoludnie : array(1..100) of Integer := (others => -1);
TablicWschod : array(1..100) of Integer := (others => -1);
TablicZachod : array(1..100) of Integer := (others => -1);

first: Boolean:=true;
kek: Boolean:=false;

i:Integer:=1;
j:Integer:=1;

licznik:Integer:=0;

uw:Integer:=1;
uk:Integer:=1;

begin
while true loop
    select


    accept Wjedz(id: Integer; k: Kierunek) do
        quit:=0;
        if first then
            first:=false;
        --    kek:=false;
            choose:=k;
        --    put_line("Wybor: " & Kierunek'Image(choose));
        end if;
        -- nie ma podanej zmiany kierunku

            if k=choose then
         --       put_line("Wjedz " & Integer'Image(id) &" "& Kierunek'Image(k) & " Opt: True");
                Tablica(i):=id;
                i:=i+1;
                uw:=0;

                else
                        uw:=uw+1;
                        if uw>10 then
                        first:=false;
                        delay 0.1;
                        kek:=false;
                        end if;

     --          put_line("Wjedz " & Integer'Image(id) &" "& Kierunek'Image(k) & " Opt: False");
                requeue Kolejka;
            end if;


   
           -- requeue Wjedz;


    end Wjedz;

    or

        when (kek) =>
       accept Kolejka(id: Integer; k: Kierunek) do
            quit:=0;
           -- put_line("Kolejka");
            requeue Wjedz;

        end Kolejka;

    or 
        

  
        accept Opusc(id: Integer; k: Kierunek) do
         quit:=0;
           -- put_line("Opusc");
            if Tablica(j)=id and first=False then
                j:=j+1;

                if Tablica(j)=-1 then
                --put_line("Opdasadsausc");
                for z in Tablica'Range loop
                Tablica(z) := -1;
                end loop;

                    i:=1;
                    j:=1;
                    delay 0.01;
                    first:=true; 
                    kek:=true;
   --                 put_line("Opdasadsausc");

                end if;

            else
                requeue Opusc;

            end if;

            
        end Opusc;

    else
        -- warunek konca
        delay 0.001;
        quit:=quit+1;
       -- put_line("Czas: " & Integer'Image(quit));
        if(quit=1000) then
            exit;      
        end if;
    end select;
end loop;
end Skrzyzowanie;

end Rozwiazanie;
