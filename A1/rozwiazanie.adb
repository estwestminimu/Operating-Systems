with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;



-- Szymon Tomaszewski
with GNAT.OS_Lib; use GNAT.OS_Lib;

package body Rozwiazanie is
  task body Synchronizator is

  type Size is range 1 .. 5; -- ilosc watkow
  type ArrWatki is array (Size) of Integer; 
  IdOfWatek: Size := 1; -- numer elementu w tablicy  
  TempSwap: Integer;  -- zmienna do sortowania
  turaEl: Integer := 1; -- zmienna do tury
  TablicaA: ArrWatki; -- deklaracja tabliicy do wybierania watkow

--##TODO zrobic poprawna funkcjonalnosc zmiennej do tury


  type arrKoniec is array (Size) of Integer;
  TablicaB: ArrWatki:=(45607,45667,45667,45667,45667);  
  IdOfKoniec: Size:=1;

  LastK: Integer:=-5;


  LicznikExit:Integer:=0;

begin

  -- pobieranie 5 watkow
  for i in 1..5 loop
    accept logowanie(id: in Integer) do
      TablicaA(IdOfWatek) := id; -- zapisywanie do tablicy watku
      if IdOfWatek = 5 then -- jesli tablica zostala zapelniona rozpocznij sortowanie
--        IdOfWatek:=1;  -- rozpoczynamy sortowanie od 1
        -- sortowanie rosnaco      
        for i in TablicaA'First..TablicaA'Last-1 loop
          for j in TablicaA'First..TablicaA'Last-i loop
              if TablicaA(j) >TablicaA(j+1) then
                TempSwap:=TablicaA(j+1);
                TablicaA(j+1):=TablicaA(j);
                TablicaA(j):=TempSwap;
              end if;
          end loop;
        end loop;
--        IdOfWatek:=5;

--## Czy trzeba zmieniach IdOFWatek na 1 a potem na 5, raczej nic to nie zmienia ODP NIE

      else
        IdOfWatek := IdOfWatek +1; -- ustawiamy indeks tablicy na kolejne miejsce
      end if;
      
    end logowanie;
  end loop;


  -- wielokrotnie
  --## Czy trzeba przeciez w watki.adb jest nieskonczona petla i ona smiga
loop

accept chcePracowac(id: Integer; zgoda: out Boolean) do
if id/=TablicaB(IdOfWatek) then




    if id = TablicaA(IdOfWatek) then
     
      if IdOfWatek = 1 then
        IdOfWatek:=5;
        turaEl:=turaEl+1;
      else
        IdOfWatek:= IdOfWatek-1;
      end if;

      zgoda:=true;
    else
      zgoda:=false;

    end if;

  else 

      if IdOfWatek = 1 then
        IdOfWatek:=5;
        turaEl:=turaEl+1;
      else
        IdOfWatek:= IdOfWatek-1;
      end if;



end if;

  
end chcePracowac;

select
  accept ponownie do
    null;    
  end ponownie;

or
    accept koniec do
      if TablicaA(IdOfWatek+1)/=TablicaB(IdOfWatek+1) and  TablicaB(IdOfWatek+1)=45667 then
        LicznikExit:=LicznikExit+1;    
        TablicaB(IdOfWatek+1):=TablicaA(IdOfWatek+1);
        
      if LicznikExit>=5 then
      --Put_Line("Koniec" & Integer'Image(LicznikExit));
      GNAT.OS_Lib.OS_Exit(0);
      end if;
        
      end if;

--    for i in TablicaB'Range loop
  --    Put(Integer'Image(TablicaB(i)));
--    end loop;
  --    Put_Line("");



    end koniec;
end select;

--Put_Line("Koniec" & Integer'Image(LicznikExit));
if turaEl>=4 then
--Put_Line("Koniec" & Integer'Image(LicznikExit));
GNAT.OS_Lib.OS_Exit(0);
end if;


end loop;    

  end Synchronizator;
end Rozwiazanie;