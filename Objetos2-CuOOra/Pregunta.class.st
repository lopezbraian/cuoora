Class {
	#name : #Pregunta,
	#superclass : #Entrada,
	#instVars : [
		'titulo',
		'topicos',
		'rtas'
	],
	#category : #'Objetos2-CuOOra-Model'
}

{ #category : #initialization }
Pregunta >> initialize [ 

super initialize.
creacion:= Date today.
]
