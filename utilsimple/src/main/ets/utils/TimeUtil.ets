export class TimeUtil {
  /**
   * 获取当前时间字符串
   */
  static getCurrentTime(): string {
    const now: Date = new Date();
    const hours: number = now.getHours();
    const minutes: number = now.getMinutes();
    const seconds: number = now.getSeconds();

    return `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')}`;
  }

  /**
   * 获取当前日期字符串
   */
  static getCurrentDate(): string {
    const now: Date = new Date();
    const year: number = now.getFullYear();
    const month: number = now.getMonth() + 1;
    const day: number = now.getDate();

    return `${year}-${month.toString().padStart(2, '0')}-${day.toString().padStart(2, '0')}`;
  }

  /**
   * 获取完整日期时间
   */
  static getDateTime(): string {
    return `${TimeUtil.getCurrentDate()} ${TimeUtil.getCurrentTime()}`;
  }

  /**
   * 获取时间戳
   */
  static getTimestamp(): number {
    return new Date().getTime();
  }

  /**
   * 格式化日期
   */
  static formatDate(date: Date, format: string = 'YYYY-MM-DD'): string {
    const year: number = date.getFullYear();
    const month: string = (date.getMonth() + 1).toString().padStart(2, '0');
    const day: string = date.getDate().toString().padStart(2, '0');
    const hours: string = date.getHours().toString().padStart(2, '0');
    const minutes: string = date.getMinutes().toString().padStart(2, '0');
    const seconds: string = date.getSeconds().toString().padStart(2, '0');

    return format
      .replace('YYYY', year.toString())
      .replace('MM', month)
      .replace('DD', day)
      .replace('HH', hours)
      .replace('mm', minutes)
      .replace('ss', seconds);
  }

  /**
   * 判断是否为今天
   */
  static isToday(timestamp: number): boolean {
    const today: Date = new Date();
    const targetDate: Date = new Date(timestamp);

    return today.getFullYear() === targetDate.getFullYear() &&
      today.getMonth() === targetDate.getMonth() &&
      today.getDate() === targetDate.getDate();
  }

  /**
   * 获取星期几
   */
  static getWeekday(date?: Date): string {
    const targetDate: Date = date || new Date();
    const weekdays: string[] = ['周日', '周一', '周二', '周三', '周四', '周五', '周六'];
    return weekdays[targetDate.getDay()];
  }
}