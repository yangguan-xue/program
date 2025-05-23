# 1.基础语法
Verilog 是区分大小写的

每个语句必须以分号为结束符

//单行注释

/* */跨行注释

标识符（identifier）可以是任意一组字母、数字、$ 符号和 _(下划线)符号的合，但标识符的第一个字符必须是字母或者下划线，不能以数字或者美元符开始

标识符是区分大小写的

关键字是 Verilog 中预留的用于定义语言结构的特殊标识符

Verilog 中关键字全部为小写

数字声明时，合法的基数格式有4种，包括：
十进制('d 或 'D)
十六进制('h 或 'H)
二进制（'b 或 'B）
八进制（'o 或 'O）
数值可指明位宽，也可不指明位宽

下划线_是为了增强代码的可读性

一般直接写数字时，默认为十进制表示,这三种是等效的：
```
counter = 'd100 ; //一般会根据编译器自动分频位宽，常见的为32bit
counter = 100 ;
counter = 32'h64 ;
```

通常在表示位宽的数字前面加一个减号来表示负数:
```
-6'd15  
-15
```

减号放在基数和数字之间是非法的

实数表示方法主要有两种方式：
十进制:
```
30.123
6.0
3.0
0.001
```
科学计数法:
```
1.2e4         //大小为12000
1_0001e4      //大小为100010000
1E-3          //大小为0.001
```

字符串是由双引号包起来的字符队列。字符串不能多行书写，即字符串中不能包含回车符。Verilog 将字符串当做一系列的单字节 ASCII 字符队列。例如，为存储字符串 "www.runoob.com", 需要 14*8bit 的存储单元。例如：
```
reg [0: 14*8-1]       str ;
initial begin
    str = "www.runoob.com";
end
```

# 2.数据类型
Verilog 最常用的 2 种数据类型就是线网（wire）与寄存器（reg），其余类型可以理解为这两种数据类型的扩展或辅助

线网(wire):wire类型表示硬件单元之间的物理连线，由其连接的器件输出端连续驱动

如果没有驱动元件连接到 wire 型变量，缺省值一般为 "Z"
```
wire   interrupt ;
wire   flag1, flag2 ;
wire   gnd = 1'b0 ;
```

线网型还有其他数据类型，包括 wand，wor，wri，triand，trior，trireg 等

寄存器（reg）:用来表示存储单元，它会保持数据原有的值，直到被改写
```
reg    clk_temp;
reg    flag1, flag2 ;
```

例如在 always 块中，寄存器可能被综合成边沿触发器，在组合逻辑中可能被综合成 wire 型变量。寄存器不需要驱动源，也不一定需要时钟信号。在仿真时，寄存器的值可在任意时刻通过赋值操作进行改写
```
reg rstn ;
initial begin
    rstn = 1'b0 ;
    #100 ;
    rstn = 1'b1 ;
end
```

向量:当位宽大于 1 时，wire 或 reg 即可声明为向量的形式
```
reg [3:0]      counter ;    //声明4bit位宽的寄存器counter
wire [32-1:0]  gpio_data;   //声明32bit位宽的线型变量gpio_data
wire [8:2]     addr ;       //声明7bit位宽的线型变量addr，位宽范围为8:2
reg [0:31]     data ;       //声明32bit位宽的寄存器变量data, 最高有效位为0
```


# 3.变量
声明格式如下:
<数据类型><符号><位宽><变量名> <元素数>
其中数据类型和变量名是必要的，其余均可省略。数据类型可以是net型、variable型

net型变量:相当于硬件电路中的物理连接，特点是输出的值随着输入值的变化而变化
![alt text](image-1.png)

variable型变量:该变量是有存储功能的数据类型

![alt text](image-2.png)

非门
如果输入为高电平（逻辑1），则输出为低电平（逻辑0）；如果输入为低电平（逻辑0），则输出为高电平（逻辑1）
```
module not_gate (
    input wire in,  // 输入信号
    output wire out // 输出信号
);
 
// 使用assign语句创建一个非门
assign out = ~in;
 
endmodule
```



与门
只有当所有输入都是高电平时，输出才是高电平；否则，输出为低电平。
```
module and_gate (
    input wire a,  // 第一个输入信号
    input wire b,  // 第二个输入信号
    output wire out // 输出信号
);
 
// 使用assign语句创建一个与门
assign out = a & b;
 
endmodule

```



或门
只要有一个输入是高电平，输出就是高电平；只有当所有输入都是低电平时，输出才是低电平。
```
module or_gate (
    input wire a,  // 第一个输入信号
    input wire b,  // 第二个输入信号
    output wire out // 输出信号
);
 
// 使用assign语句创建一个或门
assign out = a | b;
 
endmodule

```



与非门




或非门
或非门是逻辑或门的输出经过非门的结果
```
module nor_gate (
    input wire a,  // 第一个输入信号
    input wire b,  // 第二个输入信号
    output wire out // 输出信号
);
 
// 使用assign语句创建一个或非门
// 或非逻辑是输入的逻辑或的结果取反
assign out = ~(a | b);
 
endmodule
```

异或门
如果输入信号相同，则输出为低电平；如果输入信号不同，则输出高电平
```
module xnor_gate (
    input wire a,  // 第一个输入信号
    input wire b,  // 第二个输入信号
    output wire out // 输出信号
);
 
// 使用assign语句创建一个异或非门
// 异或非逻辑是输入的异或结果取反
assign out = a ^ b;
 
endmodule

```

iverilog -o wave led_test.v led_test_tb.v

vvp -n wave

gtkwave
















































































































































































































































































































