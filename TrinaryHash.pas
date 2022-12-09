(*************************************************************
* 作者：伍耀晖               Author: Geek.Zhiyuan            *
* 开源日期：2022年6月13日    Open Source Date: 2022-6-13     *
* 国家城市：中国广州         City, Country: GuangZhou, China *
*************************************************************)
(* Compiled by free pascal. free pascal website: www.freepascal.org *)

Program TrinaryHash;

Type
    Trinary24A = Array[0..23] Of Byte;

Const
    Shift11 = 2; Shift12 = 22; Shift13 = 3; Shift14 = 21; Shift21 = 5; Shift22 = 15; Shift23 = 7; Shift24 = 14;

    Shift31 = 11; Shift32 = 12; Shift33 = 13; Shift34 = 10; Shift41 = 17; Shift42 = 6; Shift43 = 19; Shift44 = 4;

    K0 : Trinary24A = (2, 1, 1, 1, 2, 2, 0, 1, 2, 2, 1, 1, 2, 1, 2, 2, 2, 0, 0, 0, 1, 0, 0, 0);

    K1 : Trinary24A = (1, 1, 2, 0, 0, 1, 0, 0, 0, 1, 0, 2, 1, 1, 0, 2, 0, 0, 1, 0, 1, 0, 0, 0);

    K2 : Trinary24A = (0, 0, 2, 2, 1, 2, 0, 0, 1, 1, 1, 1, 0, 2, 0, 0, 2, 1, 1, 0, 0, 0, 0, 0);

    K3 : Trinary24A = (1, 1, 1, 0, 1, 0, 0, 2, 1, 1, 2, 0, 2, 1, 1, 1, 0, 1, 2, 2, 0, 0, 0, 0);

    K4 : Trinary24A = (1, 2, 1, 1, 2, 0, 1, 2, 2, 2, 0, 2, 0, 0, 0, 2, 2, 1, 1, 0, 1, 0, 0, 0);

    K5 : Trinary24A = (2, 1, 0, 2, 1, 2, 1, 0, 1, 1, 1, 0, 2, 2, 1, 2, 0, 0, 0, 1, 0, 0, 0, 0);

    K6 : Trinary24A = (2, 0, 0, 1, 0, 0, 1, 0, 0, 1, 2, 1, 2, 2, 1, 1, 2, 0, 1, 2, 0, 0, 0, 0);

    K7 : Trinary24A = (2, 2, 1, 0, 0, 2, 1, 1, 2, 1, 0, 2, 0, 1, 0, 2, 2, 2, 1, 0, 1, 0, 0, 0);

    K8 : Trinary24A = (1, 2, 0, 0, 1, 0, 0, 1, 0, 2, 2, 1, 0, 0, 1, 0, 2, 1, 1, 1, 0, 0, 0, 0);

    K9 : Trinary24A = (2, 1, 1, 2, 2, 2, 1, 1, 0, 2, 2, 1, 1, 1, 2, 0, 0, 0, 0, 2, 0, 0, 0, 0);

    K10 : Trinary24A = (1, 2, 2, 0, 1, 2, 0, 1, 2, 2, 2, 1, 2, 2, 0, 2, 0, 0, 2, 0, 1, 0, 0, 0);

    K11 : Trinary24A = (1, 1, 0, 2, 2, 0, 1, 2, 2, 2, 0, 1, 1, 2, 1, 1, 2, 2, 2, 1, 0, 0, 0, 0);

    K12 : Trinary24A = (2, 0, 1, 2, 1, 2, 0, 0, 1, 0, 0, 2, 2, 0, 2, 2, 2, 1, 1, 1, 0, 0, 0, 0);

    K13 : Trinary24A = (2, 2, 2, 0, 2 ,2, 1, 0, 1, 1, 1, 2, 1, 1, 1, 2, 2, 2, 1, 0, 1, 0, 0, 0);

    K14 : Trinary24A = (1, 0, 1, 1, 0, 2, 2, 2, 0, 0, 1, 1, 2, 2, 1, 2, 1, 0, 1, 2, 0, 0, 0, 0);

    K15 : Trinary24A = (0, 1, 2, 0, 2, 1, 1, 1, 1, 2, 0, 2, 1, 1, 0, 2, 1, 0, 0, 1, 0, 0, 0, 0);

    K16 : Trinary24A = (0, 0, 1, 0, 1, 1, 1, 2, 1, 2 ,0, 2, 2, 0, 2, 2, 2, 1, 1, 0, 1, 0, 0, 0);

    K17 : Trinary24A = (1, 2, 0, 2, 0, 0, 2, 2, 1, 1, 2, 0, 0, 1, 2, 2, 2, 0, 2, 2, 0, 0, 0, 0);

    K18 : Trinary24A = (0, 1, 2, 0, 0, 2, 0, 2, 0, 1, 2, 0, 2, 1, 2, 2, 2, 1, 1, 0, 0, 0, 0, 0);

    K19 : Trinary24A = (1, 2, 1, 1, 1, 2, 2, 2, 2, 1, 1, 0, 1, 2, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0);

    K20 : Trinary24A = (1, 2, 1, 0, 2, 2, 1, 0, 0, 2, 2, 1, 2, 0, 1, 1, 2, 0, 0, 0, 1, 0, 0, 0);

    K21 : Trinary24A = (2, 0, 0, 1, 2, 0, 2, 0, 1, 2, 1, 1, 2, 2, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0);

    K22 : Trinary24A = (1, 2, 0, 0, 2, 1, 1, 1, 0, 1, 2, 2, 1, 2, 0, 1, 0, 1, 0, 0, 1, 0, 0, 0);

    K23 : Trinary24A = (2, 1, 1, 1, 1, 0, 1, 1, 1, 2, 2, 1, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, 0);

    K24 : Trinary24A = (0, 1, 2, 0, 2, 2, 1, 0, 0, 2, 2, 1, 1, 2, 1, 0, 1, 1, 1, 0, 0, 0, 0, 0);

    K25 : Trinary24A = (0, 1, 2, 1, 1, 2, 2, 1, 1, 0, 1, 2, 0, 2, 0, 0, 1, 1, 2, 2, 0, 0, 0, 0);

    K26 : Trinary24A = (2, 1, 2, 0, 1, 1, 2, 1, 2, 1, 1, 0, 1, 2, 0, 1, 2, 1, 1, 0, 1, 0, 0, 0);

    K27 : Trinary24A = (2, 2, 0, 1, 1, 0, 2, 1, 1, 1, 0, 1, 2, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0);

    K28 : Trinary24A = (1, 1, 2, 2, 0, 0, 2, 1, 1, 2, 2, 0, 2, 2, 1, 0, 0, 1, 1, 2, 0, 0, 0, 0);

    K29 : Trinary24A = (2, 2, 2, 2, 0, 2, 0, 0, 1, 0, 0, 0, 2, 0, 2, 1, 2, 2, 1, 0, 1, 0, 0, 0);

    K30 : Trinary24A = (1, 2, 2, 0, 1, 0, 1, 1, 2, 2, 2, 0, 1, 2, 2, 0, 1, 1, 1, 1, 0, 0, 0, 0);

    K31 : Trinary24A = (1, 1, 2, 2, 1, 1, 0, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 2, 0, 0, 0, 0);

    K32 : Trinary24A = (1, 1, 0, 0, 2, 0, 1, 0, 2, 0, 0, 0, 2, 2, 0, 2, 0, 0, 2, 0, 1, 0, 0, 0);

    K33 : Trinary24A = (2, 1, 1, 1, 2, 2, 1, 1, 1, 0, 2, 2, 0, 0, 1, 2, 1, 2, 2, 1, 0, 0, 0, 0);

    K34 : Trinary24A = (1, 0, 0, 0, 0, 2, 2, 0, 1, 0, 1, 1, 1, 1, 0, 2, 0, 2, 1, 1, 0, 0, 0, 0);

    K35 : Trinary24A = (1, 1, 1, 0, 2, 2, 0, 0, 0, 2, 2, 0, 2, 1, 2, 2, 2, 2, 1, 0, 1, 0, 0, 0);

    K36 : Trinary24A = (2, 1, 0, 0, 2, 0, 1, 1, 1, 0, 2, 2, 1, 2, 1, 0, 1, 0, 1, 2, 0, 0, 0, 0);

    K37 : Trinary24A = (1, 2, 0, 2, 0, 1, 0, 0, 2, 1, 1, 0, 1, 0, 2, 1, 2, 0, 0, 1, 0, 0, 0, 0);

    K38 : Trinary24A = (1, 2, 0, 2, 1, 2, 1, 1, 2, 0, 1, 0, 1, 1, 1, 0, 0, 2, 1, 0, 1, 0, 0, 0);

    K39 : Trinary24A = (0, 2, 1, 1, 0, 1, 2, 1, 2, 0, 1, 2, 0, 0, 0, 1, 2, 0, 2, 2, 0, 0, 0, 0);

    K40 : Trinary24A = (0, 0, 0, 0, 0, 1, 0, 2, 1, 1, 2, 2, 0, 1, 1, 2, 0, 2, 1, 0, 0, 0, 0, 0);

    K41 : Trinary24A = (0, 1, 1, 0, 2, 2, 0, 0, 1, 2, 0, 0, 0, 0, 1, 1, 1, 0, 1, 0, 1, 0, 0, 0);

    K42 : Trinary24A = (2, 1, 1, 0, 0, 2, 0, 0, 0, 2, 1, 0, 2, 2, 2, 2, 1, 0, 0, 0, 1, 0, 0, 0);

    K43 : Trinary24A = (0, 2, 2, 2, 0, 1, 0, 0, 2, 1, 0, 0, 2, 2, 0, 2, 1, 0, 0, 0, 0, 0, 0, 0);

    K44 : Trinary24A = (1, 2, 1, 0, 2, 1, 1, 0, 0, 0, 1, 2, 0, 0, 2, 2, 0, 1, 0, 0, 1, 0, 0, 0);

    K45 : Trinary24A = (0, 1, 0, 2, 2, 2, 0, 1, 1, 0, 0, 0, 1, 2, 2, 2, 2, 2, 0, 0, 1, 0, 0, 0);

    K46 : Trinary24A = (1, 0, 1, 2, 1, 2, 1, 1, 1, 0, 0, 2, 2, 2, 2, 0, 0, 1, 1, 0, 0, 0, 0, 0);

    K47 : Trinary24A = (0, 0, 1, 0, 2, 1, 1, 1, 1, 1, 1, 2, 1, 2, 2, 1, 1, 1, 2, 2, 0, 0, 0, 0);

    K48 : Trinary24A = (0, 2, 2, 2, 1, 0, 0, 1, 1, 2, 2, 2, 0, 1, 1, 0, 2, 1, 1, 0, 1, 0, 0, 0);

    K49 : Trinary24A = (2, 0, 0, 2, 0, 1, 0, 0, 0, 0, 1, 1, 2, 1, 1, 0, 2, 2, 2, 0, 0, 0, 0, 0);

    K50 : Trinary24A = (2, 0, 2, 1, 1, 2, 2, 2, 1, 1, 2, 1, 1, 2, 1, 2, 0, 1, 1, 2, 0, 0, 0, 0);

    K51 : Trinary24A = (1, 2, 1, 0, 1, 2, 2, 2, 2, 2, 2, 1, 2, 2, 0, 1, 2, 2, 1, 0, 1, 0, 0, 0);

    K52 : Trinary24A = (2, 0, 0, 0, 0, 2, 1, 2, 1, 2, 0, 2, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0);

    K53 : Trinary24A = (1, 0, 2, 0, 2, 1, 2, 2, 1, 2, 2, 2, 0, 2, 0, 2, 1, 0, 0, 2, 0, 0, 0, 0);

    K54 : Trinary24A = (2, 1, 1, 2, 0, 0, 2, 1, 1, 2, 0, 2, 0, 2, 0, 2, 0, 0, 2, 0, 1, 0, 0, 0);

    K55 : Trinary24A = (0, 0, 0, 1, 0, 1, 1, 0, 0, 1, 0, 0, 0, 1, 0, 0, 1, 2, 2, 1, 0, 0, 0, 0);

    K56 : Trinary24A = (1, 2, 0, 1, 1, 2, 1, 1, 0, 2, 2, 2, 2, 1, 1, 1, 1, 2, 1, 1, 0, 0, 0, 0);

    K57 : Trinary24A = (2, 1, 1, 2, 0, 0, 1, 0, 2, 0, 1, 0, 2, 1, 0, 0, 0, 0, 2, 0, 1, 0, 0, 0);

    K58 : Trinary24A = (2, 2, 1, 0, 0, 2, 2, 2, 1, 1, 2, 2, 0, 2, 1, 1, 0, 0, 1, 2, 0, 0, 0, 0);

    K59 : Trinary24A = (0, 1, 0, 0, 1, 1, 0, 1, 2, 1, 0, 1, 0, 2, 0, 1, 0, 1, 0, 1, 0, 0, 0, 0);

    K60 : Trinary24A = (1, 1, 1, 1, 0, 1, 1, 2, 1, 0, 2, 2, 1, 1, 0, 1, 0, 2, 1, 0, 1, 0, 0, 0);

    K61 : Trinary24A = (2, 1, 1, 2, 0, 2, 0, 0, 1, 2, 1, 2, 0, 2, 0, 2, 1, 0, 2, 2, 0, 0, 0, 0);

    K62 : Trinary24A = (0, 0, 1, 2, 0, 2, 1, 1, 0, 2, 1, 1, 2, 0, 0, 2, 1, 2, 1, 0, 0, 0, 0, 0);

    K63 : Trinary24A = (2, 0, 2, 0, 2, 2, 1, 0, 0, 2, 0, 1, 1, 0, 1, 2, 1, 0, 1, 0, 1, 0, 0, 0);

    baPadding : Array[0..63] Of Byte = (2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97,
        101, 103, 107, 109, 113, 127, 131, 137, 139, 149, 151, 157, 163, 167, 173, 179, 181, 191, 193, 197, 199,
        211, 223, 227, 229, 233, 239, 241, 251, 15, 25, 35, 55, 65, 85, 95, 115, 145, 155);

