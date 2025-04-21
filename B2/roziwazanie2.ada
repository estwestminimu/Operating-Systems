-- Szymon Tomaszewski
with GNAT.OS_Lib; use GNAT.OS_Lib;
package body Rozwiazanie is
task body Synchronizator is
type Size is range 1 .. 5;
type ArrWatki is array (Size) of Integer; 
IdOfWatek: Size := 1; 
TempSwap: Integer;
turaEl: Integer := 1;
TablicaA: ArrWatki;
type arrKoniec is array (Size) of Integer;
TablicaB: ArrWatki:=(45607,45667,45667,45667,45667);  
IdOfKoniec: Size:=1;
LastK: Integer:=-5;
LicznikExit:Integer:=0;
begin
for i in 1..5 loop
accept logowanie(id: in Integer) do
TablicaA(IdOfWatek) := id;
if IdOfWatek = 5 then
for i in TablicaA'First..TablicaA'Last-1 loop
for j in TablicaA'First..TablicaA'Last-i loop
if TablicaA(j) >TablicaA(j+1) then
TempSwap:=TablicaA(j+1);
TablicaA(j+1):=TablicaA(j);
TablicaA(j):=TempSwap;
end if;
end loop;
end loop;
else
IdOfWatek := IdOfWatek +1;
end if;
end logowanie;
end loop;
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
GNAT.OS_Lib.OS_Exit(0);
end if;
end if;
end koniec;
end select;
if turaEl>=4 then
GNAT.OS_Lib.OS_Exit(0);
end if;
end loop;    
end Synchronizator;
end Rozwiazanie;