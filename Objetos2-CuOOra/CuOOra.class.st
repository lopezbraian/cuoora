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
	#classInstVars : [
		'soleInstance'
	],
	#category : #'Objetos2-CuOOra-Model'
}

{ #category : #accessing }
CuOOra class >> soleInstance [
	^soleInstance ifNil: [
		soleInstance := self new .
	].


	
]

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
	|topicoMusica admin|
	super initialize.
	
	usuarios:= OrderedCollection new.
	topicos:= OrderedCollection new.
	
	
	
	
]

{ #category : #'as yet unclassified' }
CuOOra >> loginWithUsername: aUsername pass: aPass [
	^ usuarios 
		detect: [ :each | each usuario = aUsername & (each pass = aPass) ]
		ifNone: [ nil ].
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

	| relevantes |
	relevantes := Set new.
	aUser topicos isEmpty
		ifFalse: [ relevantes
				addAll:((usuarios reject:[ :each | each == aUser])
								flatCollect: [ :u | aUser topicos
										flatCollect: [ :t | u obtenerPreguntasDeTopico: t ]])].
	aUser seguidos isEmpty
		ifFalse: [ relevantes
				addAll:
					((usuarios
						flatCollect: [ :u | aUser seguidos select: [ :s | s == u ] ])
						flatCollect: [ :s | s preguntas ]) ].
	^ relevantes
]

{ #category : #'as yet unclassified' }
CuOOra >> obtenerRespuestaAPregunta: aPregunta [
	^ aPregunta respuestas asSortedCollection: [ :p1 :p2 | p1 puntaje >= p2 puntaje ]
]

{ #category : #'as yet unclassified' }
CuOOra >> preguntasDe: aUsuario [
	^ aUsuario preguntas
]

{ #category : #'as yet unclassified' }
CuOOra >> puntajeDe: aUsuario [
	^ ((self preguntasDe: aUsuario) size * 20)
		+ ((self respuestasDe: aUsuario) size * 50)
]

{ #category : #'as yet unclassified' }
CuOOra >> respuestasDe: aUsuario [
	"tiene que considerar las respuestas a sus propias preguntas?????"

	^ (usuarios reject: [:u | u ==aUsuario])flatCollect: [ :u | u obtenerRespuestasDe: aUsuario ].
]

{ #category : #accessing }
CuOOra >> topicos [
^topicos.
]

{ #category : #accessing }
CuOOra >> usuarios [

^usuarios
]
