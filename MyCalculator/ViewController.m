//
//  ViewController.m
//  MyCalculator
//
//  Created by Do Minh Hai on 8/24/15.
//  Copyright (c) 2015 Do Minh Hai. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    __weak IBOutlet UILabel *ManHinh;
    double plusminus;
    double firstDouble;
    double secondDouble;
    double totalDouble;
    
    int plusClick;
    int minusClick;
    int multiplyClick;
    int divideClick;
    int plusminusClick;
    NSMutableString* str;
    NSString* SodangString[100];
   // NSMutableString* str2;
    NSString* str3[100];
    NSString* str2[100];
    NSString* str1[100];
    NSString* str4[100];
    NSString* str5[100];
    double So[100];
    double GiaTriPhepChia[10];
    double PhantuPhepNhan[10];
    double GiaTriPhepNhan[10];
    double TongGiaTriPhepNhan;
    double PhantuPhepTru[10];
    double GiaTriPhepTru[10];
    double TongGiaTriPhepTru;
    double PhantuPhapCong[10];
    double TongGiaTri;
    NSRange match0[10];
    NSRange match[10];
}
- (IBAction)FiveButton:(id)sender;
- (IBAction)SixButton:(id)sender;
- (IBAction)SevenButton:(id)sender;
- (IBAction)EightButton:(id)sender;
- (IBAction)NineButton:(id)sender;
- (IBAction)DecimalButton:(id)sender;
- (IBAction)PlusMinusButton:(id)sender;
- (IBAction)PlusButton:(id)sender;
- (IBAction)TotalButton:(id)sender;
- (IBAction)MinusButton:(id)sender;
- (IBAction)MutiplyButton:(id)sender;
- (IBAction)DivideButton:(id)sender;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    plusClick=0;
    minusClick=0;
    multiplyClick=0;
    divideClick=0;
    totalDouble=0;
    TongGiaTriPhepNhan=1;
    TongGiaTri=0;
}



- (IBAction)ClearButton:(id)sender {
    ManHinh.text = @"";
    plusClick=0;
    TongGiaTri=0;
    minusClick=0;
    multiplyClick=0;
    divideClick=0;
}

- (IBAction)ZeroButton:(id)sender {
    str = [NSMutableString stringWithString:ManHinh.text];
    [str appendString:@"0"];
    ManHinh.text = str ;
}

- (IBAction)OneButton:(id)sender {
    str = [NSMutableString stringWithString:ManHinh.text];
    [str appendString:@"1"];
    ManHinh.text = str ;
}

- (IBAction)TwoButton:(id)sender {
    str = [NSMutableString stringWithString:ManHinh.text];
    [str appendString:@"2"];
    ManHinh.text = str ;
}

- (IBAction)ThreeButton:(id)sender {
    str = [NSMutableString stringWithString:ManHinh.text];
    [str appendString:@"3"];
    ManHinh.text = str ;
}

- (IBAction)FourButton:(id)sender {
    str = [NSMutableString stringWithString:ManHinh.text];
    [str appendString:@"4"];
    ManHinh.text = str ;
}

- (IBAction)FiveButton:(id)sender {
    str = [NSMutableString stringWithString:ManHinh.text];
    [str appendString:@"5"];
    ManHinh.text = str ;
}

- (IBAction)SixButton:(id)sender {
    str = [NSMutableString stringWithString:ManHinh.text];
    [str appendString:@"6"];
    ManHinh.text = str ;
}

- (IBAction)SevenButton:(id)sender {
    str = [NSMutableString stringWithString:ManHinh.text];
    [str appendString:@"7"];
    ManHinh.text = str ;
}

- (IBAction)EightButton:(id)sender {
    str = [NSMutableString stringWithString:ManHinh.text];
    [str appendString:@"8"];
    ManHinh.text = str ;
}

- (IBAction)NineButton:(id)sender {
    str = [NSMutableString stringWithString:ManHinh.text];
    [str appendString:@"9"];
    ManHinh.text = str ;
}

- (IBAction)DecimalButton:(id)sender {
    str = [NSMutableString stringWithString:ManHinh.text];
    [str appendString:@"."];
    ManHinh.text = str ;
}

- (IBAction)PlusMinusButton:(id)sender {
    str = [NSMutableString stringWithString:ManHinh.text];
    [str insertString:@"-" atIndex: 0];
   // plusminus = [str doubleValue];
   // plusminus = plusminus*(-1);
    ManHinh.text= [NSString stringWithFormat:@"%@",str];
    minusClick++;
}

- (IBAction)PlusButton:(id)sender {
    str = [NSMutableString stringWithString:ManHinh.text];
    [str appendString:@"+"];
    ManHinh.text = str ;
    plusClick++;
}

