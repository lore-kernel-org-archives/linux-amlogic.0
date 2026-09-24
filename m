Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CAE5C98311
	for <linux-amlogic@archiver.kernel.org>; Thu, 24 Sep 2026 10:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UK91IGNQE0nqfNTEQLxV87UEZUrHP7Edg30yIW0yvO8=; b=ElZddqf646wqG6EVCCK0MJ9w96
	d48s+0C3f5qHjBLgd63GhJ9i6IszS92FCPvVfo29FvqDyUrQxh233EOuRamlX8dTMHWX7PLqOp9Fd
	CGtseJJC5drAZxfb0g+vgOqXYPKDyJfbJCDfkLDgBZupoKrbtz807Kur4LR3nhB8Y8GIP7YKOPKBw
	KZMVJC2tqFnRhviHcIjxOkNXK5+pk9zZkBmu2JLum9Ee2yKWZOVY7VG4yQSqROYa8CGGhqP8dF5t/
	bfGopnlT/cyZ7OWCGt0nEj4bgmtVKn1n8dEmSAyiUY8I/Zu+5BpSvVjWjzorvvj7LNPTjRnxqoK2a
	hwUXQX0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9gpz-0000000AkkE-3XLU;
	Thu, 24 Sep 2026 10:38:03 +0000
Received: from mail-koreacentralazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c40f::6] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9gpv-0000000AkjN-36aN
	for linux-amlogic@lists.infradead.org;
	Thu, 24 Sep 2026 10:37:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S+lN1ShL6F8RypAKtxB+Q1YhiJ803rZFM9X54+uwQsFKoA+40rthju+IZpumn/04WJhAG9w0LfTkj8t/YJFPPSccIeljrGZwuPF9MfZINn8zxVC+qbir6O8G7MgfSnXZrzG7pp/QrTohe1ZSN4z26DaV9vfK5MWHeSDU8RKUCpJ1Aw12KS8cLGbHmr2GFKt8Kcgv0bQAbQ0x81RnHEpzylCh43a2XixrK4WYevOHPSGeekee1SwzyQHBQcwElE4Ggt7rVzuRoTqvTXuvc+f/64UhjyczzsQNpgOWvbjoP5K3fo5e7JhQJPVVJKy4rSYlNQ2IAtZkYLOwrcAzkqzDNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/aVGVA/y5suqMtGINtsNZSCng9qJcTNEhVywcJgm6MY=;
 b=Z4NK70mVSIDUkWgZ/xZEw3+b3Y1IQa1rTCLuq5zGGKD/n0G16H4vZVYKJhjkX/AH8Xa+wJ5kKBvOhTIMGdqrV2TEl1TqSHC6kn6AYKsJISzOknXk+RujjbJWvlIHdsOdC5KOGu77hOHHj44VgDzjPOMDPSufgOV1ruzEgG7aDHTHLiuVJ2F+ayYgNk6Pmpx7DhqIxTrw1WkhiMLPbp6pg4gcDrxfdRjvwB0RUkXALASVW5kwb5+54j7msXzhIckidTvNGzCDiz+D5wVpvpSdS+BgCe1SWCSbyhIMlI2fUL5QycDvd9h9iKf7hS3BO19MNMm9VBS/38s5j39LtdqOUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/aVGVA/y5suqMtGINtsNZSCng9qJcTNEhVywcJgm6MY=;
 b=fk6C/UAyfHvVspRKqIobEOlQ6YWX5rMja/S1DfBjHifbSg/NCrpU3XLqqJ7OJ9gcZoTjK53PqBd5prWhMuqRPIrgvm6TKlnete8aIdkndibNgEINAAI4yVC93eYbpjdGSNqRqIV/9CAhWsDcBCCEORo6upzm829qGqfTZa2LBRekg80AyUsu6fOt/WAkG26zj44K37O4YqtGrxHnK8gTUV6fnLdt5dxwpUTfEuuKxUJQnDmKjIB0H1Z4Pq/BJ7hZnzRhONXBOJ4/2/kLfD2BMu3E55tEmZAdwhM1+IBCzF7c1o1crZriKwCIFwMaC6saCYsSvUp+vWiyg7XsYfIGww==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com (2603:1096:820:ca::7)
 by KL1PR03MB7902.apcprd03.prod.outlook.com (2603:1096:820:fa::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.16; Thu, 24 Sep
 2026 10:37:43 +0000
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506]) by KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506%3]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 10:37:43 +0000
Message-ID: <e9ac114c-625e-4d76-9aae-0afb90d0ed92@amlogic.com>
Date: Thu, 24 Sep 2026 18:37:40 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 3/3] clk: meson: t7: Model PLL pre-divider as a
 divider clock
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 robh@kernel.org, neil.armstrong@linaro.org
References: <20260923-meson_refactor_n-v1-0-3a8ce27121a2@amlogic.com>
 <20260923-meson_refactor_n-v1-3-3a8ce27121a2@amlogic.com>
 <20260923112659.8A02B1F000FF@smtp.kernel.org>