Procedure Usage();
Begin
    WriteLn('Usage: TrinaryHash YouWantToHash.File');
End;

Procedure Trinary(Var baTrinary : Trinary24A;
                  lNumeric : Int64);
Var
    i : Int64;

Begin
    baTrinary[0] := 0; baTrinary[1] := 0; baTrinary[2] := 0; baTrinary[3] := 0; baTrinary[4] := 0; baTrinary[5] := 0; baTrinary[6] := 0; baTrinary[7] := 0;

    baTrinary[8] := 0; baTrinary[9] := 0; baTrinary[10] := 0; baTrinary[11] := 0; baTrinary[12] := 0; baTrinary[13] := 0; baTrinary[14] := 0; baTrinary[15] := 0;

    baTrinary[16] := 0; baTrinary[17] := 0; baTrinary[18] := 0; baTrinary[19] := 0; baTrinary[20] := 0; baTrinary[21] := 0; baTrinary[22] := 0; baTrinary[23] := 0;

    If lNumeric <> 0 Then
    Begin
        For i := 23 DownTo 0 Do
        Begin
            baTrinary[i] := lNumeric Mod 3;

            lNumeric := lNumeric Div 3;
        End;
    End;
End;

(*
 0 0 0
 0 1 1
 0 1 2
*)

