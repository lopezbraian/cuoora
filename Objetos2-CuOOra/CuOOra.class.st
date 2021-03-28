Class {
	#name : #CuOOra,
	#superclass : #Object,
	#instVars : [
		'usuarios',
		'topicos',
		'preguntas'
	],
	#category : #'Objetos2-CuOOra-Model'
}

{ #category : #'as yet unclassified' }
CuOOra >> agregarFollowerA: aUsuario seguidoPor: aUsuario2 [
	aUsuario agregarFollower: aUsuario2.
	aUsuario2 agregarFollowed: aUsuario.
	
]

{ #category : #'as yet unclassified' }
CuOOra >> agregarPreguntaConTitulo: aTitle Descripcion: aText Topicos: aTopico de: aUsuarioC [
]

{ #category : #'as yet unclassified' }
CuOOra >> agregarRespuestaAPregunta: aPregunta descripcion: aText from: aUsuario [

aPregunta agregarRespuesta: (Respuesta newConDescripcion: aText from: aUsuario )
	
]

{ #category : #'as yet unclassified' }
CuOOra >> agregarTopico: aName conDescripcion: aText [
	topicos add: (Topico nombre: aName descripcion: aText)
]

{ #category : #'as yet unclassified' }
CuOOra >> borrarPregunta: aPregunta [

preguntas remove: aPregunta "ver como seria si lo implementamos dentro de los usuarios"
]

{ #category : #'as yet unclassified' }
CuOOra >> crearUsuario: aUser conPass: aPass [
	usuarios add: (UsuarioC new: aUser conPass: aPass)
]

{ #category : #'as yet unclassified' }
CuOOra >> obtenerRespuestaAPregunta: aPregunta [ 
	aPregunta respuestas. "falta ver el tema del orden"
]

{ #category : #'as yet unclassified' }
CuOOra >> preguntasDe: aUsuario [
	^preguntas select: [ :each | each user = aUsuario ]
	
"Si las preguntas las ponemos dentro de los usuarios seria aUsuario preguntas."
]

{ #category : #'as yet unclassified' }
CuOOra >> puntajeDe: aUsuario [

	
]

{ #category : #'as yet unclassified' }
CuOOra >> registrarTopico: aTopico A: aUsuario [ 
	aUsuario agregarTopicoDeInteres: aTopico 
]
