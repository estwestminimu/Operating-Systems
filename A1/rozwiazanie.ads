with GNAT.OS_Lib;
package Rozwiazanie is

  task Synchronizator is
    entry logowanie(id: Integer);
    entry chcePracowac(id: Integer; zgoda: out Boolean);
    entry ponownie;
    entry koniec;
  end Synchronizator;

end Rozwiazanie;