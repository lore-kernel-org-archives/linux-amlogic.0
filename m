Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E708D10F9943
	for <linux-amlogic@archiver.kernel.org>; Wed,  8 Apr 2026 14:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qMU05l2cGkiXF34VtHqCNjZQduhGa3ZEcz0MXkMciEg=; b=LNgkaYxM9oMRhE1ni+2MyaMLfd
	eWqxMLdQmYZ/amFW7I5afX+vMAaqinHvSRQnW+hlSHSqu3yaHAigdeC7NfypR5P5+1YSi6V4q6nVj
	5yA5Ku6iY2uj58En7OC4ju+QlqvEXlcKGe9IsGDSeMEy+6xZcdz1aDhDQg1JcZthbzVCLb2OEsUOv
	YeWJK1fOKanlKgARSafCpsmPxjz4QHD7BXdjz0b19tkpLHlS/3vJWMsRMwSBYis1aODDtGatxP4fl
	5/+erpX1PBle+FLznGpUwYIDqayAOh426JXDaKIRcqe6txVxACyZlErch9mdbKf1OYpJGq6NVEbwI
	Um16z0Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAU96-000000090qA-2mu6;
	Wed, 08 Apr 2026 14:44:44 +0000
Received: from mail-japanwestazon11022125.outbound.protection.outlook.com ([40.107.75.125] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAU94-000000090pa-0kq3
	for linux-amlogic@lists.infradead.org;
	Wed, 08 Apr 2026 14:44:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A+LyjYUWh4wKn+hpyVwwV2srfjLva8foy8q4R1lIknSN8DiqLFq/1aPthoRhRISbGqxcgXa0fn9pFy9Aaj46bf61sxuWLMSY6ITk/H+M0Gt2rA0K1qPDYpWiW8TLL+wGJC+8JoDFgg3pzYm2ofhM9NjHHhXcYkc5w4RXvSrNvAxZhQUEaR9OnoATYBKauJMGCV4TVmIB9O8f37BqQBtFtVU/OCnKbaqQlTFzVH49LnWtK5V9gOefDA6S3e7UEySrRubvxg47WXciy34JP/6VhXcIpV3oOtzNYy1BPsUMzoT6Gi57rfKS3uz6MIjlqFDAfeGqTR0QDY2hl77eCEicOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S+g01k85OZ66nqrujJH6SpKHDmmSi1QscCq5Ew4Jkoc=;
 b=ASoe7AunyP+3pZaYcIvrBCTc37kmZV/FAdF/qhQPzsTbA26Yds0c0TjNbvRAP0nghHC6PkSQopOx1+GBdNMSnWGYxtlTuwCZsQ2y85jfgQ/amKWBpOwKijUEaTXqDB2rFKplybI9Khws3SWDXXaDI3hzOkJbzk/d6gtfBDAiqFFeUD/3PA6vsfbcqMhkPtguyBJW90i7E7Tq5RTSG6LaRIc8JJIGDYoxFcEtayYT5Qv7k9M8OKrSAPt/j+ZHtApWxTUmfsVRHt7oxruKD8u17ahvXN1jlFoBlgIZaoyXg9aYQfH+5IejMsqTocFp5fcc3lESLhSLyFaEI+o3SqkrzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S+g01k85OZ66nqrujJH6SpKHDmmSi1QscCq5Ew4Jkoc=;
 b=Rr4J8f55I+EtOnh5FG+TzrCvoRInc49iL/j0uDqpw1q1YdayAltNBGP8kKjbQZ9AyQl+oZbIWZ+bbr3fia9jGxl9XsYGPt/zAe7Pn7bItVpQtT1B5dj3/DUOB7wZVIBpnH+azEPJCKz9RUjwLH+YZAeq/ykZoi7hg7C/0fkqMwptqcv7f3UqskGxpk0gjebJwbczzuc4jLrny6HdxlEIRoUqBQ2N3PDqHhcPp74CR/z1S61knLT3EAojOLK9Zp++z+tGhBoq7hSWJmNeolXOho3Lcbnmcmv5MbTy/2hXHUwPQm8FBASWkgiz7m7lM15YeuuAGOIBvbPx3AapcYhw5A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com (2603:1096:820:6d::13)
 by TYZPR03MB7060.apcprd03.prod.outlook.com (2603:1096:400:337::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 8 Apr
 2026 14:44:28 +0000
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::e1e:5c95:a889:828e]) by KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::e1e:5c95:a889:828e%5]) with mapi id 15.20.9769.017; Wed, 8 Apr 2026
 14:44:28 +0000
