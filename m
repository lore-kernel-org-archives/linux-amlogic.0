Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B03DC71153
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Sep 2023 02:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1j3cvgRxnHccefUvI/ieyWOmPmdkUx/lRh6KGfwXN38=; b=OHtn+NPnrn/2KR1sOypFIqDklQ
	rMGdNXJ/oAv+tlPlwY0YxdUJkg6Gb5iIvrkTxC2gOGrhgUC3LAWNGN4VIeh2uU4JPGHELg8aEEMxE
	vMiAQNhMLulHKdpKGXiTQuVLEHfpwfaL0pD29KUL4Z/7XlWyejWT4tvVJBesWHZuU6UPRBJSwdous
	IrZaxyEVp8ZiNgogxPklRwEWnCEVjv+A4yUCZ14daX7MSaQPT+tmyVP9K+fwDmiI5rk2iL0qXw3NB
	VW9ekWnoxGFR3R6zwYYVezzNcnziU52R22xqXA8JWZAZ0WpL7hds9oANw8wmUbxcglmZY6WmJRXuS
	oE6PG0Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfWgZ-00H5hZ-2m;
	Mon, 11 Sep 2023 02:29:59 +0000
Received: from mail-sgaapc01on2070b.outbound.protection.outlook.com ([2a01:111:f400:feab::70b] helo=APC01-SG2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfWgV-00H5h9-2V;
	Mon, 11 Sep 2023 02:29:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M1Qdz18EyGVz316sRGhS5hzjW6ygvfYyM3s3H66sdX2IB1sLEYBDuY0CYC1O51AO+jNaN4pSVlyPHD27+LB/VZ1TiKB072/3jKpJ5H/Ia67EizMISShsMSPPvnLYkMX8JY/IsYKAaPEoQV/wn4mykOaiMmGgfCYXA6AutP5QgA50YOTK5GeFRTE7KPlfGovOdVyC4UuAgVOv57ENED32B6meLUSuX/cPXXWa66KuZFUTe9ATU/4izvO+CAOGVghXPj+V+ZI/k0JeRYfv5/w9YMW3WLZ6Kuc6NraXS+dD9UloqCOi2BBKc73TIyGTQXacClMyCZnVqfjWXDTUi4SkbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4OxEmTJVm2ocsRO5ZgHYbCDwSRQhUgsGYHPgkGabEfw=;
 b=I44+H+gCYlScfTFunJrRA6aMIDpZ2YJGRzIverr/fxiXZ4kb52jZM/i66DQAcChl8UnapF0XxwAirFPse6LQSp61DccpNveqAa4n1MymjS0CzNhjM2ClOFqbmnL3xSU8B96hwOPC816fJ96nnU+DB0uPyMlVemtU/60sdj/Jde/4lHllhjNBQNHVtyEY37pezS+hwQ4KLVEScURT0ci1EgQt6Msfu8zvyhTUbHxyAdp9M6Qehv6yrS8OBNc3cEUJroeUMUpOxVXGcxKEOVb+eQ8SVI1ZzPNU6qdXW9OXcHCyvN0NvY4mx50ACL+pxykQsG0H8t8S1voXjixrMq9tbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4OxEmTJVm2ocsRO5ZgHYbCDwSRQhUgsGYHPgkGabEfw=;
 b=tde9ZcHxOOigPYj3EMN6L5WDO1nBOnNVnW0UCFDAGGMFOg3q2/30zWM2kVMs4ZSn3bhg9mvdOiSwERXaBMCIx7/YEvAiTn1VzfHS0xc3d3NHzE4xMLYh2oLcvMJtKCZdjVdmIB2IitcqzGe6rBy8TrOp/CCxUcfVJU+63Qf59a15TRu3oJmSpx5FSjYEpD5Cw1zHC0huEmx/4n6pWFgtQ02rdq9nl31XqBc7E/JvW9eKxD6rBUkDlf2zxLUlP5INftWslIBd9Ik9HQELvlHohch5fVQvAf7kj3BWLrKTGTYR0IrE6Oca1n7TkAxd2rcILt6dhLlooyJ3CiUnrWWxiw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by KL1PR03MB7744.apcprd03.prod.outlook.com (2603:1096:820:ed::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.31; Mon, 11 Sep
 2023 02:29:43 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::f065:6e23:803b:2a75]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::f065:6e23:803b:2a75%7]) with mapi id 15.20.6768.029; Mon, 11 Sep 2023
 02:29:42 +0000
