with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;



-- Szymon Tomaszewski
with GNAT.OS_Lib; use GNAT.OS_Lib;



package body Rozwiazanie is
  task body Synchronizator is

  type Size is range 1 .. 5;
  IdOfWatek: Size := 1; -- numer elementu
    
  TempSwap: Integer;

    
  -- tablica do tur chyba nie potrzebna
  -- type Iletury is range 1 .. 3;
  turaEl: Integer := 0;
  type ArrWatki is array (Size) of Integer; 
  TablicaA: ArrWatki;

    
begin
  for i in 1..5 loop
    accept logowanie(id: in Integer) do
      --Put_Line ("Logowanie: " & Integer'Image(id));
      TablicaA(IdOfWatek) := id;
                   
      --if IdOfWatek > 5 then
    --  Put("Indeks tablicy:" & Size'Image(IdOfWatek));
    --  Put("  id:" & Integer'Image(id));
    --  Put_Line ("  Tura: " & Integer'Image(turaEl) );
      --GNAT.OS_Lib.OS_Exit(0);
      -- end if;
      -- V := ArrWatki(IdOfWatek);
      --Put (Integer'Image (V));
      -- IdOfWatek := IdOfWatek + 1;
      if IdOfWatek = 5 then
    --  Put_Line("####Indeks:" & Size'Image(IdOfWatek));
              
      IdOfWatek:=1;        
      --SORTOWANIE
      for i in TablicaA'First..TablicaA'Last-1 loop
    --  Sortowane :=false;
     -- Put(" i:" & Size'Image(i));
        for j in TablicaA'First..TablicaA'Last-i loop
       -- Put(" j:" & Size'Image(j));
            if TablicaA(j) >TablicaA(j+1) then
              TempSwap:=TablicaA(j+1);
              TablicaA(j+1):=TablicaA(j);
              TablicaA(j):=TempSwap;
            --   Sortowane :=true;
            end if;
        end loop;
          --  if Sortowane=True then
          --  exit;
          --  end if;
      end loop;
    -- Wyświetlanie tablicy
   --   for i in Size loop
 --       Put_Line(Integer'Image(TablicaA(i)));
   --   end loop;

      --ustawiamy na ostatni element czyli najwiekszy aby potem latwiej decydowac przy wybieraniu
        IdOfWatek:=5;
      --  GNAT.OS_Lib.OS_Exit(0);--usunąć
      else
        IdOfWatek := IdOfWatek +1;
      end if;
      
      
      --Put("Indeks tablicy:" & Size'Image(IdOfWatek));
      
    end logowanie;
  end loop;
    -- Put_Line ("1");


  loop
    accept chcePracowac(id: Integer; zgoda: out Boolean) do
      --Put_Line ("Chce pracowac: " & Integer'Image(id));
    --IdOfWatek:=5;
        
       
      
      if id = TablicaA(IdOfWatek) then  -- sprawdza czy numer id zgadza sie z kolejnoscia w tablicy
       
--        Put ("Indeks tablicy" & Size'Image (IdOfWatek));
--        Put (" | Wartosc tablicy" & Integer'Image(TablicaA(IdOfWatek)));
--        Put_Line (" | ID" & Integer'Image(id));
        
        if IdOfWatek = 1 then --jesli id wynosi 1 to przechodzimy na koniec tablicy 
         turaEl :=  turaEl + 1; -- zwiekszamy ture
            if turaEl = 3 then
              put("kekeke");
             -- GNAT.OS_Lib.OS_Exit(0);
            end if;
            IdOfWatek:=5;
        else
              IdOfWatek:= IdOfWatek-1; --zmniejszamy o jeden i zatwierdzamy prace
--          Put_Line("   minus   ");

        end if;
           zgoda:= true;
      else
        zgoda:= false;   --EDYTOWAC POPRAWIC
       -- put("555");
      end if; 

-- Put(" | ID " & Integer'Image(id));
    end chcePracowac;
--        Put (" Poza chce   ");
--        Put (" Indeks tablicy" & Size'Image (IdOfWatek));
--        Put (" | Wartosc tablicy" & Integer'Image(TablicaA(IdOfWatek)));
        


  end loop;  

      
    accept ponownie do
      null;
      
    end ponownie;
      -- Put_Line ("3");
   



    accept koniec do
       null;
--      Put_Line ("Koniec: ");
    end koniec;
      --Put_Line ("4");
            
   


        
      --Put_Line ("  Tura: " & Integer'Image(turaEl) );


  end Synchronizator;
end Rozwiazanie;


