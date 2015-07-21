class ScholarsArchiveSchema < ActiveTriples::Schema
  property :spatial, predicate: ::RDF::DC.spatial
  property :contributor, predicate: ::RDF::DC.contributor 
  property :temporal, predicate: ::RDF::DC.temporal
  property :creator, predicate: ::RDF::DC.creator 
  property :abstract, predicate: ::RDF::DC.abstract 
  property :tableOfContents, predicate: ::RDF::DC.tableOfContents
  property :description, predicate: ::RDF::DC.description 
  property :format, predicate: ::RDF::DC.format
  property :bibliographicCitation, predicate: ::RDF::DC.bibliographicCitation
  property :language, predicate: ::RDF::DC.language 
  property :publisher, predicate: ::RDF::DC.publisher 
  property :provenance, predicate: ::RDF::DC.provenance
  property :isReferencedBy, predicate: ::RDF::DC.isReferencedBy
  property :relation, predicate: ::RDF::DC.relation
  property :rights, predicate: ::RDF::DC.rights 
  property :subject, predicate: ::RDF::DC.subject 
  property :title, predicate: ::RDF::DC.title 
  property :dc_type, predicate: ::RDF::DC.type
  property :date, predicate: ::RDF::DC.date
  property :isCitedBy, predicate: ::RDF::URI("http://purl.org/spar/cito/isCitedBy")
  property :isIdenticalTo, predicate: ::RDF::URI("http://purl.org/dc/terms/isIdenticalto")
  property :isPartOf, predicate: ::RDF::DC.isPartOf
  property :isVersionOf, predicate: ::RDF::DC.isVersionOf
  property :doi, predicate: ::RDF::Vocab::Identifiers.doi
  property :hdl, predicate: ::RDF::Vocab::Identifiers.hdl
  property :orcid, predicate: ::RDF::Vocab::Identifiers.orcid
  property :rid, predicate: ::RDF::Vocab::Identifiers.rid
end