Message-ID: <831c9c56-a8ed-3739-00b6-326653be3d36@amlogic.com>
Date: Mon, 11 Sep 2023 10:29:37 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH V3 0/6] Power: T7: add power domain driver
Content-Language: en-US
To: neil.armstrong@linaro.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 linux-pm@vger.kernel.org
References: <20230829020404.4058677-1-xianwei.zhao@amlogic.com>
 <82001107-3e72-4cc7-b7d4-8ca1a840b508@linaro.org>
 <4303c141-30df-4a2b-aba7-f11a98db9941@linaro.org>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <4303c141-30df-4a2b-aba7-f11a98db9941@linaro.org>
X-ClientProxiedBy: TYCP301CA0025.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::12) To TYZPR03MB6896.apcprd03.prod.outlook.com
 (2603:1096:400:289::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|KL1PR03MB7744:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f98647c-9c6a-49c2-0de3-08dbb26ef43b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PwK5vogpmctVV9s96N6T1CCKTP3FJduH/QQr666HznO3axMao0WVPtzSfoFiPHk63Qf1S6m6sIpqoy5xN1/aixoFLrFTFNHRXpzVjZS5lP23GEmQH2cNtjv2sJ61JChtAe9Gj4Hl69n47sC3cN1SzQwtZeJX/JsyR4j4zF5pUnalfxk91bNeoJLTDYmevsro/ty9EoICsgKHOSCQcbwBSEFYNdj63xVCMQ+A44b2FZbipw33Cm0v56g4YfHA8ewqgWa+9IW1Il24k43qi9AIgp+UeD52Lj4b3L+9JV5r1X671D3tu8zuG6jOjJVt+skxqQmaY4hbLTDGQxPUL0nh5hVoK3IjSwvvmDtyUxwGPzRA0OlWjUAgv+mf+fPUnh6wBX6gVsmngb9fprTnR56FHTam+Jb/UUWXXTBL6bym0+cmg8airTGXgF6sc+H1wfjB00yDvP+V0w/aRCzd7GhUcOvc29ZW6yEElGFvOUJ9AH0tv/qXZpMMZlZQFSOWdXzTDUTDpiqewE8UGm+UE8pqjnOAAD2W0pmtjzxM2v8ixRQaU0ocpuc9jTymhSbnfy2ram9yC+2lVOYyh04p+fH3wO5m9GGxdKDiM+SAxmaBkrQhcYwtZr403n7SslRce+JDi3qEBzeHEiqMpCI1V9uNMeoOxZq9AdvFVEO21EFaL9ckqosRumd/iXNzlOOF2t4HnNjfSlaX9fKh2lEcQfbU+Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(376002)(396003)(39850400004)(346002)(1800799009)(186009)(451199024)(6506007)(6486002)(53546011)(6666004)(6512007)(478600001)(83380400001)(2616005)(2906002)(7416002)(26005)(44832011)(54906003)(66476007)(66556008)(66946007)(6916009)(316002)(5660300002)(4326008)(8676002)(8936002)(31696002)(86362001)(36756003)(38100700002)(31686004)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UWdGbmx0eWhEVVNseXU1ZjVTUlg5Sm5QRzc2TlZoUkRKZjJyTUlZZDRpTW5N?=
 =?utf-8?B?MXdWQ0hHdEc3cWdGdEUzVE1HT1BBd2drZDNGYzJsanNGMENNYTdFblMwRzJC?=
 =?utf-8?B?TUxvc1ZxZ2NzNXBZRkVpLy9NN2Y4SDBaZXlHR2JOTWRpdUtOQ1BDVTZaSERL?=
 =?utf-8?B?c2tJSnEwb0szLzVGSDhlMXQ2c0lPaUdvd0h3WFE2eHJ4ckk0QjkwSlFOSjhK?=
 =?utf-8?B?OFNNYU9Ec1czeHVseUpxSzBSVUxycnFKcjQ5NGk4bHQ1ZUhSZTZRRHdYRklH?=
 =?utf-8?B?UWc5Rjc2QTRTWjd0aUxWNVliVkdFM3d0bm15RUpJbDNjUk9RZWFHdW5SdHo0?=
 =?utf-8?B?MlVzWURSWFAvc1lOSUZVT0wzSGxBUklSY1V2ODVnVDZjNTNobmVKVDhaNFlx?=
 =?utf-8?B?dmdhcUNRNnR4VXVudDc0anZjVlI1OXpkUUxnUWxEL3QwVldseER2ZG5nTTNh?=
 =?utf-8?B?MHh6UWZ2M0VRUkFoc2ozSVBLakVLRE1Xd3Q2YVdicDFkNGk5TGZaSjNVbGpy?=
 =?utf-8?B?aWJZQXlsNzlReG9ycm9waWo4NWtSVEtPTzVWekVBcDAva01kTVJGK3pYakR4?=
 =?utf-8?B?a1pyQlk4UWpxNitLSVJCQzNLcDVjUmU3bHpuK2VOdkxwZUpQM09BdlIvR0FD?=
 =?utf-8?B?bC9lTTcraEZCZjYyMGVUSU9LYWdSMGdNbmpVS3JyVnVLMVh2ZDRibkJsM1hG?=
 =?utf-8?B?N3pzaVRLNitITXZvT1lBdy9ZbzBYa3psNS9wWXBqYzh3N2NKZ0p6M1NwTysv?=
 =?utf-8?B?RFNoR3J1d01IVkRlR0o4dXZWWWFSUnRVNkViTW1lZldETGluVmNzcXpXZUcx?=
 =?utf-8?B?djR6MTUwS3VKY0FKZDNLbHpiNk1SVHdXc0R5YVd5YVFFVTNpc2lkelZ0UEZo?=
 =?utf-8?B?MjBqVVMxSE5kTUE1ZUlJVndrL1lydUJDUFprUnNoUjJKTVZ3OVM3OUtuN0Jk?=
 =?utf-8?B?U1pzWjN4dU5uZ1F0TlljRCtTcmFxWStlQ2VtcFNMY050U0c4TEM2Z2hYMDM4?=
 =?utf-8?B?Z3QrRDk3bUNENmwwNlJjb2RybklYM0tOaEZPakd2SUVJNVl2UFN5S0hnMzFC?=
 =?utf-8?B?OTlLUWIzNWl6NzlmVUhscGQ1Rmp6MnZJeDdMSkJQZC93Y01wWi9hN3cvYjhp?=
 =?utf-8?B?Si91R2JsSWNaeEZPU0FUVGY4K24xandqeWMvT0Vta1pVKzh5ZVdqOUpVNnE2?=
 =?utf-8?B?dFZtT2tUWHhWb2lQVXEvVVdzbVVocy90KzUycHY3RWh0bkxEZjB2blJhdzFE?=
 =?utf-8?B?STJ1K3czNXBxN1orbzVCcnlpdnkrQ3V0ZUhlaUtYKzZyZmMvSjJ2bW1QdzFn?=
 =?utf-8?B?a3UwNFpPY3RoSElxeHh1UnU4MFNoRlFMVy9LemtHcEgvN3VDVjh2QW9tWnRv?=
 =?utf-8?B?RE54a1BHUG9zbTBpR0VyVS83aForRFdtVVB4SWxsd2RrM1h1OElvTjBBNzFG?=
 =?utf-8?B?VXdIaHRKNFo5TFc3ZXN5QXBYYlRTZEFSVlR6RXNrRFEwcllIVWpJV0FqQ1p0?=
 =?utf-8?B?Ujkrdm1TZGNnOTR1UnZFOXlCU05hS3o5MHl5ZmNKYWp4SWVYNGl1THEzOTI3?=
 =?utf-8?B?Y0taUGpLWHQxWUpTR2ZuVlY1OVI1dEVSS29oblVrZGxnZVF5NmNXTEd3QUZx?=
 =?utf-8?B?RlEyZldseDB2WVFvSHJ0QWhLVnM4d0hreWJUNHlBbjF0U2JBcmhkMFF3SE5K?=
 =?utf-8?B?K1hZcVRjZnNDWXpKZ1VidjM4QXlraFJMS2Y1U2VveHU0SEZydnFsZHNiU3Bv?=
 =?utf-8?B?c0xHR3lCcjBGMm5aZ0tNQk96WmRpTVZUbHdoeGJ1emdRc2dNZHhLbGVFQ3FT?=
 =?utf-8?B?b1o4ZTlRYWloMjVuMXlRa1lqamlYOHdLVHNtNFB5SmhzL3AySFkzbVdadC9Q?=
 =?utf-8?B?SVNoRHVQL1A5dnJsTHlOakJHcUZWUHl1T0ltQ2NIVWVJZVRibHJXL01Vc1Fy?=
 =?utf-8?B?bkpTUmd1L2pCRjYyd2MzdDRUckNVTThpNjlIZ0FpWllFd3dTcDJzdGVTclUx?=
 =?utf-8?B?Y1B0eHhRMnZYcCtNRUZIZ3QyS0l4MFp5NzZGY2pNbDJYaVI5bTBnbWkzY09p?=
 =?utf-8?B?SXYvbzd2dWNmOFlOKzViSCtJM2UzMktwY3FSdEZtSGQxNEFheWdOTDlxMFQx?=
 =?utf-8?B?WW9QSzJXbm9MRlJEaHkyc1c2MGhNM0F5R2JUM29SK0NCUS90WWZyWjIycEZz?=
 =?utf-8?B?Z3c9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f98647c-9c6a-49c2-0de3-08dbb26ef43b
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 02:29:42.0796
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9bOGWKIUhoPNM8/eMhTJKXWns5z2CHIjEqaA//ZjEBQXismEnnEfyGl6bCiry7a/YMnHVhg/qmRkx5cPowgJwvzuIJgH6dAsjA60Sqte5dM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB7744
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230910_192955_889342_DAAAAC8E 
X-CRM114-Status: GOOD (  14.20  )
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

SGkgTmVpbCwKICAgIFRoYW5rcy4KCk9uIDIwMjMvOS84IDIwOjQ1LCBOZWlsIEFybXN0cm9uZyB3
cm90ZToKPiBbIEVYVEVSTkFMIEVNQUlMIF0KPiAKPiBPbiAwOC8wOS8yMDIzIDE0OjQwLCBOZWls
IEFybXN0cm9uZyB3cm90ZToKPj4gSGksCj4+Cj4+IE9uIDI5LzA4LzIwMjMgMDQ6MDMsIFhpYW53
ZWkgWmhhbyB3cm90ZToKPj4+IEZpcnN0IHBhdGNoIGlzIHRoYXQgcmVtb3ZlIEMzIHNvbWUgcG93
ZXIgZG9tYWluIEFMV0FZU19PTiBwcm9wZXJ0eS4KPj4+IFNlY29uZCBwYXRjaCBpcyB0aGF0IGFk
ZCBkcml2ZXIgdG8gc3VwcG9ydCBwb3dlciBwYXJlbnQgbm9kZS4KPj4+IFRoaXJkIHBhdGNoIGlz
IHRoYXQgdHVybiBvbiBwb3dlciBpZiBpbml0aWFsIHBvd2VyIGRvbWFpbiB3aXRoCj4+PiAiQVdB
WV9PTiIgcHJvcGVydHkgc3RhdGUgaXMgb2ZmLgo+Pj4KPj4+IE90aGVyIHBhdGNocyBhZGRzIHBv
d2VyIGNvbnRyb2xsZXIgZHJpdmVyIHN1cHBvcnQgZm9yIEFtbG9naWMgVDcgU29DLgo+Pgo+PiBQ
bGVhc2UgcmUtc2VuZCB0byBVbGYgSGFuc3NvbiA8dWxmLmhhbnNzb25AbGluYXJvLm9yZz4gYW5k
Cj4+IGxpbnV4LXBtQHZnZXIua2VybmVsLm9yZyBzaW5jZSB0aGlzIGRyaXZlciBoYXMgbW92ZWQg
dG8gdGhlCj4+IEdFTkVSSUMgUE0gRE9NQUlOIFBST1ZJREVSUyBzdWJzeXN0ZW0uCj4+Cj4+IEkn
bGwgdGFrZSB0aGUgRFQgcGF0Y2ggc2luY2UgYmluZGluZ3MgcGF0Y2ggd2FzIHJldmlld2VkLgo+
IAo+IEluIGZhY3QgSSdsbCBuZWVkIFVsZiB0byBwcm92aWRlIG1lIGFuIGltbXV0YWJsZSBicmFu
Y2ggb3IgdGFnIHdpdGgKPiB0aGUgYmluZGluZ3MgaW4gb3JkZXIgZm9yIG1lIHRvIGFwcGx5IHRo
ZSBEVCBwYXRjaC4KPiAKV2lsbCByZXMtc2VuZC4KPiBOZWlsCj4gCj4+Cj4+IFRoYW5rcywKPj4g
TmVpbAo+Pgo+Pj4KPj4+IENoYW5nZXMgU2luY2UgdjI6Cj4+PiDCoCAtTW9kaWZ5IHN1YmplY3Qu
Cj4+PiDCoCAtRGVmaW5lIFBXUkNfTk9fUEFSRU5UIFVJTlRfTUFYCj4+PiDCoCAtUmVtb3ZlIG1v
ZGlmaWNhdGlvbiB0aGF0IHRyYW5zZm9ybSBpc19vZmYgaW50byAxIG9yIDAgdXNpbmcgISEKPj4+
Cj4+PiBDaGFuZ2VzIFNpbmNlIHYxOgo+Pj4gwqAgLUZpeCBsaWNlbnNlIGZyb20gIkdQTC0yLjAt
b25seSBPUiAuKiIgdG8gIkdQTC0yLjAtb25seSBPUiBNSVQiLgo+Pj4gwqAgLU1vZGlmeSBUN19O
SUMgZmxhZ8KgICJBTFdBWVNfT04iCj4+Pgo+Pj4geGlhbndlaS56aGFvICg2KToKPj4+IMKgwqAg
Z2VucGQ6IGFtbG9naWM6IG1vZGlmeSBzb21lIHBvd2VyIGRvbWFpbnMgcHJvcGVydHkKPj4+IMKg
wqAgZ2VucGQ6IGFtbG9naWM6IGFkZCBkcml2ZXIgdG8gc3VwcG9ydCBwb3dlciBwYXJlbnQgbm9k
ZQo+Pj4gwqDCoCBnZW5wZDogYW1sb2dpYzogaW5pdCBwb3dlciBkb21haW4gc3RhdGUKPj4+IMKg
wqAgZHQtYmluZGluZ3M6IHBvd2VyOiBhZGQgQW1sb2dpYyBUNyBwb3dlciBkb21haW5zCj4+PiDC
oMKgIGdlbnBkOiBhbWxvZ2ljOiBBZGQgc3VwcG9ydCBmb3IgVDcgcG93ZXIgZG9tYWlucyBjb250
cm9sbGVyCj4+PiDCoMKgIGFybTY0OiBkdHM6IGFtbG9naWM6IHQ3OiBhZGQgcG93ZXIgZG9tYWlu
IGNvbnRyb2xsZXIgbm9kZQo+Pj4KPj4+IMKgIC4uLi9wb3dlci9hbWxvZ2ljLG1lc29uLXNlYy1w
d3JjLnlhbWzCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDMgKy0KPj4+IMKgIGFyY2gvYXJtNjQvYm9v
dC9kdHMvYW1sb2dpYy9hbWxvZ2ljLXQ3LmR0c2nCoMKgIHzCoMKgIDYgKwo+Pj4gwqAgZHJpdmVy
cy9nZW5wZC9hbWxvZ2ljL21lc29uLXNlY3VyZS1wd3JjLmPCoMKgwqDCoCB8IDEyNyArKysrKysr
KysrKysrKysrLS0KPj4+IMKgIGluY2x1ZGUvZHQtYmluZGluZ3MvcG93ZXIvYW1sb2dpYyx0Ny1w
d3JjLmjCoMKgIHzCoCA2MyArKysrKysrKysKPj4+IMKgIDQgZmlsZXMgY2hhbmdlZCwgMTg1IGlu
c2VydGlvbnMoKyksIDE0IGRlbGV0aW9ucygtKQo+Pj4gwqAgY3JlYXRlIG1vZGUgMTAwNjQ0IGlu
Y2x1ZGUvZHQtYmluZGluZ3MvcG93ZXIvYW1sb2dpYyx0Ny1wd3JjLmgKPj4+Cj4+Pgo+Pj4gYmFz
ZS1jb21taXQ6IDQxM2Y1YzAyOTI5YmIzMzA0MmJiYzRlZTIzMzE2NjU1MGE1ZmNhNzAKPj4KPiAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFt
bG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