- (IBAction)TotalButton:(id)sender
{
    
    str = [NSMutableString stringWithString:ManHinh.text];
    
    ManHinh.text = @"";
    
        NSArray* mang= [str componentsSeparatedByString:@"+"];
        for (int m=0; m<[mang count]; m++)
        {
            str1[m] = mang[m];
                NSString* XetDauTru= @"-";
                match0[m] = [str1[m] rangeOfString:XetDauTru];
          
                if (match0[m].location == NSNotFound)//ko co dau tru
                {
                    match0[m] = [str1[m] rangeOfString:@"x"];
                    if (match0[m].location == NSNotFound) //ko co nhan
                    {
                        match0[m] = [str1[m] rangeOfString:@"/"];
                        if (match0[m].location == NSNotFound) //ko co nhan va ko co  chia
                        {
                            PhantuPhapCong[m] = [str1[m] doubleValue];
                        }else //ko co nhan nhung co chia
                        {
                            NSArray* mang6 =[str1[m] componentsSeparatedByString:@"/"];
                            SodangString[0] = mang6[0];
                            So[0] = [SodangString[0] doubleValue];
                            PhantuPhapCong[m] = So[0];
                            for (int i=1; i<[mang6 count]; i++) {
                                SodangString[i] = mang6[i];
                                So[i] = [SodangString[i] doubleValue];
                                PhantuPhapCong[m]= PhantuPhapCong[m]/So[i];                            }
                        }
                    }else // co nhan
                    {
                        NSArray* mang7 = [str1[m] componentsSeparatedByString:@"x"];
                        
                        //str2[0]= mang7[0];
                        PhantuPhapCong[m]=1;
                        for (int i=0; i<[mang7 count]; i++) {
                            str2[i]= mang7[i];
                            match0[i] = [str2[i] rangeOfString:@"/"];
                            if (match0[i].location == NSNotFound)//phan tu co nhan ko co chia
                            {
                                PhantuPhepNhan[i]= [str2[i] doubleValue];
                            }else
                            {
                                NSArray* mang6 = [str2[i] componentsSeparatedByString:@"/"];//phan tu co co chia
                                str5[0] = mang6[0];
                                PhantuPhepNhan[i] = [str5[0] doubleValue];
                                for (int k=1; k<[mang6 count]; k++)
                                {
                                    str5[k] = mang6[k];
                                    PhantuPhepNhan[i] = PhantuPhepNhan[i] / [str5[k] doubleValue];
                                }
                            }
                            PhantuPhapCong[m] = PhantuPhapCong[m]* PhantuPhepNhan[i];
                        }
                        
                    }
                                    }
               else{
                  
                NSArray* mang1= [str1[m] componentsSeparatedByString:@"-"];
                for (int n=0; n<[mang1 count]; n++)
                {
                    str2[n] = mang1[n];
                    
                    match[n] = [str2[n] rangeOfString:@"x"];
                    if (match[n].location == NSNotFound) {
                        match[n] = [str2[n] rangeOfString:@"/"];
                        if (match[n].location == NSNotFound) {
                           PhantuPhepTru[n]=[str2[n] doubleValue];
                        }else{
                            NSArray* mang3 = [str2[n] componentsSeparatedByString:@"/"];
                            SodangString[0] = mang3[0];
                            So[0] = [SodangString[0] doubleValue];
                            PhantuPhepTru[n] = So[0];
                            for (int m=1; m<[mang3 count]; m++)
                            {
                                SodangString[m] = mang3[m];
                                So[m] = [SodangString[m] doubleValue];
                                PhantuPhepTru[n] = PhantuPhepTru[n]/So[m];
                            }
                        }
                        
                        
                    }else{
                        NSArray* mang2 = [str2[n] componentsSeparatedByString:@"x"];
                        
                        for (int i=0; i<[mang2 count]; i++)
                        {
                            str3[i] = mang2[i];
                        
                            NSString* XetDauChia = @"/";
                            NSRange match1;
                            match1 = [str3[i] rangeOfString:XetDauChia];
                            if (match1.location == NSNotFound) {
                                PhantuPhepNhan[i]=[str3[i] doubleValue];
                            }else{
                                    NSArray* mang3 = [str3[i] componentsSeparatedByString:@"/"];
                                   SodangString[0] = mang3[0];
                                    So[0] = [SodangString[0] doubleValue];
                                    PhantuPhepNhan[i] = So[0];
                                    for (int m=1; m<[mang3 count]; m++)
                                        {
                                                SodangString[m] = mang3[m];
                                                So[m] = [SodangString[m] doubleValue];
                                                PhantuPhepNhan[i] = PhantuPhepNhan[i]/So[m];
                                       }
                            }
                            
                        
                            TongGiaTriPhepNhan=1;
                        for (int i=0 ; i<[mang2 count]; i++) {
                            TongGiaTriPhepNhan=TongGiaTriPhepNhan*PhantuPhepNhan[i];
                        }
                      
                        } PhantuPhepTru[n]=TongGiaTriPhepNhan;                    }
                }
                   
                
                   NSLog(@"%lu", (unsigned long)match0[m].location);
                   
                   if (match0[m].location == 0) {
                       TongGiaTriPhepTru = 0;
                   }else
                   {
                       TongGiaTriPhepTru=PhantuPhepTru[0];
                  }
                   for (int n=1; n<[mang1 count]; n++) {
                    TongGiaTriPhepTru=TongGiaTriPhepTru-PhantuPhepTru[n];
                
                    PhantuPhapCong[m]=TongGiaTriPhepTru;
                   }
                   
                }
               }
            
    
        TongGiaTri=0;
        for (int i=0; i<[mang count];i++ ) {
            TongGiaTri=TongGiaTri+PhantuPhapCong[i];
        }
        NSString* KetQua = [NSString stringWithFormat:@"%0.2f",TongGiaTri];
        ManHinh.text = KetQua;
        
    

    
}


- (IBAction)MinusButton:(id)sender {
    str = [NSMutableString stringWithString:ManHinh.text];
    [str appendString:@"-"];
    ManHinh.text = str ;
    minusClick++;
}

- (IBAction)MutiplyButton:(id)sender {
    str = [NSMutableString stringWithString:ManHinh.text];
    [str appendString:@"x"];
    ManHinh.text = str ;
    multiplyClick++;
}

- (IBAction)DivideButton:(id)sender {
    str = [NSMutableString stringWithString:ManHinh.text];
    [str appendString:@"/"];
    ManHinh.text = str ;
    divideClick++;
}

@end
