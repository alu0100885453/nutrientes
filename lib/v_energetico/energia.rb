 # Author::    Gabriel Fdez  (mailto:alu0100885453@ull.edu.es)

#Esta clase nos permite almacenar alimentos y calcular su IG
class Energia
    
    attr_accessor :alimento, :proteinas, :glucidos, :lipidos, :valor_ener
    
   include Comparable
 
    #Nos permite comparar objetos de Energia
    def <=>(other) 
        get_valor_energetico <=> other.get_valor_energetico
    
    end
    
    def initialize(a,b,c,d)
       
        @alimento, @proteinas, @glucidos, @lipidos= a, b, c, d
        @valor_ener
    end
    
    
    
    def add(a,b,c,d)
        initialize(a,b,c,d)
    end
    
    #Muestra los alimentos formateados
    def to_s

        out = "\t\t   Proteínas\tGlúcidos\tLípidos\n"
            out << @alimento
            out << "\t\t"
            out << @proteinas.to_s
            out << "\t\t"
            out << @glucidos.to_s
            out << "\t\t"
            out << @lipidos.to_s
            out << "\n"
        out
        
    end
    
    #Calcula y devuelve el valor energetico
    def get_valor_energetico

        @valor_ener = ((@proteinas + @glucidos) * 4 + @lipidos * 9).round(1)
        @valor_ener
    end
    
end

#Clase hija de Energia, contiene un objeto Energia y el nombre de un grupo de alimentos
class Grupo_alimentos < Energia

  
    def initialize(a,b,c,d,e)
        super(a,b,c,d)
        @nombre_grupo = e
    end
    
    def to_s
    
        
    end
    
end

