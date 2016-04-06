module Ongaku
	class Cd
		include Comparable
		attr_accessor :titolo, :autore, :anno

		def initialize titolo, autore, anno
			@titolo = titolo
			@autore = autore
			@anno = anno
		end

		def to_s
			" #{self.autore} - #{self.titolo} (#{self.anno})"
		end

		def <=> altro
			self.autore <=> altro.autore
		end
	end
end

