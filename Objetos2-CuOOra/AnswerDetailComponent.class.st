Class {
	#name : #AnswerDetailComponent,
	#superclass : #WAComponent,
	#instVars : [
		'parent',
		'respuesta'
	],
	#category : #'Objetos2-CuOOra-UI'
}

{ #category : #'as yet unclassified' }
AnswerDetailComponent class >> parent: aComponent answer: aRespuesta [

^self new parent: aComponent ; respuesta: aRespuesta ; yourself 
]

{ #category : #'as yet unclassified' }
AnswerDetailComponent >> calificacion: aCanvas [


					aCanvas anchor
						class: 'btn-calif';
						callback: [ self session user agregarCalificacion: true aEntrada: respuesta ];
						with: 'like'.
					aCanvas span: '| '.
					aCanvas anchor
						class: 'btn-calif';
						callback: [ self session user agregarCalificacion: false aEntrada: respuesta ];
						with: 'dislike'.
					aCanvas horizontalRule 
]

{ #category : #'as yet unclassified' }
AnswerDetailComponent >> infoRespuesta: aCanvas [

aCanvas
		listItem: [ aCanvas
				render: [ aCanvas span: 'Respuesta de '.
					aCanvas anchor
						class: 'nombre-user';
						callback: [ parent profileOfUser: respuesta user ];
						with: respuesta user usuario.
					aCanvas text: ' '.
					aCanvas paragraph: respuesta content.
					aCanvas
						paragraph: [ aCanvas text: respuesta likes.
							aCanvas text: ' Likes '.
							aCanvas text: ' | '.
							aCanvas text: respuesta dislikes.
							aCanvas text: ' Dislike ' ].]]
]

{ #category : #accessing }
AnswerDetailComponent >> parent [
	^ parent
]

{ #category : #accessing }
AnswerDetailComponent >> parent: anObject [
	parent := anObject
]

{ #category : #rendering }
AnswerDetailComponent >> renderContentOn: aCanvas [
	aCanvas
		listItem: [ aCanvas
				render: [ aCanvas span: 'Respuesta de '.
					aCanvas anchor
						class: 'nombre-user';
						callback: [ parent profileOfUser: respuesta user ];
						with: respuesta user usuario.
					aCanvas text: ' '.
					aCanvas paragraph: respuesta content.
					aCanvas
						paragraph: [ aCanvas text: respuesta likes.
							aCanvas text: ' Likes '.
							aCanvas text: ' | '.
							aCanvas text: respuesta dislikes.
							aCanvas text: ' Dislike ' ].
					aCanvas anchor
						class: 'btn-calif';
						callback: [ self session user agregarCalificacion: true aEntrada: respuesta ];
						with: 'like'.
					aCanvas span: '| '.
					aCanvas anchor
						class: 'btn-calif';
						callback: [ self session user agregarCalificacion: false aEntrada: respuesta ];
						with: 'dislike'.
					aCanvas horizontalRule ] ]
]

{ #category : #accessing }
AnswerDetailComponent >> respuesta [
	^ respuesta
]

{ #category : #accessing }
AnswerDetailComponent >> respuesta: anObject [
	respuesta := anObject
]
