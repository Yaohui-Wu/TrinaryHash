#!/usr/bin/env python3
# -*- coding: utf-8 -*-

#*************************************************************
# 作者：伍耀晖               Author: Geek.Zhiyuan            *
# 开源日期：2022年6月13日    Open Source Date: 2022-6-13     *
# 国家城市：中国广州         City, Country: GuangZhou, China *
#*************************************************************

import os, sys

def Usage():
    print("Usage: python TrinaryHash.py YouWantToHash.File")

def Trinary(lTrinary, iNumeric):
    lTrinary[0] = lTrinary[1] = lTrinary[2] = lTrinary[3] = lTrinary[4] = lTrinary[5] = lTrinary[6] = lTrinary[7] = 0

    lTrinary[8] = lTrinary[9] = lTrinary[10] = lTrinary[11] = lTrinary[12] = lTrinary[13] = lTrinary[14] = lTrinary[15] = 0

    lTrinary[16] = lTrinary[17] = lTrinary[18] = lTrinary[19] = lTrinary[20] = lTrinary[21] = lTrinary[22] = lTrinary[23] = 0

    if iNumeric != 0:
        for i in range(23, -1, -1):
            iNumeric, lTrinary[i] = divmod(iNumeric, 3)

# 0 0 0
# 0 1 1
# 0 1 2

def TrinaryAnd(W, X, Y):
    for i in range(24):
        if X[i] == Y[i] == 0: W[i] = 0

        elif X[i] == 0 and Y[i] == 1: W[i] = 0

        elif X[i] == 0 and Y[i] == 2: W[i] = 0

        elif X[i] == 1 and Y[i] == 0: W[i] = 0

        elif X[i] == Y[i] == 1: W[i] = 1

        elif X[i] == 1 and Y[i] == 2: W[i] = 1

        elif X[i] == 2 and Y[i] == 0: W[i] = 0

        elif X[i] == 2 and Y[i] == 1: W[i] = 1

        elif X[i] == Y[i] == 2: W[i] = 2

# 0 1 2
# 1 1 2
# 2 2 2

def TrinaryOr(W, X, Y):
    for j in range(24):
        if X[j] == Y[j] == 0: W[j] = 0

        elif X[j] == 0 and Y[j] == 1: W[j] = 1

        elif X[j] == 0 and Y[j] == 2: W[j] = 2

        elif X[j] == 1 and Y[j] == 0: W[j] = 1

        elif X[j] == Y[j] == 1: W[j] = 1

        elif X[j] == 1 and Y[j] == 2: W[j] = 2

        elif X[j] == 2 and Y[j] == 0: W[j] = 2

        elif X[j] == 2 and Y[j] == 1: W[j] = 2

        elif X[j] == Y[j] == 2: W[j] = 2

# 0 0 2
# 1 1 1
# 2 2 0

def TrinaryXOr(W, X, Y):
    for k in range(24):
       if X[k] == Y[k] == 0: W[k] = 0

       elif X[k] == 0 and Y[k] == 1: W[k] = 0

       elif X[k] == 0 and Y[k] == 2: W[k] = 2

       elif X[k] == 1 and Y[k] == 0: W[k] = 1

       elif X[k] == Y[k] == 1: W[k] = 1

       elif X[k] == 1 and Y[k] == 2: W[k] = 1

       elif X[k] == 2 and Y[k] == 0: W[k] = 2

       elif X[k] == 2 and Y[k] == 1: W[k] = 2

       elif X[k] == Y[k] == 2: W[k] = 0

# 2 0 0
# 1 1 1
# 0 2 2

def TrinaryXAnd(W, X, Y):
    for i in range(24):
       if X[i] == Y[i] == 0: W[i] = 2

       elif X[i] == 0 and Y[i] == 1: W[i] = 0

       elif X[i] == 0 and Y[i] == 2: W[i] = 0

       elif X[i] == 1 and Y[i] == 0: W[i] = 1

       elif X[i] == Y[i] == 1: W[i] = 1

       elif X[i] == 1 and Y[i] == 2: W[i] = 1

       elif X[i] == 2 and Y[i] == 0: W[i] = 0

       elif X[i] == 2 and Y[i] == 1: W[i] = 2

       elif X[i] == Y[i] == 2: W[i] = 2

