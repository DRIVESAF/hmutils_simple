# TimeUtil - 鸿蒙时间日期工具类

一个简单易用的鸿蒙（HarmonyOS）时间日期工具类，提供常用的时间日期处理功能。

## 功能特性

- 🕐 获取当前时间、日期、日期时间
- 📅 日期格式化
- ⏰ 时间戳获取
- 📆 星期几获取
- ✅ 日期判断（是否为今天）
- 🚀 纯静态方法，无需实例化
- 💪 完整的 TypeScript 类型支持

## 安装

通过 OHPM 安装：

```json5
ohpm install hmutils_simple
```

## 使用方法

### 导入工具类

```typescript
import { TimeUtil } from 'time-utils'
```

### 基础功能示例

#### 获取当前时间信息
```typescript
// 获取当前时间 (HH:mm:ss)
const currentTime: string = TimeUtil.getCurrentTime()
// 示例: "14:30:25"

// 获取当前日期 (YYYY-MM-DD)
const currentDate: string = TimeUtil.getCurrentDate()
// 示例: "2024-01-20"

// 获取完整日期时间
const dateTime: string = TimeUtil.getDateTime()
// 示例: "2024-01-20 14:30:25"

// 获取时间戳
const timestamp: number = TimeUtil.getTimestamp()
// 示例: 1705732225000
```

#### 日期格式化
```typescript
const now: Date = new Date()

// 默认格式 (YYYY-MM-DD)
const formatted1: string = TimeUtil.formatDate(now)
// 示例: "2024-01-20"

// 自定义格式
const formatted2: string = TimeUtil.formatDate(now, 'YYYY年MM月DD日')
// 示例: "2024年01月20日"

const formatted3: string = TimeUtil.formatDate(now, 'YYYY/MM/DD HH:mm:ss')
// 示例: "2024/01/20 14:30:25"

const formatted4: string = TimeUtil.formatDate(now, 'HH时mm分ss秒')
// 示例: "14时30分25秒"
```

#### 日期判断和星期
```typescript
// 判断是否为今天
const isToday: boolean = TimeUtil.isToday(Date.now())
// 示例: true

// 获取今天星期几
const weekday: string = TimeUtil.getWeekday()
// 示例: "周六"

// 获取指定日期的星期几
const someDate: Date = new Date(2024, 0, 1) // 2024年1月1日
const specificWeekday: string = TimeUtil.getWeekday(someDate)
// 示例: "周一"
```

### 在鸿蒙页面中使用

```typescript
import { TimeUtil } from 'time-utils'

@Entry
@Component
struct MyPage {
  @State currentTime: string = TimeUtil.getCurrentTime()
  @State currentDate: string = TimeUtil.getCurrentDate()

  build() {
    Column({ space: 20 }) {
      Text('当前时间: ' + this.currentTime)
        .fontSize(20)
      
      Text('当前日期: ' + this.currentDate)
        .fontSize(20)
      
      Text('今天是: ' + TimeUtil.getWeekday())
        .fontSize(18)
        .fontColor(Color.Blue)
      
      Button('刷新时间')
        .onClick(() => {
          this.currentTime = TimeUtil.getCurrentTime()
          this.currentDate = TimeUtil.getCurrentDate()
        })
    }
    .padding(20)
  }
}
```

## API 文档

### 静态方法

| 方法名 | 参数 | 返回值 | 描述 |
|--------|------|--------|------|
| `getCurrentTime()` | - | `string` | 获取当前时间 (HH:mm:ss) |
| `getCurrentDate()` | - | `string` | 获取当前日期 (YYYY-MM-DD) |
| `getDateTime()` | - | `string` | 获取完整日期时间 |
| `getTimestamp()` | - | `number` | 获取当前时间戳 |
| `formatDate(date, format?)` | `date: Date`, `format?: string` | `string` | 格式化日期 |
| `isToday(timestamp)` | `timestamp: number` | `boolean` | 判断时间戳是否为今天 |
| `getWeekday(date?)` | `date?: Date` | `string` | 获取星期几 |

### 格式化符号

| 符号 | 含义 | 示例 |
|------|------|------|
| YYYY | 4位年份 | 2024 |
| MM | 2位月份 | 01 |
| DD | 2位日期 | 20 |
| HH | 2位小时 | 14 |
| mm | 2位分钟 | 30 |
| ss | 2位秒钟 | 25 |

## 许可证

Apache-2.0

## 更新日志

### 1.0.0
- 初始版本发布
- 基础时间日期功能
- 日期格式化功能
- 星期几获取功能
- 日期判断功能