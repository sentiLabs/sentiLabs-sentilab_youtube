//db관련
const mongoose = require('mongoose');

//DB 연결
let url = "mongodb://유저id:" + encodeURIComponent("DB비번") + "@헤로쿠접속주소";
mongoose.connect(url, { dbName: 'DB이름' }, function(err) {
    console.log('err ::' + err);
});

//다이어리 데이터 모델 설정
var Schema = mongoose.Schema;

//언먀샬링
//데이터 형태는 { date : "2020131", title : "test2", imgList : "",  content : "아아2" }
var dairySchema = new Schema(
    {  date : String, title : String, imgList : String,  content : String}
)

//나를 호출할때 요렇게 갖다써!
module.exports = mongoose.model('컬렉션이름', dairySchema, '컬렉션이름');

//app.js