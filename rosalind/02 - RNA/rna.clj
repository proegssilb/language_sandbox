(defn rna [sequence]
  "Transform a DNA sequence into an RNA sequence"
  (clojure.string/replace sequence "T" "U"))