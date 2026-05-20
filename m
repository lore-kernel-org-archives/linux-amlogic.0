Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C129CD4F54
	for <linux-amlogic@archiver.kernel.org>; Wed, 20 May 2026 03:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pRLBb4oWz1O/MCiKS6VsXv8r9NCNoqJb2pTzp4JyUuY=; b=F2HyY6gtbAjLx7Wpf4m8YkyXAz
	VwhANz8nOMuXk9wVWlkBEkMQ7AMb7hHG2oFnAIwjzFGzKVehQjSVByOb/LdVA6z9at/xFzR7HCbxJ
	DTcAMc59bOYbKCriDNI1wVVP12bwNYVMfxoSHFXHq6DSTkl4GgwPQC/+U2CgOfRUSLy/nuCf/lh8Z
	lDuqIAg9OjLf3dioBoAZDzmNFdpwIshuYn1+4l3KlKAqWnooeQdtI+L7l1hjfcNh8aAjNH1FQxLC5
	z42BQAMTVMCWeRgKnghrvwFedOxGf5w4CuIpP5ZG5fuucbLbd/7W7rSgBtzywSWJjJezLaNZGG4pP
	zXEmg6xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPXZN-00000003ORu-31Uu;
	Wed, 20 May 2026 03:26:06 +0000
Received: from mail-japaneastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c405::7] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPXZK-00000003OR9-24Xo;
	Wed, 20 May 2026 03:26:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hQCmvb5T3aaaZJ6DAkDSB31zBMQ93WBo1Y86RfvUniqXDcaMZGqF/xeFP+DqsHEa0/58ffBVMZfrQePqOsYXlH2lFH3ocKL3H2IHZRQCGBppJEjp5W9JdcJA7lZTFJKF4KcUYdr87770crphL0Scrmp6nrKur0zQCDldbUsRZy8LpuJ+0TtKXmvZc3pB0ZYgXO1SHSY5Wjuo5Xec04AhBs0TnCT+ru86suu2suiHM2w45B6pOGgmcYaQ+RFgIBm1h3nTtJM0tQ6ipUjWMOWn5nGkIQBeb+B9yKk6oudw3GLb/c4OPB/tZMEYTFRVMzyk3QmHaxUZoNUyfYo2g3j9SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EN48AGqeOEBjcVUfJxhkQnOSDUB+yWk3SRNt86XESEQ=;
 b=FNXXUUDMz7/RuZ3EPbGrzHkzOVU4MMw558tVvBl5idY+bSSl2wFe4z50Swk7iec/lTy4xjuY6TwXrMj4tJMWJRB5UfjrZIxhGx+4xA3uP1eAJXfrkkVSPvpjkNupYiZAqnFzTKrvk0jes0pBAurg2eqddVAMFg13bIPwYKMWPok83zsCu3qcQc7aqds9BpxsyVuuXNyhGr25bXpeb6DQmZLP4o2Sg2gmlWvUFaQ26XqoviZfbL/eC6rk+Ag/tllR/Rk09E639BJffSjr6zBztJzeWcMNMJAtmM10h2V18mbaLK+G4/HyGH+OeWHpyfNtWGuFOjn7vLNizHZB6bsGLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EN48AGqeOEBjcVUfJxhkQnOSDUB+yWk3SRNt86XESEQ=;
 b=i6hSySnG110Ys3jOizZmXGONh+ozszOokI1l1Epeypua7RO9iyWz/lPdaZfJ2STO6EhoSOUC6Xr3lULe6YPkfSYhypAmg8KuKWHFKwjfG8Y8H6Dq+3XvRRQoPi6dfO6Q+ynGH6uVowK2oEKKwxCdz1hPyznm/7kahJPszynArtWs8wXZtPcCdYDRQn0FnJvYpnPM33v/Ls7D9src6N6GGmIEwKlkqqQtOZj8nW4U26D42sLyK+LyLSFaBy+AqbDMd/s7mHJrAFNu3309ZVtyQRO7lDGmtfMJwIn3hAJohM5CD4rtsTxAgF6tB5P7gMD0hCREbDV6ETHHgYF71o2yNQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com (2603:1096:820:ca::7)
 by SG2PR03MB6430.apcprd03.prod.outlook.com (2603:1096:4:1c1::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.15; Wed, 20 May
 2026 03:25:38 +0000
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506]) by KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506%5]) with mapi id 15.21.0048.010; Wed, 20 May 2026
 03:25:38 +0000
Message-ID: <d023303e-e785-4b60-85cd-c83cc3f890e4@amlogic.com>
Date: Wed, 20 May 2026 11:25:35 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/10] clk: amlogic: PLL l_detect signal supports
 active-high configuration
