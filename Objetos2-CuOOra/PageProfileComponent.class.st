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

{ #category : #callback }
PageProfileComponent >> goToDetail: aPregunta [
	self call: (PageEntradaDetailComponent withData: aPregunta)
]

{ #category : #accessing }
PageProfileComponent >> preguntas: aCanvas [
	aCanvas
		unorderedList: [ profile preguntas
				do: [ :each | 
					aCanvas
						listItem: [ aCanvas
								render: (QuestionDetailComponent parent: self question: each ) ] ] ]
]

{ #category : #accessing }
PageProfileComponent >> profile [
	^ profile
]

{ #category : #accessing }
PageProfileComponent >> profile: anObject [
	profile := anObject
]

{ #category : #callback }
PageProfileComponent >> profileOfUser: aUser [
	^ self call: (PageProfileComponent newWithData: aUser)
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
