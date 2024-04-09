Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E73FC67861
	for <linux-amlogic@archiver.kernel.org>; Tue,  9 Apr 2024 08:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zw7bHwEyHmIbNpLYU/hyfZxd/3YeSpK1+rvrWM9jBcY=; b=f6qGS6sGlc82Y7QY0c1YOAWD4y
	4X2AU6DWj3JVNl29zXhOcpUzUGPP+cBwDTMgPcIUJ4sfEe559gwSoSrY9PyYu60MRH+lNpDF4R5Is
	zLmb3VXJN5b9ZnyooUzMez1m31G6/nkeic8R3RM0igUIgH8XajucQ7UJZCPpkPdc1NIwflthpsB/N
	XIi1r/2l/3ZyU/jpI76YtqNSwzP9/dvHtxouNeAs9ML1IOAJI1pD6wogwNksg30nCN/0DMNAbJqmW
	lL4q/qub94c1Pqv5iUxsnIriLrtuEiovZ5PeiL1/X6bqmPyuU2Tuci0PLZCMJoPcHcsp+XBKjNmpU
	ARmYpcNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru6eO-00000000uVD-2LSd;
	Tue, 09 Apr 2024 08:16:16 +0000
Received: from mail-eastasiaazlp170100000.outbound.protection.outlook.com ([2a01:111:f403:c400::] helo=HK2PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru6eG-00000000uSX-2t6G;
	Tue, 09 Apr 2024 08:16:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bBXT2nMTK4Mw4qxsWOtPkL+wydpKyPb29w9udHqiWn5LHWO1LfZsYFl0bT3tGg282ab1aAgc+Cg5rDxB9hx0vMd5WnH+89O3HGhqG9/E0WGGckVcZE+mBwBY2Rs92f0W/hFJ/z/jilgtNWR3IkM+QE8MKBSJrTCfEwhPjB/RCYxzivK96oPB4rVX6+mbjGpFQsB2rt5tHGkex690oerkSwylfjmkylYajhPrZmSO6gwHDzeLD+kZPWq71fgkheIDHeOZHh3ic3XrxXZV3DtYdE5AAoonmbUQf2bMzLLVgldRi0vDC9sL6Rh+nC9eGqwqqWKrT2HNMt+CS7N56pHdww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ukNaMHR15lWIyUJBrhy5LsSuB4h5zjuaeaY3gONE7t4=;
 b=KIhXX6HijlaQjzUrwGF/6IBjE4cq3eaFNHp0WmW2pZYJbRKfc4S2WfGlz4Ce7FXFIKBM8LbjWdKN/t19Oivl/Zhz06V7Q8MeUIQppwe08Dfw1jmI92W+19lKSDgTaZRiX8o4VBJjp1mIr/koazL5JMyO5cCpnLzWntJGiL1GI2NCD/VZ/9pJhEo457O/fjsnBp6x1GXjNMYp7mQDPmc8N7+BOqARum3PHjSwqIpJjOmEp1hdiNhNemBhtNgEXnqEZPcVRED+bmub3MVuH687XD/lzfpSQe/U4sOdZD50zrdXfB75/v5f5kEpChgjUSJGukQUGRruwBdBaFZYhQ3OQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ukNaMHR15lWIyUJBrhy5LsSuB4h5zjuaeaY3gONE7t4=;
 b=Bn8KX+z7Ir9dx06e56IjjvmBefYJnb0ngPpQCqkA+PMrMlsJTQvCq4wWesvXx9WRlHGYo4wug0iVXmjs8Mc1cZ2+G7RM1qeO/Wzst1Ewn4vie1ad4SYawm8sbOxRVUIKG23k+oIkw1cx2DqjN1bcQqknkInb+tLf9/NO+//ObkpkRPl4CsjuAApKcpO/3t8Cc+CS7bmnXoRfLXj++shLZSNBJSWJdzz4+uu4mB8aA1d3I6cyv7QYuONQg1h5NCSJb9jSKL1eDbT+eNTjVPFaW12a2U+ZGKGKAzIFO4HDQ5793v2EsqlJXOD9XkW0jj2+GhJLdwzywH5jYBhNWx7OyA==
Received: from PUZPR03MB6888.apcprd03.prod.outlook.com (2603:1096:301:100::7)
 by SEZPR03MB8966.apcprd03.prod.outlook.com (2603:1096:101:248::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Tue, 9 Apr
 2024 08:15:56 +0000
Received: from PUZPR03MB6888.apcprd03.prod.outlook.com
 ([fe80::ecbf:40a0:335e:cceb]) by PUZPR03MB6888.apcprd03.prod.outlook.com
 ([fe80::ecbf:40a0:335e:cceb%6]) with mapi id 15.20.7409.053; Tue, 9 Apr 2024
 08:15:54 +0000
Message-ID: <f6de7d87-ee23-4b65-b0e5-cb5217ecc692@amlogic.com>
Date: Tue, 9 Apr 2024 16:15:44 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: meson: fix S4 power-controller node
Content-Language: en-US
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240408-fix-secpwr-s4-v1-1-01aa7ee72c52@amlogic.com>
 <CAFBinCD=xWuhoX9cWcKU3bSGcsDShKbxnMVTdyfD84AFZQn8aw@mail.gmail.com>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <CAFBinCD=xWuhoX9cWcKU3bSGcsDShKbxnMVTdyfD84AFZQn8aw@mail.gmail.com>
X-ClientProxiedBy: SI1PR02CA0019.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::15) To PUZPR03MB6888.apcprd03.prod.outlook.com
 (2603:1096:301:100::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR03MB6888:EE_|SEZPR03MB8966:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9iqHaLeJ03ZbkLZJD+fCZNAW/6aymQogerPRdbqJisEI64ycEDsODZFsWzNtX8qN0PvuBHQG4bPvnuBVaK18BBwkIwEndMbq1LE3ctIITeeqfTYhlvIIy8xAgo2oR2b/8DxptGKf76hBYMh848mvWvDooSSSYD1M1ALQZpBQE2lgjS6UN3Dz2VRsw3WcplUfLwE0dR/TrZaIYdqk0WHyc5HZm7U4AxiQzn5ysaNhS+zjXEwklsUdnMdH/1+wLyO1LrjK3clSEeSyvm8skAOn4oXpqAx8Mvxw3W+YqcnrJ342hzcQ3X4KR00aE7coYEydAlUq0FQAGxoP16KpOQV7sLfgG8Png+fcF9CcRsUMWGUQjTWtgcmZn7FtIfbO3fOGKw5JCtneUgMdXDJnA29iVu+oXwXW6MpGFCU0W0F8VVfN7mI5gBh/vGLYf9Ilf2w1cmk8QUXTqA5ZqrYMOlq3L815bKEjhW5zcAkbWmmcQjbITERL6L6yChVflZeMq2u+z8XYOWLF5gUZiEoo1Fi/dl2l3MVz7sGC2YbV4U13bHz7AQDFa61UTRtGF0Wur9hoSW6PEv/i6iYWQuGlOd2Gf1S2eY8XS/KC5Cwg+DKgMEPEEaRgpnaCN98KOMgeuPxXeN/9dmtabyeKYqgvX9Octg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR03MB6888.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(7416005)(366007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RVpTYm9FMDlGeG8rQ3MwOFE0Y2hYckxlY2F6VlZ2U0xYZnhqL3ViczlpVkZo?=
 =?utf-8?B?S3hGbEtZQkM5QkYrcHJ2MWVjNE8zWDhoMHNnM0tmTFVvcGRSUytWdG9PSEZG?=
 =?utf-8?B?Uk5RVkRRUmthb3N1MWgxbFVCcFZta1diSGQ3cDB4RkthYXlZTDNySHhVYS92?=
 =?utf-8?B?V3MxY3RxMzdzWkltc1pZei9zUW1aUnZRN0k3MlIwOCtFZzQvNlpvMXcrRWxV?=
 =?utf-8?B?Ymd2T3lwZWdXeFFuQjdPSCtWVUxobUxVQ2pOQ05EQ3pRK3pBd3VRWDlmRWp2?=
 =?utf-8?B?Y2VaOVlaNk0reVY3c3RadjRxTkIvazJxejZZUTNOb05VenBXQmxRbXdhaW1G?=
 =?utf-8?B?YzRYM3ArYVorajI3d2txalJqbkkrSmdKa3M5cWJjUU11RVB3ZXVzaXdJSGcz?=
 =?utf-8?B?N3kzNDd0Vkp6bjdaS2U4bzVoaWN5WGEwaDR0aVM0Z1A2NXBCV3BlV0ZlQmVx?=
 =?utf-8?B?eVNGMWFzSG9xYlNFNzlZQ09kVlI1NnJ1YllMYjlZTURmWjRXU1VoMHptNldt?=
 =?utf-8?B?azZlaWtkZmRqZlZhR1c0dlZ4bmFEYUE4RklzN0lCamM1UzV2ckFHVzkvR2pQ?=
 =?utf-8?B?WmxZaWVxa2J6VVIxdmJPL3ltYzRacVhYNmlYTjhDeDlXRDlMQXJmTURXNU0r?=
 =?utf-8?B?N2J5YTloMkxzVUNpZXlsRVp2OTNQak9LM3N5QTJOU0dJdUM3aUoycjRUcmJW?=
 =?utf-8?B?QUlwelJOZVJZVXNFQU1CWlIwVitXc0hKZzArZEgydUVTTnNnRDBZcW93andq?=
 =?utf-8?B?UDYvRGkzVnBXMjJuU0lhcE4ybnViN2lBTWtIQUxVUEpaNWFNM2VsZlJNaHl2?=
 =?utf-8?B?R0p4MjVSS0dka3pEODZ0MElBU1pXUDk3dTNhdFNtVmZTcUNKa0NSbFp6bm5h?=
 =?utf-8?B?Wkt4enkvYlE3dlVWaFY3ZW9tSHY0Q0IrejRNVlAxa2NGcTBoaUxvWitRd2Zk?=
 =?utf-8?B?QytvVlBuVHpnMndUVDJkWSs2R05SUXBsbXA5NDNYUlI4VzY2a0Z5dlVFYW1t?=
 =?utf-8?B?SzhxZzliajNaaHBVUHhBeEZ5U2wvQUJkbDE5eVFubHc2VTF5d1h4bzA3MEtV?=
 =?utf-8?B?SmpXTllVOWVuK05KOVY5c2IyOTY4Si9QaHI5bC93ZEJUbldybTE2N2RXMDI0?=
 =?utf-8?B?clp2dkl1V2pFS1VxWUEvVS91SU8zaklYYjBpbUI1U09GMFFTR0JMeDFJOWIz?=
 =?utf-8?B?dlVzVmlqTkpsamlFZ2RBYnpOV2FnUGc1SytGU2JXbzFVMGxleDNDQUN4TUdY?=
 =?utf-8?B?TXQvSXhRR1oxYy9YTmlvbXVXc2twYlpoTzFMT0hqK0loTE5VemlQR0lrZ2JP?=
 =?utf-8?B?Mlh6dWpZb2lFbWMvOXpiQVdsdnMvYjhvWTZxUWlNeEd6Kzd3eHgrQmdKMkxR?=
 =?utf-8?B?dVBoVXVkQ242WEZkZmRQSFdFclNmbTRGYkdiRlpkK2RZZmtDbjl4dG5kNVlB?=
 =?utf-8?B?RnFBM3M5MTlSM2phK0ROTVFJRFpGMU1mTmxqK3ZxaUdsb2ZNMHRvRlR3NEd2?=
 =?utf-8?B?Yk00S3B2SjR4ZzIxaDZJSkVaUFQrUmVma3FmS1p2MGJleEdFaU0zc1dCSWRo?=
 =?utf-8?B?U3dpYk8xN0piaU5ZbjF4aWl2NjhqK1YydnIxalM5cW8zVlMySkNOdG9UVGZE?=
 =?utf-8?B?RG5uWEVvZ3lVWnJGTWxvK3kwY09yYmhzRXgzTGp5ZGNOYkl5OWRpaUMwQUI3?=
 =?utf-8?B?L01tTWQrVkl4VDBKQlpzK2JsYVAwcXFZQlVWZDJhc3RFMGZKQ1hoVk1KQjR3?=
 =?utf-8?B?Q0RmWmdVcVM5bTVpVGE5NFR3ZzRSMFlTR0JGY0hlczJyTWMrak50NldiV1lv?=
 =?utf-8?B?S3REbldJMGk5d3BrVnpGNlFHWTFCK1VNOVF2a05EY0F0czFYUE9pTUZXeFAz?=
 =?utf-8?B?OW8waGxOYTNCSmdPOFVGczdsUDJVMFBkVG8xcDloZ0x4SVp6SXZiUlV4VjNI?=
 =?utf-8?B?OGdvSTQxejh5dkJHbm45KzVxYVZUMlVWa2pLUkxrV0ZQOU5ZWXo0WHJxeC9w?=
 =?utf-8?B?aldkZEhqY21HS1VsM3BCTHdkWERDYVk4NlhFekUzUi9pbEVXSFg0aUhBV1Fo?=
 =?utf-8?B?a05hNlN6SlpRUFBUU3JPcXRDRVpSanhRaTQ2Wkk3Vis4SGF1SFZrVEx1U1NU?=
 =?utf-8?B?K0J6ZkgyOW9tVmxWa3VaL25ZeE8rNmpqcmlURFhZa3NEcktUNEw4QnN4aGxG?=
 =?utf-8?B?T0E9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7976467-2651-400d-a69f-08dc586d46d6
X-MS-Exchange-CrossTenant-AuthSource: PUZPR03MB6888.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2024 08:15:54.4466
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IJZblcbBkWSzQ+YOmXF+FlLensK2fG8Bcc02XVrakjylWi9D5s5mvRi3ubO6y8zb8GJi4Kw/WgNP9fPKRpC3sza3h1KRaO5tK95pCU2Xsgo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB8966
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_011608_764063_8D273FB6 
X-CRM114-Status: GOOD (  17.57  )
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

SGkgTWFydGluLAogICAgIFRoYW5rcyBmb3IgeW91ciByZXZpZXcuCgpPbiAyMDI0LzQvOSAwMToy
NywgTWFydGluIEJsdW1lbnN0aW5nbCB3cm90ZToKPiBbIEVYVEVSTkFMIEVNQUlMIF0KPiAKPiBP
biBNb24sIEFwciA4LCAyMDI0IGF0IDU6MjbigK9BTSBYaWFud2VpIFpoYW8gdmlhIEI0IFJlbGF5
Cj4gPGRldm51bGwreGlhbndlaS56aGFvLmFtbG9naWMuY29tQGtlcm5lbC5vcmc+IHdyb3RlOgo+
Pgo+PiBGcm9tOiBYaWFud2VpIFpoYW8gPHhpYW53ZWkuemhhb0BhbWxvZ2ljLmNvbT4KPj4KPj4g
VGhlIHBvd2VyLWNvbnRyb2xsZXIgbW9kdWxlIHdvcmtzIHdlbGwgYnkgYWRkaW5nIGl0cyBwYXJl
bnQKPj4gbm9kZSBzZWN1cmUtbW9uaXRvci4KPj4KPiAKPiBQbGVhc2UgYWRkIGEgRml4ZXMgdGFn
IGhlcmUgd2l0aCB0aGUgb3JpZ2luYWwgY29tbWl0IHdoZXJlIHRoZQo+IGluY29ycmVjdGx5IHBs
YWNlZCBub2RlIHdhcyBhZGRlZC4KCldpbGwgYWRkIEZpeGVzIHRhZy4KCj4+IFNpZ25lZC1vZmYt
Ynk6IFhpYW53ZWkgWmhhbyA8eGlhbndlaS56aGFvQGFtbG9naWMuY29tPgo+PiAtLS0KPj4gICBh
cmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tczQuZHRzaSB8IDExICsrKysrKystLS0t
Cj4+ICAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPj4K
Pj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1zNC5kdHNp
IGIvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLXM0LmR0c2kKPj4gaW5kZXggY2U5
MGIzNTY4NmEyLi4yNGQwMGRjZTQ5NjkgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9k
dHMvYW1sb2dpYy9tZXNvbi1zNC5kdHNpCj4+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1s
b2dpYy9tZXNvbi1zNC5kdHNpCj4+IEBAIC02NSwxMCArNjUsMTMgQEAgeHRhbDogeHRhbC1jbGsg
ewo+PiAgICAgICAgICAgICAgICAgICNjbG9jay1jZWxscyA9IDwwPjsKPj4gICAgICAgICAgfTsK
Pj4KPj4gLSAgICAgICBwd3JjOiBwb3dlci1jb250cm9sbGVyIHsKPj4gLSAgICAgICAgICAgICAg
IGNvbXBhdGlibGUgPSAiYW1sb2dpYyxtZXNvbi1zNC1wd3JjIjsKPj4gLSAgICAgICAgICAgICAg
ICNwb3dlci1kb21haW4tY2VsbHMgPSA8MT47Cj4+IC0gICAgICAgICAgICAgICBzdGF0dXMgPSAi
b2theSI7Cj4+ICsgICAgICAgc206IHNlY3VyZS1tb25pdG9yIHsKPj4gKyAgICAgICAgICAgICAg
IGNvbXBhdGlibGUgPSAiYW1sb2dpYyxtZXNvbi1neGJiLXNtIjsKPj4gKwo+PiArICAgICAgICAg
ICAgICAgcHdyYzogcG93ZXItY29udHJvbGxlciB7Cj4+ICsgICAgICAgICAgICAgICAgICAgICAg
IGNvbXBhdGlibGUgPSAiYW1sb2dpYyxtZXNvbi1zNC1wd3JjIjsKPj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgI3Bvd2VyLWRvbWFpbi1jZWxscyA9IDwxPjsKPj4gKyAgICAgICAgICAgICAgIH07
Cj4gSW4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Zpcm13YXJlL2FtbG9naWMs
bWVzb24tZ3hiYi1zbS55YW1sCj4gdGhlIGhpZXJhcmNoeSBpczoKPiBmaXJtd2FyZSB7Cj4gICAg
c2VjdXJlLW1vbml0b3Igewo+ICAgICAgIHBvd2VyLWNvbnRyb2xsZXIgewo+ICAgICAgICAgLi4u
Cj4gICAgICAgfQo+ICAgIH0KPiB9Cj4gCj4gSXMgdGhpcyBwYXRjaCBjb3JyZWN0IChhbmQgdGhl
IGRvY3VtZW50YXRpb24gbmVlZHMgdG8gYmUgYWRhcHRlZCkgb3IKPiBpcyB0aGUgZG9jdW1lbnRh
dGlvbiBjb3JyZWN0IChhbmQgdGhpcyBwYXRjaCBoYXMgdG8gYmUgYWRhcHRlZCk/CgpXaWxsIGFk
ZCBmaXJtd2FyZSBub2RlIHRvIGFkYXB0IGRvY3VtZW50YXRpb24uCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlz
dApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
