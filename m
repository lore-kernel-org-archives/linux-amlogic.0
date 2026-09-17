Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D7CFC982C1
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Sep 2026 06:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bHaOe2tlN2tOGyhzpvwroCIOvZ5GAXL5gg+tKZR72nA=; b=mY9fs10LN/cIiaQv8+Z59WRloL
	JpJot5fysJqGGtU4gSIJs4hS9Wrd8vowzp02rn/ZO32/xVruIiLi22VM1IAdLtzRZUS9TuUBdoPgW
	3kPc35XTpLetS/CkTn8rc3PhOx9rDSOiqEuUvU1yNMct41ZIfLmr9w/rWmLt/RfV73KbRKUsqpXfP
	EnMeznpdnCmNEnR/3m3quFE21+GkVduv2CnTCW7Nf5F3PcdFUeftp1i5KsGBcG5Zf9RI8jGnLGJ3T
	Uf3p+Oa/YNPRDM9Z3o7iBEsGr1uZFFa00/odHB57HR/Vy7+u3Q54q/I4opA37KuHg0Xt9AER/triE
	ykzMAmCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x75Hj-0000000Ae2v-0xUS;
	Thu, 17 Sep 2026 06:07:51 +0000
Received: from mail-japaneastazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c405::5] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x75Hg-0000000Ae2E-11bt;
	Thu, 17 Sep 2026 06:07:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b8AYptPE5yGo9mVcxvxKqxPtsnBHcQbgeAMQ4i5F460Ew6agWXMYE7W8OSac2ZRA9Kf0ivtqYu+FZL7FcHKYjYEG+tZKBWfVOkJ6Zy0UwxnArKkjCQ2ExduDPN0M8voC94O+HOKgzNqYST0/wBebZcBW7qLIEZXbI5jlgnftzb6nI0yCVU2OqQS6OLgWoK5Oz4+o06CH9cogUrmna8pZ0X2l8QINc5SyQLMGm0k25f23vB4dUEnXwNFiD5EOCmJ+iPlsp5IJhvJwWHuUd/+UMnZJZN1VL+IExmtFT5WUjf2/D7RW45TYZhEHf5DtGTH/ef3FVrhXTBTKdKvSpqKW9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5WGWVZIJTN73nnAt2fmct3ewzAbNCg3VBnXJnDiYAtg=;
 b=wZo4mpT8fyzpiCLHHDyhu8dYPg9qR2pUl+kHTNpZE0oklNdkRn9X0L08gb9RScuVViyn0UQAqwvvgcNjukDN4cD5b5UI2uLAmyZdsCH8RMIXRp9mcNDjJl5QUQcI+C54p9zGqLTN6a5esDeHkup1XNivYGoX0rxBYSMwO8KBzgRvJHBQz3KsP8GWp+AbSt9C76hqrNBJ8G8dtmu5biVNHcG3cSz67g5DAjECjYqIFZlEiEF+9kObU7E7b7UVbs4HnmDiLqyV6KQnm+dMbtSfkzF7U156QGm/DvZXsJuF9pzmf5OZACJ19rg66f2Ei5k+UhXlpy6jU58hEN6YLbwHSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5WGWVZIJTN73nnAt2fmct3ewzAbNCg3VBnXJnDiYAtg=;
 b=C5KzEO6C2dN7GLpDCCt4lmyy/WMa0evRxLk1QMw394scukkJKFtHqBDI9gb08zkLafgYXOL9cjYMum7VIEeI7UJqI/8XSh5LiMW53tAL3cK9kCcd9LBe9fLkVMOY/qRLZApa4GDcN6pP2gxthXh4u9rJbZGn7kh4plyeqKj5Qrg3kSuSDxw5jYvL+2qYabw7E8KgYBJmCdEkQxGxGiE6ygumi+p8dtpyv/3fqkpxJVdAC/jDnUdGsruSAiBwR37Cf0Y8VEgBspXfmm+/GHSHT/IPs1k6pS9wsuhmm0to+wU2M85C83iJ9NwAolYWzaVrJfbxs8sAov4M+ABdomhi3A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5521.apcprd03.prod.outlook.com (2603:1096:820:51::12)
 by SEYPR03MB8226.apcprd03.prod.outlook.com (2603:1096:101:1a6::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.12; Thu, 17 Sep
 2026 06:07:42 +0000
Received: from KL1PR03MB5521.apcprd03.prod.outlook.com
 ([fe80::f12b:85e:f95c:191e]) by KL1PR03MB5521.apcprd03.prod.outlook.com
 ([fe80::f12b:85e:f95c:191e%3]) with mapi id 15.21.0428.011; Thu, 17 Sep 2026
 06:07:42 +0000
Message-ID: <7afbc566-ba8a-4b73-831b-7c596c95ea90@amlogic.com>
Date: Thu, 17 Sep 2026 14:07:38 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/6] media: dt-bindings: Add Amlogic V4L2 video decoder
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org
References: <20260914-b4-s4-vdec-upstream-v9-0-72fdb0d71b02@amlogic.com>
 <20260914-b4-s4-vdec-upstream-v9-3-72fdb0d71b02@amlogic.com>
 <20260916-fat-enthusiastic-termite-44b2e2@quoll>
 <37bbcf5c-644a-4388-ba8b-11608f444ae3@amlogic.com>
 <05189f26-1d24-47a7-abef-ea4c25d2964f@kernel.org>
