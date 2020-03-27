let {
    runApp,
    MXJSFlutterApp,
    MXJSStatefulWidget,
    MXJSWidgetState,
    Scaffold,
    Container,
    Color,
    Colors,
    AppBar,
    Text,
    ListView,
    ListTile,
    Icon,
    IconData,
    EdgeInsets,
    TextAlign,
    TextStyle,
    Row,
    Padding,
    Theme,
    Navigator,
    MaterialPageRoute,
    Scrollbar,
    MXJSLog,
} = require("js_flutter.js");

const { SectionTitle } = require("./component/section_title.js");

let { JSContactPage } = require("./contact.js");
let { JSAnimationPage } = require("./animation.js");
let { JSMaterialPage } = require("./material.js");
let { JSZhiHuPage } = require("./zhihu/zhihu.js");

//let { ExamplesPage } = require("./examples/index.js");
let { JSCupertinoPage } = require("./cupertino.js");



let { PlatformExamplesPage } = require("./platform/index.js");



contact_demo_ddc = require("./dart2js_demo/contacts_demo.ddc.js");
pesto_demo_ddc = require("./dart2js_demo/pesto_demo.ddc.js");

const packages__zhihu__home__home_page = require('packages/zhihu/home/home_page');
const home_page = packages__zhihu__home__home_page.home__home_page;
const packages__zhihu__idea__idea_page = require('packages/zhihu/idea/idea_page');
const idea_page = packages__zhihu__idea__idea_page.idea__idea_page;
const packages__zhihu__market__market_page = require('packages/zhihu/market/market_page');
const market_page = packages__zhihu__market__market_page.market__market_page;
const packages__zhihu__notice__notice_page = require('packages/zhihu/notice/notice_page');
const notice_page = packages__zhihu__notice__notice_page.notice__notice_page;
const packages__zhihu__my__my_page = require('packages/zhihu/my/my_page');
const my_page = packages__zhihu__my__my_page.my__my_page;
const packages__zhihu__index = require('packages/zhihu/index/index');
const index_page = packages__zhihu__index.index__index;

const dart_sdk = require("dart_sdk");
const dart = dart_sdk.dart;


const bridge_netwrok = require("./native_bridge/mxf_bridge_netwrok.js");
const network = bridge_netwrok.network;
const fetch = bridge_netwrok.fetch;


let cgiDataUrl = "https://c.m.163.com/nc/article/headline/T1348649580692/0-10.html";
let cgiJsonUrl = "https://reactnative.dev/movies.json";

  //例子1，最简单的用法 
  async function testDio1() {
    try {
      const packages__dio = require("packages/dio/dio.js");
      let response = await packages__dio.Dio().get(cgiJsonUrl);
      MXJSLog.log("await Dio.get(urlStr):request() :" + JSON.stringify( response.data));
      return response;

    } catch (e$) {
      let e = dart.getThrown(e$);
      MXJSLog.log("testDio() error:" + e);
      return e;

    }
  }

//业务代码
class JSWidgetHomePage extends MXJSStatefulWidget {
    constructor() {
        super("JSWidgetHomePage");

        this.data = "biz data";
        this.count = 0;
    }

    createState() {
        return new JSWidgetHomePageState(this);
    }
}

class JSWidgetHomePageState extends MXJSWidgetState {

