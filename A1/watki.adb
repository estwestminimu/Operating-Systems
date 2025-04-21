with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;

with Rozwiazanie; use Rozwiazanie;

procedure watki is
 
  task type Watek is
    entry setId (withId: Integer);
  end Watek;

  task body Watek is
    id: Integer;
    moge: Boolean;
  begin
    accept setId (withId: Integer) do
      id:= withId;
    end setId;
	
    Synchronizator.logowanie(id);
      
    loop
      Synchronizator.chcePracowac(id, moge);
      if moge then
        Put_Line("Watek " & Integer'Image(id) & " wykonuje obliczenia");
      end if;
      if moge and ( id=5 or id=3 or id=2) then
        Synchronizator.koniec;
      else
        Synchronizator.ponownie;
      end if;
    end loop;
  
  end Watek;
    
    
  W: array (1..5) of Watek;
  id: Integer;
    
begin 
  for i in 1..5 loop
    Get(id); Skip_Line;
    W(i).setId(id);
  end loop;
end watki;