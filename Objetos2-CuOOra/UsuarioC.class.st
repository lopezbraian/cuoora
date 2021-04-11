"
Representa a un Usuario de Cuoora
"
Class {
	#name : #UsuarioC,
	#superclass : #Object,
	#instVars : [
		'user',
		'pass',
		'creacion',
		'seguidos',
		'topicos',
		'preguntas'
	],
	#category : #'Objetos2-CuOOra-Model'
}

{ #category : #'instance creation' }
UsuarioC class >> new: aUser conPass: aPass [
	| u |
	u := self new.
	^u
		usuario: aUser;
		pass: aPass
]

{ #category : #'as yet unclassified' }
UsuarioC >> agregarCalificacion:aBoolean aEntrada:aEntrada [

aEntrada aCalifacion: aBoolean  from: self. 
]

{ #category : #'as yet unclassified' }
UsuarioC >> agregarPreguntaConTitulo: aTitle Descripcion: aText Topicos: aTopico [
	|p|
	p:= Pregunta
				newConTitulo: aTitle
				descripcion: aText
				topico: aTopico
				from: self.
	self
		preguntas:
			p.
			
	^p
]

{ #category : #'as yet unclassified' }
UsuarioC >> agregarRespuestaAPregunta: aPregunta contenido: aText [
	aPregunta
		agregarRespuesta: (Respuesta newPreguntaConcontenido: aText from: self)
]

{ #category : #'as yet unclassified' }
UsuarioC >> agregarTopicoDeInteres: aTopico [
	topicos add: aTopico
]

{ #category : #'as yet unclassified' }
UsuarioC >> borrarPregunta: aPregunta [
	preguntas remove: aPregunta
]

{ #category : #accessing }
UsuarioC >> fecha [ 

^creacion asDate 
]

{ #category : #accessing }
UsuarioC >> fechaDeCreacion [
	^ creacion
]

{ #category : #accessing }
UsuarioC >> hora [

^ creacion asTime 
]

{ #category : #initialization }
UsuarioC >> initialize [
	super initialize.
	creacion := DateAndTime now.
	seguidos := OrderedCollection new.
	topicos := OrderedCollection new.
	preguntas := OrderedCollection new.

]

{ #category : #'as yet unclassified' }
UsuarioC >> obtenerPreguntasDeTopico: aTopico [
	"De la coleccion de preguntas selecciona los que tienen preguntas que cumplan con el topico solicitado"

	^ preguntas
		flatCollect: [ :each | each topicos select: [ :topico | topico = aTopico ] ]
]

{ #category : #'as yet unclassified' }
UsuarioC >> obtenerRespuestasDe: aUsuario [

^preguntas flatCollect: [ :p | p obtenerRespuestasDe: aUsuario  ]
]

{ #category : #accessing }
UsuarioC >> pass [
	^pass
]

{ #category : #accessing }
UsuarioC >> pass: anObject [
	pass := anObject
]

{ #category : #accessing }
UsuarioC >> preguntas [
	^ preguntas
]

{ #category : #accessing }
UsuarioC >> preguntas: aEntrada [
	preguntas add: aEntrada
]

{ #category : #accessing }
UsuarioC >> seguidos [
	^ seguidos
]

{ #category : #'as yet unclassified' }
UsuarioC >> serFollowerDe: aUsuario [
	seguidos add: aUsuario
]

{ #category : #'as yet unclassified' }
UsuarioC >> topicos [

^topicos
]

{ #category : #accessing }
UsuarioC >> usuario [
	^user
]

{ #category : #accessing }
UsuarioC >> usuario: aUser [

user:= aUser
]
