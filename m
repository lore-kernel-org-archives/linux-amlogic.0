Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A40FEC77B61
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Apr 2023 09:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZOumOHmOVurXeupz37UfiRUhAlBKcWu/UFkNCRVaTV4=; b=EVDSwY0jRIXOQh63TA5q6I/9eg
	Hg/QtdMG8LBcX2+Lde5bdR1nCqAhjXDKSQ1hI+sYsx2f9Ai/p9HouEIUnKzZD5k1rQn7hbTCnyZQ8
	OsOfT99DF7kaICi8o514rUs0uL3dehRdRDKg6seXmdObJ3o0pL/1c84wYYG8EKwMncPvOkts9HHnE
	PY8Oy3zV42uzGgLO5Aa7JLdLX/T0Xfz6cXj8vftUCTCMDNuuiKayN7os/D+fwGYEMf+looXXpRHus
	bQcFQAs7QHFyylmqXUNxI/R8zZjPLyP2ki7DUdYzGheEdnUmnCbA++zYwz3+gOUNUQf0uNori/WP7
	V30gbUvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prxsf-005zCg-1c;
	Thu, 27 Apr 2023 09:25:37 +0000
Received: from mail-psaapc01on20710.outbound.protection.outlook.com ([2a01:111:f400:feae::710] helo=APC01-PSA-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prxsb-005z9q-0b;
	Thu, 27 Apr 2023 09:25:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B7L6nW9Z1S3QUcKw3RUXcBHtANhrECPPDUj3PEC4n211cBXllPN/gSEMLhc8pGayK2EwfJGzxNA6de+xinPtj/I1KoI2tKzUni928Tm1HuqdLOiGIU3tKrOTPgkKowmmtR1Gn01a1nlpAnxLz7KI/3wtOi21SVtwDVwlYL9TmtPKiA0VXGI6pBYnQUOOwdHJillL1hlSG9JC9iBnC8FmiuvxBN5jFvlmdZPO8Gyh2HkpnKYDoj6gcQHYWw1R1IwdTzKbCEJOKDl3yfWcf/ycG+9tO5c9vCPAr5uJbG1bN11FZW0/6AJT5JWyJlJafNmG+yNOj+p4QysMU+tebk9nng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d8U8GJuL1xrZ+0HLBOt0VQxZr3xHR9RQDkj0LbUgmcA=;
 b=gVVZWnlMugA+Oboc94dNJ1xrpyyqJDXKMPN/NfIT4YPqPYurcoPOv2cB7K6lhI7okE/02Y29FLnB3QTvu01dm6U0kpvD8JHAMxXy7ifvc4Zl9QPf37CHIfBXyb29zg5C/UlWQgY7mtPtupszCXo4ZfYLlRwsWuriRhWgB07wtB5gH/hsAy/uizol+v5px3+P9rbtHA6LkLNrIYTmYzs9XqOcisfpVu+TWnx675HSzdKS/rqyI8tt+mQYMWUXgyHJa7WPxibJ+CDAHeTt6o/nYg4hgO2rjl3UWKUf1qhpwNJbzTvprBsjkDj5fnJPw3sHnKNL5evlVxvsxYqUBEn85w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d8U8GJuL1xrZ+0HLBOt0VQxZr3xHR9RQDkj0LbUgmcA=;
 b=Vwn/Y8veoGFf8nSQUi34viT7GnV6im63+sbOTmWl5QzOEi1rbm62KJt3V8ExGGDi9Zo8ExpkKrCG7xi4peKPrhNQdCFN3ZH6L8nhLuEV0tpWxs3ktFP0umvJj9E0LHlREow3f75LHBd+Mu18E4Y2sKBdjldTBHUXEa6z65XP4wqEjFetxFokbuud3XvxuVyZmYEG+TB8AjfeJZskYEtR+J0AA3IUQsZXJzVDmtW3S5Gn9rBDPIYk2T9KEje6JyT9zauy7MjFhK4PiLTwqML0pS/L4fgOoAq2zat6UrQjx7JFsc63W7l8FlcBfAI7NWZglk8lKC9za3c9115WDZqpqg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from SG2PR03MB2734.apcprd03.prod.outlook.com (2603:1096:3:21::22) by
 KL1PR0302MB5361.apcprd03.prod.outlook.com (2603:1096:820:48::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.22; Thu, 27 Apr
 2023 09:25:25 +0000
Received: from SG2PR03MB2734.apcprd03.prod.outlook.com
 ([fe80::9c6d:3128:b370:5fb4]) by SG2PR03MB2734.apcprd03.prod.outlook.com
 ([fe80::9c6d:3128:b370:5fb4%3]) with mapi id 15.20.6340.021; Thu, 27 Apr 2023
 09:25:25 +0000
Message-ID: <8cbc82f0-1ebe-b664-5d8f-98f1edff5842@amlogic.com>
Date: Thu, 27 Apr 2023 17:25:16 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [RFC PATCH 2/2] arm64: dts: add support for C3 based Amlogic
 AW409
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230419073834.972273-1-xianwei.zhao@amlogic.com>
 <20230419073834.972273-3-xianwei.zhao@amlogic.com>
 <4e6469e5-0f6c-4150-4709-7459597f06cc@linaro.org>
From: "xianwei.zhao" <xianwei.zhao@amlogic.com>
In-Reply-To: <4e6469e5-0f6c-4150-4709-7459597f06cc@linaro.org>
X-ClientProxiedBy: TYAPR01CA0114.jpnprd01.prod.outlook.com
 (2603:1096:404:2a::30) To SG2PR03MB2734.apcprd03.prod.outlook.com
 (2603:1096:3:21::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PR03MB2734:EE_|KL1PR0302MB5361:EE_
X-MS-Office365-Filtering-Correlation-Id: 28787a74-de41-4695-59be-08db470153cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	oMMXWHK5HFd/ckBnDuENtDZaIp9rv+Q2/vAiGOR0q2p7IfwpdyDzy58KY2gYzGfbEp8vajySyW+JG3dEjV/IJT9Yasz4Kge9ujYe27Q9CGdnf9BBVUsNoen5ODNzYYTAgxT8L70QnE0D494PQ0Hi5f474vRCHAwvDbNf+N1tLyn4aZI+8McytfT1lEW+J3hnA2corg1UvPXPD35kvSdjXbsQtZ8SzbJ7udDDJV50ejDUr2X2UD1+RL9YiG2jjjm3I36VcZn01M3CM8ItbhbUBT++Z2xrlNhSWbEiPhx72rFHHdcmlLNbIXeZ1n+CjhbMOlgcm8VMOm52LC1aaiMcyJuIUDwj2SCYTlzE5lONeLFgCWJ924Frms/+GNbbQJMaB1132rok2DUbfhhwGJJPIDCV9DeuBy/m96zr0zA4XNPTYmGg34Rp8HAPWKMsY+Q8uljCbzzRsEbsALic8X4tX0UDC3T2O+n7x/kPff5McrfkLEqfZEBxdPnkgdbgUQUD/Ki9pM1Y1G4qxQkqkptAqCxIZBTD7kd+x5Zot+aybfnJM63YfJgB0bwnBO0fu8TDpIKcWmJaYts1GNlcoUqoOULlXVAQn8b8mA6TGUrnhPKD6SPJ0hOTKUFZB/mYN9VJjXddOFbMvgJdlULeP84vpQ==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PR03MB2734.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(346002)(136003)(366004)(39850400004)(376002)(451199021)(31686004)(26005)(6506007)(6512007)(38100700002)(6486002)(966005)(66476007)(31696002)(41300700001)(4326008)(66556008)(66946007)(86362001)(6666004)(54906003)(478600001)(36756003)(316002)(83380400001)(2616005)(53546011)(186003)(8936002)(5660300002)(8676002)(2906002)(7416002)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?U0xtVzRBZFRqajYwczhaYVVQK2ZSMVNLakxvVE40VWRRL0x2OHFMTWFZeVQ4?=
 =?utf-8?B?aThXcHZ3b3FxVHFZSm93U3BGa3NiczQxbVF3Ymx1a05hMkVSR0NqdmVmOFow?=
 =?utf-8?B?bkZPaUtjbkdoejJBUzlubjlFbk5QK1JrZWFScDBNT0hSaTFBQXRrNXlscFZJ?=
 =?utf-8?B?bDJDZ3BPbVc1YjBYSWVLbnR5aXZ1OHFnTmVXSEhwQmlEN09NQmI4ekpRYnZ3?=
 =?utf-8?B?aW1aWmIzV0g5eHRNTVA1cVZkQlkxdXdJcmVTNlVzV0Q3MFFGenY4bTRRM1BQ?=
 =?utf-8?B?dHJ2VkRmeWpIcVJFdlcxZWRoWGtJL1krVWYwa0JmcFFBNldhaTFsakJRTktG?=
 =?utf-8?B?VEdvQTdTM1kwSTl2ZEhsV2YrdnQwaHZTRzJHWmNXeG9BVHJnTFdHTlRsb1c1?=
 =?utf-8?B?Q0JYOWQ5T3QyaVYvVEdObUI2eis4ejlZV3pUTDQ5T1RINmRKN0ljUndmVk9x?=
 =?utf-8?B?V3ZPRHVHem5pc2Q0bWhhcGoxTjJzYUVEQXpZTloyWlRyZ0p1dHMrd29Vanpy?=
 =?utf-8?B?dWhhNDV3WXFONG1IWGROTUNZN0hqWUxkVGd0ZkJROU5rRDRMY2lnS3ZaK09r?=
 =?utf-8?B?Vkt4Njl2Z3VORFgvN21yQThSeUJSQ2xMVVl0SWF0Vk5jQm9pZzVIeWUrdFFm?=
 =?utf-8?B?SjlCRFd2ek4zOVlxM1V3VEtqQVNmdkVYa09xbXBXVExWTWVKUUNUamlNYVFa?=
 =?utf-8?B?SU5mQVg3UVlVNEVOR05ZWGpxVVRQNzNsaG5rTDNnaXNZYVNBY3hVaFVmSVNC?=
 =?utf-8?B?U2puL1NaQjIrZDhkN3NJc09ubGNzNjNzbXFmNU41ZEVTbTh5dUxxWHNaTmF5?=
 =?utf-8?B?L002L2xVNnEveWl1aG5xQmYzYm5jZ1ZUajIyZXM5MEFzeEVYSURTeThwakI3?=
 =?utf-8?B?a2tKS0Q3K3JZNWdmeXowcUovdytEcDhLZjl2OHlIVzhzM2VBcHUyNTRleG5Y?=
 =?utf-8?B?RjFTUmZsSENyOU91QmRFbkZmYzJwclZWN2RMQWV3R1krbDFLNFp3ajNrTTB2?=
 =?utf-8?B?eFBNbGhyQ3JSNzltR1VkSHpZNGlJTG5FSGQ4TTV5bW4vMzdWclFEK3JiT3Nq?=
 =?utf-8?B?dDczcmNnZ0l1Z01kaEhqVFJ1NkRjRjAwaWQ1bGoyVzJwYThFa0MraEFqaExE?=
 =?utf-8?B?NzFEV0Q1dkhVNnFzSkI0NWNQTHlmcVdDSCt5MzQ4RFpjczB5a0l0Zkx4dzFV?=
 =?utf-8?B?UkFNTWFkc1VYY281UDY1ajhvK3VlQ1ZNem0yQS8rby8wSVNraUVkWFQxVVpx?=
 =?utf-8?B?Rm1JYzNWRlp6b2tFRGlUS1h6RHRvb0lTVXRXclp4bktaV2lseTVKUUdJcDJL?=
 =?utf-8?B?bEdWUEZpRXdmakRTNFRSNHh0VVdVN1daL21Yb2Jaek5OOGQ1U0M3ZDV3bzY4?=
 =?utf-8?B?MWxqZzN5Y0hjNC83dk1rWUxqQ3B5aW5lTnRDK3pnVVEzUGxzME5mY1hqOFJw?=
 =?utf-8?B?NWdWc0MzZVlMMnZGc2JGOXRocnQ0bm5BNFYxaVd2cUdPYzJhZnNlLzdCS01r?=
 =?utf-8?B?cjkvU0JxUDJTRTRyRjZMRUtZbHloMWprWE10d0t6WHlFUDNQaUk1a0ZhRldp?=
 =?utf-8?B?ZnkzY3pOc1l0MFVxeDRseFpwNk1NNVVDMjdyV3cwV3NuOC9tZHMxYU9HQVJH?=
 =?utf-8?B?R2ZDaVBmNjdPYk5OdkRmUUx1NTZCZDFlTy9pL1VCeEFTc1RNdVhZMllZWHR0?=
 =?utf-8?B?d3dFY0ppNEJoL3FiT29xVEhZeDh2dkNUUlkwS0NRaTMrbGliUkhtbXpSMFYz?=
 =?utf-8?B?c0NiTHRsWnk4bVNZRkt2WDFwbnBSQi9DYjZ4Mm1XSnl1REpxZ0IwUHZaZjk0?=
 =?utf-8?B?dFNUQkFEc05ndVF3QU00eEtEcERuYzVjcFJUdTdRQ1VDS1JFM2Rzby9remJC?=
 =?utf-8?B?MmRoRlFTMTJGVHdlSGpwd296UEJ4NDdNV1hNR1hOOGk0MXdrUGdNWlVZRWkw?=
 =?utf-8?B?U29pVEtZOFpUOFQ3cVpUdnB3bkZ5N1hyUUxTZ3piOE1JT3BIaEpaZi9BbEF3?=
 =?utf-8?B?aHdibzNiMGRhVnBiVEtIaklaZVhBcWJEcTY3N2RPSUFiNEF0L05lRjArWDc3?=
 =?utf-8?B?MU0vZ1FmdnpDS0lLUFVRWDJjZkozYWZZZlp3TUVKRDdWSUNvc0VyYlBqYU04?=
 =?utf-8?B?bEdnYzQwRzMxUGMxbGovWC9hWjJaT0RMV3BGVlNBU2JTNTlrTmJSR3ozYXY3?=
 =?utf-8?B?aGc9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28787a74-de41-4695-59be-08db470153cd
X-MS-Exchange-CrossTenant-AuthSource: SG2PR03MB2734.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2023 09:25:24.2783
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: opfjO0jKUk+9+1KlmzKsdvlwwT5i2TjPCXqhhKBhwJnLK55q9ML/dpqEKkdskatMISdXeASbeEdlZj0gEjwDhk1C4on5ny6VInFZFUnDuPQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0302MB5361
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230427_022533_352393_94191D51 
X-CRM114-Status: GOOD (  21.87  )
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

SGkgS3J6eXN6dG9mLAogICAgICAgICAgICAgVGhhbmsgeW91IGZvciB5b3VyIHJlcGx5LgoKT24g
MjAyMy80LzE5IDE1OjQ4LCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOgo+IFvkvaDpgJrluLjk
uI3kvJrmlLbliLDmnaXoh6oga3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnIOeahOeUteWt
kOmCruS7tuOAguivt+iuv+mXriBodHRwczovL2FrYS5tcy9MZWFybkFib3V0U2VuZGVySWRlbnRp
ZmljYXRpb27vvIzku6Xkuobop6Pov5nkuIDngrnkuLrku4DkuYjlvojph43opoFdCj4gCj4gWyBF
WFRFUk5BTCBFTUFJTCBdCj4gCj4gT24gMTkvMDQvMjAyMyAwOTozOCwgPVhpYW53ZWkgWmhhbyB3
cm90ZToKPj4gRnJvbTogWGlhbndlaSBaaGFvIDx4aWFud2VpLnpoYW9AYW1sb2dpYy5jb20+Cj4+
Cj4+IEFtbG9naWMgQzMgaXMgYW4gYWR2YW5jZWQgZWRnZSBBSSBwcm9jZXNzb3IgZGVzaWduZWQg
Zm9yIHNtYXJ0IElQIGNhbWVyYQo+PiBhcHBsaWNhdGlvbnMuCj4+Cj4+IEFkZCBiYXNpYyBzdXBw
b3J0IGZvciB0aGUgQzMgYmFzZWQgQW1sb2dpYyBBVzQwOSBib2FyZCwgd2hpY2ggZGVzY3JpYmVz
Cj4+IHRoZSBmb2xsb3dpbmcgY29tcG9uZW50czogQ1BVLCBHSUMsIElSUSwgVGltZXIsIFVBUlQu
IEl0J3MgY2FwYWJsZSBvZgo+PiBib290aW5nIHVwIGludG8gdGhlIHNlcmlhbCBjb25zb2xlLgo+
Pgo+PiBTaWduZWQtb2ZmLWJ5OiBYaWFud2VpIFpoYW8gPHhpYW53ZWkuemhhb0BhbWxvZ2ljLmNv
bT4KPj4gLS0tCj4+ICAgYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL01ha2VmaWxlICAgICAg
ICAgIHwgIDEgKwo+PiAgIC4uLi9hbWxvZ2ljL2FtbG9naWMtYzMtYzMwMngtYXc0MDktMjU2bS5k
dHMgICB8IDMwICsrKysrKysKPj4gICBhcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvYW1sb2dp
Yy1jMy5kdHNpICAgfCA4NyArKysrKysrKysrKysrKysrKysrCj4+ICAgMyBmaWxlcyBjaGFuZ2Vk
LCAxMTggaW5zZXJ0aW9ucygrKQo+PiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL2FybTY0L2Jv
b3QvZHRzL2FtbG9naWMvYW1sb2dpYy1jMy1jMzAyeC1hdzQwOS0yNTZtLmR0cwo+PiAgIGNyZWF0
ZSBtb2RlIDEwMDY0NCBhcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvYW1sb2dpYy1jMy5kdHNp
Cj4+Cj4+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvTWFrZWZpbGUg
Yi9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvTWFrZWZpbGUKPj4gaW5kZXggY2QxYzViMDQ4
OTBhLi5kMmI1ZDBkNzUwYmMgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1s
b2dpYy9NYWtlZmlsZQo+PiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvTWFrZWZp
bGUKPj4gQEAgLTc0LDMgKzc0LDQgQEAgZHRiLSQoQ09ORklHX0FSQ0hfTUVTT04pICs9IG1lc29u
LXNtMS1vZHJvaWQtaGM0LmR0Ygo+PiAgIGR0Yi0kKENPTkZJR19BUkNIX01FU09OKSArPSBtZXNv
bi1zbTEtc2VpNjEwLmR0Ygo+PiAgIGR0Yi0kKENPTkZJR19BUkNIX01FU09OKSArPSBtZXNvbi1z
bTEteDk2LWFpci1nYml0LmR0Ygo+PiAgIGR0Yi0kKENPTkZJR19BUkNIX01FU09OKSArPSBtZXNv
bi1zbTEteDk2LWFpci5kdGIKPj4gK2R0Yi0kKENPTkZJR19BUkNIX0FNTElQQykgKz0gYW1sb2dp
Yy1jMy1jMzAyeC1hdzQwOS0yNTZtLmR0Ygo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290
L2R0cy9hbWxvZ2ljL2FtbG9naWMtYzMtYzMwMngtYXc0MDktMjU2bS5kdHMgYi9hcmNoL2FybTY0
L2Jvb3QvZHRzL2FtbG9naWMvYW1sb2dpYy1jMy1jMzAyeC1hdzQwOS0yNTZtLmR0cwo+PiBuZXcg
ZmlsZSBtb2RlIDEwMDY0NAo+PiBpbmRleCAwMDAwMDAwMDAwMDAuLjM4Y2E5OGEzMjE4MQo+PiAt
LS0gL2Rldi9udWxsCj4+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9hbWxvZ2lj
LWMzLWMzMDJ4LWF3NDA5LTI1Nm0uZHRzCj4+IEBAIC0wLDAgKzEsMzAgQEAKPj4gKy8vIFNQRFgt
TGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMCsgT1IgTUlUKQo+PiArLyoKPj4gKyAqIENvcHly
aWdodCAoYykgMjAyMSBBbWxvZ2ljLCBJbmMuIEFsbCByaWdodHMgcmVzZXJ2ZWQuCj4+ICsgKi8K
Pj4gKwo+PiArL2R0cy12MS87Cj4+ICsKPj4gKyNpbmNsdWRlICJhbWxvZ2ljLWMzLmR0c2kiCj4+
ICsKPj4gKy8gewo+PiArICAgICBtb2RlbCA9ICJBbWxvZ2ljIEMzMDIgYXc0MDkgRGV2ZWxvcG1l
bnQgQm9hcmQiOwo+PiArICAgICBjb21wYXRpYmxlID0gImFtbG9naWMsYXc0MDkiLCAiYW1sb2dp
YyxjMyI7Cj4gCj4gVW5kb2N1bWVudGVkIGNvbXBhdGlibGVzLiBSdW4gY2hlY2twYXRjaCBhbmQg
Zml4IGFsbCB3YXJuaW5ncy4gQW55d2F5LCBJCj4gYW0gbm90IHN1cmUgdGhpcyB3YXJyYW50cyBz
ZXBhcmF0ZSBhcmNoaXRlY3R1cmUuIElzbid0IEMzIHN0YW5kYXJkIE1lc29uCj4gU29DPwo+IApU
aGUgcGF0Y2ggcmVsYXRlZCB0byBiaW5kaW5ncyBpcyBjb21taXR0ZWQsIHNlZTogCmh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2FsbC8yMDIzMDQwNzEwMjcwNC4xMDU1MTUyLTEta2VsdmluLnpoYW5n
QGFtbG9naWMuY29tLwo+PiArICAgICBpbnRlcnJ1cHQtcGFyZW50ID0gPCZnaWM+Owo+PiArICAg
ICAjYWRkcmVzcy1jZWxscyA9IDwyPjsKPj4gKyAgICAgI3NpemUtY2VsbHMgPSA8Mj47Cj4+ICsK
Pj4gKyAgICAgYWxpYXNlcyB7Cj4+ICsgICAgICAgICAgICAgc2VyaWFsMCA9ICZ1YXJ0X0I7Cj4+
ICsgICAgIH07Cj4+ICsKPj4gKyAgICAgbWVtb3J5QDAgewo+PiArICAgICAgICAgICAgIGRldmlj
ZV90eXBlID0gIm1lbW9yeSI7Cj4+ICsgICAgICAgICAgICAgcmVnID0gPDB4MCAweDAgMHgwIDB4
MTAwMDAwMDA+Owo+PiArICAgICB9Owo+PiArCj4gCj4gRHJvcCBzdHJheSBibGFuayBsaW5lcy4K
PiAKd2lsbCBkbwo+PiArfTsKPj4gKwo+PiArJnVhcnRfQiB7Cj4+ICsgICAgIHN0YXR1cyA9ICJv
a2F5IjsKPj4gK307Cj4+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMv
YW1sb2dpYy1jMy5kdHNpIGIvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL2FtbG9naWMtYzMu
ZHRzaQo+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+PiBpbmRleCAwMDAwMDAwMDAwMDAuLmM2OTA3
MmFjNTdmNQo+PiAtLS0gL2Rldi9udWxsCj4+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1s
b2dpYy9hbWxvZ2ljLWMzLmR0c2kKPj4gQEAgLTAsMCArMSw4NyBAQAo+PiArLy8gU1BEWC1MaWNl
bnNlLUlkZW50aWZpZXI6IChHUEwtMi4wKyBPUiBNSVQpCj4+ICsvKgo+PiArICogQ29weXJpZ2h0
IChjKSAyMDIxIEFtbG9naWMsIEluYy4gQWxsIHJpZ2h0cyByZXNlcnZlZC4KPj4gKyAqLwo+PiAr
Cj4+ICsjaW5jbHVkZSA8ZHQtYmluZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xsZXIvaXJxLmg+Cj4+
ICsjaW5jbHVkZSA8ZHQtYmluZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xsZXIvYXJtLWdpYy5oPgo+
PiArI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2dwaW8vZ3Bpby5oPgo+PiArCj4+ICsvIHsKPj4gKyAg
ICAgY3B1cyB7Cj4+ICsgICAgICAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8Mj47Cj4+ICsgICAg
ICAgICAgICAgI3NpemUtY2VsbHMgPSA8MD47Cj4+ICsKPj4gKyAgICAgICAgICAgICBjcHUwOiBj
cHVAMCB7Cj4+ICsgICAgICAgICAgICAgICAgICAgICBkZXZpY2VfdHlwZSA9ICJjcHUiOwo+PiAr
ICAgICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJhcm0sY29ydGV4LWEzNSI7Cj4+ICsg
ICAgICAgICAgICAgICAgICAgICByZWcgPSA8MHgwIDB4MD47Cj4+ICsgICAgICAgICAgICAgICAg
ICAgICBlbmFibGUtbWV0aG9kID0gInBzY2kiOwo+PiArICAgICAgICAgICAgIH07Cj4+ICsKPj4g
KyAgICAgICAgICAgICBjcHUxOiBjcHVAMSB7Cj4+ICsgICAgICAgICAgICAgICAgICAgICBkZXZp
Y2VfdHlwZSA9ICJjcHUiOwo+PiArICAgICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJh
cm0sY29ydGV4LWEzNSI7Cj4+ICsgICAgICAgICAgICAgICAgICAgICByZWcgPSA8MHgwIDB4MT47
Cj4+ICsgICAgICAgICAgICAgICAgICAgICBlbmFibGUtbWV0aG9kID0gInBzY2kiOwo+PiArICAg
ICAgICAgICAgIH07Cj4+ICsKPiAKPiBFdmVyeXdoZXJlLi4uCj4gCndpbGwgZG8KPj4gKyAgICAg
fTsKPj4gKwo+PiArICAgICB0aW1lciB7Cj4+ICsgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJh
cm0sYXJtdjgtdGltZXIiOwo+PiArICAgICAgICAgICAgIGludGVycnVwdHMgPSA8R0lDX1BQSSAx
MyAoR0lDX0NQVV9NQVNLX1NJTVBMRSg0KSB8IElSUV9UWVBFX0xFVkVMX0xPVyk+LAo+PiArICAg
ICAgICAgICAgICAgICAgICAgICAgICA8R0lDX1BQSSAxNCAoR0lDX0NQVV9NQVNLX1NJTVBMRSg0
KSB8IElSUV9UWVBFX0xFVkVMX0xPVyk+LAo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICA8
R0lDX1BQSSAxMSAoR0lDX0NQVV9NQVNLX1NJTVBMRSg0KSB8IElSUV9UWVBFX0xFVkVMX0xPVyk+
LAo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICA8R0lDX1BQSSAxMCAoR0lDX0NQVV9NQVNL
X1NJTVBMRSg0KSB8IElSUV9UWVBFX0xFVkVMX0xPVyk+Owo+PiArICAgICB9Owo+PiArCj4+ICsg
ICAgIHBzY2kgewo+PiArICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAiYXJtLHBzY2ktMS4wIjsK
Pj4gKyAgICAgICAgICAgICBtZXRob2QgPSAic21jIjsKPj4gKyAgICAgfTsKPj4gKwo+PiArICAg
ICB4dGFsOiB4dGFsLWNsayB7Cj4+ICsgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJmaXhlZC1j
bG9jayI7Cj4+ICsgICAgICAgICAgICAgY2xvY2stZnJlcXVlbmN5ID0gPDI0MDAwMDAwPjsKPj4g
KyAgICAgICAgICAgICBjbG9jay1vdXRwdXQtbmFtZXMgPSAieHRhbCI7Cj4+ICsgICAgICAgICAg
ICAgI2Nsb2NrLWNlbGxzID0gPDA+Owo+PiArICAgICB9Owo+PiArCj4+ICsgICAgIHNvYyB7Cj4+
ICsgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJzaW1wbGUtYnVzIjsKPj4gKyAgICAgICAgICAg
ICAjYWRkcmVzcy1jZWxscyA9IDwyPjsKPj4gKyAgICAgICAgICAgICAjc2l6ZS1jZWxscyA9IDwy
PjsKPj4gKyAgICAgICAgICAgICByYW5nZXM7Cj4+ICsKPj4gKyAgICAgICAgICAgICBnaWM6IGlu
dGVycnVwdC1jb250cm9sbGVyQGZmZjAxMDAwIHsKPj4gKyAgICAgICAgICAgICAgICAgICAgIGNv
bXBhdGlibGUgPSAiYXJtLGdpYy00MDAiOwo+PiArICAgICAgICAgICAgICAgICAgICAgI2ludGVy
cnVwdC1jZWxscyA9IDwzPjsKPj4gKyAgICAgICAgICAgICAgICAgICAgICNhZGRyZXNzLWNlbGxz
ID0gPDA+Owo+PiArICAgICAgICAgICAgICAgICAgICAgaW50ZXJydXB0LWNvbnRyb2xsZXI7Cj4+
ICsgICAgICAgICAgICAgICAgICAgICByZWcgPSA8MHgwIDB4ZmZmMDEwMDAgMCAweDEwMDA+LAo+
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgPDB4MCAweGZmZjAyMDAwIDAgMHgyMDAwPiwK
Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgIDwweDAgMHhmZmYwNDAwMCAwIDB4MjAwMD4s
Cj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICA8MHgwIDB4ZmZmMDYwMDAgMCAweDIwMDA+
Owo+PiArICAgICAgICAgICAgICAgICAgICAgaW50ZXJydXB0cyA9IDxHSUNfUFBJIDkgKEdJQ19D
UFVfTUFTS19TSU1QTEUoNCkgfCBJUlFfVFlQRV9MRVZFTF9ISUdIKT47Cj4+ICsgICAgICAgICAg
ICAgfTsKPj4gKwo+PiArICAgICAgICAgICAgIGFwYjQ6IGFwYjRAZmUwMDAwMDAgewo+IAo+IE5v
ZGUgbmFtZXMgc2hvdWxkIGJlIGdlbmVyaWMuCj4gaHR0cHM6Ly9kZXZpY2V0cmVlLXNwZWNpZmlj
YXRpb24ucmVhZHRoZWRvY3MuaW8vZW4vbGF0ZXN0L2NoYXB0ZXIyLWRldmljZXRyZWUtYmFzaWNz
Lmh0bWwjZ2VuZXJpYy1uYW1lcy1yZWNvbW1lbmRhdGlvbgo+IAp3aWxsIGRvCj4+ICsgICAgICAg
ICAgICAgICAgICAgICBjb21wYXRpYmxlID0gInNpbXBsZS1idXMiOwo+PiArICAgICAgICAgICAg
ICAgICAgICAgcmVnID0gPDB4MCAweGZlMDAwMDAwIDB4MCAweDQ4MDAwMD47Cj4+ICsgICAgICAg
ICAgICAgICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwyPjsKPj4gKyAgICAgICAgICAgICAgICAg
ICAgICNzaXplLWNlbGxzID0gPDI+Owo+PiArICAgICAgICAgICAgICAgICAgICAgcmFuZ2VzID0g
PDB4MCAweDAgMHgwIDB4ZmUwMDAwMDAgMHgwIDB4NDgwMDAwPjsKPj4gKwo+PiArICAgICAgICAg
ICAgICAgICAgICAgdWFydF9COiBzZXJpYWxAN2EwMDAgewo+IAo+IGxvd2VyY2FzZSBmb3IgbGFi
ZWxzCj4gCndpbGwgZG8KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29tcGF0aWJs
ZSA9ICJhbWxvZ2ljLG1lc29uLWcxMmEtdWFydCI7Cj4gCj4gU28gdGhpcyBpcyBqdXN0IG1lc29u
PyBEcm9wIG5ldyBBUkNILCBubyBuZWVkIGZvciBpdC4gQW55d2F5LCB5b3UgbmVlZAo+IFNvQyBz
cGVjaWZpYyBjb21wYXRpYmxlLgo+IAo+IEJlc3QgcmVnYXJkcywKPiBLcnp5c3p0b2YKPiAKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9n
aWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
