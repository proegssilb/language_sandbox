(defn dna [sequence]
  "Returns the count of each member in a DNA sequence, (A C G T)"
  (clojure.string/join " "
    (vals (sort-by key (frequencies (seq sequence))))))