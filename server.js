const path = require('path');
const express = require('express');

express()
	.use(express.static(__dirname + '/public'))
	.get('*', (req, res) => res.send('404'))
	.listen(80);