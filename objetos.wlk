import magos.*

class Objeto {
    var poderBase

    method poderFinal(unMago) = poderBase + self.poderExtra(unMago)
    method poderExtra (unMago)
}

class Varita inherits Objeto {

    override method poderExtra(unMago) {
      if(unMago.cantidadParLetras()) {
        return poderBase * 1.5
      } else {
        return poderBase
      }
    }
}

class Tunica inherits Objeto {
    
    override method poderExtra(unMago) = (2 * unMago.resistenciaMagica())

}

class TunicaEpica inherits Tunica {
 
    override method poderExtra(unMago) = (2 * unMago.resistenciaMagica()) + 10 //ver
}



class Amuleto inherits Objeto {
    
    override method poderFinal(unMago) = 200
}

object ojota inherits Objeto (poderBase = 10) {
    
    override method poderExtra(unMago) = 10 * unMago.length()
}

const v1 = new Varita (poderBase = 10)
const t1 = new Tunica (poderBase = 10)
const t2 = new TunicaEpica (poderBase = 10)