    build(context) {

        let demoList = new ListView({

            children: [

                this.sectionTitle(context, "App Demo"),
                new ListTile({
                    leading: new Icon(new IconData(0xe39d, { fontFamily: 'MaterialIcons' }), { color: Theme.of(context).primaryColor }),
                    trailing: new Icon(new IconData(0xe5df, { fontFamily: 'MaterialIcons', matchTextDirection: true })),
                    title: new Text('Examples'),
                    subtitle: new Text('All examples'),
                    onTap: function () {

                        //点击时懒加载页面
                        let { ExamplesPage } = require("./examples/index.js");

                        Navigator.push(context, new MaterialPageRoute({
                            builder: function (context) {
                                return new ExamplesPage;
                            }
                        }))


                        //testDio1();
                    }
                }),
                new ListTile({
                    leading: new Icon(new IconData(0xe06d, { fontFamily: 'MaterialIcons' })),
                    trailing: new Icon(new IconData(0xe5df, { fontFamily: 'MaterialIcons', matchTextDirection: true })),
                    title: new Text('Material'),
                    subtitle: new Text('Material UI Demo'),
                    onTap: function () {
                        Navigator.push(context, new MaterialPageRoute({
                            builder: function (context) {
                                return new JSMaterialPage;
                            }
                        }))
                    }
                }),
                new ListTile({
                    leading: new Icon(new IconData(0xe39d, { fontFamily: 'MaterialIcons' }), { color: Theme.of(context).primaryColor }),
                    trailing: new Icon(new IconData(0xe5df, { fontFamily: 'MaterialIcons', matchTextDirection: true })),
                    title: new Text('ZhiHu'),
                    subtitle: new Text('ZhiHu high copy'),
                    onTap: function () {
                        Navigator.push(context, new MaterialPageRoute({
                            builder: function (context) {
                                return new JSZhiHuPage;
                            }
                        }))
                    }
                }),

                new ListTile({
                    leading: new Icon(new IconData(0xe39d, { fontFamily: 'MaterialIcons' }), { color: Theme.of(context).primaryColor }),
                    trailing: new Icon(new IconData(0xe5df, { fontFamily: 'MaterialIcons', matchTextDirection: true })),
                    title: new Text('网易新闻 ListViewDemo'),
                    subtitle: new Text('ListView ,Message Channel, Pull to refresh'),

                    onTap: function () {

                        let list_view = require("./listview_example.js");
                    
                        Navigator.push(context, new MaterialPageRoute({
                            builder: function (context) {
                                return  new list_view.ListViewDemo;
                            }
                        }))
                    }
                }),

                new ListTile({
                    leading: new Icon(new IconData(0xe39d, { fontFamily: 'MaterialIcons' }), { color: Theme.of(context).primaryColor }),
                    trailing: new Icon(new IconData(0xe5df, { fontFamily: 'MaterialIcons', matchTextDirection: true })),
                    title: new Text('PlatformAPIExamples'),
                    subtitle: new Text('Network/Dio/MessageChannel'),

                    onTap: function () {
                        Navigator.push(context, new MaterialPageRoute({
                            builder: function (context) {
                                return new PlatformExamplesPage;
                            }
                        }))
                    }
                }),

                new ListTile({
                    leading: new Icon(new IconData(0xe06d, { fontFamily: 'MaterialIcons' })),
                    trailing: new Icon(new IconData(0xe5df, { fontFamily: 'MaterialIcons', matchTextDirection: true })),
                    title: new Text('Pesto'),
                    subtitle: new Text('Simple recipe browser'),

                    onTap: function () {

                        let pesto = require("./pesto.js");

                        Navigator.push(context, new MaterialPageRoute({
                            builder: function (context) {
                                return new pesto.JSPestoPage;
                            }
                        }))
                    }
                }),
                new ListTile({
                    leading: new Icon(new IconData(0xe0d0, { fontFamily: 'MaterialIcons' }), { color: Theme.of(context).primaryColor }),
                    trailing: new Icon(new IconData(0xe5df, { fontFamily: 'MaterialIcons', matchTextDirection: true })),
                    title: new Text('Contact profile'),
                    subtitle: new Text('Address book entry with a flexible appbar'),

                    onTap: function () {
                        Navigator.push(context, new MaterialPageRoute({
                            builder: function (context) {
                                return new JSContactPage;
                            }
                        }))
                    }
                }),
                new ListTile({
                    leading: new Icon(new IconData(0xe06d, { fontFamily: 'MaterialIcons' })),
                    trailing: new Icon(new IconData(0xe5df, { fontFamily: 'MaterialIcons', matchTextDirection: true })),
                    title: new Text('Animation'),
                    subtitle: new Text('Section organizer'),
                    onTap: function () {
                        Navigator.push(context, new MaterialPageRoute({
                            builder: function (context) {
                                return new JSAnimationPage;
                            }
                        }))
                    }
                }),

                this.sectionTitle(context, "Dart2js Demo"),
                new ListTile({
                    leading: new Icon(new IconData(0xe39d, { fontFamily: 'MaterialIcons' })),
                    trailing: new Icon(new IconData(0xe5df, { fontFamily: 'MaterialIcons', matchTextDirection: true })),
                    title: new Text('FlutterDemo'),
                    subtitle: new Text('简单样例'),
                    onTap: function () {
                       
                        let flutter_demo_ddc = require("./dart2js_demo/flutter_demo.ddc.js");

                        Navigator.push(context, new MaterialPageRoute({
                            builder: function (context) {
                                return new flutter_demo_ddc.main.MyHomePage.new;
                            }
                        }))
                    }
                }),
                new ListTile({
                    leading: new Icon(new IconData(0xe39d, { fontFamily: 'MaterialIcons' })),
                    trailing: new Icon(new IconData(0xe5df, { fontFamily: 'MaterialIcons', matchTextDirection: true })),
                    title: new Text('ContactDemo'),
                    subtitle: new Text('联系人'),

                    onTap: function () {
                        Navigator.push(context, new MaterialPageRoute({
                            builder: function (context) {
                                return new contact_demo_ddc.contacts_demo.ContactsDemo.new;
                            }
                        }))
                    }
                }),
                new ListTile({
                    leading: new Icon(new IconData(0xe39d, { fontFamily: 'MaterialIcons' })),
                    trailing: new Icon(new IconData(0xe5df, { fontFamily: 'MaterialIcons', matchTextDirection: true })),
                    title: new Text('PestoDemo'),
                    subtitle: new Text('菜谱'),
                    onTap: function () {
                        Navigator.push(context, new MaterialPageRoute({
                            builder: function (context) {
                                return new pesto_demo_ddc.pesto_demo.PestoDemo.new;
                            }
                        }))
                    }
                }),
                new ListTile({
                    leading: new Icon(new IconData(0xe39d, { fontFamily: 'MaterialIcons' })),
                    trailing: new Icon(new IconData(0xe5df, { fontFamily: 'MaterialIcons', matchTextDirection: true })),
                    title: new Text('ZhiHu'),
                    subtitle: new Text('知乎-高仿版'),

                    onTap: function () {
                        Navigator.push(context, new MaterialPageRoute({
                            builder: function (context) {
                                return new index_page.Index.new;
                            }
                        }))
                    }
                }),
            ]
        });

        let w = new Scaffold({
            appBar: new AppBar({
                title: new Text("MXFlutter Examples")
            }),
            body: demoList
        });


        return w;
    }

    sectionTitle(context, title) {
        return new SectionTitle(title);
    }
}

module.exports = { JSWidgetHomePage };
