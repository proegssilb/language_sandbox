(defn revc [sequence]
  (clojure.string/join "" (reverse (clojure.string/replace 
                                     sequence #"A|C|G|T"
                                     {"A" "T"
                                      "C" "G"
                                      "G" "C"
                                      "T" "A"}))))