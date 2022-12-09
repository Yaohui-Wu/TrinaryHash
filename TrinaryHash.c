/*************************************************************
* 作者：伍耀晖               Author: Geek.Zhiyuan            *
* 开源日期：2022年6月13日    Open Source Date: 2022-6-13     *
* 国家城市：中国广州         City, Country: GuangZhou, China *
*************************************************************/

#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/stat.h>

#define    Shift11    2

#define    Shift12    22

#define    Shift13    3

#define    Shift14    21

#define    Shift21    5

#define    Shift22    15

#define    Shift23    7

#define    Shift24    14

#define    Shift31    11

#define    Shift32    12

#define    Shift33    13

#define    Shift34    10

#define    Shift41    17

#define    Shift42    6

#define    Shift43    19

#define    Shift44    4

void Usage()
{
    printf("Usage: TrinaryHash YouWantToHash.File\n");
}

void Trinary(unsigned char *ucpTrinary,
             long long lNumeric)
{
    ucpTrinary[0] = ucpTrinary[1] = ucpTrinary[2] = ucpTrinary[3] = ucpTrinary[4] = ucpTrinary[5] = ucpTrinary[6] = ucpTrinary[7] = 0;

    ucpTrinary[8] = ucpTrinary[9] = ucpTrinary[10] = ucpTrinary[11] = ucpTrinary[12] = ucpTrinary[13] = ucpTrinary[14] = ucpTrinary[15] = 0;

    ucpTrinary[16] = ucpTrinary[17] = ucpTrinary[18] = ucpTrinary[19] = ucpTrinary[20] = ucpTrinary[21] = ucpTrinary[22] = ucpTrinary[23] = 0;

    if (lNumeric != 0)
    {
        for (long long i = 23; i > -1; --i)
        {
            ucpTrinary[i] = lNumeric % 3;

            lNumeric /= 3;
        }
    }
}

// 0 0 0
// 0 1 1
// 0 1 2

void TrinaryAnd(unsigned char *W,
                unsigned char *X,
                unsigned char *Y)
{
    for (long long i = 0; i < 24; ++i)
    {
        if (X[i] == 0 && Y[i] == 0)
        {
            W[i] = 0;
        }
        else if (X[i] == 0 && Y[i] == 1)
        {
            W[i] = 0;
        }
        else if (X[i] == 0 && Y[i] == 2)
        {
            W[i] = 0;
        }
        else if (X[i] == 1 && Y[i] == 0)
        {
            W[i] = 0;
        }
        else if (X[i] == 1 && Y[i] == 1)
        {
            W[i] = 1;
        }
        else if (X[i] == 1 && Y[i] == 2)
        {
            W[i] = 1;
        }
        else if (X[i] == 2 && Y[i] == 0)
        {
            W[i] = 0;
        }
        else if (X[i] == 2 && Y[i] == 1)
        {
            W[i] = 1;
        }
        else if (X[i] == 2 && Y[i] == 2)
        {
            W[i] = 2;
        }
    }
}

// 0 1 2
// 1 1 2
// 2 2 2

void TrinaryOr(unsigned char *W,
               unsigned char *X,
               unsigned char *Y)
{
    for (long long j = 0; j < 24; ++j)
    {
        if (X[j] == 0 && Y[j] == 0)
        {
            W[j] = 0;
        }
        else if (X[j] == 0 && Y[j] == 1)
        {
            W[j] = 1;
        }
        else if (X[j] == 0 && Y[j] == 2)
        {
            W[j] = 2;
        }
        else if (X[j] == 1 && Y[j] == 0)
        {
            W[j] = 1;
        }
        else if (X[j] == 1 && Y[j] == 1)
        {
            W[j] = 1;
        }
        else if (X[j] == 1 && Y[j] == 2)
        {
            W[j] = 2;
        }
        else if (X[j] == 2 && Y[j] == 0)
        {
            W[j] = 2;
        }
        else if (X[j] == 2 && Y[j] == 1)
        {
            W[j] = 2;
        }
        else if (X[j] == 2 && Y[j] == 2)
        {
            W[j] = 2;
        }
    }
}