# 0 1 2
# 1 2 0
# 2 0 1

def TrinaryAdd(W, X, Y):
    for j in range(24):
        if X[j] == Y[j] == 0: W[j] = 0

        elif X[j] == 0 and Y[j] == 1: W[j] = 1

        elif X[j] == 0 and Y[j] == 2: W[j] = 2

        elif X[j] == 1 and Y[j] == 0: W[j] = 1

        elif X[j] == Y[j] == 1: W[j] = 2

        elif X[j] == 1 and Y[j] == 2: W[j] = 0

        elif X[j] == 2 and Y[j] == 0: W[j] = 2

        elif X[j] == 2 and Y[j] == 1: W[j] = 0

        elif X[j] == Y[j] == 2: W[j] = 1

# 0 2 1
# 1 0 2
# 2 1 0

def TrinarySubtract(W, X, Y):
    for j in range(24):
        if X[j] == Y[j] == 0: W[j] = 0

        elif X[j] == 0 and Y[j] == 1: W[j] = 2

        elif X[j] == 0 and Y[j] == 2: W[j] = 1

        elif X[j] == 1 and Y[j] == 0: W[j] = 1

        elif X[j] == Y[j] == 1: W[j] = 0

        elif X[j] == 1 and Y[j] == 2: W[j] = 2

        elif X[j] == 2 and Y[j] == 0: W[j] = 2

        elif X[j] == 2 and Y[j] == 1: W[j] = 1

        elif X[j] == Y[j] == 2: W[j] = 0

# 0 0 0
# 0 1 2
# 0 2 1

def TrinaryMultiply(W, X, Y):
    for k in range(24):
        if X[k] == Y[k] == 0: W[k] = 0

        elif X[k] == 0 and Y[k] == 1: W[k] = 0

        elif X[k] == 0 and Y[k] == 2: W[k] = 0

        elif X[k] == 1 and Y[k] == 0: W[k] = 0

        elif X[k] == Y[k] == 1: W[k] = 1

        elif X[k] == 1 and Y[k] == 2: W[k] = 2

        elif X[k] == 2 and Y[k] == 0: W[k] = 0

        elif X[k] == 2 and Y[k] == 1: W[k] = 2

        elif X[k] == Y[k] == 2: W[k] = 1

# 0 0 0
# 0 1 0
# 0 2 1

def TrinaryDivide(W, X, Y):
    for l in range(24):
        if X[l] == Y[l] == 0: W[l] = 0

        elif X[l] == 0 and Y[l] == 1: W[l] = 0

        elif X[l] == 0 and Y[l] == 2: W[l] = 0

        elif X[l] == 1 and Y[l] == 0: W[l] = 0

        elif X[l] == Y[l] == 1: W[l] = 1

        elif X[l] == 1 and Y[l] == 2: W[l] = 0

        elif X[l] == 2 and Y[l] == 0: W[l] = 0

        elif X[l] == 2 and Y[l] == 1: W[l] = 2

        elif X[l] == Y[l] == 2: W[l] = 1

def F(W, X, Y, Z):
    TrinaryAnd(W, X, Y)

    TrinaryOr(W, W, Z)

def G(W, X, Y, Z):
    TrinaryAdd(W, Y, Z)

    TrinaryMultiply(W, W, X)

def H(W, X, Y, Z):
    TrinaryXOr(W, Z, X)

    TrinaryXAnd(W, W, Y)

def I(W, X, Y, Z):
    TrinarySubtract(W, X, Y)

    TrinaryDivide(W, W, Z)

def Add(W, Z):
    iCarry = 0

    for i in range(24):
        W[i] += Z[i] + iCarry

        if W[i] > 2:
            W[i] -= 3

            if iCarry == 0:
                iCarry = 1
        else:
            iCarry = 0

def RotateShiftLeft(W, iBit):
    lSwap = [0] * 24

    for j in range(23, -1, -1):
        lSwap[j] = W[j - iBit if j >= iBit else 24 - iBit + j]

    for k in range(24):
        W[k] = lSwap[k]

