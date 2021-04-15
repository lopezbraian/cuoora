Class {
	#name : #AnswerComponent,
	#superclass : #WAComponent,
	#instVars : [
		'data',
		'respuesta'
	],
	#category : #'Objetos2-CuOOra-UI'
}

{ #category : #'instance creation' }
AnswerComponent class >> newWithData: data [ 

^self new data: data; yourself . 
]

{ #category : #callback }
AnswerComponent >> cancelar [

self answer.
]

{ #category : #accessing }
AnswerComponent >> data [
	^ data
]

{ #category : #accessing }
AnswerComponent >> data: anObject [
data := anObject
]

{ #category : #callback }
AnswerComponent >> goToDetail: aPregunta [
	self call: (EntradaDetailComponent withData: aPregunta)
]

{ #category : #callback }
AnswerComponent >> guardar [
	self session user
		agregarRespuestaAPregunta: data
		contenido: respuesta.
	self answer
]

{ #category : #initialization }
AnswerComponent >> initialize [ 

super initialize .
self respuesta: 'Escriba su respuesta aquí'
]

{ #category : #'as yet unclassified' }
AnswerComponent >> pregunta: aCanvas [
	aCanvas render: (QuestionDetailComponent parent: self question: data)
]

{ #category : #callback }
AnswerComponent >> profileOfUser: aUser [
	^ self call: (ProfileComponent newWithData: aUser)
]

{ #category : #rendering }
AnswerComponent >> renderContentOn: aCanvas [
	self pregunta: aCanvas.
	aCanvas div
		class: 'container-respuesta';
		with: [ aCanvas paragraph: 'RESPONDER '.
			aCanvas
				form: [ aCanvas textArea
						on: #respuesta of: self;
						columns: 80;
						rows: 5.
					aCanvas break.
					aCanvas div
						class: 'wrap-button-form';
						with: [ aCanvas submitButton
								callback: [ self guardar ];
								with: 'Guardar'.
							aCanvas submitButton
								callback: [ self cancelar ];
								with: 'Cancelar' ] ] ]
]

{ #category : #accessing }
AnswerComponent >> respuesta [
	^ respuesta
]

{ #category : #accessing }
AnswerComponent >> respuesta: anObject [
	respuesta := anObject
]
