Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3FBDC982CC
	for <linux-amlogic@archiver.kernel.org>; Sun, 20 Sep 2026 08:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Cc:To:From:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BKMpU+LVXEQ+olTmp+jbBx95GIM8dKSSmBsKSNeNAis=; b=XpCBExxKxLMPNS/VKFmtWauz8Q
	wdT8aGBufZmBtDfm7gHp85p2IR1YmNiZsY9WmFScDEu+MlZeQCydKt6+phB3Lw+30sH1Qz6zfkjY0
	j+Q6bIpkZEYmiKQx6yJE8CsFdZodsPMrsUU9whxbheRzvcL/oOu8iX62NswmHoMPZcMth6LQpFF0P
	kJ/jsjQCFWNeLXeOLoxqnhz4PyjOC/G9ydfoNTzyWy9QD7yDrXWh2Y4hiU2Mh5mHBU2XZEOt6xQG/
	D5j+j/Ky8Uxyxvuz0vevzPdV9YTz+LSJTUCw4tWSNym/YvgPHRL1xiYfgLHTF9ZFiEdZBB2lxyrjQ
	visYKBhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Coe-0000000H6LB-1kvy;
	Sun, 20 Sep 2026 08:22:28 +0000
Received: from mail-japaneastazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c405::5] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Cob-0000000H6Kj-2tvG;
	Sun, 20 Sep 2026 08:22:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xMoUr/mjtfo7K8DmTMB2tS2LO0dCw1CKMU0JCjQxtablOmp6bys2jBjB/10cnoCkblzsQ8a4cn+i4U5KBlehOcjtQlWWCQQuoAnFW+5xVotN6ddR1I9IQzwfQ7lLx5IncHSNiJctncQt9sSC2id3BiFBASvI1dRfPxcvYZkvZbdU05UhDgcMY5sHLY0C9eEaT+9IEbSH25gAwAJjLPG4YB8MisjF/hkZfFbGzf2C7SsM8KwhVm6A012dDZ4Uh/YxDR9VayOPVWRzU3CPMM0cFhAMC16pgGk3eqm+LZCx0ldWgsU7kmJN8IzJp+Tu3HTqWiMalq7rcQ/ETJ/8e0Q3JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LQiugX6KGIMCU1p+cKlXt5BpMDGezJZkqwRlbpQS7dM=;
 b=hfFsoTJBTEZetBxFi9BHYVKVxEN4S800r4/ibsGFxj1Uxql8fcYSMJgWldbNyShUqkKQRcv+B471X3m8pHWDVqwXxFkiNaDkhfVvDLynWA08lsAiWPhBVqErLOqXPzmrUUM+hrwU2E4xTMnjroXNu3RLUSqSZvNg0P5wIg3YFCvorHvWtm3YG5bLH3xQx2vpC60ieOSZpPdymrU+Y4K0WuRLRNPVm/JCNMPygcNuvML70tA0CyyQ0B6aDO/wxFB02qbM4aNx/NcQ+NHq3gBOW4n3R+qFma6XC8IEtZccf20hEDLnBJEFUrZUu86bacgPZ965hw4Vy7mQ6hwyH+blSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LQiugX6KGIMCU1p+cKlXt5BpMDGezJZkqwRlbpQS7dM=;
 b=FKjbsd1cA1I6Ew4/1fGlUWiH+/sOFQeXBIFHM8gZUFjfwfvOjQLuh42bNthZ5a1I5Vd9CLUY6sG/Ubatjyqk5aM/SW1oe6P02Oto/hemHAS/0+jPiU+QAacV+9po0S6stfjaoy9Lbvbsv4QuOwQj2zoXDfFnKB4QIUikb3p83EiAJJAiTaSpICF+b8JVyQZ6i2Mq7CCCTtMC5lHxyC72pdFhNZlc31YsxcIneI28KQ8MdKoOUfbg4Ih9putXu5kTDJ3kuS6YvtmUdGbC53kilR9UoAvSz4bwbd2sYAJadwlj7z8keRGuhY89wL+2oMppXD/cLJiVtoz1ewzSubJ7kg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com (2603:1096:820:ca::7)
 by PUZPR03MB7015.apcprd03.prod.outlook.com (2603:1096:301:f2::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Sun, 20 Sep
 2026 08:22:15 +0000
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506]) by KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506%3]) with mapi id 15.21.0428.011; Sun, 20 Sep 2026
 08:22:15 +0000
