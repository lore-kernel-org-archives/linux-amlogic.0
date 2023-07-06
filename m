Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 682CBEB64D9
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Jul 2023 08:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ia5jSxVJq7kKEjvM366Mf6IDWbn50DIGufobjOW5xII=; b=rOCwzFx4ti2Tha91zyoG2J7mh1
	L3+JTkjybWwnJ/fVBr9Zwi3FojbF9i7gqytOwbWB4l89DzmzwHAlT4sPN1cyAUrIWSn/hTIoDLOlw
	vuDLFyPqtP/+Zr3oeIcMKv5ltSBmyd9AUGSlambuScwMcc9KsOlxtnlnqR6htIwO6/mQVCEvjKyt2
	9vwiLdsHyDkgZH90GAYqlnKdWQH4+pKMfw/NeDjPOssH1gl6sHLqP3GsKmTydiPD7WX72S8s4Rp6U
	PFNPF1enPMZ7UcZebBXLUDt0CFQWpffDcudSqXTy7AZ+FYx88+8lm+Uk7QlgCgW2iz8iomiZC1Y7W
	vidp6LAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHKc1-000z8H-1H;
	Thu, 06 Jul 2023 08:45:17 +0000
Received: from mail-psaapc01on2071d.outbound.protection.outlook.com ([2a01:111:f400:feae::71d] helo=APC01-PSA-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHKbx-000z6U-2o;
	Thu, 06 Jul 2023 08:45:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FKuEzYkUvE0yJroDWvI85LK9aad86UI6LzFujmBN3AtfEtuhcB0C1iGrKDQM6mI/k4Bkgq+UUEsFWa8dlGZEhdxyVOglMSpAouxW9HXB4IwgKgITz+SVknchvfAd0C/+sdQoUd4+6D9va4Y50F8CFjUyvkWDXSuS3jxbYt7+KpCqCsYM79cr/XzXOwmDnYRbrfxR1erWVZy4obH5YOyBoIJ4fVxewl15CHFWsfnITXmfHfHyhZHoQIscf+YnIUyX3gVCsoiaglgahGwwiw4WQUtTPQoWYekebywHQ2KXupU1aLwy8C5Sobt+NdUW/ss3NVrAcaM71yjxtU2iksofkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SY484SkOMkgpFQZ5yf64+WuWK7rmFeN8PwPbjghjyfY=;
 b=Sni7kY2wSOgxjWsnuXCaT+rHE8Yx5IYV3mnetPuVb50GI3sk8/3ldVwfjKet4VEn5zmIFK9xADW2KtDh8NnJqYbohQ6nqynjocNdGzQ3OqC2fYEP+pOvxc8sdM+6jjLQ4wSmwdEtEUjfoDmezx+g34pT7SOcN7CoytVcIAwI1IFYkhmj2eDF15pJlV7OenLNSqxUGwnNZQii6LDXy/OQD0Cw3rPoXQit4Nho7ISdyWpm2su2LH1ry0ksDb7NSD8/6dI6OdmZyc4UtDqkbQYJ1Z/4Oz0oQmS4vh4QMZg/rdvjgzl+8wDcu8EV+6HCEUoJSnIfwF86twekRsDTnkOznA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SY484SkOMkgpFQZ5yf64+WuWK7rmFeN8PwPbjghjyfY=;
 b=Fu9Ce3xsKFkYiTPTkPSWXvi7dKRHYPZWxdmE/7wx/+AdeJVVcE6hsllwleHAcjxM+KNGFWbCEfIBGZ+/hGCQWIcx6iAFJdT8H5mpcsNJ6fGGAL/HziBqWDnTq21ikEJoOjDW6alu8COD93lsN9MwdGocA23hvah4QoKOidg0MpqrWk6PCBNLBkBOjl+8KGMN1LJWwFld8XhrQ5Yo5PdDqKWCyDLhiXhi7Q5r0evn/1OTd7NVAAANXu70KV28rOZ0k8+d0oDAAVUfEcpra3keg7O2KXHqqvce2nh0dlj8nF57JspCdOvPi9Qsj6ZM7/1QK8VicgWbK9tK16ybX4wY0A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by KL1PR0302MB5362.apcprd03.prod.outlook.com (2603:1096:820:40::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Thu, 6 Jul
 2023 08:44:54 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::c478:28ff:9d91:61f5]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::c478:28ff:9d91:61f5%5]) with mapi id 15.20.6565.016; Thu, 6 Jul 2023
 08:44:53 +0000
