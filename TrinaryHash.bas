/'************************************************************
* 作者：伍耀晖               Author: Geek.Zhiyuan            *
* 开源日期：2022年6月13日    Open Source Date: 2022-6-13     *
* 国家城市：中国广州         City, Country: GuangZhou, China *
************************************************************'/
' Compiled by free basic. free basic website: www.freebasic.net

#include "file.bi"

Sub Usage()
    Print "Usage: TrinaryHash YouWantToHash.File"
End Sub

Sub Trinary(ubpTrinary As UByte Pointer,_
            ByVal lNumeric As LongInt)
    ubpTrinary[0] = 0 : ubpTrinary[1] = 0 : ubpTrinary[2] = 0 : ubpTrinary[3] = 0 : ubpTrinary[4] = 0 : ubpTrinary[5] = 0 : ubpTrinary[6] = 0 : ubpTrinary[7] = 0

    ubpTrinary[8] = 0 : ubpTrinary[9] = 0 : ubpTrinary[10] = 0 : ubpTrinary[11] = 0 : ubpTrinary[12] = 0 : ubpTrinary[13] = 0 : ubpTrinary[14] = 0 : ubpTrinary[15] = 0

    ubpTrinary[16] = 0 : ubpTrinary[17] = 0 : ubpTrinary[18] = 0 : ubpTrinary[19] = 0 : ubpTrinary[20] = 0 : ubpTrinary[21] = 0 : ubpTrinary[22] = 0 : ubpTrinary[23] = 0

    If lNumeric <> 0 Then
        For i As Byte = 23 To 0 Step -1
            ubpTrinary[i] = lNumeric Mod 3

            lNumeric \= 3

        Next i

    End If
End Sub

/'
 0 0 0
 0 1 1
 0 1 2
'/

Sub TrinaryAnd(W As UByte Pointer,_
               X As UByte Pointer,_
               Y As UByte Pointer)
    For i As LongInt = 0 To 23
        If X[i] = 0 AndAlso Y[i] = 0 Then
            W[i] = 0

        ElseIf X[i] = 0 AndAlso Y[i] = 1 Then
            W[i] = 0

        ElseIf X[i] = 0 AndAlso Y[i] = 2 Then
            W[i] = 0

        ElseIf X[i] = 1 AndAlso Y[i] = 0 Then
            W[i] = 0

        ElseIf X[i] = 1 AndAlso Y[i] = 1 Then
            W[i] = 1

        ElseIf X[i] = 1 AndAlso Y[i] = 2 Then
            W[i] = 1

        ElseIf X[i] = 2 AndAlso Y[i] = 0 Then
            W[i] = 0

        ElseIf X[i] = 2 AndAlso Y[i] = 1 Then
            W[i] = 1

        ElseIf X[i] = 2 AndAlso Y[i] = 2 Then
            W[i] = 2

        End If

    Next i
End Sub

/'
 0 1 2
 1 1 2
 2 2 2
'/

Sub TrinaryOr(W As UByte Pointer,_
              X As UByte Pointer,_
              Y As UByte Pointer)
    For j As LongInt = 0 To 23
        If X[j] = 0 AndAlso Y[j] = 0 Then
            W[j] = 0

        ElseIf X[j] = 0 AndAlso Y[j] = 1 Then
            W[j] = 1

        ElseIf X[j] = 0 AndAlso Y[j] = 2 Then
            W[j] = 2

        ElseIf X[j] = 1 AndAlso Y[j] = 0 Then
            W[j] = 1

        ElseIf X[j] = 1 AndAlso Y[j] = 1 Then
            W[j] = 1

        ElseIf X[j] = 1 AndAlso Y[j] = 2 Then
            W[j] = 2

        ElseIf X[j] = 2 AndAlso Y[j] = 0 Then
            W[j] = 2

        ElseIf X[j] = 2 AndAlso Y[j] = 1 Then
            W[j] = 2

        ElseIf X[j] = 2 AndAlso Y[j] = 2 Then
            W[j] = 2

        End If

    Next j
End Sub

/'
 0 0 2
 1 1 1
 2 2 0
'/

Sub TrinaryXOr(W As UByte Pointer,_
               X As UByte Pointer,_
               Y As UByte Pointer)
    For k As LongInt = 0 To 23
        If X[k] = 0 AndAlso Y[k] = 0 Then
            W[k] = 0

        ElseIf X[k] = 0 AndAlso Y[k] = 1 Then
            W[k] = 0

        ElseIf X[k] = 0 AndAlso Y[k] = 2 Then
            W[k] = 2

        ElseIf X[k] = 1 AndAlso Y[k] = 0 Then
            W[k] = 1

        ElseIf X[k] = 1 AndAlso Y[k] = 1 Then
            W[k] = 1

        ElseIf X[k] = 1 AndAlso Y[k] = 2 Then
            W[k] = 1

        ElseIf X[k] = 2 AndAlso Y[k] = 0 Then
            W[k] = 2

        ElseIf X[k] = 2 AndAlso Y[k] = 1 Then
            W[k] = 2

        ElseIf X[k] = 2 AndAlso Y[k] = 2 Then
            W[k] = 0

        End If

    Next k