To: Jerome Brunet <jbrunet@baylibre.com>,
 Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Xianwei Zhao <xianwei.zhao@amlogic.com>, Kevin Hilman
 <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20260511-b4-a9_clk-v1-0-41cb4071b7c9@amlogic.com>
 <20260511-b4-a9_clk-v1-5-41cb4071b7c9@amlogic.com>
 <1jse7u6n3q.fsf@starbuckisacylon.baylibre.com>
From: Jian Hu <jian.hu@amlogic.com>
In-Reply-To: <1jse7u6n3q.fsf@starbuckisacylon.baylibre.com>
X-ClientProxiedBy: SEWP216CA0045.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2bd::19) To KL1PR03MB7149.apcprd03.prod.outlook.com
 (2603:1096:820:ca::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB7149:EE_|SG2PR03MB6430:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f022414-51ac-4f68-1966-08deb61f76be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|11063799006|4143699003|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: DBzbglwt2xOJ+MTcJ+nO/MclEj2jJJnhY/bJdvJ3CjSBHw2NmWRlj/kUegiY8pqC/1EStskmRqMdy3TmMlFaNo7+Iya56xFDxT460e9G7+HBlqOe32XHV/VsGK5ZqfV/GhRygomlMnixustZGGJ8+Sl8fIBMrSU8PYjt9+uYZxjqP3uFJgIQSWVWUkP870RfH09aWhBQvcdpgwmzWuSH9OTBpe9CyWHb1PKgPYA6Mq7hnC2FQ0+fJTIUl+R6GLR4Fdr/pgcbGC9oNpvXyK6q3XtsdS9OchQeNu7OfMMXzoadAlSrC6c+FM/z46kteeuTgFDfyv+EGcbSlQxX68ynqPsZNiDfDI38Qt8o5HKx77hNwZhTattczMXb/rkXSYRJ+LvObSTzFLI+jdnOx4wRlAk/Wz+LrIRyo9Rjn0o8Io10na4eMabshCwubKRvYb0KMtDXC8WyflJSmpG6Sk1uCjuqnvma8jg6VgdEC4ZHsPrOiIlxhWc0JLZZswA3SsJM+up5vT2AaUvFpmbOYwM7R706MFw5ovCMzVj/hoJHZ9Ye8sI+XcfwGR+g/tkbvms1SN05RSx3uXVnZG7JZFCXO77K81o2rio0S/WbKWIeMMamoOYzXWOnUomcIl9cZBQm+fkVI+cd4bcIVsg5bT1Kt9ZP6nA06qP0XOgxqHn+236Eh6S3vjTVNz4C/+RvPIgK
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB7149.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(11063799006)(4143699003)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VzV1d3Y2NEg3clZsOGtGZElEYmtWWXFibGYwY21YVUt5VURvWnFZclRlaUsw?=
 =?utf-8?B?N3kzNWcwbUJjTC9lUVdxWmdIRUc1VW5RbEUvZ3R1alFYSkY0ZGtOdWt0Qnkz?=
 =?utf-8?B?RlFKZCt4YjBxVFdHOVZBUEpDR1JLSWw3NUpFbmk4WjJVSVRhdjAzckN5bXpl?=
 =?utf-8?B?eENoQ2xnSGpwRHh3cjNDYlhEVnJhU01Zc0VmbkpoT0h3QkMxTVowL1dUeXR3?=
 =?utf-8?B?ZytmVCt3Y2pNVGszL0t4OHFoSFRBMUh1TkJxOUF2TThacWl2d1RDWCtySStl?=
 =?utf-8?B?c29TRGE4NnhrRFZmRUlWd3FqL1Y1VnBkcW1rNElBZTlzenRqVUUvamtLVGlZ?=
 =?utf-8?B?RGpqVlJCbzlsaVZxTFlZMHMxYkFvcVBDYkFrM1lIaDIwbXNrTXhSTllQZWVV?=
 =?utf-8?B?TGV4TEdGb29DOWtRNVpLUHd3RGU3aXhjTFBaN3FkbVFyOUNINExXVlJCdi9v?=
 =?utf-8?B?T2FWYk4xbUhNMHdqNS9DYXZaS0gvK3JPbC9NeG5wbDlmZ0Jad0tEaWc3OVdT?=
 =?utf-8?B?Y1JkWXBSQTBrZWl3Y0kyY3lybVhWVmVxazhTZVZhakM3NUo0RWZlNEs0TGpM?=
 =?utf-8?B?ZmRUYnlGMlZXZkx2UnNYL2w1ck9hNmlpMDBBOGFWWEdpeHE5OFhqbmpKUmlZ?=
 =?utf-8?B?YjloUThZZVZUekZGSGxRMEw3TG03alFQL29ibGZxRFpBMldFRmRBRklobnln?=
 =?utf-8?B?QVZMV3h5dnVWdFE5ZUF2QmtmV2xyVmplOHpNRFhVZytXL0l2MWtYL3p5Y05x?=
 =?utf-8?B?UThHWmhOSUZ2aUlGNmc2REVvNmc0b1ZEOC8zNFZXR1dzN1pHWkpRYndYeXEy?=
 =?utf-8?B?WCtqU0taakhnU1Z1M05xMng4VHk5QmNCY3lLV1UrTWNDUC82bElpN05GV2Jp?=
 =?utf-8?B?eGhDR3pRdWJBWTF0YTNaWkt2Qk0yRzBBSGlSanRUNFJvUVNRV3F6MU14aEMv?=
 =?utf-8?B?KzBiYTBGakhZQmc3WGFodmFBYnYvNXNTUnlyT1FabDZnL1BndDVPc3FhK0V1?=
 =?utf-8?B?VHhlcXZtKzYzbjhIblJMRFZreVpVMWFkSFcwaHZFakU1Z1ZoUEkyRnBybDZl?=
 =?utf-8?B?RlFSYStLNzRUZFI1THl4TERFRFhKWHRsOVg5R1d5ZUQzd1JCQzVEaHlVTVJp?=
 =?utf-8?B?eDNHUzNyMWsvWkdGV05PK0dlYnp4am1CcTBYUGdmaHZXNGJKdVpKUzUyQmRr?=
 =?utf-8?B?T1dGS2NqRWRLQTlUTXZmQjJRRTdoOCtNeFpJb3FNTm5tb2R2NTFBYlh1b1Aw?=
 =?utf-8?B?QnkrTTdBTG1RanVmUFovSWdMK1RyTkFRM1Fha3VNS1dWU1NUem5QMlNseU1N?=
 =?utf-8?B?WTdHc0xta21GYTdBZkZHUmpoT0ZNZ3dPem85S24vYWoxb2htODBFRGZUSy9y?=
 =?utf-8?B?WWJQekkwY2J1WTNLeFh6blNLOHNOcEdWMHgvWFJBQnNKM0tzWE9mdlJ3WVVZ?=
 =?utf-8?B?MWdTNlBEZkt1Vk5oNSt6Z2JCQWRLWXhxWXF6MExlS2ZEclo4TlBPdWVVWDhM?=
 =?utf-8?B?Wml4SmZVRGk4WVhkNzQ0Q2dCV3k1dC9tMERpaVRScmZ0NldjMllTV1Z3dmEy?=
 =?utf-8?B?eGRMN1ZGK0U5ODFTRDRXOXJXS080UE5MTnptSVdLaVhGQjE4TnROeEhJRlQw?=
 =?utf-8?B?R2tubksxYS9WVWdpbDl4SlB6ZHhrK3NyMFZQZE4xeVZsd0NyQVgxRm5nbDlu?=
 =?utf-8?B?ck5OdVpiTmxiZjFFeGlMTzlOR091QktYZ09DNXpmUkpidUs5UndPd0lwa0lS?=
 =?utf-8?B?S3hkc3F1WVBncWxwRno0ZDhJSk9FNTJGMW5zU0JhY3BXaGowa3V0RlNLb1VL?=
 =?utf-8?B?c3VMK091dDdxZjM3NFprV0IwZ0pYY2ZBSWVUVUQ3cW1jZ0tlQW1jK3pyU1NN?=
 =?utf-8?B?N0tnVGo5WG5xbzUwMXU5TUlqcFhMS0NHWTU5UUJwSnRVbTdrbXc5alhqZkdU?=
 =?utf-8?B?Wkx2b0F2dlFNWTlLK3ZqQ3FjWkthSnludzljcDhESlB4UjBOM3J3eVorWlo4?=
 =?utf-8?B?SXZoRXpLMS8wS0RXZjdmbytITTF3MUhVeWN1ZHZpMmZsalhHNFN6Vk9YVWN5?=
 =?utf-8?B?NXdFbDRtckJQdzRFamdrUSt1aXlwaWJoSnFBVGJBZ0FLMW5PcSsvSEl6bWtF?=
 =?utf-8?B?WElCY3IvMkJHMk1uWTlwM0M0UWZnNG9tUHBLdnlCcmN1U0dhMTJ0Vys5TDNH?=
 =?utf-8?B?OHhCZHd1YjI4QXM4ME9FczEzUEpJbXA1RU5ybko0QjZ2K2dQOUJTUHh4WSsz?=
 =?utf-8?B?c2tCV3RsblMzb3NtQ2VGdWtMV0RlUEZTWFhxdEZjSnhRY2dRZzZsN1Y0NDBv?=
 =?utf-8?B?Q2RkbDdLbHVNQ1ZoU0RKTUdrcnJLejJHV3g2SmVlYVJ0MWE5M0Z4UT09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f022414-51ac-4f68-1966-08deb61f76be
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB7149.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 03:25:38.7361
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EXf8Wnfcp5RvaYOSHkBuNgQqUkmm3boO+hyPdOwTYK+bCteydezQtbjiI/WpJqja1C/gQfRNlznSu7lRPLrDgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR03MB6430
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_202602_540312_88B84006 
X-CRM114-Status: GOOD (  16.91  )
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

T24gNS8xNC8yMDI2IDExOjEzIFBNLCBKZXJvbWUgQnJ1bmV0IHdyb3RlOgo+IFsgRVhURVJOQUwg
RU1BSUwgXQo+Cj4gT24gbHVuLiAxMSBtYWkgMjAyNiBhdCAyMDo0NywgSmlhbiBIdSB2aWEgQjQg
UmVsYXkgPGRldm51bGwramlhbi5odS5hbWxvZ2ljLmNvbUBrZXJuZWwub3JnPiB3cm90ZToKPgo+
PiBGcm9tOiBKaWFuIEh1IDxqaWFuLmh1QGFtbG9naWMuY29tPgo+Pgo+PiBsX2RldGVjdCBjb250
cm9scyB0aGUgZW5hYmxlL2Rpc2FibGUgb2YgdGhlIFBMTCBsb2NrLWRldGVjdCBtb2R1bGUuCj4+
Cj4+IEZvciBBOSwgdGhlIGxfZGV0ZWN0IHNpZ25hbCBpcyBhY3RpdmUtaGlnaDoKPj4gMCAtPiBE
aXNhYmxlIGxvY2stZGV0ZWN0IG1vZHVsZTsKPj4gMSAtPiBFbmFibGUgbG9jay1kZXRlY3QgbW9k
dWxlLgo+Pgo+PiBIZXJlLCBhIGZsYWcgQ0xLX01FU09OX1BMTF9MX0RFVEVDVF9BQ1RJVkVfSElH
SCBpcyBhZGRlZCB0byBoYW5kbGUgY2FzZXMKPj4gbGlrZSBBOSwgd2hlcmUgdGhlIHNpZ25hbCBp
cyBhY3RpdmUtaGlnaC4KPj4KPj4gU2lnbmVkLW9mZi1ieTogSmlhbiBIdSA8amlhbi5odUBhbWxv
Z2ljLmNvbT4KPj4gLS0tCj4+ICAgZHJpdmVycy9jbGsvbWVzb24vY2xrLXBsbC5jIHwgOSArKysr
KysrLS0KPj4gICBkcml2ZXJzL2Nsay9tZXNvbi9jbGstcGxsLmggfCAyICsrCj4+ICAgMiBmaWxl
cyBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2Nsay9tZXNvbi9jbGstcGxsLmMgYi9kcml2ZXJzL2Nsay9tZXNvbi9jbGst
cGxsLmMKPj4gaW5kZXggMWVhNjU3OWE3NjBmLi41YTBiZDc1Zjg1YTkgMTAwNjQ0Cj4+IC0tLSBh
L2RyaXZlcnMvY2xrL21lc29uL2Nsay1wbGwuYwo+PiArKysgYi9kcml2ZXJzL2Nsay9tZXNvbi9j
bGstcGxsLmMKPj4gQEAgLTM4OCw4ICszODgsMTMgQEAgc3RhdGljIGludCBtZXNvbl9jbGtfcGxs
X2VuYWJsZShzdHJ1Y3QgY2xrX2h3ICpodykKPj4gICAgICAgIH0KPj4KPj4gICAgICAgIGlmIChN
RVNPTl9QQVJNX0FQUExJQ0FCTEUoJnBsbC0+bF9kZXRlY3QpKSB7Cj4+IC0gICAgICAgICAgICAg
bWVzb25fcGFybV93cml0ZShjbGstPm1hcCwgJnBsbC0+bF9kZXRlY3QsIDEpOwo+PiAtICAgICAg
ICAgICAgIG1lc29uX3Bhcm1fd3JpdGUoY2xrLT5tYXAsICZwbGwtPmxfZGV0ZWN0LCAwKTsKPj4g
KyAgICAgICAgICAgICBpZiAocGxsLT5mbGFncyAmIENMS19NRVNPTl9QTExfTF9ERVRFQ1RfQUNU
SVZFX0hJR0gpIHsKPj4gKyAgICAgICAgICAgICAgICAgICAgIG1lc29uX3Bhcm1fd3JpdGUoY2xr
LT5tYXAsICZwbGwtPmxfZGV0ZWN0LCAwKTsKPj4gKyAgICAgICAgICAgICAgICAgICAgIG1lc29u
X3Bhcm1fd3JpdGUoY2xrLT5tYXAsICZwbGwtPmxfZGV0ZWN0LCAxKTsKPj4gKyAgICAgICAgICAg
ICB9IGVsc2Ugewo+PiArICAgICAgICAgICAgICAgICAgICAgbWVzb25fcGFybV93cml0ZShjbGst
Pm1hcCwgJnBsbC0+bF9kZXRlY3QsIDEpOwo+PiArICAgICAgICAgICAgICAgICAgICAgbWVzb25f
cGFybV93cml0ZShjbGstPm1hcCwgJnBsbC0+bF9kZXRlY3QsIDApOwo+PiArICAgICAgICAgICAg
IH0KPiBJJ20gbm90IGEgZmFuIG9mIHRoaXMgY29kZSBkdXBsaWNhdGlvbi4KPiBVc2UgdGhlIGlu
dHJvZHVjZWQgQ0xLX01FU09OX1BMTF9MX0RFVEVDVF9BQ1RJVkVfSElHSCB0byBjb21wdXRlIHRo
ZQo+IGZpcnN0IHZhbHVlLCB0aGVuIGZsaXAgdGhlIGJpdC4KCgpPaywgSSB3aWxsIHVwZGF0ZSB0
aGlzIGluIHRoZSBuZXh0IHZlcnNpb24uCgpIZXJlIGlzIHRoZSB1cGRhdGVkIGNvZGU6CgogwqAg
wqAgwqAgwqAgaWYgKE1FU09OX1BBUk1fQVBQTElDQUJMRSgmcGxsLT5sX2RldGVjdCkpIHsKIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIG1lc29uX3Bhcm1fd3JpdGUoY2xrLT5t
YXAsICZwbGwtPmxfZGV0ZWN0LAogwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
IShwbGwtPmZsYWdzICYgCkNMS19NRVNPTl9QTExfTF9ERVRFQ1RfQUNUSVZFX0hJR0gpKTsKIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIG1lc29uX3Bhcm1fd3JpdGUoY2xrLT5t
YXAsICZwbGwtPmxfZGV0ZWN0LAogwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
ISEocGxsLT5mbGFncyAmIApDTEtfTUVTT05fUExMX0xfREVURUNUX0FDVElWRV9ISUdIKSk7CiDC
oCDCoCDCoCDCoCB9Cgo+PiAgICAgICAgfQo+Pgo+PiAgICAgICAgaWYgKG1lc29uX2Nsa19wbGxf
d2FpdF9sb2NrKGh3KSkKPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2xrL21lc29uL2Nsay1wbGwu
aCBiL2RyaXZlcnMvY2xrL21lc29uL2Nsay1wbGwuaAo+PiBpbmRleCA5NDkxNTdmYjdiZjUuLjk3
YjdjNzAzNzZhMyAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9jbGsvbWVzb24vY2xrLXBsbC5oCj4+
ICsrKyBiL2RyaXZlcnMvY2xrL21lc29uL2Nsay1wbGwuaAo+PiBAQCAtMjksNiArMjksOCBAQCBz
dHJ1Y3QgcGxsX211bHRfcmFuZ2Ugewo+Pgo+PiAgICNkZWZpbmUgQ0xLX01FU09OX1BMTF9ST1VO
RF9DTE9TRVNUICBCSVQoMCkKPj4gICAjZGVmaW5lIENMS19NRVNPTl9QTExfTk9JTklUX0VOQUJM
RUQgQklUKDEpCj4+ICsvKiBsX2RldGVjdCBzaWduYWwgaXMgYWN0aXZlLWhpZ2ggKi8KPj4gKyNk
ZWZpbmUgQ0xLX01FU09OX1BMTF9MX0RFVEVDVF9BQ1RJVkVfSElHSCAgIEJJVCgyKQo+Pgo+PiAg
IHN0cnVjdCBtZXNvbl9jbGtfcGxsX2RhdGEgewo+PiAgICAgICAgc3RydWN0IHBhcm0gZW47Cj4g
LS0KPiBKZXJvbWUKCkJlc3QgcmVnYXJkcywKCkppYW4KCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51
eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
