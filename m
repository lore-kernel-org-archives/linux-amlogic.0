Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A6AAC54E58
	for <linux-amlogic@archiver.kernel.org>; Thu, 14 Mar 2024 03:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CqtBGurL1ZWY5pFULgdAhu50cDfSoSGoVo2GYLSVw1M=; b=b/e1cQx385I9La82FOHtPg6F9g
	ImnwOytYhLmFNe/frj8T1IBMsyuZOkBPcicNRCLB0Cqo06ldBITWQ+FU9z/jfFPOu9cKano+T0xvR
	liyzf+3trx+r7Qxk6AW0FnBDOjukZtoxn+LWfG+DTJ1e94G8coxXNqAdNY1v2b76vSU8m+gfjF7C0
	lIeSSnR8zAquFoUW8EPjaIBWyzFc8CJG0qdeojJRImYY1CJB/3NscZZdT8d0H2UvknTO5i0c1LWXc
	FPN+O9olJL/TYcmOPUXj2NmNxXt8SEyZCt6bpVDs8CxQoiw1KTp6nvWIaIygwMTgI1qa+Vxbbmwoz
	afykqLJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkbOV-0000000Ck59-35i5;
	Thu, 14 Mar 2024 03:04:35 +0000
Received: from mail-tyzapc01on20701.outbound.protection.outlook.com ([2a01:111:f403:2011::701] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkbOS-0000000Ck27-24ZL;
	Thu, 14 Mar 2024 03:04:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ve9KRKBv00vt47CWCZZBWW7t5tcdmczq+5fe9xDuCCQhrLdsTEEgvsfuz1P5sVDnClejnTV+yYMfwvUHFUoMqXiUGVnZpIXQutvELHoAPKRMysrw575VkH8i9Fu73PBEKhNycIOOUCbsboAAVRzL9ZiIJK5RDuiV9cnaVNaxoLIurpsgcvGBI4SBjJzXYTrF7Ig8VrvUEVVSvMv0DNN6HZiy+3u+cPrrh7s6tgHVCmrDhU5NhQ7n62PLzzqPnQV/LNagZLpYh7hS5Trt0GaEDnKRkSXNReE6/kk+Jw5DiAKsCQwys4a9h48K3HmtAOuoDkH+XqxyOhVA5/WJMNgelg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RmdSrnIhym/7uzdgNW/Waq/uHXJpRaKrD3lchFG93A8=;
 b=iBnBU6lNbW+2bbwt16IWOVzslQq9+NytjfoEb6+EAynCgI9mAX3CauHI76KAIkKalF3xGJZcegFAXUOfq1h4dihx/HUx0KwzQ6fkG6J09BK7UgsbndeVw5fFtA6yTlCNZ3qtvrBLi/2CXHiI+LCtQ7yTkQlaY+3V1veAKcatmGt9MYBjVN6+lV7SFogTVyaDx++d2iUXjAFV9MdAH9seMARkFaNu2O5gYTD+BI6VbYP9TVyvDn6HLw4kHhfZgriS5OY3y/ugzgYikXKLLuTb5+xAgzmYLOrE+XR5H73LbXG5L7H1mHil8evQxj9Rf3Pa+xlxMWpNBamCGoUFMUGs6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RmdSrnIhym/7uzdgNW/Waq/uHXJpRaKrD3lchFG93A8=;
 b=eMVCyYxXZxggBoJgaotgiGW6MjnWZX7ZqCB2koXqzgYcDWgHk1zzZ02A+bknq6X3IiDpKa9tkK3GCy0cZEtc+SnYC0tMfBmWBvGBEB+LyhS6JXcAOgTp5+9Z+WG5Sp5ET3s09FwbaKlPDbB4PXyELAaLY3LDgYeKspYfXtu9aSEZLPsDXx5FUFMF9+bW4cdUviLByrP3yuWLF9u1ptWxnuY0sXtJtd2MOmcdIU5k1b8VPX+TgJaoC7JXfYcR/eRQE6zW4cWLgVnb7MGzf0bdF2JKaOOREQWLKQ4bfW8twQrz0imBfGbvvej+afyNfamp7uIT9xLYVUEmDz/uqYz1CQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by KL1PR03MB7430.apcprd03.prod.outlook.com (2603:1096:820:cf::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.36; Thu, 14 Mar
 2024 03:04:16 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::5198:1b2f:8889:17b]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::5198:1b2f:8889:17b%4]) with mapi id 15.20.7362.035; Thu, 14 Mar 2024
 03:04:16 +0000