End Sub

/'
 2 0 0
 1 1 1
 0 2 2
'/

Sub TrinaryXAnd(W As UByte Pointer,_
                X As UByte Pointer,_
                Y As UByte Pointer)
    For l As LongInt = 0 To 23
        If X[l] = 0 AndAlso Y[l] = 0 Then
            W[l] = 2

        ElseIf X[l] = 0 AndAlso Y[l] = 1 Then
            W[l] = 0

        ElseIf X[l] = 0 AndAlso Y[l] = 2 Then
            W[l] = 0

        ElseIf X[l] = 1 AndAlso Y[l] = 0 Then
            W[l] = 1

        ElseIf X[l] = 1 AndAlso Y[l] = 1 Then
            W[l] = 1

        ElseIf X[l] = 1 AndAlso Y[l] = 2 Then
            W[l] = 1

        ElseIf X[l] = 2 AndAlso Y[l] = 0 Then
            W[l] = 0

        ElseIf X[l] = 2 AndAlso Y[l] = 1 Then
            W[l] = 2

        ElseIf X[l] = 2 AndAlso Y[l] = 2 Then
            W[l] = 2

        End If

    Next l
End Sub

/'
 0 1 2
 1 2 0
 2 0 1
'/

Sub TrinaryAdd(W As UByte Pointer,_
               X As UByte Pointer,_
               Y As UByte Pointer)
    For i As LongInt = 0 To 23
        If X[i] = 0 AndAlso Y[i] = 0 Then
            W[i] = 0

        ElseIf X[i] = 0 AndAlso Y[i] = 1 Then
            W[i] = 1

        ElseIf X[i] = 0 AndAlso Y[i] = 2 Then
            W[i] = 2

        ElseIf X[i] = 1 AndAlso Y[i] = 0 Then
            W[i] = 1

        ElseIf X[i] = 1 AndAlso Y[i] = 1 Then
            W[i] = 2

        ElseIf X[i] = 1 AndAlso Y[i] = 2 Then
            W[i] = 0

        ElseIf X[i] = 2 AndAlso Y[i] = 0 Then
            W[i] = 2

        ElseIf X[i] = 2 AndAlso Y[i] = 1 Then
            W[i] = 0

        ElseIf X[i] = 2 AndAlso Y[i] = 2 Then
            W[i] = 1

        End If

    Next i
End Sub

/'
 0 2 1
 1 0 2
 2 1 0
'/

Sub TrinarySubtract(W As UByte Pointer,_
                    X As UByte Pointer,_
                    Y As UByte Pointer)
    For j As LongInt = 0 To 23
        If X[j] = 0 AndAlso Y[j] = 0 Then
            W[j] = 0

        ElseIf X[j] = 0 AndAlso Y[j] = 1 Then
            W[j] = 2

        ElseIf X[j] = 0 AndAlso Y[j] = 2 Then
            W[j] = 1

        ElseIf X[j] = 1 AndAlso Y[j] = 0 Then
            W[j] = 1

        ElseIf X[j] = 1 AndAlso Y[j] = 1 Then
            W[j] = 0

        ElseIf X[j] = 1 AndAlso Y[j] = 2 Then
            W[j] = 2

        ElseIf X[j] = 2 AndAlso Y[j] = 0 Then
            W[j] = 2

        ElseIf X[j] = 2 AndAlso Y[j] = 1 Then
            W[j] = 1

        ElseIf X[j] = 2 AndAlso Y[j] = 2 Then
            W[j] = 0

        End If

    Next j
End Sub

/'
 0 0 0
 0 1 2
 0 2 1
'/

Sub TrinaryMultiply(W As UByte Pointer,_
                    X As UByte Pointer,_
                    Y As UByte Pointer)
    For k As LongInt = 0 To 23
        If X[k] = 0 AndAlso Y[k] = 0 Then
            W[k] = 0

        ElseIf X[k] = 0 AndAlso Y[k] = 1 Then
            W[k] = 0

        ElseIf X[k] = 0 AndAlso Y[k] = 2 Then
            W[k] = 0

        ElseIf X[k] = 1 AndAlso Y[k] = 0 Then
            W[k] = 0

        ElseIf X[k] = 1 AndAlso Y[k] = 1 Then
            W[k] = 1

        ElseIf X[k] = 1 AndAlso Y[k] = 2 Then
            W[k] = 2

        ElseIf X[k] = 2 AndAlso Y[k] = 0 Then
            W[k] = 0

        ElseIf X[k] = 2 AndAlso Y[k] = 1 Then
            W[k] = 2

        ElseIf X[k] = 2 AndAlso Y[k] = 2 Then
            W[k] = 1

        End If

    Next k
