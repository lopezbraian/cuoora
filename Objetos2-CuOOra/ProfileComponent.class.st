Class {
	#name : #ProfileComponent,
	#superclass : #WAComponent,
	#instVars : [
		'profile'
	],
	#category : #'Objetos2-CuOOra-UI'
}

{ #category : #'instance creation' }
ProfileComponent class >> newWithData: aUser [

^self new profile: aUser; yourself.
]

{ #category : #'as yet unclassified' }
ProfileComponent >> follow [ 

self session user serFollowerDe: profile 
]

{ #category : #'as yet unclassified' }
ProfileComponent >> follow: aCanvas [
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
ProfileComponent >> goToDetail: aPregunta [
	self call: (EntradaDetailComponent withData: aPregunta)
]

{ #category : #accessing }
ProfileComponent >> preguntas: aCanvas [
	aCanvas
		unorderedList: [ profile preguntas
				do: [ :each | 
					aCanvas
						listItem: [ aCanvas
								render: (QuestionDetailComponent parent: self question: each ) ] ] ]
]

{ #category : #accessing }
ProfileComponent >> profile [
	^ profile
]

{ #category : #accessing }
ProfileComponent >> profile: anObject [
	profile := anObject
]

{ #category : #callback }
ProfileComponent >> profileOfUser: aUser [
	^ self
		call:
			(LayoutComponent
				withComponent: (ProfileComponent newWithData: aUser))
]

{ #category : #rendering }
ProfileComponent >> renderContentOn: aCanvas [
	aCanvas span
		class: 'title';
		with: [ aCanvas text: 'Preguntas de '.
			aCanvas text: profile usuario.
			aCanvas text: '  ' .
	self follow: aCanvas].
	self preguntas: aCanvas
]

{ #category : #'as yet unclassified' }
ProfileComponent >> unFollow [

self session user unFollow: profile 
]