Procedure TrinaryAnd(Var W : Trinary24A;
                     Var X : Trinary24A;
                     Var Y : Trinary24A);
Var
    i : Int64;

Begin
    For i := 0 To 23 Do
    Begin
        If (X[i] = 0) And (Y[i] = 0) Then
        Begin
            W[i] := 0;
        End

        Else If (X[i] = 0) And (Y[i] = 1) Then
        Begin
            W[i] := 0;
        End

        Else If (X[i] = 0) And (Y[i] = 2) Then
        Begin
            W[i] := 0;
        End

        Else If (X[i] = 1) And (Y[i] = 0) Then
        Begin
            W[i] := 0;
        End

        Else If (X[i] = 1) And (Y[i] = 1) Then
        Begin
            W[i] := 1;
        End

        Else If (X[i] = 1) And (Y[i] = 2) Then
        Begin
            W[i] := 1;
        End

        Else If (X[i] = 2) And (Y[i] = 0) Then
        Begin
            W[i] := 0;
        End

        Else If (X[i] = 2) And (Y[i] = 1) Then
        Begin
            W[i] := 1;
        End

        Else If (X[i] = 2) And (Y[i] = 2) Then
        Begin
            W[i] := 2;
        End;
    End;
End;

(*
 0 1 2
 1 1 2
 2 2 2
*)