End Sub

/'
 0 0 0
 0 1 0
 0 2 1
'/

Sub TrinaryDivide(W As UByte Pointer,_
                  X As UByte Pointer,_
                  Y As UByte Pointer)
    For l As LongInt = 0 To 23
        If X[l] = 0 AndAlso Y[l] = 0 Then
            W[l] = 0

        ElseIf X[l] = 0 AndAlso Y[l] = 1 Then
            W[l] = 0

        ElseIf X[l] = 0 AndAlso Y[l] = 2 Then
            W[l] = 0

        ElseIf X[l] = 1 AndAlso Y[l] = 0 Then
            W[l] = 0

        ElseIf X[l] = 1 AndAlso Y[l] = 1 Then
            W[l] = 1

        ElseIf X[l] = 1 AndAlso Y[l] = 2 Then
            W[l] = 0

        ElseIf X[l] = 2 AndAlso Y[l] = 0 Then
            W[l] = 0

        ElseIf X[l] = 2 AndAlso Y[l] = 1 Then
            W[l] = 2

        ElseIf X[l] = 2 AndAlso Y[l] = 2 Then
            W[l] = 1

        End If

    Next l
End Sub

Sub F(W As UByte Pointer,_
      X As UByte Pointer,_
      Y As UByte Pointer,_
      Z As UByte Pointer)
    TrinaryAnd(W, X, Y)

    TrinaryOr(W, W, Z)
End Sub

Sub G(W As UByte Pointer,_
      X As UByte Pointer,_
      Y As UByte Pointer,_
      Z As UByte Pointer)
    TrinaryAdd(W, Y, Z)

    TrinaryMultiply(W, W, X)
End Sub

Sub H(W As UByte Pointer,_
      X As UByte Pointer,_
      Y As UByte Pointer,_
      Z As UByte Pointer)
    TrinaryXOr(W, Z, X)

    TrinaryXAnd(W, W, Y)
End Sub

Sub I1(W As UByte Pointer,_
       X As UByte Pointer,_
       Y As UByte Pointer,_
       Z As UByte Pointer)
    TrinarySubtract(W, X, Y)

    TrinaryDivide(W, W, Z)
End Sub

Sub Add(W As UByte Pointer,_
        Z As UByte Pointer)
    Dim As UByte ubCarry = 0

    For i As LongInt = 0 To 23
        W[i] += Z[i] + ubCarry

        If W[i] > 2 Then
            W[i] -= 3

            If ubCarry = 0 Then
                ubCarry = 1

            End If

        Else
            ubCarry = 0

        End If

    Next i
End Sub

Sub RotateShiftLeft(W As UByte Pointer,_
                    ubBit As UByte)
    Dim As UByte ubaSwap(23)

    For i As LongInt = 23 To 0 Step -1
        Dim As UByte j

        If i >= ubBit Then
            j = i - ubBit

        Else
            j = 24 - ubBit + i

        End If

        ubaSwap(i) = W[j]

    Next i

    For k As LongInt = 0 To 23
        W[k] = ubaSwap(k)

    Next k
End Sub

Sub FF(A As UByte Pointer,_
       B As UByte Pointer,_
       C As UByte Pointer,_
       D As UByte Pointer,_
       E As UByte Pointer,_
       ubShift As UByte,_
       K As UByte Pointer)
    Dim As UByte ubaTemp(23)

    F(@ubaTemp(0), B, C, D)

    Add(@ubaTemp(0), A)

    Add(@ubaTemp(0), E)

    Add(@ubaTemp(0), K)

    RotateShiftLeft(@ubaTemp(0), ubShift)

    Add(@ubaTemp(0), B)

    For i As LongInt = 0 To 23
        A[i] = ubaTemp(i)

    Next i
End Sub

Sub GG(A As UByte Pointer,_
       B As UByte Pointer,_
       C As UByte Pointer,_
       D As UByte Pointer,_
       E As UByte Pointer,_
       ubShift As UByte,_
       K As UByte Pointer)
    Dim As UByte ubaTemp(23)

    G(@ubaTemp(0), C, D, A)

    Add(@ubaTemp(0), B)

    Add(@ubaTemp(0), E)

    Add(@ubaTemp(0), K)

    RotateShiftLeft(@ubaTemp(0), ubShift)

    Add(@ubaTemp(0), C)

    For j As LongInt = 0 To 23
        B[j] = ubaTemp(j)

    Next j
End Sub

