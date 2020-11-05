Return-Path: <SRS0=vaug=EL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FORGED_HOTMAIL_RCVD2,FORGED_MUA_MOZILLA,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69D55C00A89
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Nov 2020 09:13:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1F6A2071A
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Nov 2020 09:13:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VMiHuRm6";
	dkim=temperror (0-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="BXIj94o4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D1F6A2071A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=hotmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+SLNSkrXr8dyLJb8T6cr+OKdAtCy5QTsP6mN7DtjziE=; b=VMiHuRm63RM/k1iAHTO8NSWl+
	osAojhhujCmTkb20iUbqYka2B6ZIEXCGK+pYT/gsQYMh7ZfiSPkKXm9sgML3SxvtOaVKm9ON3VbVM
	7MAj2lhUvdCY6MO5rtGWkeTOYVtXJ6I+9xoG9ng82F3GRwJPK6GHiyPhXb9pHjOdZAh6EV+Ik9Yj5
	wZD2ucSDow3Hbh5lFwi/0IrkDQcdX+YsjSixc3U58zSSuIuPDJjnegg3/spbt+mmmOs98/AulWq0J
	faN6Np/jNsAPEiLtUwvGj63R2QCMABS66EPLt/ZtogsAyo7dn/ZI2IDuM2LVgJeRjMLVT97gQYQCa
	daGxflHyQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kabKD-0000Df-BN; Thu, 05 Nov 2020 09:12:57 +0000
Received: from mail-oln040092254078.outbound.protection.outlook.com
 ([40.92.254.78] helo=APC01-PU1-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kabK9-0000C4-Nu
 for linux-amlogic@lists.infradead.org; Thu, 05 Nov 2020 09:12:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pww9RMBGvA1xSEXaCN0ca7Z061poYDzfXpE6ECKY+hVXovdgQcTzUpaYWPOYsPczBwr67K6CcUOjDao1vvv89CUdZU6e4NJGuUfgRc/qOQwuLr9eIpFNMr9BtFsKZn1IEBtvPn+y8QLeHAa5HpU2vKAvnyiYzUcx6iWj4qhd3Iqq4QY+imeEqMww1sfrig2mdtj/y8FYWkCzeMw2Tw5oUyDLBLJTVuXvRTouNS+qwpc8F9jk2clpio/VUZilpHVkpCNM9+Qt83SgDTPv5U3e5Hfqa4qbHDu1TQzDYJAQvfS6LEFNcRVg1tGFoGiNX2rHm38EXfPvMSyy6DgU35iybQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e1OrgwfB7sbtTV4th+X0fwKacgOGtbyL+CI7w55lCAs=;
 b=mQcOiqnqIPnd881+dvqeQsaWqTZvoGJ1qVNrpVj5mGR4k0nIHDCysrWWMBVG42TQU4hrJEO4IO8ddiUL7v8f6dQiB3xBJPE1QJbT3/kh1rU9s0ejG7Uc3DXxJkJXC+qUEACgPR/h5mUcctG4tq3yHLm1GDDhagHLec03yE5HrcYOxzMgydPXME1LxArokkAfatgOQ7t79Or5wM5BSmhLSVk63jbsjBF0E5GvhtROaK77gm3v4Bxx6BAJCKVTjPQGJauSltkpbzySs7spzJQPVXMCHp3BZVHmmX52bnUB+hJyE9lXfG3jUgVVxH+guzd6bb5VG97d47y2drE0NVBwOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e1OrgwfB7sbtTV4th+X0fwKacgOGtbyL+CI7w55lCAs=;
 b=BXIj94o4NvGGHIjxGrkXlr2iuZsDG9UyfFSo4mcbDSEooNa2QRnSadFvHPkBuGgTXYhDOcpXBQIcMYojhFVu28Tozg9MMSxomHWt/js2c800AYt2xrG9MdDc07y+aYsj/ZPRKF0KJVAWetVmdgpsXHOign4st9Aou6bpDE3MjHecvFStXM93aGT1jYEcpFlxbbCOsgHEbBomUaEujdS4z8z5b0KdupXFcQVoaOa6OR8mP7KKJ+UVr+jxriYP8Gjh/8dQuS8RAAAC/Iu5YJ4TaZ+XWxZvTr0GwUoD3VXQMMZjm9vfbpNFtA9EQ+6FqFqqNpbZoJwDK15P+JtIzE/aQg==
Received: from HK2APC01FT115.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebc::41) by
 HK2APC01HT031.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebc::266)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3520.15; Thu, 5 Nov
 2020 09:12:46 +0000
