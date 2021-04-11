Class {
	#name : #UsuarioCTest,
	#superclass : #TestCase,
	#instVars : [
		'user',
		'user2',
		'topicoMusica',
		'topicoSeaside'
	],
	#category : #'Objetos2-CuOOra-Test'
}

{ #category : #running }
UsuarioCTest >> setUp [
	"Hooks that subclasses may override to define the fixture of test."

	user := UsuarioC new: 'pedro' conPass: '123456'.
	user2 := UsuarioC new: 'maria' conPass: '123456'.
	topicoMusica := OrderedCollection new.
	topicoMusica add:(Topico
		nombre: 'Musica'
		descripcion: 'Topico de musica').
	topicoSeaside := OrderedCollection new.
	topicoSeaside add:(Topico
		nombre: 'Seaside'
		descripcion: 'Topico de Seaside').
	"______________NUEVA PREGUNTA______________"
	user
		agregarPreguntaConTitulo: 'Colecciones en pharo'
		Descripcion: 'diferencias entre detect/includes'
		Topicos: topicoMusica.
	user2
		agregarPreguntaConTitulo: 'Seaside'
		Descripcion: 'que es seaside?'
		Topicos: topicoSeaside.


	"______________NUEVO TOPICO DE INTERES______________"
	"user
		agregarTopicoDeInteres: (topicoMusica)."

	"______________SEGUIR A USUARIO______________"
	user serFollowerDe: (UsuarioC new: 'OO2' conPass: '123456').

	"______________NUEVA RESPUESTA A PREGUNTA______________"
	user
		agregarRespuestaAPregunta: user2 preguntas first
		contenido: 'Es un framework para realizar aplicaciones web'
]

{ #category : #test }
UsuarioCTest >> testAgregarCalificacionAEntrada [

	user agregarCalificacion: false aEntrada: user preguntas first.
	
	self assert: user preguntas first calificaciones  size equals: 1.
	
	"Se comprueba que el like es del usuario que lo dio"
	self assert: user preguntas first calificaciones first  user equals: user.
	
	"Se comprueba que el valor de like corresponde"
	self assert: user preguntas first calificaciones first  like equals: false.
	
	"Se cambia el like"
	user agregarCalificacion: true aEntrada: user preguntas first.
	self assert: user preguntas first calificaciones first  like equals: true.
]

{ #category : #tests }
UsuarioCTest >> testAgregarRespuestaAPreguntaContenido [
	self assert: user2 preguntas first respuestas size equals: 1.
	self
		assert: user2 preguntas first respuestas first content
		equals: 'Es un framework para realizar aplicaciones web'.
	self assert: user2 preguntas first respuestas first user equals: user
]

{ #category : #tests }
UsuarioCTest >> testAgregarTopicoDeInteres [
	user agregarTopicoDeInteres: topicoMusica first.
	self
		assert: user topicos first nombre equals: 'Musica';
		assert: user topicos size equals: 1
]

{ #category : #tests }
UsuarioCTest >> testBorrarPregunta [
	| p |
	p := user preguntas first.
	user borrarPregunta: p.
	self assert: user preguntas size equals: 0
]

{ #category : #test }
UsuarioCTest >> testObtenerPreguntasDeTopico [
	| preguntasTopicoMusica |
	preguntasTopicoMusica := user
		obtenerPreguntasDeTopico: (topicoMusica first).
	self
		assert: (preguntasTopicoMusica first )		equals: topicoMusica first
]

{ #category : #tests }
UsuarioCTest >> testSerFollowerDe [
	self assert: user seguidos first usuario equals: 'OO2'.
	self assert: user seguidos size equals: 1
]

{ #category : #tests }
UsuarioCTest >> testagregarPreguntaConTituloDescripcionTopicos [
	self
		assert: user preguntas first titulo equals: 'Colecciones en pharo';
		assert: user preguntas size equals: 1
]
