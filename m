Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B2CACD6E45
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 May 2026 07:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6ujJHrcIyRSHj7Dnlf8p6uoIEScH40phH8iMcXbdAwo=; b=T3WiONS3Cf8hwPS4xYY873ljUB
	57EyVoqRRsmI0R1bw3BHzivifyWo12rA5H9RV2i5oKA6tVTa+cg/juL/DJ+KWT/0BcIq61H/KO+C2
	QotqZLzA1c8BiPEp3wca1ZgeYKlZvz1WiDXJWweYqHTme5HyrJ96ltxlk/bz402Q9r6HJV7RQr5tU
	Q1fzytoOF4hEBbvMBaum5D29FGI7UY3lIGoL8i5R37xfq9Z0Rs1l55oV4KuZRPxmwjLxWefggVGdv
	Q4O9Olvu+FIv9jnXFUsW/4MB9d2u1CQup8+Z9FwtE+c33zxCOW5RjfG9dVYFyqJYA7UUYDrDo/BEE
	yPxoXZSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSrKn-00000006rai-2tXV;
	Fri, 29 May 2026 07:08:45 +0000
Received: from mail-japaneastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c405::7] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSrKl-00000006raH-0wYC;
	Fri, 29 May 2026 07:08:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cQCh+gBR02Fv2G44zffSueGSXDww/ptNDHusPheDb7CM49KZAKBeqmrR11zSl0ag5VIeTQLKG080Stfr6Z/I0ErDo+8Ioz93TCDjD8DiTU2Mn+Z5UErSGSGUviLEjTBZ6h7oIZ5wIIMp584zXgsROjmsNAeS1OF6nnWiCrLuCBconKRcUJ5jvaiKURfQmEmXFrLOWT+NpU2bDMjlpXG4A9vvjGtkhe1RNq4NuI3SyVDIlH459Fmz0/xk3ilLSqP9wuJcPskcyLudPuAag2RvCzdUG0KaDqWTpfv8IUrksQxT0B799hN9ixdBXLDPiGZpDCqqw0DIk1aYRzwEuXRCmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fFSm8Us7aSF7c0Xc/oXoM3gz2FtlbLVX1oeJyqwiUj8=;
 b=gaI1TTcxIvrnYM0/bNa4ljxSr2U9jMCGSh0G3zb4B/OOuTlRFDDHZnojMfeYSCfzhcar/oIeQ+n8Sz62Nhq5gT7M91fpDTkPfAEEZhBhTjYQdkoQS3xeWT8HjeENhfaW/N6Yjvxe8bZ62vQYEuqYY6MQybTetoMY/ab2nvROb/hlBj/q2ed6q9WEZw7zYmA/1iQOT5yghrscIKsJ+dW04PYB2mmUoD6FZ0Tn6Gh42bFDmqJpg3jHjMHHLJ6iqp2nh2OcJaNetmdhjppPaIGj8/IXs4rknvpfDWLybOOWNmy6yDFpR38VdKI5c1ABEZ6cDr8EpPbIZMt3Av8e3rqDeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fFSm8Us7aSF7c0Xc/oXoM3gz2FtlbLVX1oeJyqwiUj8=;
 b=pPPYAZwPGpAcZV65F9uY7Cqm9hZATYtZsHX8gBx0fjJE6X6CMdGqWM84LY/j2pm6ZQK/wHsCYKOIRjSxOgcuAJMUrs/U7uo9TESZCf3XHfDo1tnogBYsObQNumhOvzCv02PipbdcRg24ZYmwCbOsVTSWlPCd2XCwXjt7L8spDDpDqtimW25YhZvuLcHNJ/K4quyvC+fFZU67yxN2Cf3g4x8/IA5PFsII299OOFqgGp3iLdRUpOxGcrZjmPsMogFs3sH6zvzwFhikLmQfG1r2rY38hRqL3nPRwFDJwJcpvGKpx3wro1Y9j3aYQMoVfCDbeDS8WeVGb+m51wXJfu1JJw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com (2603:1096:820:ca::7)
 by TY0PR03MB6984.apcprd03.prod.outlook.com (2603:1096:400:274::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Fri, 29 May
 2026 07:08:26 +0000
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506]) by KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506%5]) with mapi id 15.21.0092.002; Fri, 29 May 2026
 07:08:26 +0000
