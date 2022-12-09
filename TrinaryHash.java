/*************************************************************
* 作者：伍耀晖               Author: Geek.Zhiyuan            *
* 开源日期：2022年6月13日    Open Source Date: 2022-6-13     *
* 国家城市：中国广州         City, Country: GuangZhou, China *
*************************************************************/

import java.io.*;

public class TrinaryHash
{
    final static int iShift11 = 2, iShift12 = 22, iShift13 = 3, iShift14 = 21, iShift21 = 5, iShift22 = 15, iShift23 = 7, iShift24 = 14,
        iShift31 = 11, iShift32 = 12, iShift33  = 13, iShift34 = 10, iShift41 = 17, iShift42 = 6, iShift43 = 19, iShift44 = 4;

    final static byte[] baPadding = {(byte)2, (byte)3, (byte)5, (byte)7, (byte)11, (byte)13, (byte)17, (byte)19, (byte)23, (byte)29,
        (byte)31, (byte)37, (byte)41, (byte)43, (byte)47, (byte)53, (byte)59, (byte)61, (byte)67, (byte)71, (byte)73, (byte)79,
        (byte)83, (byte)89, (byte)97, (byte)101, (byte)103, (byte)107, (byte)109, (byte)113, (byte)127, (byte)131, (byte)137, (byte)139,
        (byte)149, (byte)151, (byte)157, (byte)163, (byte)167, (byte)173, (byte)179, (byte)181, (byte)191, (byte)193, (byte)197, (byte)199,
        (byte)211, (byte)223, (byte)227, (byte)229, (byte)233, (byte)239, (byte)241, (byte)251,
        (byte)15, (byte)25, (byte)35, (byte)55, (byte)65, (byte)85, (byte)95, (byte)115, (byte)145, (byte)155};

    final static byte[] K0 = {2, 1, 1, 1, 2, 2, 0, 1, 2, 2, 1, 1, 2, 1, 2, 2, 2, 0, 0, 0, 1, 0, 0, 0},

                        K1 = {1, 1, 2, 0, 0, 1, 0, 0, 0, 1, 0, 2, 1, 1, 0, 2, 0, 0, 1, 0, 1, 0, 0, 0},

                        K2 = {0, 0, 2, 2, 1, 2, 0, 0, 1, 1, 1, 1, 0, 2, 0, 0, 2, 1, 1, 0, 0, 0, 0, 0},

                        K3 = {1, 1, 1, 0, 1, 0, 0, 2, 1, 1, 2, 0, 2, 1, 1, 1, 0, 1, 2, 2, 0, 0, 0, 0},

                        K4 = {1, 2, 1, 1, 2, 0, 1, 2, 2, 2, 0, 2, 0, 0, 0, 2, 2, 1, 1, 0, 1, 0, 0, 0},

                        K5 = {2, 1, 0, 2, 1, 2, 1, 0, 1, 1, 1, 0, 2, 2, 1, 2, 0, 0, 0, 1, 0, 0, 0, 0},

                        K6 = {2, 0, 0, 1, 0, 0, 1, 0, 0, 1, 2, 1, 2, 2, 1, 1, 2, 0, 1, 2, 0, 0, 0, 0},

                        K7 = {2, 2, 1, 0, 0, 2, 1, 1, 2, 1, 0, 2, 0, 1, 0, 2, 2, 2, 1, 0, 1, 0, 0, 0},

                        K8 = {1, 2, 0, 0, 1, 0, 0, 1, 0, 2, 2, 1, 0, 0, 1, 0, 2, 1, 1, 1, 0, 0, 0, 0},

                        K9 = {2, 1, 1, 2, 2, 2, 1, 1, 0, 2, 2, 1, 1, 1, 2, 0, 0, 0, 0, 2, 0, 0, 0, 0},

                        K10 = {1, 2, 2, 0, 1, 2, 0, 1, 2, 2, 2, 1, 2, 2, 0, 2, 0, 0, 2, 0, 1, 0, 0, 0},

