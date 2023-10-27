Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDB51C25B67
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Oct 2023 09:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Cc:To:Subject:
	From:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w6cyeMRm4hxM4WAR0lqdw2fQUq1pL/Dh5GRA6JgCBfo=; b=y+yCyEkorVzkZR2wE7pfyEHxWV
	QZOtAvYmwUgIOZYpg5dmQ/7+zd+ILc+liZA8SjDf3BAodfy6Rc5UAo26TH1cP4Q7AVI/LS8oYs89L
	znKJ95IdqPLHOeeRPwmo4Ub8Dk39ZdDGFAp08XYPDkmmYaq/ybFD15B+KNBGUATn9NXgjyj2DN88G
	AQi35U1Ny5wFo2LdNuhlD0utGCxOe9/ZDdLWeIt87XvdnORyZIn2m36zlW4kkuZMIupIkDLlHJwCa
	tbPDaqp1p5mldsOW/lWmdpu/5zd2X57g0LRCFO8b51IBUX+1Lhx5um8g/E7BI1EcfNjsOA0u8Ss4F
	UWmFoTWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwJ4L-00G1QM-03;
	Fri, 27 Oct 2023 09:23:53 +0000
Received: from mail-sgaapc01on20720.outbound.protection.outlook.com ([2a01:111:f400:feab::720] helo=APC01-SG2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwJ4H-00G1Oc-0q;
	Fri, 27 Oct 2023 09:23:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N9PowIqUOt90ZudbBnm81Qv8DIWxo8USQOFR5nIXtSkZ6NdSd4w9QFF+1bqWiR2xXlIdKG17Znvvvvm19lOUBf4+bOZhB42ZSXtM14TOs9i2ifeD+CG8qVFJ5Xhf4biMZxQ/8AasXr4WymPiwasckzYzMbijhBy740UgqsQmpY7lRJ3CFmaA5wl2V6xON1XSutYwnY6Y/CSiVY0dF8tnkqHos0Jc2OlnsqTnV2FBpetLr3CeN8dXNVakDbX85qIctsdez05Fq5dxuxgXPE9d5Ya/D/8gXqIGkt2W3uq6oIP/2M0zFSsARkHplebiu7hjK1oeRG5Wv696SEqBUTJQog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TkZrpUUIDGXVEFfITlNgB7b7eQxTpVkVkWOFQn7/fGI=;
 b=UjPpeAfPxl5mzTImRYeAgc9hUZfMjHj1bKlTp8CLuc1+u2fVF9R3p+IbiLQo7IO/LAbP1hHRSGucmQQToWDIDV6THdYLwKwCwowgrXrXbkbBQ68f02qZQsJ/x8Jv1CmcVavJRYk42wl2gvOeDrTJ/Kfd5kURHnKAAEmtdtbHqg/g0H6dNdPFOIFA4CN9hWCcZmtEZ/eqzaWZEH1khB3yd1/GiBQXr5PcpcdXyOH3rpB+kwP/I6Pbf/GEyBJ+y2QF8G2HOF5vPmVwpt8+yvoh4ZLo13nehm6LW8KEeuOW60ca+2fgEotPUl+Dp54vtUg+Cbqswvxrjo2ATXHU+SG+2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TkZrpUUIDGXVEFfITlNgB7b7eQxTpVkVkWOFQn7/fGI=;
 b=QTzG3w2M0xDSdhWr8kBO56XY7mFUdoec98k3+i+y10Ihx+UJZLMCKyOLu6yfYObXoCpdc5G2eJfYkZbHKd3GI86uttMJqyD3C87VZFUtnXUEBRsn1BNp+ooflxUCSY4wWMaJvbv/z9jBO2Ouh1amvAxq8n75Jz1ggTsz1Ilvl9d1+qLvRsl6Uuha3Tm+XQTzb4e18IzkXiomL3Iao2Tr7fvawCmoau3IjhSA02uG2Mw6AcOP2cxMhENF0SA/U9NnfPWWU1EqvTXgsZ+E8tjDTH9qU+/lbuLQffObYnGjAyBj+hI04zBBFM/RGJsPBaKjL1s8PFh3SafWHlneQ6jJfQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5732.apcprd03.prod.outlook.com (2603:1096:820:70::7)
 by KL1PR03MB5729.apcprd03.prod.outlook.com (2603:1096:820:75::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.23; Fri, 27 Oct
 2023 09:23:38 +0000
Received: from KL1PR03MB5732.apcprd03.prod.outlook.com
 ([fe80::639:64cb:4cd:d4c1]) by KL1PR03MB5732.apcprd03.prod.outlook.com
 ([fe80::639:64cb:4cd:d4c1%3]) with mapi id 15.20.6933.024; Fri, 27 Oct 2023
 09:23:38 +0000
Message-ID: <62ab75f8-0e15-441a-b6b3-0b8cc138419b@amlogic.com>
Date: Fri, 27 Oct 2023 17:22:21 +0800
User-Agent: Mozilla Thunderbird
From: Junyi Zhao <junyi.zhao@amlogic.com>
Subject: Re: [PATCH V3 RESEND] pwm: meson: add pwm support for S4
To: George Stark <gnstark@salutedevices.com>, Yixun Lan <dlan@gentoo.org>
Cc: thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de,
 neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, linux-pwm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20231016052457.1191838-1-junyi.zhao@amlogic.com>
 <20231016223749.GA7647@ofsar>
 <07f978ec-2f18-4079-afb1-4d37827806a3@salutedevices.com>
Content-Language: en-GB
In-Reply-To: <07f978ec-2f18-4079-afb1-4d37827806a3@salutedevices.com>
X-ClientProxiedBy: TYCP286CA0335.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38e::13) To KL1PR03MB5732.apcprd03.prod.outlook.com
 (2603:1096:820:70::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5732:EE_|KL1PR03MB5729:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a9f20dc-b1bc-4b5d-73f4-08dbd6ce6579
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iQcTpG6d07e6t4PZ9qyDGGBxPEZMYzDUL+S90RDYcEYjnJKr13MEkRsyoo/u2b58nvl8LnWXWFhgMzJQSOyvrlQzCyt68rjOwsCggKtYWM4EW9hJs9PJBpAbQelJPjzj4xAsgvv+49aFs4v7XOpdaw7jTS2rJ6xpkvk6M1WdM27pLdPRLxczHb8AiTBpxcOEYpIAbgx+7lSt6Jr8ONHE01U1CA/f/mLmuhXBTxNJomSuqk86r5VLQ5GkTddrVHcKKPkkjoKDyCYEqii89bBijd4KzA6+HIUyjUm1lr3sUmpnbMLGoV1NcaSEBFIywG0eyM3wu+EfY1rYCYEEYbj1FSZ3t1XV7k9vt0ksQocCQvrMw03hv3keZFrpL3SN7wLb2S5QBY8WAuLy2/94YFe71jetzT2zyFUwQFrczOonTQ5g21b2hZNyYQnwtnRsWmxgfHtotf4mGYmQFpFDugcI6yFjJ12yt9yLK++hKMRqnDzIregsS0RV1PodLEopYqCKr67QLTiC1+CPpFaGSfLhZPMn2+qKAExL69LJ6GbZACAirt+rT5fezcnaK1rriX1PftWZ2U/sMYRZWdQ8hPS8UYyKn4Eb+Bc1IH6JtlvBws4z15scYU9YH45QW4Kr1DTpEOgxWh1hmHAShgjmMcs4WcTdBF9AmDBhpJEYcijvu8qRaIkw5ghg3/2SPGIuXl+mYOSSyYZyvAgtoTt9QYP+iATPPdKEee2+Gnp5Ei+Dp3M=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5732.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(136003)(376002)(39850400004)(366004)(230922051799003)(230273577357003)(230173577357003)(64100799003)(451199024)(1800799009)(186009)(83380400001)(53546011)(6512007)(6506007)(26005)(2616005)(6666004)(66476007)(66946007)(316002)(110136005)(31696002)(66556008)(5660300002)(8676002)(36756003)(4326008)(8936002)(86362001)(7416002)(2906002)(44832011)(41300700001)(31686004)(478600001)(966005)(38100700002)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WXNWRGZUS1lvdStGMFJsd1I2NzFORldrWWQvM0d0T1FneTh0ZldUcUtjU003?=
 =?utf-8?B?RjZNTlNMVFpyY0ozRXVKTlhjbVVWWmtUSHp3Nit4eEJHM1dBQ3dJQ3VDbHFK?=
 =?utf-8?B?WjRpOFVEOEhQL095VEZmV25QWkgyUFVnQXJYNHdqa2ZGaTd0Y3JVRjFNalhD?=
 =?utf-8?B?aTZtTm1qakpiOUpCYnJTYjNNQTRNUWhpRDVnRkhjekZFcjRHMTZYeE1Lckp0?=
 =?utf-8?B?RmQ1NTlnRXFGdS9KeVVMcnBvdFhZNTRhNDdYekZ3QjRpdzlOditCL2EwMkcx?=
 =?utf-8?B?K3NnZGErMHZTQ0IvUU5kNEFRaGlYb0tsYldMekI2cFlGREc2U2lhQjZINVhT?=
 =?utf-8?B?MlpUR3RNbFZzWTNzSHl3eVZtcXhqZFJBcTRZVnkzMk5sZWozdUZDODdMclow?=
 =?utf-8?B?N2ZKUGNFSHdKbUFBSHd3OTJkMmw2S2lKTEdZNXdOWGpvKzFaOGE2ZlI1MkF0?=
 =?utf-8?B?MHg0MTJUREphblFIa1pmRXJTcmhFUHRFN0Yrb2Q3djNvN0M1VkxMU3lPN0dT?=
 =?utf-8?B?bG5OdzZTbTlPQXpka2RiQkpTbnh5OFZxZnNPOXhvNVBhYko0OW9LUzFUYUdt?=
 =?utf-8?B?MnR6NmswWXdmVW9aYmdFOWFMcjFoVGNWb3hlSXl0Z0N1aGJXaHdqQ1hGdktj?=
 =?utf-8?B?MWMxSzdSYTJoZEZpQjNtZUhwb1NvdnlZQjNTMCt0bWl3a1dGK21nZFNscXIw?=
 =?utf-8?B?TFBNdmRsRGR5MTlJR1V3em5hUVpVOXB1VGtGMXFIK1pYWFF6bC9oeERtdXBo?=
 =?utf-8?B?QlkxT3pFa256TVB1VXdxYzlvaXp4QUFrU0ZHNElCZE5Kd2UvUCtSdDc5dzlW?=
 =?utf-8?B?ckFsTHoyUlJGbnlRNHBoY3BKWms2Vi9IZmZQclNLNk1UZWhzODEyYzlGSnow?=
 =?utf-8?B?K2dTb0VJenZsWW1pUFQvRHE3NHkvQnlkSTEzQTJpVHdVenlpamJjL0haU3pG?=
 =?utf-8?B?UXFmVXIwa1RvTkhtczVQOWxiL2VqV3lFS3NZUlBnQlVPcHJvaDdwNVdnUHMw?=
 =?utf-8?B?b29idGExZThvTVEvNitsdC9EWmthTGl5NmJOai9qQXBYRXVUZE45TkFpNEw0?=
 =?utf-8?B?aTd4OW5WR1J6akRyS3VlNWtpUGh1d1Z2RlA4WkpLS0hlcFROUHpFNXJWZUti?=
 =?utf-8?B?d3NIaWc3UjVwRjRJMGk5bVQwL2VVNVB5dWRWeWVsZGlQbWR1WXkzUnJZa2ZF?=
 =?utf-8?B?d2Y1UTV1ZlQwTmlaZGtHWEVPMzhodHBmVm9TTGVMaHRONDZ4UWJGeDBXcndR?=
 =?utf-8?B?MmJTUVhXY1V1K0UydWZteHNPSHlUZDBnZUF0YjZIdVNIYm1SYi9HSzVKSXo5?=
 =?utf-8?B?ME42bVh5MDRxWC93SnhSMUp0cTRvZm4yNGsvRFFpTGd0SmlkVTBpMHp4czJy?=
 =?utf-8?B?MUJLckEyc3E5OWFLajlwVmRtSXJDTTl3a1BvMmlHY3pqaFRNamFJcVE3c3lh?=
 =?utf-8?B?ZnNCVlpLb1cwWmdmaEN0Z2lJS29xQ0F1dG12YUV2REk2TE1JcDhWd0I4RDRx?=
 =?utf-8?B?S2UwRmhvMFR5bDV5WE1LbkVuWmttUjJYOGxNUGpZUWU5V3lCVGZBUFMydGtE?=
 =?utf-8?B?YWFXTk83cUR1R25vOTA3RVgvMjlXUW16b1ZlZXlpSmluSGtzbTlIaVVRZzM5?=
 =?utf-8?B?eHhKRld3MzBIdzJiR3cvYUpoaUE4cDNtSVNNRjBaOW1wTUphbjJqTHVIay9y?=
 =?utf-8?B?d0F5dUJUMW5sRTZ3YTFGeFEzVXBYaVQzQ3dOeFdIR1ladDQ4NUs4M0xHTE5q?=
 =?utf-8?B?RGFpOFJFTEdVeW9MQ3laTGd1cXN6RzVNdU1JYm1JV2dWODVQa0kyazhTU21Y?=
 =?utf-8?B?c2xJWXROY2EwTDVLSGlWNFZEcDQxNEFUcGMyVlcyeDVtMWozdGI0bEpLeHda?=
 =?utf-8?B?SFhYR3BlbHJEcHVNa09aWG1VYVVRSlBWMitEWDduci9lZ1UzTExBQVJHWTZW?=
 =?utf-8?B?andHNk9aV3pzeXNtZlhIRFQ5MHBPNERheDZVTlBQQVpWSkI5VnFsZHp1ZlVX?=
 =?utf-8?B?WEo0TEN4a2FPVGVCOG9aQU8vMnl5UmNTSmROa2RYZlMrUHg4eWwvYlN5NTN2?=
 =?utf-8?B?RVo5RUZVTVNvOTFCSTE1K09UUk9YMkhoV0pIM0xYa1Z5U1Nrdmw3U2tITW1P?=
 =?utf-8?Q?6LsjtV1EvatgYwFVRVsv5BZjp?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a9f20dc-b1bc-4b5d-73f4-08dbd6ce6579
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5732.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2023 09:23:37.2252
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2Hx0owUTVc5wyOqlu8WmXp4IDsRsB9NrNx9ezC+C+b+Wbab6t3/ve551Dwiie5nkMUshUQuby+gVBClRXJv6kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB5729
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231027_022349_356025_207058CC 
X-CRM114-Status: GOOD (  15.66  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGVsbG8gWWlYdW7vvIwKICBDTEsgY29uZmlnIGhhcyBiZWVuIHNlcGFyYXRlZCBvbiBIVy4gTm8g
bW9yZSBpbiBwd21jaGlwLgpBbmQgczQgZGF0YXNoZWV0IGFib3V0IGNsayB1cGRhdGVkIGFscmVh
ZHkuCgpPbiAyMDIzLzEwLzI0IDM6NDAsIEdlb3JnZSBTdGFyayB3cm90ZToKPiBb5L2g6YCa5bi4
5LiN5Lya5pS25Yiw5p2l6IeqIGduc3RhcmtAc2FsdXRlZGV2aWNlcy5jb20g55qE55S15a2Q6YKu
5Lu244CC6K+36K6/6ZeuIAo+IGh0dHBzOi8vYWthLm1zL0xlYXJuQWJvdXRTZW5kZXJJZGVudGlm
aWNhdGlvbu+8jOS7peS6huino+i/meS4gOeCueS4uuS7gOS5iOW+iOmHjeimgV0KPiAKPiBbIEVY
VEVSTkFMIEVNQUlMIF0KPiAKPiBIZWxsbyBZaXh1biBMYW4KPiAKPiBPbiAxMC8xNy8yMyAwMToz
NywgWWl4dW4gTGFuIHdyb3RlOgo+PiBIaSBKdW5ZaQo+Pgo+PiBPbiAxMzoyNCBNb24gMTYgT2N0
wqDCoMKgwqAgLCBKdW5ZaSBaaGFvIHdyb3RlOgo+Pj4gRnJvbTogImp1bnlpLnpoYW8iIDxqdW55
aS56aGFvQGFtbG9naWMuY29tPgo+Pj4KPj4+IFN1cHBvcnQgUFdNIGZvciBTNCBzb2MuCj4+PiBO
b3cgdGhlIFBXTSBjbG9jayBpbnB1dCBpcyBkb25lIGluIGluZGVwZW5kZW50IENMS0NUUkwgcmVn
aXN0ZXJzLgo+Pj4gQW5kIG5vIG1vcmUgaW4gdGhlIFBXTSByZWdpc3RlcnMuCj4+PiBQV00gbmVl
ZHMgdG8gb2J0YWluIGFuIGV4dGVybmFsIGNsb2NrIHNvdXJjZS4KPj4+Cj4+PiBTaWduZWQtb2Zm
LWJ5OiBqdW55aS56aGFvIDxqdW55aS56aGFvQGFtbG9naWMuY29tPgo+Pj4gLS0tCj4+PiBWMiAt
PiBWMzoKPj4+IFJlYmFzZSBhbmQgUmV2aWV3IHRoZSBsYXRlc3QgdXBzdHJlYW0gY29kZSBhZ2Fp
bi4KPj4+IEFmdGVyIHJlY29uc3RydWN0aW9uLCBzdGljayB0byB0aGUgcHJldmlvdXMgY29kZSBh
cyBtdWNoIGFzIHBvc3NpYmxlLgo+Pj4gwqAgZHJpdmVycy9wd20vcHdtLW1lc29uLmMgfCAxOSAr
KysrKysrKysrKysrKysrKysrCj4+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygr
KQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3B3bS9wd20tbWVzb24uYyBiL2RyaXZlcnMv
cHdtL3B3bS1tZXNvbi5jCj4+PiBpbmRleCAyNTUxOWNkZGMyYTkuLmZlOWZkNzU3NDdjNCAxMDA2
NDQKPj4+IC0tLSBhL2RyaXZlcnMvcHdtL3B3bS1tZXNvbi5jCj4+PiArKysgYi9kcml2ZXJzL3B3
bS9wd20tbWVzb24uYwo+Pj4gQEAgLTk5LDYgKzk5LDcgQEAgc3RydWN0IG1lc29uX3B3bV9jaGFu
bmVsIHsKPj4+IMKgIHN0cnVjdCBtZXNvbl9wd21fZGF0YSB7Cj4+PiDCoMKgwqDCoCBjb25zdCBj
aGFyICogY29uc3QgKnBhcmVudF9uYW1lczsKPj4+IMKgwqDCoMKgIHVuc2lnbmVkIGludCBudW1f
cGFyZW50czsKPj4+ICvCoMKgwqAgdW5zaWduZWQgaW50IGV4dGVybl9jbGs7Cj4+PiDCoCB9Owo+
Pj4KPj4+IMKgIHN0cnVjdCBtZXNvbl9wd20gewo+Pj4gQEAgLTM5Niw2ICszOTcsMTAgQEAgc3Rh
dGljIGNvbnN0IHN0cnVjdCBtZXNvbl9wd21fZGF0YSAKPj4+IHB3bV9nMTJhX2FvX2NkX2RhdGEg
PSB7Cj4+PiDCoMKgwqDCoCAubnVtX3BhcmVudHMgPSBBUlJBWV9TSVpFKHB3bV9nMTJhX2FvX2Nk
X3BhcmVudF9uYW1lcyksCj4+PiDCoCB9Owo+Pj4KPj4+ICtzdGF0aWMgY29uc3Qgc3RydWN0IG1l
c29uX3B3bV9kYXRhIHB3bV9zNF9kYXRhID0gewo+Pj4gK8KgwqDCoCAuZXh0ZXJuX2NsayA9IHRy
dWUsCj4+PiArfTsKPj4+ICsKPj4+IMKgIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lk
IG1lc29uX3B3bV9tYXRjaGVzW10gPSB7Cj4+PiDCoMKgwqDCoCB7Cj4+PiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgLmNvbXBhdGlibGUgPSAiYW1sb2dpYyxtZXNvbjhiLXB3bSIsCj4+PiBAQCAt
NDI5LDYgKzQzNCwxMCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCAKPj4+IG1l
c29uX3B3bV9tYXRjaGVzW10gPSB7Cj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLmNvbXBh
dGlibGUgPSAiYW1sb2dpYyxtZXNvbi1nMTJhLWFvLXB3bS1jZCIsCj4+PiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgLmRhdGEgPSAmcHdtX2cxMmFfYW9fY2RfZGF0YQo+Pj4gwqDCoMKgwqAgfSwK
Pj4+ICvCoMKgwqAgewo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLmNvbXBhdGlibGUgPSAi
YW1sb2dpYyxzNC1wd20iLAo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLmRhdGEgPSAmcHdt
X3M0X2RhdGEsCj4+PiArwqDCoMKgIH0sCj4+PiDCoMKgwqDCoCB7fSwKPj4+IMKgIH07Cj4+PiDC
oCBNT0RVTEVfREVWSUNFX1RBQkxFKG9mLCBtZXNvbl9wd21fbWF0Y2hlcyk7Cj4+PiBAQCAtNDUx
LDYgKzQ2MCwxNiBAQCBzdGF0aWMgaW50IG1lc29uX3B3bV9pbml0X2NoYW5uZWxzKHN0cnVjdCAK
Pj4+IG1lc29uX3B3bSAqbWVzb24pCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0
IGNsa19wYXJlbnRfZGF0YSBkaXZfcGFyZW50ID0ge30sIGdhdGVfcGFyZW50ID0ge307Cj4+PiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IGNsa19pbml0X2RhdGEgaW5pdCA9IHt9Owo+
Pj4KPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChtZXNvbi0+ZGF0YS0+ZXh0ZXJuX2Ns
aykgewo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNucHJpbnRm
KG5hbWUsIHNpemVvZihuYW1lKSwgImNsa2luJXUiLCBpKTsKPj4+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjaGFubmVsLT5jbGsgPSBkZXZtX2Nsa19nZXQoZGV2LCBu
YW1lKTsKPj4gdXNlIGRldm1fY2xrX2dldF9vcHRpb25hbCgpIHdoaWNoIHdvdWxkIHNhdmUgeW91
IGZyb20gaW50cm9kdWNpbmcKPj4gdGhlICdleHRlcm5fY2xrJyB2YXJpYWJsZQo+IAo+IE9uIFM0
IGFuZCBvdGhlciByZWNlbnQgY2hpcHMgUFdNIGNsb2NrIHJlc2lkZXMgaW4gc2VwYXJhdGUgSVAg
YW5kIGl0Cj4gbXVzdCBiZSBwcm92aWRlZCB0byBkcml2ZXIgaW4gb3JkZXIgdG8gY29udHJvbCBQ
V00gZnJlcXVlbmN5LiBTbyB0aGlzCj4gY2xvY2sgaXMgbm90IG9wdGlvbmFsLgo+IAo+Pgo+Pj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChJU19FUlIoY2hhbm5l
bC0+Y2xrKSkgewo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBkZXZfZXJyKG1lc29uLT5jaGlwLmRldiwgImNhbid0IGdldCAKPj4+IGRl
dmljZSBjbG9ja1xuIik7Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiBQVFJfRVJSKGNoYW5uZWwtPmNsayk7Cj4+PiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfQo+Pj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbnRpbnVlOwo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgfQo+Pj4gKwo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNucHJpbnRmKG5hbWUs
IHNpemVvZihuYW1lKSwgIiVzI211eCV1IiwgZGV2X25hbWUoZGV2KSwgaSk7Cj4+Pgo+Pj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGluaXQubmFtZSA9IG5hbWU7Cj4+Pgo+Pj4gYmFzZS1jb21t
aXQ6IDRkMmM2NDZhYzA3Y2Y0YTM1ZWYxYzRhOTM1YTFhNGZkNmM2YjFhMzYKPj4+IC0tIAo+Pj4g
Mi40MS4wCj4+Pgo+Pj4KPj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCj4+PiBsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdAo+Pj4gbGludXgtYW1sb2dp
Y0BsaXN0cy5pbmZyYWRlYWQub3JnCj4+PiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMKPj4KPiAKPiAtLSAKPiBCZXN0IHJlZ2FyZHMKPiBH
ZW9yZ2UKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9n
aWMK
