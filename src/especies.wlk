class EspecieFauna {
	const property pesoReferencia
	const animalesDeUnaEspecie=[]
	
    method agregarAnimal(lista){
    	animalesDeUnaEspecie.addAll(lista)
    }
}

class EspecieFlora {
	const property alturaReferencia=10
	const plantasDeUnaEspecie=[]
	
	method agregarPlanta(lista){
    	plantasDeUnaEspecie.addAll(lista)
    }
}

class Animal {
	var property peso
	var property locomocion
	var especie
	
	
	/*method biomasa()= (self.peso()**2)/*/
	method esGrande()=self.peso()>(especie.pesoReferencia()*2)
	method esPequenio()=self.peso()<(especie.pesoReferencia()/2)
	method esMediano()= not self.esGrande() and not self.esPequenio()
	
}

class Planta {
	var property altura
	var especie
	
	method biomasa()= (self.altura()*2).max(especie.alturaReferencia())
	method esGrande()= self.altura()> especie.alturaReferencia()
}

object volar {method seSalva(animal) = animal.esGrande()}
object nadar {method seSalva(_) = true}
object correr{method seSalva(animal)=animal.esMediano()}
object quietos{method seSalva(_)=false}