Sub HH(A As UByte Pointer,_
       B As UByte Pointer,_
       C As UByte Pointer,_
       D As UByte Pointer,_
       E As UByte Pointer,_
       ubShift As UByte,_
       K As UByte Pointer)
    Dim As UByte ubaTemp(23)

    H(@ubaTemp(0), D, A, B)

    Add(@ubaTemp(0), C)

    Add(@ubaTemp(0), E)

    Add(@ubaTemp(0), K)

    RotateShiftLeft(@ubaTemp(0), ubShift)

    Add(@ubaTemp(0), D)

    For k As LongInt = 0 To 23
        C[k] = ubaTemp(k)

    Next k
End Sub

Sub II(A As UByte Pointer,_
       B As UByte Pointer,_
       C As UByte Pointer,_
       D As UByte Pointer,_
       E As UByte Pointer,_
       ubShift As UByte,_
       K As UByte Pointer)
    Dim As UByte ubaTemp(23)

    I1(@ubaTemp(0), A, B, C)

    Add(@ubaTemp(0), D)

    Add(@ubaTemp(0), E)

    Add(@ubaTemp(0), K)

    RotateShiftLeft(@ubaTemp(0), ubShift)

    Add(@ubaTemp(0), A)

    For l As LongInt = 0 To 23
        D[l] = ubaTemp(l)

    Next l
End Sub