Procedure TrinaryOr(Var W : Trinary24A;
                    Var X : Trinary24A;
                    Var Y : Trinary24A);
Var
    j : Int64;

Begin
    For j := 0 To 23 Do
    Begin
        If (X[j] = 0) And (Y[j] = 0) Then
        Begin
            W[j] := 0;
        End

        Else If (X[j] = 0) And (Y[j] = 1) Then
        Begin
            W[j] := 1;
        End

        Else If (X[j] = 0) And (Y[j] = 2) Then
        Begin
            W[j] := 2;
        End

        Else If (X[j] = 1) And (Y[j] = 0) Then
        Begin
            W[j] := 1;
        End

        Else If (X[j] = 1) And (Y[j] = 1) Then
        Begin
            W[j] := 1;
        End

        Else If (X[j] = 1) And (Y[j] = 2) Then
        Begin
            W[j] := 2;
        End

        Else If (X[j] = 2) And (Y[j] = 0) Then
        Begin
            W[j] := 2;
        End

        Else If (X[j] = 2) And (Y[j] = 1) Then
        Begin
            W[j] := 2;
        End

        Else If (X[j] = 2) And (Y[j] = 2) Then
        Begin
            W[j] := 2;
        End;
    End;
End;

(*
 0 0 2
 1 1 1
 2 2 0
*)

Procedure TrinaryXOr(Var W : Trinary24A;
                     Var X : Trinary24A;
                     Var Y : Trinary24A);
Var
    k : Int64;

Begin
    For k := 0 To 23 Do
    Begin
        If (X[k] = 0) And (Y[k] = 0) Then
        Begin
            W[k] := 0;
        End

        Else If (X[k] = 0) And (Y[k] = 1) Then
        Begin
            W[k] := 0;
        End

        Else If (X[k] = 0) And (Y[k] = 2) Then
        Begin
            W[k] := 2;
        End

        Else If (X[k] = 1) And (Y[k] = 0) Then
        Begin
            W[k] := 1;
        End

        Else If (X[k] = 1) And (Y[k] = 1) Then
        Begin
            W[k] := 1;
        End

        Else If (X[k] = 1) And (Y[k] = 2) Then
        Begin
            W[k] := 1;
        End

        Else If (X[k] = 2) And (Y[k] = 0) Then
        Begin
            W[k] := 2;
        End

        Else If (X[k] = 2) And (Y[k] = 1) Then
        Begin
            W[k] := 2;
        End

        Else If (X[k] = 2) And (Y[k] = 2) Then
        Begin
            W[k] := 0;
        End;
    End;
