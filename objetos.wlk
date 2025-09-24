/** First Wollok example */
import wollok.game.*

object lionel {
	
	var property position = game.at(3,5)
	
	method image() {
		return "lionel-titular.png"
	}

	method retroceder() {
		position = game.at(0.max(position.x() - 1), position.y()) 
	}
	
	method avanzar() {
		position = game.at((game.width() - 1).min(position.x() + 1), position.y()) 
	}
	
	method levantarla() {
		self.validarEstaLionelConPelota()
		pelota.picar()
	}

	// validador

	method validarEstaLionelConPelota() {
		if (pelota.position() != self.position()) {
			self.error("La pelota está lejos de Lionel")
		}
	}
}


object pelota {
	const property image="pelota.png"
	var property position = game.at(5,5)

	method bajar() {
	  	position = position.down(1)
	}

	method subir() {
	  	position = position.up(1)
	}

	method picar() {
		self.subir()
		game.schedule(2000, {self.bajar()})
	}	
}
