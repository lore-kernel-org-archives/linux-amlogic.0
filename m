Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD7C2C04E69
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Jul 2023 07:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P+JFEKEYGnr0v0OitaiZ0CrQNtcwHLwALQ+9bl8mC10=; b=jk7l0zg/Ukp96L
	W1zLC8cSPmeVbmlpDe9Sb6hVtpXOQE2a4WedD8jEG53aCNg1heR8nyxPVoGIqDfuFwqFLRioh+90b
	oeJwOsND5xwr5RogFuL51mTgvyxr57zjUXtLFciON2HNRCfRrHbiBj6VFa4W4MOMU3i7sJTbLy7tD
	wo43thfOIe6zDFo+0tpu0rx7anYHTNW4ZP/15csdWrecThTC907End5qJ2qRH88dJKVIcZ2t7z2nS
	whKP2NxQXgwEH28JgokdQcwwtPiSZigBK4byBOS6UYkm5iQUJVtR9TBfX3j17N/YooheQulAancs0
	bCNjN9C+bN1ds3HdEKiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOv0W-00COf0-36;
	Thu, 27 Jul 2023 07:01:56 +0000
Received: from mail-sgaapc01on20719.outbound.protection.outlook.com ([2a01:111:f400:feab::719] helo=APC01-SG2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOv0I-00COQ3-2i;
	Thu, 27 Jul 2023 07:01:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I0xuvlytLoXBy5w2zojFl4u50zLrLhFOBmwkqi2aOnUrYZwcbqIC+GtDENNB8HwHboYppRPddA5tDh6pWSx+Yrd1pNRqwwty1sWay462R2N3GCf/Sl5B2+lxBjfUa0aA3+M0oUibA29lTBdS6+Q4WyVbovArQ529VsjlA/BdpyjcYaTDoOWPv9BwPIIqEr55S90yIidrvxu0J/kEFK2BP6InApgZNSbu3FLU+A+a+OsjO1o/TrajQkwKXQI1zUihwUCEarMlKuBPJzBxPFo4On8SXSq3Plr5Xs0GOH/M76qIJhTgD+++3Qxqs7W5x1IVXgGVxAkzTHXvJK6BMIKNRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DFCZMSRT/SLHSwmQ+mf73xOp7pZuv/jxv4saUj/q9f4=;
 b=Ys3tBQsN/0r2lteBBV+pCXnp1rVS8kTFqESmFe92GvfRswoBY+3C4PmVVrS88Q3jERPA65915z/FGHlIOKCRTW/iR5bP0zEmEU00uJwjSFmGDXR0ZwRxZXNA0Ie1iiGgNq5hPRzFE8dpMoQ8jdbYe/owno/hJD2k4GVFf+LvCtDYtm7tsHyl/DTs+4b5Rr3o6h0Mz4Dek1Oa6id9aPncXpAzLyESHLiL85UV09DY9pGis0LAMix5QE+MVL0gZsm8dGj9xKhdXaefHaBTqMSKA+qfE9G6hLrKdsOgfZwqzxgqoPHgv34URQGy28LDG/JXfxwW9ATfuTlPypdVGmKfqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DFCZMSRT/SLHSwmQ+mf73xOp7pZuv/jxv4saUj/q9f4=;
 b=aHKYzMMn8vsWRrcA02yqGmTqYYlFgUkGJtzFHCpu6wY8yfpFvjikrAO3dpK1a1HU0Ey+q9dDdIgcaZYcoSjrIMglx5UV4LUXIoPYCUjcZoVyQ2NR3UBRuK6F35hrqHTCNbAReXlHGjjm5olkFnjz1ZQi0rFTeGCWxlxnUBdtP4Sq9EomfI2T80uH8EmUMtAoAncGOHKVPErRJIy07cYaVINFIAhZiz2EF4K/SdbJC5ElblY05xksmS+eZB9ko53yazkQ3aBza2DTHU0qCfeoukcx82bCbVX+ZFfIHWfcfHTXc1moPtTC4k1AU2uNkZclZbx5WK+9o64dhgYPYHAERw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by KL1PR0601MB4276.apcprd06.prod.outlook.com (2603:1096:820:78::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Thu, 27 Jul
 2023 07:01:38 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::732f:ea1d:45a1:1e0b]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::732f:ea1d:45a1:1e0b%3]) with mapi id 15.20.6631.026; Thu, 27 Jul 2023
 07:01:38 +0000