Received: from SG2PR03MB4502.apcprd03.prod.outlook.com
 (2a01:111:e400:7ebc::4a) by HK2APC01FT115.mail.protection.outlook.com
 (2a01:111:e400:7ebc::194) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3520.15 via Frontend
 Transport; Thu, 5 Nov 2020 09:12:46 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:DAE3FC0752FE8A8D4F794FABB2D90A0C7152C5CAFF559F97C928AE267E82BAAF;
 UpperCasedChecksum:DAC0B6ECF5C5E0E5AFA5CD3D5F5B2D81B3985A1EB1A2ACE6C61BE9D5C9740FC4;
 SizeAsReceived:8710; Count:47
Received: from SG2PR03MB4502.apcprd03.prod.outlook.com
 ([fe80::d849:8be0:f585:49fa]) by SG2PR03MB4502.apcprd03.prod.outlook.com
 ([fe80::d849:8be0:f585:49fa%3]) with mapi id 15.20.3541.021; Thu, 5 Nov 2020
 09:12:46 +0000
Subject: Re: Amlogic Text Offset regression
To: "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>
References: <SG2PR03MB450210BE2ED8609110E2D085C2EE0@SG2PR03MB4502.apcprd03.prod.outlook.com>
 <1291bd44-84db-5cd3-cc7a-9ec82a96a21f@baylibre.com>
From: Shareahack <shareahack@hotmail.com>
Message-ID: <SG2PR03MB4502738285124771A3B203D6C2EE0@SG2PR03MB4502.apcprd03.prod.outlook.com>
Date: Thu, 5 Nov 2020 12:12:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
In-Reply-To: <1291bd44-84db-5cd3-cc7a-9ec82a96a21f@baylibre.com>
Content-Language: en-US
X-TMN: [XH511jiMbpasYwJPnwzJDDG4obQtNd8b]
X-ClientProxiedBy: MRXP264CA0042.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:14::30) To SG2PR03MB4502.apcprd03.prod.outlook.com
 (2603:1096:4:29::19)
X-Microsoft-Original-Message-ID: <08a7ca54-f3f1-c6b6-d151-8efa85542c68@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.100] (46.42.102.224) by
 MRXP264CA0042.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:14::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3541.21 via Frontend Transport; Thu, 5 Nov 2020 09:12:45 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 4e5af2ac-e1ad-4970-a26a-08d8816af5c1
