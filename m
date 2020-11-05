Return-Path: <SRS0=vaug=EL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FORGED_HOTMAIL_RCVD2,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30C4BC00A89
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Nov 2020 08:51:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 984DE2083B
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Nov 2020 08:51:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="G/o+XxGl";
	dkim=temperror (0-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="Qw0fE1jN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 984DE2083B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=hotmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=B9TgQNt8QgexzjLn2oOJhZOqIJBA8EO4v2tzenYT4NE=; b=G/o+XxGlo3zuY71dhc7GalzUW0
	lczvkdYtahodhGUMdyBrozzfPMxwA5iDaWdu3VMQ1I4Nn9SrmkDr5gwni2bvpEwfKcsUvoF/c+9LF
	t3F+VbUQ6VQsdi0PzBgqesUgMJY367sCXM9FFxV+SEJGdnMRDJXCs6duLX3JVUEOSn2kXYiTNoXeU
	xdf0GD9/lgA1Ts/Lat2HXK2pk7EYrX1SdFek9zoLKKMZ5ii7r9aXdXzcq4a+cX/Zt4R5oN+YFaEB/
	vFfbzYnNhCKkjphz9kk84avaiIQeMnbY1RxDGGjCo6Eo8kt65+S/ia6b+QaU/pZOcaYbr3tokldUW
	HurSxlGw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kaazL-0005DV-5z; Thu, 05 Nov 2020 08:51:23 +0000
Received: from mail-oln040092253048.outbound.protection.outlook.com
 ([40.92.253.48] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaazH-0005Bu-T8
 for linux-amlogic@lists.infradead.org; Thu, 05 Nov 2020 08:51:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GxDbkMkP8n6i57Txsh4VgoJxfvieDDdiYljTijYnVwNQ/6jpvm6ifcVbF9OUizMhFkqSmAE8t08YbFOOcnnMbhFm6EsHjLSI1L74XV6KrvglX1baHMMIQtKCOTNnADq3frwvqjlFhXPnIWac2jt944jj1/XWoP05MoM2RaG58YKUuIhzTmBYc3J6zJmbH0LKk1/a+yLqWpGbhlQ4+CnA4PcJQPh27EJUk/Chlq9rWZr99ts9Fent+mi1zPl40zZbRNOCLWySREhUEdnElYuy8P6z5j9iaQkAHkOys/4irj321htYmf5Ik9nS4Aa4joxfW/f2f5OErwANXWftgt4+bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iy7K8ER6alHJfJ18SRzCW/QnlOhmCHGGNIw5YtF63bA=;
 b=ayVGyTUXqjk3GkNa2ETa8iUgsIF1cDcsGNu+jIXrCaqFxPCRTBWXSW7QBgwIBLNKP8qakjhMO8ynEkm7r2bEME4T0LHgwrtIhqmXAUslMHFfPR/zVtRiKIuwSxnV4tnMxpi9zzHpAckJgAwiGiFo+1yBME/OYSD9xjIG44c7PneLVRmoSsveyp84UHze+OhHnPGnkAsBgj+ugYzAREQL16Yo9fbRMIrIqhUZmSrqGSKvxMHkD3if39E5A0q0ZiYXm6pbTqMX+oIRXGuQoMg+RDG9w6On6mjc9jPHgVWOhDzQ5LHdsXRio90RIGJIa5Au/mhMMOm5v6VCIDvmdJmLLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iy7K8ER6alHJfJ18SRzCW/QnlOhmCHGGNIw5YtF63bA=;
 b=Qw0fE1jNAJLyc3Atu3ZBpL2R3knAWZVhdq1YuFEk7N2Jansv41eNoPKmTp4uVI6663aONSAnK7fBZkj0P7SNsvF+NL8bIifJ+Nww/5xzY89vnsUL3g1B45gsCAvMFDj/THZ/vZAETyiD/GfW00n/nTk2JJxH4AZlNYFMj5vJobwaEH1ooD3rR685/TqUOcXPIokdfCeCUnbLptf1UGT3vhaStvjS4ZeyvPUF3p871xZuKb7D3eD8mKHga79Mr7asO+x6qULZ9QXEOu8ruA4QhZ6QhcmoHt381OQnPDjbLPYszr27oOBDOIH/x3fOM9/kVNhf3q4jW0HlR5oU09ZlRA==
Received: from HK2APC01FT027.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebc::53) by
 HK2APC01HT056.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebc::368)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3520.15; Thu, 5 Nov
 2020 08:51:12 +0000