def FF(A, B, C, D, E, iShift, K):
    lTemp = [0] * 24

    F(lTemp, B, C, D)

    Add(lTemp, A)

    Add(lTemp, E)

    Add(lTemp, K)

    RotateShiftLeft(lTemp, iShift)

    Add(lTemp, B)

    for i in range(24):
        A[i] = lTemp[i]

def GG(A, B, C, D, E, iShift, K):
    lTemp = [0] * 24

    G(lTemp, C, D, A)

    Add(lTemp, B)

    Add(lTemp, E)

    Add(lTemp, K)

    RotateShiftLeft(lTemp, iShift)

    Add(lTemp, C)

    for j in range(24):
        B[j] = lTemp[j]

def HH(A, B, C, D, E, iShift, K):
    lTemp = [0] * 24

    H(lTemp, D, A, B)

    Add(lTemp, C)

    Add(lTemp, E)

    Add(lTemp, K)

    RotateShiftLeft(lTemp, iShift)

    Add(lTemp, D)

    for k in range(24):
        C[k] = lTemp[k]

def II(A, B, C, D, E, iShift, K):
    lTemp = [0] * 24

    I(lTemp, A, B, C)

    Add(lTemp, D)

    Add(lTemp, E)

    Add(lTemp, K)

    RotateShiftLeft(lTemp, iShift)

    Add(lTemp, A)

    for l in range(24):
        D[l] = lTemp[l]

