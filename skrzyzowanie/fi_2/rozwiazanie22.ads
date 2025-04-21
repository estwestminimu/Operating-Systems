package Rozwiazanie is
   maxID: constant Integer:= 100;
   
   type Kierunek is (Polnoc, Poludnie, Wschod, Zachod);

   task type Skrzyzowanie is
     entry Wjedz(id: Integer; k: Kierunek);
     entry Opusc(id: Integer; k: Kierunek);
   private
     entry Kolejka(id: Integer; k: Kierunek);
   end Skrzyzowanie;

end Rozwiazanie;