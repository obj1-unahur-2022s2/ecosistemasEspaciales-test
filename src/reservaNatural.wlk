import especies.*

object reserva {
	const habitats = []
	
	method agregarHabitats(unHabitat)= habitats.add(unHabitat)
	method eliminarHabitats(unHabitat)=habitats.remove(unHabitat)
	
	method habitatConMayorBiomasa()= habitats.max({h => h.mayorBiomasa()})
	method totalDeBiomasa()= habitats.sum({h => h.totalDeBiomasa()})
	method habitatsDesequilibrados()= !habitats.any({h => h.esEquilibrado()})
	
}

class Habitat {
	const seresVivos = []
	
	method agregarSerVivo(unSerVivo){
	       seresVivos.add(unSerVivo)
	       unSerVivo.habitat(self)
	}
	method quitarSerVivo(unSerVivo)= seresVivos.remove(unSerVivo)
	
	method mayorBiomasa()= seresVivos.max({s=>s.biomasa()})
	method totalDeBiomasa()=seresVivos.sum({s=>s.biomasa()})
	method seresVivosGrandes()= seresVivos.filter({s=>s.esGrande()})
	method seresVivosPequenios()= seresVivos.filter({s=>s.esPequenio()})
	method hayAlgunSerVivoMediano()= seresVivos.any({s=>s.esMediano()})
	
	method esEquilibrado()= self.seresVivosGrandes().size() < self.seresVivosPequenios().size()/3 
		   and self.hayAlgunSerVivoMediano()	
			
	method incendiarHabitat()= seresVivos.forEach({s=>s.seIncendia()})
			   
}