def TrinaryHash(A, B, C, D, E):
    iShift11, iShift12, iShift13, iShift14, iShift21, iShift22, iShift23, iShift24 = 2, 22, 3, 21, 5, 15, 7, 14

    iShift31, iShift32, iShift33, iShift34, iShift41, iShift42, iShift43, iShift44 = 11, 12, 13, 10, 17, 6, 19, 4

    K0 = (2, 1, 1, 1, 2, 2, 0, 1, 2, 2, 1, 1, 2, 1, 2, 2, 2, 0, 0, 0, 1, 0, 0, 0)

    K1 = (1, 1, 2, 0, 0, 1, 0, 0, 0, 1, 0, 2, 1, 1, 0, 2, 0, 0, 1, 0, 1, 0, 0, 0)

    K2 = (0, 0, 2, 2, 1, 2, 0, 0, 1, 1, 1, 1, 0, 2, 0, 0, 2, 1, 1, 0, 0, 0, 0, 0)

    K3 = (1, 1, 1, 0, 1, 0, 0, 2, 1, 1, 2, 0, 2, 1, 1, 1, 0, 1, 2, 2, 0, 0, 0, 0)

    K4 = (1, 2, 1, 1, 2, 0, 1, 2, 2, 2, 0, 2, 0, 0, 0, 2, 2, 1, 1, 0, 1, 0, 0, 0)

    K5 = (2, 1, 0, 2, 1, 2, 1, 0, 1, 1, 1, 0, 2, 2, 1, 2, 0, 0, 0, 1, 0, 0, 0, 0)

    K6 = (2, 0, 0, 1, 0, 0, 1, 0, 0, 1, 2, 1, 2, 2, 1, 1, 2, 0, 1, 2, 0, 0, 0, 0)

    K7 = (2, 2, 1, 0, 0, 2, 1, 1, 2, 1, 0, 2, 0, 1, 0, 2, 2, 2, 1, 0, 1, 0, 0, 0)

    K8 = (1, 2, 0, 0, 1, 0, 0, 1, 0, 2, 2, 1, 0, 0, 1, 0, 2, 1, 1, 1, 0, 0, 0, 0)

    K9 = (2, 1, 1, 2, 2, 2, 1, 1, 0, 2, 2, 1, 1, 1, 2, 0, 0, 0, 0, 2, 0, 0, 0, 0)

    K10 = (1, 2, 2, 0, 1, 2, 0, 1, 2, 2, 2, 1, 2, 2, 0, 2, 0, 0, 2, 0, 1, 0, 0, 0)

    K11 = (1, 1, 0, 2, 2, 0, 1, 2, 2, 2, 0, 1, 1, 2, 1, 1, 2, 2, 2, 1, 0, 0, 0, 0)

    K12 = (2, 0, 1, 2, 1, 2, 0, 0, 1, 0, 0, 2, 2, 0, 2, 2, 2, 1, 1, 1, 0, 0, 0, 0)

    K13 = (2, 2, 2, 0, 2 ,2, 1, 0, 1, 1, 1, 2, 1, 1, 1, 2, 2, 2, 1, 0, 1, 0, 0, 0)

    K14 = (1, 0, 1, 1, 0, 2, 2, 2, 0, 0, 1, 1, 2, 2, 1, 2, 1, 0, 1, 2, 0, 0, 0, 0)

    K15 = (0, 1, 2, 0, 2, 1, 1, 1, 1, 2, 0, 2, 1, 1, 0, 2, 1, 0, 0, 1, 0, 0, 0, 0)

    K16 = (0, 0, 1, 0, 1, 1, 1, 2, 1, 2 ,0, 2, 2, 0, 2, 2, 2, 1, 1, 0, 1, 0, 0, 0)

    K17 = (1, 2, 0, 2, 0, 0, 2, 2, 1, 1, 2, 0, 0, 1, 2, 2, 2, 0, 2, 2, 0, 0, 0, 0)

    K18 = (0, 1, 2, 0, 0, 2, 0, 2, 0, 1, 2, 0, 2, 1, 2, 2, 2, 1, 1, 0, 0, 0, 0, 0)

    K19 = (1, 2, 1, 1, 1, 2, 2, 2, 2, 1, 1, 0, 1, 2, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0)

    K20 = (1, 2, 1, 0, 2, 2, 1, 0, 0, 2, 2, 1, 2, 0, 1, 1, 2, 0, 0, 0, 1, 0, 0, 0)

    K21 = (2, 0, 0, 1, 2, 0, 2, 0, 1, 2, 1, 1, 2, 2, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0)

    K22 = (1, 2, 0, 0, 2, 1, 1, 1, 0, 1, 2, 2, 1, 2, 0, 1, 0, 1, 0, 0, 1, 0, 0, 0)

    K23 = (2, 1, 1, 1, 1, 0, 1, 1, 1, 2, 2, 1, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, 0)

    K24 = (0, 1, 2, 0, 2, 2, 1, 0, 0, 2, 2, 1, 1, 2, 1, 0, 1, 1, 1, 0, 0, 0, 0, 0)

    K25 = (0, 1, 2, 1, 1, 2, 2, 1, 1, 0, 1, 2, 0, 2, 0, 0, 1, 1, 2, 2, 0, 0, 0, 0)

    K26 = (2, 1, 2, 0, 1, 1, 2, 1, 2, 1, 1, 0, 1, 2, 0, 1, 2, 1, 1, 0, 1, 0, 0, 0)

    K27 = (2, 2, 0, 1, 1, 0, 2, 1, 1, 1, 0, 1, 2, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0)

    K28 = (1, 1, 2, 2, 0, 0, 2, 1, 1, 2, 2, 0, 2, 2, 1, 0, 0, 1, 1, 2, 0, 0, 0, 0)

    K29 = (2, 2, 2, 2, 0, 2, 0, 0, 1, 0, 0, 0, 2, 0, 2, 1, 2, 2, 1, 0, 1, 0, 0, 0)

    K30 = (1, 2, 2, 0, 1, 0, 1, 1, 2, 2, 2, 0, 1, 2, 2, 0, 1, 1, 1, 1, 0, 0, 0, 0)

    K31 = (1, 1, 2, 2, 1, 1, 0, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 2, 0, 0, 0, 0)

    K32 = (1, 1, 0, 0, 2, 0, 1, 0, 2, 0, 0, 0, 2, 2, 0, 2, 0, 0, 2, 0, 1, 0, 0, 0)

    K33 = (2, 1, 1, 1, 2, 2, 1, 1, 1, 0, 2, 2, 0, 0, 1, 2, 1, 2, 2, 1, 0, 0, 0, 0)

    K34 = (1, 0, 0, 0, 0, 2, 2, 0, 1, 0, 1, 1, 1, 1, 0, 2, 0, 2, 1, 1, 0, 0, 0, 0)

    K35 = (1, 1, 1, 0, 2, 2, 0, 0, 0, 2, 2, 0, 2, 1, 2, 2, 2, 2, 1, 0, 1, 0, 0, 0)

    K36 = (2, 1, 0, 0, 2, 0, 1, 1, 1, 0, 2, 2, 1, 2, 1, 0, 1, 0, 1, 2, 0, 0, 0, 0)

    K37 = (1, 2, 0, 2, 0, 1, 0, 0, 2, 1, 1, 0, 1, 0, 2, 1, 2, 0, 0, 1, 0, 0, 0, 0)

    K38 = (1, 2, 0, 2, 1, 2, 1, 1, 2, 0, 1, 0, 1, 1, 1, 0, 0, 2, 1, 0, 1, 0, 0, 0)

    K39 = (0, 2, 1, 1, 0, 1, 2, 1, 2, 0, 1, 2, 0, 0, 0, 1, 2, 0, 2, 2, 0, 0, 0, 0)

    K40 = (0, 0, 0, 0, 0, 1, 0, 2, 1, 1, 2, 2, 0, 1, 1, 2, 0, 2, 1, 0, 0, 0, 0, 0)

    K41 = (0, 1, 1, 0, 2, 2, 0, 0, 1, 2, 0, 0, 0, 0, 1, 1, 1, 0, 1, 0, 1, 0, 0, 0)

    K42 = (2, 1, 1, 0, 0, 2, 0, 0, 0, 2, 1, 0, 2, 2, 2, 2, 1, 0, 0, 0, 1, 0, 0, 0)

    K43 = (0, 2, 2, 2, 0, 1, 0, 0, 2, 1, 0, 0, 2, 2, 0, 2, 1, 0, 0, 0, 0, 0, 0, 0)

    K44 = (1, 2, 1, 0, 2, 1, 1, 0, 0, 0, 1, 2, 0, 0, 2, 2, 0, 1, 0, 0, 1, 0, 0, 0)

    K45 = (0, 1, 0, 2, 2, 2, 0, 1, 1, 0, 0, 0, 1, 2, 2, 2, 2, 2, 0, 0, 1, 0, 0, 0)

    K46 = (1, 0, 1, 2, 1, 2, 1, 1, 1, 0, 0, 2, 2, 2, 2, 0, 0, 1, 1, 0, 0, 0, 0, 0)

    K47 = (0, 0, 1, 0, 2, 1, 1, 1, 1, 1, 1, 2, 1, 2, 2, 1, 1, 1, 2, 2, 0, 0, 0, 0)

    K48 = (0, 2, 2, 2, 1, 0, 0, 1, 1, 2, 2, 2, 0, 1, 1, 0, 2, 1, 1, 0, 1, 0, 0, 0)

    K49 = (2, 0, 0, 2, 0, 1, 0, 0, 0, 0, 1, 1, 2, 1, 1, 0, 2, 2, 2, 0, 0, 0, 0, 0)

    K50 = (2, 0, 2, 1, 1, 2, 2, 2, 1, 1, 2, 1, 1, 2, 1, 2, 0, 1, 1, 2, 0, 0, 0, 0)

    K51 = (1, 2, 1, 0, 1, 2, 2, 2, 2, 2, 2, 1, 2, 2, 0, 1, 2, 2, 1, 0, 1, 0, 0, 0)

    K52 = (2, 0, 0, 0, 0, 2, 1, 2, 1, 2, 0, 2, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0)

    K53 = (1, 0, 2, 0, 2, 1, 2, 2, 1, 2, 2, 2, 0, 2, 0, 2, 1, 0, 0, 2, 0, 0, 0, 0)

    K54 = (2, 1, 1, 2, 0, 0, 2, 1, 1, 2, 0, 2, 0, 2, 0, 2, 0, 0, 2, 0, 1, 0, 0, 0)

    K55 = (0, 0, 0, 1, 0, 1, 1, 0, 0, 1, 0, 0, 0, 1, 0, 0, 1, 2, 2, 1, 0, 0, 0, 0)

    K56 = (1, 2, 0, 1, 1, 2, 1, 1, 0, 2, 2, 2, 2, 1, 1, 1, 1, 2, 1, 1, 0, 0, 0, 0)

    K57 = (2, 1, 1, 2, 0, 0, 1, 0, 2, 0, 1, 0, 2, 1, 0, 0, 0, 0, 2, 0, 1, 0, 0, 0)

    K58 = (2, 2, 1, 0, 0, 2, 2, 2, 1, 1, 2, 2, 0, 2, 1, 1, 0, 0, 1, 2, 0, 0, 0, 0)

    K59 = (0, 1, 0, 0, 1, 1, 0, 1, 2, 1, 0, 1, 0, 2, 0, 1, 0, 1, 0, 1, 0, 0, 0, 0)

    K60 = (1, 1, 1, 1, 0, 1, 1, 2, 1, 0, 2, 2, 1, 1, 0, 1, 0, 2, 1, 0, 1, 0, 0, 0)

    K61 = (2, 1, 1, 2, 0, 2, 0, 0, 1, 2, 1, 2, 0, 2, 0, 2, 1, 0, 2, 2, 0, 0, 0, 0)

    K62 = (0, 0, 1, 2, 0, 2, 1, 1, 0, 2, 1, 1, 2, 0, 0, 2, 1, 2, 1, 0, 0, 0, 0, 0)

    K63 = (2, 0, 2, 0, 2, 2, 1, 0, 0, 2, 0, 1, 1, 0, 1, 2, 1, 0, 1, 0, 1, 0, 0, 0)

    FF(A, B, C, D, E[ 0], iShift11, K0)

    FF(B, C, D, A, E[ 1], iShift12, K1)

    FF(C, D, A, B, E[ 2], iShift13, K2)

    FF(D, A, B, C, E[ 3], iShift14, K3)

    FF(A, B, C, D, E[ 4], iShift11, K4)

    FF(B, C, D, A, E[ 5], iShift12, K5)

    FF(C, D, A, B, E[ 6], iShift13, K6)

    FF(D, A, B, C, E[ 7], iShift14, K7)

    FF(A, B, C, D, E[ 8], iShift11, K8)

    FF(B, C, D, A, E[ 9], iShift12, K9)

    FF(C, D, A, B, E[10], iShift13, K10)

    FF(D, A, B, C, E[11], iShift14, K11)

    FF(A, B, C, D, E[12], iShift11, K12)

    FF(B, C, D, A, E[13], iShift12, K13)

    FF(C, D, A, B, E[14], iShift13, K14)

    FF(D, A, B, C, E[15], iShift14, K15)

    GG(A, B, C, D, E[ 1], iShift21, K16)

    GG(D, A, B, C, E[ 6], iShift22, K17)

    GG(C, D, A, B, E[11], iShift23, K18)

    GG(B, C, D, A, E[ 0], iShift24, K19)

    GG(A, B, C, D, E[ 5], iShift21, K20)

    GG(D, A, B, C, E[10], iShift22, K21)

    GG(C, D, A, B, E[15], iShift23, K22)

    GG(B, C, D, A, E[ 4], iShift24, K23)

    GG(A, B, C, D, E[ 9], iShift21, K24)

    GG(D, A, B, C, E[14], iShift22, K25)

    GG(C, D, A, B, E[ 3], iShift23, K26)

    GG(B, C, D, A, E[ 8], iShift24, K27)

    GG(A, B, C, D, E[13], iShift21, K28)

    GG(D, A, B, C, E[ 2], iShift22, K29)

    GG(C, D, A, B, E[ 7], iShift23, K30)

    GG(B, C, D, A, E[12], iShift24, K31)

    HH(A, B, C, D, E[ 5], iShift31, K32)

    HH(B, C, D, A, E[ 8], iShift32, K33)

    HH(C, D, A, B, E[11], iShift33, K34)

    HH(D, A, B, C, E[14], iShift34, K35)

    HH(A, B, C, D, E[ 1], iShift31, K36)

    HH(B, C, D, A, E[ 4], iShift32, K37)

    HH(C, D, A, B, E[ 7], iShift33, K38)

    HH(D, A, B, C, E[10], iShift34, K39)

    HH(A, B, C, D, E[13], iShift31, K40)

    HH(B, C, D, A, E[ 0], iShift32, K41)

    HH(C, D, A, B, E[ 3], iShift33, K42)

    HH(D, A, B, C, E[ 6], iShift34, K43)

    HH(A, B, C, D, E[ 9], iShift31, K44)

    HH(B, C, D, A, E[12], iShift32, K45)

    HH(C, D, A, B, E[15], iShift33, K46)

    HH(D, A, B, C, E[ 2], iShift34, K47)

    II(A, B, C, D, E[ 0], iShift41, K48)

    II(D, A, B, C, E[ 7], iShift42, K49)

    II(C, D, A, B, E[14], iShift43, K50)

    II(B, C, D, A, E[ 5], iShift44, K51)

    II(A, B, C, D, E[12], iShift41, K52)

    II(D, A, B, C, E[ 3], iShift42, K53)

    II(C, D, A, B, E[10], iShift43, K54)

    II(B, C, D, A, E[ 1], iShift44, K55)

    II(A, B, C, D, E[ 8], iShift41, K56)

    II(D, A, B, C, E[15], iShift42, K57)

    II(C, D, A, B, E[ 6], iShift43, K58)

    II(B, C, D, A, E[13], iShift44, K59)

    II(A, B, C, D, E[ 4], iShift41, K60)

    II(D, A, B, C, E[11], iShift42, K61)

    II(C, D, A, B, E[ 2], iShift43, K62)

    II(B, C, D, A, E[ 9], iShift44, K63)

