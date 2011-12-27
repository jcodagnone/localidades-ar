SELECT ?p, str(?label), ?x, ?type, ?postalCode, ?lat, ?long WHERE {
  ?p <http://dbpedia.org/ontology/type>
<http://dbpedia.org/resource/Provinces_of_Argentina>.
  ?x <http://dbpedia.org/ontology/isPartOf>     ?p.
  OPTIONAL { ?x <http://dbpedia.org/ontology/postalCode> ?postalCode}
  OPTIONAL { ?x <http://dbpedia.org/ontology/type> ?type.}
  OPTIONAL { ?x rdfs:label ?label. FILTER(lang(?label) = 'es') }
  OPTIONAL { ?x <http://www.w3.org/2003/01/geo/wgs84_pos#lat> ?lat. }
  OPTIONAL { ?x <http://www.w3.org/2003/01/geo/wgs84_pos#long> ?long. }
}  
ORDER BY ?p ?label