From: Jian Hu <jian.hu@amlogic.com>
In-Reply-To: <20260923112659.8A02B1F000FF@smtp.kernel.org>
X-ClientProxiedBy: SE2P216CA0018.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:114::17) To KL1PR03MB7149.apcprd03.prod.outlook.com
 (2603:1096:820:ca::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB7149:EE_|KL1PR03MB7902:EE_
X-MS-Office365-Filtering-Correlation-Id: 956b2bab-cb4f-4ac3-7675-08df1a27dd40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|10067099003|4143699003|56012099006|11063799006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: tBgjBRxkAgP5ucIFFR38Ik9UeEY8gkt28Ys0n5YYeCtcnaNbwcZeRgwWFOHOwjJ68J4W8h9VkdX3ef2WjsvjpvlHHsbvW9BtSdlU9FV8iDPKpNNMGV2PlKAxF1ncIQ96xAT6qyz3D1GrJdfCNsprf5Z1mrzJC3kWly+HPm7+NfoTq25icpCrALg+44twcD+4tnQWqn3JFvQi/1xEMFMvzgCHlr2k4BLBmQNJt+zc/8fbhKttJ0xfkMPGMawcTfsDMpCYw3l3/ly13n7TfflniFNc3iqa4WAysOZQb2ntdV7XF1PrYTP+tWPSObtJBRXHxRsl7INoMRdrIPsXEqabqYmiYeY1s0FjTP5ER5QZGIHQ2kST0H/cA5tH0rS+6Rc/RuVytHog6YGvNviZ1A5fujA6dkFRf7cFf7ZbERzdbnIsxyXUMDhUvIPNgQywW72uqwBLV343HCr5PTUotJFuSeItTBYOkA1ONDn1ZO2Au1fUPfkHE7+oropGNjbBvsBqPoNDvgkfvmDCs1jV5Gv8d6a2E4OxTYlqN88baW+Kbqn6cXXe4uGOI4bOZxo8FXavT5NNEhlkURggDr2zzkK6JtMaR+8L0/BkHp1mlF9STzY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB7149.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(10067099003)(4143699003)(56012099006)(11063799006)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bCtmNE9rbmxMT0l5MnJ3a2lHSkptRWtzODArSjRRRXZVcUxydG5MK21Dcnhk?=
 =?utf-8?B?K3VtbjNzcHBER1VpR3htWkgrUU82MUUway84QnNpRGpFRnBFKzhwRmxrZU1C?=
 =?utf-8?B?bHhWakxvV3BJMEMxYlZVUFNhc2pobHhNWVBzT1dnK2Z3a0wxZzlQV0FHdDNE?=
 =?utf-8?B?V01XaGdHVGlzVDlNUWJZNW45ZVhlc3lVam1JcnFSOExSK29zcnNsQWZtYVVM?=
 =?utf-8?B?emxNNXVpdGVrRDJyMjU3dWMydlRrbHZnYlFWazV5amdSSVFBRERHVEFsc0Rh?=
 =?utf-8?B?MDFIRFBZRGZtNFNGSkVOcEpMMlc5S1FqOEZxcHJlVGJEYVFDU1NQSUwrbW9W?=
 =?utf-8?B?WUFFQWhQSHRWWW1SVUtWaVJjU0s1WHEzSmtHWkl3QXJTRUduYjZBUGtEcU1h?=
 =?utf-8?B?UlVjOWMyUEorS0t6VXBkWmgvaHZWSjdvU2ZFK2dneHR0cVpxNG55OUN0bkxM?=
 =?utf-8?B?ZjVuaDVpM0pLRjdRN3dBTXJpZ2loeDU4Z3B3RTBnQ0svV2hEZTIzaHlnMm1l?=
 =?utf-8?B?OXJpVEdJUldVQWtPbHlmSjlVQzB4OFhBWTI3ODZwL1VpLzNXUHIrUXZnaytQ?=
 =?utf-8?B?Mmk0NG1IcStDZzJES3M2alBRMCs4ZDRaVWZzQURjdkJFL0F0UTBvcU5BK1pM?=
 =?utf-8?B?V3lDSXJXTy9YSlNoK0twblc4Q0FWTXRiVUpEajQ1VTAzVFVhYks2MnBCQ1kw?=
 =?utf-8?B?NDh4dDlJdDJBb2t1ZUE5OWNtQ01iY1gvcFFoTmRMMnZVQWVZZ2V1NTF2emwx?=
 =?utf-8?B?TGt4cklybHBKUE16eDBFTUhwMDBvWHptMGw0QlJlOWc1bnkxRmFjODJVNDVy?=
 =?utf-8?B?N00xclFST2lhN0dIcFh1aVY3Q09BL2FDYlU1NVRYb1pWWCs3MmNpSTByc1cx?=
 =?utf-8?B?eG5rRVJmalg3anNETDJJTVFJRmMrd0prL29ZLzZYZEVhU3picHc0d1hDNTlP?=
 =?utf-8?B?TENYZXYxalUzT2RBbmkvR0lmazVGVWd5bDBSQTQxdXR3M2N3RHN0SWM4dmdK?=
 =?utf-8?B?aFQ2RnlBQjhzNG1VY1pneVhOemNjeWR2TFFVVDM5WmFFdU0rbGJFTDJnaXF0?=
 =?utf-8?B?ZW5iSDdoY2VVOG4zNlRSc1V2ZDRZV2dld1k0eUtVOVd3STFadnNlNnFhZFdF?=
 =?utf-8?B?cXVGU3Y4MS9RYWNLZHk1ZzFDK1lhd0M5RWx2czRIS202NkhoRlFBbDZ3TG9r?=
 =?utf-8?B?YjJNdWhVeDBUb0FSeklqR01RTElLcEg4bXpBOHBBWHhCUmowRGJVcU5DWm55?=
 =?utf-8?B?clFhdFRYTmpoRktJd05GcFZTdkJiY2JWcENIb3RRblpRdzQwN0h1ZjVFd09k?=
 =?utf-8?B?YUFja1VxdUhUQ1FkMWdnWEREQmZpUWZTckoyK0hMN0F0alIxYkp0SDI0RVNl?=
 =?utf-8?B?RU5SSThVS3hKcjlxWHg2aWFCS2FTbnBMMXhLZHc5Y2RRWFB1M0JkNGV5cVpu?=
 =?utf-8?B?S1ZxNUFMcXNuSXpnbC83T3k1cGJhMThBN1gwWDJyUmY5dWpkQlNhRVNpYWc0?=
 =?utf-8?B?Und1ejVzV1VGVGlWUlNSbXBMaUs1eVdBNEhHKzluWVdaaHRzajN6bUpFVm5i?=
 =?utf-8?B?SFEvSTd6R0lZaFRIZGFWbjFBc0pEN0F3M0VHMWZ6OEYrdU9wV05UYVhyM2RP?=
 =?utf-8?B?RFFxWU9sR2pMaWxvTUJvYnpBOW1wdjBWN2FDZWFpL3JvaXpLVDZjSFpTeERF?=
 =?utf-8?B?VWxOeXpobDlkSU0rV3J3OFkvQ2dtek9GUDZCRkFMNU9iVVQ2L0t2Zml5KzNZ?=
 =?utf-8?B?MCtHU1J1ajEwWDVrcUc3aU9NTmFLS1VrVEwwdG9zK0NaMWNCN1NBc0FOSjlF?=
 =?utf-8?B?bE10eEdGZHE4WTcyZUVjek11c3RCTk5CS1RRdEhaWjhPL2hxQXQ1aDNhUUtU?=
 =?utf-8?B?RW9zbzRCMTduekgvaGhadHJUVDBFbXZDdDJnM3IzMU5IMWlBOTlTclp4OTZU?=
 =?utf-8?B?cEZRNkpLOTZsOFptU0t3c0tDaXpKMGNaOG15MGJxeGtXcFJSWGplYncyVUp3?=
 =?utf-8?B?OGRnbDhKb2FQUGFNQlQ2OUpKVXJiZGdWM1plZU45YUZLdjAweGhoMWZ1a2Nn?=
 =?utf-8?B?SGZiNVhvSHlPc2E1NGtQRk1CL2VSUVQ0ZGhycWZ6MEpXcjNKMGdtcW8wTXNU?=
 =?utf-8?B?eGlnYXZjOWdxMFlBcms4YTZlbFczSWZBUVR6T25kWWlsQldRcnNscFZhSGRw?=
 =?utf-8?B?LzdWenFBYlNRMmRSV0tmUlV4dFMzcjFDQ0l0MERIazBJVWltQW1ud3lGeit1?=
 =?utf-8?B?M20vSXF1cFlEOHJMTDFrcWV5djM1SEMrMllBSkZtcUxKVG5VR3Y1a0RxU2pM?=
 =?utf-8?B?UHhaM3B1RWJrUnpFaSsvWTN2UHd1QjF0ZVRXckloakhhbFByRXZwdz09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 956b2bab-cb4f-4ac3-7675-08df1a27dd40
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB7149.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 10:37:42.8980
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2y1rccH5oPmpoy7x1XWZxfvCgUST2GgftNJg4Qg3AUED+y1loAwk6rtMIvoBvbIbd2+pYtN5+ysLdx+uUSFHsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB7902
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_033755_793584_1194467B 
X-CRM114-Status: GOOD (  23.84  )
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

Ck9uIDkvMjMvMjAyNiA3OjI2IFBNLCBzYXNoaWtvLWJvdEBrZXJuZWwub3JnIHdyb3RlOgo+IFRo
YW5rIHlvdSBmb3IgeW91ciBjb250cmlidXRpb24hIFNhc2hpa28gQUkgcmV2aWV3IGZvdW5kIDIg
cG90ZW50aWFsIGlzc3VlKHMpIHRvIGNvbnNpZGVyOgo+IC0gW0hpZ2hdIGNsazogbWVzb246IHQ3
OiBQTEwgcHJlLWRpdmlkZXJzIHBlcm1hbmVudGx5IHN0dWNrIGF0IDAgZHVlIHRvIG1pc3Npbmcg
Q0xLX1NFVF9SQVRFX1BBUkVOVAo+IC0gW0xvd10gY2xrOiBtZXNvbjogYnVpbGQgZmFpbHVyZSBp
biBkcml2ZXJzIGFmdGVyIHN0cnVjdCBtZXNvbl9jbGtfcGxsX2RhdGEgY2hhbmdlCj4gLS0KPgo+
IGNvbW1pdCAwM2YwYTYyZWY0OTQyN2I0ZmVjYjBkZTE1YjUxZTgwY2I0NWJlNjIzCj4gQXV0aG9y
OiBKaWFuIEh1IDxqaWFuLmh1QGFtbG9naWMuY29tPgo+Cj4gY2xrOiBtZXNvbjogdDc6IE1vZGVs
IFBMTCBwcmUtZGl2aWRlciBhcyBhIGRpdmlkZXIgY2xvY2sKPgo+IFRoaXMgY29tbWl0IHJlcGxh
Y2VzIHRoZSBkZWRpY2F0ZWQgUExMIHByZS1kaXZpZGVyIHdpdGggYSBzdGFuZGFsb25lCj4gZGl2
aWRlciBjbG9jayBpbiB0aGUgTWVzb24gVDcgY2xvY2sgZHJpdmVyLiBUaGUgUExMIERDTyBjbG9j
a3MgYXJlCj4gdXBkYXRlZCB0byB0YWtlIHRoZSBuZXcgcHJlLWRpdmlkZXIgY2xvY2sgYXMgdGhl
aXIgcGFyZW50IGluc3RlYWQgb2YKPiB0aGUgaW5wdXQgY2xvY2sgZGlyZWN0bHkuCj4KPj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvY2xrL21lc29uL3Q3LXBsbC5jIGIvZHJpdmVycy9jbGsvbWVzb24v
dDctcGxsLmMKPj4gaW5kZXggMGE2MjJmNDVmYTM2OC4uMDQ5ZjBjODc5YzQ1OCAxMDA2NDQKPj4g
LS0tIGEvZHJpdmVycy9jbGsvbWVzb24vdDctcGxsLmMKPj4gKysrIGIvZHJpdmVycy9jbGsvbWVz
b24vdDctcGxsLmMKPj4gQEAgLTcxLDYgKzcxLDM0IEBACj4+ICAgI2RlZmluZSBNQ0xLX1BMTF9D
TlRMNCAgICAgICAgICAgICAgIDB4MTAKPj4gICAjZGVmaW5lIE1DTEtfUExMX1NUUyAgICAgICAg
IDB4MTQKPj4KPj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgY2xrX2Rpdl90YWJsZSB0N19wcmVkaXZf
ZGl2X3RhYmxlW10gPSB7Cj4+ICsgICAgIHsgLnZhbCA9IDEsIC5kaXYgPSAxIH0sCj4+ICsgICAg
IHsgLyogc2VudGluZWwgKi8gfQo+PiArfTsKPj4gKwo+PiArc3RhdGljIHN0cnVjdCBjbGtfcmVn
bWFwIHQ3X2dwMF9wcmVkaXYgPSB7Cj4+ICsgICAgIC5kYXRhID0gJihzdHJ1Y3QgY2xrX3JlZ21h
cF9kaXZfZGF0YSl7Cj4+ICsgICAgICAgICAgICAgLm9mZnNldCA9IEdQMFBMTF9DVFJMMCwKPj4g
KyAgICAgICAgICAgICAuc2hpZnQgPSAxMCwKPj4gKyAgICAgICAgICAgICAud2lkdGggPSA1LAo+
PiArICAgICAgICAgICAgIC50YWJsZSA9IHQ3X3ByZWRpdl9kaXZfdGFibGUsCj4+ICsgICAgICAg
ICAgICAgLyoKPj4gKyAgICAgICAgICAgICAgKiBUaGUgaGFyZHdhcmUgcmVzZXQgdmFsdWUgaXMg
MC4gQWxsb3cgaXQgZHVyaW5nIGNsb2NrIHJlZ2lzdHJhdGlvbgo+PiArICAgICAgICAgICAgICAq
IHRvIGF2b2lkIGEgd2FybmluZyBmcm9tIHRoZSBjb21tb24gZGl2aWRlciBjb2RlLgo+PiArICAg
ICAgICAgICAgICAqIHNldF9yYXRlKCkgd2lsbCBwcm9ncmFtIHRoZSB2YWxpZCBkaXZpZGVyIHZh
bHVlICgxKS4KPj4gKyAgICAgICAgICAgICAgKi8KPj4gKyAgICAgICAgICAgICAuZmxhZ3MgPSBD
TEtfRElWSURFUl9BTExPV19aRVJPLAo+IFsgLi4uIF0KPgo+PiBAQCAtOTcsMTEgKzEyNSw2IEBA
IHN0YXRpYyBzdHJ1Y3QgY2xrX3JlZ21hcCB0N19ncDBfcGxsX2RjbyA9IHsKPj4gICAgICAgICAg
ICAgICAgICAgICAgICAuc2hpZnQgICA9IDAsCj4+ICAgICAgICAgICAgICAgICAgICAgICAgLndp
ZHRoICAgPSA4LAo+PiAgICAgICAgICAgICAgICB9LAo+PiAtICAgICAgICAgICAgIC5uID0gewo+
PiAtICAgICAgICAgICAgICAgICAgICAgLnJlZ19vZmYgPSBHUDBQTExfQ1RSTDAsCj4+IC0gICAg
ICAgICAgICAgICAgICAgICAuc2hpZnQgICA9IDEwLAo+PiAtICAgICAgICAgICAgICAgICAgICAg
LndpZHRoICAgPSA1LAo+PiAtICAgICAgICAgICAgIH0sCj4gW1NldmVyaXR5OiBMb3ddCj4gV2hl
biByZW1vdmluZyB0aGUgLm4gcGFyYW1ldGVyIGluaXRpYWxpemF0aW9uIGhlcmUgKGFuZCBwcmVz
dW1hYmx5IGZyb20KPiBzdHJ1Y3QgbWVzb25fY2xrX3BsbF9kYXRhIGluIGEgcHJlcmVxdWlzaXRl
IGNvbW1pdCksIGRvZXMgdGhpcyBwYXRjaCBzZXJpZXMKPiBhbHNvIHVwZGF0ZSBvdGhlciBNZXNv
biBkcml2ZXJzIGxpa2UgZHJpdmVycy9jbGsvbWVzb24vZ3hiYi5jIGFuZAo+IGRyaXZlcnMvY2xr
L21lc29uL2F4Zy5jPwo+Cj4gTG9va2luZyBhdCBvdGhlciBkcml2ZXJzIGluIHRoZSB0cmVlLCB0
aGV5IGFwcGVhciB0byBzdGlsbCBzdGF0aWNhbGx5Cj4gaW5pdGlhbGl6ZSAubiBpbiB0aGVpciBk
ZWNsYXJhdGlvbnM6Cj4KPiBkcml2ZXJzL2Nsay9tZXNvbi9neGJiLmM6Z3hiYl9maXhlZF9wbGxf
ZGNvKCkgewo+ICAgICAgICAgIC4uLgo+ICAgICAgICAgIC5uID0gewo+ICAgICAgICAgICAgICAu
cmVnX29mZiA9IEhISV9NUExMX0NOVEwsCj4gICAgICAgICAgICAgIC5zaGlmdCAgID0gOSwKPiAg
ICAgICAgICAgICAgLndpZHRoICAgPSA1LAo+ICAgICAgICAgIH0sCj4gICAgICAgICAgLi4uCj4g
fQo+Cj4gV2lsbCBsZWF2aW5nIHRoZXNlIGluaXRpYWxpemF0aW9ucyBpbiBwbGFjZSBjYXVzZSBh
IGJ1aWxkIGZhaWx1cmUgd2l0aCBhCj4gJ2hhcyBubyBtZW1iZXInIGVycm9yIGZvciB0aG9zZSBk
cml2ZXJzPwoKCiDCoEkgd2lsbCBpbmNsdWRlIGNsay1wbGwuYyBhbmQgYWxsIHRoZSBQTExzIGlu
IGEgc2luZ2xlIHBhdGNoLgoKPj4gICAgICAgICAgICAgICAgLmwgPSB7Cj4+ICAgICAgICAgICAg
ICAgICAgICAgICAgLnJlZ19vZmYgPSBHUDBQTExfU1RTLAo+PiAgICAgICAgICAgICAgICAgICAg
ICAgIC5zaGlmdCAgID0gMzEsCj4+IEBAIC0xMTksOCArMTQyLDggQEAgc3RhdGljIHN0cnVjdCBj
bGtfcmVnbWFwIHQ3X2dwMF9wbGxfZGNvID0gewo+PiAgICAgICAgLmh3LmluaXQgPSAmKHN0cnVj
dCBjbGtfaW5pdF9kYXRhKXsKPj4gICAgICAgICAgICAgICAgLm5hbWUgPSAiZ3AwX3BsbF9kY28i
LAo+PiAgICAgICAgICAgICAgICAub3BzID0gJm1lc29uX2Nsa19wbGxfb3BzLAo+PiAtICAgICAg
ICAgICAgIC5wYXJlbnRfZGF0YSA9ICYoY29uc3Qgc3RydWN0IGNsa19wYXJlbnRfZGF0YSkgewo+
PiAtICAgICAgICAgICAgICAgICAgICAgLmZ3X25hbWUgPSAiaW4wIiwKPj4gKyAgICAgICAgICAg
ICAucGFyZW50X2h3cyA9IChjb25zdCBzdHJ1Y3QgY2xrX2h3ICpbXSkgewo+PiArICAgICAgICAg
ICAgICAgICAgICAgJnQ3X2dwMF9wcmVkaXYuaHcKPj4gICAgICAgICAgICAgICAgfSwKPj4gICAg
ICAgICAgICAgICAgLm51bV9wYXJlbnRzID0gMSwKPj4gICAgICAgIH0sCj4gW1NldmVyaXR5OiBI
aWdoXQo+IFNpbmNlIHRoZSBwcmUtZGl2aWRlciByZWxpZXMgb24gLnNldF9yYXRlKCkgdG8gY29y
cmVjdCB0aGUgaW52YWxpZAo+IGhhcmR3YXJlIHJlc2V0IHZhbHVlIG9mIDAsIHdpbGwgdGhlIGNv
bW1vbiBjbG9jayBmcmFtZXdvcmsgZXZlciBhY3R1YWxseQo+IGNhbGwgLnNldF9yYXRlKCkgb24g
dGhlIHByZS1kaXZpZGVyPwo+Cj4gV2l0aG91dCBhZGRpbmcgdGhlIENMS19TRVRfUkFURV9QQVJF
TlQgZmxhZyBoZXJlIG9uIHRoZSBEQ08gY2xvY2sKPiAodDdfZ3AwX3BsbF9kY28pLCByYXRlIHJl
cXVlc3RzIHRvIHRoZSBEQ08gd29uJ3QgcHJvcGFnYXRlIHVwIHRvIHRoZQo+IHByZS1kaXZpZGVy
LiBDb3VsZCB0aGlzIGxlYXZlIHRoZSBwcmUtZGl2aWRlciBzdHVjayBhdCB0aGUgaW52YWxpZCAw
IHN0YXRlCj4gYW5kIHBlcm1hbmVudGx5IHByZXZlbnQgdGhlIFBMTCBmcm9tIGZ1bmN0aW9uaW5n
PwoKCk9rLCBJIHdpbGwgYWRkIENMS19TRVRfUkFURV9QQVJFTlQgZmxhZyBmb3IgRENPIGNsb2Nr
IGluIHRoZSBuZXh0IHZlcnNpb24uCgo+IC0tCj4gU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6
Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwOTIzLW1lc29uX3JlZmFjdG9yX24tdjEtMC0z
YThjZTI3MTIxYTJAYW1sb2dpYy5jb20/cGFydD0zCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1h
bWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