if __name__ == "__main__":
    if len(sys.argv) != 2: Usage()

    else:
        statFileSize = os.stat(sys.argv[1])

        iFileSize = statFileSize.st_size

        if iFileSize == 0:
            print("There is no data in file [{}], 0 byte.".format(sys.argv[1]))

            exit(-1)

        iBytesLeft = iFileSize & 63

        if iBytesLeft == 0: iBytesLeft = iFileSize + 64

        elif iBytesLeft < 54: iBytesLeft = iFileSize - iBytesLeft + 64

        elif iBytesLeft > 53: iBytesLeft = iFileSize - iBytesLeft + 128

        with open(sys.argv[1], "br") as fdData:
            baData = bytearray(fdData.read())

        tPadding = (2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97,
            101, 103, 107, 109, 113, 127, 131, 137, 139, 149, 151, 157, 163, 167, 173, 179, 181, 191, 193, 197, 199,
            211, 223, 227, 229, 233, 239, 241, 251, 15, 25, 35, 55, 65, 85, 95, 115, 145, 155)

        while iFileSize < iBytesLeft:
            for i in range(5):
                baData.append(statFileSize.st_size >> 8 * i & 255)

                iFileSize += 1

            j = 0

            while iFileSize < iBytesLeft - 5:
                baData.append(tPadding[j])

                j += 1

                iFileSize += 1

            for k in range(4, -1, -1):
                baData.append(statFileSize.st_size >> 8 * k & 255)

                iFileSize += 1

        lMessageDigest0 = [1, 2, 1, 0, 0, 0, 2, 1, 2, 1, 0, 0, 0, 1, 0, 0, 1, 0, 1, 0, 1, 1, 1, 0]

        lMessageDigest1 = [2, 2, 1, 2, 1, 0, 0, 2, 2, 0, 2, 0, 1, 1, 0, 2, 2, 0, 2, 0, 1, 0, 0, 1]

        lMessageDigest2 = [2, 1, 2, 2, 2, 0, 1, 2, 1, 1, 2, 0, 0, 0, 1, 0, 2, 0, 2, 0, 0, 2, 1, 0]

        lMessageDigest3 = [1, 1, 2, 0, 1, 0, 0, 2, 1, 2, 0, 0, 2, 2, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0]

        lTrinary = [[0] * 24 for l in range(16)]

        for i in range(0, iBytesLeft, 64):
            for j in range(16):
                Trinary(lTrinary[j], baData[i + 4 * j] + (baData[i + 4 * j + 1] << 8) + (baData[i + 4 * j + 2] << 16) + (baData[i + 4 * j + 3] << 24))

            TrinaryHash(lMessageDigest0, lMessageDigest1, lMessageDigest2, lMessageDigest3, lTrinary)

        for k in range(24):
            print(f"{lMessageDigest0[k]}{lMessageDigest1[k]}{lMessageDigest2[k]}{lMessageDigest3[k]}", sep = "", end = "")

        print()