Class {
	#name : #PageProfileComponent,
	#superclass : #WAComponent,
	#instVars : [
		'profile'
	],
	#category : #'Objetos2-CuOOra-UI'
}

{ #category : #'instance creation' }
PageProfileComponent class >> newWithData: aUser [

^self new profile: aUser; yourself.
]

{ #category : #'as yet unclassified' }
PageProfileComponent >> follow [ 

self session user serFollowerDe: profile 
]

{ #category : #'as yet unclassified' }
PageProfileComponent >> follow: aCanvas [
	(profile == self session user)
		ifFalse: [(self session user esFollowerDe: profile)
		ifFalse: [	 ^ aCanvas anchor
					callback: [ self follow ];
					with: 'follow' ];
		ifTrue: [ ^ aCanvas anchor
					callback: [ self unFollow ];
					with: 'dejar de seguir' ]].
]

{ #category : #'as yet unclassified' }
PageProfileComponent >> pregunta: aPregunta en: aCanvas [

aCanvas paragraph
	
				class: 'title-pregunta';
				with: aPregunta titulo.
	aCanvas paragraph
		class: 'topico';
		with: [ aCanvas text: 'Tópicos: '.
			aCanvas
				span: [ aPregunta topicos
						do: [ :t | 
							aCanvas text: t nombre.
							aCanvas text: ' / ' ] ] ].
	aCanvas span: 'Realizada por '.
	aCanvas paragraph
		class: 'nombre-user';
		with: aPregunta user usuario.
	aCanvas
		span: [ aCanvas text: ' | '.
			aCanvas text: aPregunta respuestas size.
			aCanvas text: ' respuestas ' ].
	aCanvas
		paragraph: [ aCanvas text: aPregunta likes.
			aCanvas text: ' Likes '.
			aCanvas text: ' | '.
			aCanvas text: aPregunta dislikes.
			aCanvas text: ' Dislike ' ].
	aCanvas anchor
		class: 'btn-calif';
		callback: [ self session user agregarCalificacion: true aEntrada:  aPregunta  ];
		with: 'like'.
	aCanvas span: '| '.
	aCanvas anchor
		class: 'btn-calif';
		callback: [ self session user agregarCalificacion: false aEntrada:  aPregunta ];
		with: 'dislike'.
	aCanvas horizontalRule   
]

{ #category : #accessing }
PageProfileComponent >> preguntas: aCanvas [
		
aCanvas unorderedList: [ profile preguntas
				do:
					[ :each | aCanvas listItem: [ aCanvas render: [ self pregunta: each en: aCanvas	]] ]] .
]

{ #category : #accessing }
PageProfileComponent >> profile [
	^ profile
]

{ #category : #accessing }
PageProfileComponent >> profile: anObject [
	profile := anObject
]

{ #category : #rendering }
PageProfileComponent >> renderContentOn: aCanvas [
	aCanvas span
		class: 'title';
		with: [ aCanvas text: 'Preguntas de '.
			aCanvas text: profile usuario.
			aCanvas text: '  ' .
	self follow: aCanvas].
	self preguntas: aCanvas
]

{ #category : #'as yet unclassified' }
PageProfileComponent >> unFollow [

self session user unFollow: profile 
]