                        K11 = {1, 1, 0, 2, 2, 0, 1, 2, 2, 2, 0, 1, 1, 2, 1, 1, 2, 2, 2, 1, 0, 0, 0, 0},

                        K12 = {2, 0, 1, 2, 1, 2, 0, 0, 1, 0, 0, 2, 2, 0, 2, 2, 2, 1, 1, 1, 0, 0, 0, 0},

                        K13 = {2, 2, 2, 0, 2 ,2, 1, 0, 1, 1, 1, 2, 1, 1, 1, 2, 2, 2, 1, 0, 1, 0, 0, 0},

                        K14 = {1, 0, 1, 1, 0, 2, 2, 2, 0, 0, 1, 1, 2, 2, 1, 2, 1, 0, 1, 2, 0, 0, 0, 0},

                        K15 = {0, 1, 2, 0, 2, 1, 1, 1, 1, 2, 0, 2, 1, 1, 0, 2, 1, 0, 0, 1, 0, 0, 0, 0},

                        K16 = {0, 0, 1, 0, 1, 1, 1, 2, 1, 2 ,0, 2, 2, 0, 2, 2, 2, 1, 1, 0, 1, 0, 0, 0},

                        K17 = {1, 2, 0, 2, 0, 0, 2, 2, 1, 1, 2, 0, 0, 1, 2, 2, 2, 0, 2, 2, 0, 0, 0, 0},

                        K18 = {0, 1, 2, 0, 0, 2, 0, 2, 0, 1, 2, 0, 2, 1, 2, 2, 2, 1, 1, 0, 0, 0, 0, 0},

                        K19 = {1, 2, 1, 1, 1, 2, 2, 2, 2, 1, 1, 0, 1, 2, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0},

                        K20 = {1, 2, 1, 0, 2, 2, 1, 0, 0, 2, 2, 1, 2, 0, 1, 1, 2, 0, 0, 0, 1, 0, 0, 0},

                        K21 = {2, 0, 0, 1, 2, 0, 2, 0, 1, 2, 1, 1, 2, 2, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0},

                        K22 = {1, 2, 0, 0, 2, 1, 1, 1, 0, 1, 2, 2, 1, 2, 0, 1, 0, 1, 0, 0, 1, 0, 0, 0},

                        K23 = {2, 1, 1, 1, 1, 0, 1, 1, 1, 2, 2, 1, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, 0},

                        K24 = {0, 1, 2, 0, 2, 2, 1, 0, 0, 2, 2, 1, 1, 2, 1, 0, 1, 1, 1, 0, 0, 0, 0, 0},

                        K25 = {0, 1, 2, 1, 1, 2, 2, 1, 1, 0, 1, 2, 0, 2, 0, 0, 1, 1, 2, 2, 0, 0, 0, 0},

                        K26 = {2, 1, 2, 0, 1, 1, 2, 1, 2, 1, 1, 0, 1, 2, 0, 1, 2, 1, 1, 0, 1, 0, 0, 0},

                        K27 = {2, 2, 0, 1, 1, 0, 2, 1, 1, 1, 0, 1, 2, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0},

                        K28 = {1, 1, 2, 2, 0, 0, 2, 1, 1, 2, 2, 0, 2, 2, 1, 0, 0, 1, 1, 2, 0, 0, 0, 0},

                        K29 = {2, 2, 2, 2, 0, 2, 0, 0, 1, 0, 0, 0, 2, 0, 2, 1, 2, 2, 1, 0, 1, 0, 0, 0},

                        K30 = {1, 2, 2, 0, 1, 0, 1, 1, 2, 2, 2, 0, 1, 2, 2, 0, 1, 1, 1, 1, 0, 0, 0, 0},

                        K31 = {1, 1, 2, 2, 1, 1, 0, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 2, 0, 0, 0, 0},