Message-ID: <f518be12-9c96-4415-b442-4afcbc5b5d36@amlogic.com>
Date: Sun, 20 Sep 2026 16:22:08 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/10] clk: amlogic: Support POWER_OF_TWO for PLL
 pre-divider
From: Jian Hu <jian.hu@amlogic.com>
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
 <c9c4945f-cdfc-4382-b8ca-71b69d91deb4@amlogic.com>
In-Reply-To: <c9c4945f-cdfc-4382-b8ca-71b69d91deb4@amlogic.com>
X-ClientProxiedBy: SE2P216CA0133.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c7::13) To KL1PR03MB7149.apcprd03.prod.outlook.com
 (2603:1096:820:ca::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB7149:EE_|PUZPR03MB7015:EE_
X-MS-Office365-Filtering-Correlation-Id: ac292b9a-fa2d-49e0-c6ae-08df16f046f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|376014|7416014|366016|3023799007|6133799003|10067099003|56012099006|5023799004|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: jRquFaxp7rJmK3riJoqazrV6H8D3XHUqlokthRxTp5yVEB4ZxcPR7izbHBnkezlhgabUsY3EqLnf3D/PA4Zn+GTVodNmD+QY91+i8Ig/2gPsWoMhmXK8Z2ryTz5GZMsM0kCZRqE+sUVMQb6DK8wa2HnGH0mJ/MC/0xTBhUOHPkiM0owTTkv5mnFPZzUC5MtPnaus6PU2TgISDqqEFkrAwHsUvmzMkdpzKlSXKebSYwJog3egUF9uCWxNGqrwCbEJdfJXgfv8hBmEqvv73qfQFK0m0whP/QXn3qxImhphzYqC+yTujUaPKo2J2c+7qpWzJTP48fwAv4ymAFXweNE6bakyxwvyvgd5vMw+P919vYQ5Zfsbz7d05+TFyt0uFBOm4opiHq81gcW9x6d58nKeAzelDXW492I0J9zEalutf4isq9gt5kM1drg78MlpBwGalaLPmukQALI5PjjGBE+EWQ8b3gpNkdWli2E6GGlB6IKzqdNV72JlYmTD+bi6KVcNk2VUjXRqkPmHUgtYttvsp8nBh5x0xZYa6F4+XZN+waom4bsEWQH993BtBGwd0ehQ9tSAXMqEdPB1bzgXm5myGVq092lxKrjB18289mDwPuBz0agclEfPFuF8G1+4r5OiO2nQy4OK18hHunpDgGNVf++zajQD2yAOtS8EBc2pTJI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB7149.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(7416014)(366016)(3023799007)(6133799003)(10067099003)(56012099006)(5023799004)(11063799006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VGZieVdtZUVkZWg2VUp2WXFwbzRKOFNPdkNxVisrdVpzbnJWaSsva05XWkdv?=
 =?utf-8?B?bkx6cUFaYUt0Q29XVytQTzc1YUo0T3RIQ2ZtU0tkNjJSeVBER2VlZTMyRWtu?=
 =?utf-8?B?OEFZV01ydzVBR3hKdlBadTNZbjRlc2R4K010WEFWNXdJek9RQk1VY0tBbHpj?=
 =?utf-8?B?YTBFS1c1RUR1Q0pFZTlka3BWN2pZZjFmQ25kanBMekJCREt3QzJZekRNT1dI?=
 =?utf-8?B?emJxalh6MWRZK05hb0J3OUtPdFhBcVVvSStlSTdsSVd0cXhsN0phTkdhTnli?=
 =?utf-8?B?b3l2dGtOVGZ1TlR2L3VQMXZoMUhHc0JkdDAwM2xvTVBVUE5JeVN0T0FHTDNW?=
 =?utf-8?B?a0lBWW9LMjJ3ZDF4dDlrWWVmWk1iZlZhNHpNWHJYcE9zQyszUmpOQUJwcE9v?=
 =?utf-8?B?U1dJdjlNQXJaV2FRWERibFhtR3BtUEZhNC9pcnp6ZW9lUHg5emtaVnU5TGJD?=
 =?utf-8?B?VDdpZ1l5dUI5eTRNcWcweE9INzZYMGtzbklYTHZCTjJnWFlodzM1d0kyYnZK?=
 =?utf-8?B?elhTb2ZoVkpBQjgvODVMUkVLRSswVEQ4Q3NiSWlKQklJQWhJUklDM0FtL00v?=
 =?utf-8?B?YjM2d1RsQlhOWTkyRE92UjEyWmZmZ0JaQ20wWWVPVlpGdThyem1XVm1xcjky?=
 =?utf-8?B?SnY3bHR1dXQzTktZY29oQm91bmoyVDNjaTd1NExVbXlvWC9iVzFlUnNKUS9N?=
 =?utf-8?B?bzM2YnhJMGZsZXlLcmt4T2VyU09PNmVZTFkzWGRMb0Z5dlJ3aTFUdEplMEpP?=
 =?utf-8?B?blZZTVJTdW1PZHNUVUh6ZlhrYitpUHJvUmlKNTZqdU1DWWFKejZtK0w5andZ?=
 =?utf-8?B?YzVtU3VkY1B4N2h4TkVRMW82ekliLzBiVEJjaUIyZ3pvVmlNeUUzY01RWU5G?=
 =?utf-8?B?QXVFUnB2SUJsNzdJMTUyYVBJNUtOZi9abVNnTVhFSWRRMXBFbDdOL3FuajdK?=
 =?utf-8?B?eFY1RmhPMy84Zkp3V3BaNC9lUU82TkVmYnZyTUhBdmRkRzlVQW16WWJCVmFW?=
 =?utf-8?B?eHczU2tCL3VXcTNkUUpOYmR1LzBFNXNjL3h1WU9uTWdCSkttYWJySVRqZUhT?=
 =?utf-8?B?Z1NmWWgwS3VsMjJ4RkN4dVBPNVJlNmtpNTdRaXUwYS93MDc4TWlmMEsxa082?=
 =?utf-8?B?Z0VvbE1WRXpoR2tGR244Y1hJWVA4d3ZTRjBaTkhFR1ZDdXdMK21ITHNaSmNT?=
 =?utf-8?B?UnYxeFkvTCtjeVI4TVVRZ0V2VWhvc0IvTDlrTmgxWVdXTjJDN2YwT1VyNWJs?=
 =?utf-8?B?Z3oxSTMzTktMWUVBNFN6b2NpSWExcTltTldpaW5KZm1sK1g5Y1dRdElkOGNJ?=
 =?utf-8?B?dmE2Ui9UbHhYSXVuSzRMMTkwMkFHNU5HNXBUblpGVTFJaGErZmJ0Q0hXWWR2?=
 =?utf-8?B?TEViVnRrRGcrbytScU16TTcrL20zUWI1NzNFNlk2VDlaYWFINEhMN3AxZ2Y5?=
 =?utf-8?B?M1dOWmt6VncveFM0TjdKUjZtdjdCbTFGbUQyODVUUXM2L3FJN1dObE1xR1JN?=
 =?utf-8?B?NjJ5blRDdTZmdWt4M20zYmlZSTdlcXNoWjNmckdJUHF5NWVYVy82K21tVWJG?=
 =?utf-8?B?Q2o4dWhvNlNHNU9VVER3U2pVcmNjOGhvU3NsTksrUUNHNktnOW5WR2RmMEpo?=
 =?utf-8?B?aTAwSG85TnBuMjFXeS9GSUVlaXFLWStiOFRxcGtQVERtOENMdWZ4SHh2YzJF?=
 =?utf-8?B?N1dRekVlZmlpWWlpUW4zT3Frb0tsanowSDZiM0Q2emM3RDRsbE96RStRRnJt?=
 =?utf-8?B?cjZsaGtGb1BqUFJsZy9xOTdZTTluZ3ZNTFlpOWNxM2pUY2g1L2xhYTFFTFhv?=
 =?utf-8?B?anZqUG9WNVZVYzZIdjg0aHp5Yzh4d1pLdy9WUmNpTTdkcEV2MFptZVpVZWtC?=
 =?utf-8?B?SnZJZFhwcmIwK0RtTGF3dVgzQXUyOWlwdmR4V0Zjb2RsdUY1dDZ3RnZkUnVk?=
 =?utf-8?B?eDNZUlBMaHBWQUUvQnRYekNmelFBdU5uYnRrS0RWaFFlSkIxVXVOL2s2b3Bq?=
 =?utf-8?B?ZEZBWEdKbk40Wlh0VVovb3VOeWNhb0FvR0FUSGtNL0NIcDh3cWRZKzhSamhW?=
 =?utf-8?B?Qjl6dVRneU5VVWo3SldEdHUyNFgxSy9GVXRIcUJOZkVRdDhmeXF5QjM4K2VD?=
 =?utf-8?B?em1YSWtWSDNwN01VTWxiQ3FGNVBOUlB6NzV2ZVh4T0c0bWUzUkdFSXNsTEtU?=
 =?utf-8?B?c2kzUE5IdVNhL3FhVmQyWi95L0IvV3o2THlkb0hBSmhuQ2hIN2ZaK0NYMGRF?=
 =?utf-8?B?LzhudCsrZ2NEQzI3ZVdWOHZqUkFKMnVobDFwazR2UWl0aTN3eXZOalFwMThH?=
 =?utf-8?B?aG4ralVGa0d1b0Q4bWVMblEvRlRKQmpZSnd1UzArcFZxQU1xNTVQdz09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac292b9a-fa2d-49e0-c6ae-08df16f046f0
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB7149.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2026 08:22:14.9799
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SZrFr1jixGDD1UiyUBqjJnaPGUnLqdEkHpH2vuLmgSUYGabWbx9KwMwMoBvYO8q1Dx6gqrxtNOdGa2G7pVnxkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR03MB7015
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_012225_874926_7D184128 
X-CRM114-Status: GOOD (  29.26  )
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

Ck9uIDUvMjkvMjAyNiAzOjA4IFBNLCBKaWFuIEh1IHdyb3RlOgo+IE9uIDUvMjYvMjAyNiA4OjI3
IFBNLCBKZXJvbWUgQnJ1bmV0IHdyb3RlOgo+PiBbIEVYVEVSTkFMIEVNQUlMIF0KPj4KPj4gT24g
bWFyLiAyNiBtYWkgMjAyNiBhdCAxNzo1OCwgSmlhbiBIdSA8amlhbi5odUBhbWxvZ2ljLmNvbT4g
d3JvdGU6Cj4+Cj4+PiBPbiA1LzIwLzIwMjYgMzozNSBQTSwgSmVyb21lIEJydW5ldCB3cm90ZToK
Pj4+PiBbIEVYVEVSTkFMIEVNQUlMIF0KPj4+Pgo+Pj4+IE9uIG1lci4gMjAgbWFpIDIwMjYgYXQg
MTM6NDcsIEppYW4gSHUgPGppYW4uaHVAYW1sb2dpYy5jb20+IHdyb3RlOgo+Pj4+Cj4+Pj4+IE9u
IDUvMTQvMjAyNiAxMToxMSBQTSwgSmVyb21lIEJydW5ldCB3cm90ZToKPj4+Pj4+IFsgRVhURVJO
QUwgRU1BSUwgXQo+Pj4+Pj4KPj4+Pj4+IE9uIGx1bi4gMTEgbWFpIDIwMjYgYXQgMjA6NDcsIEpp
YW4gSHUgdmlhIEI0IFJlbGF5IAo+Pj4+Pj4gPGRldm51bGwramlhbi5odS5hbWxvZ2ljLmNvbUBr
ZXJuZWwub3JnPiB3cm90ZToKPj4+Pj4+Cj4+Pj4+Pj4gRnJvbTogSmlhbiBIdSA8amlhbi5odUBh
bWxvZ2ljLmNvbT4KPj4+Pj4+Pgo+Pj4+Pj4+IFRoZSBBOSBQTEwgcHJlLWRpdmlkZXIgdXNlcyBh
IGRpdmlzaW9uIGZhY3RvciBvZiAyXm4gdG8gZW5zdXJlIGEgCj4+Pj4+Pj4gY2xvY2sKPj4+Pj4+
PiBkdXR5IGN5Y2xlIG9mIDUwJSBhZnRlciBwcmVkaXZpc2lvbi4KPj4+Pj4+Pgo+Pj4+Pj4+IEFk
ZCBmbGFnICdDTEtfTUVTT05fUExMX05fUE9XRVJfT0ZfVFdPJyB0byBpbmRpY2F0ZSB0aGF0IHRo
ZSBQTEwKPj4+Pj4+PiBwcmUtZGl2aWRlciBkaXZpc2lvbiBmYWN0b3IgaXMgMl5uLgo+Pj4+Pj4g
SSB1bmRlcnN0YW5kIHdoYXQgeW91IGFyZSBkb2luZyBoZXJlIGJ1dCBJIGhhdmUgdG8gYXNrIHdo
eSB0aGlzIAo+Pj4+Pj4gY2FuJ3QgYmUKPj4+Pj4+IGltcGxlbWVudGVkIHdpdGggaW5kZXBlbmRl
bnQgZGl2aWRlcnMgdGhhdCBhbHJlYWR5IHN1cHBvcnRzIHBvd2VyIAo+Pj4+Pj4gb2YgMiA/Cj4+
Pj4+IElmIHdlIHVzZSBpbmRlcGVuZGVudCBkaXZpZGVycywgdGhlIG4gbWVtYmVyIHdvdWxkIGhh
dmUgdG8gYmUgCj4+Pj4+IHJlbW92ZWQgZnJvbQo+Pj4+PiBtZXNvbl9jbGtfcGxsX2RhdGEuCj4+
Pj4+Cj4+Pj4+IEhvd2V2ZXIsIG4gaXMgcmVmZXJlbmNlZCAzNSB0aW1lcyBpbiBjbGstcGxsLmMs
IHdoaWNoIG1lYW5zIHdlIAo+Pj4+PiB3b3VsZCBuZWVkCj4+Pj4+IHRvIG1vZGlmeSBhbGwKPj4+
Pj4gcmVsYXRlZCBsb2dpYyBhY3Jvc3MgdGhlIGZpbGUuIFRoaXMgd291bGQgYmUgYSByZWxhdGl2
ZWx5IGxhcmdlCj4+Pj4+IGNoYW5nZS4KPj4+PiBZZXMKPj4+Pgo+Pj4+PiBNb3Jlb3ZlciwgZm9y
IGFsbCBBbWxvZ2ljIGNoaXBzLCB0aGUgbiBkaXZpZGVyIGlzIGFuIGluZGlzcGVuc2FibGUgCj4+
Pj4+IHBhcnQgb2YKPj4+Pj4gdGhlIERDTyBjbG9jay4KPj4+PiBUaGVyZSBpcyBoYXJkbHkgYSBq
dXN0aWZpY2F0aW9uIGhlcmUKPj4+Pgo+Pj4+PiBUaGUgZGlmZmVyZW5jZSBiZXR3ZWVuIFNvQyBn
ZW5lcmF0aW9ucyBpcyBhcyBmb2xsb3dzOgo+Pj4+PiDCoMKgwqDCoMKgIFByZXZpb3VzIFNvQ3Mg
UExMOiBuID0gMSwgMiwgMywgNC4uLiAobGluZWFyIGRpdmlkZXIpCj4+Pj4+IMKgwqDCoMKgwqAg
QTkgU29DIFBMTDrCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG4gPSAyXjAsIDJeMSwgMl4yLCAyXjMs
IDJeNC4uLiAKPj4+Pj4gKHBvd2VyLW9mLXR3bwo+Pj4+PiBkaXZpZGVyKQo+Pj4+IFllcyB0aGF0
IHdhcyBmYWlybHkgb2J2aW91cwo+Pj4+Cj4+Pj4+IFRoZXJlZm9yZSwgc3BsaXR0aW5nIG91dCB0
aGUgbiBkaXZpZGVyIGZyb20gdGhlIERDTyBjbG9jayBtaWdodCAKPj4+Pj4gbm90IGJlIGEKPj4+
Pj4gZ29vZCBkZXNpZ24gY2hvaWNlLgo+Pj4+IEknbSBub3Qgc3VyZSBJIGFncmVlIGFuZCB5b3Un
dmUgb25seSBzdGF0ZWQgeW91ciBwb2ludCBvZiB2aWV3IHdpdGhvdXQKPj4+PiBwcm92aWRpbmcg
YW55IHRlY2huaWNhbCBqdXN0aWZpY2F0aW9uIGhlcmUuCj4+Pj4KPj4+PiDCoCBGcm9tIHRoZSBk
YXRhc2hlZXRzIG9mIHRoZSBkaWZmZXJlbnQgU29DIHdlIGhhdmUsIHRoZSBkb2N1bWVudGVkCj4+
Pj4gbGltaXRhdGlvbiBpcyBhbHdheXMgdGhlIERDTyBvdXRwdXQgcmF0ZSByYW5nZS4gTm90aGlu
ZyByZWxhdGVkIHRvIAo+Pj4+IG4gKG9yCj4+Pj4gbSwgb3IgdGhlIG11bHQtcmFuZ2UgZm9yIHRo
YXQgbWF0dGVyKS4gVGhpcyBpcyBhIGxlZ2FjeSBwcm9ibGVtLCB3ZQo+Pj4+IHN0YXJ0ZWQgd2l0
aCBtb25vbGl0aGljIGRyaXZlciBhbmQgc2xvd2x5IHNpbXBsaWZpZWQgaXQuCj4+Pj4KPj4+PiBB
cyBmYXIgYXMgSSBjYW4gc2VlIG5vdywgcmV3b3JraW5nIHRoZSBQTEwgZHJpdmVyIHRvIGJlIGEg
c2ltcGxlCj4+Pj4gbXVsdGlwbGllciBkcml2ZXIgd2l0aCByYW5nZSBvdXRwdXQgcmF0ZSBjb25z
dHJhaW50IGNvdWxkIGFjdHVhbGx5IGJlCj4+Pj4gc2ltcGxlciB0aGFuIHRoZSBjdXJyZW50IGNv
ZGUuIEkgd291bGQgYWxzbyBtYWtlIHNpbXBsZXIgdG8gYWNjb21vZGF0ZQo+Pj4+IGRpZmZlcmVu
Y2VzIHN1Y2ggYXMgdGhlIG9uZSBwcmVzZW50ZWQgaGVyZS4KPj4+Pgo+Pj4+IFVubGVzcyB5b3Ug
Y2FuIHByb3ZpZGUgdGVjaG5pY2FsIHJlYXNvbnMgd2h5IGdvaW5nIGluIHRoaXMgZGlyZWN0aW9u
Cj4+Pj4gd291bGQgYmUgaW5jb3JyZWN0LCB0aGF0J3Mgd2hlcmUgSSdkIHByZWZlciB0byBnby4K
Pj4+Pgo+Pj4+PiBbLi4uXQo+Pj4+Pgo+Pj4+PiBCZXN0IHJlZ2FyZHMsCj4+Pj4+Cj4+Pj4+IEpp
YW4KPj4+PiAtLSAKPj4+PiBKZXJvbWUKPj4+Cj4+PiBJIGFncmVlIHRoYXQgaGF2aW5nIGFuIGlu
ZGVwZW5kZW50IE4gZGl2aWRlciB3b3VsZCBzaW1wbGlmeSB0aGUgUExMIAo+Pj4gcmF0ZQo+Pj4g
Y2FsY3VsYXRpb24uCj4+Pgo+Pj4gQSBzZXBhcmF0ZSBwcmUtZGl2aWRlciBmb3IgTiBpcyB0ZWNo
bmljYWxseSBwb3NzaWJsZSwgYnV0IHRoZXJlIGFyZSAKPj4+IHNvbWUKPj4+IGhhcmR3YXJlIGNv
bnN0cmFpbnRzIHRoYXQgbmVlZCB0byBiZSBjb25zaWRlcmVkOgo+Pj4KPj4+IE4gPSAxIGlzIHRo
ZSBwcmVmZXJyZWQgb3BlcmF0aW5nIG1vZGUgZXhjZXB0IGEgZmV3IGZpeGVkLWZyZXF1ZW5jeSAK
Pj4+IFBMTHMuCj4+PiBMYXJnZXIgTiB2YWx1ZXMgcmVkdWNlIHRoZSBQTEwgcGhhc2UgZGV0ZWN0
b3IgZnJlcXVlbmN5LCB3aGljaCBtYXkKPj4+IG5lZ2F0aXZlbHkgaW1wYWN0Cj4+PiBqaXR0ZXIg
cGVyZm9ybWFuY2UgYW5kIG92ZXJhbGwgUExMIHN0YWJpbGl0eS4KPj4gVW5kZXJzdG9vZC4gWW91
IGNvdWxkIHJlYWxseSBtYWtlIGEgZGlmZmVyZW5jZSBieSBnb2luZyBkZWVwZXIgYW5kCj4+IGV4
cGxhaW5pbmcgd2hhdCB0aG9zZSBjb25zdHJhaW50cyBhcmUsIGVzcGVjaWFsbHkgc2luY2UgeW91
IGFzayBxdWVzdGlvbgo+PiBpbnRlcm5hbGx5IGF0IEFtbG9naWMuCj4+Cj4+IEF0IHRoZSBtb21l
bnQgd2hhdCBpcyBkb2N1bWVudGVkIGlzIGEgcmFuZ2UgcmVnYXJkaW5nIHRoZSBvdXRwdXQgcmF0
ZSBvZgo+PiB0aGUgUExMcy4gQSBQTEwgaXMgbWFkZSBvZiBhIHByZS1kaXZpZGVyIGFuZCBmcmFj
dGlvbmFsIG11bHRpcGxpZXIuCj4+IGFuZCB5b3UgYXJlIHNheWluZyB0aGF0IGZvciB0aGUgbXVs
dGlwbGllciB0byB3b3JrIGFuZCBsb2NrLCB0aGVyZSBpcwo+PiBhY3R1YWxseSBhIGNvbnN0cmFp
bnQgdGhlIGlucHV0IHJhdGUgdG9vLgo+Pgo+PiBJZiB5b3UgY2FuIGRpc2N1c3Mgd2l0aCB5b3Vy
IEhXIHRlYW0gYW5kIGNsYXJpZnkgd2hhdCB0aGUgY29uc3RyYWludHMKPj4gcmVhbGx5IGFyZSwg
dGhhdCB3b3VsZCBoZWxwIHRvIGJldHRlciBtb2RlbCB0aGUgUExMLiBJbiB0aGVuIG1vcmUgbGlr
ZWx5Cj4+IGZvciB1cyB0byBmaWd1cmUgb3V0IHRoZSBiZXN0IHdheSB0byBkcml2ZSBpdC4KPgo+
Cj4gSSBoYXZlIGRpc2N1c3NlZCB3aXRoIHRoZSBIVyBQTEwgdGVhbS4gQW5kIGhlcmUgaXMgdGhl
IGRpc2N1c3Npb24gCj4gcmVzdWx0czoKPgo+IFdoZW4gTiBpbmNyZWFzZXMgYnkgYSBmYWN0b3Ig
b2YgWCwgdGhlIFBMTCBiYW5kd2lkdGggZGVjcmVhc2VzIGJ5IGEgCj4gZmFjdG9yIG9mIFgsCj4g
ZGV2aWF0aW5nIGZyb20gdGhlIGRlZmF1bHQgb3B0aW1hbCBiYW5kd2lkdGgsIHdoaWNoIGxlYWRz
IHRvIGEgCj4gZGVjcmVhc2UgaW4KPiBjbG9jayBwZXJmb3JtYW5jZSBhbmQgYWZmZWN0cyB0aGUg
c3RhYmlsaXR5IG9mIGNsb2NrLWRlcGVuZGVudCBtb2R1bGVzIAo+IGluIHRoZSBjaGlwLgo+Cj4+
Cj4+PiBCZWNhdXNlIG9mIHRoaXMsIHdlIGNhbm5vdCBndWFyYW50ZWUgc3RhYmxlIHN5c3RlbSBv
cGVyYXRpb24gd2hlbiAKPj4+IGFyYml0cmFyeQo+Pj4gbGFyZ2VyCj4+PiBOIHZhbHVlcyBhcmUg
dXNlZC4KPj4+Cj4+PiBTb21lIFBMTHMgcmVxdWlyZSBub24tMSBOIHZhbHVlcyB0byBnZW5lcmF0
ZSBzcGVjaWZpYyBmaXhlZCBvdXRwdXQKPj4+IGZyZXF1ZW5jaWVzIGJlY2F1c2UKPj4+IHRoZSB0
YXJnZXQgcmF0ZSBjYW5ub3QgYmUgYWNoaWV2ZWQgd2l0aCBOID0gMSB3aGlsZSBrZWVwaW5nIHRo
ZSBQTEwgCj4+PiB3aGlsZQo+Pj4ga2VlcGluZyB0aGUKPj4+IFBMTCB3aXRoaW4gaXRzIHZhbGlk
IG9wZXJhdGluZyByYW5nZS4gU28gTiBpcyBkZXNpZ25lZCB0byBoYXZlIG90aGVyIAo+Pj4gdmFs
dWVzCj4+PiDigIvigIt0bwo+Pj4gc2F0aXNmeSB0aGlzIHJlcXVpcmVtZW50Lgo+PiBBZ2FpbiBp
dCBzZWVtcyBsaWtlIHRoZSBjb25zdHJhaW50cyB3ZSBhcmUgdXNpbmcgYXJlIG5vdCB0aGUgcmVh
bAo+PiBsaW1pdGF0aW9uLCBqdXN0IGJ5LXByb2R1Y3RzLCB3aGljaCB0aGUgc2l0dWF0aW9uIHVu
Y2xlYXIuCj4KPgo+IFdoZW4gTj0zLCB0aGlzIHR5cGUgb2YgUExMIGlzIGRlc2lnbmVkIHdpdGgg
dGhlIG9wdGltYWwgYmFuZHdpZHRoIAo+IGJhc2VkIG9uIE49My4KPgo+Pj4gRm9yIGV4YW1wbGUs
IHRoZSBBWEcgUENJZSBQTEwgdXNlcyBOID0gMyB0byBnZW5lcmF0ZSB0aGUgcmVxdWlyZWQgCj4+
PiAxMDAgTUh6Cj4+PiBvdXRwdXQgZnJlcXVlbmN5LAo+Pj4gc2luY2UgdGhlIHRhcmdldCBmcmVx
dWVuY3kgY2Fubm90IGJlIGFjaGlldmVkIHdpdGggTiA9IDEuCj4+Pgo+PiBQQ0llIGlzIGEgdG9w
aWMgaW4gaXRzZWxmLiBJdCB1c2VzIGRpZmZlcmVudCBvcHMgZm9yIGhpc3RvcmljIHJlYXNvbnMg
Cj4+IHRob3VnaAo+PiBJIHN1c3BlY3QsIHdpdGggcHJvcGVyIGNvbnN0cmFpbnRzLCBpdCB3b3Vs
ZCBub3QgcmVhbGx5IG5lZWQgdG8uCj4KPgo+IFBDSWUgaGFzIGEgc3RyaWN0IHByb3RvY29sIHRo
YXQgbXVzdCBiZSBmb2xsb3dlZC4gSXQgaXMgYWxzbyBhIGhpZ2hseSAKPiBzZW5zaXRpdmUgYmxv
Y2sKPiB3aXRoIGh1bmRyZWRzIG9mIGNvbXBsZXggYW5kIHN0cmluZ2VudCBsYWIgdGVzdCByZXF1
aXJlbWVudHMuCj4KPiBUaGUgUENJZSBQTEwgbG9jayBzZXF1ZW5jZSBuZWVkcyB0byBmdWxseSBm
b2xsb3cgdGhlIEFtbG9naWMgSFcgdGVhbSdzIAo+IHJlbGVhc2VkIGRlbW8gY29kZS4KPj4+IEFk
ZGl0aW9uYWxseSwgaXMgdGhlIHJlZmFjdG9yZWQgcHJlLWRpdmlkZXIgTiBpbXBsZW1lbnRlZCBh
cyBhIHNlcGFyYXRlCj4+PiBwYXRjaHNldCwKPj4+IGluZGVwZW5kZW50IGZyb20gdGhlIEE5IFBM
TCBjaGFuZ2VzPwo+PiBJIGNvdWxkIGJlIHNlZW4gYXMgYSBwcmUtcmVxdWlzaXRlLgo+Cj4KPiBV
bmRlcnN0b29kLgo+CgpSZWdhcmRpbmcgdGhlIHN1Z2dlc3Rpb24gdG8gcmVtb3ZlIE4gZnJvbSB0
aGUgRENPIGFuZCBtYWtlIGl0IGEgc2VwYXJhdGUgCnByZXNjYWxlciwKCkkgaGF2ZSBhIGxvY2Fs
IGRyYWZ0IGZvciB0aGlzIGNoYW5nZS4gV291bGQgeW91IGxpa2UgbWUgdG8gc2VuZCBpdCBhcyBh
IApmb2xsb3ctdXAgcGF0Y2gsCgpvciBhcmUgeW91IHBsYW5uaW5nIHRvIGFkZHJlc3MgaXQ/Cgo+
Pj4KPj4+IEJlc3QgcmVnYXJkcywKPj4+Cj4+Pgo+Pj4gSmlhbgo+PiAtLSAKPj4gSmVyb21lCj4K
Pgo+IEJlc3QgcmVnYXJkcywKPgo+Cj4gSmlhbgoKLS0KCkppYW4KCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlz
dApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
