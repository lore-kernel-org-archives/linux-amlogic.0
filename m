Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B89CCEB64DD
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 Jun 2023 09:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sNs14byciANvXuQbvAXYmNledK8BAmmQPSnsEHhl89o=; b=dJTyDgjPYCSFK07ouJSKXbNyea
	zYI3XVSAwv9H/KyYA+HkYXcPSpbuU11Hlia/i0WcHeKkxjmPDaPJQPLPxZC4NDNAxwlHumGiBF+Zr
	huTBtXzT48/iMPh0NLtzRNdkaa8yKrTSqz3jCuMsnQ56lUqc79FukdAiCwqcoPkPt9Ajg1bO2vLwD
	/K8LAnus9B8mIDTBnZy/jJ91eQR9OFImuuLR6S9tAwJfqzXbkLGRtkYhJZVf6mCRkH5sZvbwxrNc0
	pTDHmheRP2K1yLPsYOFFYPFtlntck+VF0WtgSicYPd189kwNfZlYBtcDx9xuQRuk3Xq8LPEjD0Qq2
	bfJ01V7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qE4bb-00CdVQ-2N;
	Tue, 27 Jun 2023 09:03:23 +0000
Received: from mail-tyzapc01on2072b.outbound.protection.outlook.com ([2a01:111:f403:704b::72b] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qE4bW-00CdUP-1E;
	Tue, 27 Jun 2023 09:03:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b5Ta/SVxfVHuktLAOrWHo15vSLnxMlIkor5tYTyLeWZb/72tPG5a0cOJyyUZojFDM6WjSVoIfp846JR4Q4e/oZvUk+3ph0/2Pd5aZCAkp4Ik5aPEJbinCNcjyJ0ALtASNS8lpTRxE5zr3nJOUunBVBaALecAjURvXSmxBlJ7UOu/9XxIMIRXd7DoTTRyhoXFvA7DjIjzqLrPdZ5le0D7vDMRjGlHbiJIvoAjDTrp+eo1Phv45D5wC4w2tPizfrpDDyMQ/6hNU+jJi3WgHLw8ErbNLT09a0XdAFB2IvZfvICFb0LO766z2yrU33XiVPXq3+FFB1c6bvV40UmPhZgUhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oe+DX559Lvj9hJld1PPKWW1PUGNt89CYhAKnvZmA6vU=;
 b=e5cEmdXaVwaD64+YZbpmO7zWPp07AMrojMVhJYLg/Hbr9JEBxcXPPRIXRE3ZDXNkZ6l4hGqXI62RpgcB322ZYpTnW9cOn5KH7Ugd1uwIOQzNWUFIPFiz9Z4cES50wzI4dDj3e+mM1S01Mg4bFJ9WFzMpQgJABK6KX+AxgrUYXG364m9jNXvoasH2fG0OZtEXOVTKkNzAUJswI8dzLROMR2qomQZWv+JdTS2IEXtCxdApadASAmhR5yYogmZLbscT5H5/SFstPGU+VzIQ9Hh9v4MVOcn27mr7K7eKT2PkPBfDeO2IkuX6hzcm4tIUM0/ipEdlSm6PnD1OxeDh0S1RBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oe+DX559Lvj9hJld1PPKWW1PUGNt89CYhAKnvZmA6vU=;
 b=G4Kfz2D0Je3rfdzzUvSHBp3nZxsSL0zVsOkYw5vV64k0JKFJEqwSWaSrEeYSri3dFzxF2f2QE08h7h92GekNMXulMIHyE4RBBSDcmjk7LD0a/AZkyVawuV8r08uhFV6ZeM6RQsWGTMPoVuRdW3x/LZ18PVB7gZ2/gr54BWUdDgJP9m4NhvmRDRUgv+y5RiuSXh04wTxc9LIfMUiK61sEeQoJJSSPCIXz7iPbRfXZzeZYvBdfM1QeMcrKqTl25mvKjcfpsEIAU+hcnLUDwM3WWFYp+arwE7+z7gWRFEf/sFTWghuLHYJGF+94dLCYCpGtPP+11yoaK6xRvUy8KxqThg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by SEZPR03MB7401.apcprd03.prod.outlook.com (2603:1096:101:124::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.36; Tue, 27 Jun
 2023 09:03:05 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::e659:543b:2ac9:8fd7]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::e659:543b:2ac9:8fd7%3]) with mapi id 15.20.6521.026; Tue, 27 Jun 2023
 09:03:05 +0000
