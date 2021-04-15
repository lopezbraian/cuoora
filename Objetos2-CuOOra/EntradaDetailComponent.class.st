Class {
	#name : #EntradaDetailComponent,
	#superclass : #WAComponent,
	#instVars : [
		'btnComponent',
		'pregunta',
		'data'
	],
	#classInstVars : [
		'data'
	],
	#category : #'Objetos2-CuOOra-UI'
}

{ #category : #'as yet unclassified' }
EntradaDetailComponent class >> withData: aData [
^ self new data:aData; yourself.
]

{ #category : #hooks }
EntradaDetailComponent >> children [ 
^Array with: btnComponent 
]

{ #category : #accessing }
EntradaDetailComponent >> data [
	^ data
]

{ #category : #accessing }
EntradaDetailComponent >> data: anObject [
	data := anObject
]

{ #category : #callback }
EntradaDetailComponent >> goToDetail: aPregunta [
	self call: (EntradaDetailComponent withData: aPregunta)
]

{ #category : #initialization }
EntradaDetailComponent >> initialize [ 
	super initialize.
	
	btnComponent := BtnComponent withContent: 'Agregar Respuesta'.
]

{ #category : #callbacks }
EntradaDetailComponent >> nuevaRespuesta [
	self call: (AnswerComponent newWithData: data)
]

{ #category : #callback }
EntradaDetailComponent >> profileOfUser: aUser [

^self call: (ProfileComponent newWithData: aUser )
]

{ #category : #rendering }
EntradaDetailComponent >> renderContentOn: aCanvas [
	aCanvas render: (QuestionDetailComponent parent: self question: data).
	self renderRespuestas: aCanvas.
	aCanvas paragraph
		class: 'center';
		with: 'No hay más respuestas'.
	aCanvas div
		class: 'wrap-btn-detail';
		with: [ aCanvas anchor
				class: 'center';
				callback: [ self nuevaRespuesta ];
				with: [ aCanvas render: btnComponent ] ]
]

{ #category : #rendering }
EntradaDetailComponent >> renderRespuestas: aCanvas [
	aCanvas
		unorderedList: [ data respuestas
				do: [ :each | aCanvas render: (AnswerDetailComponent parent: self answer: each )
					 ] ]
]
