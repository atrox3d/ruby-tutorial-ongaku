module Ongaku
	SEPARATORE = "======================================="
	class Text
		def avvia
			puts "#{self.class.name}.avvia"
			stampa_menu
			comando = gets.chomp

			case comando
			when 'a'
				aggiungi

			when 'e'
				elimina

			when 'l'
				elenca

			when 'q'
				Ongaku::Ui.salva_cd
				puts "Grazie per aver utilizzato #{NOME}!"
				exit

			else
				puts "comando inesistente: #{comando}"
			end
			avvia
		end

		def stampa_menu
			puts SEPARATORE
		    puts "Ongaku menu:"
		    puts "   (a) aggiungi CD         (e) elimina CD "
		    puts "   (l) visualizza lista    (q) esci da #{NOME}"
		    print "scegli: "
		end

		def aggiungi
			puts SEPARATORE
			puts "aggiungi cd"

			print "titolo: "
			tit = gets.chomp
			print "autore: "
			aut = gets.chomp
			print "anno: "
			anno = gets.chomp

			Ongaku::Ui.aggiungi_cd tit, aut, anno
		end

		def elimina
			elenca
			print "Scegli il CD da eliminare: "
			index = gets.chomp
			Ongaku::Ui.elimina_cd index.to_i -1
		end

		def elenca
			puts SEPARATORE
			puts "elenco CD"
			$archivio.each_index {|i| puts "#{(i+1).to_s.rjust(4)}: #{$archivio[i]}"}
		end
	end

end