End;

(*
 2 0 0
 1 1 1
 0 2 2
*)

Procedure TrinaryXAnd(Var W : Trinary24A;
                      Var X : Trinary24A;
                      Var Y : Trinary24A);
Var
    l : Int64;

Begin
    For l := 0 To 23 Do
    Begin
        If (X[l] = 0) And (Y[l] = 0) Then
        Begin
            W[l] := 2;
        End

        Else If (X[l] = 0) And (Y[l] = 1) Then
        Begin
            W[l] := 0;
        End

        Else If (X[l] = 0) And (Y[l] = 2) Then
        Begin
            W[l] := 0;
        End

        Else If (X[l] = 1) And (Y[l] = 0) Then
        Begin
            W[l] := 1;
        End

        Else If (X[l] = 1) And (Y[l] = 1) Then
        Begin
            W[l] := 1;
        End

        Else If (X[l] = 1) And (Y[l] = 2) Then
        Begin
            W[l] := 1;
        End

        Else If (X[l] = 2) And (Y[l] = 0) Then
        Begin
            W[l] := 0;
        End

        Else If (X[l] = 2) And (Y[l] = 1) Then
        Begin
            W[l] := 2;
        End

        Else If (X[l] = 2) And (Y[l] = 2) Then
        Begin
            W[l] := 2;
        End;
    End;
End;

(*
 0 1 2
 1 2 0
 2 0 1
*)

Procedure TrinaryAdd(Var W : Trinary24A;
                     Var X : Trinary24A;
                     Var Y : Trinary24A);
Var
    i : Int64;

Begin
    For i := 0 To 23 Do
    Begin
        If (X[i] = 0) And (Y[i] = 0) Then
        Begin
            W[i] := 0;
        End

        Else If (X[i] = 0) And (Y[i] = 1) Then
        Begin
            W[i] := 1;
        End

        Else If (X[i] = 0) And (Y[i] = 2) Then
        Begin
            W[i] := 2;
        End

        Else If (X[i] = 1) And (Y[i] = 0) Then
        Begin
            W[i] := 1;
        End

        Else If (X[i] = 1) And (Y[i] = 1) Then
        Begin
            W[i] := 2;
        End

        Else If (X[i] = 1) And (Y[i] = 2) Then
        Begin
            W[i] := 0;
        End

        Else If (X[i] = 2) And (Y[i] = 0) Then
        Begin
            W[i] := 2;
        End

        Else If (X[i] = 2) And (Y[i] = 1) Then
        Begin
            W[i] := 0;
        End

        Else If (X[i] = 2) And (Y[i] = 2) Then
        Begin
            W[i] := 1;
        End;
    End;
End;

(*
 0 2 1
 1 0 2
 2 1 0
*)

Procedure TrinarySubtract(Var W : Trinary24A;
                          Var X : Trinary24A;
                          Var Y : Trinary24A);
Var
    j : Int64;

Begin
    For j := 0 To 23 Do
    Begin
        If (X[j] = 0) And (Y[j] = 0) Then
        Begin
            W[j] := 0;
        End

        Else If (X[j] = 0) And (Y[j] = 1) Then
        Begin
            W[j] := 2;
        End

        Else If (X[j] = 0) And (Y[j] = 2) Then
        Begin
            W[j] := 1;
        End

        Else If (X[j] = 1) And (Y[j] = 0) Then
        Begin
            W[j] := 1;
        End

        Else If (X[j] = 1) And (Y[j] = 1) Then
        Begin
            W[j] := 0;
        End

        Else If (X[j] = 1) And (Y[j] = 2) Then
        Begin
            W[j] := 2;
        End

        Else If (X[j] = 2) And (Y[j] = 0) Then
        Begin
            W[j] := 2;
        End

        Else If (X[j] = 2) And (Y[j] = 1) Then
        Begin
            W[j] := 1;
        End

        Else If (X[j] = 2) And (Y[j] = 2) Then
        Begin
            W[j] := 0;
        End;
    End;
End;

(*
 0 0 0
 0 1 2
 0 2 1
*)

Procedure TrinaryMultiply(Var W : Trinary24A;
                          Var X : Trinary24A;
                          Var Y : Trinary24A);
Var
    k : Int64;