Message-ID: <40e2f836-4a6a-485a-9b92-1e42dc606e0f@amlogic.com>
Date: Wed, 8 Apr 2026 22:44:54 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/13] clk: amlogic: Add noglitch clock driver
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260209-a9_clock_driver-v1-0-a9198dc03d2a@amlogic.com>
 <20260209-a9_clock_driver-v1-6-a9198dc03d2a@amlogic.com>
 <CAFBinCBXFxefUkNj3sqUdnTz7vf72jV_FkCP6gd2veTtLHWnBg@mail.gmail.com>
From: Chuan Liu <chuan.liu@amlogic.com>
In-Reply-To: <CAFBinCBXFxefUkNj3sqUdnTz7vf72jV_FkCP6gd2veTtLHWnBg@mail.gmail.com>
X-ClientProxiedBy: TPYP295CA0025.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:a::15) To KL1PR03MB5778.apcprd03.prod.outlook.com
 (2603:1096:820:6d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5778:EE_|TYZPR03MB7060:EE_
X-MS-Office365-Filtering-Correlation-Id: dd2bc379-44f9-405b-05c2-08de957d55ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: bF2tdxklWc22T0twfuMIO5uJqK234qCZdo2R/TolhQbjKMfFZ9nifQV87EMyrlnFQ+sA+CGcUfebmyEs7waGyCwZJN3NEDpEq4POWL9oPK9CPmnjc58M9yW6MefFEsodHwwYDlZydI9AvF7aYKfqJg6AGJrPS0jXGk9NLAQicP9R89Ofg4v228alZUlTsnE865va4CRAw44HA6wPflkCV0d86UR5HQHIrax/kFI9z3rf+qisVZsDJSTrl8b/z9jZZDZgI2YqBfXyyY2byIO+1ktd8qBMuepObhSS5eMuUQuFpEinVksT9DujMgzAE7EqSHREzvW9cxivgynDG0SHcEic/PsmWTcHEXGQCs0qL8/55SiDyQcf3b8IMtTUM4ErSClyg+eddoLh1fcLlm90rzTXgzEVgpktpOJz8e52wKLXdmCPYVtiCz8mZmT+ek7BbZzfgfv1SFr3jchuGkSmdA0RWLnYadDUOQTy/LHoyeDX9Gj11r9cyv33Q8tj3KWiVlx1qwc9VPAoL9MargANLd4djN1XzC+BwAbNa07mbCe0eexn4ypH100mpCZHqCECvD3vfVbYhvdipVG+fdewuSXI5lLoDcwFUzSrJ56lEE/fNDr9gb49qRh5BMs6MCBbGST0A2iOFH/TAc7JBdIMS8HY+1rfs/gctPaj+xGEDLR713ok4cJgNGEoYA9FqDRb
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5778.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YlNoUTB1aU9aeFcza042UFdOUzY3aGtKRnV4NlFZUjI4YWwxR1hHT0xnaXVG?=
 =?utf-8?B?cW0xN3Nyc1ZQcXRVM1lpNk8zb0tOc0t5TFd0K1dQZEZBR2U0MStLZVNhQ0NG?=
 =?utf-8?B?ZUF3Q0pPU2FvQUxIQVJsS0lvNklCTFl0Vk1KNHN5M3dYYTV6TjZPbmdTVjJm?=
 =?utf-8?B?ZkI4YzhqQ0lOSDZmQzBDcFlwTzIrbGl0dy9VYWhrSzZ5bHhldXRseEtSbS9P?=
 =?utf-8?B?d0tBemlEVW01NVpwVEdTNmtlUzZYeEZpVEQzUXNNYU5veVhyTlozYXlIM2Zq?=
 =?utf-8?B?clVtTUZqYmtIcFYyRk52ZG5UQVc3bkp4cXZpamFVQTVOZXJFOW4vZ2JaR0RD?=
 =?utf-8?B?SHhOdHJhNzYwN0hKZlBwSjI2Nlk1UUk5UGk1NWlmeEcxTi9HdXZmMkVUZ3cw?=
 =?utf-8?B?Y3Y2bUU3dS9nNGV1WGF2SmJwQnlJMVF3NW9reG9vMnVxOERLYUhRT2QzMWJV?=
 =?utf-8?B?NGFaQUE5eG1TcVRYTE1Kb01Pc1Z1MkVsdlJlcFd0ZFRidmtYa2s5QlJYSFJz?=
 =?utf-8?B?K2EzMDZ5cFo5ZEdxYXVtaDU0RndIRGpsTUY4QnlYd3QveEt6RU5CRHpGTE9Y?=
 =?utf-8?B?SGpFQXBLNWN3d3UzNGZvLzIveDFiTnpqeGtJY3haQ0s2RzQzNjVwZyt5a3JX?=
 =?utf-8?B?QzkxVUhLSzlMYjQvL1o4L2FPR1NJRFRKUkFGdk8zZXFhOUJUeVlzRUk3OHVt?=
 =?utf-8?B?cklpNDcyaDhYLzVIcmZKOGVUQmtGZlVOSEVIaFpKYXNPdHpUclVmZG1iU1RP?=
 =?utf-8?B?bUZmZTRyMWVKcHI2Z05YcDZxdnhLaktqclN5WU5tMk9vWC9ndnBtM0VWOU5y?=
 =?utf-8?B?aGJrK3owd3BiTFdTVFpKM21NL0pWM0poV3NqSTdYdnRjZGZNb1p3a3hVWEhM?=
 =?utf-8?B?UkhFVFE4NSsvWHh4bTNQYUh2RmJLcDg2dENPdXQ1VmNrUVFOTUhQenhlN0Jn?=
 =?utf-8?B?WlJKMVhqazRRRlFiSndTWVdITXpCVk1sblV4blo5SzFBMkF2a214eXlJR2NV?=
 =?utf-8?B?Nk1kaGhrOFM5ZU9wblJET3NMUFNFVVFtWldITXE0cUhlTnFzZDkycVJCeHM2?=
 =?utf-8?B?U1lOclc3NkdNdUZHanN6VUIyZ3JsZWs3aGVGaVdES2l0dTUyV2R2azJtTTZR?=
 =?utf-8?B?aHZ4am9ZWmZWUlI3Wngxakx3VkFTcFVZZUpqYTB5MGlMTUdOUTF5NTc5SUk3?=
 =?utf-8?B?NjBzdU9mLys0NjVRVVlIcExZVzVaSStXdWFwckVYdXJpa09scngxY3hhN05Y?=
 =?utf-8?B?V3BMTUQ3c0ZzTVlEUTlqUFl2djJuY1NjL2xFS3NBdVNkZmhKM0h3VnVmTDh1?=
 =?utf-8?B?dU1SNTR6c04ra0xuWmJzZGZYbjE5ZzJEYUlkcXRWN25WYmxwa0FKYXRuZ0V2?=
 =?utf-8?B?TUtKS2V0NjlQeGdLZDFxMGMxb0t6L1hqL0ZnS0l6YUlYcC8wTmh5NHJEWURD?=
 =?utf-8?B?akczbmxQVEJKcGtwcWRGYlJjeUgzamlQU1B4RU9zdXJ4eFNUclVySGVnejU1?=
 =?utf-8?B?Qk1kL3YrWnM0dFpQSXArL3d5UVBWU0hGRGRiYjBKRXRQYWdQNCtpa0xacXI5?=
 =?utf-8?B?QnU2TzRiaXdMVGRVMEdETEpJS252Yk1Dc2hWSzRmRzJSRWFTVGVTZWlRVGl2?=
 =?utf-8?B?ZC8wTmFJVXRsMUJKV1VVTzJuaWszd05iUktsVHFUOU5EQ1NxMStoQ2tTRFRh?=
 =?utf-8?B?MTM0dFBHcTdWN0w4RzdreU1ZZm9OVmd0R0FKS1pQeUh1ZmZiTTBLK0NpSlpN?=
 =?utf-8?B?aW1pZW9JYjRiU0NhQXlqZThGdXJadGJzNGR0TXkzRzBPMnErRUxqcVcrUVc5?=
 =?utf-8?B?WjFoa2p6YmJ4TTNTOWxkWkxjbTF2NHZmMkVleW5JdkV6SkF4RnFOVXAxT2p1?=
 =?utf-8?B?cHZzcjl5Z29sbWs4OHViRkxzS2Z1ald0Y29aYTh2WGZZendvQUhvWmhCSTE3?=
 =?utf-8?B?cUVsNnRRUXFPYTZBckozd3hDV3JoU0ppaDJYZHZOWXE1VTJhZkFkbnNhanEv?=
 =?utf-8?B?NFlXdTBaVS90SThINDhiUHNyQ2VGWm82QVF2WjlCdVVWZm1rbVJIUUFVWFow?=
 =?utf-8?B?Ujg2N3c0VExuMjdXZjlzVW41cEZBdmVGZXBXU25MWVd0V2p3SkZCRk5mRG8w?=
 =?utf-8?B?Z2h6ay8zSVR5SlM0bkJZQnlFN0ppRkxITGpaV1o3UEdIM1VtUUZOekhWWUdY?=
 =?utf-8?B?N1BMUWJycnRlQkdiTHVMZkw3dS8zOS9MZ0lyZkxsQzYzaEFQbGdweEtmWDZJ?=
 =?utf-8?B?T2gycVFLbnlES1JqVlY4Q1pHM2ZpaGZ1MTRuWXZVeE1rUTV4QU42VzRkcUJN?=
 =?utf-8?B?Q2s3VFJ2M3l3VnJ5cDFuQTJ2SkhzMlRpQ1J4ZE1tU3ZabVcrUU9RZz09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd2bc379-44f9-405b-05c2-08de957d55ee
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5778.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 14:44:27.9129
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kVlpUP3xr6Iu2zwsHYgcsFEYgMiVMBGkK8/q/OMEqUNe0bYhB4H3uiDqwJx0S47kRh4OWvR9gdqQ7qx4g03qvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7060
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_074442_218089_541CB7EF 
X-CRM114-Status: GOOD (  18.91  )
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

SGkgTWFydGluLApUaGFua3MgZm9yIHJldmlldy4KCk9uIDIvMTAvMjAyNiA1OjUxIEFNLCBNYXJ0
aW4gQmx1bWVuc3RpbmdsIHdyb3RlOgo+IFsgRVhURVJOQUwgRU1BSUwgXQo+IAo+IEhpIENodWFu
IExpdSwKPiAKPiBPbiBNb24sIEZlYiA5LCAyMDI2IGF0IDY6NDnigK9BTSBDaHVhbiBMaXUgdmlh
IEI0IFJlbGF5Cj4gPGRldm51bGwrY2h1YW4ubGl1LmFtbG9naWMuY29tQGtlcm5lbC5vcmc+IHdy
b3RlOgo+IFsuLi5dCj4+ICsgKiBUbyBwcmV2ZW50IGdsaXRjaGVzIGZyb20gcHJvcGFnYXRpbmcg
dG8gY2xrX291dCBhbmQgYWZmZWN0aW5nIHRoZSBub3JtYWwKPj4gKyAqIG9wZXJhdGlvbiBvZiBn
bGl0Y2gtc2Vuc2l0aXZlIG1vZHVsZXMsIHRoZSBuby1nbGl0Y2ggY2xvY2sgbXVzdCBiZSBjb25m
aWd1cmVkCj4+ICsgKiBmb2xsb3dpbmcgdGhlIHNwZWNpZmllZCBzZXF1ZW5jZToKPj4gKyAqICAg
LSBXaGVuIHRoZSBjbG9jayBnYXRlIGlzIGRpc2FibGVkOiBjb25maWd1cmUgaXQgYXMgYSBub3Jt
YWwgY29tcG9zaXRlIGNsb2NrCj4+ICsgKiAgICAgKGFueSBnbGl0Y2hlcyBnZW5lcmF0ZWQgd2ls
bCBiZSBibG9ja2VkIGJ5IHRoZSBnYXRlIGFuZCB3aWxsIG5vdAo+PiArICogICAgIHByb3BhZ2F0
ZSB0byBjbGtfb3V0KS4KPiBUaGlzIHBhcnQgaXMgZWFzeSBhbmQgbWFrZXMgc2Vuc2UuCj4gCj4+
ICsgKiAgIC0gV2hlbiB0aGUgY2xvY2sgZ2F0ZSBpcyBlbmFibGVkOiBjb25maWd1cmUgaXQgYWNj
b3JkaW5nIHRvIHRoZSBmb2xsb3dpbmcKPj4gKyAqICAgICBzZXF1ZW5jZSB0byBzdXBwcmVzcyBn
bGl0Y2hlczoKPj4gKyAqICAgICAgIC0gQ29uZmlndXJlIGFuZCBlbmFibGUgdGhlIGlkbGUgY29t
cG9zaXRlIGNsb2NrIHBhdGggb2YgdGhlCj4+ICsgKiAgICAgICAgIG5vZ2xpdGNoX211eCB3aXRo
IHRoZSB0YXJnZXQgZnJlcXVlbmN5L3BhcmVudCBjbG9jay4KPj4gKyAqICAgICAgIC0gU3dpdGNo
IHRoZSBub2dsaXRjaF9tdXggdG8gdGhlIGNoYW5uZWwgcHJlcGFyZWQgaW4gdGhlIHByZXZpb3Vz
IHN0ZXAuCj4+ICsgKiAgICAgICAtIERpc2FibGUgdGhlIGNsb2NrIG9mIHRoZSBvcmlnaW5hbCBu
b2dsaXRjaF9tdXggY2hhbm5lbC4KPj4gKyAqLwo+ICBGcm9tIGEgcHJldmlvdXMgZGlzY3Vzc2lv
biBpdCBzZWVtcyB0aGF0IGluIHJlYWxpdHkgdGhpbmdzIG5lZWQgdG8gYmUKPiBoYW5kbGVkIG1v
cmUgY2FyZWZ1bGx5IGFzIHlvdSBwcmV2aW91c2x5IG1lbnRpb25lZCB0aGF0Cj4gQ0xLX1NFVF9S
QVRFX0dBVEUgaXMgbm90IGdvb2QgZW5vdWdoICh0aGUgZGVzY3JpcHRpb24gYWJvdmUgaXMgd2hh
dAo+IENMS19TRVRfUkFURV9HQVRFIGFscmVhZHkgYWNoaWV2ZXMpLgo+IEZvciB0aGUgbW9yZSBj
YXJlZnVsIGhhbmRsaW5nIEplcm9tZSBzdWdnZXN0ZWQgdXNpbmcgdGhlIGNsb2NrCj4gcHJvdGVj
dGlvbiBsb2dpYzogWzBdCj4gWW91IHdhbnRlZCB0byB0cnkgaXQgb3V0IGF0IHNvbWUgcG9pbnQ6
IFsxXQo+IElzIHRoZSB2ZXJkaWN0IHRoYXQgSmVyb21lJ3Mgc3VnZ2VzdGlvbiBkaWQgbm90IHdv
cms/IENhbiB5b3UgcGxlYXNlCj4gc2hhcmUgc29tZSBkZXRhaWxzIGFzIHRvIHdoeSBpdCBkb2Vz
bid0IHdvcmsuCj4gCgpJbiB0aGUgYWN0dWFsIHVzZSBjYXNlLCB0aGlzIHN3aXRjaGluZyBvcGVy
YXRpb24gY29tcGxldGVzIHdpdGhpbiB0aGUgCm5hbm9zZWNvbmQgcmFuZ2UgKHdpdGggYSBtaW5p
bXVtIGNsb2NrIGZyZXF1ZW5jeSBvZiAyNCBNSHogaW4gdHlwaWNhbCAKc2NlbmFyaW9zKSwgd2hp
Y2ggaXMgd2h5IG5vIGlzc3VlcyB3ZXJlIG9ic2VydmVkIG9uIG91ciBwcmV2aW91cyBTb0NzLgoK
VGhhbmsgeW91IGZvciB0aGUgcmVtaW5kZXIsIHRvIGJlIG9uIHRoZSBzYWZlIHNpZGUsIEkgd2ls
bCBpbnRyb2R1Y2UgCnNvbWUgZXhwbGljaXQgaGFyZHdhcmUgZGVsYXlzIGluIHRoZSBmdXR1cmUg
cmV2aXNpb24uCgo+IAo+IEJlc3QgcmVnYXJkcywKPiBNYXJ0aW4KPiAKPiAKPiBbMF0gaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtYW1sb2dpYy8xajFwbnA1c2c3LmZzZkBzdGFyYnVja2lz
YWN5bG9uLmJheWxpYnJlLmNvbS8KPiBbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgt
YW1sb2dpYy8xNjM5YmI5ZC05Y2I3LTQwOWYtYmJmOC1iZmU0YTVkMWI4YmNAYW1sb2dpYy5jb20v
CgotLSAKQmVzdCByZWdhcmRzLApDaHVhbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9n
aWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
