const express = require('express')
const router = require("./routes/diary");
const path = require('path')
const PORT = process.env.PORT || 5000

var app = express();
app
    .use(express.static(path.join(__dirname, 'public')))
    .use('/api/diary', router)
    .set('views', path.join(__dirname, 'views'))
    .set('view engine', 'ejs')
    .get('/', (req, res) => res.render('pages/index'))
    .listen(PORT, () => console.log(`Listening on ${ PORT }`))

//app.js