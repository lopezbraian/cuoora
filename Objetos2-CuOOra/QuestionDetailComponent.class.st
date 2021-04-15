Class {
	#name : #QuestionDetailComponent,
	#superclass : #WAComponent,
	#instVars : [
		'parent',
		'pregunta'
	],
	#category : #'Objetos2-CuOOra-UI'
}

{ #category : #'as yet unclassified' }
QuestionDetailComponent class >> parent: aComponent question: aPregunta [

^self new parent: aComponent ; question: aPregunta ;yourself
]

{ #category : #'as yet unclassified' }
QuestionDetailComponent >> calificacion: aCanvas [
]

{ #category : #'as yet unclassified' }
QuestionDetailComponent >> infoPregunta: aCanvas [

aCanvas span: 'Realizada por '.
	aCanvas anchor
		class: 'nombre-user';
		callback: [ parent profileOfUser: pregunta user ];
		with: pregunta user usuario.
	aCanvas
		span: [ aCanvas text: ' | '.
			aCanvas text: pregunta respuestas size.
			aCanvas text: ' respuestas ' ].
	aCanvas
		paragraph: [ aCanvas text: pregunta likes.
			aCanvas text: ' Likes '.
			aCanvas text: ' | '.
			aCanvas text: pregunta dislikes.
			aCanvas text: ' Dislike ' ].
]

{ #category : #accessing }
QuestionDetailComponent >> parent [
	^ parent
]

{ #category : #accessing }
QuestionDetailComponent >> parent: anObject [
	parent := anObject
]

{ #category : #accessing }
QuestionDetailComponent >> question [
	^ pregunta
]

{ #category : #accessing }
QuestionDetailComponent >> question: anObject [
	pregunta := anObject
]

{ #category : #rendering }
QuestionDetailComponent >> renderContentOn: aCanvas [
	self titulo: aCanvas.
	self topicos: aCanvas.
	self infoPregunta: aCanvas .
	self calificacion: aCanvas.
	aCanvas horizontalRule
]

{ #category : #accessing }
QuestionDetailComponent >> titulo: aCanvas [

aCanvas anchor
		callback: [ parent goToDetail: pregunta ];
		class: 'pregunta';
		with: [ aCanvas paragraph
				with: pregunta titulo;
				class: 'title-pregunta' ].
]

{ #category : #accessing }
QuestionDetailComponent >> topicos: aCanvas [

aCanvas paragraph
		class: 'topico';
		with: [ aCanvas text: 'Tópicos: '.
			aCanvas
				span: [ pregunta topicos
						do: [ :t | 
							aCanvas text: t nombre.
							aCanvas text: ' / ' ] ] ].
]