// 0 0 2
// 1 1 1
// 2 2 0

void TrinaryXOr(unsigned char *W,
                unsigned char *X,
                unsigned char *Y)
{
    for (long long k = 0; k < 24; ++k)
    {
        if (X[k] == 0 && Y[k] == 0)
        {
            W[k] = 0;
        }
        else if (X[k] == 0 && Y[k] == 1)
        {
            W[k] = 0;
        }
        else if (X[k] == 0 && Y[k] == 2)
        {
            W[k] = 2;
        }
        else if (X[k] == 1 && Y[k] == 0)
        {
            W[k] = 1;
        }
        else if (X[k] == 1 && Y[k] == 1)
        {
            W[k] = 1;
        }
        else if (X[k] == 1 && Y[k] == 2)
        {
            W[k] = 1;
        }
        else if (X[k] == 2 && Y[k] == 0)
        {
            W[k] = 2;
        }
        else if (X[k] == 2 && Y[k] == 1)
        {
            W[k] = 2;
        }
        else if (X[k] == 2 && Y[k] == 2)
        {
            W[k] = 0;
        }
    }
}

// 2 0 0
// 1 1 1
// 0 2 2

void TrinaryXAnd(unsigned char *W,
                 unsigned char *X,
                 unsigned char *Y)
{
    for (long long l = 0; l < 24; ++l)
    {
        if (X[l] == 0 && Y[l] == 0)
        {
            W[l] = 2;
        }
        else if (X[l] == 0 && Y[l] == 1)
        {
            W[l] = 0;
        }
        else if (X[l] == 0 && Y[l] == 2)
        {
            W[l] = 0;
        }
        else if (X[l] == 1 && Y[l] == 0)
        {
            W[l] = 1;
        }
        else if (X[l] == 1 && Y[l] == 1)
        {
            W[l] = 1;
        }
        else if (X[l] == 1 && Y[l] == 2)
        {
            W[l] = 1;
        }
        else if (X[l] == 2 && Y[l] == 0)
        {
            W[l] = 0;
        }
        else if (X[l] == 2 && Y[l] == 1)
        {
            W[l] = 2;
        }
        else if (X[l] == 2 && Y[l] == 2)
        {
            W[l] = 2;
        }
    }
}

// 0 1 2
// 1 2 0
// 2 0 1

void TrinaryAdd(unsigned char *W,
                unsigned char *X,
                unsigned char *Y)
{
    for (long long i = 0; i < 24; ++i)
    {
        if (X[i] == 0 && Y[i] == 0)
        {
            W[i] = 0;
        }
        else if (X[i] == 0 && Y[i] == 1)
        {
            W[i] = 1;
        }
        else if (X[i] == 0 && Y[i] == 2)
        {
            W[i] = 2;
        }
        else if (X[i] == 1 && Y[i] == 0)
        {
            W[i] = 1;
        }
        else if (X[i] == 1 && Y[i] == 1)
        {
            W[i] = 2;
        }
        else if (X[i] == 1 && Y[i] == 2)
        {
            W[i] = 0;
        }
        else if (X[i] == 2 && Y[i] == 0)
        {
            W[i] = 2;
        }
        else if (X[i] == 2 && Y[i] == 1)
        {
            W[i] = 0;
        }
        else if (X[i] == 2 && Y[i] == 2)
        {
            W[i] = 1;
        }
    }
}

// 0 2 1
// 1 0 2
// 2 1 0