From: Zhentao Guo <zhentao.guo@amlogic.com>
In-Reply-To: <05189f26-1d24-47a7-abef-ea4c25d2964f@kernel.org>
X-ClientProxiedBy: SEWP216CA0118.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2b9::16) To KL1PR03MB5521.apcprd03.prod.outlook.com
 (2603:1096:820:51::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5521:EE_|SEYPR03MB8226:EE_
X-MS-Office365-Filtering-Correlation-Id: f35e8e1d-aceb-4313-c4db-08df1481fbed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|7416014|1800799024|366016|22082099003|18002099003|3023799007|11063799006|4143699003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info: lxdjPyx8aUB5nYtvumhy4EC1d5xBPcJEsGr3iQD7LrKAFPyEQhPFvKJYhb3IQoxMhDUVu05zoavqQb7jM2mf3v43DzDENu2bWS1pS+SME7PtUbIHnE4sWDZNsfVoXPZvy0zpTFBCWEFpRsBDe5KWg4H934g3lG8CwVl1hMdQRXGkviXQ+e1wjaypgdH2S9wN0ADMYT22m3Hxb/X1UMc3o96h+uJEYGguoS9lV5+onrBCh9TLAQMlwZjAnh9o9hk+K8T+YiUP0b3qswX0m9EBuNk7PCTk6dnVLR+h7FGjkaVA/yDy7saFrc0uivzHr0UBo8qrjGKw0/upBmbwbfbty+7CfmxFAqwVZUibTLQ88vwWoEmoo0JMFNJah1pH793mHSnOzsJktA6spx36e0+FAHEtiqtywqhIUmhEqt6qi6pxe8YjTlNh1dxUHGn+5ptvtryLrvH5Of/vsUl5gM1Ez/+X5S3o64xXhIvwagCZ+Pw0Zd76pQ3+zIw8FMXTiVHf0Qb4UsQnmsQJ2KczugGVu/s9+zSgfLgm05fdOEgUY0AOX2QMaVH46zNi4MAuLxgiddpue9lo4B218JRazbyl3XTQFCvT6NyF5KdQgvYCfBYK2QMv46LhN6KkJrJWOEih
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5521.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(7416014)(1800799024)(366016)(22082099003)(18002099003)(3023799007)(11063799006)(4143699003)(10067099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WUtnamtOS1drZWJ4cmNkUjQydittaS84YWl3N0Fzd2l6NFhpZ3RScTdsckJM?=
 =?utf-8?B?RmRseDJTU0kyWCtjZlpjZTNNTDk1L0FZNkhycTQyMGhMMFNJd0M3bkt1L3dW?=
 =?utf-8?B?dTBKSjNoSTA2Q0FPTm9hbDlQdXh3ZmJRT1FzQTdjeVJka3hsSUFsYjBiQjdv?=
 =?utf-8?B?UWFjeVkwS3dXU081Snp2alA0Q0xLS2xlVG9ickFLd3Q1Lzh1Qkd6REJNLzJF?=
 =?utf-8?B?VTV3dy9CWG9MWFJra3pQY3NjN2xYaWpLdkNDOHppVGhDc1JxZFJ5Ymc4bkF0?=
 =?utf-8?B?eTltb0pNempqUmdFeXl6YjE5eitVZnZaS0hOZE56Y0twMSs3clVLeG1QSTZi?=
 =?utf-8?B?TWlHRWo5KzRXUkRiMW9CV1dBRDBJOTRIQXNOd0Q2R1NoMGNFdWtxdVRIbzkv?=
 =?utf-8?B?bVRaL0NORTdVQkczWHZJWXNQY2daWUEvWHVySXVBWG5JL0x3MmpycVo3WC80?=
 =?utf-8?B?Z2RRdXI2Um80YXNtQ0RJeWV5V1EvWXdpWjM1a3c0MlgwU015S0Q2dUdkL1Fr?=
 =?utf-8?B?dmpPd2pGVkhGZXlhWWJzMW1wdlpWU0lxZnhIMGZEa1lheStsRW40dU5pNjFu?=
 =?utf-8?B?YUpvam5FWnliRjhJY2ZtT0RZbEVTZmRiSmlCVzV6dUpmRGtISy9waUh3UDgx?=
 =?utf-8?B?b0U2a2ZnMHB4QnduWU8wVHlxS1hPMTk5YWlXUGw3bUtPQjY2Q3d2SC9nMVp0?=
 =?utf-8?B?QjNsUVJGWUg5VHdsZDJrelFQZnBad20zT0lSbUhKeU5SczhYS1QxTWVKUEJK?=
 =?utf-8?B?MW9TZDU1RzRPZ0x4SkhzS0ZmbXR3ZTd6WXZFb3B3WXVJWjN1VGxYNHpkMTBF?=
 =?utf-8?B?cVdCTkVhZ0FXREZoem9aM3BLQkxJWWh5eU5mTDhRSFJieGczMU1NaUw4RFJs?=
 =?utf-8?B?eXZadE05NGZPNjRSTktuQnZhOHdPdGhLdGk0clBaWkFjbmJzTkpQcFQ2c2ZK?=
 =?utf-8?B?TkFiZDNzM2JwWS9vNy96WGdReVQ5QUlRU2tKTnhvK2kvOVZ3R2o1dlYxQTZL?=
 =?utf-8?B?YW9sS2pyc1RPRzIvQ0JlTnNpMW1aOWc5ck9jSWtXdnhlM20yNzJoa2c0dlYw?=
 =?utf-8?B?cDdlQ2NkdC96Z0F5VWtZZFZGNnRlMTdtUEZGT3BPUHVOVzlWcGJnanJDb2N2?=
 =?utf-8?B?N1JxeG1jM0hjSXZFV2ZXRmZpZ2xQdVpjK1pPcHk5bVFDYkNnTzV4OVZWRmxr?=
 =?utf-8?B?VlpjY2g1SEpZUlhEaW9BUndhR0RMQkpPSENRZTVKT29Tdkkyc0tVTWd2OVF6?=
 =?utf-8?B?L3VVVXEwSERYQ0dZQU15K2dKVHM3ZmJpMnpJWEwrNllSb1NxK25BdHVUR2ZU?=
 =?utf-8?B?dUZKWVJPb0RjcE9LYVMzTS8zd2xYQ3JSVDlNdm1LN0o5VmtkRkRpM3VSbDJy?=
 =?utf-8?B?UzNyTnh6TUlzdERPVml0cGRBUkZQZEpuZEdTclpuNVlVcmpLTitJbzNpeWZw?=
 =?utf-8?B?M2VBNTlPUDhZeGhOcElBUnlaRk1BdE54YUNaZzlxeDdEanVFaXNGaVhqNFlF?=
 =?utf-8?B?TkJTcFNxNXZlV0psY1lWQkQyVUk5UFZSYSs1U0dVRWdTd2x2QXZiNTRxbFJF?=
 =?utf-8?B?TExSZnpCZ0N0bmUxVUdremZQVzhITW5kNWhGaDBNMDF3S2J5ejd1cDAyQWky?=
 =?utf-8?B?azZUSk1yUS9EOVVzNUNTRzcwOUNQU1RHK3VCdkdJc1B5bjN0OGcwdVN4aDFS?=
 =?utf-8?B?S1JnS1pnUGtXY1JRWk52TW5ObndwMTZDRXVXWkNDSWhWMjE5RFM1U3FBUEU5?=
 =?utf-8?B?dDRybjI5UnNZdS9TRHc2U01rV1l6d2NBNTA3Rzh6K0g3bm1BRDhhQ0xGZ05n?=
 =?utf-8?B?emxkb2JxS0N2WVh3d0JMcGtLdnliTU5LdUlXYk9pTlRTV2tsaFArZzRDR1h4?=
 =?utf-8?B?bHJpZjU3T3M2TDN5ZExReStLeTlXUG80VHVyUVRLSWhoTHN1UnZLQ1JlUlNQ?=
 =?utf-8?B?UjIxVmhoMnRRcklBTUl1SUY2dSsvQ1VUZUFHcldCSlpONTY1NFZmUXJQSmdY?=
 =?utf-8?B?RlNYRVJ5NUhZYnlhaDhPZGQ0MTRXU2RqSXhKdkhneEorK2JNZmVNN2pVODZC?=
 =?utf-8?B?NUV2THYvcHd3a1ZFeEVlVG0xcVJIU3lnMWpRam44bUp6VzBmemc5ZzBvRW1Z?=
 =?utf-8?B?UndDS2JUdnA5S28rMENJSTlZaElvRmFsdzFDWHpjd2hBTS9zWXdpRnN0RzFI?=
 =?utf-8?B?Q3ppempYcEZIdXpiYkxwQTFBUHhxMGRaVGZOTGUxQUV2MVYzUEQvOXp6eUJh?=
 =?utf-8?B?ZW96VDhGOU9nVzE0UnozWXZJS0haci81Q2x6SE95K0Y0eHo2VUZEY2F4VTcw?=
 =?utf-8?B?bGxXTW9sV3dmL2d3bm9GRXN6WVNiRUIxYklGT2dGR1J3YmowNU0wdz09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f35e8e1d-aceb-4313-c4db-08df1481fbed
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5521.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 06:07:42.3190
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xAued8UDzdPh7pzkpUPVtwL16fv95sjStpT2HHfQWl+/enZt4yJll1ixE349ig9w9V4GXL+B66PKR9fHDQyZ3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB8226
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_230748_340925_3E52BFF5 
X-CRM114-Status: GOOD (  13.40  )
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

Cj4gT24gMTcvMDkvMjAyNiAwNTowNywgWmhlbnRhbyBHdW8gd3JvdGU6Cj4+IEhpIEtyenlzenRv
ZiwKPj4KPj4+IE9uIE1vbiwgU2VwIDE0LCAyMDI2IGF0IDA0OjEwOjIwUE0gKzA4MDAsIFpoZW50
YW8gR3VvIHdyb3RlOgo+Pj4+IERlc2NyaWJlIHRoZSBpbml0aWFsIHN1cHBvcnQgZm9yIHRoZSBW
NEwyIHN0YXRlbGVzcyB2aWRlbyBkZWNvZGVyCj4+Pj4gZHJpdmVyIHVzZWQgd2l0aCB0aGUgQW1s
b2dpYyBTNCAoUzgwNVgyKSBwbGF0Zm9ybS4KPj4+IERyb3AgZHJpdmVyLiBEZXNjcmliZSB0aGUg
aGFyZHdhcmUgaW5zdGVhZC4KPj4gT0vvvIxnb3QgaXQuCj4+Pj4gU2lnbmVkLW9mZi1ieTogWmhl
bnRhbyBHdW8gPHpoZW50YW8uZ3VvQGFtbG9naWMuY29tPgo+Pj4+IC0tLQo+Pj4+ICAgIC4uLi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL2FtbG9naWMsczQtdmRlYy55YW1sIHwgMTE0ICsrKysr
KysrKysrKysrKysrKysrKwo+Pj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCAxMTQgaW5zZXJ0aW9ucygr
KQo+Pj4+Cj4+Pj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9tZWRpYS9hbWxvZ2ljLHM0LXZkZWMueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9tZWRpYS9hbWxvZ2ljLHM0LXZkZWMueWFtbAo+Pj4+IG5ldyBmaWxlIG1vZGUgMTAw
NjQ0Cj4+Pj4gaW5kZXggMDAwMDAwMDAwMDAwLi5kMzUwYjNlNjhhMzgKPj4+PiAtLS0gL2Rldi9u
dWxsCj4+Pj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL2Ft
bG9naWMsczQtdmRlYy55YW1sCj4+Pj4gQEAgLTAsMCArMSwxMTQgQEAKPj4+PiArIyBTUERYLUxp
Y2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UpCj4+Pj4gKyMg
Q29weXJpZ2h0IChDKSAyMDI1IEFtbG9naWMsIEluYy4gQWxsIHJpZ2h0cyByZXNlcnZlZAo+Pj4+
ICslWUFNTCAxLjIKPj4+PiArLS0tCj4+Pj4gKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3Nj
aGVtYXMvbWVkaWEvYW1sb2dpYyxzNC12ZGVjLnlhbWwjCj4+Pj4gKyRzY2hlbWE6IGh0dHA6Ly9k
ZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIwo+Pj4+ICsKPj4+PiArdGl0bGU6
IEFtbG9naWMgVmlkZW8gRGVjb2RlIEFjY2VsZXJhdG9yCj4+Pj4gKwo+Pj4+ICttYWludGFpbmVy
czoKPj4+PiArICAtIFpoZW50YW8gR3VvIDx6aGVudGFvLmd1b0BhbWxvZ2ljLmNvbT4KPj4+PiAr
Cj4+Pj4gK2Rlc2NyaXB0aW9uOgo+Pj4+ICsgIFRoZSBWaWRlbyBEZWNvZGVyIEFjY2VsZXJhdG9y
IHByZXNlbnQgb24gQW1sb2dpYyBTT0NzLgo+Pj4+ICsgIEl0IHN1cHBvcnRzIHN0YXRlbGVzcyBo
MjY0IGRlY29kaW5nLgo+Pj4+ICsKPj4+PiArcHJvcGVydGllczoKPj4+PiArICBjb21wYXRpYmxl
Ogo+Pj4+ICsgICAgY29uc3Q6IGFtbG9naWMsczQtdmRlYwo+Pj4+ICsKPj4+PiArICByZWc6Cj4+
Pj4gKyAgICBtYXhJdGVtczogMgo+Pj4+ICsKPj4+PiArICByZWctbmFtZXM6Cj4+Pj4gKyAgICBp
dGVtczoKPj4+PiArICAgICAgLSBjb25zdDogZG9zCj4+Pj4gKyAgICAgIC0gY29uc3Q6IGRtYwo+
Pj4+ICsKPj4+PiArICBpbnRlcnJ1cHRzOgo+Pj4+ICsgICAgbWF4SXRlbXM6IDIKPj4+PiArCj4+
Pj4gKyAgaW50ZXJydXB0LW5hbWVzOgo+Pj4+ICsgICAgaXRlbXM6Cj4+Pj4gKyAgICAgIC0gY29u
c3Q6IGNvcmVfaHZkZWMKPj4+PiArICAgICAgLSBjb25zdDogY29yZV92ZGVjCj4+PiBEcm9wICJj
b3JlXyIgZnJvbSBib3RoLi4uIG9yIHJhdGhlciBzb21lIGNvbnNpc3RlbmN5IHdvdWxkIGJlIG1v
cmUKPj4+IHVzZWZ1bC4gQmVsb3cgeW91IGNhbGwgdGhlbSBjb3JlX3YgYW5kIGNvcmVfaCwgYnV0
IHRoZXJlIGlzIGFsc286Cj4+Pgo+Pj4+ICsKPj4+PiArICBjbG9ja3M6Cj4+Pj4gKyAgICBpdGVt
czoKPj4+PiArICAgICAgLSBkZXNjcmlwdGlvbjogQ2xvY2sgZm9yIGRvcyBjb3JlCj4+PiBjb3Jl
IGRvcz8KPj4gVG8gZXhwbGFpbiB0aGlzLCBJIHdvdWxkIGxpa2UgdG8gc2hvdyB5b3UgdGhlIHN0
cnVjdHVyZSBkaWFncmFtIG9mIHRoZQo+PiBBbWxvZ2ljIGhhcmR3YXJlIGRlY29kZXIgSVA6Cj4+
Cj4+ICstLS0tLS0tLS0tLSstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0rCj4+IHzCoMKgwqDCoMKg
ICAgICAgfMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHwK
Pj4gfMKgwqDCoMKgwqAgICAgICB8wqDCoMKgwqDCoMKgwqDCoHZkZWMgICAgICAgICAgICB8Cj4+
IHzCoCAgICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgfAo+PiB8wqDCoMKgwqBkb3Mg
ICAgKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSsKPj4gfCAgICAgICAgICAgfCAgICAgICAgICAg
ICAgICAgICAgICAgIHwKPj4gfMKgwqDCoMKgICAgICAgIHzCoMKgwqDCoMKgwqAgIGh2ZGVjICAg
ICAgICAgICB8Cj4+IHwgICAgICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICB8Cj4+ICst
LS0tLS0tLS0tLSstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0rCj4+Cj4+IFRoZSBJUCBjb25zaXN0
cyBvZiB0aHJlZSBjb3Jlcy4gRG9zIGNvcmUgaXMgaW4gdGhlIGZyb250IG9mIHRoZSBJUCwKPj4g
d2hpY2ggY29udHJvbHMgdGhlIHJlc3QgdHdvIGNvcmVzLiBUaGUgYWN0dWFsIGhhcmR3YXJlIGRl
Y29kaW5nIGlzCj4+IGhhbmRsZWQgYnkgdGhlIHR3byBjb3JlcyB2ZGVjIGFuZCBodmRlYy4KPj4K
Pj4gRWFjaCBvZiB0aGUgdGhyZWUgY29yZXMgaGFzIGl0cyBvd24gaW5kZXBlbmRlbnQgY2xvY2sg
c291cmNlLgo+IFNvIGV2ZXJ5dGhpbmcgY291bGQgYmUgY2FsbGVkIGNvbnNpc3RlbnRseSAiZG9z
IiwgInZkZWMiIGFuZCAiaHZkZWMiIGluCj4gYWxsIHByb3BlcnRpZXMgKGNsb2NrcywgaW50ZXJy
dXB0cyBldEMpLgpHb3QgaXQsIHRoYW5rcyEKPgo+IEJlc3QgcmVnYXJkcywKPiBLcnp5c3p0b2YK
CkJScwoKWmhlbnRhbwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LWFtbG9naWMK