                        K32 = {1, 1, 0, 0, 2, 0, 1, 0, 2, 0, 0, 0, 2, 2, 0, 2, 0, 0, 2, 0, 1, 0, 0, 0},

                        K33 = {2, 1, 1, 1, 2, 2, 1, 1, 1, 0, 2, 2, 0, 0, 1, 2, 1, 2, 2, 1, 0, 0, 0, 0},

                        K34 = {1, 0, 0, 0, 0, 2, 2, 0, 1, 0, 1, 1, 1, 1, 0, 2, 0, 2, 1, 1, 0, 0, 0, 0},

                        K35 = {1, 1, 1, 0, 2, 2, 0, 0, 0, 2, 2, 0, 2, 1, 2, 2, 2, 2, 1, 0, 1, 0, 0, 0},

                        K36 = {2, 1, 0, 0, 2, 0, 1, 1, 1, 0, 2, 2, 1, 2, 1, 0, 1, 0, 1, 2, 0, 0, 0, 0},

                        K37 = {1, 2, 0, 2, 0, 1, 0, 0, 2, 1, 1, 0, 1, 0, 2, 1, 2, 0, 0, 1, 0, 0, 0, 0},

                        K38 = {1, 2, 0, 2, 1, 2, 1, 1, 2, 0, 1, 0, 1, 1, 1, 0, 0, 2, 1, 0, 1, 0, 0, 0},

                        K39 = {0, 2, 1, 1, 0, 1, 2, 1, 2, 0, 1, 2, 0, 0, 0, 1, 2, 0, 2, 2, 0, 0, 0, 0},

                        K40 = {0, 0, 0, 0, 0, 1, 0, 2, 1, 1, 2, 2, 0, 1, 1, 2, 0, 2, 1, 0, 0, 0, 0, 0},

                        K41 = {0, 1, 1, 0, 2, 2, 0, 0, 1, 2, 0, 0, 0, 0, 1, 1, 1, 0, 1, 0, 1, 0, 0, 0},

                        K42 = {2, 1, 1, 0, 0, 2, 0, 0, 0, 2, 1, 0, 2, 2, 2, 2, 1, 0, 0, 0, 1, 0, 0, 0},

                        K43 = {0, 2, 2, 2, 0, 1, 0, 0, 2, 1, 0, 0, 2, 2, 0, 2, 1, 0, 0, 0, 0, 0, 0, 0},

                        K44 = {1, 2, 1, 0, 2, 1, 1, 0, 0, 0, 1, 2, 0, 0, 2, 2, 0, 1, 0, 0, 1, 0, 0, 0},

                        K45 = {0, 1, 0, 2, 2, 2, 0, 1, 1, 0, 0, 0, 1, 2, 2, 2, 2, 2, 0, 0, 1, 0, 0, 0},

                        K46 = {1, 0, 1, 2, 1, 2, 1, 1, 1, 0, 0, 2, 2, 2, 2, 0, 0, 1, 1, 0, 0, 0, 0, 0},

                        K47 = {0, 0, 1, 0, 2, 1, 1, 1, 1, 1, 1, 2, 1, 2, 2, 1, 1, 1, 2, 2, 0, 0, 0, 0},

                        K48 = {0, 2, 2, 2, 1, 0, 0, 1, 1, 2, 2, 2, 0, 1, 1, 0, 2, 1, 1, 0, 1, 0, 0, 0},

                        K49 = {2, 0, 0, 2, 0, 1, 0, 0, 0, 0, 1, 1, 2, 1, 1, 0, 2, 2, 2, 0, 0, 0, 0, 0},

                        K50 = {2, 0, 2, 1, 1, 2, 2, 2, 1, 1, 2, 1, 1, 2, 1, 2, 0, 1, 1, 2, 0, 0, 0, 0},

                        K51 = {1, 2, 1, 0, 1, 2, 2, 2, 2, 2, 2, 1, 2, 2, 0, 1, 2, 2, 1, 0, 1, 0, 0, 0},