void TrinarySubtract(unsigned char *W,
                     unsigned char *X,
                     unsigned char *Y)
{
    for (long long j = 0; j < 24; ++j)
    {
        if (X[j] == 0 && Y[j] == 0)
        {
            W[j] = 0;
        }
        else if (X[j] == 0 && Y[j] == 1)
        {
            W[j] = 2;
        }
        else if (X[j] == 0 && Y[j] == 2)
        {
            W[j] = 1;
        }
        else if (X[j] == 1 && Y[j] == 0)
        {
            W[j] = 1;
        }
        else if (X[j] == 1 && Y[j] == 1)
        {
            W[j] = 0;
        }
        else if (X[j] == 1 && Y[j] == 2)
        {
            W[j] = 2;
        }
        else if (X[j] == 2 && Y[j] == 0)
        {
            W[j] = 2;
        }
        else if (X[j] == 2 && Y[j] == 1)
        {
            W[j] = 1;
        }
        else if (X[j] == 2 && Y[j] == 2)
        {
            W[j] = 0;
        }
    }
}

// 0 0 0
// 0 1 2
// 0 2 1

void TrinaryMultiply(unsigned char *W,
                     unsigned char *X,
                     unsigned char *Y)
{
    for (long long k = 0; k < 24; ++k)
    {
        if (X[k] == 0 && Y[k] == 0)
        {
            W[k] = 0;
        }
        else if (X[k] == 0 && Y[k] == 1)
        {
            W[k] = 0;
        }
        else if (X[k] == 0 && Y[k] == 2)
        {
            W[k] = 0;
        }
        else if (X[k] == 1 && Y[k] == 0)
        {
            W[k] = 0;
        }
        else if (X[k] == 1 && Y[k] == 1)
        {
            W[k] = 1;
        }
        else if (X[k] == 1 && Y[k] == 2)
        {
            W[k] = 2;
        }
        else if (X[k] == 2 && Y[k] == 0)
        {
            W[k] = 0;
        }
        else if (X[k] == 2 && Y[k] == 1)
        {
            W[k] = 2;
        }
        else if (X[k] == 2 && Y[k] == 2)
        {
            W[k] = 1;
        }
    }
}

// 0 0 0
// 0 1 0
// 0 2 1

void TrinaryDivide(unsigned char *W,
                   unsigned char *X,
                   unsigned char *Y)
{
    for (long long l = 0; l < 24; ++l)
    {
        if (X[l] == 0 && Y[l] == 0)
        {
            W[l] = 0;
        }
        else if (X[l] == 0 && Y[l] == 1)
        {
            W[l] = 0;
        }
        else if (X[l] == 0 && Y[l] == 2)
        {
            W[l] = 0;
        }
        else if (X[l] == 1 && Y[l] == 0)
        {
            W[l] = 0;
        }
        else if (X[l] == 1 && Y[l] == 1)
        {
            W[l] = 1;
        }
        else if (X[l] == 1 && Y[l] == 2)
        {
            W[l] = 0;
        }
        else if (X[l] == 2 && Y[l] == 0)
        {
            W[l] = 0;
        }
        else if (X[l] == 2 && Y[l] == 1)
        {
            W[l] = 2;
        }
        else if (X[l] == 2 && Y[l] == 2)
        {
            W[l] = 1;
        }
    }
}

void F(unsigned char *W,
       unsigned char *X,
       unsigned char *Y,
       unsigned char *Z)
{
    TrinaryAnd(W, X, Y);

    TrinaryOr(W, W, Z);
}

void G(unsigned char *W,
       unsigned char *X,
       unsigned char *Y,
       unsigned char *Z)
{
    TrinaryAdd(W, Y, Z);

    TrinaryMultiply(W, W, X);
}

void H(unsigned char *W,
       unsigned char *X,
       unsigned char *Y,
       unsigned char *Z)
{
    TrinaryXOr(W, Z, X);

    TrinaryXAnd(W, W, Y);
}

void I(unsigned char *W,
       unsigned char *X,
       unsigned char *Y,
       unsigned char *Z)
{
    TrinarySubtract(W, X, Y);

    TrinaryDivide(W, W, Z);
}

