# 軟硬體協同設計 實驗報告
>B1105125 彭皓楷

---

## 報告內容： 4-bit full adder

---

## 實驗目的
認識 Verilog 的程式結構與 Vivado的使用。

---

## 實驗原理
- full adder 由三個一位元輸入(兩個加數、進位)和兩個一位元輸出(總和值、進位數)組成。

- 其優勢為通用性，把N個 full adder 串在一起，就可以實現 N-bit 的加法器，其中每個 full adder 的輸出進位連接到下一級的輸入進位。
- 本次實驗以 4-bit 為基準，透過verilog實現，並由vivado來做模擬與驗證

---

## 實驗步驟

---

1. 透過 verilog 描述單個 full adder 的行為。
![](https://hackmd.io/_uploads/HyqXUaDx6.png)

---

2. 引用 1步驟 的 full adder 4次，以實現 4-bit adder。
![](https://hackmd.io/_uploads/SJvMDavxa.png)

---

3. 製作 test bench。
![](https://hackmd.io/_uploads/BJ1bFTvgp.png)

---

3. 製作 test bench。
![](https://hackmd.io/_uploads/H1b-FaDl6.png)

---

4. 利用 vivado 進行模擬與驗證。
![](https://hackmd.io/_uploads/Hy7WnpDgp.png)

---

## 實驗結果

---

檢查波型後得知此 adder 是順利運作的。
![](https://hackmd.io/_uploads/B1wZi0De6.png)


---

邏輯合成後的 Schematic
![](https://hackmd.io/_uploads/HJWHyRDla.png)

---

Power report
![](https://hackmd.io/_uploads/BkDYl0De6.png)

---

通過多次測試和觀察，4-bit全加器的輸出結果與預期完全一致。這確認了我們的全加器設計在所有可能的輸入組合下都能正確運作。

---

## 實驗心得
從這次實驗開始，我正式踏入了Verilog的世界。作為一名初學者，這不僅是一次學習的過程，更是一次探索和挑戰。我花了很長一段時間去研究，開始了解要如何實現多bit的計算，以及計算式的呈現方法，也因此漸漸了解該如何下手。
總之，初次使用Verilog是一個具有挑戰性但也有趣的經驗，我知道還有更多語法等著我，但我會盡可能地加以擊破。

---

## 參考文獻/資料
- [youtube---{Merak Channel 天璇} [Verilog入門教學] 本篇#1 verilog基礎語法](https://https://www.youtube.com/watch?v=0qUIl3wI_I8&list=PLkH9pBMaZuHQ0_P26d8ctZSd9trPajCmI&index=5)
- [youtube---{吳順德}數位邏輯實驗Lab4 4 Verilog Testbench](https://www.youtube.com/watch?v=f-MyEpbChGw)
- [CSDN---Verilog中“=”和“<=”的區別](https://blog.csdn.net/aahello123/article/details/46672201)
- 課堂上 單位全加器檔案資料---HW0_Setting