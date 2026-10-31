Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B157606A31A
	for <linux-amlogic@archiver.kernel.org>; Sat, 31 Oct 2026 04:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ztKdn0Cv;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=amlogic.com header.i=@amlogic.com header.a=rsa-sha256 header.s=selector1 header.b=mamm9J+E
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=PCWpN/rMj/2BjhqB89wIalLKXjG1KKMLK2Qo1HJLLgQ=; b=ztKdn0CvcJv5GbQIyBVbMsZdNo
	DSPnTYjwV+U8Rr7YHwqU9p31vNbvPF1z/UKQeZKphTyLk/1v/80yzj2G3xN7uhKjMCDDfnPaEFePC
	uQuX96snddDL+WcxOQNKrlCscmkKZk21oytSlxbSGgFlPr66l/D3T7hS+whd21sv0DnbEEVnEnhSh
	mEWbi5xqEqpEP6KE3WMqTKtlWavjIvjHw+wa1ei9y1BlOKCXkVcQoasgcrM3Vfzank7cizuHDYlQI
	rxrQtmifSaZyJqXIoIVUPcxCKaLt7zvivPUUANSrYYB91dRBxI5BaNLp4bEv7UFSd7FXg8T6Wn54F
	c+C4y/jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xN14E-0000000Cx3W-00ZD;
	Sat, 31 Oct 2026 04:51:46 +0000
Received: from mail-japaneastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c405::7] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xN14A-0000000Cx1t-0v6w;
	Sat, 31 Oct 2026 04:51:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ePDJDh5sYQNBsLXivUjV6OKsuXo3oIqFnjQzjhbVsrOeAsSdt5vq6nmNLnrS4BkGAewHfZlHX2oc7z3seZgTsU3dg7KeqZ9Zp5YebT0F3wnzaYkB86q9bqqvJCKnUPgel8K0zPJdO9fiU/YeeW9tTB1B3WhZ6cPnI6go6Rue9K97JxuOdtQQXeVogufZAUkf3f/MAUJr8oKd5kP6PYw2Y0NrS8b8jJ5XDHCA4jJT4adUbL5Ol07ea6xcz4ewWMRaTHomZJOgrnQl/Xe1ZO1G5JYik/3SJy0cJKZPDwkz75FwG3lC2B8ZhMn1NdG3tAolrqWLF1QXS7wHUso/bc2jjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1CqlgEj5PK6j2ag+uWWAKueIFfVXPEmWxYDHHlMmBBE=;
 b=Q4DBETi2yQuv00e3u9Am2KrN4R2cTpay0MHH1mgjGuszoA7ACWav9wPHhNv6r73s0t6nj/cn9eivWiu1F1OOYS9gBnSZELfW4PM9IbTt3IOwpjMmKwViYQDs8UJHW8hHQqN++BNbKXRfBwcSFqc7B9LIxG5e5SeHIYfwJa90tERUOjozGj8mcrd01pbly90UFsHzL0zJsOV66sE0bkCYDOyxZcIfIt/hTDeVkgZhxwY7smuG1VKw2dnJNw2yshx9qDq4eTGqrV0K33XSfQs3p5+UDeXPGUzZElTUL9xxa+p5uBs755uArr9VUFfdIIlQ66+8dOnXvLOGHvxIqdLIhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1CqlgEj5PK6j2ag+uWWAKueIFfVXPEmWxYDHHlMmBBE=;
 b=mamm9J+E2k2+qUKwyzeRb8Q0/dH6EeqK0OfXeBsNjUclx12XaNKiTRJS1mzxDHINbFbmfM7OhGud4jBn/TyM+Rb08m3q1A7pSK1+3PUcJbE162BQDMTLMHHCht7Djb6OK2JcHV0M0ebN+NaqUVnCTblBT6N+6edSq1NWZhxTI2MuTdA5YugkYKHZ/VCzm8MJQQQukqSXG0m+9tByAp2vqMbShyxcpIPg/LyXclcPZc/Ixcs+OIqGr2Npm3bGyGV5ICnM73PBS8OxhZCqdZfTf7Fy4+c5VAFGxaigpviBKbDCKgEgXjEm94inSxRkIUJgEwnjDxmpN+8a+TEFxl98/w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5521.apcprd03.prod.outlook.com (2603:1096:820:51::12)
 by TYNPR03MB10089.apcprd03.prod.outlook.com (2603:1096:405:3d1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.10; Sat, 31 Oct
 2026 04:51:32 +0000
Received: from KL1PR03MB5521.apcprd03.prod.outlook.com
 ([fe80::f12b:85e:f95c:191e]) by KL1PR03MB5521.apcprd03.prod.outlook.com
 ([fe80::f12b:85e:f95c:191e%3]) with mapi id 15.21.0569.010; Sat, 31 Oct 2026
 04:51:31 +0000
Message-ID: <31535217-e87d-4ef7-b22d-32c35ee998bb@amlogic.com>
Date: Sat, 31 Oct 2026 12:51:29 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 0/6] Add Amlogic stateless H.264 video decoder for S4
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>, wbieganski@baylibre.com
Cc: neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, krzysztof.kozlowski@oss.qualcomm.com
References: <20261022-b4-s4-vdec-upstream-v12-0-616240978792@amlogic.com>
 <179337024629.131241.9227206619077693683.b4-reply@b4>
 <1a18d5c5f7f.3e45f382588509.8172330954347509989@collabora.com>