void Add(unsigned char *W,
         unsigned char *Z)
{
    unsigned char ucCarry = 0;

    for (long long i = 0; i < 24; ++i)
    {
        W[i] += Z[i] + ucCarry;

        if (W[i] > 2)
        {
            W[i] -= 3;

            if (ucCarry == 0)
            {
                ucCarry = 1;
            }
        }
        else
        {
            ucCarry = 0;
        }
    }
}

void RotateShiftLeft(unsigned char *W,
                     unsigned char ucBit)
{
    unsigned char ucaSwap[24];

    for (long long j = 23; j >= 0; --j)
    {
        ucaSwap[j] = W[j >= ucBit ? j - ucBit : 24 - ucBit + j];
    }

    for (long long k = 0; k < 24; ++k)
    {
        W[k] = ucaSwap[k];
    }
}

void FF(unsigned char *A,
        unsigned char *B,
        unsigned char *C,
        unsigned char *D,
        unsigned char *E,
        unsigned char ucShift,
        unsigned char *K)
{
    unsigned char ucaTemp[24];

    F(ucaTemp, B, C, D);

    Add(ucaTemp, A);

    Add(ucaTemp, E);

    Add(ucaTemp, K);

    RotateShiftLeft(ucaTemp, ucShift);

    Add(ucaTemp, B);

    for (long long i = 0; i < 24; ++i)
    {
        A[i] = ucaTemp[i];
    }
}

void GG(unsigned char *A,
        unsigned char *B,
        unsigned char *C,
        unsigned char *D,
        unsigned char *E,
        unsigned char ucShift,
        unsigned char *K)
{
    unsigned char ucaTemp[24];

    G(ucaTemp, C, D, A);

    Add(ucaTemp, B);

    Add(ucaTemp, E);

    Add(ucaTemp, K);

    RotateShiftLeft(ucaTemp, ucShift);

    Add(ucaTemp, C);

    for (long long j = 0; j < 24; ++j)
    {
        B[j] = ucaTemp[j];
    }
}

void HH(unsigned char *A,
        unsigned char *B,
        unsigned char *C,
        unsigned char *D,
        unsigned char *E,
        unsigned char ucShift,
        unsigned char *K)
{
    unsigned char ucaTemp[24];

    H(ucaTemp, D, A, B);

    Add(ucaTemp, C);

    Add(ucaTemp, E);

    Add(ucaTemp, K);

    RotateShiftLeft(ucaTemp, ucShift);

    Add(ucaTemp, D);

    for (long long k = 0; k < 24; ++k)
    {
        C[k] = ucaTemp[k];
    }
}

void II(unsigned char *A,
        unsigned char *B,
        unsigned char *C,
        unsigned char *D,
        unsigned char *E,
        unsigned char ucShift,
        unsigned char *K)
{
    unsigned char ucaTemp[24];

    I(ucaTemp, A, B, C);

    Add(ucaTemp, D);

    Add(ucaTemp, E);

    Add(ucaTemp, K);

    RotateShiftLeft(ucaTemp, ucShift);

    Add(ucaTemp, A);

    for (long long l = 0; l < 24; ++l)
    {
        D[l] = ucaTemp[l];
    }
}

