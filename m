Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D573C606A320
	for <linux-amlogic@archiver.kernel.org>; Wed, 11 Nov 2026 02:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lCT8KroZ;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=amlogic.com header.i=@amlogic.com header.a=rsa-sha256 header.s=selector1 header.b=a5zUDqL/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=X6Y43LKqHOvJ+55aZ511gnUZyohhBF4av4nHwM6AQAI=; b=lCT8KroZK+VLJBWdeGFr6OiW5p
	jz5NOa26l4kS15KB7dPNf3G/S2fcyfDkvxxmky+MKVjMXgbRd4CApuckk/9wh727VhttiSd3HMZ06
	YJj4RtMo/3ydsj/eos/ciQY4TRaEDj6JBCwTb4ouWe+RS/q5yUUwkgdVPLPZZzjiRoGjYR46o7EkU
	erpeudu4XLx6ZZb2AfRwuZ8tTRqUdoCoPMCWJrJ6PAjSjEGaCEFad4AcTYOwdGpQ8Gy7jx17BJudb
	fKB9/E4jFD3zuaaQOrlC25vSahERPrEe9OItyBZ3rykgAeMb6HhFo2oI329xMYKvKzdyVnCXqVo+l
	r4JjvJZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQyKE-00000005Tn0-2bC5;
	Wed, 11 Nov 2026 02:44:38 +0000
Received: from mail-koreacentralazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c40f::6] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQyKB-00000005TmN-43Km;
	Wed, 11 Nov 2026 02:44:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wLmIYT264DUrwZqgVoLJeTF3QlywzAXwwYOA0JWHuquUSu5rtcmZokRm+RIqJkLEbpcsx98ifKoxjiMzsXih1XAcAGlGaeh3oqfijm+M9KByNf/aCKwxaDSlsSCW5EnZxvG/ypXE2tpeR/hN2CE9ZCtK4uDKwShaWSR/TZ7jl8MWGnqYK0DqTA+HWb7LS9WmbsCUp7ccUGuJoHqC1OBAqIzC8m9L3Z4LufO7GeQwUlinbQ0XWZHLwSFqbWZUagvdq3Hs+tFU9n9Q148XpH4t/TQ6MfmIBjg/KcIJ2I23L5suRSk9Eu01brqPlTWWbrQGwSYib366zrrU8MzlulhPhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5n3LJzBuDRTsiHMyGjXF19fxzf+jI5bxJApPMeXD9As=;
 b=Bx5x88mAG5/EiT79Wu5H+CcwASFHZa+hJopTb5A+zA6iDzJL5Nl+Kf3ehXJC/kYxi5pCmOHjDk6SwurUu3W+9WrG1Gs8UrM5Y8ADZCL7rdjXikPs6N+pyelWGj4LO0Yu5ql79nwZTPwSJ5QFc/mBha3lDj/57tYthaOvDzE5YZjTt2RVJnDSIJquRCKcMp5n1MAz7lVkRvOiwv0FB7UxJ8QojmYGlIH4r7nw0jCRz87FbtUKcW42stSUXXUh9IQocfcfPowDDcMnWQgNOFiNcNtG6NuRnOj8J1ZD6VzaDzJo83wJrVwXMuksYUtdvDthcqcwfNeLUppBcwLjWIc3/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5n3LJzBuDRTsiHMyGjXF19fxzf+jI5bxJApPMeXD9As=;
 b=a5zUDqL/SPNlJTC48Oh5xFY0TLEGKkkajKbkkEFOmsu3JPkzExUU8UOSKYAYqJw0J1d5Kynz5bm3xS3ZeygicjKtZ5fHaF9Bw0eNnjqzL8shLFGqu+5sqaT57pRSErwFFDvKxZwn7lkkn4lZedRrxgnJx7NsTNVg4/LEOaEdn+J+XjCd/wniTPsJ5+j6MeUuRfDdtm1NiONymRtFSbhXxmaCowOtBhrKpq/cThrkadurLyN+rQAS9VvvVIefm1yIG7gSDPAiHDupBl7e6TQo9bQnP8UdDggzygSXGcwZ5KhoTdSA10OBl09NR547pgIh+5VNVIScfHTK3YRhPsaH2Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by SEYPR03MB8479.apcprd03.prod.outlook.com (2603:1096:101:20b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 02:44:25 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::78d4:9dee:2e32:d1e4]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::78d4:9dee:2e32:d1e4%7]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 02:44:25 +0000
