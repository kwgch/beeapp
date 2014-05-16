<!DOCTYPE html>
<html>
  <head>
    <title>Beego GuestBook</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">

    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">

    <!-- Optional theme -->
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css">

    <!-- Latest compiled and minified JavaScript -->
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
    
    <link rel="stylesheet" href="/static/css/main.css" type="text/css" />
    
    <link rel="stylesheet" href="//getbootstrap.com/examples/blog/blog.css" type="text/css" />
    
  </head>
  <body>
    <div id="main" class="container theme-showcase" role="main">
    <div class="jumbotron">
    <h1>ゲストブック</h1>
    </div>
      <div id="form-area">
        <p>書き込みをどうぞ。</p>
        <form action="/post" method="post" role="form">
          <div class="form-group">
              <label>名前</label>
              <input type="text" size="20" name="name" class="form-control" />
          </div>
          <div class="form-group">
              <label>コメント</label>
              <textarea rows="5" cols="40" name="comment" class="form-control"></textarea>
          </div>
          <p><button type="submit" class="btn btn-primary btn-lg">送信</button></p>
        </form>
      </div>
      <br>
      <div class="col-sm-8 blog-main">
      <div id="entries-area" class="blog-post">
        <h2>
        <span class="blog-post-title">これまでの書き込み</span>
        </h2>
        {{range $key, $val := .greetings}}
        <div class="entry">
          <p class="blog-post-meta">{{$val.Name}} ({{$val.CreateAt|dateformat}}):</p>
          <p class="blog-post">{{$val.Comment|htmlquote|nl2br|str2html}}</p>
        </div>
        {{end}}
      </div>
      </div>
    </div>
  </body>
</html>