Sub TrinaryHash(A As UByte Pointer,_
                B As UByte Pointer,_
                C As UByte Pointer,_
                D As UByte Pointer,_
                E() As UByte)
    Const Shift11 = 2, Shift12 = 22, Shift13 = 3, Shift14 = 21, Shift21 = 5, Shift22 = 15, Shift23 = 7, Shift24 = 14,_
          Shift31 = 11, Shift32 = 12, Shift33 = 13, Shift34 = 10, Shift41 = 17, Shift42 = 6, Shift43 = 19, Shift44 = 4

    Dim As UByte K0(23) => {2, 1, 1, 1, 2, 2, 0, 1, 2, 2, 1, 1, 2, 1, 2, 2, 2, 0, 0, 0, 1, 0, 0, 0}

    Dim As UByte K1(23) => {1, 1, 2, 0, 0, 1, 0, 0, 0, 1, 0, 2, 1, 1, 0, 2, 0, 0, 1, 0, 1, 0, 0, 0}

    Dim As UByte K2(23) => {0, 0, 2, 2, 1, 2, 0, 0, 1, 1, 1, 1, 0, 2, 0, 0, 2, 1, 1, 0, 0, 0, 0, 0}

    Dim As UByte K3(23) => {1, 1, 1, 0, 1, 0, 0, 2, 1, 1, 2, 0, 2, 1, 1, 1, 0, 1, 2, 2, 0, 0, 0, 0}

    Dim As UByte K4(23) => {1, 2, 1, 1, 2, 0, 1, 2, 2, 2, 0, 2, 0, 0, 0, 2, 2, 1, 1, 0, 1, 0, 0, 0}

    Dim As UByte K5(23) => {2, 1, 0, 2, 1, 2, 1, 0, 1, 1, 1, 0, 2, 2, 1, 2, 0, 0, 0, 1, 0, 0, 0, 0}

    Dim As UByte K6(23) => {2, 0, 0, 1, 0, 0, 1, 0, 0, 1, 2, 1, 2, 2, 1, 1, 2, 0, 1, 2, 0, 0, 0, 0}

    Dim As UByte K7(23) => {2, 2, 1, 0, 0, 2, 1, 1, 2, 1, 0, 2, 0, 1, 0, 2, 2, 2, 1, 0, 1, 0, 0, 0}

    Dim As UByte K8(23) => {1, 2, 0, 0, 1, 0, 0, 1, 0, 2, 2, 1, 0, 0, 1, 0, 2, 1, 1, 1, 0, 0, 0, 0}

    Dim As UByte K9(23) => {2, 1, 1, 2, 2, 2, 1, 1, 0, 2, 2, 1, 1, 1, 2, 0, 0, 0, 0, 2, 0, 0, 0, 0}

    Dim As UByte K10(23) => {1, 2, 2, 0, 1, 2, 0, 1, 2, 2, 2, 1, 2, 2, 0, 2, 0, 0, 2, 0, 1, 0, 0, 0}

    Dim As UByte K11(23) => {1, 1, 0, 2, 2, 0, 1, 2, 2, 2, 0, 1, 1, 2, 1, 1, 2, 2, 2, 1, 0, 0, 0, 0}

    Dim As UByte K12(23) => {2, 0, 1, 2, 1, 2, 0, 0, 1, 0, 0, 2, 2, 0, 2, 2, 2, 1, 1, 1, 0, 0, 0, 0}

    Dim As UByte K13(23) => {2, 2, 2, 0, 2 ,2, 1, 0, 1, 1, 1, 2, 1, 1, 1, 2, 2, 2, 1, 0, 1, 0, 0, 0}

    Dim As UByte K14(23) => {1, 0, 1, 1, 0, 2, 2, 2, 0, 0, 1, 1, 2, 2, 1, 2, 1, 0, 1, 2, 0, 0, 0, 0}

    Dim As UByte K15(23) => {0, 1, 2, 0, 2, 1, 1, 1, 1, 2, 0, 2, 1, 1, 0, 2, 1, 0, 0, 1, 0, 0, 0, 0}

    Dim As UByte K16(23) => {0, 0, 1, 0, 1, 1, 1, 2, 1, 2 ,0, 2, 2, 0, 2, 2, 2, 1, 1, 0, 1, 0, 0, 0}

    Dim As UByte K17(23) => {1, 2, 0, 2, 0, 0, 2, 2, 1, 1, 2, 0, 0, 1, 2, 2, 2, 0, 2, 2, 0, 0, 0, 0}

    Dim As UByte K18(23) => {0, 1, 2, 0, 0, 2, 0, 2, 0, 1, 2, 0, 2, 1, 2, 2, 2, 1, 1, 0, 0, 0, 0, 0}

    Dim As UByte K19(23) => {1, 2, 1, 1, 1, 2, 2, 2, 2, 1, 1, 0, 1, 2, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0}

    Dim As UByte K20(23) => {1, 2, 1, 0, 2, 2, 1, 0, 0, 2, 2, 1, 2, 0, 1, 1, 2, 0, 0, 0, 1, 0, 0, 0}

    Dim As UByte K21(23) => {2, 0, 0, 1, 2, 0, 2, 0, 1, 2, 1, 1, 2, 2, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0}

    Dim As UByte K22(23) => {1, 2, 0, 0, 2, 1, 1, 1, 0, 1, 2, 2, 1, 2, 0, 1, 0, 1, 0, 0, 1, 0, 0, 0}

    Dim As UByte K23(23) => {2, 1, 1, 1, 1, 0, 1, 1, 1, 2, 2, 1, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, 0}

    Dim As UByte K24(23) => {0, 1, 2, 0, 2, 2, 1, 0, 0, 2, 2, 1, 1, 2, 1, 0, 1, 1, 1, 0, 0, 0, 0, 0}

    Dim As UByte K25(23) => {0, 1, 2, 1, 1, 2, 2, 1, 1, 0, 1, 2, 0, 2, 0, 0, 1, 1, 2, 2, 0, 0, 0, 0}

    Dim As UByte K26(23) => {2, 1, 2, 0, 1, 1, 2, 1, 2, 1, 1, 0, 1, 2, 0, 1, 2, 1, 1, 0, 1, 0, 0, 0}

    Dim As UByte K27(23) => {2, 2, 0, 1, 1, 0, 2, 1, 1, 1, 0, 1, 2, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0}

    Dim As UByte K28(23) => {1, 1, 2, 2, 0, 0, 2, 1, 1, 2, 2, 0, 2, 2, 1, 0, 0, 1, 1, 2, 0, 0, 0, 0}

    Dim As UByte K29(23) => {2, 2, 2, 2, 0, 2, 0, 0, 1, 0, 0, 0, 2, 0, 2, 1, 2, 2, 1, 0, 1, 0, 0, 0}

    Dim As UByte K30(23) => {1, 2, 2, 0, 1, 0, 1, 1, 2, 2, 2, 0, 1, 2, 2, 0, 1, 1, 1, 1, 0, 0, 0, 0}

    Dim As UByte K31(23) => {1, 1, 2, 2, 1, 1, 0, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 2, 0, 0, 0, 0}

    Dim As UByte K32(23) => {1, 1, 0, 0, 2, 0, 1, 0, 2, 0, 0, 0, 2, 2, 0, 2, 0, 0, 2, 0, 1, 0, 0, 0}

    Dim As UByte K33(23) => {2, 1, 1, 1, 2, 2, 1, 1, 1, 0, 2, 2, 0, 0, 1, 2, 1, 2, 2, 1, 0, 0, 0, 0}

    Dim As UByte K34(23) => {1, 0, 0, 0, 0, 2, 2, 0, 1, 0, 1, 1, 1, 1, 0, 2, 0, 2, 1, 1, 0, 0, 0, 0}

    Dim As UByte K35(23) => {1, 1, 1, 0, 2, 2, 0, 0, 0, 2, 2, 0, 2, 1, 2, 2, 2, 2, 1, 0, 1, 0, 0, 0}

    Dim As UByte K36(23) => {2, 1, 0, 0, 2, 0, 1, 1, 1, 0, 2, 2, 1, 2, 1, 0, 1, 0, 1, 2, 0, 0, 0, 0}

    Dim As UByte K37(23) => {1, 2, 0, 2, 0, 1, 0, 0, 2, 1, 1, 0, 1, 0, 2, 1, 2, 0, 0, 1, 0, 0, 0, 0}

    Dim As UByte K38(23) => {1, 2, 0, 2, 1, 2, 1, 1, 2, 0, 1, 0, 1, 1, 1, 0, 0, 2, 1, 0, 1, 0, 0, 0}

    Dim As UByte K39(23) => {0, 2, 1, 1, 0, 1, 2, 1, 2, 0, 1, 2, 0, 0, 0, 1, 2, 0, 2, 2, 0, 0, 0, 0}

    Dim As UByte K40(23) => {0, 0, 0, 0, 0, 1, 0, 2, 1, 1, 2, 2, 0, 1, 1, 2, 0, 2, 1, 0, 0, 0, 0, 0}

    Dim As UByte K41(23) => {0, 1, 1, 0, 2, 2, 0, 0, 1, 2, 0, 0, 0, 0, 1, 1, 1, 0, 1, 0, 1, 0, 0, 0}

    Dim As UByte K42(23) => {2, 1, 1, 0, 0, 2, 0, 0, 0, 2, 1, 0, 2, 2, 2, 2, 1, 0, 0, 0, 1, 0, 0, 0}

    Dim As UByte K43(23) => {0, 2, 2, 2, 0, 1, 0, 0, 2, 1, 0, 0, 2, 2, 0, 2, 1, 0, 0, 0, 0, 0, 0, 0}

    Dim As UByte K44(23) => {1, 2, 1, 0, 2, 1, 1, 0, 0, 0, 1, 2, 0, 0, 2, 2, 0, 1, 0, 0, 1, 0, 0, 0}

    Dim As UByte K45(23) => {0, 1, 0, 2, 2, 2, 0, 1, 1, 0, 0, 0, 1, 2, 2, 2, 2, 2, 0, 0, 1, 0, 0, 0}

    Dim As UByte K46(23) => {1, 0, 1, 2, 1, 2, 1, 1, 1, 0, 0, 2, 2, 2, 2, 0, 0, 1, 1, 0, 0, 0, 0, 0}

    Dim As UByte K47(23) => {0, 0, 1, 0, 2, 1, 1, 1, 1, 1, 1, 2, 1, 2, 2, 1, 1, 1, 2, 2, 0, 0, 0, 0}

    Dim As UByte K48(23) => {0, 2, 2, 2, 1, 0, 0, 1, 1, 2, 2, 2, 0, 1, 1, 0, 2, 1, 1, 0, 1, 0, 0, 0}

    Dim As UByte K49(23) => {2, 0, 0, 2, 0, 1, 0, 0, 0, 0, 1, 1, 2, 1, 1, 0, 2, 2, 2, 0, 0, 0, 0, 0}

    Dim As UByte K50(23) => {2, 0, 2, 1, 1, 2, 2, 2, 1, 1, 2, 1, 1, 2, 1, 2, 0, 1, 1, 2, 0, 0, 0, 0}

    Dim As UByte K51(23) => {1, 2, 1, 0, 1, 2, 2, 2, 2, 2, 2, 1, 2, 2, 0, 1, 2, 2, 1, 0, 1, 0, 0, 0}

    Dim As UByte K52(23) => {2, 0, 0, 0, 0, 2, 1, 2, 1, 2, 0, 2, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0}

    Dim As UByte K53(23) => {1, 0, 2, 0, 2, 1, 2, 2, 1, 2, 2, 2, 0, 2, 0, 2, 1, 0, 0, 2, 0, 0, 0, 0}

    Dim As UByte K54(23) => {2, 1, 1, 2, 0, 0, 2, 1, 1, 2, 0, 2, 0, 2, 0, 2, 0, 0, 2, 0, 1, 0, 0, 0}

    Dim As UByte K55(23) => {0, 0, 0, 1, 0, 1, 1, 0, 0, 1, 0, 0, 0, 1, 0, 0, 1, 2, 2, 1, 0, 0, 0, 0}

    Dim As UByte K56(23) => {1, 2, 0, 1, 1, 2, 1, 1, 0, 2, 2, 2, 2, 1, 1, 1, 1, 2, 1, 1, 0, 0, 0, 0}

    Dim As UByte K57(23) => {2, 1, 1, 2, 0, 0, 1, 0, 2, 0, 1, 0, 2, 1, 0, 0, 0, 0, 2, 0, 1, 0, 0, 0}

    Dim As UByte K58(23) => {2, 2, 1, 0, 0, 2, 2, 2, 1, 1, 2, 2, 0, 2, 1, 1, 0, 0, 1, 2, 0, 0, 0, 0}

    Dim As UByte K59(23) => {0, 1, 0, 0, 1, 1, 0, 1, 2, 1, 0, 1, 0, 2, 0, 1, 0, 1, 0, 1, 0, 0, 0, 0}

    Dim As UByte K60(23) => {1, 1, 1, 1, 0, 1, 1, 2, 1, 0, 2, 2, 1, 1, 0, 1, 0, 2, 1, 0, 1, 0, 0, 0}

    Dim As UByte K61(23) => {2, 1, 1, 2, 0, 2, 0, 0, 1, 2, 1, 2, 0, 2, 0, 2, 1, 0, 2, 2, 0, 0, 0, 0}

    Dim As UByte K62(23) => {0, 0, 1, 2, 0, 2, 1, 1, 0, 2, 1, 1, 2, 0, 0, 2, 1, 2, 1, 0, 0, 0, 0, 0}

    Dim As UByte K63(23) => {2, 0, 2, 0, 2, 2, 1, 0, 0, 2, 0, 1, 1, 0, 1, 2, 1, 0, 1, 0, 1, 0, 0, 0}

    FF(A, B, C, D, @E( 0, 0), Shift11, @K0(0))

    FF(B, C, D, A, @E( 1, 0), Shift12, @K1(0))

    FF(C, D, A, B, @E( 2, 0), Shift13, @K2(0))

    FF(D, A, B, C, @E( 3, 0), Shift14, @K3(0))

    FF(A, B, C, D, @E( 4, 0), Shift11, @K4(0))

    FF(B, C, D, A, @E( 5, 0), Shift12, @K5(0))

    FF(C, D, A, B, @E( 6, 0), Shift13, @K6(0))

    FF(D, A, B, C, @E( 7, 0), Shift14, @K7(0))

    FF(A, B, C, D, @E( 8, 0), Shift11, @K8(0))

    FF(B, C, D, A, @E( 9, 0), Shift12, @K9(0))

    FF(C, D, A, B, @E(10, 0), Shift13, @K10(0))

    FF(D, A, B, C, @E(11, 0), Shift14, @K11(0))

    FF(A, B, C, D, @E(12, 0), Shift11, @K12(0))

    FF(B, C, D, A, @E(13, 0), Shift12, @K13(0))

    FF(C, D, A, B, @E(14, 0), Shift13, @K14(0))

    FF(D, A, B, C, @E(15, 0), Shift14, @K15(0))

    GG(A, B, C, D, @E( 1, 0), Shift21, @K16(0))

    GG(D, A, B, C, @E( 6, 0), Shift22, @K17(0))

    GG(C, D, A, B, @E(11, 0), Shift23, @K18(0))

    GG(B, C, D, A, @E( 0, 0), Shift24, @K19(0))

    GG(A, B, C, D, @E( 5, 0), Shift21, @K20(0))

    GG(D, A, B, C, @E(10, 0), Shift22, @K21(0))

    GG(C, D, A, B, @E(15, 0), Shift23, @K22(0))

    GG(B, C, D, A, @E( 4, 0), Shift24, @K23(0))

    GG(A, B, C, D, @E( 9, 0), Shift21, @K24(0))

    GG(D, A, B, C, @E(14, 0), Shift22, @K25(0))

    GG(C, D, A, B, @E( 3, 0), Shift23, @K26(0))

    GG(B, C, D, A, @E( 8, 0), Shift24, @K27(0))

    GG(A, B, C, D, @E(13, 0), Shift21, @K28(0))

    GG(D, A, B, C, @E( 2, 0), Shift22, @K29(0))

    GG(C, D, A, B, @E( 7, 0), Shift23, @K30(0))

    GG(B, C, D, A, @E(12, 0), Shift24, @K31(0))

    HH(A, B, C, D, @E( 5, 0), Shift31, @K32(0))

    HH(B, C, D, A, @E( 8, 0), Shift32, @K33(0))

    HH(C, D, A, B, @E(11, 0), Shift33, @K34(0))

    HH(D, A, B, C, @E(14, 0), Shift34, @K35(0))

    HH(A, B, C, D, @E( 1, 0), Shift31, @K36(0))

    HH(B, C, D, A, @E( 4, 0), Shift32, @K37(0))

    HH(C, D, A, B, @E( 7, 0), Shift33, @K38(0))

    HH(D, A, B, C, @E(10, 0), Shift34, @K39(0))

    HH(A, B, C, D, @E(13, 0), Shift31, @K40(0))

    HH(B, C, D, A, @E( 0, 0), Shift32, @K41(0))

    HH(C, D, A, B, @E( 3, 0), Shift33, @K42(0))

    HH(D, A, B, C, @E( 6, 0), Shift34, @K43(0))

    HH(A, B, C, D, @E( 9, 0), Shift31, @K44(0))

    HH(B, C, D, A, @E(12, 0), Shift32, @K45(0))

    HH(C, D, A, B, @E(15, 0), Shift33, @K46(0))

    HH(D, A, B, C, @E( 2, 0), Shift34, @K47(0))

    II(A, B, C, D, @E( 0, 0), Shift41, @K48(0))

    II(D, A, B, C, @E( 7, 0), Shift42, @K49(0))

    II(C, D, A, B, @E(14, 0), Shift43, @K50(0))

    II(B, C, D, A, @E( 5, 0), Shift44, @K51(0))

    II(A, B, C, D, @E(12, 0), Shift41, @K52(0))

    II(D, A, B, C, @E( 3, 0), Shift42, @K53(0))

    II(C, D, A, B, @E(10, 0), Shift43, @K54(0))

    II(B, C, D, A, @E( 1, 0), Shift44, @K55(0))

    II(A, B, C, D, @E( 8, 0), Shift41, @K56(0))

    II(D, A, B, C, @E(15, 0), Shift42, @K57(0))

    II(C, D, A, B, @E( 6, 0), Shift43, @K58(0))

    II(B, C, D, A, @E(13, 0), Shift44, @K59(0))

    II(A, B, C, D, @E( 4, 0), Shift41, @K60(0))

    II(D, A, B, C, @E(11, 0), Shift42, @K61(0))

    II(C, D, A, B, @E( 2, 0), Shift43, @K62(0))

    II(B, C, D, A, @E( 9, 0), Shift44, @K63(0))
