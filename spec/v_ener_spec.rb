#encoding: UTF-8
require 'spec_helper'
require 'lib/v_energetico/energia'


describe Energia do 
    before :each do
   # x=["Huevo frito","Leche vaca", "Yogurt", "Cerdo","Ternera","Pollo","Bacalao","Atún","Salmón","Aceite de oliva","Chocolate","Azúcar","Arroz","Lentejas","Papas","Tomate","Cebolla","Manzana","Plátanos"]
   # y=[14.1,3.3,3.8,21.5,21.1,20.6,17.7,21.5,19.9,0.0,5.3,0.0,6.8,23.5,2.0,1.0,1.3,0.3,1.2]
   # z=[0.0,4.8,4.9,0.0,0.0,0.0,0.0,0.0,0.0,0.2,47.0,99.8,77.7,52.0,15.4,3.5,5.8,12.4,21.4]
   # t=[19.5,3.2,3.8,6.3,3.1,5.6,0.4,15.5,13.6,99.6,30.0,0.0,0.6,1.4,0.1,0.2,0.3,0.4,0.2]
    #@tabla_alimentos =Energia.new(x,y,z,t)
    
    @Huevo_frito = Energia.new("Huevo frito", 14.1, 0.0, 19.5)
    @Leche_vaca  = Energia.new("Leche vaca", 3.3, 4.8, 3.2)
    @Yogurt      = Energia.new("Yogurt", 3.8, 4.9, 3.8)
    @Cerdo       = Energia.new("Cerdo", 21.5, 0.0, 6.3)
    @Ternera     = Energia.new("Ternera", 21.1, 0.0, 3.1)
    @Pollo       = Energia.new("Pollo", 20.6, 0.0, 5.6)
    @Bacalao     = Energia.new("Bacalao", 17.7, 0.0, 0.4)
    @Atun        = Energia.new("Atún", 21.5, 0.0, 15.5)
    @Salmon      = Energia.new("Salmón", 19.9, 0.0, 13.6)
    @Aceite_oliva= Energia.new("Aceite de oliva", 0.0, 0.2, 99.6)
    @Chocolate   = Energia.new("Chocolate", 5.3, 47.0, 30.0)
    @Azucar      = Energia.new("Azúcar", 0.0, 99.8, 0.0)
    @Arroz       = Energia.new("Arroz", 6.8, 77.7, 0.6)
    @Lentejas    = Energia.new("Lentejas", 23.5, 52.0, 1.4)
    @Papas       = Energia.new("Papas", 2.0, 15.4, 0.1)
    @Tomate      = Energia.new("Tomate", 1.0, 3.5, 0.2)
    @Cebolla     = Energia.new("Cebolla", 1.3, 5.8, 0.3)
    @Manzana     = Energia.new("Manzana", 0.3, 12.4, 0.4)
    @Platanos    = Energia.new("Plátanos", 1.2, 21.4, 0.2)
    
    
    
  end
    describe "expectativas" do
         
        
          it "Estan los nombres de los alimentos" do
            expect(@Huevo_frito.alimento).to eq("Huevo frito") 
          end
          
          it "Estan las proteinas de los alimentos" do
            expect(@Huevo_frito.proteinas).to eq(14.1)
          end
          
          it "Estan los glúcidos de los alimentos" do
            expect(@Huevo_frito.glucidos).to eq(0.0)
          end
          
          it "Estan los lípidos de los alimentos" do
            expect(@Huevo_frito.lipidos).to eq(19.5)
          end
  
          it "Estan los alimentos formateados" do
            expect(@Huevo_frito.to_s).to eq("\t\t   Proteínas\tGlúcidos\tLípidos\nHuevo frito\t\t14.1\t\t0.0\t\t19.5\n")
          end
          
          
          it "Estan los valores energéticos" do
            expect(@Huevo_frito.get_valor_energetico).to eq(231.9)
            expect(@Leche_vaca.get_valor_energetico).to eq(61.2)
            expect(@Yogurt.get_valor_energetico).to eq(69.0)
            expect(@Cerdo.get_valor_energetico).to eq(142.7)
            expect(@Ternera.get_valor_energetico).to eq(112.3)
            expect(@Pollo.get_valor_energetico).to eq(132.8)
            expect(@Bacalao.get_valor_energetico).to eq(74.4)
            expect(@Atun.get_valor_energetico).to eq(225.5)
            expect(@Salmon.get_valor_energetico).to eq(202.0)
            expect(@Aceite_oliva.get_valor_energetico).to eq(897.2)
            expect(@Chocolate.get_valor_energetico).to eq(479.2)
            expect(@Azucar.get_valor_energetico).to eq(399.2)
            expect(@Arroz.get_valor_energetico).to eq(343.4)
            expect(@Lentejas.get_valor_energetico).to eq(314.6)
            expect(@Papas.get_valor_energetico).to eq(70.5)
            expect(@Tomate.get_valor_energetico).to eq(19.8)
            expect(@Cebolla.get_valor_energetico).to eq(31.1)
            expect(@Manzana.get_valor_energetico).to eq(54.4)
            expect(@Platanos.get_valor_energetico).to eq(92.2)
            
          end
    end