                        K52 = {2, 0, 0, 0, 0, 2, 1, 2, 1, 2, 0, 2, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0},

                        K53 = {1, 0, 2, 0, 2, 1, 2, 2, 1, 2, 2, 2, 0, 2, 0, 2, 1, 0, 0, 2, 0, 0, 0, 0},

                        K54 = {2, 1, 1, 2, 0, 0, 2, 1, 1, 2, 0, 2, 0, 2, 0, 2, 0, 0, 2, 0, 1, 0, 0, 0},

                        K55 = {0, 0, 0, 1, 0, 1, 1, 0, 0, 1, 0, 0, 0, 1, 0, 0, 1, 2, 2, 1, 0, 0, 0, 0},

                        K56 = {1, 2, 0, 1, 1, 2, 1, 1, 0, 2, 2, 2, 2, 1, 1, 1, 1, 2, 1, 1, 0, 0, 0, 0},

                        K57 = {2, 1, 1, 2, 0, 0, 1, 0, 2, 0, 1, 0, 2, 1, 0, 0, 0, 0, 2, 0, 1, 0, 0, 0},

                        K58 = {2, 2, 1, 0, 0, 2, 2, 2, 1, 1, 2, 2, 0, 2, 1, 1, 0, 0, 1, 2, 0, 0, 0, 0},

                        K59 = {0, 1, 0, 0, 1, 1, 0, 1, 2, 1, 0, 1, 0, 2, 0, 1, 0, 1, 0, 1, 0, 0, 0, 0},

                        K60 = {1, 1, 1, 1, 0, 1, 1, 2, 1, 0, 2, 2, 1, 1, 0, 1, 0, 2, 1, 0, 1, 0, 0, 0},

                        K61 = {2, 1, 1, 2, 0, 2, 0, 0, 1, 2, 1, 2, 0, 2, 0, 2, 1, 0, 2, 2, 0, 0, 0, 0},

                        K62 = {0, 0, 1, 2, 0, 2, 1, 1, 0, 2, 1, 1, 2, 0, 0, 2, 1, 2, 1, 0, 0, 0, 0, 0},

                        K63 = {2, 0, 2, 0, 2, 2, 1, 0, 0, 2, 0, 1, 1, 0, 1, 2, 1, 0, 1, 0, 1, 0, 0, 0};

    private static void Usage()
    {
        System.out.printf("Usage: java TrinaryHash YouWantToHash.File\n");
    }

    private static void Trinary(byte[] baTrinary,
                                long lNumeric)
    {
        baTrinary[0] = baTrinary[1] = baTrinary[2] = baTrinary[3] = baTrinary[4] = baTrinary[5] = baTrinary[6] = baTrinary[7] = 0;

        baTrinary[8] = baTrinary[9] = baTrinary[10] = baTrinary[11] = baTrinary[12] = baTrinary[13] = baTrinary[14] = baTrinary[15] = 0;

        baTrinary[16] = baTrinary[17] = baTrinary[18] = baTrinary[19] = baTrinary[20] = baTrinary[21] = baTrinary[22] = baTrinary[23] = 0;

        if (lNumeric != 0)
        {
            for (int i = 23; i >= 0; --i)
            {
                baTrinary[i] = (byte)(lNumeric % 3 & 255);

                lNumeric /= 3;
            }
        }
    }

// 0 0 0
// 0 1 1
// 0 1 2