Begin
    For k := 0 To 23 Do
    Begin
        If (X[k] = 0) And (Y[k] = 0) Then
        Begin
            W[k] := 0;
        End

        Else If (X[k] = 0) And (Y[k] = 1) Then
        Begin
            W[k] := 0;
        End

        Else If (X[k] = 0) And (Y[k] = 2) Then
        Begin
            W[k] := 0;
        End

        Else If (X[k] = 1) And (Y[k] = 0) Then
        Begin
            W[k] := 0;
        End

        Else If (X[k] = 1) And (Y[k] = 1) Then
        Begin
            W[k] := 1;
        End

        Else If (X[k] = 1) And (Y[k] = 2) Then
        Begin
            W[k] := 2;
        End

        Else If (X[k] = 2) And (Y[k] = 0) Then
        Begin
            W[k] := 0;
        End

        Else If (X[k] = 2) And (Y[k] = 1) Then
        Begin
            W[k] := 2;
        End

        Else If (X[k] = 2) And (Y[k] = 2) Then
        Begin
            W[k] := 1;
        End;
    End;
End;

(*
 0 0 0
 0 1 0
 0 2 1
*)

Procedure TrinaryDivide(Var W : Trinary24A;
                        Var X : Trinary24A;
                        Var Y : Trinary24A);
Var
    l : Int64;

Begin
    For l := 0 To 23 Do
    Begin
        If (X[l] = 0) And (Y[l] = 0) Then
        Begin
            W[l] := 0;
        End

        Else If (X[l] = 0) And (Y[l] = 1) Then
        Begin
            W[l] := 0;
        End

        Else If (X[l] = 0) And (Y[l] = 2) Then
        Begin
            W[l] := 0;
        End

        Else If (X[l] = 1) And (Y[l] = 0) Then
        Begin
            W[l] := 0;
        End

        Else If (X[l] = 1) And (Y[l] = 1) Then
        Begin
            W[l] := 1;
        End

        Else If (X[l] = 1) And (Y[l] = 2) Then
        Begin
            W[l] := 0;
        End

        Else If (X[l] = 2) And (Y[l] = 0) Then
        Begin
            W[l] := 0;
        End

        Else If (X[l] = 2) And (Y[l] = 1) Then
        Begin
            W[l] := 2;
        End

        Else If (X[l] = 2) And (Y[l] = 2) Then
        Begin
            W[l] := 1;
        End;
    End;
End;

Procedure F(Var W : Trinary24A;
            Var X : Trinary24A;
            Var Y : Trinary24A;
            Var Z : Trinary24A);
Begin
    TrinaryAnd(W, X, Y);

    TrinaryOr(W, W, Z);
End;

Procedure G(Var W : Trinary24A;
            Var X : Trinary24A;
            Var Y : Trinary24A;
            Var Z : Trinary24A);
Begin
    TrinaryAdd(W, Y, Z);

    TrinaryMultiply(W, W, X);
End;

Procedure H(Var W : Trinary24A;
            Var X : Trinary24A;
            Var Y : Trinary24A;
            Var Z : Trinary24A);
Begin
    TrinaryXOr(W, Z, X);

    TrinaryXAnd(W, W, Y);
End;

Procedure I(Var w : Trinary24A;
             Var x : Trinary24A;
             Var y : Trinary24A;
             Var z : Trinary24A);
Begin
    TrinarySubtract(W, X, Y);

    TrinaryDivide(W, W, Z);
End;

Procedure Add(Var W : Trinary24A;
              Var Z : Trinary24A);
Var
    i : Int64;

    bCarry : Byte;

Begin
    bCarry := 0;

    For i := 0 To 23 Do
    Begin
        W[i] := W[i] + Z[i] + bCarry;

        If W[i] > 2 Then
        Begin
            W[i] := W[i] - 3;

            If bCarry = 0 Then
            Begin
                bCarry := 1;
            End;
        End

        Else
        Begin
            bCarry := 0;
        End;
    End;
End;

Procedure RotateShiftLeft(Var W : Trinary24A;
                          bBit: Byte);
Var
    baSwap : Trinary24A;

    i, j, k : Int64;

Begin
    For i := 23 DownTo 0 Do
    Begin
        If i >= bBit Then j := i - bBit Else j := 24 - bBit + i;

        baSwap[i] := W[j];
    End;

    For k := 0 To 23 Do
    Begin
        W[k] := baSwap[k];
    End;
End;

Procedure FF(Var A : Trinary24A;
             Var B : Trinary24A;
             Var C : Trinary24A;
             Var D : Trinary24A;
             Var E : Trinary24A;
             bShift : Byte;
             Var K : Trinary24A);
Var
    baTemp : Trinary24A;

    i : Int64;

Begin
    F(baTemp, B, C, D);

    Add(baTemp, A);

    Add(baTemp, E);

    Add(baTemp, K);

    RotateShiftLeft(baTemp, bShift);

    Add(baTemp, B);

    For i := 0 To 23 Do
    Begin
        A[i] := baTemp[i];
    End;
