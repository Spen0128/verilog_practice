# 軟硬體協同設計報告 (BCD to Decimal Decoder with Preset/Reset)
國立高雄大學 電機工程學系
B1105125 **彭皓楷**
指導老師： **林宏益** 助理教授
## (一) 實驗目的
本實驗除了實現與了解解碼器的架構外，透過製作過程讓學生熟悉 Verilog 及 Vivado 的操作方法，藉以認識IC設計的流程。
## (二) 實驗原理
**二進制編碼十進制(BCD, Binary-Coded Decimal)** 是一種類比於二進制的數字系統，其用四個二進制位表示一個十進制數字。BCD轉Decimal解碼器的目的是將這四位BCD碼轉換為十位Decimal輸出，其中只有一位為低電位(通常為0)。
當BCD輸入為任何有效的十進制數字(0到9)時，相應的十進位輸出線將變為低電位，而其他所有輸出線將保持高電位。為了確保解碼器的正確運作，BCD輸入必須限制在有效範圍內，即0000到1001超出此範圍的任何輸入都應該被視為無效，並適當地處理。
> Ex: 當BCD輸入為[0100]時，對應之十進位數為4，在十個輸出中的第四個輸出腳位會是低電位，其餘皆為高電位。

BCD到Decimal解碼器是數位電路設計中的基本元件，通過理解其運作原理和應用，工程師和學者可以更好地利用此解碼器在複雜的電子系統中解決問題。
> BCD到Decimal解碼器應用廣泛，其中包括普遍常見的七段顯示器的驅動電路，在某些情況上也會拿來當多工器使用，


## (三) 實驗步驟
1. 藉由 verilog 描述出該 BCD 轉十進位解碼器應有的行為(如下圖真值表)。
![](https://hackmd.io/_uploads/H1IIWsMZa.png)
2. 撰寫{步驟1}裡 verilog 的 test bench ，以驗證該程式的完整度。
3. 建立 vivado 專案，以 Xilinx *xc7z020clg400-1*為基板模擬，使用教授提供之constrain，並加入前兩步驟完成之 verilog source code。
4. 按下 [Run Simulation] ，並觀察產生出的波形圖狀態，確保解碼器正常運作。
5. 按下 [Run Linter] ，並觀察 Schemetic 以及 I/O Port 的狀況。
6. 按下 [Run Synthesis] ，查看功耗及面積分布等報告。
7. 統整得到的結果以進行分析。

## (四) 實驗結果
### Source code
```
// This is a 4-line BCD -> 10-line decimal converter with two other condition input(Reset_n, Preset)

module BCD2DEC (input [3:0] BCD_input,input reset_n, preset, output reg [9:0] DEC_output);

	always @(*) begin
		// Consider the priority of reset_n and preset
		if (reset_n == 1'b0) DEC_output = 0;
		else if (preset == 1'b1) DEC_output = 10'b0000001111;
		else begin
			DEC_output = 10'b1111111111; // Default all outputs to 1

			// Check the BCD input and set the corresponding output to 0
			case (BCD_input)
				4'd0: DEC_output[0] = 0;
				4'd1: DEC_output[1] = 0;
				4'd2: DEC_output[2] = 0;
				4'd3: DEC_output[3] = 0;
				4'd4: DEC_output[4] = 0;
				4'd5: DEC_output[5] = 0;
				4'd6: DEC_output[6] = 0;
				4'd7: DEC_output[7] = 0;
				4'd8: DEC_output[8] = 0;
				4'd9: DEC_output[9] = 0;
			endcase
		end
	end
endmodule
```
### Waveform
* 透過波形模擬得知在主要功能上 (reset_n=1, preset=0) ，BCD輸入在總共16種輸入中都能正確執行。
![](https://hackmd.io/_uploads/ryzVVhMbT.png)
* 在 reset_n=0 的各種輸入情況都符合理想，輸出都為0。
![](https://hackmd.io/_uploads/rJ706hzba.png)
* 在 preset=1 且 reset_n=1 的情況下，輸出也符合預期。
![](https://hackmd.io/_uploads/B1JQyafW6.png)

與真值表比對一遍後，確認是符合理想行為。

### Schemetic
從圖中可得知執行的架構是先讓 BCD 進行十進位的轉換(包含A~F的輸入)，再透過兩個二對一多工器來達到 preset 與 reset_n 抉擇篩選，讓此兩輸入的優先級比BCD輸入還要高。如果不考慮 preset, reset_n，那只需要用第一步使用的block就能達成，以邏輯實現上來說，preset, reset_n的想法剛好就是在進行訊號的選擇。
![](https://hackmd.io/_uploads/rygEl6zb6.png)

### Utilization
本次實作使用了16個 I/O Port、10個 Look up table ，因為是功能簡單的小 project，使用率低本來就是預料之內。
![](https://hackmd.io/_uploads/S12yHaMba.png)

### Power
圖中可知動態功耗的消耗比例極大，是因為電容充放電所引起，FPGA通常體現出來的動態功耗為記憶體、內部邏輯、I/O、時鐘，其中 I/O 通常會占比非常大，如同本次實作結果。
![](https://hackmd.io/_uploads/BkiIU6GW6.png)

## (五) 實驗心得
因為前一次的作業，讓我這次對 verilog 還算是得心應手，不過途中還是總會有些意外情況，如 preset input 沒有設定成高優先級，導致在不管是高電位還是低電位，都會執行轉碼，而我在剛開始製作時沒有考慮到這一點，代表沒有想得很完整，這方面還有待加強。
此次實作，讓我比較好奇的點是我沒有想到這樣還需要耗掉2W的電，才一個極為簡單的小元件就幾乎跟平常手機cpu的耗電量差不多，讓我有點意外，令我有點好奇是不是有更精簡的設計，還是單純因為fpga本身設計上的緣故。

## (六) 參考文獻
Runoob: Verilog 多路分支語句 (case) --- https://www.runoob.com/w3cnote/verilog-case.html

CSDN: FPGA 的功耗概念与低功耗设计研究 --- https://blog.csdn.net/Pieces_thinking/article/details/85243373

Xilinx: Vivado：查看各模塊資源占用情況方法 --- https://xilinx.eetrend.com/blog/2020/100059733.html