package main

import (
	_ "beeapp/routers"
	"github.com/astaxie/beego"
        "beeapp/models"                                                                                                                                                   
        "github.com/astaxie/beego/orm"                                                                                                                                    
        _ "github.com/go-sql-driver/mysql"                                                                                                                                
        "strings"                                                                                                                                                         
        "time" 
)
// time.Timeオブジェクトを見やすい表示にする関数
func dateformat(in time.Time) (out string) {
	out = in.Format("2006-01-02 15:04:05")
	return
}

// 改行文字をbrタグに置き換える関数
func nl2br(in string) (out string) {
	out = strings.Replace(in, "\n", "<br>", -1)
	return
}
/*
mysql> GRANT ALL PRIVILEGES ON *.* TO 'monty'@'localhost'
    ->     IDENTIFIED BY 'some_pass' WITH GRANT OPTION;
mysql> GRANT ALL PRIVILEGES ON *.* TO 'monty'@'%'
    ->     IDENTIFIED BY 'some_pass' WITH GRANT OPTION;
mysql> GRANT RELOAD,PROCESS ON *.* TO 'admin'@'localhost';
mysql> GRANT USAGE ON *.* TO 'dummy'@'localhost';
*/
func init() {
  //CREATE USER user1 IDENTIFIED BY [PASSWORD] 'password1'
	orm.RegisterDataBase("default", "mysql", "user1:password1@/beeapp?charset=utf8", 30)
	orm.RegisterModel(new(models.Greeting))

	beego.AddFuncMap("dateformat", dateformat)
	beego.AddFuncMap("nl2br", nl2br)

}

// テーブルがなければ作成する
func syncdb() {
	err := orm.RunSyncdb("default", false, true)
	if err != nil {
		panic(err)
	}
}

func main() {
	syncdb()
	beego.Run()
}

