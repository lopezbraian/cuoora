"
Representa una Red Social De Preguntas y respuestas

Instance var usuarios topicos
"
Class {
	#name : #CuOOra,
	#superclass : #Object,
	#instVars : [
		'usuarios',
		'topicos'
	],
	#category : #'Objetos2-CuOOra-Model'
}

{ #category : #'as yet unclassified' }
CuOOra >> agregarTopico: aName conDescripcion: aText [
	topicos add: (Topico nombre: aName descripcion: aText)
]

{ #category : #'as yet unclassified' }
CuOOra >> borrarPregunta: aPregunta [
	(self
		preguntasDe: aPregunta user)remove: aPregunta
]

{ #category : #'as yet unclassified' }
CuOOra >> crearUsuario: aUser conPass: aPass [
	|user|
	user:= UsuarioC new: aUser conPass: aPass.
	usuarios add: user.
	^user.
]

{ #category : #initialization }
CuOOra >> initialize [ 
	super initialize.
	
	usuarios:= OrderedCollection new.
	topicos:= OrderedCollection new.
]

{ #category : #'as yet unclassified' }
CuOOra >> obtenerPreguntasDeTopico: aTopico [
	^usuarios flatCollect: [ :each | each preguntas topicos = aTopico ]
]

{ #category : #'as yet unclassified' }
CuOOra >> obtenerRespuestaAPregunta: aPregunta [ 
	aPregunta respuestas. "falta ver el tema del orden"
]

{ #category : #'as yet unclassified' }
CuOOra >> preguntasDe: aUsuario [
	^ aUsuario preguntas
]

{ #category : #'as yet unclassified' }
CuOOra >> puntajeDe: aUsuario [
	^(self preguntasDe: aUsuario size*20)+(self respuestasDe: aUsuario size*50).
]

{ #category : #'as yet unclassified' }
CuOOra >> respuestasDe: aUsuario [ 

^usuarios preguntas flatCollect: [ :each | each respuestas user == aUsuario ].
]