End;

Procedure GG(Var A : Trinary24A;
             Var B : Trinary24A;
             Var C : Trinary24A;
             Var D : Trinary24A;
             Var E : Trinary24A;
             bShift : Byte;
             Var K : Trinary24A);
Var
    baTemp : Trinary24A;

    j : Int64;

Begin
    G(baTemp, C, D, A);

    Add(baTemp, B);

    Add(baTemp, E);

    Add(baTemp, K);

    RotateShiftLeft(baTemp, bShift);

    Add(baTemp, C);

    for j := 0 To 23 Do
    Begin
        B[j] := baTemp[j];
    End;
End;

Procedure HH(Var A : Trinary24A;
             Var B : Trinary24A;
             Var C : Trinary24A;
             Var D : Trinary24A;
             Var E : Trinary24A;
             bShift : Byte;
             Var K : Trinary24A);
Var
    baTemp : Trinary24A;

    kk : Int64;

Begin
    H(baTemp, D, A, B);

    Add(baTemp, c);

    Add(baTemp, E);

    Add(baTemp, K);

    RotateShiftLeft(baTemp, bShift);

    Add(baTemp, D);

    For kk := 0 To 23 Do
    Begin
        C[kk] := baTemp[kk];
    End;
End;

Procedure II(Var A : Trinary24A;
             Var B : Trinary24A;
             Var C : Trinary24A;
             Var D : Trinary24A;
             Var E : Trinary24A;
             bShift : Byte;
             Var K : Trinary24A);
Var
    baTemp : Trinary24A;

    l : Int64;

Begin
    I(baTemp, A, B, C);

    Add(baTemp, D);

    Add(baTemp, E);

    Add(baTemp, K);

    RotateShiftLeft(baTemp, bShift);

    Add(baTemp, A);

    For l := 0 To 23 Do
    Begin
        D[l] := baTemp[l];
    End;
End;

Procedure TrinaryHash(Var A : Trinary24A;
                      Var B : Trinary24A;
                      Var C : Trinary24A;
                      Var D : Trinary24A;
                      Var E : Array Of Trinary24A);
Begin
    FF(A, B, C, D, E[ 0], Shift11, K0);

    FF(B, C, D, A, E[ 1], Shift12, K1);

    FF(C, D, A, B, E[ 2], Shift13, K2);

    FF(D, A, B, C, E[ 3], Shift14, K3);

    FF(A, B, C, D, E[ 4], Shift11, K4);

    FF(B, C, D, A, E[ 5], Shift12, K5);

    FF(C, D, A, B, E[ 6], Shift13, K6);

    FF(D, A, B, C, E[ 7], Shift14, K7);

    FF(A, B, C, D, E[ 8], Shift11, K8);

    FF(B, C, D, A, E[ 9], Shift12, K9);

    FF(C, D, A, B, E[10], Shift13, K10);

    FF(D, A, B, C, E[11], Shift14, K11);

    FF(A, B, C, D, E[12], Shift11, K12);

    FF(B, C, D, A, E[13], Shift12, K13);

    FF(C, D, A, B, E[14], Shift13, K14);

    FF(D, A, B, C, E[15], Shift14, K15);

    GG(A, B, C, D, E[ 1], Shift21, K16);

    GG(D, A, B, C, E[ 6], Shift22, K17);

    GG(C, D, A, B, E[11], Shift23, K18);

    GG(B, C, D, A, E[ 0], Shift24, K19);

    GG(A, B, C, D, E[ 5], Shift21, K20);

    GG(D, A, B, C, E[10], Shift22, K21);

    GG(C, D, A, B, E[15], Shift23, K22);

    GG(B, C, D, A, E[ 4], Shift24, K23);

    GG(A, B, C, D, E[ 9], Shift21, K24);

    GG(D, A, B, C, E[14], Shift22, K25);

    GG(C, D, A, B, E[ 3], Shift23, K26);

    GG(B, C, D, A, E[ 8], Shift24, K27);

    GG(A, B, C, D, E[13], Shift21, K28);

    GG(D, A, B, C, E[ 2], Shift22, K29);

    GG(C, D, A, B, E[ 7], Shift23, K30);

    GG(B, C, D, A, E[12], Shift24, K31);

    HH(A, B, C, D, E[ 5], Shift31, K32);

    HH(B, C, D, A, E[ 8], Shift32, K33);

    HH(C, D, A, B, E[11], Shift33, K34);

    HH(D, A, B, C, E[14], Shift34, K35);

    HH(A, B, C, D, E[ 1], Shift31, K36);

    HH(B, C, D, A, E[ 4], Shift32, K37);

    HH(C, D, A, B, E[ 7], Shift33, K38);

    HH(D, A, B, C, E[10], Shift34, K39);

    HH(A, B, C, D, E[13], Shift31, K40);

    HH(B, C, D, A, E[ 0], Shift32, K41);

    HH(C, D, A, B, E[ 3], Shift33, K42);

    HH(D, A, B, C, E[ 6], Shift34, K43);

    HH(A, B, C, D, E[ 9], Shift31, K44);

    HH(B, C, D, A, E[12], Shift32, K45);

    HH(C, D, A, B, E[15], Shift33, K46);

    HH(D, A, B, C, E[ 2], Shift34, K47);

    II(A, B, C, D, E[ 0], Shift41, K48);

    II(D, A, B, C, E[ 7], Shift42, K49);

    II(C, D, A, B, E[14], Shift43, K50);

    II(B, C, D, A, E[ 5], Shift44, K51);

    II(A, B, C, D, E[12], Shift41, K52);

    II(D, A, B, C, E[ 3], Shift42, K53);

    II(C, D, A, B, E[10], Shift43, K54);

    II(B, C, D, A, E[ 1], Shift44, K55);

    II(A, B, C, D, E[ 8], Shift41, K56);

    II(D, A, B, C, E[15], Shift42, K57);

    II(C, D, A, B, E[ 6], Shift43, K58);

    II(B, C, D, A, E[13], Shift44, K59);

    II(A, B, C, D, E[ 4], Shift41, K60);

    II(D, A, B, C, E[11], Shift42, K61);

    II(C, D, A, B, E[ 2], Shift43, K62);

    II(B, C, D, A, E[ 9], Shift44, K63);