X-MS-TrafficTypeDiagnostic: HK2APC01HT031:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ab8A23gti/2xVqp1eD8fLSIQP9fGoxS4zFmk5aa+3CCMLDelZAkPS00+PSxnT+gcfxh5UYhp/bROQuku9l6ZcL251gNEsfxKRU8Nq4g+a50n6uVvYeg6tXKY/x/IncutapB1Nh76xVXvd0lVT5ABxZHt+9bAUbf7QLcO81nYoLm6qCIPFotbyIps2z7z9ZAv02unUgyCOSXBYHavIs76OF+1Wt4Tv1D7G2qBPEg1pJrJgPlYoH4fW51sYQNz+0/a
X-MS-Exchange-AntiSpam-MessageData: t6zgeZjBQctOnbkfrTj9ND3O1qSzPXvkB6y4wJooxGF6+zpTq0mRDgMP2jnOSXbhAJNqcB0rKf4g/0GwVrYYHcyDcL7QEYaYj5mEd11qB6LcyV/oPN4LWflkL4DqE6xfCTQ3IY9a1LoYAZBHDAPI/Q==
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e5af2ac-e1ad-4970-a26a-08d8816af5c1
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2020 09:12:46.4728 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: HK2APC01FT115.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2APC01HT031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201105_041254_290838_AAB96069 
X-CRM114-Status: GOOD (  25.44  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hello,

On 11/5/20 11:57 AM, Neil Armstrong wrote:
> Hi,
> 
> On 05/11/2020 09:51, HK SH wrote:
>> Hello,
>>
>> Since the text offset patch is removed from the kernel, no amlogic board is able to boot with 5.10-rc. While I can get it to boot only when I have mainline uboot and not all amlogic boards have mainline uboot support.
>> I have tested Kernel 5.10-rc1 and 5.10.rc2 on Khadas VIm3 with mainline uboot and it works fine but when I try it on Odroid N2 or Odroid C4 then it gets stuck at starting kernel which seems that the kernel load address is not correct or something.
> 
> The only way to run Mainline Linux without the text offset patch/fix is to use the Legacy U-Boot image:
> mkimage -A arm64 -O linux -T kernel -C none -a 0x1080000 -e 0x1080000 -n linux -d Image uImage
> 
> and use bootm
> 
> it's really a bug/regression in Amlogic's U-Boot fork, maybe HardKernel or Khadas could fix it.
> 
> Neil

Thank you for the quick response, Will start testing with this method 
and then if all goes well then will have to update our packages for 
amlogic to bootm method.

Much appreciated.


Furkan
> 
>> Odroid C4 Log below:
>> SM1:BL:511f6b:81ca2f;FEAT:A0F83180:20282000;POC:F;RCY:0;EMMC:0;READ:0;0.0;CHK:0;
>> bl2_stage_init 0x01
>> bl2_stage_init 0x81
>> hw id: 0x0000 - pwm id 0x01
>> bl2_stage_init 0xc1
>> bl2_stage_init 0x02
>>                                             
>> L0:00000000
>> L1:00000703
>> L2:00008067
>> L3:15000020
>> S1:00000000
>> B2:20282000
>> B1:a0f83180
>>
>> TE: 119887
>>
>> BL2 Built : 20:29:41, Jun 18 2019. g12a ga659aac - luan.yuan@droid15-sz
>>
>> Board ID = 1
>> Set cpu clk to 24M
>> Set clk81 to 24M
>> Use GP1_pll as DSU clk.
>> DSU clk: 1200 Mhz
>> CPU clk: 1200 MHz
>> Set clk81 to 166.6M
>> eMMC boot @ 0
>> sw8 s
>> DDR driver_vesion: LPDDR4_PHY_V_0_1_15 build time: Jun 18 2019 20:29:37
>> board id: 1
>> Load FIP HDR from eMMC, src: 0x00010200, des: 0xfffd0000, size: 0x00004000, part: 0
>> fw parse done
>> Load ddrfw from eMMC, src: 0x00030200, des: 0xfffd0000, size: 0x0000c000, part: 0
>> Load ddrfw from eMMC, src: 0x0002c200, des: 0xfffd0000, size: 0x00004000, part: 0
>> PIEI prepare done
>> fastboot data load
>> 00000000
>> emmc switch 1 ok
>> 00000000
>> emmc switch 2 ok
>> fastboot data verify
>> verify result: 255
>> Cfg max: 2, cur: 1. Board id: 255. Force loop cfg
>> DDR4 probe
>> ddr clk to 1320MHz
>> Load ddrfw from eMMC, src: 0x00014200, des: 0xfffd0000, size: 0x0000c000, part: 0
>> 00000000
>> emmc switch 0 ok
>>
>> dmc_version 0001
>> Check phy result
>> INFO : End of initialization
>> INFO : End of read enable training
>> INFO : End of fine write leveling
>> INFO : End of read dq deskew training
>> INFO : End of MPR read delay center optimization
>> INFO : End of Write leveling coarse delay
>> INFO : End of write delay center optimization
>> INFO : End of read delay center optimization
>> INFO : End of max read latency training
>> INFO : Training has run successfully!
>> 1D training succeed
>> Load ddrfw from eMMC, src: 0x00020200, des: 0xfffd0000, size: 0x0000c000, part: 0
>> Check phy result
>> INFO : End of initialization
>> INFO : End of 2D read delay Voltage center optimization
>> INFO : End of 2D write delay Voltage center optimization
>> INFO : Training has run successfully!
>>
>> R0_RxClkDly_Margin==106 ps 9
>> R0_TxDqDly_Margi==118 ps 10
>>
>>
>> R1_RxClkDly_Margin==0 ps 0
>> R1_TxDqDly_Margi==0 ps 0
>>
>>   dwc_ddrphy_apb_wr((0<<20)|(2<<16)|(0<<12)|(0xb0):0001
>>
>> soc_vref_reg_value 0x 0000004f 00000051 0000004f 0000004e 00000050 0000004e 0000004e 0000004d 0000004e 0000004f 0000004e 00000050 0000004f 0000004c 0000004e 0000004e 0000004e 0000004d 00000050 0000004f 0000004f 0000004d 0000004d 000001
>> 2D training succeed
>> aml_ddr_fw_vesion: LPDDR4_PHY_V_0_1_15 build time: Jun 18 2019 20:29:43
>> auto size-- 65535DDR cs0 size: 2048MB
>> DDR cs1 size: 2048MB
>> DMC_DDR_CTRL: 00700024DDR size: 3928MB
>> cs0 DataBus test pass
>> cs1 DataBus test pass
>> cs0 AddrBus test pass
>> cs1 AddrBus test pass
>>
>> non-sec scramble use zero key
>> ddr scramble enabled
>>
>> 100bdlr_step_size ps== 450
>> result report
>> boot times 0Enable ddr reg access
>> 00000000
>> emmc switch 3 ok
>> Authentication key not yet programmed
>> get rpmb counter error 0x00000007
>> 00000000
>> emmc switch 0 ok
>> Load FIP HDR from eMMC, src: 0x00010200, des: 0x01700000, size: 0x00004000, part: 0
>> Load BL3X from eMMC, src: 0x0003c200, des: 0x0172c000, size: 0x0009c000, part: 0
>> bl2z: ptr: 05129330, size: 00001e40
>> 0.0;M3 CHK:0;cm4_sp_mode 0
>> MVN_1=0x00000000
>> MVN_2=0x00000000
>> [Image: g12a_v1.1.3386-3b31431 2019-05-21 10:41:54 luan.yuan@droid15-sz]
>> OPS=0x10
>> ring efuse init
>> 2b 0c 10 00 01 31 15 00 00 09 36 30 43 57 50 50
>> [0.017354 Inits done]
>> secure task start!
>> high task start!
>> low task start!
>> run into bl31
>> NOTICE:  BL31: v1.3(release):4fc40b1
>> NOTICE:  BL31: Built : 15:57:33, May 22 2019
>> NOTICE:  BL31: G12A normal boot!
>> NOTICE:  BL31: BL33 decompress pass
>> ERROR:   Error initializing runtime service opteed_fast
>>
>>
>> U-Boot 2015.01 (Apr 14 2020 - 01:55:53)
>>
>> DRAM:  3.5 GiB
>> Relocation Offset is: d6eef000
>> spi_post_bind(spifc): req_seq = 0
>> register usb cfg[0][1] = 00000000d7f83b88
>> MMC:   aml_priv->desc_buf = 0x00000000d3edf7c0
>> aml_priv->desc_buf = 0x00000000d3ee1b00
>> SDIO Port C: 0, SDIO Port B: 1
>> co-phase 0x2, tx-dly 0, clock 400000
>> co-phase 0x2, tx-dly 0, clock 400000
>> co-phase 0x2, tx-dly 0, clock 400000
>> emmc/sd response timeout, cmd8, status=0x1ff2800
>> emmc/sd response timeout, cmd55, status=0x1ff2800
>> co-phase 0x2, tx-dly 0, clock 400000
>> co-phase 0x2, tx-dly 0, clock 40000000
>> aml_sd_retry_refix[983]:delay = 0x0,gadjust =0x142000
>> [mmc_startup] mmc refix success
>> [mmc_init] mmc init success
>> In:    serial
>> Out:   serial
>> Err:   serial
>> vpu: error: vpu: check dts: FDT_ERR_BADMAGIC, load default parameters
>> vpu: driver version: v20190313
>> vpu: detect chip type: 12
>> vpu: clk_level default: 7(666667000Hz), max: 7(666667000Hz)
>> vpu: clk_level = 7
>> vpu: vpu_power_on
>> vpu: set_vpu_clk
>> vpu: set clk: 666667000Hz, readback: 666666667Hz(0x100)
>> vpu: set_vpu_clk finish
>> vpu: vpu_module_init_config
>> vpp: vpp_init
>> vpp: g12a/b osd1 matrix rgb2yuv ..............
>> vpp: g12a/b osd2 matrix rgb2yuv..............
>> vpp: g12a/b osd3 matrix rgb2yuv..............
>> cvbs: cpuid:0x2b
>> cvbs_config_hdmipll_g12a
>> cvbs_set_vid2_clk
>> reading boot-logo.bmp.gz
>> ** Unable to read file boot-logo.bmp.gz **
>> reading boot-logo.bmp
>> ** Unable to read file boot-logo.bmp **
>> movi: not registered partition name, logo
>> movi - Read/write command from/to SD/MMC for ODROID board
>>
>> Usage:
>> movi <read|write> <partition|sector> <offset> <address> [<length>]
>>      - <read|write>  the command to access the storage
>>      - <offset>  the offset from the start of given partiton in lba
>>      - <address>  the memory address to load/store from/to the storage device
>>      - [<length>]  the size of the block to read/write in bytes
>>      - all parameters must be hexa-decimal only
>>
>> [OSD]check dts: FDT_ERR_BADMAGIC, load default fb_addr parameters
>> [OSD]set initrd_high: 0x3d800000
>> [OSD]fb_addr for logo: 0x3d800000
>> [OSD]check dts: FDT_ERR_BADMAGIC, load default fb_addr parameters
>> [OSD]fb_addr for logo: 0x3d800000
>> [OSD]VPP_OFIFO_SIZE:0xfff01fff
>> [CANVAS]canvas init
>> [CANVAS]addr=0x3d800000 width=5760, height=2160
>> cvbs: outputmode[1080p60hz] is invalid
>> vpp: vpp_matrix_update: 2
>> set hdmitx VIC = 16
>> config HPLL = 5940000 frac_rate = 1
>> HPLL: 0x3b3a04f7
>> HPLL: 0x1b3a04f7
>> HPLLv1: 0xdb3a04f7
>> config HPLL done
>> j = 6  vid_clk_div = 1
>> hdmitx phy setting done
>> hdmitx: set enc for VIC: 16
>> enc_vpu_bridge_reset[1319]
>> rx version is 1.4 or below  div=10
>> USB3.0 XHCI init start
>> Net:   dwmac.ff3f0000
>> Hit Enter or space or Ctrl+C key to stop autoboot -- :  0
>> ## Attempting fetch boot.ini in mmc:0...
>> reading boot.ini
>> 729 bytes read in 3 ms (237.3 KiB/s)
>> ## Executing script at 04000000
>> reading /Image
>> 33964544 bytes read in 1112 ms (29.1 MiB/s)
>> reading /dtbs/amlogic/meson-sm1-odroid-c4.dtb
>> 71789 bytes read in 19 ms (3.6 MiB/s)
>> reading /initramfs-linux.uimg
>> 8448788 bytes read in 277 ms (29.1 MiB/s)
>> [rsvmem] get fdtaddr NULL!
>> rsvmem - reserve memory
>>
>> Usage:
>> rsvmem check                   - check reserved memory
>> rsvmem dump                    - dump reserved memory
>>
>> rsvmem check failed
>> ## Loading init Ramdisk from Legacy Image at 03080000 ...
>>     Image Name:   Ramdisk Image
>>     Image Type:   AArch64 Linux RAMDisk Image (uncompressed)
>>     Data Size:    8448724 Bytes = 8.1 MiB
>>     Load Address: 00000000
>>     Entry Point:  00000000
>>     Verifying Checksum ... OK
>> active_slot is <NULL>
>> Unknown command 'store' - try 'help'
>> No dtbo patitions found
>> load dtb from 0x1000000 ......
>> ## Flattened Device Tree blob at 20000000
>>     Booting using the fdt blob at 0x20000000
>> libfdt fdt_path_offset() returned FDT_ERR_NOTFOUND
>> No valid dtbo image found
>> libfdt fdt_path_offset() returned FDT_ERR_NOTFOUND
>> [rsvmem] fdt get prop fail.
>>     Loading Ramdisk to 3cff1000, end 3d7ffad4 ... OK
>>     Loading Device Tree to 000000001ffeb000, end 000000001ffff86c ... OK
>>
>> Starting kernel ...
>>
>> uboot time: 5251814 us
>>
>>
>> Kindly advice what is the plan forward in regards to run mainline kernel on amlogic boards which does not have mainline uboot
>>
>> Furkan Kardame,
>> Manjaro ARM Team.
>>
>>
>> _______________________________________________
>> linux-amlogic mailing list
>> linux-amlogic@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-amlogic
>>
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