From: Yangtao Li <frank.li@vivo.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Yangtao Li <frank.li@vivo.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-mmc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 22/62] mmc: meson-mx-sdhc: Convert to platform remove callback returning void
Date: Thu, 27 Jul 2023 15:00:11 +0800
Message-Id: <20230727070051.17778-22-frank.li@vivo.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230727070051.17778-1-frank.li@vivo.com>
References: <20230727070051.17778-1-frank.li@vivo.com>
X-ClientProxiedBy: SI2P153CA0017.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::10) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|KL1PR0601MB4276:EE_
X-MS-Office365-Filtering-Correlation-Id: 975d2e4c-819f-427b-3a0a-08db8e6f52df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GVdGWq4akomqHsZBIIzsj3nEx+3qHjv0PJx2WHR3lUhDRAOhLcU6LTheaqNRLtUdEDq/+sPprimsyolBGXTX41pJblT3mk7dqLXm86f6FVqF3QY6MdVEnE59H2j85GKwOlzOEtL/s+QM130JHOoPu1ij6dy7NfWuMhkC3Jy2Ueeu5kGBTyVeMs1Jdn3Uf1LSGwny2r+hVR31azyFyYG8Krp+eOMHOn5HT00jRrUjZymmEJkem+xn9iOxsBhK+eSwjMLEUE2GePZVpVrtA2E1z15PyXXSu3R12qfZTdsCbEXiuLZAY31U0bbfZ9ZvitxBKPx3tfxJ5kgCoV2sT8oPffXgnvhK020nTQWN9Y3NTAU5OvmO+TvDVnBYW93BKBci9GEzPznytue6IzKrBH/jblNUy2QEM9hxdLEaJjvh9WHlcrKp8PNf/8GkYwiNpjFIcvYmpueGZjvDxTxcL2Y7ZYTBufMUl4dC1evOiLTe44o9eoGFARYVwc7dEuy2qm8DkIz3rHVmtvkxQXgQCbLqm2r1AqYlGyxixPzYDiHIb01Nl20Kr+QFkMkOJs9tVHE5e1usWOGaumnZefmDGYK0EokTvgu4m4D3ppo8fOxKR3use5w0535cDPTGpeaETHhf
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5269.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(366004)(376002)(396003)(346002)(451199021)(6512007)(6666004)(6486002)(52116002)(66946007)(66556008)(4326008)(316002)(54906003)(66476007)(110136005)(478600001)(38100700002)(83380400001)(38350700002)(26005)(186003)(6506007)(1076003)(2616005)(36756003)(2906002)(7416002)(8936002)(8676002)(5660300002)(86362001)(41300700001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T1cyYTF0VGVaK1g1Titlc1h5L1RwV25SMkd4UVR1MitaZnRPL01XbjV4K3A2?=
 =?utf-8?B?b3VSWlBWTzJ2VXh1TmNqeHFCQW1vakIyOFdMcjdFUkN1RTNkRng2Ty9rVU5i?=
 =?utf-8?B?U1A2WDIzWm1nc0k0SXBPZnZXa3R1aC95UFdOa2dzc2ZDLy91ejB4NUZtMStM?=
 =?utf-8?B?WStpQVVmZzk3c1JYZEt5cFFqVnhLbnkwLzlhU2JYUG81N1NqTFBoREc2YnRZ?=
 =?utf-8?B?RDdoaERsZHR6bGtyeFIwNE5rNUJrMDRlWktHTFJZM3FSMmhZdVBVSm0xdWRu?=
 =?utf-8?B?eGVWRG52THNaWCtnbkhTa1NLejFGb1I1dmdRenV1bFBvQnRlR1NvNG1PVC9I?=
 =?utf-8?B?NG1tNVVaNmVGalhzZ2VYMU5QNEFtY0FTbzFJMnUzVW9PVCtmSWpiTUFkN2k5?=
 =?utf-8?B?ZlZXclBXQkVHYW1sWTFZUUNXTExnM0hkbjhXZmRwZGlab1BhbmdYUmVPN3ZT?=
 =?utf-8?B?Y0pPbkVlbnJMWHQ1azlXaC8yaEhQOUlEZlNBbmcwSFMwSWppc2REZDFlNHRi?=
 =?utf-8?B?K0U2MzZZeHA1eEpGNzRsc0w3UGRyS2ZTL2lDa0Qybk0xTUw0cUFkNnFIbzAv?=
 =?utf-8?B?QU5IMnN0WWE5c3pndXV3Nk9hNCtDajJZdGVWSnA0TXV1cEdVMmFTNE9HYnV0?=
 =?utf-8?B?a1l0TFh2UlNKa3hqT1BDcEQ2UHVwRjNCMFU0TGNVQ2J6K3R3dHRYQ2djMjVF?=
 =?utf-8?B?b0hyc0c5ekJHUHZTWXhub0Vta2Z1L2x3WHJVYzBDRnFuazZybUVxemVONGFU?=
 =?utf-8?B?NnRUV0hzcEtJTUNhRUJvUHNsL3FJcDE3RDNxSHhROVBxemlPS2VMMmFvM0x2?=
 =?utf-8?B?T2c2ajdMWTRqb3VVd1llUmlXVjdmSnJRL3FtVGNmRnFhcFpsTTZFcUEzdHNh?=
 =?utf-8?B?ekxRdTdxSUFIQWl5MHBpUWJseHpCblh6c2NUSHQ3dXJoWi9WbUVySlMxVEM0?=
 =?utf-8?B?TlJPNnhFVkZxSTJOT3FCUkJoWGtBWTZlUlE2UlZsT2FDS2JGelM4VUdzVzZP?=
 =?utf-8?B?b3htNlFkajhIVStlUngxNEhvckQxZUR1eHJOcmpkRVU4N0kxZVNKaU1LREJM?=
 =?utf-8?B?ZUtnaEQ1K0VIUTYxQ2pBT1hOMzF1dktLSHByMkwzdktYaUJqWUIxZWlSRklr?=
 =?utf-8?B?Wlp4eVkvVlQvZ2NqNE52aHU3YUNZNlNXa3dudnJlUGYxeUk2MU5zYVV1VVNV?=
 =?utf-8?B?WFFSMWZMTVJrclVRWURWeTRsUGVacGRDNGJaMkR5Uk5KTWVndlp4eHM2cDNX?=
 =?utf-8?B?anVoNnljT2FFbWZyMXBRVm4ra0Y3VGFKc29GYTkrT1RBM0ZQNlJjM2p3eTRy?=
 =?utf-8?B?RDZ0RnhGT29CN3ZBMGZaOXZPdHZCdWlKcXc4cjgrWXJOMW12UFQ1MWZqdjda?=
 =?utf-8?B?M1lQT1pjeUVyUTN6VVFUOE9tWHBnUlFZRCt1Y0N6NjdyVlNCb3pVMUtQOU5R?=
 =?utf-8?B?MzJIcW9XdnNOb0Y2VitJbTRod2FucXdTVVhWdXVvTEpvTzlyblZLUG5YVDJv?=
 =?utf-8?B?SGJpRFNhM1pJeXFud09DNnF1cTlOenpGK0xjYlo4Z0NWMXAzekJzQ0pUaXFL?=
 =?utf-8?B?RnREdmlvN2FKTmp2SEZlbVpiNDZVRmE4dTlLTWtVdGl3NjllZHRuUnVTSXA0?=
 =?utf-8?B?bXE0NzloWHErNmVHbXdlSzVTZlFUWWhQRXNxZTd4VldhaWs4ZFVmTFdic0d4?=
 =?utf-8?B?c3kzQlAwQzl0SDUxdWtDdWlMbXJPb0RsSkVBYUZCN3ZaRFhSV29rWTN5ZlJv?=
 =?utf-8?B?a3NKTDJWZXZvTWNNMFdzNVVRTGRkaFN0K0ZrbkpNMXRIYi9MdjRqd25vNTdn?=
 =?utf-8?B?aVdJNmVyZGFiM1djdnZFQzNwaGZEYUZ2a2FZNXdCYys5cFlqS2JJZEc4cVYv?=
 =?utf-8?B?Z1QvZGtNQ3cyWlBoam9mczNPRUxlbG9QZldDZm0xNmhRc3JmRHlrVHJ1Wnpk?=
 =?utf-8?B?VVJqVmRjWDZOSGQwRFUrMUx2aEM4dkFhclpMSEEyUE5jcUpmWGw0bDliYU1U?=
 =?utf-8?B?TnVKazhxbmViTXZHRVFFWlByVXhHQjgrWk5tWVllUVlSS2hOSUdiWUlTTWhE?=
 =?utf-8?B?Zm1mT1Yvb21zRFF2eFdSbG5IdTVqL2FQbGUzZ1cyN0ZRblhPRTlRVC9LZjlC?=
 =?utf-8?Q?vGsnaoWYm+ZJG86r7rChCvbTn?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 975d2e4c-819f-427b-3a0a-08db8e6f52df
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2023 07:01:38.7482
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hwcuav/qDZvd6vKhbYhM1B09d1fLpRGw/FzzGuprUDTkoVcFzgak/WOohEIky1iJeQxcMEedZIuRNIEGpB5euQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB4276
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_000142_903541_88173B6A 
X-CRM114-Status: GOOD (  14.44  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

VGhlIC5yZW1vdmUoKSBjYWxsYmFjayBmb3IgYSBwbGF0Zm9ybSBkcml2ZXIgcmV0dXJucyBhbiBp
bnQgd2hpY2ggbWFrZXMKbWFueSBkcml2ZXIgYXV0aG9ycyB3cm9uZ2x5IGFzc3VtZSBpdCdzIHBv
c3NpYmxlIHRvIGRvIGVycm9yIGhhbmRsaW5nIGJ5CnJldHVybmluZyBhbiBlcnJvciBjb2RlLiBI
b3dldmVyIHRoZSB2YWx1ZSByZXR1cm5lZCBpcyAobW9zdGx5KSBpZ25vcmVkCmFuZCB0aGlzIHR5
cGljYWxseSByZXN1bHRzIGluIHJlc291cmNlIGxlYWtzLiBUbyBpbXByb3ZlIGhlcmUgdGhlcmUg
aXMgYQpxdWVzdCB0byBtYWtlIHRoZSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuIHZvaWQuIEluIHRo
ZSBmaXJzdCBzdGVwIG9mIHRoaXMKcXVlc3QgYWxsIGRyaXZlcnMgYXJlIGNvbnZlcnRlZCB0byAu
cmVtb3ZlX25ldygpIHdoaWNoIGFscmVhZHkgcmV0dXJucwp2b2lkLgoKVHJpdmlhbGx5IGNvbnZl
cnQgdGhpcyBkcml2ZXIgZnJvbSBhbHdheXMgcmV0dXJuaW5nIHplcm8gaW4gdGhlIHJlbW92ZQpj
YWxsYmFjayB0byB0aGUgdm9pZCByZXR1cm5pbmcgdmFyaWFudC4KCkNjOiBVd2UgS2xlaW5lLUvD
tm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPgpTaWduZWQtb2ZmLWJ5OiBZYW5n
dGFvIExpIDxmcmFuay5saUB2aXZvLmNvbT4KLS0tCiBkcml2ZXJzL21tYy9ob3N0L21lc29uLW14
LXNkaGMtbW1jLmMgfCA2ICsrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
NCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL21tYy9ob3N0L21lc29uLW14LXNk
aGMtbW1jLmMgYi9kcml2ZXJzL21tYy9ob3N0L21lc29uLW14LXNkaGMtbW1jLmMKaW5kZXggOTcx
NjhjZGZhOGU5Li41MjhlYzgxNjZlN2MgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbW1jL2hvc3QvbWVz
b24tbXgtc2RoYy1tbWMuYworKysgYi9kcml2ZXJzL21tYy9ob3N0L21lc29uLW14LXNkaGMtbW1j
LmMKQEAgLTg4MCw3ICs4ODAsNyBAQCBzdGF0aWMgaW50IG1lc29uX214X3NkaGNfcHJvYmUoc3Ry
dWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAlyZXR1cm4gcmV0OwogfQogCi1zdGF0aWMgaW50
IG1lc29uX214X3NkaGNfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCitzdGF0
aWMgdm9pZCBtZXNvbl9teF9zZGhjX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2
KQogewogCXN0cnVjdCBtZXNvbl9teF9zZGhjX2hvc3QgKmhvc3QgPSBwbGF0Zm9ybV9nZXRfZHJ2
ZGF0YShwZGV2KTsKIApAQCAtODg5LDggKzg4OSw2IEBAIHN0YXRpYyBpbnQgbWVzb25fbXhfc2Ro
Y19yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAltZXNvbl9teF9zZGhjX2Rp
c2FibGVfY2xrcyhob3N0LT5tbWMpOwogCiAJY2xrX2Rpc2FibGVfdW5wcmVwYXJlKGhvc3QtPnBj
bGspOwotCi0JcmV0dXJuIDA7CiB9CiAKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbWVzb25fbXhfc2Ro
Y19kYXRhIG1lc29uX214X3NkaGNfZGF0YV9tZXNvbjggPSB7CkBAIC05MjUsNyArOTIzLDcgQEAg
TU9EVUxFX0RFVklDRV9UQUJMRShvZiwgbWVzb25fbXhfc2RoY19vZl9tYXRjaCk7CiAKIHN0YXRp
YyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIG1lc29uX214X3NkaGNfZHJpdmVyID0gewogCS5wcm9i
ZSAgID0gbWVzb25fbXhfc2RoY19wcm9iZSwKLQkucmVtb3ZlICA9IG1lc29uX214X3NkaGNfcmVt
b3ZlLAorCS5yZW1vdmVfbmV3ID0gbWVzb25fbXhfc2RoY19yZW1vdmUsCiAJLmRyaXZlciAgPSB7
CiAJCS5uYW1lID0gIm1lc29uLW14LXNkaGMiLAogCQkucHJvYmVfdHlwZSA9IFBST0JFX1BSRUZF
Ul9BU1lOQ0hST05PVVMsCi0tIAoyLjM5LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxv
Z2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
