//
//  NSDate+DynamicDateString.m
//  Color
//
//  Created by chao han on 12-6-1.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "NSDate+DynamicDateString.h"

@implementation NSDate (DynamicDateString)

-(NSString *)distanceFromNowMaxSeconds:(NSInteger) maxSecs RelpaceStr:(NSString *)replaceStr
                             perfixStr:(NSString *)perfixStr
{
    if (perfixStr == nil) {
        perfixStr = @"";
    }
    
    NSTimeZone *currentZone = [NSTimeZone systemTimeZone];
    NSInteger diffInterval = [currentZone secondsFromGMTForDate: self];
    NSDate *gmtDate = [self dateByAddingTimeInterval: diffInterval];

    int distance = (int)(gmtDate.timeIntervalSince1970 - [[NSDate date] timeIntervalSince1970]);

    if (distance > 0 && distance < maxSecs) {
        if (distance < 60 * 60 ) {
            return [NSString stringWithFormat:@"%@1小时",perfixStr];
        }else if (distance < 24 * 60 * 60 ) {
            return [NSString stringWithFormat:@"%@%d小时",perfixStr,(int)distance / 60 / 60];
        }else if (distance < 30 * 24 * 60 * 60 ) {
            return [NSString stringWithFormat:@"%@%d天",perfixStr,(int)distance / 60 / 60 / 24];
        }else //if (distance < 30 * 24 * 60 * 60 ) {
        {
            return [NSString stringWithFormat:@"%@%d月",perfixStr,(int)distance / 60 / 60 / 24 /30];
        }
    }else if (distance > maxSecs){
        return replaceStr;
    }else {
        return nil;
    }
}


-(NSString *) compareCurrentTime
//
{
    NSDate *gmtDate = self;
    NSDateFormatter *formatter1 = [[NSDateFormatter alloc] init];
    [formatter1 setDateFormat:@"yyyy-MM-dd hh:mm:ss"];
//    NSString *oldTime= [formatter1 stringFromDate:gmtDate];
    NSTimeInterval oldTime=[gmtDate timeIntervalSince1970]*1;
//    NSString *newTime= [formatter1 stringFromDate:[NSDate date]];
//    
    NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval newTime=[dat timeIntervalSince1970]*1;
    NSTimeInterval  timeInterval = newTime - oldTime;
  
   
    long temp = 0;
    NSString *result;
    if (timeInterval < 60) {
        result = [NSString stringWithFormat:@"刚刚"];
    }
    else if((temp = timeInterval/60) <60){
        result = [NSString stringWithFormat:@"%ld分前",temp];
    }
    
    else if((temp = temp/60) <24){
        result = [NSString stringWithFormat:@"%ld小前",temp];
    }
    
    else if((temp = temp/24) <30){
        result = [NSString stringWithFormat:@"%ld天前",temp];
    }
    
    else if((temp = temp/30) <12){
        result = [NSString stringWithFormat:@"%ld月前",temp];
    }
    else{
        temp = temp/12;
        result = [NSString stringWithFormat:@"%ld年前",temp];
    }
    
    return  result;
}
- (NSString *) returnUploadTime
{
    NSDate *gmtDate = self;
    
    NSTimeInterval late=[gmtDate timeIntervalSince1970]*1;
    
    
    NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval now=[dat timeIntervalSince1970]*1;
    NSString *timeString=@"";
    
    NSTimeInterval cha=now-late;
    
    if (cha/3600<1) {
        timeString = [NSString stringWithFormat:@"%f", cha/60];
        timeString = [timeString substringToIndex:timeString.length-7];
        timeString=[NSString stringWithFormat:@"%@分钟前", timeString];
        
    }
    if (cha/3600>1&&cha/86400<1) {
        //        timeString = [NSString stringWithFormat:@"%f", cha/3600];
        //        timeString = [timeString substringToIndex:timeString.length-7];
        //        timeString=[NSString stringWithFormat:@"%@小时前", timeString];
        NSDateFormatter *dateformatter=[[NSDateFormatter alloc] init];
        [dateformatter setDateFormat:@"HH:mm"];
        timeString = [NSString stringWithFormat:@"今天 %@",[dateformatter stringFromDate:gmtDate]];
//        [dateformatter release];
    }
    if (cha/86400>1)
    {
        //        timeString = [NSString stringWithFormat:@"%f", cha/86400];
        //        timeString = [timeString substringToIndex:timeString.length-7];
        //        timeString=[NSString stringWithFormat:@"%@天前", timeString];
        NSDateFormatter *dateformatter=[[NSDateFormatter alloc] init];
        [dateformatter setDateFormat:@"YY-MM-dd HH:mm"];
        timeString = [NSString stringWithFormat:@"%@",[dateformatter stringFromDate:gmtDate]];
//        [dateformatter release];
    }
 
    return timeString;
}