Received: from SG2PR03MB4502.apcprd03.prod.outlook.com
 (2a01:111:e400:7ebc::41) by HK2APC01FT027.mail.protection.outlook.com
 (2a01:111:e400:7ebc::179) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3520.15 via Frontend
 Transport; Thu, 5 Nov 2020 08:51:11 +0000
Received: from SG2PR03MB4502.apcprd03.prod.outlook.com
 ([fe80::d849:8be0:f585:49fa]) by SG2PR03MB4502.apcprd03.prod.outlook.com
 ([fe80::d849:8be0:f585:49fa%3]) with mapi id 15.20.3541.021; Thu, 5 Nov 2020
 08:51:04 +0000
From: HK SH <shareahack@hotmail.com>
To: "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>
Subject: Amlogic Text Offset regression
Thread-Topic: Amlogic Text Offset regression
Thread-Index: AQHWs02uileffqx55k+uO2r1b7dfIQ==
Date: Thu, 5 Nov 2020 08:51:04 +0000
Message-ID: <SG2PR03MB450210BE2ED8609110E2D085C2EE0@SG2PR03MB4502.apcprd03.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:4EEB34D093F2B6B3C0A89F94EEED9CD5A482AD2D710102B79B57B3B7A43C28F8;
 UpperCasedChecksum:3C3FDEE93C18F6612956AF8874A875F13A834ABC9914176CFB41A481F6D1B733;
 SizeAsReceived:6610; Count:41
