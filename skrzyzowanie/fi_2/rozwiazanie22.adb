-- Szymon Tomaszewski



package body Rozwiazanie is

task body Skrzyzowanie is

begin
while (SomeCondition1) loop
    select
        when (k="POLNOC") =>
            accept Kolejka(id: Integer; k: Kierunek) do
                ...
            end Kolejka;
            or 
            accept Opusc(id: Integer; k: Kierunek) do
                ...
            end Opusc;
            or 
            accept Wjedz(id: Integer; k: Kierunek) do
                ...
            end Wjedz;

        else
            delay 0.1;
            ...
    end select;
end loop;
end Skrzyzowanie;

end Rozwiazanie;