Message-ID: <18a7edd2-354a-454b-8f9c-d66fbb0819ee@amlogic.com>
Date: Wed, 11 Nov 2026 10:44:21 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] pwm: meson: use bulk API for per-channel clocks
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Alexandre Mergnat <amergnat@baylibre.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
References: <20260827-s6-s7-pwm-v4-0-d28a2015177d@amlogic.com>
 <20260827-s6-s7-pwm-v4-3-d28a2015177d@amlogic.com>
 <178879456435.2256446.2005394820666057840.b4-review@b4>
 <ap8FuWnIRVgcP98G@monoceros>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <ap8FuWnIRVgcP98G@monoceros>
X-ClientProxiedBy: SE2P216CA0128.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c7::15) To TYZPR03MB6896.apcprd03.prod.outlook.com
 (2603:1096:400:289::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|SEYPR03MB8479:EE_
X-MS-Office365-Filtering-Correlation-Id: 40ad3f2e-2875-455e-6e87-08df3f9db267
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|23010399003|10067099003|11063799006|4143699003|261026140227099003|261021121427099003|261022075727099003|261009223027099003|261102123227099003|261026121527099003|56012099006|261022105027099003|261028144727099003|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: yxEVFKLHu/tNVzB7EQncakc6HToYJ4h6wVp6gwQSs3tpLRoiJHfiU/dZRQyLQwaVxOyh1WLzCUbHY3vRKYxK3bj1O98Z+3U8wOB8/GMby/v1K9ESaJF8jAekPsi63l6jnx2Z38ek08mEIPbb/Pp6WACGImQq4c9kZ+fnVV/52BW1uHMAqsuwSn1CqDNGTj82+ekAZboCyVLQXhXEwIkcz0g9E939sgVnOMrsR5/XLWG0qLcErGlMfqWdVF2e/3OnkHIrdrPlWrZ/q6OdseqS8ypkY8IT+e4smY1sjnILZ7fsA5nSLiYIdHNDEFIhaUk6Kv26mfZeQN4XPOYkFfhS0Z2mjaTh5HWLAW5nlVBJmCP+qjsBy+C0nTeKaVOhkG1I96qPOrZ13rjvDvDh0QXtUoGna7P3gzgBzlEAht6Kbd1LFRZGfvwKj1Scv+KuVjRunfveESSFfF0M8kTn7P3g7GbRr6DicbzwzL0+TDVEhVafktcUAAU9GvpuWz35i6KGFYu1okyCYqfgjcN2KhzyoP6Aym9/LdLVDgKClxgocQLYt8kBNBINtNQd7v1iEqpbLT9s1wWNU8zJT4k9u3wHAdyGA2byzaWpvODUTmw+MXVeDXZS5y1TKVo5Kjw+g/YIF2LudbdPG4TZ/Oseptu39/exNDCDo/5lf77nIXWpfHg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(23010399003)(10067099003)(11063799006)(4143699003)(261026140227099003)(261021121427099003)(261022075727099003)(261009223027099003)(261102123227099003)(261026121527099003)(56012099006)(261022105027099003)(261028144727099003)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SzhEQktrb3RhT0lHeXgyRHlqOHk1WVhoOC9ITk1sWkNha2RJZEt1TWRlRkdp?=
 =?utf-8?B?dWpzNFkvVlBEYXVQZU1hd3g4am5ibGFDd0gwRldUR2dDR1NkTDVhVnB3aHYv?=
 =?utf-8?B?NCtyUmRUM0tlUDQ3QlBvTy9XQmNmcXJXZWhZQ0tsdDVzL2pJYW10Yll4bi92?=
 =?utf-8?B?bTBLNURjYzI5ZDRQN0pZcEwxK25iSnRBSyttMVFmOVB4TXI2Tm9wMkJ5eUw0?=
 =?utf-8?B?RHRCNWIrY04wZm81VXJIUVc2V0lCUTZIeHIrbnlTL3pUTXFML2tISUU3bG1p?=
 =?utf-8?B?WHczekhtOU11Y2RrcmQyMUxlWGFyRHFTaHB0NVo5MHVoV3MySmxia24xVmdt?=
 =?utf-8?B?WVJJVGNlbWFTdlJScTBhRDhxV21PREpqZ3V5a2VKVW0vQ2FtTnlpaVAyVmdn?=
 =?utf-8?B?WWk5ZXNjRHhZRG1pb2x6OEMybVJTd1oxL2Vod1B3K0o2RTNrMHVyQnRBakpy?=
 =?utf-8?B?ZGxWVjhyYjg3T25ZVkYwNU13aTlNcVE3a2o0czZYdkVZTlV1YWttQlNjQlhm?=
 =?utf-8?B?VVZvRG0rZGRiNE9KV0xEZVZ1bW1oZGsrbXI4cmkzeGlaQ1BNRC9TdzZESWo5?=
 =?utf-8?B?SXhHYTFLVC82ZnlWQndQOUdrenliNGJBcVFJbVpFeThYNnduZktXbW9TdmtT?=
 =?utf-8?B?TVVtVURpVkF1K1B6MFVvbWxIa0ZoeHUvK2tDbi9PMUVQM1kwaTJsS3I5ODkv?=
 =?utf-8?B?TFpKQ3JYNEFHZ1h1Qk85VEpNNWpsWnJwa2VRQ05ZcTM5TElZVDBHMUEwTXFo?=
 =?utf-8?B?STZnbW8xeGh4NmFRRDBmYnkyQUsvdXVaZmE2NDlVMCtjaTBTU2Y5cUJwWFNa?=
 =?utf-8?B?b09BamhScUhTK3ZteWd5M0JjY1lMalh6ZzkwL0Z1SzR2Yk4zMW95OEdEODhZ?=
 =?utf-8?B?NG92QytlWmROOXBDMUdMZzVvdU9RSDk3RlE4cG5QdWhzdUYzZEEyQjJ4YTdy?=
 =?utf-8?B?d3REUU1XcS9NYmVNd2VWQk4yUUhtSnBFK2twU3JNYytkK3AxVDJ2djNiOExs?=
 =?utf-8?B?STcwSTZFOVVsT2hZbmVUZ0xUa1JlTExDTEduTmttYzV6RDJrRjZSekVUMHMv?=
 =?utf-8?B?N0JmTTgyNHdyZUhBaklmeW1pbm5QelJNL0NHY0tvOFZ3OG44MWNhZjFRY2pN?=
 =?utf-8?B?WU95Q3lvZnUvbGtCb0hFMFZ0ZlUxenpzdWY3Z00xRkZGOG1BcUYvRUQ2eUxa?=
 =?utf-8?B?NU5QbXAvQXZkTU1JUlhKRXpaTStIaWtwd3RJd0lUZTFaUlMrdmx6RXdhOHpP?=
 =?utf-8?B?cFlOY29ETVBjcGhWQ29Fc3ZjL2NRbXNlTGtvRkJMcDJHM0RURS9RNGVjNld6?=
 =?utf-8?B?NWZxU2UvUkR6UW5qZTZvRGdtRVdNS2lIZnNxK3JDSkZxdEF0Yk9TeWhjUSt5?=
 =?utf-8?B?OFhPaFlZUktFQlg5dnhXQ1kxcHl2OEpvOWNTY1hQM0UxdCtTY0MweHJTMVlP?=
 =?utf-8?B?UnROb1NmaC9nM0pKVTBYNlVDbEhlUkZWaTE0c21sQ3U1SFdaSjAxejdTQXpn?=
 =?utf-8?B?NnRUalM0ZnhldFRnZHdZV29UbGZkbWdUei9xS0VMTFRJUVdNbDdicGI4NkVU?=
 =?utf-8?B?SHdMQ3ZaMUI3dVpkd0RaMUZvSjExcDhtMDhHNVJEMEZFS2FBYWQ0cm9CS05o?=
 =?utf-8?B?enNmN29OQnpCd0Qra2g1ZWNGeVJmd1pYek9LTWVVRDM1YU8xd1FrZFlqQ05v?=
 =?utf-8?B?aGNzdU90cGtIaG9LYmhrTTdtSHVCaGpoWkFMenFNK3BhelFzdGpVcHJROEQ4?=
 =?utf-8?B?UzY1eGt3SmVBcXpJOXBDRllHelpmZW41YytvRnZyNmNNMW1xK0xuY0hNbkNF?=
 =?utf-8?B?ampGdEo1VmNhYjRwMm9MeU5QbTc1QnNuNTRYSmlMQlhKbFc1V2U3UUxZQ0kr?=
 =?utf-8?B?eEcwUTFyRWFvd2NYMmN0QS9QdUVRUjFmREhhbUdWQnVvNFdUc2dYdWJpSllF?=
 =?utf-8?B?bVkySDF2MzdQcFBoUnltTkRCWk5XRlpqVml3RkpsQWZZczhZQnZRWGZteW8y?=
 =?utf-8?B?NTBuM1cxTyt6eHNUMy81Sll6di9EWmpsS0dsdTR2L0tUaHRVSWU2Mm44VVox?=
 =?utf-8?B?R295U25NMXFZQmI0SlFSaHRyeGNvQXNKQ3pnc3p2U2FJVHRvK3JZVzhWZy92?=
 =?utf-8?B?akNDbUg4YWdTcXNNL1VYcmZIdjUyOWIrOHFTeUxJQ3RkMmxoMWR1VEJKN0xM?=
 =?utf-8?B?aFFGbDNZNkVjeXhLYk4vQll4YW9qR3FuSGx6M1IvSlBiR2c4TnBvdEFadmhP?=
 =?utf-8?B?eXlpRHkxUzkyM2RRdzZERGJuV2NFTjhjNXZEUEV5T09LLzdxMytuYThPNDJj?=
 =?utf-8?B?Y3hCSjE1RXJQdENmb3ZIOXEwbTdpV21NUnRQZTJNQkcyNHFsWFhLUT09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40ad3f2e-2875-455e-6e87-08df3f9db267
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 02:44:24.9635
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iZOTWGZxKREmvXjiwFTFSxZxJph+5Ix4Ur1eKeaETgKj7bMrDR9EL5JB9qagZ3Xshyl3ut792D6DGkdOmvTFB88Um7Koh/NmUirS1Sb6SGo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB8479
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_184436_017674_3373EBCF 
X-CRM114-Status: GOOD (  20.86  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgVXdlLAogICAgVGhhbmtzIGZvciB5b3VyIHJldmlldy4KCk9uIDIwMjYvOS84IDAyOjQ0LCBV
d2UgS2xlaW5lLUvDtm5pZyB3cm90ZToKPiAKPiBIZWxsbywKPiAKPiBPbiBNb24sIFNlcCAwNywg
MjAyNiBhdCAwNToyMjo0NFBNICswMjAwLCBBbGV4YW5kcmUgTWVyZ25hdCB3cm90ZToKPj4+IFRo
ZSBTNCBQV00gZHJpdmVyIGN1cnJlbnRseSBnZXRzIGVhY2ggY2hhbm5lbCBjbG9jayBpbmRpdmlk
dWFsbHkgd2l0aAo+Pj4gb2ZfY2xrX2dldCgpIGFuZCB1c2VzIGEgY3VzdG9tIGNsZWFudXAgYWN0
aW9uIHRvIHJlbGVhc2UgdGhlIGNsb2Nrcy4KPj4+Cj4+PiBVc2UgZGV2bV9jbGtfYnVsa19nZXRf
YWxsKCkgaW5zdGVhZCB0byByZXRyaWV2ZSBhbGwgcGVyLWNoYW5uZWwgY2xvY2tzCj4+PiBhdCBv
bmNlLiBWZXJpZnkgdGhhdCB0aGUgbnVtYmVyIG9mIGNsb2NrcyBtYXRjaGVzIHRoZSBudW1iZXIg
b2YgUFdNCj4+PiBjaGFubmVscyBhbmQgYXNzaWduIGVhY2ggY2xvY2sgdG8gaXRzIGNvcnJlc3Bv
bmRpbmcgY2hhbm5lbC4KPj4+Cj4+PiBUaGlzIGFsc28gYWxsb3dzIHRoZSBwZXItY2hhbm5lbCBj
bG9jayBpbml0aWFsaXphdGlvbiBjb2RlIHRvIGJlIHNoYXJlZAo+Pj4gYnkgTWVzb24gUFdNIHZh
cmlhbnRzIHVzaW5nIG9uZSBjbG9jayBwZXIgY2hhbm5lbC4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5
OiBYaWFud2VpIFpoYW88eGlhbndlaS56aGFvQGFtbG9naWMuY29tPgo+Pj4KPj4+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL3B3bS9wd20tbWVzb24uYyBiL2RyaXZlcnMvcHdtL3B3bS1tZXNvbi5jCj4+
PiBpbmRleCAyMmNlZmM2ZDVkZDAuLjZmMTUxNDY0ZDdjYyAxMDA2NDQKPj4+IC0tLSBhL2RyaXZl
cnMvcHdtL3B3bS1tZXNvbi5jCj4+PiArKysgYi9kcml2ZXJzL3B3bS9wd20tbWVzb24uYwo+Pj4g
QEAgLTQ5NywzMyArNDk3LDI1IEBAIHN0YXRpYyBpbnQgbWVzb25fcHdtX2luaXRfY2hhbm5lbHNf
bWVzb244Yl92MihzdHJ1Y3QgcHdtX2NoaXAgKmNoaXApCj4+PiAgIAlyZXR1cm4gbWVzb25fcHdt
X2luaXRfY2xvY2tzX21lc29uOGIoY2hpcCwgbXV4X3BhcmVudF9kYXRhKTsKPj4+ICAgfQo+Pj4g
ICAKPj4+IC1zdGF0aWMgdm9pZCBtZXNvbl9wd21fczRfcHV0X2Nsayh2b2lkICpkYXRhKQo+Pj4g
LXsKPj4+IC0Jc3RydWN0IGNsayAqY2xrID0gZGF0YTsKPj4+IC0KPj4+IC0JY2xrX3B1dChjbGsp
Owo+Pj4gLX0KPj4+IC0KPj4+IC1zdGF0aWMgaW50IG1lc29uX3B3bV9pbml0X2NoYW5uZWxzX3M0
KHN0cnVjdCBwd21fY2hpcCAqY2hpcCkKPj4+ICtzdGF0aWMgaW50IG1lc29uX3B3bV9pbml0X2No
YW5uZWxzX3Blcl9jaGFubmVsX2NsayhzdHJ1Y3QgcHdtX2NoaXAgKmNoaXApCj4+PiAgIHsKPj4+
ICAgCXN0cnVjdCBkZXZpY2UgKmRldiA9IHB3bWNoaXBfcGFyZW50KGNoaXApOwo+Pj4gLQlzdHJ1
Y3QgZGV2aWNlX25vZGUgKm5wID0gZGV2LT5vZl9ub2RlOwo+Pj4gICAJc3RydWN0IG1lc29uX3B3
bSAqbWVzb24gPSB0b19tZXNvbl9wd20oY2hpcCk7Cj4+PiAtCWludCBpLCByZXQ7Cj4+PiArCXN0
cnVjdCBjbGtfYnVsa19kYXRhICpjbGtzOwo+Pj4gKwl1bnNpZ25lZCBpbnQgaTsKPj4+ICsJaW50
IG51bTsKPj4+ICAgCj4+PiAtCWZvciAoaSA9IDA7IGkgPCBjaGlwLT5ucHdtOyBpKyspIHsKPj4+
IC0JCW1lc29uLT5jaGFubmVsc1tpXS5jbGsgPSBvZl9jbGtfZ2V0KG5wLCBpKTsKPj4+IC0JCWlm
IChJU19FUlIobWVzb24tPmNoYW5uZWxzW2ldLmNsaykpCj4+PiAtCQkJcmV0dXJuIGRldl9lcnJf
cHJvYmUoZGV2LAo+Pj4gLQkJCQkJICAgICBQVFJfRVJSKG1lc29uLT5jaGFubmVsc1tpXS5jbGsp
LAo+Pj4gLQkJCQkJICAgICAiRmFpbGVkIHRvIGdldCBjbGtcbiIpOwo+Pj4gLQo+Pj4gLQkJcmV0
ID0gZGV2bV9hZGRfYWN0aW9uX29yX3Jlc2V0KGRldiwgbWVzb25fcHdtX3M0X3B1dF9jbGssCj4+
PiAtCQkJCQkgICAgICAgbWVzb24tPmNoYW5uZWxzW2ldLmNsayk7Cj4+PiAtCQlpZiAocmV0KQo+
Pj4gLQkJCXJldHVybiBkZXZfZXJyX3Byb2JlKGRldiwgcmV0LAo+Pj4gLQkJCQkJICAgICAiRmFp
bGVkIHRvIGFkZCBjbGtfcHV0IGFjdGlvblxuIik7Cj4+PiAtCX0KPj4+ICsJbnVtID0gZGV2bV9j
bGtfYnVsa19nZXRfYWxsKGRldiwgJmNsa3MpOwo+Pj4gKwlpZiAobnVtIDwgMCkKPj4+ICsJCXJl
dHVybiBkZXZfZXJyX3Byb2JlKGRldiwgbnVtLCAiRmFpbGVkIHRvIGdldCBjbG9ja3NcbiIpOwo+
Pj4gKwo+Pj4gKwlpZiAobnVtICE9IGNoaXAtPm5wd20pCj4+PiArCQlyZXR1cm4gZGV2X2Vycl9w
cm9iZShkZXYsIC1FSU5WQUwsCj4+PiArCQkJCSJleHBlY3RlZCAldSBjbG9ja3MsIGdvdCAlZFxu
IiwKPj4gU21hbGwgc3R5bGUgbml0OiB0aGUgY29udGludWF0aW9uIGFyZ3VtZW50cyBhcmUgbm90
IGFsaWduZWQgd2l0aCB0aGUgb3Blbgo+PiBwYXJlbnRoZXNpcywgd2hlcmVhcyB0aGUgZGV2X2Vy
cl9wcm9iZSgpIGp1c3QgYWJvdmUgYW5kIHRoZSByZXN0IG9mIHRoZSBkcml2ZXIKPj4gZG8gYWxp
Z24gdGhlbS4gQ2FuIHlvdSBmaXggaXQgcGxlYXNlID8KPiBObyBuZWVkIHRvIHJlc2VuZCBmb3Ig
dGhhdCwgSSBjYW4gZml4IHRoYXQgdXAgd2hpbGUgYXBwbHlpbmcgKGFmdGVyCj4gY2hlY2tpbmcg
SSBkb24ndCBoYXZlIGZ1cnRoZXIgY29uY2VybnMpLgo+IAo+IFRoYW5rcyBBbGV4IGZvciB5b3Vy
IHJldmlldyEKPiAKCklzIHRoZXJlIGFueXRoaW5nIGVsc2UgSSBuZWVkIHRvIGRvIGJlZm9yZSB0
aGlzIHBhdGNoIGNhbiBiZSBtZXJnZWQ/Cgo+IEJlc3QgcmVnYXJkcwo+IFV3ZQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWls
aW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