Message-ID: <d33f35f2-d8ac-7b8d-6f23-e89cb8636109@amlogic.com>
Date: Tue, 27 Jun 2023 17:02:56 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/2] dt-bindings: arm: amlogic: add T7 based AN400
 bindings
Content-Language: en-US
To: Christian Hewitt <christianshewitt@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, LKML
 <linux-kernel@vger.kernel.org>, AML <linux-amlogic@lists.infradead.org>,
 devicetree <devicetree@vger.kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20230626095223.721011-1-xianwei.zhao@amlogic.com>
 <20230626095223.721011-2-xianwei.zhao@amlogic.com>
 <94551B90-19E8-49C7-90FC-FAFA5E5E2D9C@gmail.com>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <94551B90-19E8-49C7-90FC-FAFA5E5E2D9C@gmail.com>
X-ClientProxiedBy: SI1PR02CA0029.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::20) To TYZPR03MB6896.apcprd03.prod.outlook.com
 (2603:1096:400:289::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|SEZPR03MB7401:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bd986a5-4c16-4953-f274-08db76ed516a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zt+SLERtf8AS5QNfEz4rkasjps5CKxj5v366qJFZHOS/UJZvx5sKnNmqzNwZ5NMiZF4fnNtuwZhZhuhoSygU0Rf+aF/aao4cxSx7NI8rV5nIul3i1LdDY2co3x8Oc8Tz9nAwB76gzByuA0cbpW8uzvR2KSRUDVkZl3vnxOHphyyioPN64NLSvWMsHpEY6Z++UcFOAk+tQMl2CZvtSMj5gE04aRmpyG4ToWJpUG0bKV19QmXYold8ips0/d6E1lPhFMmb6hRkjlq6nrHe+7x6GRQWnibsuBsV7Bs6wYGmHlla5nmyJH/K1Y1UYzHcIRvc9O2vEDiK+4A93cJGtBvtvlfrH/pF5rixb3Qjk4pg9QgDxBA/JK1mGYOxOgKN48ydI55762jUX0KSnyePaffDvyOBlD5xKw6Nz3rNevkg/G93ycl+9eBzfebRjl0mWslEMRmDLwfOt6v7i3fCfYzK/8Vc6R1TBEECkwyGt+amIXCPQavK2KCJLJR0g82b7x5CNa++3KiJV8oz49nOxrX/DaQhQiKJWaIIxA/IYP1+FnojY2eSdXGd1WZfPZVWt8pqOx1sBluR/MdhvFK89zc1xybhlmu0u9EO5lv7/ZGsX+q2j4aP9jy/Z7n9CeIGipEsvkOZAc60oF8fYnW60xyw6p57wZlw3zyLxV28nOTpXwmcMAOcQc2upG802/5fwlDU
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(376002)(39850400004)(396003)(346002)(451199021)(2906002)(186003)(6486002)(38100700002)(2616005)(83380400001)(6666004)(6506007)(6512007)(53546011)(26005)(966005)(31696002)(41300700001)(54906003)(86362001)(316002)(478600001)(36756003)(66556008)(4326008)(66946007)(66476007)(6916009)(31686004)(44832011)(7416002)(5660300002)(8676002)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VitiSE1HZUR3bm8zQmUycUMyQlBaSzZKcWtGK1owVWpPRCs3Q2tWa1NMNkxs?=
 =?utf-8?B?NFZBM1hsZTh4ZXBQK0dPWjNaU1RzRGhrOStpbXdHdDZNRm9Ma05yVXorMmtE?=
 =?utf-8?B?RXRvZnJSNjBrZEVWUlA3Q25uNzJzYjI3ZGNqY2QrNWUxQWliU0hpRStzSUpl?=
 =?utf-8?B?TkhzRTM4N3NEM0NONnBsNkRFc2pGWitoVHc4MHQyZUJwUjZuZng0Q0UyeFR0?=
 =?utf-8?B?TU00U1V5eE1idllrNVhTcGNDc2FUaUwrZ3BjS0V0WHBlNzZtT2ppYldJZmR5?=
 =?utf-8?B?cG8xaTIzdHlCS0pXL3Z2Z3JReUxRanA5LzNYTVF3cEtPT2tQL3U4V3IzcXhs?=
 =?utf-8?B?Njl5emZkTzY4cyt0K2ZpMEpRVmV5cFBXM0k3bU1CWGkxRThrOWFjS1doSlJF?=
 =?utf-8?B?b25FNkpnSU04Q0cwWU4rdzBIc3pSeWZrdGdpRzViRUlJRmZtTXhmbFdUWGlI?=
 =?utf-8?B?MDkya0hReFU0eHYreW5EZy9KWHFtdHBSaWdhT2VINHVMb2dpM2NCYWQ2Tm9n?=
 =?utf-8?B?TU1RYVFaY1hLRG42eHFneUs3SThCU1ZDODhRK3RHejFVKzF5aUZRbDBzSXFo?=
 =?utf-8?B?d0oweDladnF2RUNuMDI1TVRLWE1vUTBCa0xYUWpnZjJwZHlUZHQ4K0srYTNR?=
 =?utf-8?B?TG5VdWJyeGJEMEg2OGhPMTBSUzJXNjJ1K0hBUGZTWDhRMlNuWG9QVW90REQ1?=
 =?utf-8?B?cWE4M3ZWMGpSQXFzaWJHYXp0ZCtsYjBLZ3MxQUhrSVBvWU5qS05va1FCaGlU?=
 =?utf-8?B?NDRkci85Z3lyRWVLTEZpVlg0bFFTWWVzWmlLZlNqYklTL2NqdDF4R0xjSzlN?=
 =?utf-8?B?TVNNMUZRWG9TU1hGbEtld0RYVGN4MG45QWV2d1Q0djZyUVBwaVdSVWR5NXVy?=
 =?utf-8?B?OXpNSlFGUjMxV3VxYUM2Nm1BUCtxWm8wbkdiSzN1YWlsSUZGQ1JTZHBScVpH?=
 =?utf-8?B?OHc2RHN4YXdUSkpwSkRwYXhJRUZ3VHpRbUduc2RVSmxGVkhVY2xVTTJidHZj?=
 =?utf-8?B?Sy9RMVRsR2RidERFTC9CTnpUQzJONmYySk03Smp0dlMxaHhHZEI1ck1Qalo0?=
 =?utf-8?B?QzRLTFdNRlEwdTE5NXVIQ3BESTZrTCtIbDl1YjRBMHB4Z1BtM1hRS3lGRUdX?=
 =?utf-8?B?bkh6OURaQWNXYnh2TlFudHA5bUpDRVhodVpvclloS0ZleWFlbDRBS1YwVHJF?=
 =?utf-8?B?cGdCTEJjazlrK2NlckprMTFnZXllbmFuSittOS9Lb2dHQ2owbVVKbWpYS2tj?=
 =?utf-8?B?Q3d5QlRQQXdMMzdabjJwSTNLbnJUeGxHQUp4dmUwakh5K29VOFJQcUFxUkJL?=
 =?utf-8?B?MWdhWENidHJuMWhDdy9nTThLODJXUkxvQUtMNEcvdUZ4Q01HVjlCamc2WjIx?=
 =?utf-8?B?bW8zSHFKRFc1VHgvU1pUblAyOTErSmUySTVGd0hHSUZGdUcxM2ZHYkhXUW9Y?=
 =?utf-8?B?dTdsaG9EYVJjS3ZzRmc3NGZ2VGFjTU9DSmd2S1BQMlpydjBkbDZDRHV6ZUFx?=
 =?utf-8?B?c3U4N0xHM3ZkZmJZVnBsOUNLbzVxOVdES3krWXFNWk5uUEl1blc3Njh4M3ky?=
 =?utf-8?B?UWRzWEpPelVrcS85U2ZBNHUvWER2OFNLaXBkYTYvc1dVY05pUCtWVHJibHF4?=
 =?utf-8?B?b1daM1NCeUZTelRPUkJ2U01NYVEwcUg5UjBlS3J5QXJyMTFzRndYQloyMzMv?=
 =?utf-8?B?Rjh3M25ITFRqbkFlSmJQODRJckFjY2V0dzhycC9JeDdOdGhsSVRQa3RFbkFM?=
 =?utf-8?B?KzdPMkZQMVJ1bW5oRkVNMFpsdHV4YUZ6Uy94NHV3L3BqVldVQkNTelJyZDZH?=
 =?utf-8?B?dHM3dkR2YklrZlJ5SkJTRklrd0tKZmp5Sit4OWcwOWdlMnVBNmEvTXpvT1FS?=
 =?utf-8?B?V3BlTDRxUkJVVHExTDhMR3o3SzM0NkVLaGk1TExLZi9tR3BqVis4R1F3RCsw?=
 =?utf-8?B?TlFGYjNNTFFRWTlXUjhTZGw5UlMwTUNLQTRlLy9ZcVpORnd2MXdQbWE3SGNL?=
 =?utf-8?B?Wkx6T3dlUkhRT1JFcUxTeERsR0swbW1DUCs4aWxDTkVIQTZLS2dIK1B1MVZS?=
 =?utf-8?B?T2FvdFgxTEt1S2IyR0JqbEt5NTRDT1hqVEViV09nUjhyYkFEeGVCWWp3MzBy?=
 =?utf-8?B?b2wxMFpYempLUVFHRGVodTZZUy9mZmVsVTdMenBrMnl1eklXemRMVGhpMDVM?=
 =?utf-8?B?d3c9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bd986a5-4c16-4953-f274-08db76ed516a
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2023 09:03:05.0446
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A8c9GjSxsVBRDZ83ogArxIPcuBGl7Ft6U+ErX2v2cqSKoEQnC0cQXIj7IlXRnKgCCJxnGsBBhIobMnE/oLXrWFFDhTW4FPd+7TUVgfUPYMo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7401
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230627_020318_508098_00BE9BC9 
X-CRM114-Status: GOOD (  17.26  )
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

SGkgQ2hyaXN0aWFuLAogICAgICAgVGhhbmtzIGZvciB5b3VyIGFkdmljZS4KCk9uIDIwMjMvNi8y
NyAxNjo1NiwgQ2hyaXN0aWFuIEhld2l0dCB3cm90ZToKPiBb5L2g6YCa5bi45LiN5Lya5pS25Yiw
5p2l6IeqIGNocmlzdGlhbnNoZXdpdHRAZ21haWwuY29tIOeahOeUteWtkOmCruS7tuOAguivt+iu
v+mXriBodHRwczovL2FrYS5tcy9MZWFybkFib3V0U2VuZGVySWRlbnRpZmljYXRpb27vvIzku6Xk
uobop6Pov5nkuIDngrnkuLrku4DkuYjlvojph43opoFdCj4gCj4gWyBFWFRFUk5BTCBFTUFJTCBd
Cj4gCj4+IE9uIDI2IEp1biAyMDIzLCBhdCAxOjUyIHBtLCBYaWFud2VpIFpoYW8gPHhpYW53ZWku
emhhb0BhbWxvZ2ljLmNvbT4gd3JvdGU6Cj4+Cj4+IERvY3VtZW50IHRoZSBuZXcgVDcgU29DL2Jv
YXJkIGRldmljZSB0cmVlIGJpbmRpbmdzLgo+Pgo+PiBUNyBpcyBhbiBhZHZhbmNlZCBhcHBsaWNh
dGlvbiBwcm9jZXNzb3IgZGVzaWduZWQgZm9yIHNtYXJ0IGRpc3BsYXkuCj4+IEl0IGludGVncmF0
ZXMgYSBwb3dlcmZ1bCBDUFUvR1BVIHN1YnN5c3RlbSwgYSBzZWN1cmVkIDhLIHZpZGVvCj4+IENP
REVDIGVuZ2luZSB3aXRoIGFsbCBtYWpvciBwZXJpcGhlcmFscy4KPiAKPiBeIHBsZWFzZSBhdm9p
ZCBtYXJrZXRpbmcgdGV4dCBpbiBjb21taXQgbWVzc2FnZXMgKGFuZCBzYW1lIGZvciB0aGUKPiBv
dGhlciBjb21taXRzIGluIHRoaXMgc2VyaWVzKS4KPiAKV2lsbCBkbwo+PiBUaGUgbWFpbiBzeXN0
ZW0gQ1BVIGlzIGJhc2VkIG9uIEJpZy5MSVRUTEUgYXJjaGl0ZWN0dXJlLAo+PiB3aXRoIHF1YWQg
Y29yZSBDb3J0ZXgtQTczIGNsdXN0ZXIgYW5kIHF1YWQgY29yZSBDb3J0ZXgtQTUzIGNsdXN0ZXIu
Cj4gCj4g4oCcVDcgaXMgYW4gQW1sb2dpYyBTb0MgZm9yIHNtYXJ0IGRpc3BsYXkgYXBwbGljYXRp
b25zLiBUaGUgbWFpbiBDUFUgaXMKPiBiYXNlZCBvbiBhIGJpZy5MSVRUTEUgYXJjaGl0ZWN0dXJl
IHdpdGggYSBxdWFkLWNvcmUgQTczIGNsdXN0ZXIgYW5kCj4gcXVhZC1jb3JlIEE1MyBjbHVzdGVy
LuKAnQo+IApXaWxsIGRvCj4gQ2hyaXN0aWFuCj4gCj4+IFNpZ25lZC1vZmYtYnk6IFhpYW53ZWkg
WmhhbyA8eGlhbndlaS56aGFvQGFtbG9naWMuY29tPgo+PiAtLS0KPj4gRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9hbWxvZ2ljLnlhbWwgfCA2ICsrKysrKwo+PiAxIGZpbGUg
Y2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvYXJtL2FtbG9naWMueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9hcm0vYW1sb2dpYy55YW1sCj4+IGluZGV4IDA4ZDU5ODQyNjU1Yy4u
NzlhOGI0NGZmZDAzIDEwMDY0NAo+PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvYXJtL2FtbG9naWMueWFtbAo+PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvYXJtL2FtbG9naWMueWFtbAo+PiBAQCAtMjE4LDYgKzIxOCwxMiBAQCBwcm9wZXJ0
aWVzOgo+PiAgICAgICAgICAgICAgICAtIGFtbG9naWMsYXEyMjIKPj4gICAgICAgICAgICAtIGNv
bnN0OiBhbWxvZ2ljLHM0Cj4+Cj4+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBCb2FyZHMgd2l0aCB0
aGUgQW1sb2dpYyBUNyBBMzExRDIgU29DCj4+ICsgICAgICAgIGl0ZW1zOgo+PiArICAgICAgICAg
IC0gZW51bToKPj4gKyAgICAgICAgICAgICAgLSBhbWxvZ2ljLGFuNDAwCj4+ICsgICAgICAgICAg
LSBjb25zdDogYW1sb2dpYyx0Nwo+PiArCj4+IGFkZGl0aW9uYWxQcm9wZXJ0aWVzOiB0cnVlCj4+
Cj4+IC4uLgo+PiAtLQo+PiAyLjM3LjEKPj4KPj4KPj4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KPj4gbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKPj4g
bGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCj4+IGh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo+IAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxp
c3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