void TrinaryHash(unsigned char *A,
                 unsigned char *B,
                 unsigned char *C,
                 unsigned char *D,
                 unsigned char E[][24])
{
    unsigned char K0[] = {2, 1, 1, 1, 2, 2, 0, 1, 2, 2, 1, 1, 2, 1, 2, 2, 2, 0, 0, 0, 1, 0, 0, 0},

                  K1[] = {1, 1, 2, 0, 0, 1, 0, 0, 0, 1, 0, 2, 1, 1, 0, 2, 0, 0, 1, 0, 1, 0, 0, 0},

                  K2[] = {0, 0, 2, 2, 1, 2, 0, 0, 1, 1, 1, 1, 0, 2, 0, 0, 2, 1, 1, 0, 0, 0, 0, 0},

                  K3[] = {1, 1, 1, 0, 1, 0, 0, 2, 1, 1, 2, 0, 2, 1, 1, 1, 0, 1, 2, 2, 0, 0, 0, 0},

                  K4[] = {1, 2, 1, 1, 2, 0, 1, 2, 2, 2, 0, 2, 0, 0, 0, 2, 2, 1, 1, 0, 1, 0, 0, 0},

                  K5[] = {2, 1, 0, 2, 1, 2, 1, 0, 1, 1, 1, 0, 2, 2, 1, 2, 0, 0, 0, 1, 0, 0, 0, 0},

                  K6[] = {2, 0, 0, 1, 0, 0, 1, 0, 0, 1, 2, 1, 2, 2, 1, 1, 2, 0, 1, 2, 0, 0, 0, 0},

                  K7[] = {2, 2, 1, 0, 0, 2, 1, 1, 2, 1, 0, 2, 0, 1, 0, 2, 2, 2, 1, 0, 1, 0, 0, 0},

                  K8[] = {1, 2, 0, 0, 1, 0, 0, 1, 0, 2, 2, 1, 0, 0, 1, 0, 2, 1, 1, 1, 0, 0, 0, 0},

                  K9[] = {2, 1, 1, 2, 2, 2, 1, 1, 0, 2, 2, 1, 1, 1, 2, 0, 0, 0, 0, 2, 0, 0, 0, 0},

                  K10[] = {1, 2, 2, 0, 1, 2, 0, 1, 2, 2, 2, 1, 2, 2, 0, 2, 0, 0, 2, 0, 1, 0, 0, 0},

                  K11[] = {1, 1, 0, 2, 2, 0, 1, 2, 2, 2, 0, 1, 1, 2, 1, 1, 2, 2, 2, 1, 0, 0, 0, 0},

                  K12[] = {2, 0, 1, 2, 1, 2, 0, 0, 1, 0, 0, 2, 2, 0, 2, 2, 2, 1, 1, 1, 0, 0, 0, 0},

                  K13[] = {2, 2, 2, 0, 2 ,2, 1, 0, 1, 1, 1, 2, 1, 1, 1, 2, 2, 2, 1, 0, 1, 0, 0, 0},

                  K14[] = {1, 0, 1, 1, 0, 2, 2, 2, 0, 0, 1, 1, 2, 2, 1, 2, 1, 0, 1, 2, 0, 0, 0, 0},

                  K15[] = {0, 1, 2, 0, 2, 1, 1, 1, 1, 2, 0, 2, 1, 1, 0, 2, 1, 0, 0, 1, 0, 0, 0, 0},

                  K16[] = {0, 0, 1, 0, 1, 1, 1, 2, 1, 2 ,0, 2, 2, 0, 2, 2, 2, 1, 1, 0, 1, 0, 0, 0},

                  K17[] = {1, 2, 0, 2, 0, 0, 2, 2, 1, 1, 2, 0, 0, 1, 2, 2, 2, 0, 2, 2, 0, 0, 0, 0},

                  K18[] = {0, 1, 2, 0, 0, 2, 0, 2, 0, 1, 2, 0, 2, 1, 2, 2, 2, 1, 1, 0, 0, 0, 0, 0},

                  K19[] = {1, 2, 1, 1, 1, 2, 2, 2, 2, 1, 1, 0, 1, 2, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0},

                  K20[] = {1, 2, 1, 0, 2, 2, 1, 0, 0, 2, 2, 1, 2, 0, 1, 1, 2, 0, 0, 0, 1, 0, 0, 0},

                  K21[] = {2, 0, 0, 1, 2, 0, 2, 0, 1, 2, 1, 1, 2, 2, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0},

                  K22[] = {1, 2, 0, 0, 2, 1, 1, 1, 0, 1, 2, 2, 1, 2, 0, 1, 0, 1, 0, 0, 1, 0, 0, 0},

                  K23[] = {2, 1, 1, 1, 1, 0, 1, 1, 1, 2, 2, 1, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, 0},

                  K24[] = {0, 1, 2, 0, 2, 2, 1, 0, 0, 2, 2, 1, 1, 2, 1, 0, 1, 1, 1, 0, 0, 0, 0, 0},

                  K25[] = {0, 1, 2, 1, 1, 2, 2, 1, 1, 0, 1, 2, 0, 2, 0, 0, 1, 1, 2, 2, 0, 0, 0, 0},

                  K26[] = {2, 1, 2, 0, 1, 1, 2, 1, 2, 1, 1, 0, 1, 2, 0, 1, 2, 1, 1, 0, 1, 0, 0, 0},

                  K27[] = {2, 2, 0, 1, 1, 0, 2, 1, 1, 1, 0, 1, 2, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0},

                  K28[] = {1, 1, 2, 2, 0, 0, 2, 1, 1, 2, 2, 0, 2, 2, 1, 0, 0, 1, 1, 2, 0, 0, 0, 0},

                  K29[] = {2, 2, 2, 2, 0, 2, 0, 0, 1, 0, 0, 0, 2, 0, 2, 1, 2, 2, 1, 0, 1, 0, 0, 0},

                  K30[] = {1, 2, 2, 0, 1, 0, 1, 1, 2, 2, 2, 0, 1, 2, 2, 0, 1, 1, 1, 1, 0, 0, 0, 0},

                  K31[] = {1, 1, 2, 2, 1, 1, 0, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 2, 0, 0, 0, 0},

                  K32[] = {1, 1, 0, 0, 2, 0, 1, 0, 2, 0, 0, 0, 2, 2, 0, 2, 0, 0, 2, 0, 1, 0, 0, 0},

                  K33[] = {2, 1, 1, 1, 2, 2, 1, 1, 1, 0, 2, 2, 0, 0, 1, 2, 1, 2, 2, 1, 0, 0, 0, 0},

                  K34[] = {1, 0, 0, 0, 0, 2, 2, 0, 1, 0, 1, 1, 1, 1, 0, 2, 0, 2, 1, 1, 0, 0, 0, 0},

                  K35[] = {1, 1, 1, 0, 2, 2, 0, 0, 0, 2, 2, 0, 2, 1, 2, 2, 2, 2, 1, 0, 1, 0, 0, 0},

                  K36[] = {2, 1, 0, 0, 2, 0, 1, 1, 1, 0, 2, 2, 1, 2, 1, 0, 1, 0, 1, 2, 0, 0, 0, 0},

                  K37[] = {1, 2, 0, 2, 0, 1, 0, 0, 2, 1, 1, 0, 1, 0, 2, 1, 2, 0, 0, 1, 0, 0, 0, 0},

                  K38[] = {1, 2, 0, 2, 1, 2, 1, 1, 2, 0, 1, 0, 1, 1, 1, 0, 0, 2, 1, 0, 1, 0, 0, 0},

                  K39[] = {0, 2, 1, 1, 0, 1, 2, 1, 2, 0, 1, 2, 0, 0, 0, 1, 2, 0, 2, 2, 0, 0, 0, 0},

                  K40[] = {0, 0, 0, 0, 0, 1, 0, 2, 1, 1, 2, 2, 0, 1, 1, 2, 0, 2, 1, 0, 0, 0, 0, 0},

                  K41[] = {0, 1, 1, 0, 2, 2, 0, 0, 1, 2, 0, 0, 0, 0, 1, 1, 1, 0, 1, 0, 1, 0, 0, 0},

                  K42[] = {2, 1, 1, 0, 0, 2, 0, 0, 0, 2, 1, 0, 2, 2, 2, 2, 1, 0, 0, 0, 1, 0, 0, 0},

                  K43[] = {0, 2, 2, 2, 0, 1, 0, 0, 2, 1, 0, 0, 2, 2, 0, 2, 1, 0, 0, 0, 0, 0, 0, 0},

                  K44[] = {1, 2, 1, 0, 2, 1, 1, 0, 0, 0, 1, 2, 0, 0, 2, 2, 0, 1, 0, 0, 1, 0, 0, 0},

                  K45[] = {0, 1, 0, 2, 2, 2, 0, 1, 1, 0, 0, 0, 1, 2, 2, 2, 2, 2, 0, 0, 1, 0, 0, 0},

                  K46[] = {1, 0, 1, 2, 1, 2, 1, 1, 1, 0, 0, 2, 2, 2, 2, 0, 0, 1, 1, 0, 0, 0, 0, 0},

                  K47[] = {0, 0, 1, 0, 2, 1, 1, 1, 1, 1, 1, 2, 1, 2, 2, 1, 1, 1, 2, 2, 0, 0, 0, 0},

                  K48[] = {0, 2, 2, 2, 1, 0, 0, 1, 1, 2, 2, 2, 0, 1, 1, 0, 2, 1, 1, 0, 1, 0, 0, 0},

                  K49[] = {2, 0, 0, 2, 0, 1, 0, 0, 0, 0, 1, 1, 2, 1, 1, 0, 2, 2, 2, 0, 0, 0, 0, 0},

                  K50[] = {2, 0, 2, 1, 1, 2, 2, 2, 1, 1, 2, 1, 1, 2, 1, 2, 0, 1, 1, 2, 0, 0, 0, 0},

                  K51[] = {1, 2, 1, 0, 1, 2, 2, 2, 2, 2, 2, 1, 2, 2, 0, 1, 2, 2, 1, 0, 1, 0, 0, 0},

                  K52[] = {2, 0, 0, 0, 0, 2, 1, 2, 1, 2, 0, 2, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0},

                  K53[] = {1, 0, 2, 0, 2, 1, 2, 2, 1, 2, 2, 2, 0, 2, 0, 2, 1, 0, 0, 2, 0, 0, 0, 0},

                  K54[] = {2, 1, 1, 2, 0, 0, 2, 1, 1, 2, 0, 2, 0, 2, 0, 2, 0, 0, 2, 0, 1, 0, 0, 0},

                  K55[] = {0, 0, 0, 1, 0, 1, 1, 0, 0, 1, 0, 0, 0, 1, 0, 0, 1, 2, 2, 1, 0, 0, 0, 0},

                  K56[] = {1, 2, 0, 1, 1, 2, 1, 1, 0, 2, 2, 2, 2, 1, 1, 1, 1, 2, 1, 1, 0, 0, 0, 0},

                  K57[] = {2, 1, 1, 2, 0, 0, 1, 0, 2, 0, 1, 0, 2, 1, 0, 0, 0, 0, 2, 0, 1, 0, 0, 0},

                  K58[] = {2, 2, 1, 0, 0, 2, 2, 2, 1, 1, 2, 2, 0, 2, 1, 1, 0, 0, 1, 2, 0, 0, 0, 0},

                  K59[] = {0, 1, 0, 0, 1, 1, 0, 1, 2, 1, 0, 1, 0, 2, 0, 1, 0, 1, 0, 1, 0, 0, 0, 0},

                  K60[] = {1, 1, 1, 1, 0, 1, 1, 2, 1, 0, 2, 2, 1, 1, 0, 1, 0, 2, 1, 0, 1, 0, 0, 0},

                  K61[] = {2, 1, 1, 2, 0, 2, 0, 0, 1, 2, 1, 2, 0, 2, 0, 2, 1, 0, 2, 2, 0, 0, 0, 0},

                  K62[] = {0, 0, 1, 2, 0, 2, 1, 1, 0, 2, 1, 1, 2, 0, 0, 2, 1, 2, 1, 0, 0, 0, 0, 0},

                  K63[] = {2, 0, 2, 0, 2, 2, 1, 0, 0, 2, 0, 1, 1, 0, 1, 2, 1, 0, 1, 0, 1, 0, 0, 0};

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
}