Message-ID: <8c1e84ab-e5e0-a3c8-517f-ced3dc516d3e@amlogic.com>
Date: Thu, 6 Jul 2023 16:44:45 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 2/2] arm64: dts: add board AN400
To: neil.armstrong@linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20230704031636.3215838-1-xianwei.zhao@amlogic.com>
 <20230704031636.3215838-3-xianwei.zhao@amlogic.com>
 <112727a2-29c5-1402-deb7-f35119b4338e@linaro.org>
Content-Language: en-US
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <112727a2-29c5-1402-deb7-f35119b4338e@linaro.org>
X-ClientProxiedBy: SI1PR02CA0056.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::7) To TYZPR03MB6896.apcprd03.prod.outlook.com
 (2603:1096:400:289::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|KL1PR0302MB5362:EE_
X-MS-Office365-Filtering-Correlation-Id: 3df0d48a-8454-43c2-df13-08db7dfd44a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xQ/uT89+mFvX2kyLz8h59IbGbKFNnOvnbgyEsOYqWmnh/sufHaTp7UoIKUqbwuXIlCTMnG4iWERz931GjIANjE7W1FJWRilsRPhV3dclvLKqdDXHKG1Xf4KxZX4Kx376tdBdyOgh23ge2Cv0oGFpXkybnc9Gz5v6kXw/ZBGBAymp07H4VsbOB168JCIGAcHIx+YowM7CX6ZIZnPI7yQZ3OKIrre/f/9s9eRv1giMv2wQ63x0Yh5O978bfmy7QPG1tFtKhMoWONQuKWjtnUn607GnzLJfFtwttR0Jnj9jyaN5dHrpjZJEr9FYhVDZe4JOBOQjBPw8o+Ueuoufe5BfnoRQ0bM08w2WcBVwt2FfMcx3X1Yr1+n+C+BIInjXfngB4aoe4LZuwpHNPxXCrA/rI7vktQQxo3qmW9FDQGbX1KjcGWLXOzk8tv5inrI2jaarzGNEdtJCiJdAhsc2QKNF9vtdEt7sOtIN6QpNh2emd+TPYeJ7ilbWE+wILAa0r90504z+F1KfC9ngEwkfFEu89UOApQL6nBIHjzi754Z5Ba0DkoXlrvnOVVb98Qezam7n4bbGCMD/vIP7QX6sq0s6JkeYUvT6gyC9Fbhfx3leqkFLu3Ts3zp6TmUCiWzAdHQ1x+huZRtdQwQYHbQKaars4X6uvfqqaB5nDkYR5T2GaMEcQMulJ7rZf36aQEIwcZAEzw9OZVYChn9zfcHHB++t5g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(366004)(376002)(396003)(39850400004)(136003)(451199021)(66476007)(4326008)(66556008)(2616005)(31696002)(86362001)(186003)(53546011)(6506007)(26005)(83380400001)(38100700002)(66946007)(6666004)(6512007)(478600001)(6486002)(54906003)(41300700001)(36756003)(8936002)(44832011)(8676002)(31686004)(7416002)(5660300002)(2906002)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OVVZcjhLSUFPaC8zYWFvNU9jdzNFNWMvbTFSYytucENxdUUwQldkb1ZJbUlR?=
 =?utf-8?B?U0x4OGRJY1ZtR0VOMTM1RmhMa2JoUXZoU3M3Y1lXOENHS0RqMUJYNVNzK0Z2?=
 =?utf-8?B?NmsxMm4zTHVzVDJPeDc4b1FuOUZid3VEalhMY1J1bW0zK0Njb1NoNFFZZC9m?=
 =?utf-8?B?aHdwbmpmS3RGQ3dsNzhocHBpZCtrZThnTkVsQnNmcVV2VmpVbXF0RER5c21y?=
 =?utf-8?B?V2dGM1FUQWY3RUc4VVBxNktzajJVRk5idWtlMExSNzBGQzQweEpoOXhicEt2?=
 =?utf-8?B?MVQwKzBHYXRSZy90OWtUWWdKbnBKc2czbGlRdFp1YUl0cEluTkpJL1NYUHpO?=
 =?utf-8?B?RnpUN3gycVUwQVR2bERTTkNtSXdDaWF6NTk3empkRWwwVGxwN1R4RHRYQkRM?=
 =?utf-8?B?dVFodG52aHRsNElNZ0NHZ0dCTC94T2RkSkYrSitCYW5TODU3bnlKZlB4Szlv?=
 =?utf-8?B?RHBJWk83dTRYMjM5UXRkOVVyVXp2VCs0UnJmV3IycnZ5bXRlWEs4OVBNd0xT?=
 =?utf-8?B?cnpZRm5oNDB0QWFCaEo1WnRqZ3RtZ3poN0d6VWxnVU5PTVFzbmd0UFRrSzVI?=
 =?utf-8?B?L0diVUhoYTR4VlZueklZWmlTUGRyR2hsT0s0SloyRlZCQTF0VUhVRVZFTmJt?=
 =?utf-8?B?YW5iUXprYkIyTEpCM3duZlVDR0JkcHpiamhGd0N4dnRkWWFib3U2aVRPUE1a?=
 =?utf-8?B?U3NCcS9MREUxdDBMUnh5TTVlejNLazhtVmRSNzdBdUw3UDJiVVVLSlg3dzIx?=
 =?utf-8?B?UXJaOHdzT0dVUTlrcVh0Vll6cTM0aGN1eDZ2d08veU5aZW1NaHc2WjhNQ0Vi?=
 =?utf-8?B?NnFwOVNxL1Y2WldReGJMbDZjeklUTHVsUlZFNStKUys2SjQ1MXozSWoxaS8r?=
 =?utf-8?B?VWx1aXdrVlh0SStVYjRGUVFHTjdnRURBUnpmSmFjUWowKzZvYnBnL0FzaDI5?=
 =?utf-8?B?VkJZZi84SDJsNVNwRVZCUGVWMHU5NDgxSUVTSnpTQjVHUnZGUW9BMVUrVTk4?=
 =?utf-8?B?ZVFIbC9wYnpTbjdGTDE3ayt1SHlFemF2eVRiL0IyWUt1L1VGeDdQeDU1LzJx?=
 =?utf-8?B?b2pkOUZOWnJXRnNPNzFWTjc1V1QrM3ZOSURlMHJwek5qdlZuY0xyY0tyb2Nk?=
 =?utf-8?B?UEF2SDNyby9nOFlHWlEvYW0xNG8rVG9FdVZyWTY4cCtXLzU5WVlJSHY5b2ZU?=
 =?utf-8?B?ZWdid1VYSTNIcDNRUjFvR0txN1ZGQlUyR1hNcTNGYTBMdko2SEVOR1F4cUx1?=
 =?utf-8?B?STltbVBlYXJ1NGZPUkJmdkowbDlQQThJNnRWNllFOVhraXdSbUZTZjE0K2I2?=
 =?utf-8?B?UTRBcFNScE5ORHhXZDFRSkdxbk1PQTVyN0IwallpaDNEK2hZNUkzVXFBNldk?=
 =?utf-8?B?ODBzUlZEY050VEZQNE9uTTVNK0tyWnU5WGZ4Rmx6Z0F4MmMyWENtTHg3bmt0?=
 =?utf-8?B?UE5iNFBzRVFhVVIxclZjNDBWY01NYkR2MnRDay94VldUV3JJRllSUm1Xenll?=
 =?utf-8?B?czFyTlBFOXJjT0d2TEQ1TVh2ak1ZUmRwczJOaFhaUStBd1MvUkUycVJXUjFJ?=
 =?utf-8?B?UVl5M2oyYTRENFZHQ0RxNFpLa0VRVGRoQktnUmFJYUxzdFc5MTczTHJsNlh3?=
 =?utf-8?B?UHh5Q1AxcUhmZ29NaWI0NllnTlRQaHNPY0tGbndjMDN6OW5oYXkrUWhrMHpV?=
 =?utf-8?B?bDZhd1l2UDMyTzlJelA3cFBVcWVnNi9VSjQyZkw5bW1jVkdmbVYzby92a1RI?=
 =?utf-8?B?MFpRaTl4MjdraUdtR3Jhb2IzWFUyVDZVR2lPa3Qyai80VW9iTGJldU5MVllG?=
 =?utf-8?B?ek1nald5dkZyZGlGMjRaOG9OMm9xOWVObE00VGZ1SFZlc0FPK1FLandWcjBn?=
 =?utf-8?B?cGFRUlR1NzU4K2hBaWhoOWQwTXBSZlkzYnYyOE9vSXdkNm9EQ1NkUzlmV25s?=
 =?utf-8?B?YW1VSWpncElhTDRHMmZlUnBXOWxrMGYxSktzN1ZqWERoTHBJdXpybFRsWUxz?=
 =?utf-8?B?WEFGaXIwbEsxQXBEZzdheW9zRDlUSEhTZ3U3SHZ6Z05INjlUVm5vSW1YTm9j?=
 =?utf-8?B?WmFiSVhBWTJnZTVhU2h0TEFWblRHSHViVVptQldaWEFlcThlTzRaS1ErZlFZ?=
 =?utf-8?B?QUJaQnY5dUhBd2dLUmRNY01WT3dlTURvVVRmWEUxM015ZkxpWXZxQ09ma0tY?=
 =?utf-8?B?WWc9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3df0d48a-8454-43c2-df13-08db7dfd44a1
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2023 08:44:53.6340
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2ppt/cWJwkz0Ng5qdX70EFRc1xq82lAyKI2gGTUyHq8bLJhQT5npxVGyfxI94WOifeuoqiTIjcLIoLGrp0zx4bLqHy672tdDDtFI2ffwy38=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0302MB5362
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230706_014513_938134_E77567F6 
X-CRM114-Status: GOOD (  23.03  )
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

SGkgTmVpbCwKICAgICAgVGhhbmtzLgoKT24gMjAyMy83LzQgMTY6MDksIE5laWwgQXJtc3Ryb25n
IHdyb3RlOgo+IFsgRVhURVJOQUwgRU1BSUwgXQo+IAo+IEhpLAo+IAo+IE9uIDA0LzA3LzIwMjMg
MDU6MTYsIFhpYW53ZWkgWmhhbyB3cm90ZToKPj4gQWRkIGRldmljZXRyZWUgc3VwcG9ydCBmb3Ig
QW1sb2dpYyBBTjQwMMKgIGJvYXJkIGJhc2VkIFQ3IFNvQy4KPj4KPj4gU2lnbmVkLW9mZi1ieTog
WGlhbndlaSBaaGFvIDx4aWFud2VpLnpoYW9AYW1sb2dpYy5jb20+Cj4+IC0tLQo+PiDCoCBhcmNo
L2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvTWFrZWZpbGXCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDEg
Kwo+PiDCoCAuLi4vZHRzL2FtbG9naWMvYW1sb2dpYy10Ny1hMzExZDItYW40MDAuZHRzwqDCoCB8
IDM5ICsrKysrKysrKysrKysrKysrKysKPj4gwqAgMiBmaWxlcyBjaGFuZ2VkLCA0MCBpbnNlcnRp
b25zKCspCj4+IMKgIGNyZWF0ZSBtb2RlIDEwMDY0NCAKPj4gYXJjaC9hcm02NC9ib290L2R0cy9h
bWxvZ2ljL2FtbG9naWMtdDctYTMxMWQyLWFuNDAwLmR0cwo+Pgo+PiBkaWZmIC0tZ2l0IGEvYXJj
aC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL01ha2VmaWxlIAo+PiBiL2FyY2gvYXJtNjQvYm9vdC9k
dHMvYW1sb2dpYy9NYWtlZmlsZQo+PiBpbmRleCA5MWZhNDI1MTE2ZWEuLjhiNmY1N2E5NDg2MyAx
MDA2NDQKPj4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL01ha2VmaWxlCj4+ICsr
KyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9NYWtlZmlsZQo+PiBAQCAtMSw1ICsxLDYg
QEAKPj4gwqAgIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMAo+PiDCoCBkdGItJChD
T05GSUdfQVJDSF9NRVNPTikgKz0gYW1sb2dpYy1jMy1jMzAyeC1hdzQwOS5kdGIKPj4gK2R0Yi0k
KENPTkZJR19BUkNIX01FU09OKSArPSBhbWxvZ2ljLXQ3LWEzMTFkMi1hbjQwMC5kdGIKPj4gwqAg
ZHRiLSQoQ09ORklHX0FSQ0hfTUVTT04pICs9IGFtbG9naWMtdDctYTMxMWQyLWtoYWRhcy12aW00
LmR0Ygo+PiDCoCBkdGItJChDT05GSUdfQVJDSF9NRVNPTikgKz0gbWVzb24tYTEtYWQ0MDEuZHRi
Cj4+IMKgIGR0Yi0kKENPTkZJR19BUkNIX01FU09OKSArPSBtZXNvbi1heGctamV0aG9tZS1qZXRo
dWItajEwMC5kdGIKPj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9h
bWxvZ2ljLXQ3LWEzMTFkMi1hbjQwMC5kdHMgCj4+IGIvYXJjaC9hcm02NC9ib290L2R0cy9hbWxv
Z2ljL2FtbG9naWMtdDctYTMxMWQyLWFuNDAwLmR0cwo+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+
PiBpbmRleCAwMDAwMDAwMDAwMDAuLmQ3NTVlMWVlMTA4YQo+PiAtLS0gL2Rldi9udWxsCj4+ICsr
KyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9hbWxvZ2ljLXQ3LWEzMTFkMi1hbjQwMC5k
dHMKPj4gQEAgLTAsMCArMSwzOSBAQAo+PiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChH
UEwtMi4wKyBPUiBNSVQpCj4+ICsvKgo+PiArICogQ29weXJpZ2h0IChjKSAyMDIzIEFtbG9naWMs
IEluYy4gQWxsIHJpZ2h0cyByZXNlcnZlZC4KPj4gKyAqLwo+PiArCj4+ICsvZHRzLXYxLzsKPj4g
Kwo+PiArI2luY2x1ZGUgImFtbG9naWMtdDcuZHRzaSIKPj4gKwo+PiArLyB7Cj4+ICvCoMKgwqDC
oCBtb2RlbCA9ICJBbWxvZ2ljIEEzMTFEMiBBTjQwMCBEZXZlbG9wbWVudCBCb2FyZCI7Cj4+ICvC
oMKgwqDCoCBjb21wYXRpYmxlID0gImFtbG9naWMsYW40MDAiLCAiYW1sb2dpYyxhMzExZDIiLCAi
YW1sb2dpYyx0NyI7Cj4+ICvCoMKgwqDCoCBpbnRlcnJ1cHQtcGFyZW50ID0gPCZnaWM+Owo+PiAr
wqDCoMKgwqAgI2FkZHJlc3MtY2VsbHMgPSA8Mj47Cj4+ICvCoMKgwqDCoCAjc2l6ZS1jZWxscyA9
IDwyPjsKPj4gKwo+PiArwqDCoMKgwqAgYWxpYXNlcyB7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgc2VyaWFsMCA9ICZ1YXJ0X2E7Cj4+ICvCoMKgwqDCoCB9Owo+PiArCj4+ICvCoMKgwqDC
oCBtZW1vcnlAMCB7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZGV2aWNlX3R5cGUgPSAi
bWVtb3J5IjsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBsaW51eCx1c2FibGUtbWVtb3J5
ID0gPDB4MDAwMDAwMDAgMHgwMDAwMDAwMCAweDAwMDAwMDAwIAo+PiAweEUwMDAwMDAwCj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgMHgwMDAwMDAwMSAweDAwMDAwMDAwIDB4MDAwMDAwMDAgCj4+IDB4MjAw
MDAwMDA+Owo+IAo+IFBsZWFzZSB1c2UgInJlZyA9IiBpbnN0ZWFkIG9mIGxpbnV4LHVzYWJsZS1t
ZW1vcnksIHdoaWNoIGlzIG5vdCBhIAo+IGRvY3VtZW50ZWQgcHJvcGVydHkKPiAKPiBQbGVhc2Ug
dXNlIGBtYWtlIENIRUNLX0RUQlM9eWVzIGFtbG9naWMvYW1sb2dpYy10Ny1hMzExZDItYW40MDAu
ZHRiYCAKPiBiZWZvcmUgcG9zdGluZyBEVCBwYXRjaGVzLAo+IGFuZCBtYWtlIHN1cmUgdGhlcmUn
cyBubyBlcnJvcnMgZXhjZXB0IGFscmVhZHkgaW4tcmV2aWV3IGJpbmRpbmdzIGxpa2UgCj4gaGVy
ZSB0aGUgVUFSVCBjb21wYXRpYmxlLgo+IAo+IFRoZSByZXN1bHQgaGVyZSBpczoKPiBhcmNoL2Fy
bTY0L2Jvb3QvZHRzL2FtbG9naWMvYW1sb2dpYy10Ny1hMzExZDItYW40MDAuZHRiOiAvOiBtZW1v
cnlAMDogCj4gJ2FueU9mJyBjb25kaXRpb25hbCBmYWlsZWQsIG9uZSBtdXN0IGJlIGZpeGVkOgo+
ICDCoMKgwqDCoMKgwqDCoCAncmVnJyBpcyBhIHJlcXVpcmVkIHByb3BlcnR5Cj4gIMKgwqDCoMKg
wqDCoMKgICdyYW5nZXMnIGlzIGEgcmVxdWlyZWQgcHJvcGVydHkKPiAgwqDCoMKgwqDCoMKgwqAg
RnJvbSBzY2hlbWE6IAo+IC91c3IvbG9jYWwvbGliL3B5dGhvbjMuMTAvZGlzdC1wYWNrYWdlcy9k
dHNjaGVtYS9zY2hlbWFzL3Jvb3Qtbm9kZS55YW1sCj4gYXJjaC9hcm02NC9ib290L2R0cy9hbWxv
Z2ljL2FtbG9naWMtdDctYTMxMWQyLWFuNDAwLmR0YjogLzogbWVtb3J5QDA6IAo+ICdsaW51eCx1
c2FibGUtbWVtb3J5JyBkb2VzIG5vdCBtYXRjaCBhbnkgb2YgdGhlIHJlZ2V4ZXM6ICdwaW5jdHJs
LVswLTldKycKPiAgwqDCoMKgwqDCoMKgwqAgRnJvbSBzY2hlbWE6IAo+IC91c3IvbG9jYWwvbGli
L3B5dGhvbjMuMTAvZGlzdC1wYWNrYWdlcy9kdHNjaGVtYS9zY2hlbWFzL21lbW9yeS55YW1sCj4g
YXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL2FtbG9naWMtdDctYTMxMWQyLWFuNDAwLmR0Yjog
LzogbWVtb3J5QDA6IAo+ICdyZWcnIGlzIGEgcmVxdWlyZWQgcHJvcGVydHkKPiAgwqDCoMKgwqDC
oMKgwqAgRnJvbSBzY2hlbWE6IAo+IC91c3IvbG9jYWwvbGliL3B5dGhvbjMuMTAvZGlzdC1wYWNr
YWdlcy9kdHNjaGVtYS9zY2hlbWFzL21lbW9yeS55YW1sCj4gCj4gUGxlYXNlIGZpeCB0aGlzIG9u
ZS4KPgpXaWxsIGRvCj4gYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL2FtbG9naWMtdDctYTMx
MWQyLWFuNDAwLmR0Yjogc2VyaWFsQDc4MDAwOiAKPiBjb21wYXRpYmxlOiAnb25lT2YnIGNvbmRp
dGlvbmFsIGZhaWxlZCwgb25lIG11c3QgYmUgZml4ZWQ6Cj4gIMKgwqDCoMKgwqDCoMKgIFsnYW1s
b2dpYyx0Ny11YXJ0JywgJ2FtbG9naWMsbWVzb24tczQtdWFydCddIGlzIHRvbyBzaG9ydAo+ICDC
oMKgwqDCoMKgwqDCoCBbJ2FtbG9naWMsdDctdWFydCcsICdhbWxvZ2ljLG1lc29uLXM0LXVhcnQn
XSBpcyB0b28gbG9uZwo+ICDCoMKgwqDCoMKgwqDCoCAnYW1sb2dpYyx0Ny11YXJ0JyBpcyBub3Qg
b25lIG9mIFsnYW1sb2dpYyxtZXNvbjYtdWFydCcsIAo+ICdhbWxvZ2ljLG1lc29uOC11YXJ0Jywg
J2FtbG9naWMsbWVzb244Yi11YXJ0JywgJ2FtbG9naWMsbWVzb24tZ3gtdWFydCcsIAo+ICdhbWxv
Z2ljLG1lc29uLXM0LXVhcnQnXQo+ICDCoMKgwqDCoMKgwqDCoCAnYW1sb2dpYyxtZXNvbi1nMTJh
LXVhcnQnIHdhcyBleHBlY3RlZAo+ICDCoMKgwqDCoMKgwqDCoCAnYW1sb2dpYyxtZXNvbi1hby11
YXJ0JyB3YXMgZXhwZWN0ZWQKPiAgwqDCoMKgwqDCoMKgwqAgJ2FtbG9naWMsbWVzb24tZ3gtdWFy
dCcgd2FzIGV4cGVjdGVkCj4gIMKgwqDCoMKgwqDCoMKgIEZyb20gc2NoZW1hOiAKPiBEb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc2VyaWFsL2FtbG9naWMsbWVzb24tdWFydC55YW1s
Cj4gYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL2FtbG9naWMtdDctYTMxMWQyLWFuNDAwLmR0
Yjogc2VyaWFsQDc4MDAwOiAKPiBVbmV2YWx1YXRlZCBwcm9wZXJ0aWVzIGFyZSBub3QgYWxsb3dl
ZCAoJ2NvbXBhdGlibGUnIHdhcyB1bmV4cGVjdGVkKQo+ICDCoMKgwqDCoMKgwqDCoCBGcm9tIHNj
aGVtYTogCj4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NlcmlhbC9hbWxvZ2lj
LG1lc29uLXVhcnQueWFtbAo+IGFyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9hbWxvZ2ljLXQ3
LWEzMTFkMi1hbjQwMC5kdGI6IAo+IC9zb2MvYnVzQGZlMDAwMDAwL3NlcmlhbEA3ODAwMDogZmFp
bGVkIHRvIG1hdGNoIGFueSBzY2hlbWEgd2l0aCAKPiBjb21wYXRpYmxlOiBbJ2FtbG9naWMsdDct
dWFydCcsICdhbWxvZ2ljLG1lc29uLXM0LXVhcnQnXQo+IAo+IFRoaXMgb25lIGlzIE9LLCB0aGUg
VUFSVCBiaW5kaW5ncyBpcyByZXZpZXdlZCBhbmQgc2hvdWxkIGJlIHBpY2tlZCB1cCAKPiBmb3Ig
djYuNgo+IAo+IE5laWwKPiAKPj4gK8KgwqDCoMKgIH07Cj4+ICsKPj4gK8KgwqDCoMKgIHh0YWw6
IHh0YWwtY2xrIHsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb21wYXRpYmxlID0gImZp
eGVkLWNsb2NrIjsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjbG9jay1mcmVxdWVuY3kg
PSA8MjQwMDAwMDA+Owo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNsb2NrLW91dHB1dC1u
YW1lcyA9ICJ4dGFsIjsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAjY2xvY2stY2VsbHMg
PSA8MD47Cj4+ICvCoMKgwqDCoCB9Owo+PiArfTsKPj4gKwo+PiArJnVhcnRfYSB7Cj4+ICvCoMKg
wqDCoCBjbG9ja3MgPSA8Jnh0YWw+LCA8Jnh0YWw+LCA8Jnh0YWw+Owo+PiArwqDCoMKgwqAgY2xv
Y2stbmFtZXMgPSAieHRhbCIsICJwY2xrIiwgImJhdWQiOwo+PiArwqDCoMKgwqAgc3RhdHVzID0g
Im9rYXkiOwo+PiArfTsKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LWFtbG9naWMK