end


describe Grupo_alimentos do   
    before :each do
   
      @Huevo_frito = Grupo_alimentos.new("Huevo frito", 14.1, 0.0, 19.5,"Huevos, lacteos y helados")
      @Leche_vaca  = Grupo_alimentos.new("Leche vaca", 3.3, 4.8, 3.2,"Huevos, lacteos y helados")
      @Yogurt      = Grupo_alimentos.new("Yogurt", 3.8, 4.9, 3.8,"Huevos, lacteos y helados")
      @Cerdo       = Grupo_alimentos.new("Cerdo", 21.5, 0.0, 6.3, "Carnes y derivados")
      @Ternera     = Grupo_alimentos.new("Ternera", 21.1, 0.0, 3.1, "Carnes y derivados")
      @Pollo       = Grupo_alimentos.new("Pollo", 20.6, 0.0, 5.6, "Carnes y derivados")
      @Bacalao     = Grupo_alimentos.new("Bacalao", 17.7, 0.0, 0.4, "Pescados y mariscos")
      @Atun        = Grupo_alimentos.new("Atún", 21.5, 0.0, 15.5, "Pescados y mariscos")
      @Salmon      = Grupo_alimentos.new("Salmón", 19.9, 0.0, 13.6, "Pescados y mariscos")
      @Aceite_oliva= Grupo_alimentos.new("Aceite de oliva", 0.0, 0.2, 99.6, "Alimentos grasos")
      @Mantequilla = Grupo_alimentos.new("Mantequilla", 0.7, 0.0, 83.2, "Alimentos grasos")
      @Chocolate   = Grupo_alimentos.new("Chocolate", 5.3, 47.0, 30.0, "Alimentos grasos")
      @Azucar      = Grupo_alimentos.new("Azúcar", 0.0, 99.8, 0.0, "Alimentos ricos en carbohidratos")
      @Arroz       = Grupo_alimentos.new("Arroz", 6.8, 77.7, 0.6, "Alimentos ricos en carbohidratos")
      @Lentejas    = Grupo_alimentos.new("Lentejas", 23.5, 52.0, 1.4, "Alimentos ricos en carbohidratos")
      @Papas       = Grupo_alimentos.new("Papas", 2.0, 15.4, 0.1, "Alimentos ricos en carbohidratos")
      @Tomate      = Grupo_alimentos.new("Tomate", 1.0, 3.5, 0.2, "Verduras y Hortalizas")
      @Cebolla     = Grupo_alimentos.new("Cebolla", 1.3, 5.8, 0.3, "Verduras y Hortalizas")
      @Calabaza    = Grupo_alimentos.new("Calabaza", 1.1, 4.8, 0.1, "Verduras y Hortalizas")
      @Manzana     = Grupo_alimentos.new("Manzana", 0.3, 12.4, 0.4, "Frutas")
      @Platanos    = Grupo_alimentos.new("Plátanos", 1.2, 21.4, 0.2, "Frutas")
      @Pera        = Grupo_alimentos.new("Pera", 0.5, 12.7, 0.3, "Frutas")
     end
     
     describe "expectativas" do
         
        
          it "la clase de un objeto" do
            expect(@Huevo_frito.instance_of? Grupo_alimentos).to eq(true)
          end
          
          it "la jerarquia de un objeto" do
            expect(@Huevo_frito.is_a? Energia).to eq(true)
          end
          
          it "la jerarquia de un objeto" do
            expect(@Huevo_frito.kind_of? Energia).to eq(true)
          end
          
    end
     
  end