Message-ID: <3d2e488f-6191-4844-b5a7-2563898d4670@amlogic.com>
Date: Thu, 14 Mar 2024 11:04:10 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: add support for A4 based Amlogic BA400
Content-Language: en-US
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
References: <20240312-basic_dt-v1-0-7f11df3a0896@amlogic.com>
 <20240312-basic_dt-v1-3-7f11df3a0896@amlogic.com>
 <CAFBinCAvT6-gfZQH--AVJAxiVM9bv5=agYzJ-u3NZUGFvp2vZA@mail.gmail.com>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <CAFBinCAvT6-gfZQH--AVJAxiVM9bv5=agYzJ-u3NZUGFvp2vZA@mail.gmail.com>
X-ClientProxiedBy: SGBP274CA0002.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::14)
 To TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|KL1PR03MB7430:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d216171-a401-4b05-e8d9-08dc43d36f05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Apr4vzcm17/9F5ck5S8xrSffP7gwa6KZdhbtNSr8ER2Ck1lnx95xFWKdqJO/6jvNHjArJh+JfjLrVw3hPw6F4n9jTWoSYWQQQSeKI7yQxgHE1wmCNbyXURZhPQbEDCsVu48ga4+wBjcfAwCGpJI8FLN49eYMmvKMSzzgRpPcsGN1IQzzm35vbVSLvP1J+ku/s2pOPTN3lKyO9TTCtwy9Xq0h22CJG6D/j5VeQF0fvjPO84iy/SaEoNJ8BlL75p82RvvktFJ9g1cuO4KBL75aqzrYj90O5yBz/nfTU850Wnj6+fIdE4o+/+/SpSxqwOkTP9zEyVjxyES1H/oo9nd4qpbhG/gc1LTX/10c6Mx2wNrbGQAQRqCMBOAVeL1OSOyrWoHV7hdyiTHUfLuk/DgYLxB1FjEj997zq5hS0ecNRVxuNLsptdeoTHj7UbbJaUDe3ahrjgzrZdu/IhDlirzfnJH3RX6+rL4iFaIqkk5RDbchQL+PPBagcXAId/aX0anRb707pDEWj07DJqO1tn35wCF77km8B8Dv5Z3644+qWTQMLiwuxB1WbAhbsTZNjDZ1I5RJFDq7VCk7zatD9xRZEDk6T+zmh19rSzOjyMe89qB+heLHPUGGr/4nNb7NEZsokw2hsJsQt9Jn5VBm0vlrBLWAwc7X9Nm/wwudf3rRFEc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7416005)(1800799015)(376005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bU8zLzN2S0VINGk5NWp6c21VM1VlajhLY2dUdEhoU1Blc21xT000TXJ0VEhn?=
 =?utf-8?B?TUN4T3psQnVLZmJ5V054OEJYbGhodU5MUEx2VUVMSUI1bTQ0ZXhLZHJmTHhw?=
 =?utf-8?B?bE9pend3dzlrVlJ3bEFxL094b09NM1I2OW1WYUlWem96cmRoU0dXOVNDT01x?=
 =?utf-8?B?MUMxaFJkakxwaFZnUktFWTlIMGFuYUZ0TVlsQjZSSE04SWdkOXpCL2RYTlNP?=
 =?utf-8?B?eDExNGZiTTZiNnplUUNQOEFEdGp6QVY1djdEanE1V0hUWFd2aElxckxUTXdQ?=
 =?utf-8?B?S1FvbkhxQWVZbCtHMUNqMUtQbTNrUDBlZ0F4S2o4SUVBNmpoc0NKbHoyc0hZ?=
 =?utf-8?B?Z2IxVzdrVXdycEJWYzJyRzE1UjlGNjh0MjQxL1I5dUVUWE5kMWJwWFFWM1Iv?=
 =?utf-8?B?MGMzT01vQ0M4a1RMSDNaUnhtaTVOUlhkcXcwT0pkNUZQZVNsRDhsN0pwV2tE?=
 =?utf-8?B?U0tabiszY2N1WXRPbTMvTzhLVXNPYVZvb2ZRd0F4V1hsa3N6aEJyTVk5TUpp?=
 =?utf-8?B?VVVEdHZ4b3VOUGJ2WVAvTVVHUjNoNU5qQnRhdHJaNEFRSWV1aW90bE11Y2dl?=
 =?utf-8?B?Vkw0SXd2S1BycXpIUFpZVXh3azhJd1djWXo0UHVNanRVTVh6a25zMWYrRFVV?=
 =?utf-8?B?T1lxYklrRlVhc2NJRTdYR05veEFNQlhJL3Y3N0lkTERpZUZYRTdxMmdsZTc4?=
 =?utf-8?B?c3I4K0tUbzRYdXdmNjBTeDhWMHFvZ2ttOE5WOFBQb3dJclVjeGFaUVROTmJK?=
 =?utf-8?B?UXRRRlg2TjdDQ25wSmZ4R1o2RExkWGdzNWdFVU1uSW90UGtRUFRxalVEWHpL?=
 =?utf-8?B?M002MnA1enJCcUlvbm1iTWtrRnNuaE0xaE9qSWxnU2p5U3lNclNiSlg1ais4?=
 =?utf-8?B?VEJVeEkrRGxteWZ2cE9FUVFwWWxkdFMxRWpHdU1BWGxWL1kraVJHVHpIOVJy?=
 =?utf-8?B?QURBUHJjR0V4cWVKalpURFlaVzNvalgxRFd6RTNaSWpxbUJqL0xYTFdkQlht?=
 =?utf-8?B?L1ZBTDl6cU9YQ0gxOEdIVzc2WEs1RE1JeHVoSlVURzg0Y21uVXpkcUEzN0dP?=
 =?utf-8?B?MFd2TzZLZisvRlkzMmIyWnpLbmFNSjFET3F5U0tWdVk3ai93ZlhuNDJVOWpv?=
 =?utf-8?B?YWVHQ09ibXB4M2g2emc5YWtKcXlBVks3Yit5WGlLcEt6QkNkSEVVU3crOFF1?=
 =?utf-8?B?UDZTUlBUMGxReHVYaVlGV3FWcnNaUEpjcHJxZnBFWFA4am91RVl6c0FlUkZt?=
 =?utf-8?B?N2VYbC9zbGg0bnV6TUJKbno5YUtwWldzalJmclQwcFh4NEVORTFNR25XTHJN?=
 =?utf-8?B?ZUUzRXNkZnNrcGJlQjZRZjk4bTNqbERsVVZnR01DOC9seGxUMTNpM3k3dEpV?=
 =?utf-8?B?eWJhZ1RadldTSk8xR2J5L3c0ckhadkZsUS9qQVV4ZDNwWVIvQkJmQmIwRWtU?=
 =?utf-8?B?NGpCdUsyOFJDS1VjOXA3elFzTmVKRHZlUzBaaUo3cWhKT0hqSDJYT0MzTXpF?=
 =?utf-8?B?STBiN2xtOTJWdzZPRDVUMXhQYlRESmN1QlZYS2hCSDRzbW1pSXRCWmJremZX?=
 =?utf-8?B?UlV6VXlxWXNZTk9mTFo4bzhHUUR3SE9QT2hSK2xwREN5cGY1bUhYTjRnbmJ6?=
 =?utf-8?B?eWVWWnJqYXdrNk0xQ0JnWGV4TE5LZDFvMlU1UlZPeG1JWGJ6cXN0WHVQL0Qy?=
 =?utf-8?B?SFRubUxjZmo2b0NTSTFqbUFFT0xDSTBKNWd5cDhzU2ZPaTVHclZibUY5SUdD?=
 =?utf-8?B?YWMzN1NRTWpwdlFQSnhaT2pOL01pYlRZMERxY1dNN0ovdldYQTlkZGFETGRm?=
 =?utf-8?B?NDl4cU9YRlJmSkk2TmExd09WUlV5YkQ4NEdJYUY5aVFBRzVBTnI1RFNOVWhQ?=
 =?utf-8?B?c040RkZ1S2R3Q05qa052YitVVnExY2NPTHRiQ1A4anVhRWVHNDdTTllVMjJh?=
 =?utf-8?B?L3NmZ2VKcExQMjNqRC9STzFUc1BpVkp2Y0xvcVJoQjYxOG1hZnI1dkZwMEs3?=
 =?utf-8?B?a054NTlyL0RsWDhEYWVkZ1p5YmZHNDhjVDBoV1VQQUJUOUE1YU9xcWZPVU9q?=
 =?utf-8?B?OFVlbXJsYnZML0t4TFhxV2JBQVhKc25YVmlMWHN5L0lRZU53bjVZczkrUWVm?=
 =?utf-8?B?cVh3Y1Rwd0U0a2QrTGsxSHFBQVJNb2FLSWlyaFJCNW9GZDdmT3N6Y0RvbUlN?=
 =?utf-8?B?Smc9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d216171-a401-4b05-e8d9-08dc43d36f05
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2024 03:04:16.1321
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jF8YoY7OzdgaSYkjpLYJ1lXS6P6ym7ARzPyqSdm6FE6caVA6vRjIFOhWwJq0Bl5x4LCPFEGfmmnUmpAZ4nNjEG0NPPT/ctuBWtwbUSaITMI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB7430
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240313_200432_611135_DA788FC5 
X-CRM114-Status: GOOD (  16.14  )
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

SGkgTWFydGluLAogICAgVGhhbmtzIGZvciB5b3VyIHJldmlldy4KCk9uIDIwMjQvMy8xMyAwMToy
OSwgTWFydGluIEJsdW1lbnN0aW5nbCB3cm90ZToKPiBbIEVYVEVSTkFMIEVNQUlMIF0KPiAKPiBP
biBUdWUsIE1hciAxMiwgMjAyNCBhdCAxMDoxOeKAr0FNIFhpYW53ZWkgWmhhbyB2aWEgQjQgUmVs
YXkKPiA8ZGV2bnVsbCt4aWFud2VpLnpoYW8uYW1sb2dpYy5jb21Aa2VybmVsLm9yZz4gd3JvdGU6
Cj4gWy4uLl0KPj4gKyAgICAgICAgICAgICAgIGFwYkBmZTAwMDAwMCB7Cj4gTm9kZSBuYW1lcyBu
ZWVkIHRvIGJlIGdlbmVyaWMgLSBzaW5jZSB0aGlzIGlzIGEgYnVnIGl0IG5lZWRzIHRvIGJlOgo+
ICAgIGJ1c0BmZTAwMDAwMCB7Cj4gT3IgaWYgeW91IHdhbnQgdG8gbWFrZSBpdCBjbGVhciBob3cg
dGhpcyBidXMgaXMgY2FsbGVkIHRoZW4geW91IGNhbiB1c2U6Cj4gICAgYXBiOiBidXNAZmUwMDAw
MDAgewo+IApXaWxsIGZpeCBpdC4KPiBUaGUgc2FtZSBjb21tZW50IGFwcGxpZXMgdG8gdGhlIGFt
bG9naWMtYTUuZHRzaSBwYXRjaCAoNC80KS4KPiBBbmQgd2hpbGUgaGVyZSwgSSBmdWxseSBhZ3Jl
ZSB3aXRoIEplcm9tZTogaGF2aW5nIGEgYml0IG1vcmUgZGV0YWlscwo+IHdvdWxkIGJlIGdyZWF0
IHNvIHdlIGNhbiBqdWRnZSBvbiB3aGV0aGVyIGEgY29tbW9uIC5kdHNpIG1ha2VzIHNlbnNlLgo+
IEZvciB0aGlzIGl0IHdvdWxkIGJlIGhlbHBmdWwgdG8ga25vdyBob3cgbWFueSBJUCBibG9ja3Mg
dGhvc2UgdHdvIFNvQ3MKPiBoYXZlIGluIGNvbW1vbiBhbmQgaG93IG1hbnkgYXJlIGRpZmZlcmVu
dC4KPiAKVGhleSBhcmUgbW9zdGx5IHRoZSBzYW1lLCBidXQgdGhlIGZvbGxvdy1vbiBzZXJpZXMg
aXMgdW5jbGVhciwgYW5kIEkgCndvdWxkIGxpa2UgdG8gd2FpdCBmb3IgdGhlIGZvbGxvdy1vbiBj
aGlwcyB0byBjb21lIG91dCBiZWZvcmUgCmNvbnNpZGVyaW5nIGEgbWVyZ2VyIHdpdGggY29tbW9u
IGR0c2kgZmlsZS4KPiAKPiBCZXN0IHJlZ2FyZHMsCj4gTWFydGluCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlz
dApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