    private static void TrinaryAnd(byte[] W,
                                   byte[] X,
                                   byte[] Y)
    {
        for (int i = 0; i < 24; ++i)
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

    private static void TrinaryOr(byte[] W,
                                  byte[] X,
                                  byte[] Y)
    {
        for (int j = 0; j < 24; ++j)
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

    private static void TrinaryXOr(byte[] W,
                                   byte[] X,
                                   byte[] Y)
    {
        for (int k = 0; k < 24; ++k)
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

    private static void TrinaryXAnd(byte[] W,
                                    byte[] X,
                                    byte[] Y)
    {
        for (int l = 0; l < 24; ++l)
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

    private static void TrinaryAdd(byte[] W,
                                   byte[] X,
                                   byte[] Y)
    {
        for (int i = 0; i < 24; ++i)
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

    private static void TrinarySubtract(byte[] W,
                                        byte[] X,
                                        byte[] Y)
    {
        for (int j = 0; j < 24; ++j)
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

    private static void TrinaryMultiply(byte[] W,
                                        byte[] X,
                                        byte[] Y)
    {
        for (int k = 0; k < 24; ++k)
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

    private static void TrinaryDivide(byte[] W,
                                      byte[] X,
                                      byte[] Y)
    {
        for (int l = 0; l < 24; ++l)
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

    private static void F(byte[] W,
                          byte[] X,
                          byte[] Y,
                          byte[] Z)
    {
        TrinaryAnd(W, X, Y);

        TrinaryOr(W, W, Z);
    }

    private static void G(byte[] W,
                          byte[] X,
                          byte[] Y,
                          byte[] Z)
    {
        TrinaryAdd(W, Y, Z);

        TrinaryMultiply(W, W, X);
    }

    private static void H(byte[] W,
                          byte[] X,
                          byte[] Y,
                          byte[] Z)
    {
        TrinaryXOr(W, Z, X);

        TrinaryXAnd(W, W, Y);
    }

    private static void I(byte[] W,
                          byte[] X,
                          byte[] Y,
                          byte[] Z)
    {
        TrinarySubtract(W, X, Y);

        TrinaryDivide(W, W, Z);
    }

    private static void Add(byte[] W,
                            byte[] Z)
    {
        byte bCarry = 0;

        for (int i = 0; i < 24; ++i)
        {
            W[i] += Z[i] + bCarry;

            if (W[i] > 2)
            {
                W[i] -= 3;

                if (bCarry == 0)
                {
                    bCarry = 1;
                }
            }
            else
            {
                bCarry = 0;
            }
        }
    }

    private static void RotateShiftLeft(byte[] W,
                                        int iBit)
    {
        byte[] baSwap = new byte[24];

        for (int j = 23; j >= 0; --j)
        {
            baSwap[j] = W[j >= iBit ? j - iBit : 24 - iBit + j];
        }

        for (int k = 0; k < 24; ++k)
        {
            W[k] = baSwap[k];
        }
    }

    private static void FF(byte[] A,
                           byte[] B,
                           byte[] C,
                           byte[] D,
                           byte[] E,
                           int iShift,
                           byte[] K)
    {
        byte[] baTemp = new byte[24];

        F(baTemp, B, C, D);

        Add(baTemp, A);

        Add(baTemp, E);

        Add(baTemp, K);

        RotateShiftLeft(baTemp, iShift);

        Add(baTemp, B);

        for (int i = 0; i < 24; ++i)
        {
            A[i] = baTemp[i];
        }
    }

    private static void GG(byte[] A,
                           byte[] B,
                           byte[] C,
                           byte[] D,
                           byte[] E,
                           int iShift,
                           byte[] K)
    {
        byte[] baTemp = new byte[24];

        G(baTemp, C, D, A);

        Add(baTemp, B);

        Add(baTemp, E);

        Add(baTemp, K);

        RotateShiftLeft(baTemp, iShift);

        Add(baTemp, C);

        for (int j = 0; j < 24; ++j)
        {
            B[j] = baTemp[j];
        }
    }

    private static void HH(byte[] A,
                           byte[] B,
                           byte[] C,
                           byte[] D,
                           byte[] E,
                           int iShift,
                           byte[] K)
    {
        byte[] baTemp = new byte[24];

        H(baTemp, D, A, B);

        Add(baTemp, C);

        Add(baTemp, E);

        Add(baTemp, K);

        RotateShiftLeft(baTemp, iShift);

        Add(baTemp, D);

        for (int k = 0; k < 24; ++k)
        {
            C[k] = baTemp[k];
        }
    }

    private static void II(byte[] A,
                           byte[] B,
                           byte[] C,
                           byte[] D,
                           byte[] E,
                           int iShift,
                           byte[] K)
    {
        byte[] baTemp = new byte[24];

        I(baTemp, A, B, C);

        Add(baTemp, D);

        Add(baTemp, E);

        Add(baTemp, K);

        RotateShiftLeft(baTemp, iShift);

        Add(baTemp, A);

        for (int l = 0; l < 24; ++l)
        {
            D[l] = baTemp[l];
        }
    }

    private static void TrinaryHashCode(byte[] A,
                                        byte[] B,
                                        byte[] C,
                                        byte[] D,
                                        byte[][] E)
    {
        FF(A, B, C, D, E[ 0], iShift11, K0);

        FF(B, C, D, A, E[ 1], iShift12, K1);

        FF(C, D, A, B, E[ 2], iShift13, K2);

        FF(D, A, B, C, E[ 3], iShift14, K3);

        FF(A, B, C, D, E[ 4], iShift11, K4);

        FF(B, C, D, A, E[ 5], iShift12, K5);

        FF(C, D, A, B, E[ 6], iShift13, K6);

        FF(D, A, B, C, E[ 7], iShift14, K7);

        FF(A, B, C, D, E[ 8], iShift11, K8);

        FF(B, C, D, A, E[ 9], iShift12, K9);

        FF(C, D, A, B, E[10], iShift13, K10);

        FF(D, A, B, C, E[11], iShift14, K11);

        FF(A, B, C, D, E[12], iShift11, K12);

        FF(B, C, D, A, E[13], iShift12, K13);

        FF(C, D, A, B, E[14], iShift13, K14);

        FF(D, A, B, C, E[15], iShift14, K15);

        GG(A, B, C, D, E[ 1], iShift21, K16);

        GG(D, A, B, C, E[ 6], iShift22, K17);

        GG(C, D, A, B, E[11], iShift23, K18);

        GG(B, C, D, A, E[ 0], iShift24, K19);

        GG(A, B, C, D, E[ 5], iShift21, K20);

        GG(D, A, B, C, E[10], iShift22, K21);

        GG(C, D, A, B, E[15], iShift23, K22);

        GG(B, C, D, A, E[ 4], iShift24, K23);

        GG(A, B, C, D, E[ 9], iShift21, K24);

        GG(D, A, B, C, E[14], iShift22, K25);

        GG(C, D, A, B, E[ 3], iShift23, K26);

        GG(B, C, D, A, E[ 8], iShift24, K27);

        GG(A, B, C, D, E[13], iShift21, K28);

        GG(D, A, B, C, E[ 2], iShift22, K29);

        GG(C, D, A, B, E[ 7], iShift23, K30);

        GG(B, C, D, A, E[12], iShift24, K31);

        HH(A, B, C, D, E[ 5], iShift31, K32);

        HH(B, C, D, A, E[ 8], iShift32, K33);

        HH(C, D, A, B, E[11], iShift33, K34);

        HH(D, A, B, C, E[14], iShift34, K35);

        HH(A, B, C, D, E[ 1], iShift31, K36);

        HH(B, C, D, A, E[ 4], iShift32, K37);

        HH(C, D, A, B, E[ 7], iShift33, K38);

        HH(D, A, B, C, E[10], iShift34, K39);

        HH(A, B, C, D, E[13], iShift31, K40);

        HH(B, C, D, A, E[ 0], iShift32, K41);

        HH(C, D, A, B, E[ 3], iShift33, K42);

        HH(D, A, B, C, E[ 6], iShift34, K43);

        HH(A, B, C, D, E[ 9], iShift31, K44);

        HH(B, C, D, A, E[12], iShift32, K45);

        HH(C, D, A, B, E[15], iShift33, K46);

        HH(D, A, B, C, E[ 2], iShift34, K47);

        II(A, B, C, D, E[ 0], iShift41, K48);

        II(D, A, B, C, E[ 7], iShift42, K49);

        II(C, D, A, B, E[14], iShift43, K50);

        II(B, C, D, A, E[ 5], iShift44, K51);

        II(A, B, C, D, E[12], iShift41, K52);

        II(D, A, B, C, E[ 3], iShift42, K53);

        II(C, D, A, B, E[10], iShift43, K54);

        II(B, C, D, A, E[ 1], iShift44, K55);

        II(A, B, C, D, E[ 8], iShift41, K56);

        II(D, A, B, C, E[15], iShift42, K57);

        II(C, D, A, B, E[ 6], iShift43, K58);

        II(B, C, D, A, E[13], iShift44, K59);

        II(A, B, C, D, E[ 4], iShift41, K60);

        II(D, A, B, C, E[11], iShift42, K61);

        II(C, D, A, B, E[ 2], iShift43, K62);

        II(B, C, D, A, E[ 9], iShift44, K63);
    }

    public static void main(String[] args)
    {
        if (args.length != 1)
        {
            Usage();
        }
        else
        {
            File fdData = new File(args[0]);

            long lFileSize = fdData.length();

            if (lFileSize == 0)
            {
                System.out.printf("There is no data in file [%s], 0 byte.\n", args[0]);

                System.exit(-1);
            }

            long lBytesLeft = lFileSize & 63;

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

            byte[] baData = new byte[(int)lBytesLeft];

            try
            {
                FileInputStream fisData = new FileInputStream(fdData);

                fisData.read(baData, 0, (int)lFileSize);

                fisData.close();
            }
            catch(Exception e)
            {
                e.printStackTrace();
            }

            for (int i = 0; i < 5; ++i)
            {
                baData[i + (int)lFileSize] = (byte)(lFileSize >>> 8 * i & 255);
            }

            for (int j = (int)(lFileSize + 5), k = 0; j < (int)(lBytesLeft - 5); ++j, ++k)
            {
                baData[j] = baPadding[k];
            }

            for (int l = 5; l > 0; --l)
            {
                baData[(int)(lBytesLeft - l)] = (byte)(lFileSize >>> 8 * (l - 1) & 255);
            }

            byte[] baMessageDigest0 = {1, 2, 1, 0, 0, 0, 2, 1, 2, 1, 0, 0, 0, 1, 0, 0, 1, 0, 1, 0, 1, 1, 1, 0},

                   baMessageDigest1 = {2, 2, 1, 2, 1, 0, 0, 2, 2, 0, 2, 0, 1, 1, 0, 2, 2, 0, 2, 0, 1, 0, 0, 1},

                   baMessageDigest2 = {2, 1, 2, 2, 2, 0, 1, 2, 1, 1, 2, 0, 0, 0, 1, 0, 2, 0, 2, 0, 0, 2, 1, 0},

                   baMessageDigest3 = {1, 1, 2, 0, 1, 0, 0, 2, 1, 2, 0, 0, 2, 2, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0};

            byte[][] baTrinary = new byte[16][24];

            for (int i = 0; i < (int)lBytesLeft; i += 64)
            {
                for (int j = 0; j < 16; ++j)
                {
                    Trinary(baTrinary[j], ((long)baData[i + 4 * j] & 255) + (((long)baData[i + 4 * j + 1] & 255) << 8) + (((long)baData[i + 4 * j + 2] & 255) << 16) + (((long)baData[i + 4 * j + 3] & 255) << 24));
                }

                TrinaryHashCode(baMessageDigest0, baMessageDigest1, baMessageDigest2, baMessageDigest3, baTrinary);
            }

            for (int k = 0; k < 24; ++k)
            {
                System.out.printf("%d%d%d%d", baMessageDigest0[k], baMessageDigest1[k], baMessageDigest2[k], baMessageDigest3[k]);
            }

            System.out.println();
        }
    }
}