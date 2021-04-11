Class {
	#name : #BtnComponent,
	#superclass : #WAComponent,
	#instVars : [
		'content',
		'action'
	],
	#category : #'Objetos2-CuOOra-UI'
}

{ #category : #initialization }
BtnComponent class >> withContent:aContent action:anAction [
^	self new
		content: aContent;
		action: anAction .
	
]

{ #category : #initialization }
BtnComponent >> action [

^action .
]

{ #category : #initialization }
BtnComponent >> action:anAction [

action:=anAction .
]

{ #category : #initialization }
BtnComponent >> content [ 
	^content.
]

{ #category : #initialization }
BtnComponent >> content: aContent [

	content:=aContent.
]

{ #category : #initialization }
BtnComponent >> initialize [
	super initialize.
]

{ #category : #rendering }
BtnComponent >> renderContentOn: aCanvas [
	
	aCanvas div 
		class:'btn';
		with: [
			aCanvas anchor
					class: 'a-btn';
       			callback: [ action  ];
       			with: [ 
						aCanvas div class:'btn-icon' ; with:'+'.
						aCanvas paragraph class:'btn-text';
						with: 'Hacer una nueva pregunta'
					]
		].
]

{ #category : #hooks }
BtnComponent >> style [ 
^'
.btn { 
position: absolute;
	right:0;
 }
.a-btn {
	display:flex;
	align-items:center;
	text-decoration:none;
	color:black;
}
.btn-icon { 
    width: 30px;
    height: 30px;
    background: red;
    color: white;
    display: flex;
    align-items: center;
    justify-content: center;
    font-weight: bold;
    font-size: 25px;
    border-radius: 50%;
    margin: 0;
    padding: 0;
	box-shadow: 0px 8px 10px 0px rgb(0 0 0 / 53%);
    -webkit-box-shadow: 0px 8px 10px 0px rgb(0 0 0 / 53%);
    -moz-box-shadow: 0px 8px 10px 0px rgba(0,0,0,0.53);
 }
.btn-text { 
	margin-left:5px;
 }
		
'
]
