import objetos.*

class Mago {
    var nombre
    var resistenciaMagica
    var objetosMagicos = []
    var poderInnato 
    var energiaMagica
    var categoria 

    method nombre() = nombre 
    method resistenciaMagica() = resistenciaMagica 
    method energiaMagica() = energiaMagica 

    method nuevaCategoria(unaCategoria) {
      categoria = unaCategoria
    }

    method ganarEnergia(unaCantidad) {
      energiaMagica = energiaMagica + unaCantidad
    }
    
    
    method modificarPoderInnato(unValor) {
      poderInnato = unValor.between(1, 10)
    }

    method cantidadParLetras() = (nombre.length()).even() 

    method poderTotal(mago) = objetosMagicos.sum{unObjeto => unObjeto.poderFinal(mago) * poderInnato}

   method desafiarMago(otroMago) {
    if(otroMago.puedeSerVencido(self)) {
            otroMago.perderEnergia()
            energiaMagica = energiaMagica ++ otroMago.energiaMagica()
        }
        else {
            throw new NoPuedeVencerlo()
        }
   }

   method puedeSerVencido(otroMago)

    method perderEnergia()
   
}


class MagoAprendiz inherits Mago {


    override method puedeSerVencido(otroMago) {
        return otroMago.poderTotal(otroMago) > self.resistenciaMagica()
    }
    

    override method perderEnergia() {
     energiaMagica = energiaMagica / 2
   }
}

class MagoVeterano inherits Mago {
    

    override method puedeSerVencido(otroMago) {
        const resistenciaAumentada = 1.5 * resistenciaMagica
        return otroMago.poderTotal(self) > resistenciaAumentada
    }

    override method perderEnergia() {
     energiaMagica = energiaMagica * 0.25
   }
}

class MagoInmortal inherits Mago {
    
    override method puedeSerVencido(otroMago) {
        return false
    }
}

class NoPuedeVencerlo inherits Exception(message = "El atacante no pudo vencer al defensor") {
  
}


const m1 = new MagoVeterano (nombre = "juana", resistenciaMagica = 10, poderInnato = 5, energiaMagica = 10, objetosMagicos = [v1, t1], categoria = "magoAprendiz")
const m2 = new MagoAprendiz (nombre = "juana", resistenciaMagica = 300, poderInnato = 5, energiaMagica = 10, objetosMagicos = [v1, t1], categoria = "magoAprendiz")
const m3 = new MagoVeterano (nombre = "juana", resistenciaMagica = 300, poderInnato = 5, energiaMagica = 10, objetosMagicos = [v1, t1], categoria = "magoAprendiz")


