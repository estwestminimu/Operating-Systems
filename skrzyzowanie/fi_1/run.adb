WITH Rozwiazanie;
USE Rozwiazanie;
with Ada.Text_IO ;
use Ada.Text_IO;
with ada.numerics.discrete_random;

procedure run is
        -- Random generator
        type randRange is new Integer range 100..800; package Rand_Int is new ada.numerics.discrete_random(randRange); use Rand_Int; gen : Generator;

        skrz: Skrzyzowanie;
        task type samochod is
                entry start(idd: Integer);
                entry setKier(kierr: Kierunek);
        end samochod;

        task body samochod is
                id: Integer;
                kier: Kierunek;
                Random_Duration : DURATION;
        begin
                accept start(idd: Integer) do
                        id := idd;
                end start;
                accept setKier(kierr: Kierunek) do
                        kier := kierr;
                end setKier;
                skrz.Wjedz(id, kier);
                put_line("@##  Wjedz  " & Integer'Image(id) &" "& Kierunek'Image(kier));
                Random_Duration := Duration(Random(gen)) / 1000.0;
                delay Random_Duration;
                skrz.Opusc(id, kier);
                put_line("@##  Opusc  " & Integer'Image(id) &" "& Kierunek'Image(kier));

        end samochod;
        samochody: array (1..100) of samochod;

        Kierunki: ARRAY (0..3) of Kierunek := (Polnoc, Poludnie, Wschod, Zachod);
begin
        reset(gen);
        for i in 1..100 loop
                samochody(i).start(i);
                samochody(i).setKier(Kierunki(i mod 4));
        end loop;
end run;