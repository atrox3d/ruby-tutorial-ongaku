require 'getoptlong'
require './ongaku/ui.rb'

module Ongaku
	NOME = "ongaku"
	VERSIONE = "0.0.1"
	DESCRIZIONE = "ongaku is a simple CD catalog"
	NOMEFILE = 'cd.yaml'

	class Applicazione
		def initialize
			opzioni
			Ongaku::Ui.main @ui
		end

		def opzioni
			opzioni = GetoptLong.new(
				["--ui", "-i", GetoptLong::OPTIONAL_ARGUMENT],
				["--help", "-h", GetoptLong::NO_ARGUMENT]
			)
			opzioni.each {|opt, val| gestione_opzioni opt, val}
		end

		def gestione_opzioni opt, valore
			case opt
				when '--help'
					Applicazione.aiuto
				when '--ui'
					@ui = valore
			end
		end

		def self.aiuto
			puts DESCRIZIONE
			puts "#{$0} -i [text|gui|web]"
			exit
		end
	end
end

Ongaku::Applicazione.new

