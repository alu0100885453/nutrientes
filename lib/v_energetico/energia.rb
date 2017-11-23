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
    
    def indice_glucemico(alimento, glucosa)
    
       alim = [],[]
       gluc = [],[]
       alim_sum = [],[]
       gluc_sum = [],[]
       aibc = [],[]
       ig_ind = [],[]
       
       #para caada individuo calcula el AIBC (área incremental bajo la curva)
       alimento.each_with_index do |val, index|

            alimento[index].each_with_index do |val2, index2|
            
                next if index2==0
                alim[index] << ((alimento[index][index2] - alimento[index][0]) + (alimento[index][index2-1] - alimento[index][0]))*2.5 
                gluc[index] << ((glucosa[index][index2] - glucosa[index][0]) + (glucosa[index][index2-1] - glucosa[index][0]))*2.5
            end
            
            alim_sum[index] = alim[index].reduce(:+)
            gluc_sum[index] = gluc[index].reduce(:+)
       end
       
       #agrupamos los valores de cada individuo
       aibc = alim_sum.zip(gluc_sum)
       
       #dividimos el AIBC del alimento entre el de la glucosa para cada individuo y hallamos la media
       alim_sum.each_with_index{|val,index| ig_ind[index] = aibc[index].reduce(:/)*100}
       @IG = (ig_ind.reduce(:+)/2).round(2)
        
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

