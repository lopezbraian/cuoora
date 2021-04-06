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
	"De la coleccion de usuarios selecciona los que tienen preguntas que cumplan con el topico solicitado"

	^ usuarios
		flatCollect: [ :each | each obtenerPreguntasDeTopico: aTopico ] .
]

{ #category : #'as yet unclassified' }
CuOOra >> obtenerPreguntasRelevantesPara: aUser [
	"Se consideran relevantes las preguntas que pertenecen a los usuarios seguidos y a las que coinciden con los topicos de interes"
|relevantes|
relevantes:= OrderedCollection new.
relevantes addAll:(	usuarios
		flatCollect: [ :each | 
			aUser topicos
				flatCollect: [ :topico | each obtenerPreguntasDeTopico: topico ] ]).
relevantes addAll:((usuarios
		flatCollect: [ :each | aUser seguidos flatCollect: [ :seguidos | seguidos == each ] ])
		flatCollect: [ :s | s preguntas ]).
		
^relevantes 
]

{ #category : #'as yet unclassified' }
CuOOra >> obtenerRespuestaAPregunta: aPregunta [
	^aPregunta respuestas	asSortedCollection sortBlock: [ :p1 :p2| p1 puntaje >= p2 puntaje ].
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

{ #category : #accessing }
CuOOra >> topicos [
^topicos.
]

{ #category : #accessing }
CuOOra >> usuarios [

^usuarios
]
