 #------------------------- Funciones:

 def getQuestion(number_q)
 	#Función que retorna un hash con la pregunta y la respuesta correspondiente al valor ingresado number_q
 	arr = IO.readlines("questions_answers.txt") #convertir cada linea del archivo en un elemento de un array
 	arr.delete("\n") #eliminar los saltos de línea
 	hashQA={:question =>arr[2*number_q], :answer => arr[2*number_q+1] }
 	hashQA[:question].tr!("\n","")
 	hashQA[:answer].tr!("\n","")
 	hashQA

 end

 
#----------------------------- MAIN:
 hits=0 #Aciertos
 misses=0
 question_num=0 #número de pregunta (son 5)
 num_of_questions=5 #cantidad de preguntas a realizar
 max_misses=5 #Cantidad de errores maxima para terminar el juego

 puts "Bienvenido a reto 5, Para jugar, solo ingresa el termino correcto para cada una de las definiciones, 
 Listo? Vamos...!"

 
 while true #Ciclo infinito (internamente hay una sentencia "break" que lo rompe)

 	hashQA=getQuestion(question_num) #hash con pregunta y respuesta
 	print "#{question_num+1} #{hashQA[:question]}: " 
 	user_ans = gets.chomp

 	if user_ans.casecmp(hashQA[:answer])==0 #compara la respuesta del usuario con la del archivo (Case insensitive)
 		hits += 1 #aumenta los aciertos
 		puts "Correcto!"
 		if hits == num_of_questions #ultima pregunta
 			puts "!Ganaste¡ Respondiste correctamente todas las preguntas"
 			break #Salir del ciclo infinito
 		else
 			#Respuesta correcta pero no es la última
 			question_num +=1 #siguiente pregunta
 		end
 	else
 		misses +=1 #aumenta los errores
 		if misses==max_misses
 			puts "Incorrecto!           Error##{misses}."
 			puts "Juego terminado Fallaste #{max_misses} veces"
 			break #Salir del ciclo infinito
 		else
 			puts "Incorrecto!, Intenta nuevamente         Error##{misses}."
 		end
 		
 	end
 end

 


