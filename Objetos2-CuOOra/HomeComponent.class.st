Class {
	#name : #HomeComponent,
	#superclass : #WAComponent,
	#instVars : [
		'collectionPreguntas',
		'btnComponent',
		'entradaComponent'
	],
	#category : #'Objetos2-CuOOra-UI'
}

{ #category : #'as yet unclassified' }
HomeComponent >> agregarNuevaPregunta [
]

{ #category : #hooks }
HomeComponent >> children [ 
|componentToRender|
componentToRender := OrderedCollection new.
componentToRender add: btnComponent.
componentToRender add: entradaComponent.
^ componentToRender 
]

{ #category : #initialization }
HomeComponent >> initialize [ 
	super initialize .
	btnComponent := BtnComponent withContent: 'Agregar una nueva respuesta' action: self agregarNuevaPregunta.
	entradaComponent := EntradaComponent new.
	 
]

{ #category : #accessing }
HomeComponent >> model [ 
	^ CuOOra soleInstance .
]

{ #category : #rendering }
HomeComponent >> renderContentOn:aCanvas [
	"btnComponent := ButtonComponent new.
	btnComponent action:self agregarNuevaPregunta .
	btnComponent content:'hola'.
	btnComponent renderContentOn:aCanvas."
	aCanvas div class: 'wrap-btn'; with:[
	aCanvas render: btnComponent .	
	].
	
	
	
	self renderFeed: aCanvas.
	
]

{ #category : #rendering }
HomeComponent >> renderFeed: aCanvas [

	collectionPreguntas := CuOOra soleInstance
		obtenerPreguntasRelevantesPara: self session user.
	aCanvas heading: 'Ultimas preguntas'.
	aCanvas
		unorderedList: 
		[ 
			collectionPreguntas
				do: 
				[ 
					:each | aCanvas listItem: [ aCanvas render:(EntradaComponent setData: each) ]
				] 
		].
]

{ #category : #hooks }
HomeComponent >> style [ 

^'
	.wrap-btn{
		position:relative;
	}
'
]
