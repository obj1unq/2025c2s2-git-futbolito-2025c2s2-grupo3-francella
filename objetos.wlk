//Ejemplo de Wollok
import wollok.game.*

object lionel {
	var estado = titular
	
	var property position = game.at(3,5)
	
	method image() {
		return estado.imagen()
	}

	method retroceder() {
		position = game.at(0.max(position.x() - 1), position.y()) 
	}
	
	method avanzar() {
		position = game.at((game.width() - 1).min(position.x() + 1), position.y()) 
	}

	method estaConLaPelota() {
		return position == pelota.position()
	}

	method validarEstaConLaPelota() {
		if (not self.estaConLaPelota()) {
			self.error("Lionel no está con la pelota")
		}
	}

	method patearPelota() {
		self.validarEstaConLaPelota()
		pelota.patear()
	}
	
	method cambiarEstado(){
		self.validarCambioDeCamiseta()
		estado = estado.opuesto()
	}
	
	method validarCambioDeCamiseta(){
		if (not(self.position().x() == 0)){
			self.error("Lionel no puede cambiar de camiseta en este lugar")
		}
	}
}


object pelota {
	const property image="pelota.png"
	var property position = game.at(5,5)

	//Metodos funcionales

	method patear() {
		position = game.at((game.width()-1).min(position.x()+3), 5)
	}	
}

object titular{
	const opuesto = suplente
	method imagen() = "lionel-titular.png"
	method opuesto() = opuesto
}

object suplente{
	const opuesto = titular
	method imagen() = "lionel-suplente.png"
	method opuesto() = opuesto
}