x-tmn: [gfOQvkHs8O2ABby9w/vZPO21VxFcb8j7]
x-ms-publictraffictype: Email
x-incomingheadercount: 41
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: 11d4731e-7b68-4d5b-2085-08d88167ee25
x-ms-traffictypediagnostic: HK2APC01HT056:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IS0M1BMN6YiALJ67B00R6Y/gVIuTjhaAKGEYJ33LBYJc97t1NXVJKrxwY3dwdvkObgRdIYrnN8fVtJ7iK6pmkMB1PjXj5P0hsD4TGRbijq1d5PESBXzGi+bkPQmhSjRHJc9wPWM23EnC7Q6ZyrEBOS/z/7/YVGK5mI7+CpHKzABRFcOYxRLvL7tOQdBDg+oWhUXOVx0RRrqx0F/oaiTiFg==
x-ms-exchange-antispam-messagedata: hqfph7BRhkssSQkZAR/o6PTKJYty2TmTRle9bRzoGHXdsrkm2iJRgOrT9ZTonrSuV4mEjJg/g4QXYrLQI3Y1gd/GSCTwtspyw0xpGj5XdnQxTmN+n/oLPw/F5PKb5K5AzGSXOe3rs1jITA3GEgxDVw==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-AuthSource: HK2APC01FT027.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 11d4731e-7b68-4d5b-2085-08d88167ee25
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2020 08:51:04.8840 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2APC01HT056
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201105_035120_331733_2F82A902 
X-CRM114-Status: GOOD (  13.21  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hello,

Since the text offset patch is removed from the kernel, no amlogic board is able to boot with 5.10-rc. While I can get it to boot only when I have mainline uboot and not all amlogic boards have mainline uboot support.
I have tested Kernel 5.10-rc1 and 5.10.rc2 on Khadas VIm3 with mainline uboot and it works fine but when I try it on Odroid N2 or Odroid C4 then it gets stuck at starting kernel which seems that the kernel load address is not correct or something.
Odroid C4 Log below:
SM1:BL:511f6b:81ca2f;FEAT:A0F83180:20282000;POC:F;RCY:0;EMMC:0;READ:0;0.0;CHK:0;                                                  
bl2_stage_init 0x01                                                                                                                        
bl2_stage_init 0x81                                                                                                                        
hw id: 0x0000 - pwm id 0x01                                                                                                                
bl2_stage_init 0xc1                                                                                                                        
bl2_stage_init 0x02                        
                                           
L0:00000000                                
L1:00000703                                
L2:00008067                                
L3:15000020                                
S1:00000000
B2:20282000
B1:a0f83180

TE: 119887

BL2 Built : 20:29:41, Jun 18 2019. g12a ga659aac - luan.yuan@droid15-sz

Board ID = 1
Set cpu clk to 24M
Set clk81 to 24M
Use GP1_pll as DSU clk.
DSU clk: 1200 Mhz
CPU clk: 1200 MHz
Set clk81 to 166.6M
eMMC boot @ 0
sw8 s
DDR driver_vesion: LPDDR4_PHY_V_0_1_15 build time: Jun 18 2019 20:29:37
board id: 1
Load FIP HDR from eMMC, src: 0x00010200, des: 0xfffd0000, size: 0x00004000, part: 0
fw parse done
Load ddrfw from eMMC, src: 0x00030200, des: 0xfffd0000, size: 0x0000c000, part: 0
Load ddrfw from eMMC, src: 0x0002c200, des: 0xfffd0000, size: 0x00004000, part: 0
PIEI prepare done
fastboot data load
00000000
emmc switch 1 ok
00000000
emmc switch 2 ok
fastboot data verify
verify result: 255
Cfg max: 2, cur: 1. Board id: 255. Force loop cfg
DDR4 probe
ddr clk to 1320MHz
Load ddrfw from eMMC, src: 0x00014200, des: 0xfffd0000, size: 0x0000c000, part: 0
00000000
emmc switch 0 ok

dmc_version 0001
Check phy result
INFO : End of initialization
INFO : End of read enable training
INFO : End of fine write leveling
INFO : End of read dq deskew training
INFO : End of MPR read delay center optimization
INFO : End of Write leveling coarse delay
INFO : End of write delay center optimization
INFO : End of read delay center optimization
INFO : End of max read latency training
INFO : Training has run successfully!
1D training succeed
Load ddrfw from eMMC, src: 0x00020200, des: 0xfffd0000, size: 0x0000c000, part: 0
Check phy result
INFO : End of initialization
INFO : End of 2D read delay Voltage center optimization
INFO : End of 2D write delay Voltage center optimization
INFO : Training has run successfully!

R0_RxClkDly_Margin==106 ps 9
R0_TxDqDly_Margi==118 ps 10


R1_RxClkDly_Margin==0 ps 0
R1_TxDqDly_Margi==0 ps 0

 dwc_ddrphy_apb_wr((0<<20)|(2<<16)|(0<<12)|(0xb0):0001 

soc_vref_reg_value 0x 0000004f 00000051 0000004f 0000004e 00000050 0000004e 0000004e 0000004d 0000004e 0000004f 0000004e 00000050 0000004f 0000004c 0000004e 0000004e 0000004e 0000004d 00000050 0000004f 0000004f 0000004d 0000004d 000001
2D training succeed
aml_ddr_fw_vesion: LPDDR4_PHY_V_0_1_15 build time: Jun 18 2019 20:29:43
auto size-- 65535DDR cs0 size: 2048MB
DDR cs1 size: 2048MB
DMC_DDR_CTRL: 00700024DDR size: 3928MB
cs0 DataBus test pass
cs1 DataBus test pass
cs0 AddrBus test pass
cs1 AddrBus test pass

non-sec scramble use zero key
ddr scramble enabled

100bdlr_step_size ps== 450
result report
boot times 0Enable ddr reg access
00000000
emmc switch 3 ok
Authentication key not yet programmed
get rpmb counter error 0x00000007
00000000
emmc switch 0 ok
Load FIP HDR from eMMC, src: 0x00010200, des: 0x01700000, size: 0x00004000, part: 0
Load BL3X from eMMC, src: 0x0003c200, des: 0x0172c000, size: 0x0009c000, part: 0
bl2z: ptr: 05129330, size: 00001e40
0.0;M3 CHK:0;cm4_sp_mode 0
MVN_1=0x00000000
MVN_2=0x00000000
[Image: g12a_v1.1.3386-3b31431 2019-05-21 10:41:54 luan.yuan@droid15-sz]
OPS=0x10
ring efuse init
2b 0c 10 00 01 31 15 00 00 09 36 30 43 57 50 50 
[0.017354 Inits done]
secure task start!
high task start!
low task start!
run into bl31
NOTICE:  BL31: v1.3(release):4fc40b1
NOTICE:  BL31: Built : 15:57:33, May 22 2019
NOTICE:  BL31: G12A normal boot!
NOTICE:  BL31: BL33 decompress pass
ERROR:   Error initializing runtime service opteed_fast


U-Boot 2015.01 (Apr 14 2020 - 01:55:53)

DRAM:  3.5 GiB
Relocation Offset is: d6eef000
spi_post_bind(spifc): req_seq = 0
register usb cfg[0][1] = 00000000d7f83b88
MMC:   aml_priv->desc_buf = 0x00000000d3edf7c0
aml_priv->desc_buf = 0x00000000d3ee1b00
SDIO Port C: 0, SDIO Port B: 1
co-phase 0x2, tx-dly 0, clock 400000
co-phase 0x2, tx-dly 0, clock 400000
co-phase 0x2, tx-dly 0, clock 400000
emmc/sd response timeout, cmd8, status=0x1ff2800
emmc/sd response timeout, cmd55, status=0x1ff2800
co-phase 0x2, tx-dly 0, clock 400000
co-phase 0x2, tx-dly 0, clock 40000000
aml_sd_retry_refix[983]:delay = 0x0,gadjust =0x142000
[mmc_startup] mmc refix success
[mmc_init] mmc init success
In:    serial
Out:   serial
Err:   serial
vpu: error: vpu: check dts: FDT_ERR_BADMAGIC, load default parameters
vpu: driver version: v20190313
vpu: detect chip type: 12
vpu: clk_level default: 7(666667000Hz), max: 7(666667000Hz)
vpu: clk_level = 7
vpu: vpu_power_on
vpu: set_vpu_clk
vpu: set clk: 666667000Hz, readback: 666666667Hz(0x100)
vpu: set_vpu_clk finish
vpu: vpu_module_init_config
vpp: vpp_init
vpp: g12a/b osd1 matrix rgb2yuv ..............
vpp: g12a/b osd2 matrix rgb2yuv..............
vpp: g12a/b osd3 matrix rgb2yuv..............
cvbs: cpuid:0x2b
cvbs_config_hdmipll_g12a
cvbs_set_vid2_clk
reading boot-logo.bmp.gz
** Unable to read file boot-logo.bmp.gz **
reading boot-logo.bmp
** Unable to read file boot-logo.bmp **
movi: not registered partition name, logo
movi - Read/write command from/to SD/MMC for ODROID board

Usage:
movi <read|write> <partition|sector> <offset> <address> [<length>]
    - <read|write>  the command to access the storage
    - <offset>  the offset from the start of given partiton in lba
    - <address>  the memory address to load/store from/to the storage device
    - [<length>]  the size of the block to read/write in bytes
    - all parameters must be hexa-decimal only

[OSD]check dts: FDT_ERR_BADMAGIC, load default fb_addr parameters
[OSD]set initrd_high: 0x3d800000
[OSD]fb_addr for logo: 0x3d800000
[OSD]check dts: FDT_ERR_BADMAGIC, load default fb_addr parameters
[OSD]fb_addr for logo: 0x3d800000
[OSD]VPP_OFIFO_SIZE:0xfff01fff
[CANVAS]canvas init
[CANVAS]addr=0x3d800000 width=5760, height=2160
cvbs: outputmode[1080p60hz] is invalid
vpp: vpp_matrix_update: 2
set hdmitx VIC = 16
config HPLL = 5940000 frac_rate = 1
HPLL: 0x3b3a04f7
HPLL: 0x1b3a04f7
HPLLv1: 0xdb3a04f7
config HPLL done
j = 6  vid_clk_div = 1
hdmitx phy setting done
hdmitx: set enc for VIC: 16
enc_vpu_bridge_reset[1319]
rx version is 1.4 or below  div=10
USB3.0 XHCI init start
Net:   dwmac.ff3f0000
Hit Enter or space or Ctrl+C key to stop autoboot -- :  0 
## Attempting fetch boot.ini in mmc:0...
reading boot.ini
729 bytes read in 3 ms (237.3 KiB/s)
## Executing script at 04000000
reading /Image
33964544 bytes read in 1112 ms (29.1 MiB/s)
reading /dtbs/amlogic/meson-sm1-odroid-c4.dtb
71789 bytes read in 19 ms (3.6 MiB/s)
reading /initramfs-linux.uimg
8448788 bytes read in 277 ms (29.1 MiB/s)
[rsvmem] get fdtaddr NULL!
rsvmem - reserve memory

Usage:
rsvmem check                   - check reserved memory
rsvmem dump                    - dump reserved memory

rsvmem check failed
## Loading init Ramdisk from Legacy Image at 03080000 ...
   Image Name:   Ramdisk Image
   Image Type:   AArch64 Linux RAMDisk Image (uncompressed)
   Data Size:    8448724 Bytes = 8.1 MiB
   Load Address: 00000000
   Entry Point:  00000000
   Verifying Checksum ... OK
active_slot is <NULL>
Unknown command 'store' - try 'help'
No dtbo patitions found
load dtb from 0x1000000 ......
## Flattened Device Tree blob at 20000000
   Booting using the fdt blob at 0x20000000
libfdt fdt_path_offset() returned FDT_ERR_NOTFOUND
No valid dtbo image found
libfdt fdt_path_offset() returned FDT_ERR_NOTFOUND
[rsvmem] fdt get prop fail.
   Loading Ramdisk to 3cff1000, end 3d7ffad4 ... OK
   Loading Device Tree to 000000001ffeb000, end 000000001ffff86c ... OK

Starting kernel ...

uboot time: 5251814 us


Kindly advice what is the plan forward in regards to run mainline kernel on amlogic boards which does not have mainline uboot 

Furkan Kardame,
Manjaro ARM Team.


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
