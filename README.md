# lxy_rich_text_from_json

**一个动态富文本实现方案，可以通过json配置动态富文本**


## 配置
|参数名|类型|描述|
|--|--|--|
|message|String|文案|
|textSize|int|字号|
|textColor|String|色值|
|richTexts|Array|富文本数组|
|startIndex|int|起始index|
|endIndex|int|结束index|


```json
{
	"message": "一二三四五六七八九",
	"textSize": 20,
	"textColor": "FF0000",
	"richTexts": [{
		"textSize": 44,
		"textColor": "23238E",
		"startIndex": 0,
		"endIndex": 3
	}, {
		"textSize": 66,
		"textColor": "545454",
		"startIndex": 5,
		"endIndex": 7
	}]
}
```

## 使用示例
```dart
RichTextView('{"message":"一二三四五六七八九","textSize":20,"textColor":"FF0000","richTexts":[{"textSize":44,"textColor":"23238E","startIndex":0,"endIndex":3},{"textSize":66,"textColor":"545454","startIndex":5,"endIndex":7}]}')
```
