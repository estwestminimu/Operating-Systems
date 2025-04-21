-- Szymon Tomaszewski
with Ada.Text_IO ;
use Ada.Text_IO;



package body Rozwiazanie is

task body Skrzyzowanie is

-- type Kierunek is (Polnoc, Poludnie, Wschod, Zachod);

quit: Integer :=0;
wybieram: Boolean :=true;
licznik: Integer :=0;
wybKier: Kierunek;
kek: Integer:=0;
i: Integer:=0;

Tablica : array(0..100) of Integer := (others => -1);




begin
while true loop
    select
    when (wybKier=k and licznik<=10) => 
       accept Kolejka(id: Integer; k: Kierunek) do
            Tablica(kek):=id;
            kek:=kek+1;

        end Kolejka;

        or 
        

    when (Tablica(i)=id) =>     
     accept Opusc(id: Integer; k: Kierunek) do
        tab(i):=-1;
        k:=k+1;

        if(Tablica(i)=-1) then
            Kierunek:=Kierunek+1;
            licznik:=0;
            wybKier:=true;
            kek:=0;
            i:=0;
        end if;

    
        end Opusc;

        or 
  

  
    accept Wjedz(id: Integer; k: Kierunek) do
        if wybieram & licznik <= 10 then
            wybKier :=k;
            wybieram :=false;
        end if;
        licznik:=licznik+1;
        requeue Kolejka;

    end Wjedz;

        else
            delay 0.1;
            quit:=quit+1;
--put_line(Integer'Image(quit));
            if(quit=10) then
                exit;      
            end if;

    end select;
end loop;
end Skrzyzowanie;

end Rozwiazanie;