long long main(long long argc,
               char *argv[])
{
    if (argc != 2)
    {
        Usage();
    }
    else
    {
        struct stat tStatFileSize;

        stat(argv[1], &tStatFileSize);

        long long lFileSize = tStatFileSize.st_size;

        if (lFileSize == 0)
        {
            printf("There is no data in file [%s], 0 byte.\n", argv[1]);

            return -1;
        }

        long long lBytesLeft = lFileSize & 63;

        if (lBytesLeft == 0)
        {
            lBytesLeft = lFileSize + 64;
        }
        else if (lBytesLeft < 54)
        {
            lBytesLeft = lFileSize - lBytesLeft + 64;
        }
        else if (lBytesLeft > 53)
        {
            lBytesLeft = lFileSize - lBytesLeft + 128;
        }

        unsigned char *ucpData = (unsigned char*)malloc(lBytesLeft);

        int fdData = open(argv[1], O_BINARY | O_RDONLY, S_IREAD | S_IWRITE);

        read(fdData, ucpData, lFileSize);

        close(fdData);

        const unsigned char ucaPadding[] = {2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97,
            101, 103, 107, 109, 113, 127, 131, 137, 139, 149, 151, 157, 163, 167, 173, 179, 181, 191, 193, 197, 199,
            211, 223, 227, 229, 233, 239, 241, 251, 15, 25, 35, 55, 65, 85, 95, 115, 145, 155};

        for (long long i = 0; i < 5; ++i)
        {
            ucpData[i + lFileSize] = ((unsigned char*)&lFileSize)[i];
        }

        for (long long j = lFileSize + 5, k = 0; j < lBytesLeft - 5; ++j, ++k)
        {
            ucpData[j] = ucaPadding[k];
        }

        for (long long l = 5; l > 0; --l)
        {
            ucpData[lBytesLeft - l] = ((unsigned char*)&lFileSize)[l - 1];
        }

        unsigned char ucaMessageDigest0[] = {1, 2, 1, 0, 0, 0, 2, 1, 2, 1, 0, 0, 0, 1, 0, 0, 1, 0, 1, 0, 1, 1, 1, 0},

                      ucaMessageDigest1[] = {2, 2, 1, 2, 1, 0, 0, 2, 2, 0, 2, 0, 1, 1, 0, 2, 2, 0, 2, 0, 1, 0, 0, 1},

                      ucaMessageDigest2[] = {2, 1, 2, 2, 2, 0, 1, 2, 1, 1, 2, 0, 0, 0, 1, 0, 2, 0, 2, 0, 0, 2, 1, 0},

                      ucaMessageDigest3[] = {1, 1, 2, 0, 1, 0, 0, 2, 1, 2, 0, 0, 2, 2, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0};

        unsigned char ucaTrinary[16][24];

        for (long long i = 0; i < lBytesLeft; i += 64)
        {
            for (long long j = 0; j < 16; ++j)
            {
                Trinary(ucaTrinary[j], *(unsigned int*)(ucpData + i + 4 * j));
            }

            TrinaryHash(ucaMessageDigest0, ucaMessageDigest1, ucaMessageDigest2, ucaMessageDigest3, ucaTrinary);
        }

        for (long long k = 0; k < 24; ++k)
        {
            printf ("%hhu%hhu%hhu%hhu", ucaMessageDigest0[k], ucaMessageDigest1[k], ucaMessageDigest2[k], ucaMessageDigest3[k]);
        }

        putchar(10);

        free(ucpData);
    }

    return 0;
}