Message-ID: <c9c4945f-cdfc-4382-b8ca-71b69d91deb4@amlogic.com>
Date: Fri, 29 May 2026 15:08:24 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/10] clk: amlogic: Support POWER_OF_TWO for PLL
 pre-divider
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Xianwei Zhao <xianwei.zhao@amlogic.com>, Kevin Hilman
 <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20260511-b4-a9_clk-v1-0-41cb4071b7c9@amlogic.com>
 <20260511-b4-a9_clk-v1-7-41cb4071b7c9@amlogic.com>
 <1jy0hm6n7e.fsf@starbuckisacylon.baylibre.com>
 <8d89b669-e72e-4663-9596-999a12922d32@amlogic.com>
 <1jqzn65y9l.fsf@starbuckisacylon.baylibre.com>
 <3fda1592-f7d0-4e86-8615-602804673414@amlogic.com>
 <1ja4tm5pb3.fsf@starbuckisacylon.baylibre.com>
From: Jian Hu <jian.hu@amlogic.com>
In-Reply-To: <1ja4tm5pb3.fsf@starbuckisacylon.baylibre.com>
X-ClientProxiedBy: SI2P153CA0029.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::16) To KL1PR03MB7149.apcprd03.prod.outlook.com
 (2603:1096:820:ca::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB7149:EE_|TY0PR03MB6984:EE_
X-MS-Office365-Filtering-Correlation-Id: 563c27a3-066a-4cb3-d701-08debd511433
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|22082099003|18002099003|5023799004|3023799007|6133799003|11063799006|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info: ck773FP7eF7nR/IlP7gRvRyCP2j2KfMtxFFzlGCqOZ3tmgCOikuSdWX39j8lQlCm69VMTiQeBZFrx46fnm8ysDqy8noVvnw6VCaWPwmHYovfhx1/BzRDH7j/YoDLNcC03Accct+YoiqHMDcm/Rhjp6Q77fEUJUskiMR8csKds1kEQADpFXNjZYdprCpFZXO1wgu569VLwTDq1annz1DAsCgH8JlRnh1jyEu4ek+p+yWyf/n1XcvQtK3cscidoXG04udRzZvTum5qzVq05eZA1IiQS/DtgJlk4SYUNsNszpooYV92LKsA+hJrdmtmpJschqJr/0VOC3PpDnSy2aQLnKzLBHqVWzJfy2cdZZLM8kyM2atdq1j4DoMwY6c3QdbLwUktaW3iLSCYb9PLcsmfoZSrmGURiwwjnKqHiiCflAc4GhB2UHzdIrFfOvVJ59//QhDJFR6MBUhWlnPpIH4hAckbEMDD2mMXxdgznKq7LsaQCv+2dr25Z5YM6XudPJvosVTLix0t888iXGin6XcAGmxwNy6DpqbAqPDtuKvrrDcXm+Cd7AGdusZqS6+P6s66BtduMyzaD8m1QsNAw4ISdMFXZ85gIPnCb9Wyw75plYMjfp0EBbyds+M46RfUPTZvhOkv0Bhas1YTrAjiMDggsD08I3bguksdaPYpb+xPBwpmFdGzDGVyZ7QiVLUks2ft
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB7149.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(22082099003)(18002099003)(5023799004)(3023799007)(6133799003)(11063799006)(56012099006)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TTZ6UXk2c2VKRU5ZVnRqSElXcG83TEhpbGNtTktmU0MvbVBOdGgrRnY5RHJG?=
 =?utf-8?B?T09NL3hXMFhTOXZCOXFmWDM2Yms1bnhESUdtYVJhM2FDRDE0QnRRZHJ3THNN?=
 =?utf-8?B?UkNJZGNudmVqc1RabTZZUkU4MHdjTXRPdmtqV25EV1k2S1FjVEoydnNJREhp?=
 =?utf-8?B?eHBTUllKTFJib3F3V1hibXV2WUtwTnE3V2oxNHhwVFBYd3NTb2taL2RZR0Yv?=
 =?utf-8?B?SEk1SFZDc0pLcE1QTThSaVBqMG1kVVlPUW8yQ3JBTmRtcDdHQlpDeUF6dlVP?=
 =?utf-8?B?dXFacDJhbk1uVHVGcGJmNE4rUEtWcmRoOXNHUDdPR1c1eTF2T25wYU5UMUho?=
 =?utf-8?B?ei9ORzdjR3RMc3M5YXVnbDhoQmUwNDB4Y3lRVTU3a3hNWTdxSVB0RHlsZjRG?=
 =?utf-8?B?dHFRaS9IM1o0UE81ZkxxOE1GQUt1Zk9MOVpyOVh5K1UwWW0ybHZzUngxN000?=
 =?utf-8?B?VVNGWG5DU2lDbkNlUHZMelUvMWFjM2FmT2JEWnNhRTg1ZDBpSzZ1c0FsWjZT?=
 =?utf-8?B?OHgyNGFoN2hqNkQ2ajNFbU9DU1IzK0xaWFZ2eEo0R1lCay9DUE42YWs5ZElW?=
 =?utf-8?B?MzdFeEd0cWx3aTB0ZlVzOFNOR01xMks0dmF6N2tvRHRIS2ZXcDRscitDTDFZ?=
 =?utf-8?B?WTlRMmVNcHRCNWNkZUh4SHQ4dDNYSjQrUXY5SENCajMvUHo2RGdMdU9kWjJ2?=
 =?utf-8?B?TTFLSUpZT0h3VmtlaW8vbzFzdHJMTk54M2RxcWo2dzRVRklsT0xZVzV5YTRs?=
 =?utf-8?B?cm9UQlJUUmUvYTBkRjFsdktvMnRyemRId2plTXJlcjZ0OFc3THVwc3lBVlV2?=
 =?utf-8?B?UmZRaDRpcjZsMzFTc3VnSFJPUXM2d3FHaE5GWXNPdkp0b25BYzVKWXhLUDRi?=
 =?utf-8?B?T0IzbW1nSXpJVWRsQ0t4MUM5aFlSWEticlgzUFpTbk9MbHlzcmVYNjNQRkMy?=
 =?utf-8?B?TjlVZzBGeWhZaHUyVmoyMTE3M3BHNWpoa1FkZmdEaDd0MGxBUnRTTW4rTHZx?=
 =?utf-8?B?MzVOM2drK2tEOXltMHJBRGVycWhKSHJTelBFRkw1NEFTTEFxRVhxUmJhTDhL?=
 =?utf-8?B?T2hLYW1CZ2pucExtSGQ1V0c2cEtVeTNDR3lldUNQQXMrcG5paE4wVFo1eE92?=
 =?utf-8?B?U1RSZ0hlS0VSK3lybXRIZzVlM1Qvb01lOHFTcmNRdHZSNEVQeU5GbTlLd1F1?=
 =?utf-8?B?V25kaVhUMUhtQjY2UGFVVWF6amc0dytYSitHRm1qd3A0eXhkdkgwaHZLK2JR?=
 =?utf-8?B?UitWdzJXT2Q3aS9mcG91N3A0VStJUE1ZRy9OT0FkSkpzNEZIMDNrMU04b09N?=
 =?utf-8?B?Nm01ei9hRGxSeDRUWUt2cTZFMk1Ub2ZNZVkxeGx6L2luUHp1Mm9ncFEveWlG?=
 =?utf-8?B?djdEcFBkVk55R05QRFlrWmZTUmlGMW90OVRnVkRIcG5kdGU3WnUwdldpdy95?=
 =?utf-8?B?SHNiRGtZWTl5K2JYTDRyNWg5MjhSME1aY1NQOFI0bDVmVlZBeFRRc3FENWRR?=
 =?utf-8?B?ODNQck05MThxVVFYeStVZ2s5Y09WOHR6VExaM2VudnVjUmN3ajRZL0VRZWlH?=
 =?utf-8?B?RlZKb0M2YXp0eTdXVWIxbW0xSFNmVkpmYkRFM0QzNEZGSFk5OHk1TUhyRG1k?=
 =?utf-8?B?V3d5ckZnT0VDcHNCVHhGSGlPcitqMjA3ckt2T05xWVdPSWNFaFJOdXU1NFFY?=
 =?utf-8?B?UGFPVmY4enJhVWtlcWdLNCtPUkd4Q25hbG5qVVdMR2hxRzExMGMwT1dBL1lU?=
 =?utf-8?B?NTFsYkgxaWJZbytDQ3JsaXdsdHB5Nkdlb3NIbzlaUnJCYVExdmVmUndtcm1X?=
 =?utf-8?B?S1hNYnYyVDRJMFVGUjRWVjRwSnM2SXFvN3l1ZGJTMVdwL01XbUZobk5XM1Zl?=
 =?utf-8?B?MEt2b3FnWlZBN3NNMDROUUhQWTdmSm5EZDZIbEYzQWZpMHFOV3VWdGo3R1ox?=
 =?utf-8?B?Q3E2SXhhR0VsaklLMkNWbTA4MmJSekFBTEZrUmN6VmJTdTBwOFZ3aG00WWd3?=
 =?utf-8?B?NTFCK0xiUHZ1cGdKa3BSYVRVM2FTU1EwNlRNd29zOXFlRmtmdENUclQrSmJY?=
 =?utf-8?B?azlRUnNEL2N3VGhqaXFhV0hiNGJhcXNyVjhhbDgxa0IxZDVtUjFwMW01K2Nl?=
 =?utf-8?B?QkFzUzlHR29HTjVrNWRNbHdlaEhCY09PaUs3MkdCenAxMm43VW44R3NvenlX?=
 =?utf-8?B?eTEvd3dvMXJ0RlQ3SlBycEtCTnZuZVlHdEg4S0hzVzc4Y0VUTk1aNkFxTnd5?=
 =?utf-8?B?YzNVRnFXMGFDT09EdDRCK3lmN21SY3lZT29WVmNLZ1gvaDQ5c2IwazFtK1lr?=
 =?utf-8?B?WGhSc3J1b1JxUFMveDhjb1N4REtRTmIvL2xTeHhtYTB5YUV5WWhLZz09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 563c27a3-066a-4cb3-d701-08debd511433
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB7149.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 07:08:26.4701
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KvQBjGitRpFkIZMOEEKzHvlWAgOTEbRUy++2rEbCkBErrsZUza/+M3HnSTKzO0rOlkWKebtAXBzo6Yj7foosdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR03MB6984
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_000843_389896_B57C1AA8 
X-CRM114-Status: GOOD (  27.32  )
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

T24gNS8yNi8yMDI2IDg6MjcgUE0sIEplcm9tZSBCcnVuZXQgd3JvdGU6Cj4gWyBFWFRFUk5BTCBF
TUFJTCBdCj4KPiBPbiBtYXIuIDI2IG1haSAyMDI2IGF0IDE3OjU4LCBKaWFuIEh1IDxqaWFuLmh1
QGFtbG9naWMuY29tPiB3cm90ZToKPgo+PiBPbiA1LzIwLzIwMjYgMzozNSBQTSwgSmVyb21lIEJy
dW5ldCB3cm90ZToKPj4+IFsgRVhURVJOQUwgRU1BSUwgXQo+Pj4KPj4+IE9uIG1lci4gMjAgbWFp
IDIwMjYgYXQgMTM6NDcsIEppYW4gSHUgPGppYW4uaHVAYW1sb2dpYy5jb20+IHdyb3RlOgo+Pj4K
Pj4+PiBPbiA1LzE0LzIwMjYgMTE6MTEgUE0sIEplcm9tZSBCcnVuZXQgd3JvdGU6Cj4+Pj4+IFsg
RVhURVJOQUwgRU1BSUwgXQo+Pj4+Pgo+Pj4+PiBPbiBsdW4uIDExIG1haSAyMDI2IGF0IDIwOjQ3
LCBKaWFuIEh1IHZpYSBCNCBSZWxheSA8ZGV2bnVsbCtqaWFuLmh1LmFtbG9naWMuY29tQGtlcm5l
bC5vcmc+IHdyb3RlOgo+Pj4+Pgo+Pj4+Pj4gRnJvbTogSmlhbiBIdSA8amlhbi5odUBhbWxvZ2lj
LmNvbT4KPj4+Pj4+Cj4+Pj4+PiBUaGUgQTkgUExMIHByZS1kaXZpZGVyIHVzZXMgYSBkaXZpc2lv
biBmYWN0b3Igb2YgMl5uIHRvIGVuc3VyZSBhIGNsb2NrCj4+Pj4+PiBkdXR5IGN5Y2xlIG9mIDUw
JSBhZnRlciBwcmVkaXZpc2lvbi4KPj4+Pj4+Cj4+Pj4+PiBBZGQgZmxhZyAnQ0xLX01FU09OX1BM
TF9OX1BPV0VSX09GX1RXTycgdG8gaW5kaWNhdGUgdGhhdCB0aGUgUExMCj4+Pj4+PiBwcmUtZGl2
aWRlciBkaXZpc2lvbiBmYWN0b3IgaXMgMl5uLgo+Pj4+PiBJIHVuZGVyc3RhbmQgd2hhdCB5b3Ug
YXJlIGRvaW5nIGhlcmUgYnV0IEkgaGF2ZSB0byBhc2sgd2h5IHRoaXMgY2FuJ3QgYmUKPj4+Pj4g
aW1wbGVtZW50ZWQgd2l0aCBpbmRlcGVuZGVudCBkaXZpZGVycyB0aGF0IGFscmVhZHkgc3VwcG9y
dHMgcG93ZXIgb2YgMiA/Cj4+Pj4gSWYgd2UgdXNlIGluZGVwZW5kZW50IGRpdmlkZXJzLCB0aGUg
biBtZW1iZXIgd291bGQgaGF2ZSB0byBiZSByZW1vdmVkIGZyb20KPj4+PiBtZXNvbl9jbGtfcGxs
X2RhdGEuCj4+Pj4KPj4+PiBIb3dldmVyLCBuIGlzIHJlZmVyZW5jZWQgMzUgdGltZXMgaW4gY2xr
LXBsbC5jLCB3aGljaCBtZWFucyB3ZSB3b3VsZCBuZWVkCj4+Pj4gdG8gbW9kaWZ5IGFsbAo+Pj4+
IHJlbGF0ZWQgbG9naWMgYWNyb3NzIHRoZSBmaWxlLiBUaGlzIHdvdWxkIGJlIGEgcmVsYXRpdmVs
eSBsYXJnZQo+Pj4+IGNoYW5nZS4KPj4+IFllcwo+Pj4KPj4+PiBNb3Jlb3ZlciwgZm9yIGFsbCBB
bWxvZ2ljIGNoaXBzLCB0aGUgbiBkaXZpZGVyIGlzIGFuIGluZGlzcGVuc2FibGUgcGFydCBvZgo+
Pj4+IHRoZSBEQ08gY2xvY2suCj4+PiBUaGVyZSBpcyBoYXJkbHkgYSBqdXN0aWZpY2F0aW9uIGhl
cmUKPj4+Cj4+Pj4gVGhlIGRpZmZlcmVuY2UgYmV0d2VlbiBTb0MgZ2VuZXJhdGlvbnMgaXMgYXMg
Zm9sbG93czoKPj4+PiAgICAgICBQcmV2aW91cyBTb0NzIFBMTDogbiA9IDEsIDIsIDMsIDQuLi4g
KGxpbmVhciBkaXZpZGVyKQo+Pj4+ICAgICAgIEE5IFNvQyBQTEw6ICAgICAgICAgICAgbiA9IDJe
MCwgMl4xLCAyXjIsIDJeMywgMl40Li4uIChwb3dlci1vZi10d28KPj4+PiBkaXZpZGVyKQo+Pj4g
WWVzIHRoYXQgd2FzIGZhaXJseSBvYnZpb3VzCj4+Pgo+Pj4+IFRoZXJlZm9yZSwgc3BsaXR0aW5n
IG91dCB0aGUgbiBkaXZpZGVyIGZyb20gdGhlIERDTyBjbG9jayBtaWdodCBub3QgYmUgYQo+Pj4+
IGdvb2QgZGVzaWduIGNob2ljZS4KPj4+IEknbSBub3Qgc3VyZSBJIGFncmVlIGFuZCB5b3UndmUg
b25seSBzdGF0ZWQgeW91ciBwb2ludCBvZiB2aWV3IHdpdGhvdXQKPj4+IHByb3ZpZGluZyBhbnkg
dGVjaG5pY2FsIGp1c3RpZmljYXRpb24gaGVyZS4KPj4+Cj4+PiAgIEZyb20gdGhlIGRhdGFzaGVl
dHMgb2YgdGhlIGRpZmZlcmVudCBTb0Mgd2UgaGF2ZSwgdGhlIGRvY3VtZW50ZWQKPj4+IGxpbWl0
YXRpb24gaXMgYWx3YXlzIHRoZSBEQ08gb3V0cHV0IHJhdGUgcmFuZ2UuIE5vdGhpbmcgcmVsYXRl
ZCB0byBuIChvcgo+Pj4gbSwgb3IgdGhlIG11bHQtcmFuZ2UgZm9yIHRoYXQgbWF0dGVyKS4gVGhp
cyBpcyBhIGxlZ2FjeSBwcm9ibGVtLCB3ZQo+Pj4gc3RhcnRlZCB3aXRoIG1vbm9saXRoaWMgZHJp
dmVyIGFuZCBzbG93bHkgc2ltcGxpZmllZCBpdC4KPj4+Cj4+PiBBcyBmYXIgYXMgSSBjYW4gc2Vl
IG5vdywgcmV3b3JraW5nIHRoZSBQTEwgZHJpdmVyIHRvIGJlIGEgc2ltcGxlCj4+PiBtdWx0aXBs
aWVyIGRyaXZlciB3aXRoIHJhbmdlIG91dHB1dCByYXRlIGNvbnN0cmFpbnQgY291bGQgYWN0dWFs
bHkgYmUKPj4+IHNpbXBsZXIgdGhhbiB0aGUgY3VycmVudCBjb2RlLiBJIHdvdWxkIGFsc28gbWFr
ZSBzaW1wbGVyIHRvIGFjY29tb2RhdGUKPj4+IGRpZmZlcmVuY2VzIHN1Y2ggYXMgdGhlIG9uZSBw
cmVzZW50ZWQgaGVyZS4KPj4+Cj4+PiBVbmxlc3MgeW91IGNhbiBwcm92aWRlIHRlY2huaWNhbCBy
ZWFzb25zIHdoeSBnb2luZyBpbiB0aGlzIGRpcmVjdGlvbgo+Pj4gd291bGQgYmUgaW5jb3JyZWN0
LCB0aGF0J3Mgd2hlcmUgSSdkIHByZWZlciB0byBnby4KPj4+Cj4+Pj4gWy4uLl0KPj4+Pgo+Pj4+
IEJlc3QgcmVnYXJkcywKPj4+Pgo+Pj4+IEppYW4KPj4+IC0tCj4+PiBKZXJvbWUKPj4KPj4gSSBh
Z3JlZSB0aGF0IGhhdmluZyBhbiBpbmRlcGVuZGVudCBOIGRpdmlkZXIgd291bGQgc2ltcGxpZnkg
dGhlIFBMTCByYXRlCj4+IGNhbGN1bGF0aW9uLgo+Pgo+PiBBIHNlcGFyYXRlIHByZS1kaXZpZGVy
IGZvciBOIGlzIHRlY2huaWNhbGx5IHBvc3NpYmxlLCBidXQgdGhlcmUgYXJlIHNvbWUKPj4gaGFy
ZHdhcmUgY29uc3RyYWludHMgdGhhdCBuZWVkIHRvIGJlIGNvbnNpZGVyZWQ6Cj4+Cj4+IE4gPSAx
IGlzIHRoZSBwcmVmZXJyZWQgb3BlcmF0aW5nIG1vZGUgZXhjZXB0IGEgZmV3IGZpeGVkLWZyZXF1
ZW5jeSBQTExzLgo+PiBMYXJnZXIgTiB2YWx1ZXMgcmVkdWNlIHRoZSBQTEwgcGhhc2UgZGV0ZWN0
b3IgZnJlcXVlbmN5LCB3aGljaCBtYXkKPj4gbmVnYXRpdmVseSBpbXBhY3QKPj4gaml0dGVyIHBl
cmZvcm1hbmNlIGFuZCBvdmVyYWxsIFBMTCBzdGFiaWxpdHkuCj4gVW5kZXJzdG9vZC4gWW91IGNv
dWxkIHJlYWxseSBtYWtlIGEgZGlmZmVyZW5jZSBieSBnb2luZyBkZWVwZXIgYW5kCj4gZXhwbGFp
bmluZyB3aGF0IHRob3NlIGNvbnN0cmFpbnRzIGFyZSwgZXNwZWNpYWxseSBzaW5jZSB5b3UgYXNr
IHF1ZXN0aW9uCj4gaW50ZXJuYWxseSBhdCBBbWxvZ2ljLgo+Cj4gQXQgdGhlIG1vbWVudCB3aGF0
IGlzIGRvY3VtZW50ZWQgaXMgYSByYW5nZSByZWdhcmRpbmcgdGhlIG91dHB1dCByYXRlIG9mCj4g
dGhlIFBMTHMuIEEgUExMIGlzIG1hZGUgb2YgYSBwcmUtZGl2aWRlciBhbmQgZnJhY3Rpb25hbCBt
dWx0aXBsaWVyLgo+IGFuZCB5b3UgYXJlIHNheWluZyB0aGF0IGZvciB0aGUgbXVsdGlwbGllciB0
byB3b3JrIGFuZCBsb2NrLCB0aGVyZSBpcwo+IGFjdHVhbGx5IGEgY29uc3RyYWludCB0aGUgaW5w
dXQgcmF0ZSB0b28uCj4KPiBJZiB5b3UgY2FuIGRpc2N1c3Mgd2l0aCB5b3VyIEhXIHRlYW0gYW5k
IGNsYXJpZnkgd2hhdCB0aGUgY29uc3RyYWludHMKPiByZWFsbHkgYXJlLCB0aGF0IHdvdWxkIGhl
bHAgdG8gYmV0dGVyIG1vZGVsIHRoZSBQTEwuIEluIHRoZW4gbW9yZSBsaWtlbHkKPiBmb3IgdXMg
dG8gZmlndXJlIG91dCB0aGUgYmVzdCB3YXkgdG8gZHJpdmUgaXQuCgoKSSBoYXZlIGRpc2N1c3Nl
ZCB3aXRoIHRoZSBIVyBQTEwgdGVhbS4gQW5kIGhlcmUgaXMgdGhlIGRpc2N1c3Npb24gcmVzdWx0
czoKCldoZW4gTiBpbmNyZWFzZXMgYnkgYSBmYWN0b3Igb2YgWCwgdGhlIFBMTCBiYW5kd2lkdGgg
ZGVjcmVhc2VzIGJ5IGEgCmZhY3RvciBvZiBYLApkZXZpYXRpbmcgZnJvbSB0aGUgZGVmYXVsdCBv
cHRpbWFsIGJhbmR3aWR0aCwgd2hpY2ggbGVhZHMgdG8gYSBkZWNyZWFzZSBpbgpjbG9jayBwZXJm
b3JtYW5jZSBhbmQgYWZmZWN0cyB0aGUgc3RhYmlsaXR5IG9mIGNsb2NrLWRlcGVuZGVudCBtb2R1
bGVzIAppbiB0aGUgY2hpcC4KCj4KPj4gQmVjYXVzZSBvZiB0aGlzLCB3ZSBjYW5ub3QgZ3VhcmFu
dGVlIHN0YWJsZSBzeXN0ZW0gb3BlcmF0aW9uIHdoZW4gYXJiaXRyYXJ5Cj4+IGxhcmdlcgo+PiBO
IHZhbHVlcyBhcmUgdXNlZC4KPj4KPj4gU29tZSBQTExzIHJlcXVpcmUgbm9uLTEgTiB2YWx1ZXMg
dG8gZ2VuZXJhdGUgc3BlY2lmaWMgZml4ZWQgb3V0cHV0Cj4+IGZyZXF1ZW5jaWVzIGJlY2F1c2UK
Pj4gdGhlIHRhcmdldCByYXRlIGNhbm5vdCBiZSBhY2hpZXZlZCB3aXRoIE4gPSAxIHdoaWxlIGtl
ZXBpbmcgdGhlIFBMTCB3aGlsZQo+PiBrZWVwaW5nIHRoZQo+PiBQTEwgd2l0aGluIGl0cyB2YWxp
ZCBvcGVyYXRpbmcgcmFuZ2UuIFNvIE4gaXMgZGVzaWduZWQgdG8gaGF2ZSBvdGhlciB2YWx1ZXMK
Pj4g4oCL4oCLdG8KPj4gc2F0aXNmeSB0aGlzIHJlcXVpcmVtZW50Lgo+IEFnYWluIGl0IHNlZW1z
IGxpa2UgdGhlIGNvbnN0cmFpbnRzIHdlIGFyZSB1c2luZyBhcmUgbm90IHRoZSByZWFsCj4gbGlt
aXRhdGlvbiwganVzdCBieS1wcm9kdWN0cywgd2hpY2ggdGhlIHNpdHVhdGlvbiB1bmNsZWFyLgoK
CldoZW4gTj0zLCB0aGlzIHR5cGUgb2YgUExMIGlzIGRlc2lnbmVkIHdpdGggdGhlIG9wdGltYWwg
YmFuZHdpZHRoIGJhc2VkIApvbiBOPTMuCgo+PiBGb3IgZXhhbXBsZSwgdGhlIEFYRyBQQ0llIFBM
TCB1c2VzIE4gPSAzIHRvIGdlbmVyYXRlIHRoZSByZXF1aXJlZCAxMDAgTUh6Cj4+IG91dHB1dCBm
cmVxdWVuY3ksCj4+IHNpbmNlIHRoZSB0YXJnZXQgZnJlcXVlbmN5IGNhbm5vdCBiZSBhY2hpZXZl
ZCB3aXRoIE4gPSAxLgo+Pgo+IFBDSWUgaXMgYSB0b3BpYyBpbiBpdHNlbGYuIEl0IHVzZXMgZGlm
ZmVyZW50IG9wcyBmb3IgaGlzdG9yaWMgcmVhc29ucyB0aG91Z2gKPiBJIHN1c3BlY3QsIHdpdGgg
cHJvcGVyIGNvbnN0cmFpbnRzLCBpdCB3b3VsZCBub3QgcmVhbGx5IG5lZWQgdG8uCgoKUENJZSBo
YXMgYSBzdHJpY3QgcHJvdG9jb2wgdGhhdCBtdXN0IGJlIGZvbGxvd2VkLiBJdCBpcyBhbHNvIGEg
aGlnaGx5IApzZW5zaXRpdmUgYmxvY2sKd2l0aCBodW5kcmVkcyBvZiBjb21wbGV4IGFuZCBzdHJp
bmdlbnQgbGFiIHRlc3QgcmVxdWlyZW1lbnRzLgoKVGhlIFBDSWUgUExMIGxvY2sgc2VxdWVuY2Ug
bmVlZHMgdG8gZnVsbHkgZm9sbG93IHRoZSBBbWxvZ2ljIEhXIHRlYW0ncyAKcmVsZWFzZWQgZGVt
byBjb2RlLgo+PiBBZGRpdGlvbmFsbHksIGlzIHRoZSByZWZhY3RvcmVkIHByZS1kaXZpZGVyIE4g
aW1wbGVtZW50ZWQgYXMgYSBzZXBhcmF0ZQo+PiBwYXRjaHNldCwKPj4gaW5kZXBlbmRlbnQgZnJv
bSB0aGUgQTkgUExMIGNoYW5nZXM/Cj4gSSBjb3VsZCBiZSBzZWVuIGFzIGEgcHJlLXJlcXVpc2l0
ZS4KCgpVbmRlcnN0b29kLgoKPj4KPj4gQmVzdCByZWdhcmRzLAo+Pgo+Pgo+PiBKaWFuCj4gLS0K
PiBKZXJvbWUKCgpCZXN0IHJlZ2FyZHMsCgoKSmlhbgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4
LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
