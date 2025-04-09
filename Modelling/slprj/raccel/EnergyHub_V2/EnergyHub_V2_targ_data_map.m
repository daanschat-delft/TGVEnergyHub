    function targMap = targDataMap(),

    ;%***********************
    ;% Create Parameter Map *
    ;%***********************
    
        nTotData      = 0; %add to this count as we go
        nTotSects     = 1;
        sectIdxOffset = 0;

        ;%
        ;% Define dummy sections & preallocate arrays
        ;%
        dumSection.nData = -1;
        dumSection.data  = [];

        dumData.logicalSrcIdx = -1;
        dumData.dtTransOffset = -1;

        ;%
        ;% Init/prealloc paramMap
        ;%
        paramMap.nSections           = nTotSects;
        paramMap.sectIdxOffset       = sectIdxOffset;
            paramMap.sections(nTotSects) = dumSection; %prealloc
        paramMap.nTotData            = -1;

        ;%
        ;% Auto data (rtP)
        ;%
            section.nData     = 100;
            section.data(100)  = dumData; %prealloc

                    ;% rtP.Electrolysercontroller_SoCmin
                    section.data(1).logicalSrcIdx = 0;
                    section.data(1).dtTransOffset = 0;

                    ;% rtP.Electrolysercontroller_TimeUntilStart
                    section.data(2).logicalSrcIdx = 1;
                    section.data(2).dtTransOffset = 1;

                    ;% rtP.Constant_Value
                    section.data(3).logicalSrcIdx = 2;
                    section.data(3).dtTransOffset = 2;

                    ;% rtP.Constant_Value_odsjjxhutl
                    section.data(4).logicalSrcIdx = 3;
                    section.data(4).dtTransOffset = 3;

                    ;% rtP.TransportDelay_Delay
                    section.data(5).logicalSrcIdx = 4;
                    section.data(5).dtTransOffset = 4;

                    ;% rtP.TransportDelay_InitOutput
                    section.data(6).logicalSrcIdx = 5;
                    section.data(6).dtTransOffset = 5;

                    ;% rtP.m2_Gain
                    section.data(7).logicalSrcIdx = 6;
                    section.data(7).dtTransOffset = 6;

                    ;% rtP.eff_Gain
                    section.data(8).logicalSrcIdx = 7;
                    section.data(8).dtTransOffset = 7;

                    ;% rtP.Delay_InitialCondition
                    section.data(9).logicalSrcIdx = 8;
                    section.data(9).dtTransOffset = 8;

                    ;% rtP.Gain4_Gain
                    section.data(10).logicalSrcIdx = 9;
                    section.data(10).dtTransOffset = 9;

                    ;% rtP.CurrentFilter_A
                    section.data(11).logicalSrcIdx = 10;
                    section.data(11).dtTransOffset = 10;

                    ;% rtP.CurrentFilter_C
                    section.data(12).logicalSrcIdx = 11;
                    section.data(12).dtTransOffset = 11;

                    ;% rtP.Initialit_InitialCondition
                    section.data(13).logicalSrcIdx = 12;
                    section.data(13).dtTransOffset = 12;

                    ;% rtP.CoulombCounter_UpperSat
                    section.data(14).logicalSrcIdx = 13;
                    section.data(14).dtTransOffset = 13;

                    ;% rtP.CoulombCounter_LowerSat
                    section.data(15).logicalSrcIdx = 14;
                    section.data(15).dtTransOffset = 14;

                    ;% rtP.Gain1_Gain
                    section.data(16).logicalSrcIdx = 15;
                    section.data(16).dtTransOffset = 15;

                    ;% rtP.TransferFcn1_A
                    section.data(17).logicalSrcIdx = 16;
                    section.data(17).dtTransOffset = 16;

                    ;% rtP.TransferFcn1_C
                    section.data(18).logicalSrcIdx = 17;
                    section.data(18).dtTransOffset = 17;

                    ;% rtP.Saturation_UpperSat
                    section.data(19).logicalSrcIdx = 18;
                    section.data(19).dtTransOffset = 18;

                    ;% rtP.Saturation_LowerSat
                    section.data(20).logicalSrcIdx = 19;
                    section.data(20).dtTransOffset = 19;

                    ;% rtP.FromWorkspace_Time0
                    section.data(21).logicalSrcIdx = 20;
                    section.data(21).dtTransOffset = 20;

                    ;% rtP.FromWorkspace_Data0
                    section.data(22).logicalSrcIdx = 21;
                    section.data(22).dtTransOffset = 52580;

                    ;% rtP.kWtoW_Gain
                    section.data(23).logicalSrcIdx = 22;
                    section.data(23).dtTransOffset = 105140;

                    ;% rtP.Switch1_Threshold
                    section.data(24).logicalSrcIdx = 23;
                    section.data(24).dtTransOffset = 105141;

                    ;% rtP.Switch_Threshold
                    section.data(25).logicalSrcIdx = 24;
                    section.data(25).dtTransOffset = 105142;

                    ;% rtP.Gain_Gain
                    section.data(26).logicalSrcIdx = 25;
                    section.data(26).dtTransOffset = 105143;

                    ;% rtP.Converter_Gain
                    section.data(27).logicalSrcIdx = 26;
                    section.data(27).dtTransOffset = 105144;

                    ;% rtP.ToCurrent_Gain
                    section.data(28).logicalSrcIdx = 27;
                    section.data(28).dtTransOffset = 105145;

                    ;% rtP.ofbatteries_Gain
                    section.data(29).logicalSrcIdx = 28;
                    section.data(29).dtTransOffset = 105146;

                    ;% rtP.StateSpace_P1_Size
                    section.data(30).logicalSrcIdx = 29;
                    section.data(30).dtTransOffset = 105147;

                    ;% rtP.StateSpace_P1
                    section.data(31).logicalSrcIdx = 30;
                    section.data(31).dtTransOffset = 105149;

                    ;% rtP.StateSpace_P2_Size
                    section.data(32).logicalSrcIdx = 31;
                    section.data(32).dtTransOffset = 105152;

                    ;% rtP.StateSpace_P2
                    section.data(33).logicalSrcIdx = 32;
                    section.data(33).dtTransOffset = 105154;

                    ;% rtP.StateSpace_P3_Size
                    section.data(34).logicalSrcIdx = 33;
                    section.data(34).dtTransOffset = 105158;

                    ;% rtP.StateSpace_P4_Size
                    section.data(35).logicalSrcIdx = 35;
                    section.data(35).dtTransOffset = 105160;

                    ;% rtP.StateSpace_P4
                    section.data(36).logicalSrcIdx = 36;
                    section.data(36).dtTransOffset = 105162;

                    ;% rtP.donotdeletethisgain_Gain
                    section.data(37).logicalSrcIdx = 37;
                    section.data(37).dtTransOffset = 105300;

                    ;% rtP.Gain1_Gain_plyejubh1e
                    section.data(38).logicalSrcIdx = 38;
                    section.data(38).dtTransOffset = 105301;

                    ;% rtP.Saturation_UpperSat_k3bm0knlts
                    section.data(39).logicalSrcIdx = 39;
                    section.data(39).dtTransOffset = 105302;

                    ;% rtP.Saturation_LowerSat_gtsxumhbdz
                    section.data(40).logicalSrcIdx = 40;
                    section.data(40).dtTransOffset = 105303;

                    ;% rtP.Integrator_IC
                    section.data(41).logicalSrcIdx = 41;
                    section.data(41).dtTransOffset = 105304;

                    ;% rtP.Gain1_Gain_fxb1m5rhch
                    section.data(42).logicalSrcIdx = 42;
                    section.data(42).dtTransOffset = 105305;

                    ;% rtP.Integrator1_IC
                    section.data(43).logicalSrcIdx = 43;
                    section.data(43).dtTransOffset = 105306;

                    ;% rtP.Gain3_Gain
                    section.data(44).logicalSrcIdx = 44;
                    section.data(44).dtTransOffset = 105307;

                    ;% rtP.Integrator1_IC_fwv4cigl40
                    section.data(45).logicalSrcIdx = 45;
                    section.data(45).dtTransOffset = 105308;

                    ;% rtP.Gain1_Gain_nz2osdhexb
                    section.data(46).logicalSrcIdx = 46;
                    section.data(46).dtTransOffset = 105309;

                    ;% rtP.Integrator2_IC
                    section.data(47).logicalSrcIdx = 47;
                    section.data(47).dtTransOffset = 105310;

                    ;% rtP.Gain4_Gain_e2mkjz4tqt
                    section.data(48).logicalSrcIdx = 48;
                    section.data(48).dtTransOffset = 105311;

                    ;% rtP.Integrator_IC_i21dmpskwh
                    section.data(49).logicalSrcIdx = 49;
                    section.data(49).dtTransOffset = 105312;

                    ;% rtP.perhour_Gain
                    section.data(50).logicalSrcIdx = 50;
                    section.data(50).dtTransOffset = 105313;

                    ;% rtP.H2Density_Gain
                    section.data(51).logicalSrcIdx = 51;
                    section.data(51).dtTransOffset = 105314;

                    ;% rtP.Integrator1_IC_g5lsixmxdm
                    section.data(52).logicalSrcIdx = 52;
                    section.data(52).dtTransOffset = 105315;

                    ;% rtP.perhour1_Gain
                    section.data(53).logicalSrcIdx = 53;
                    section.data(53).dtTransOffset = 105316;

                    ;% rtP.H2Density1_Gain
                    section.data(54).logicalSrcIdx = 54;
                    section.data(54).dtTransOffset = 105317;

                    ;% rtP.Gain_Gain_iqqmbwk0e2
                    section.data(55).logicalSrcIdx = 55;
                    section.data(55).dtTransOffset = 105318;

                    ;% rtP.gNLtokWh_Gain
                    section.data(56).logicalSrcIdx = 56;
                    section.data(56).dtTransOffset = 105319;

                    ;% rtP.Gain_Gain_jt2wimow1f
                    section.data(57).logicalSrcIdx = 57;
                    section.data(57).dtTransOffset = 105320;

                    ;% rtP.Integrator_IC_nsg0kjcgu1
                    section.data(58).logicalSrcIdx = 58;
                    section.data(58).dtTransOffset = 105321;

                    ;% rtP.Gain3_Gain_l0e401elkp
                    section.data(59).logicalSrcIdx = 59;
                    section.data(59).dtTransOffset = 105322;

                    ;% rtP.gNLtokWh1_Gain
                    section.data(60).logicalSrcIdx = 60;
                    section.data(60).dtTransOffset = 105323;

                    ;% rtP.Gain2_Gain
                    section.data(61).logicalSrcIdx = 61;
                    section.data(61).dtTransOffset = 105324;

                    ;% rtP.tokg_Gain
                    section.data(62).logicalSrcIdx = 62;
                    section.data(62).dtTransOffset = 105325;

                    ;% rtP.tokg2_Gain
                    section.data(63).logicalSrcIdx = 63;
                    section.data(63).dtTransOffset = 105326;

                    ;% rtP.Integrator_IC_jzifrmxlwd
                    section.data(64).logicalSrcIdx = 64;
                    section.data(64).dtTransOffset = 105327;

                    ;% rtP.Gain_Gain_nzjb0vbdhq
                    section.data(65).logicalSrcIdx = 65;
                    section.data(65).dtTransOffset = 105328;

                    ;% rtP.Integrator_IC_lzmn2te2uh
                    section.data(66).logicalSrcIdx = 66;
                    section.data(66).dtTransOffset = 105329;

                    ;% rtP.Gain_Gain_lkepalan24
                    section.data(67).logicalSrcIdx = 67;
                    section.data(67).dtTransOffset = 105330;

                    ;% rtP.Integrator_IC_ixmnm2v2k2
                    section.data(68).logicalSrcIdx = 68;
                    section.data(68).dtTransOffset = 105331;

                    ;% rtP.Gain2_Gain_fwxb10mf54
                    section.data(69).logicalSrcIdx = 69;
                    section.data(69).dtTransOffset = 105332;

                    ;% rtP.Integrator2_IC_izj4dymskh
                    section.data(70).logicalSrcIdx = 70;
                    section.data(70).dtTransOffset = 105333;

                    ;% rtP.Gain_Gain_a2gr5bvahu
                    section.data(71).logicalSrcIdx = 71;
                    section.data(71).dtTransOffset = 105334;

                    ;% rtP.Gain_Gain_jsklo00cx1
                    section.data(72).logicalSrcIdx = 72;
                    section.data(72).dtTransOffset = 105335;

                    ;% rtP.Gain1_Gain_f1lo10iae3
                    section.data(73).logicalSrcIdx = 73;
                    section.data(73).dtTransOffset = 105336;

                    ;% rtP.Gain2_Gain_pdmsmoivym
                    section.data(74).logicalSrcIdx = 74;
                    section.data(74).dtTransOffset = 105337;

                    ;% rtP.Integrator_IC_dxszohgzae
                    section.data(75).logicalSrcIdx = 75;
                    section.data(75).dtTransOffset = 105338;

                    ;% rtP.Gain_Gain_kzu1g10xje
                    section.data(76).logicalSrcIdx = 76;
                    section.data(76).dtTransOffset = 105339;

                    ;% rtP.Integrator1_IC_n4hyedwkjh
                    section.data(77).logicalSrcIdx = 77;
                    section.data(77).dtTransOffset = 105340;

                    ;% rtP.perhour_Gain_ljfjkw1syf
                    section.data(78).logicalSrcIdx = 78;
                    section.data(78).dtTransOffset = 105341;

                    ;% rtP.H2Density_Gain_nbhhfd3fwa
                    section.data(79).logicalSrcIdx = 79;
                    section.data(79).dtTransOffset = 105342;

                    ;% rtP.gNLtokWh_Gain_gxlrclrqbo
                    section.data(80).logicalSrcIdx = 80;
                    section.data(80).dtTransOffset = 105343;

                    ;% rtP.Gain1_Gain_eqxfa3sskl
                    section.data(81).logicalSrcIdx = 81;
                    section.data(81).dtTransOffset = 105344;

                    ;% rtP.FCControl_Gain
                    section.data(82).logicalSrcIdx = 82;
                    section.data(82).dtTransOffset = 105345;

                    ;% rtP.ElecControl_Gain
                    section.data(83).logicalSrcIdx = 83;
                    section.data(83).dtTransOffset = 105346;

                    ;% rtP.FromWorkspace1_Time0
                    section.data(84).logicalSrcIdx = 84;
                    section.data(84).dtTransOffset = 105347;

                    ;% rtP.FromWorkspace1_Data0
                    section.data(85).logicalSrcIdx = 85;
                    section.data(85).dtTransOffset = 632373;

                    ;% rtP.Constant_Value_l4asnk125a
                    section.data(86).logicalSrcIdx = 86;
                    section.data(86).dtTransOffset = 1159399;

                    ;% rtP.Constant1_Value
                    section.data(87).logicalSrcIdx = 87;
                    section.data(87).dtTransOffset = 1159400;

                    ;% rtP.capacity_Value
                    section.data(88).logicalSrcIdx = 88;
                    section.data(88).dtTransOffset = 1159401;

                    ;% rtP.constantK_Value
                    section.data(89).logicalSrcIdx = 89;
                    section.data(89).dtTransOffset = 1159402;

                    ;% rtP.constantA_Value
                    section.data(90).logicalSrcIdx = 90;
                    section.data(90).dtTransOffset = 1159403;

                    ;% rtP.constantB_Value
                    section.data(91).logicalSrcIdx = 91;
                    section.data(91).dtTransOffset = 1159404;

                    ;% rtP.Constant1_Value_d1yqnarcqp
                    section.data(92).logicalSrcIdx = 92;
                    section.data(92).dtTransOffset = 1159405;

                    ;% rtP.Constant_Value_iilw0smpge
                    section.data(93).logicalSrcIdx = 93;
                    section.data(93).dtTransOffset = 1159406;

                    ;% rtP.Constant_Value_pyyru1d03h
                    section.data(94).logicalSrcIdx = 94;
                    section.data(94).dtTransOffset = 1159407;

                    ;% rtP.Constant1_Value_ne4ps45m3u
                    section.data(95).logicalSrcIdx = 95;
                    section.data(95).dtTransOffset = 1159408;

                    ;% rtP.Constant2_Value
                    section.data(96).logicalSrcIdx = 96;
                    section.data(96).dtTransOffset = 1159409;

                    ;% rtP.Constant3_Value
                    section.data(97).logicalSrcIdx = 97;
                    section.data(97).dtTransOffset = 1159410;

                    ;% rtP.Constant4_Value
                    section.data(98).logicalSrcIdx = 98;
                    section.data(98).dtTransOffset = 1159411;

                    ;% rtP.Constant5_Value
                    section.data(99).logicalSrcIdx = 99;
                    section.data(99).dtTransOffset = 1159412;

                    ;% rtP.Constant6_Value
                    section.data(100).logicalSrcIdx = 100;
                    section.data(100).dtTransOffset = 1159413;

            nTotData = nTotData + section.nData;
            paramMap.sections(1) = section;
            clear section


            ;%
            ;% Non-auto Data (parameter)
            ;%


        ;%
        ;% Add final counts to struct.
        ;%
        paramMap.nTotData = nTotData;



    ;%**************************
    ;% Create Block Output Map *
    ;%**************************
    
        nTotData      = 0; %add to this count as we go
        nTotSects     = 2;
        sectIdxOffset = 0;

        ;%
        ;% Define dummy sections & preallocate arrays
        ;%
        dumSection.nData = -1;
        dumSection.data  = [];

        dumData.logicalSrcIdx = -1;
        dumData.dtTransOffset = -1;

        ;%
        ;% Init/prealloc sigMap
        ;%
        sigMap.nSections           = nTotSects;
        sigMap.sectIdxOffset       = sectIdxOffset;
            sigMap.sections(nTotSects) = dumSection; %prealloc
        sigMap.nTotData            = -1;

        ;%
        ;% Auto data (rtB)
        ;%
            section.nData     = 80;
            section.data(80)  = dumData; %prealloc

                    ;% rtB.kdj0wd20st
                    section.data(1).logicalSrcIdx = 0;
                    section.data(1).dtTransOffset = 0;

                    ;% rtB.bjtcxgmpqj
                    section.data(2).logicalSrcIdx = 1;
                    section.data(2).dtTransOffset = 1;

                    ;% rtB.nwzw2cabkb
                    section.data(3).logicalSrcIdx = 2;
                    section.data(3).dtTransOffset = 2;

                    ;% rtB.ouasx5k4la
                    section.data(4).logicalSrcIdx = 3;
                    section.data(4).dtTransOffset = 3;

                    ;% rtB.eqdufgyd0i
                    section.data(5).logicalSrcIdx = 4;
                    section.data(5).dtTransOffset = 4;

                    ;% rtB.h3g4uraxas
                    section.data(6).logicalSrcIdx = 5;
                    section.data(6).dtTransOffset = 5;

                    ;% rtB.oqv5gnpllh
                    section.data(7).logicalSrcIdx = 6;
                    section.data(7).dtTransOffset = 6;

                    ;% rtB.dljrf0twcu
                    section.data(8).logicalSrcIdx = 7;
                    section.data(8).dtTransOffset = 7;

                    ;% rtB.bnvvu0qvwc
                    section.data(9).logicalSrcIdx = 8;
                    section.data(9).dtTransOffset = 8;

                    ;% rtB.ctvyoinwip
                    section.data(10).logicalSrcIdx = 9;
                    section.data(10).dtTransOffset = 9;

                    ;% rtB.nym54hvbil
                    section.data(11).logicalSrcIdx = 10;
                    section.data(11).dtTransOffset = 10;

                    ;% rtB.abcmlgbsh5
                    section.data(12).logicalSrcIdx = 11;
                    section.data(12).dtTransOffset = 11;

                    ;% rtB.khw32w04mg
                    section.data(13).logicalSrcIdx = 12;
                    section.data(13).dtTransOffset = 12;

                    ;% rtB.o4443okihv
                    section.data(14).logicalSrcIdx = 13;
                    section.data(14).dtTransOffset = 13;

                    ;% rtB.eqs4mdcynf
                    section.data(15).logicalSrcIdx = 14;
                    section.data(15).dtTransOffset = 14;

                    ;% rtB.ao5gqkewor
                    section.data(16).logicalSrcIdx = 15;
                    section.data(16).dtTransOffset = 15;

                    ;% rtB.ncvgtmhwhn
                    section.data(17).logicalSrcIdx = 16;
                    section.data(17).dtTransOffset = 16;

                    ;% rtB.a40hvnvxl2
                    section.data(18).logicalSrcIdx = 17;
                    section.data(18).dtTransOffset = 17;

                    ;% rtB.kq0lvgf5rj
                    section.data(19).logicalSrcIdx = 18;
                    section.data(19).dtTransOffset = 18;

                    ;% rtB.jqakvxl32d
                    section.data(20).logicalSrcIdx = 19;
                    section.data(20).dtTransOffset = 19;

                    ;% rtB.bvcbx0lvt0
                    section.data(21).logicalSrcIdx = 20;
                    section.data(21).dtTransOffset = 20;

                    ;% rtB.dqtgr0zwkt
                    section.data(22).logicalSrcIdx = 21;
                    section.data(22).dtTransOffset = 21;

                    ;% rtB.cdgypogmey
                    section.data(23).logicalSrcIdx = 22;
                    section.data(23).dtTransOffset = 22;

                    ;% rtB.lr2yhsywn4
                    section.data(24).logicalSrcIdx = 23;
                    section.data(24).dtTransOffset = 23;

                    ;% rtB.fw3rm02212
                    section.data(25).logicalSrcIdx = 24;
                    section.data(25).dtTransOffset = 24;

                    ;% rtB.mg4ho33emc
                    section.data(26).logicalSrcIdx = 25;
                    section.data(26).dtTransOffset = 25;

                    ;% rtB.f2uq5ltgcf
                    section.data(27).logicalSrcIdx = 26;
                    section.data(27).dtTransOffset = 26;

                    ;% rtB.cy1zkcbtmv
                    section.data(28).logicalSrcIdx = 27;
                    section.data(28).dtTransOffset = 27;

                    ;% rtB.n4wv1s50v2
                    section.data(29).logicalSrcIdx = 28;
                    section.data(29).dtTransOffset = 28;

                    ;% rtB.ce2wfw1arr
                    section.data(30).logicalSrcIdx = 29;
                    section.data(30).dtTransOffset = 29;

                    ;% rtB.fy4tgtvso2
                    section.data(31).logicalSrcIdx = 30;
                    section.data(31).dtTransOffset = 30;

                    ;% rtB.gaanaanrln
                    section.data(32).logicalSrcIdx = 31;
                    section.data(32).dtTransOffset = 31;

                    ;% rtB.dsngd5v3lm
                    section.data(33).logicalSrcIdx = 32;
                    section.data(33).dtTransOffset = 32;

                    ;% rtB.aixqvnbip4
                    section.data(34).logicalSrcIdx = 33;
                    section.data(34).dtTransOffset = 33;

                    ;% rtB.ckqez0eyr3
                    section.data(35).logicalSrcIdx = 34;
                    section.data(35).dtTransOffset = 34;

                    ;% rtB.gghhrlvjin
                    section.data(36).logicalSrcIdx = 35;
                    section.data(36).dtTransOffset = 35;

                    ;% rtB.hczhiwtoth
                    section.data(37).logicalSrcIdx = 36;
                    section.data(37).dtTransOffset = 36;

                    ;% rtB.g44snqx1sj
                    section.data(38).logicalSrcIdx = 37;
                    section.data(38).dtTransOffset = 37;

                    ;% rtB.jeunin1rrd
                    section.data(39).logicalSrcIdx = 38;
                    section.data(39).dtTransOffset = 38;

                    ;% rtB.a4d4pu1ubl
                    section.data(40).logicalSrcIdx = 39;
                    section.data(40).dtTransOffset = 39;

                    ;% rtB.o3nss1ju3r
                    section.data(41).logicalSrcIdx = 40;
                    section.data(41).dtTransOffset = 40;

                    ;% rtB.k3y0rqloxm
                    section.data(42).logicalSrcIdx = 41;
                    section.data(42).dtTransOffset = 41;

                    ;% rtB.ghlm4i2igd
                    section.data(43).logicalSrcIdx = 42;
                    section.data(43).dtTransOffset = 42;

                    ;% rtB.g5y2ouvcm1
                    section.data(44).logicalSrcIdx = 43;
                    section.data(44).dtTransOffset = 43;

                    ;% rtB.ghtokxtx2q
                    section.data(45).logicalSrcIdx = 44;
                    section.data(45).dtTransOffset = 44;

                    ;% rtB.oxbturcyxk
                    section.data(46).logicalSrcIdx = 45;
                    section.data(46).dtTransOffset = 45;

                    ;% rtB.cxilc4gk5h
                    section.data(47).logicalSrcIdx = 46;
                    section.data(47).dtTransOffset = 46;

                    ;% rtB.pjt5biyfo1
                    section.data(48).logicalSrcIdx = 47;
                    section.data(48).dtTransOffset = 47;

                    ;% rtB.dsv41uh1g5
                    section.data(49).logicalSrcIdx = 48;
                    section.data(49).dtTransOffset = 48;

                    ;% rtB.jv5inx1nqy
                    section.data(50).logicalSrcIdx = 49;
                    section.data(50).dtTransOffset = 49;

                    ;% rtB.kc1nogvb5f
                    section.data(51).logicalSrcIdx = 50;
                    section.data(51).dtTransOffset = 50;

                    ;% rtB.i14wyyd2gb
                    section.data(52).logicalSrcIdx = 51;
                    section.data(52).dtTransOffset = 51;

                    ;% rtB.nvpl4p0gtr
                    section.data(53).logicalSrcIdx = 52;
                    section.data(53).dtTransOffset = 52;

                    ;% rtB.ekaw0k0fho
                    section.data(54).logicalSrcIdx = 53;
                    section.data(54).dtTransOffset = 53;

                    ;% rtB.mkoq2qjjzd
                    section.data(55).logicalSrcIdx = 54;
                    section.data(55).dtTransOffset = 54;

                    ;% rtB.jcngp1f1we
                    section.data(56).logicalSrcIdx = 55;
                    section.data(56).dtTransOffset = 55;

                    ;% rtB.n5kbnabcmb
                    section.data(57).logicalSrcIdx = 56;
                    section.data(57).dtTransOffset = 56;

                    ;% rtB.pygnx5ravq
                    section.data(58).logicalSrcIdx = 57;
                    section.data(58).dtTransOffset = 57;

                    ;% rtB.bm5bt1wiea
                    section.data(59).logicalSrcIdx = 58;
                    section.data(59).dtTransOffset = 58;

                    ;% rtB.nxoxpca0k4
                    section.data(60).logicalSrcIdx = 59;
                    section.data(60).dtTransOffset = 59;

                    ;% rtB.ivhjg5my2c
                    section.data(61).logicalSrcIdx = 60;
                    section.data(61).dtTransOffset = 60;

                    ;% rtB.eqyq41qgez
                    section.data(62).logicalSrcIdx = 61;
                    section.data(62).dtTransOffset = 61;

                    ;% rtB.exxf3u4dtj
                    section.data(63).logicalSrcIdx = 62;
                    section.data(63).dtTransOffset = 62;

                    ;% rtB.mhsmhjnr20
                    section.data(64).logicalSrcIdx = 63;
                    section.data(64).dtTransOffset = 63;

                    ;% rtB.da2ev5sr00
                    section.data(65).logicalSrcIdx = 64;
                    section.data(65).dtTransOffset = 64;

                    ;% rtB.l5zhjr5dt3
                    section.data(66).logicalSrcIdx = 65;
                    section.data(66).dtTransOffset = 65;

                    ;% rtB.lep1ns4x35
                    section.data(67).logicalSrcIdx = 66;
                    section.data(67).dtTransOffset = 66;

                    ;% rtB.fjwcnkpy02
                    section.data(68).logicalSrcIdx = 67;
                    section.data(68).dtTransOffset = 67;

                    ;% rtB.n1bt1i4ifs
                    section.data(69).logicalSrcIdx = 68;
                    section.data(69).dtTransOffset = 68;

                    ;% rtB.jprg3lhhlv
                    section.data(70).logicalSrcIdx = 69;
                    section.data(70).dtTransOffset = 69;

                    ;% rtB.ntzj3okwja
                    section.data(71).logicalSrcIdx = 70;
                    section.data(71).dtTransOffset = 70;

                    ;% rtB.hmd3qe0b3e
                    section.data(72).logicalSrcIdx = 71;
                    section.data(72).dtTransOffset = 71;

                    ;% rtB.oxrcrnhmlp
                    section.data(73).logicalSrcIdx = 72;
                    section.data(73).dtTransOffset = 72;

                    ;% rtB.k4znm4zmcp
                    section.data(74).logicalSrcIdx = 73;
                    section.data(74).dtTransOffset = 73;

                    ;% rtB.lsedfz3yzy
                    section.data(75).logicalSrcIdx = 74;
                    section.data(75).dtTransOffset = 74;

                    ;% rtB.nrb0v50tfu
                    section.data(76).logicalSrcIdx = 75;
                    section.data(76).dtTransOffset = 75;

                    ;% rtB.nsznj3nlnr
                    section.data(77).logicalSrcIdx = 76;
                    section.data(77).dtTransOffset = 76;

                    ;% rtB.ehd15fjddu
                    section.data(78).logicalSrcIdx = 77;
                    section.data(78).dtTransOffset = 77;

                    ;% rtB.j35sict0yp
                    section.data(79).logicalSrcIdx = 78;
                    section.data(79).dtTransOffset = 78;

                    ;% rtB.p2mvewvzdn
                    section.data(80).logicalSrcIdx = 79;
                    section.data(80).dtTransOffset = 79;

            nTotData = nTotData + section.nData;
            sigMap.sections(1) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% rtB.eeeemhwm1q
                    section.data(1).logicalSrcIdx = 83;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            sigMap.sections(2) = section;
            clear section


            ;%
            ;% Non-auto Data (signal)
            ;%


        ;%
        ;% Add final counts to struct.
        ;%
        sigMap.nTotData = nTotData;



    ;%*******************
    ;% Create DWork Map *
    ;%*******************
    
        nTotData      = 0; %add to this count as we go
        nTotSects     = 5;
        sectIdxOffset = 2;

        ;%
        ;% Define dummy sections & preallocate arrays
        ;%
        dumSection.nData = -1;
        dumSection.data  = [];

        dumData.logicalSrcIdx = -1;
        dumData.dtTransOffset = -1;

        ;%
        ;% Init/prealloc dworkMap
        ;%
        dworkMap.nSections           = nTotSects;
        dworkMap.sectIdxOffset       = sectIdxOffset;
            dworkMap.sections(nTotSects) = dumSection; %prealloc
        dworkMap.nTotData            = -1;

        ;%
        ;% Auto data (rtDW)
        ;%
            section.nData     = 15;
            section.data(15)  = dumData; %prealloc

                    ;% rtDW.nhyja3gqwt
                    section.data(1).logicalSrcIdx = 0;
                    section.data(1).dtTransOffset = 0;

                    ;% rtDW.ahkhj1ysxa
                    section.data(2).logicalSrcIdx = 1;
                    section.data(2).dtTransOffset = 1;

                    ;% rtDW.m4bmhl2a34
                    section.data(3).logicalSrcIdx = 2;
                    section.data(3).dtTransOffset = 2;

                    ;% rtDW.gz3pnon4nx
                    section.data(4).logicalSrcIdx = 3;
                    section.data(4).dtTransOffset = 3;

                    ;% rtDW.lnaxw2zrc2
                    section.data(5).logicalSrcIdx = 4;
                    section.data(5).dtTransOffset = 4;

                    ;% rtDW.i20mz1gcxj
                    section.data(6).logicalSrcIdx = 5;
                    section.data(6).dtTransOffset = 5;

                    ;% rtDW.hnvfx5vd1i
                    section.data(7).logicalSrcIdx = 6;
                    section.data(7).dtTransOffset = 6;

                    ;% rtDW.n4l2yq1mor
                    section.data(8).logicalSrcIdx = 7;
                    section.data(8).dtTransOffset = 7;

                    ;% rtDW.dehnm35xyo
                    section.data(9).logicalSrcIdx = 8;
                    section.data(9).dtTransOffset = 8;

                    ;% rtDW.n3pnso5nem
                    section.data(10).logicalSrcIdx = 9;
                    section.data(10).dtTransOffset = 9;

                    ;% rtDW.k22gwali4k
                    section.data(11).logicalSrcIdx = 10;
                    section.data(11).dtTransOffset = 10;

                    ;% rtDW.pfbyvtpv40
                    section.data(12).logicalSrcIdx = 11;
                    section.data(12).dtTransOffset = 11;

                    ;% rtDW.c2c0ubffon
                    section.data(13).logicalSrcIdx = 12;
                    section.data(13).dtTransOffset = 12;

                    ;% rtDW.pzvz5dlcor.modelTStart
                    section.data(14).logicalSrcIdx = 13;
                    section.data(14).dtTransOffset = 13;

                    ;% rtDW.k50ebsnxib
                    section.data(15).logicalSrcIdx = 14;
                    section.data(15).dtTransOffset = 14;

            nTotData = nTotData + section.nData;
            dworkMap.sections(1) = section;
            clear section

            section.nData     = 20;
            section.data(20)  = dumData; %prealloc

                    ;% rtDW.davmwtffpr.TUbufferPtrs
                    section.data(1).logicalSrcIdx = 15;
                    section.data(1).dtTransOffset = 0;

                    ;% rtDW.kxjbnknxrm.TimePtr
                    section.data(2).logicalSrcIdx = 16;
                    section.data(2).dtTransOffset = 2;

                    ;% rtDW.hec3hro2te
                    section.data(3).logicalSrcIdx = 17;
                    section.data(3).dtTransOffset = 3;

                    ;% rtDW.fmj1jogz4p.LoggedData
                    section.data(4).logicalSrcIdx = 18;
                    section.data(4).dtTransOffset = 25;

                    ;% rtDW.kcfcsbxo32.LoggedData
                    section.data(5).logicalSrcIdx = 19;
                    section.data(5).dtTransOffset = 27;

                    ;% rtDW.o1eiap20zi.LoggedData
                    section.data(6).logicalSrcIdx = 20;
                    section.data(6).dtTransOffset = 28;

                    ;% rtDW.aig2givwcd.LoggedData
                    section.data(7).logicalSrcIdx = 21;
                    section.data(7).dtTransOffset = 31;

                    ;% rtDW.dxcpvvgduj.LoggedData
                    section.data(8).logicalSrcIdx = 22;
                    section.data(8).dtTransOffset = 34;

                    ;% rtDW.drfuttga3k.LoggedData
                    section.data(9).logicalSrcIdx = 23;
                    section.data(9).dtTransOffset = 37;

                    ;% rtDW.j4nzilbghc.LoggedData
                    section.data(10).logicalSrcIdx = 24;
                    section.data(10).dtTransOffset = 40;

                    ;% rtDW.guo5p2sqi4.LoggedData
                    section.data(11).logicalSrcIdx = 25;
                    section.data(11).dtTransOffset = 41;

                    ;% rtDW.efpron2z1b.LoggedData
                    section.data(12).logicalSrcIdx = 26;
                    section.data(12).dtTransOffset = 42;

                    ;% rtDW.npva2ai3id.LoggedData
                    section.data(13).logicalSrcIdx = 27;
                    section.data(13).dtTransOffset = 43;

                    ;% rtDW.gle0z23tyq.LoggedData
                    section.data(14).logicalSrcIdx = 28;
                    section.data(14).dtTransOffset = 46;

                    ;% rtDW.ocmfbgdhuy.LoggedData
                    section.data(15).logicalSrcIdx = 29;
                    section.data(15).dtTransOffset = 48;

                    ;% rtDW.icmdc1ydn1.LoggedData
                    section.data(16).logicalSrcIdx = 30;
                    section.data(16).dtTransOffset = 50;

                    ;% rtDW.ect3mc0knr.LoggedData
                    section.data(17).logicalSrcIdx = 31;
                    section.data(17).dtTransOffset = 52;

                    ;% rtDW.ezo1sjelb2.LoggedData
                    section.data(18).logicalSrcIdx = 32;
                    section.data(18).dtTransOffset = 55;

                    ;% rtDW.ja10jj4iq4.LoggedData
                    section.data(19).logicalSrcIdx = 33;
                    section.data(19).dtTransOffset = 56;

                    ;% rtDW.bbhwh1vhz5.TimePtr
                    section.data(20).logicalSrcIdx = 34;
                    section.data(20).dtTransOffset = 57;

            nTotData = nTotData + section.nData;
            dworkMap.sections(2) = section;
            clear section

            section.nData     = 7;
            section.data(7)  = dumData; %prealloc

                    ;% rtDW.hkfwygdrky
                    section.data(1).logicalSrcIdx = 35;
                    section.data(1).dtTransOffset = 0;

                    ;% rtDW.ba5ijmur1e
                    section.data(2).logicalSrcIdx = 36;
                    section.data(2).dtTransOffset = 1;

                    ;% rtDW.lkcvhohgpx
                    section.data(3).logicalSrcIdx = 37;
                    section.data(3).dtTransOffset = 2;

                    ;% rtDW.aip5ben0ea
                    section.data(4).logicalSrcIdx = 38;
                    section.data(4).dtTransOffset = 3;

                    ;% rtDW.e2cccxfniz
                    section.data(5).logicalSrcIdx = 39;
                    section.data(5).dtTransOffset = 4;

                    ;% rtDW.b4adcsrrdi
                    section.data(6).logicalSrcIdx = 40;
                    section.data(6).dtTransOffset = 5;

                    ;% rtDW.bm0ovdkjsz
                    section.data(7).logicalSrcIdx = 41;
                    section.data(7).dtTransOffset = 6;

            nTotData = nTotData + section.nData;
            dworkMap.sections(3) = section;
            clear section

            section.nData     = 8;
            section.data(8)  = dumData; %prealloc

                    ;% rtDW.iivr2nwogz.Tail
                    section.data(1).logicalSrcIdx = 42;
                    section.data(1).dtTransOffset = 0;

                    ;% rtDW.ilunv1kvnl.PrevIndex
                    section.data(2).logicalSrcIdx = 43;
                    section.data(2).dtTransOffset = 1;

                    ;% rtDW.iwobcsvj0e
                    section.data(3).logicalSrcIdx = 44;
                    section.data(3).dtTransOffset = 2;

                    ;% rtDW.oaq51hxa0o.PrevIndex
                    section.data(4).logicalSrcIdx = 45;
                    section.data(4).dtTransOffset = 25;

                    ;% rtDW.pdgeu0tapy
                    section.data(5).logicalSrcIdx = 46;
                    section.data(5).dtTransOffset = 26;

                    ;% rtDW.m2twtevakk
                    section.data(6).logicalSrcIdx = 47;
                    section.data(6).dtTransOffset = 27;

                    ;% rtDW.b451kvbxbu
                    section.data(7).logicalSrcIdx = 48;
                    section.data(7).dtTransOffset = 28;

                    ;% rtDW.nibcvvr5za
                    section.data(8).logicalSrcIdx = 49;
                    section.data(8).dtTransOffset = 29;

            nTotData = nTotData + section.nData;
            dworkMap.sections(4) = section;
            clear section

            section.nData     = 35;
            section.data(35)  = dumData; %prealloc

                    ;% rtDW.eycfaaffbr
                    section.data(1).logicalSrcIdx = 50;
                    section.data(1).dtTransOffset = 0;

                    ;% rtDW.k2mlxmug2z
                    section.data(2).logicalSrcIdx = 51;
                    section.data(2).dtTransOffset = 1;

                    ;% rtDW.gjjksoc35z
                    section.data(3).logicalSrcIdx = 52;
                    section.data(3).dtTransOffset = 2;

                    ;% rtDW.pfejla1kiu
                    section.data(4).logicalSrcIdx = 53;
                    section.data(4).dtTransOffset = 3;

                    ;% rtDW.mzk1ky2u2c
                    section.data(5).logicalSrcIdx = 54;
                    section.data(5).dtTransOffset = 4;

                    ;% rtDW.k4joo4zpqw
                    section.data(6).logicalSrcIdx = 55;
                    section.data(6).dtTransOffset = 5;

                    ;% rtDW.mwouhr3vx1
                    section.data(7).logicalSrcIdx = 56;
                    section.data(7).dtTransOffset = 6;

                    ;% rtDW.fvmvracqcf
                    section.data(8).logicalSrcIdx = 57;
                    section.data(8).dtTransOffset = 7;

                    ;% rtDW.fqb2qsosrk
                    section.data(9).logicalSrcIdx = 58;
                    section.data(9).dtTransOffset = 8;

                    ;% rtDW.fysmwvxmd3
                    section.data(10).logicalSrcIdx = 59;
                    section.data(10).dtTransOffset = 9;

                    ;% rtDW.md5xeaxvq3
                    section.data(11).logicalSrcIdx = 60;
                    section.data(11).dtTransOffset = 10;

                    ;% rtDW.bekgh2gd4a
                    section.data(12).logicalSrcIdx = 61;
                    section.data(12).dtTransOffset = 11;

                    ;% rtDW.p1nidq2iqu
                    section.data(13).logicalSrcIdx = 62;
                    section.data(13).dtTransOffset = 12;

                    ;% rtDW.k2jke2e322
                    section.data(14).logicalSrcIdx = 63;
                    section.data(14).dtTransOffset = 13;

                    ;% rtDW.d5thh0bmhf
                    section.data(15).logicalSrcIdx = 64;
                    section.data(15).dtTransOffset = 14;

                    ;% rtDW.ensodeql1o
                    section.data(16).logicalSrcIdx = 65;
                    section.data(16).dtTransOffset = 15;

                    ;% rtDW.g5wvczhzto
                    section.data(17).logicalSrcIdx = 66;
                    section.data(17).dtTransOffset = 16;

                    ;% rtDW.kp52o401yy
                    section.data(18).logicalSrcIdx = 67;
                    section.data(18).dtTransOffset = 17;

                    ;% rtDW.ieshbrlpla
                    section.data(19).logicalSrcIdx = 68;
                    section.data(19).dtTransOffset = 18;

                    ;% rtDW.aeg1ehjx1y
                    section.data(20).logicalSrcIdx = 69;
                    section.data(20).dtTransOffset = 19;

                    ;% rtDW.ecvbyd2dtc
                    section.data(21).logicalSrcIdx = 70;
                    section.data(21).dtTransOffset = 20;

                    ;% rtDW.edghx214bz
                    section.data(22).logicalSrcIdx = 71;
                    section.data(22).dtTransOffset = 21;

                    ;% rtDW.brv251zwfg
                    section.data(23).logicalSrcIdx = 72;
                    section.data(23).dtTransOffset = 22;

                    ;% rtDW.gvlowbt3cx
                    section.data(24).logicalSrcIdx = 73;
                    section.data(24).dtTransOffset = 23;

                    ;% rtDW.ivjc2fq1if
                    section.data(25).logicalSrcIdx = 74;
                    section.data(25).dtTransOffset = 24;

                    ;% rtDW.iyd1rcriew
                    section.data(26).logicalSrcIdx = 75;
                    section.data(26).dtTransOffset = 25;

                    ;% rtDW.btnu3kb32b
                    section.data(27).logicalSrcIdx = 76;
                    section.data(27).dtTransOffset = 26;

                    ;% rtDW.dgfvjtboxr
                    section.data(28).logicalSrcIdx = 77;
                    section.data(28).dtTransOffset = 27;

                    ;% rtDW.osazkc2wan
                    section.data(29).logicalSrcIdx = 78;
                    section.data(29).dtTransOffset = 28;

                    ;% rtDW.deumlssnme
                    section.data(30).logicalSrcIdx = 79;
                    section.data(30).dtTransOffset = 29;

                    ;% rtDW.ojr1yp3mmb
                    section.data(31).logicalSrcIdx = 80;
                    section.data(31).dtTransOffset = 30;

                    ;% rtDW.nvwz0xxljo
                    section.data(32).logicalSrcIdx = 81;
                    section.data(32).dtTransOffset = 31;

                    ;% rtDW.cdkg110som
                    section.data(33).logicalSrcIdx = 82;
                    section.data(33).dtTransOffset = 32;

                    ;% rtDW.mnhpzkpq1z
                    section.data(34).logicalSrcIdx = 83;
                    section.data(34).dtTransOffset = 33;

                    ;% rtDW.pq0m50tv3k
                    section.data(35).logicalSrcIdx = 84;
                    section.data(35).dtTransOffset = 34;

            nTotData = nTotData + section.nData;
            dworkMap.sections(5) = section;
            clear section


            ;%
            ;% Non-auto Data (dwork)
            ;%


        ;%
        ;% Add final counts to struct.
        ;%
        dworkMap.nTotData = nTotData;



    ;%
    ;% Add individual maps to base struct.
    ;%

    targMap.paramMap  = paramMap;
    targMap.signalMap = sigMap;
    targMap.dworkMap  = dworkMap;

    ;%
    ;% Add checksums to base struct.
    ;%


    targMap.checksum0 = 3485880188;
    targMap.checksum1 = 1492756646;
    targMap.checksum2 = 1198331750;
    targMap.checksum3 = 4294304960;

