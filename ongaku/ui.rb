require 'yaml'
require_relative 'ui/text'
require_relative 'ui/gui'
require_relative 'ui/web'

module Ongaku
	class Ui
		def self.main ui
			puts "#{self}"
			@modifica = false
			$archivio = Array.new
			Ui.carica_cd

			case ui
				when 'text'
					interfaccia = Ongaku::Text.new

				when 'gui'
					interfaccia = Ongaku::Gui.new

				when 'web'
					interfaccia = Ongaku::Web.new

				else
					puts "interfaccia non implementata"
					exit
			end
			interfaccia.avvia
		end

		def self.carica_cd
			YAML::load_documents(File.open(NOMEFILE, File::CREAT)) do |cd|
				$archivio << cd
			end
			$archivio.sort!
		end

		def salva_cd
			if @modifica
				open(NOMEFILE, 'w') do |file|
					$archivio.each { |cd| YAML::dump cd, file }
				end
			end
		end

		def self.aggiungi_cd tit, aut, anno
			@modifica = true
			nuovo_cd = Cd.new tit, aut, anno
			$archivio << nuovo_cd
			$archivio.sort!
		end

		def elimina_cd index
			@modifica = true
			$archivio.slice! index
		end
	end
end
