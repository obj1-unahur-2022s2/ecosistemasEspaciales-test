import reservaNatural.*

class EspecieFauna {
	const property pesoReferencia
	var property locomocion
	var property coeficiente
}


class EspecieFlora {
	const property alturaReferencia=10
}



class Animal {
	var property peso
	var especie
	var habitat
	
	method biomasa()= (self.peso()**2)/especie.coeficiente()
	method esGrande()= self.peso()>(especie.pesoReferencia()*2)
	method esPequenio()= self.peso()<(especie.pesoReferencia()/2)
	method esMediano()= not self.esGrande() and not self.esPequenio()
	method seIncendia(){
		  especie.locomocion().seSalva(self) and self.peso()-(self.peso()*0.1)
		  habitat.quitarSerVivo(!especie.locomocion().seSalva(self))
	}	
}



class Planta {
	var property altura
	var especie
	var habitat
	
	method biomasa()= (self.altura()*2).min(especie.alturaReferencia())
	method esGrande()= self.altura()>= especie.alturaReferencia()
	method esPequenio()= self.altura()<(especie.alturaReferencia())
	method esMediano()= not self.esGrande() and not self.esPequenio()
	method seIncendia(){
		if (self.esPequenio()){habitat.quitarSerVivo(self)}
	    else self.altura()-5
	}
	
}

object volar {method seSalva(animal) = animal.esGrande()}
object nadar {method seSalva(_) = true}
object correr{method seSalva(animal)=animal.esMediano()}
object quietos{method seSalva(_)=false}