End;

Var
    baMessageDigest0 : Trinary24A = (1, 2, 1, 0, 0, 0, 2, 1, 2, 1, 0, 0, 0, 1, 0, 0, 1, 0, 1, 0, 1, 1, 1, 0);

    baMessageDigest1 : Trinary24A = (2, 2, 1, 2, 1, 0, 0, 2, 2, 0, 2, 0, 1, 1, 0, 2, 2, 0, 2, 0, 1, 0, 0, 1);

    baMessageDigest2 : Trinary24A = (2, 1, 2, 2, 2, 0, 1, 2, 1, 1, 2, 0, 0, 0, 1, 0, 2, 0, 2, 0, 0, 2, 1, 0);

    baMessageDigest3 : Trinary24A = (1, 1, 2, 0, 1, 0, 0, 2, 1, 2, 0, 0, 2, 2, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0);

    fdData : File;

    i1, j, k, l, lFileSize, lBytesLeft : Int64;

    bpData : PByte;

    baTrinary : Array[0..15, 0..23] Of Byte;

Begin
    If ParamCount <> 1 Then
    Begin
        Usage();
    End

    Else
    Begin
        Assign(fdData, ParamStr(1));

        Reset(fdData, 1);

        lFileSize := FileSize(fdData);

        If lFileSize = 0 Then
        Begin
            WriteLn('There is no data in file [', ParamStr(1), '], 0 byte.');

            Halt(-1);
        End;

        lBytesLeft := lFileSize And 63;

        If lBytesLeft = 0 Then
        Begin
            lBytesLeft := lFileSize + 64;
        End

        Else If lBytesLeft < 54 Then
        Begin
            lBytesLeft := lFileSize - lBytesLeft + 64;
        End

        Else If lBytesLeft > 53 Then
        Begin
            lBytesLeft := lFileSize - lBytesLeft + 128;
        End;

        bpData := GetMem(lBytesLeft);

        BlockRead(fdData, bpData^, lFileSize);

        Close(fdData);

        For i1 := 0 To 4 Do
        Begin
            bpData[i1 + lFileSize] := lFileSize Shr (8 * i1);
        End;

        k := 0;

        For j := lFileSize + 5 To lBytesLeft - 6 Do
        Begin
            bpData[j] := baPadding[k];

            k := k + 1;
        End;

        For l := 4 DownTo 0 Do
        Begin
            bpData[lBytesLeft - l - 1] := lFileSize Shr (8 * l);
        End;

        i1 := 0;

        While i1 < lBytesLeft Do
        Begin
            For j := 0 To 15 Do
            Begin
                Trinary(baTrinary[j], bpData[i1 + 4 * j] + (bpData[i1 + 4 * j + 1] << 8) + (bpData[i1 + 4 * j + 2] << 16) + (bpData[i1 + 4 * j + 3] << 24));
            End;

            TrinaryHash(baMessageDigest0, baMessageDigest1, baMessageDigest2, baMessageDigest3, baTrinary);

            i1 := i1 + 64;
        End;

        For k := 0 To 23 Do
        Begin
            Write(baMessageDigest0[k], baMessageDigest1[k], baMessageDigest2[k], baMessageDigest3[k]);
        End;

        WriteLn();

        FreeMem(bpData);
    End;
End.