Class {
	#name : #HomeComponent,
	#superclass : #WAComponent,
	#instVars : [
		'collectionPreguntas',
		'pregunta'
	],
	#category : #'Objetos2-CuOOra-UI'
}

{ #category : #callback }
HomeComponent >> agregarNuevaPregunta [
	self call: (QuestionComponent new)
]

{ #category : #hooks }
HomeComponent >> children [
	^ Array with: (BtnComponent withContent: 'Agregar Nueva Pregunta')
]

{ #category : #callback }
HomeComponent >> goToDetail: aPregunta [


self call:(EntradaDetailComponent withData: aPregunta)
]

{ #category : #initialization }
HomeComponent >> initialize [
	super initialize .

]

{ #category : #accessing }
HomeComponent >> model [ 
	^ CuOOra soleInstance .
]

{ #category : #callback }
HomeComponent >> profileOfUser: aUser [

^self call: (ProfileComponent newWithData: aUser )
]

{ #category : #rendering }
HomeComponent >> renderContentOn: aCanvas [
	aCanvas div
		class: 'wrap-btn-home';
		with: [ aCanvas anchor
				callback: [ self agregarNuevaPregunta ];
				class: 'btn-anchor';
				with:
						[ aCanvas render: (BtnComponent withContent: 'Agregar Nueva Pregunta') ] ].
	aCanvas heading: 'Últimas preguntas'.
	self renderFeed: aCanvas
]

{ #category : #rendering }
HomeComponent >> renderFeed: aCanvas [
	collectionPreguntas := CuOOra soleInstance
		obtenerPreguntasRelevantesPara: self session user.
	aCanvas
		unorderedList: [ (collectionPreguntas size > 5 ) ifTrue: [(collectionPreguntas first: 5)
				asSortedCollection: [ :p1 :p2 | p1 fecha <= p2 fecha ]].
		collectionPreguntas do: [ :each | 
					aCanvas
						listItem: [ aCanvas render: ( QuestionDetailComponent parent:self question: each ) ] ] ]
]
