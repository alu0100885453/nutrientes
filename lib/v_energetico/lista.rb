Node= Struct.new(:value, :next, :prev)

class Lista
    attr_reader :inicio, :final
    def initialize(node)
        @inicio= node
        @final= node
    end
    
    def extract_beg()
        if (@inicio != nil)
            aux= @inicio
            @inicio= @inicio.next
            return aux
        else
            return nil
        end
    end
    
    def extract_end()
        if (@final != nil)
            aux= @final
            @final= @final.prev
            return aux
        else
            return nil
        end
    end
    
    def insert_single(nodo) #inicio
        if(@inicio == nil)
            @inicio= nodo
            @final= nodo
        else
            aux= @inicio.next
            @inicio= nodo
            @inicio.next= aux
        end
    end

    def insert_multiple(nodos)
        nodos.each do |element|
            insert_single(element)
        end
    end

    def empty()
        if(@inicio == nil)
            return true
        else
            return false
        end
    end
end