-(NSString *)getDynamicDateStringFromNow{
    NSTimeZone *currentZone = [NSTimeZone systemTimeZone];
    NSInteger diffInterval = [currentZone secondsFromGMTForDate: self];
    
//    NSDate *gmtDate = [self dateByAddingTimeInterval: diffInterval];
//    
//    NSTimeInterval distanceFromNow = [gmtDate timeIntervalSinceNow];
//    distanceFromNow = abs(distanceFromNow);
    
    NSDate *gmtDate = self;
    NSTimeInterval distanceFromNow = [gmtDate timeIntervalSinceNow];
    distanceFromNow = abs(distanceFromNow);

    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    
    NSInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit |     
    NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;    
    
    NSDateComponents *comps = [calendar components:unitFlags fromDate:gmtDate];
//    [calendar release];
    
    NSString *weekDay = @"";
    switch ([comps weekday])   
    {   
        case 1:   
            weekDay=@"星期日";   
            break;   
        case 2:   
            weekDay=@"星期一";   
            break;   
        case 3:   
            weekDay=@"星期二";   
            break;   
        case 4:   
            weekDay=@"星期三";   
            break;   
        case 5:   
            weekDay=@"星期四";   
            break;   
        case 6:   
            weekDay=@"星期五";   
            break;   
        case 7:   
            weekDay=@"星期六";   
            break;   
    } 
    
    NSString *dateString ;
    if (distanceFromNow < 60) {
        dateString = @"片刻前";
        
    }else if (distanceFromNow < 60 * 60) {
        dateString = [NSString stringWithFormat:@"%d分钟前",(NSInteger)distanceFromNow / 60];
        
    }else if (distanceFromNow < 24 * 60 * 60) {
//        dateString = [NSString stringWithFormat:@"%d小时%d分钟前",(NSInteger)distanceFromNow / 60 /60,(NSInteger)distanceFromNow / 60 % 60];
        dateString = [NSString stringWithFormat:@"%d小时前",(NSInteger)distanceFromNow / 60 /60];
    }else if (distanceFromNow < 7 * 24 * 60 * 60) {
        dateString = [NSString stringWithFormat:@"%@ %02d:%02d",weekDay,[comps hour],[comps minute]];
        
    }else if (distanceFromNow < 30 * 24 * 60 * 60) {
        dateString = [NSString stringWithFormat:@"%d天前",(NSInteger)distanceFromNow / 24 / 60 / 60];
    }else {
        dateString = [NSString stringWithFormat:@"%d月%d日",[comps month],[comps day]];
    }

    return dateString;
}



-(NSString *)getDateStringFromNow{
    NSTimeZone *currentZone = [NSTimeZone systemTimeZone];
    NSInteger diffInterval = [currentZone secondsFromGMTForDate: self];
    
    NSDate *gmtDate = self;
    NSTimeInterval distanceFromNow = [gmtDate timeIntervalSinceNow];
    distanceFromNow = abs(distanceFromNow);
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    
    NSInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit |
    NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    
    NSDateComponents *comps = [calendar components:unitFlags fromDate:gmtDate];
    

    NSString *dateString ;
   
    dateString = [NSString stringWithFormat:@"%ld-%.2ld-%.2ld %.2ld:%.2ld",(long)[comps year],(long)[comps month],(long)[comps day],(long)[comps hour],(long)[comps minute]];
    
    return dateString;
}

- (BOOL)isSameDay:(NSDate*)date 
{
    NSCalendar* calendar = [NSCalendar currentCalendar];
    
    unsigned unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit |  NSDayCalendarUnit;
    
    NSDateComponents* comp1 = [calendar components:unitFlags fromDate:self];
    NSDateComponents* comp2 = [calendar components:unitFlags fromDate:date];
    
    return [comp1 day]   == [comp2 day] &&
        [comp1 month] == [comp2 month] &&
        [comp1 year]  == [comp2 year];
    
}

//- (NSDate *)dateFromString:(NSString *)dateString{
//    
//    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//    
//    [dateFormatter setDateFormat: @"yyyy-MM-dd HH:mm:ss"];
//    
//    NSDate *destDate= [dateFormatter dateFromString:dateString];
//    
//    [dateFormatter release];
//    
//    return destDate;
//    
//}

@end