End Sub

Sub Main()
    Dim As UByte ubaPadding(63) => {2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97,_
        101, 103, 107, 109, 113, 127, 131, 137, 139, 149, 151, 157, 163, 167, 173, 179, 181, 191, 193, 197, 199,_
        211, 223, 227, 229, 233, 239, 241, 251, 15, 25, 35, 55, 65, 85, 95, 115, 145, 155}

    Dim As UByte ubaMessageDigest0(23) => {1, 2, 1, 0, 0, 0, 2, 1, 2, 1, 0, 0, 0, 1, 0, 0, 1, 0, 1, 0, 1, 1, 1, 0}

    Dim As UByte ubaMessageDigest1(23) => {2, 2, 1, 2, 1, 0, 0, 2, 2, 0, 2, 0, 1, 1, 0, 2, 2, 0, 2, 0, 1, 0, 0, 1}

    Dim As UByte ubaMessageDigest2(23) => {2, 1, 2, 2, 2, 0, 1, 2, 1, 1, 2, 0, 0, 0, 1, 0, 2, 0, 2, 0, 0, 2, 1, 0}

    Dim As UByte ubaMessageDigest3(23) => {1, 1, 2, 0, 1, 0, 0, 2, 1, 2, 0, 0, 2, 2, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0}

    Dim As UByte ubCLAA = 1, ubaTrinary(15, 23)

    Dim As LongInt lFileSize, lBytesLeft, i, j, k, l

    Dim As UByte Pointer ubpData

    Do
        Dim As String strCLA = Command(ubCLAA)

        If Len(strCLA) = 0 Then
            Exit Do

        End If

        ubCLAA += 1

    Loop

    If ubCLAA <> 2 Then
        Usage()

    Else
        lFileSize = FileLen(Command(1))

        If lFileSize = 0 Then
            Print "There is no data in file [" & Command(1) & "], 0 byte."

            End -1

        End If

        lBytesLeft = lFileSize And 63

        If lBytesLeft = 0 Then
            lBytesLeft = lFileSize + 64

        ElseIf lBytesLeft < 54 Then
            lBytesLeft = lFileSize - lBytesLeft + 64

        ElseIf lBytesLeft > 53 Then
            lBytesLeft = lFileSize - lBytesLeft + 128

        End If

        ubpData = New UByte[lBytesLeft]

        Open Command(1) For Binary Access Read As #3

        Get #3, , *ubpData, lFileSize

        Close #3

        For i = 0 To 4
            ubpData[i + lFileSize] = lFileSize Shr 8 * i

        Next i

        k = 0

        For j = lFileSize + 5 To lBytesLeft - 6
            ubpData[j] = ubaPadding(k)

            k += 1

        Next j

        For l = 4 To 0 Step -1
            ubpData[lBytesLeft - l - 1] = lFileSize Shr 8 * l

        Next l

        For i = 0 To lBytesLeft - 1 Step 64
            For j = 0 To 15
                Trinary(@ubaTrinary(j, 0), ubpData[i + 4 * j] + ubpData[i + 4 * j + 1] Shl 8 + ubpData[i + 4 * j + 2] Shl 16 + ubpData[i + 4 * j + 3] Shl 24)

            Next j

            TrinaryHash(@ubaMessageDigest0(0), @ubaMessageDigest1(0), @ubaMessageDigest2(0), @ubaMessageDigest3(0), ubaTrinary())

        Next i

        For k = 0 To 23
            Print ubaMessageDigest0(k); ubaMessageDigest1(k); ubaMessageDigest2(k); ubaMessageDigest3(k);

        Next k

        Print

        Delete ubpData

    End If
End Sub

Main()