From: Zhentao Guo <zhentao.guo@amlogic.com>
In-Reply-To: <1a18d5c5f7f.3e45f382588509.8172330954347509989@collabora.com>
X-ClientProxiedBy: SI2PR02CA0002.apcprd02.prod.outlook.com
 (2603:1096:4:194::22) To KL1PR03MB5521.apcprd03.prod.outlook.com
 (2603:1096:820:51::12)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5521:EE_|TYNPR03MB10089:EE_
X-MS-Office365-Filtering-Correlation-Id: 460c3db5-f668-4c23-f830-08df370aa19c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|7416014|1800799024|366016|3023799007|10067099003|22082099003|18002099003|56012099006|11063799006|4143699003|261022105027099003|261021135927099003|261021121427099003|261026140227099003|261028144727099003;
X-Microsoft-Antispam-Message-Info: JNpxx2qGfPxW6UujoB7ANja4ZisSsyEKSpQ6AuCwcqGzWocLN6bTweMqXMwT/BuKn3Y4f3MuOkwSaZz0Z3/vvFgOez1yGhvJ2QZG4Gf3TK3w+HGLhtZprmAF94f/nLlYN3ETfP7snf0Jq3t1kgicV5wxL2Mx2tQpWMyogL/olQgpzgO8I7ET2rJ/+Rm97xuyKmtjk+PEfEMe8KeTjGPk5wKv5dcAC0Ih15nK+nQ4NcbI4WPeQuJQ7VVCAtxlR7CVXrmnGnLY0cj511VC9FaAxPea98M+g8fEEhUNchWmpyAg40sd2iYAdscRj3vEgkfRz213PSwYq7JrzmkqjrfkL4tJOnkkAOpzY6HkIvgNtZ5vnKKTku15wV/Q8jZugJTZVi6iD0a8ZVgkUxuX+1tNQDS1NpyBWwlIlhm0Va4ykzIEhn9yFGW0AyTKZPOaLY0uoaL3hdP79LOj7yKT2EsTrPVI/LidIVyGrykPbqaNCyhqxy66/kLxnzPilJ08fqZhnPLX0pQH+f5B9mTuiShSnmjrdubEPqo5qPv+vYQ4Dqnonxo2Xs9bfeQiSYYQe3LHdk8cfUNX6CPh9MVUmt+3KAzUcxHyIzBsOJeVc88kKhCIdwTgB08DebAYZWvn6rkIInOp1W3cCVD8DK5VP8aJKWoK5/ALy0QMF+4cKi7wi+Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5521.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(1800799024)(366016)(3023799007)(10067099003)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003)(261022105027099003)(261021135927099003)(261021121427099003)(261026140227099003)(261028144727099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UDdHSzVzeFJWQU9GRGRKaHZCa0UzL0M5bFQ5QmFqazNUNEM5NmhsZGhYRitj?=
 =?utf-8?B?NEplc0dIQ0FPU21ud3diZUdOTjNnS0pYODNsbzBlVStDUXVtcTlDa0RXeSt0?=
 =?utf-8?B?TDErVS90Q2FpaEw3QnI2dDJrSWtQaUIrY2JTckR5SVdYd3VTdGp6SnJlY3N6?=
 =?utf-8?B?ejArUlRnaHNrR2phWlFGSWxGN1htQ09tcEQyYXhSQ0pwcll1Q0ptRWU4cmtr?=
 =?utf-8?B?bmFjbFhKaEdLRzBQeml5bEl2R0k5WGlhOUk4eENRZG9ndk9icERHcGpKWE9U?=
 =?utf-8?B?ZStLd1VPY2JweWxYcmt3WkJuY0l4UHlneG5DNVBncUhyMStvekwzd2U5SlQ1?=
 =?utf-8?B?SFIvaHJnSE12R0E5enhUQ2kwdUR0TWE5OWEzeTFRTkRNNmdibWdrZVcybHZh?=
 =?utf-8?B?cW52UE1Sdzl0a2FqdXpDS2Y5RGhsa1hBZzRwOXFiRU5xWUZTLzhjek9aVXow?=
 =?utf-8?B?d2tFNFMyU1o2ZXVkVlRnNXZqQXUrZEdMdWR3OFEzTFhmZS9LemFjbmRDUHVw?=
 =?utf-8?B?TForSDdEazJLc01rR0NjaTA4NEtyZGJlNi9XMmRHeGtjdDBZSkJmNjNrSk1a?=
 =?utf-8?B?RnJ1d2g5NFV4S3lIWkd3V3lkSTNzNTRSeko5cm1Pb0dReG84UEpKUFd6MVlB?=
 =?utf-8?B?bFJ2elZiUlRZZFIycS9wUW9EVVAwRSs1aDQvdEZnQVg5TUI4VFhyWm1pOVNx?=
 =?utf-8?B?cThEUXQxamtVemdFclp3dDltNjdTVlFDbkptREpyTFBMdXVOQUFXWExpM2ds?=
 =?utf-8?B?ZWdnelpJRTl6dS9TVWx1amdBTjZ3QmpYV3VTZWQ3Ry8wMks0TzRxSXRva3dR?=
 =?utf-8?B?TzdWYjRDK3lVV2lDV3Zha05WMXRPaE92cGo0UHh2MzVXdytxR2FzWjZNN0Yz?=
 =?utf-8?B?TUF6dTZNWXFEcE45QW1pTTRHL2xzSU1zakN6QkxYazg2aWN6USt6NmUvcTd3?=
 =?utf-8?B?M3ZLK01ZMkNyUHhwSTJpTktPUWpQNmxHb3l3cXhGa2puRTFaa2U3WGVwbzFk?=
 =?utf-8?B?UndobUI1eU9nMjRORnVvRTZ6S2UyYUsyUmtKWStkT0x3d0J0RExlSmptNGRr?=
 =?utf-8?B?bGVJSkoveTZaZmtTYVd6VWJGWXAycmtpZDA1cHBnSUt0MnRUV3dSc25XQjJx?=
 =?utf-8?B?U3MzK01wOXA5NDBXSVdBdDNXanhHUjM1cFZmbUFSaXUwQ2txdjRTdkQ1ZG5R?=
 =?utf-8?B?TDAxQWpkQ3BBUjFLanlXM21aSVovbE00eHNZRGRQa0FzaVQrZkJtRldOZUNq?=
 =?utf-8?B?VTA5SmF3eWRMMFBwNXgybUwzS1pvOTVUc3BWQm8yajQ1Z3grYStYcFY5QUVV?=
 =?utf-8?B?QmtOQjZHN3NKVnc4MEU1ZXQ1cHdsYUNLWFh1RzZDZ0d6YiswNlo2R3Yxejgy?=
 =?utf-8?B?dzdiL2NtUTRmZFVvNTZDZnZPR1dWb0ZoSloxekw5aEZGenhtRUdpOHZaSWFX?=
 =?utf-8?B?WlNyZENuVXN6RVVwQXZIZ3hpZm44d0E3ZGFZRmk0ejI4QnpYcFJWUjliOXFB?=
 =?utf-8?B?SVQyQUF6c0JLYW1xcmtFWGZrb3BJUTBjaFlZVllaM2h6bVY2ZXRTUDhCU0w4?=
 =?utf-8?B?ci9UU1Q3emsrWGw4d1dMVVJZM1QvZFR5Vk1QelN5Vmpaa2Q3VHJlMjRCVEhD?=
 =?utf-8?B?UnptNkVBOHdhdFlKU3A2NnNyakY3T2dnR21DR3UzQ1dCRVY2bHF3ZnYyRlVT?=
 =?utf-8?B?ekdOT2w2eFFPdDdBSmRaZy9iZisxTEtLVHZ4TG1ob25ZcnQ3TExBRnA4Zzdp?=
 =?utf-8?B?V1dSMUx4ekl4RlBFT21jcDB5UTZGVHI4aDFYRTdpTlFCeGljTE5SUENkS3VM?=
 =?utf-8?B?RmtuU0RCVW9CUTlYUmJKcHhsNWtPb3llOEVGWk9TbXFYc2hHWEx4V1c0OVF6?=
 =?utf-8?B?dEpiYzJrbkFseDdGNmR3Um93WkNYTUlmaTlCMjNsTDVQRzE4UG9hTkxwaUdh?=
 =?utf-8?B?eEtVVlRHaXNRM09maUc1VnFMYnZkWU5XSzdGM01Fa3dDKzdYZ2Q5WDA1UXVU?=
 =?utf-8?B?c1czSXdSdzJGVURJb29IQ1h1eTU3UitzUTZOV0Y2WklCeUhsejE4dE1lM0xl?=
 =?utf-8?B?aGVvWTM2b2M1TnF3WmpPbVFPYkNnVDJRbFVQUFpJL0laRlRIMU9WRlN4R3Uz?=
 =?utf-8?B?aHo1cEFCT09STEV4MUZRUU9BNkpyZmg1TnNEZU5ReDhqZEM2elIvdmxRMmdz?=
 =?utf-8?B?eGgyamNpK29qMWhYckxsWmk1ckxMUlJweUVTN3ZHNWtYSm5pL0dXdFNCNFhs?=
 =?utf-8?B?dkUyY2htUFRjYUpnSC9DeW5IN0wyR2dHWjIyNkxRem5IUXAxVkpVOTIrMG9H?=
 =?utf-8?B?R1ovbEhiRzVXQkRPazRQMHZMK0hORHBpSURwNlNUZHU4RDd6TmZWZz09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 460c3db5-f668-4c23-f830-08df370aa19c
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5521.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2026 04:51:31.5506
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D5DIZZsWxmnkZ52crcSZ+R+3POpRGseRHs5LDekzr1EysFnua8txnGvO/foCBbOY5KgVGDFHERJvYBXqZJIZfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYNPR03MB10089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_215142_273799_628464F6 
X-CRM114-Status: UNSURE (   8.97  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgTmljb2xhcywKCj4KPiBIaSwKPgo+Cj4gLS0tLSBMZSB2ZW4uLCAzMCBvY3QuIDIwMjYgMTA6
MjQ6MDYgLTA0MDAgd2JpZWdhbnNraUBiYXlsaWJyZS5jb20gYSDDqWNyaXQgLS0tLQo+Cj4KPj4g
SGksCj4+IEkgdGVzdGVkIHYxMiBzZXJpZXMgb24gQVEyMjIgYm9hcmQgd2l0aCB2Ny4yLXJjMS4g
RmlybXdhcmUgdmVyc2lvbjoKPj4gJ3YwLjQuZmYuSTBjODM0OTUuNzU0NDRiMycgYnVpbGQgJ1Ro
dSBBcHIgMTYgMTg6MTg6NTUgMjAyNicuCj4KPiBUaGF0IHJlbWluZGVkIG1lLCBpcyB0aGF0IGZp
cm13YXJlIGluIGxpbnV4LWZpcm13YXJlPwpUaGlzIGZpcm13YXJlIGlzIGN1cnJlbnRseSBub3Qg
aW4gdGhlIHJlcG8gb2YgbGludXggZmlybXdhcmUuIFNob3VsZCB3ZSAKbWVyZ2UgdGhlIGRyaXZl
ciBmaXJzdCwgYW5kIHRoZW4gc3VibWl0IHRoZSBibG9iIHRvIHRoZSBmaXJtd2FyZSByZXBvPwo+
Cj4KPiBOaWNvbGFzCgpCUnMKClpoZW50YW8KCj4+IFJBVyBOVjEyIGZyYW1lcyBhdCB0aGUgZGVj
b2RlciBvdXRwdXQgd2VyZSB2aXN1YWxseSBPSyBhY3Jvc3MgdHlwaWNhbAo+PiByZXNvbHV0aW9u
cyBhbmQgSC4yNjQgcHJvZmlsZXMgKG1haW4sIGhpZ2gsIGJhc2VsaW5lKSB3aXRoIGFuZCB3aXRo
b3V0Cj4+IEItZnJhbWVzIGluIHRoZSBzdHJlYW0sIGFsc28gd2l0aCBJLWZyYW1lcyBvbmx5IHN0
cmVhbXMuIEkgdXNlZCBHc3RyZWFtZXIncwo+PiAodmVyLiAxLjI2KSAndjRsMnNsaDI2NGRlYycg
ZWxlbWVudCBvbiBUcml4aWUgd2l0aCBib3RoIG1tYXAgYW5kIERNQS1idWZzCj4+IGJ1ZmZlcmlu
ZyAob24gdGhlIGNhcHR1cmUgcXVldWUgb25seSkuIElucHV0IGJpdHN0cmVhbXMgd2hlcmUKPj4g
RkZtcGVnLWdlbmVyYXRlZCAodGVzdHNyYzIgKyBsaWJ4MjY0KSBvciBwdWJsaWNseSBhdmFpbGFi
bGUgdGVzdCB2aWRlb3MuCj4+Cj4+IERlY29kZXIgKGFuZCB0aGUgb3V0cHV0KSByZW1haW5lZCBz
dGFibGUgd2l0aCBzaW11bGF0ZWQgKG5vbiBrZXkpIGZyYW1lCj4+IGRyb3AgYXQgbWF4IHJlc29s
dXRpb24gKDE5MjB4MTA4OCwgbm9pc2UgZ2VuZXJhdGVkIGJ5IEZGbXBlZydzIGJpdHN0cmVhbQo+
PiBmaWx0ZXIpLgo+Pgo+PiBUaGUgcGVyZm9ybWFuY2UgYXQgbWF4IHJlc29sdXRpb24sIHRlc3Rl
ZCB3aXRoICdmaWxlc3JjICEgcGFyc2ViaW4gIQo+PiB2NGwyc2xoMjY0ZGVjICEgZmFrZXZpZGVv
c2luaycgcGlwZWxpbmUgd2FzIH44NSBmcHMgKGZpeGVkIG51bWJlciBvZgo+PiBvdXRwdXR0ZWQg
ZnJhbWVzIGRpdmlkZWQgYnkgdGhlIHRvdGFsIGV4ZWN1dGlvbiB0aW1lKS4KPj4KPj4gVGVzdGVk
LWJ5OiBXb2pjaWVjaCBCaWVnYcWEc2tpCj4+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxv
Z2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
