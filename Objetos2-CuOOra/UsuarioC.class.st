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
UsuarioC >> agregarCalificacion:aBoolean aPregunta:aEntrada [

aEntrada aCalifacion: aBoolean  from: self. 
]

{ #category : #'as yet unclassified' }
UsuarioC >> agregarPreguntaConTitulo: aTitle Descripcion: aText Topicos: aTopico [

self preguntas: (Pregunta newConTitulo: aTitle descripcion: aText  topico: aTopico  from: self )
	
]

{ #category : #'as yet unclassified' }
UsuarioC >> agregarRespuestaAPregunta: aPregunta contenido: aText from: aUsuario [


aPregunta agregarRespuesta: (Respuesta newPreguntaConcontenido: aText from: aUsuario )
]

{ #category : #'as yet unclassified' }
UsuarioC >> agregarTopicoDeInteres: aTopico [

topicos add: aTopico
]

{ #category : #accessing }
UsuarioC >> fechaDeCreacion [
	^ creacion
]

{ #category : #initialization }
UsuarioC >> initialize [
	super initialize.
	creacion := DateAndTime now.
	seguidos := OrderedCollection new.
	topicos := OrderedCollection new.
	preguntas := OrderedCollection new
]

{ #category : #'as yet unclassified' }
UsuarioC >> obtenerPreguntasDeTopico: aTopico [
	"De la coleccion de preguntas selecciona los que tienen preguntas que cumplan con el topico solicitado"

	^ preguntas 	flatCollect: [ :each | each topicos flatCollect: [ :topico | topico = aTopico ] ]
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
