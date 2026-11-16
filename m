Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A9B606A31C
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Nov 2026 06:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=M4TSPGWo;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=amlogic.com header.i=@amlogic.com header.a=rsa-sha256 header.s=selector1 header.b=KeiB/C9D
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Aj0HlvYWZd9JEkXFqDulrrjZIIWFMbWiTcU8tV7Ren8=; b=M4TSPGWoSrT7xudckF3b+TpeNH
	mhjpCjUMgkO6KNxfdK+m2Q1XuJsl4YLhH343E+2dka3onueXECnP+2bpu6fv8mBRcunFYjmW2hmfw
	VN/DDfFNcH5HLxnqDsePt8ukusmhxyrwuAd05hJKIy5Hmdf9rSqTyBzG+vOapNAkbGALpR2s8keUB
	CH+W7KI8WwhCLnVz1CnnxG8c6WbLmjRQk3txpIrS2qQkBkdivSV6e634tl74RylEG+KQ9R0rx7Fr8
	AWVHNT34INMZn4nknKoJ3OLzwNvzwNfLV4825t0bSPLqhVqyCn6vDIOl1nVTDO4YaOWyogErZz0x4
	b0aP65Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSq4r-00000001Dv2-06ED;
	Mon, 16 Nov 2026 06:20:29 +0000
Received: from mail-japaneastazon11023135.outbound.protection.outlook.com ([52.101.127.135] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSq4o-00000001DuW-0gb3;
	Mon, 16 Nov 2026 06:20:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VmYcgVwzgrE8qDgdVV4adnTB4G0+iv+Nr9QzYgYxjs6MnRPLJH99hmMMmOJm2Lfkpfo+iWNNyNRtVwMXLCtvBJwTVfVynepKxPkGEuyd/q+SwbqQGvAug42zM+K26E+81VYZR9lN+2vH1QB3KDJqJNHufCE5zMMjuGNMCHRYHGCvF0GJigPdUgEl3Kf5It3nbQwCR6aYwZlekViTuBIWX44+zWVsO+sQvu1XY08K+5xHgHSwPZNETxSsnFj51vLzAWi8CLYD3xFUlibUfm0XHNoTUTKNPfp4AKZMF+d46gnmqPr6VsSuIg01U8YTc4tX5PcW5iPTG6pornNZtL3bqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SvmmvB0pBmnVgS4Zrtkcz2J9hW+b0uIVSeXmMcY2wN8=;
 b=WA0z0Ol5jOJE5awsi3K1BCQ1HxpRcVtacKtr5SsCZLEN2cenkgHnpCzhQoIUuBTdtY5Zl7GHBL8q4XJUCuPYzrlpO1P7YwHq61wEHphutgtT2GLVMATMMkOAWbzhQ0pCHUN/j9pYCMyl6nTL1/OEccQqgP3KCgWmo3VL1bRZ9L96Xgok0s1f7DYIXcX6TsZ8W5rySvwpEJhZfml7Q9RZCnRfMURLKv3gpSbIUa5u8jcnIN+eTBfahLVCm4HUT1XqkUMtizB6rt/te4p0aDB3TPus2OF+fNpKrlummhx1mlWh+ERJRRwzoLxbTxtM3D61XW949OuA8j1VtM7BbM2yTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SvmmvB0pBmnVgS4Zrtkcz2J9hW+b0uIVSeXmMcY2wN8=;
 b=KeiB/C9DLJzkL+VMtM7svzgxnhATjMfQrAL7annAGAuuotYsIZRJItyVy8Hq8LjNc4tyEpluyN6ZHaMUenPD691RXMRzjgSSHOGs5+Z0pll5uc+DaNtDkd3fSr+AHYli15YsH/1dCl1yw9qhAPUue8ad47xs/XwQTjgicLEC2WjRIO36MtrnwTxrxvuTgqbHWp6AHfqGc8ugSZGbGMwUJr8UBjfbJ0EzqobEyo4Fee8TLaxwKMOMX48kwuv1ERP+6EJP/2TSEbSXQ3H0h6tvJrT7Cev0mWfQcAxIRdrFlhE61QKyS9f05mWctvLacud8JXB/OATkgjLnGdT86dqV2A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5521.apcprd03.prod.outlook.com (2603:1096:820:51::12)
 by SEYPR03MB7507.apcprd03.prod.outlook.com (2603:1096:101:143::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 06:20:15 +0000
Received: from KL1PR03MB5521.apcprd03.prod.outlook.com
 ([fe80::f12b:85e:f95c:191e]) by KL1PR03MB5521.apcprd03.prod.outlook.com
 ([fe80::f12b:85e:f95c:191e%3]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 06:20:15 +0000
Message-ID: <f6972e64-741f-46a1-b990-4d7362466bf0@amlogic.com>
Date: Mon, 16 Nov 2026 14:20:13 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 1/6] firmware: meson: sm: video firmware loading via
 secure monitor
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20261022-b4-s4-vdec-upstream-v12-0-616240978792@amlogic.com>
 <20261022-b4-s4-vdec-upstream-v12-1-616240978792@amlogic.com>
From: Zhentao Guo <zhentao.guo@amlogic.com>
In-Reply-To: <20261022-b4-s4-vdec-upstream-v12-1-616240978792@amlogic.com>
X-ClientProxiedBy: SI2PR02CA0023.apcprd02.prod.outlook.com
 (2603:1096:4:195::11) To KL1PR03MB5521.apcprd03.prod.outlook.com
 (2603:1096:820:51::12)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5521:EE_|SEYPR03MB7507:EE_
X-MS-Office365-Filtering-Correlation-Id: 935637be-7d4a-4c08-c0b5-08df43a9ad80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|7416014|376014|366016|1800799024|10067099003|4143699003|11063799006|56012099006|261026140227099003|261028144727099003|261021135927099003|261022105027099003|261022075727099003|261021121427099003|261102123227099003|261009223027099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: dAb6uWbsrh9jSVmkd0xWu2fB4+evWZOTCO5/YQyKzj2uGXtjNx+QFeB4gWKDWeX7vblORfjt+yxVjaaHE3rA5OSgO3PHjrL4zy+AHMrDPYV36jVp0CmyVQzNgCqcxYAZHQhFMc3fJLwtWqzPcI75XjnMaBdQOTCdewp/m0G9m+UqNDer+p5mWLSYSpkOUWSgPBfL0lZuZADrX6nCfHYOVRPWVPbix2q7s0yJJMJhgytkRqsGGstjL+r6Azq4qgKWM9rFb9V8v4QBKd5ecBsnJvIAxICg6fgzoDI50u4ymjBN8Mr5rqETFi8r7Tog7PN1nNjRb2grWBBXnnNyGJmQsWz0/JlEl4ioL2F0gc8wUuiqwTcOM6RvmiEO8NZZg2zovcv04vF2CiOXLbtt3HthW6UYx7+6AHR9efYzsc0RbkLBLBPXM7qB7oOQcWp34iBj1frCzjAHGZ1Pxvm1rNg13K7yvy+e24UpOZE48wk9H4+7PFU0r31hNWP1kkCGHWgQ4xgbprs6LSZUvYSyO5AAz4UQQCKiRdtluoalG76CHmT+Yrx2H9cT3GFfIgLZJ9piuIh2IM7QcSSPGLbnp45m3wRdEPPWzHg79S0ipD1JTn17SuhtjOg+YJkKqeER3qgbhOuRrckvbEBrEgbw0VHqsLBAiy8ZhECZIkr1d8t0aMA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5521.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(366016)(1800799024)(10067099003)(4143699003)(11063799006)(56012099006)(261026140227099003)(261028144727099003)(261021135927099003)(261022105027099003)(261022075727099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?by9KUVFkU1A1TXh1cGJRUlBxZ3JGR2VtOEN0alR6dUMzaGt5NlBjaUw1bndF?=
 =?utf-8?B?eGQ5SFZvTkgrMFVWLzlndmZORTFSNEpwWlFFaTFLS1NjUFRKRlhWUnlJaVRl?=
 =?utf-8?B?cFpiemlCL1dpTnRNN1BmeWVmMGZVQU1yQTVMcy9qeGVUc3JiRENlR3p0ZmFv?=
 =?utf-8?B?WVlrSlJxNkZ1Sy9KS0htSUg2dlA3ZjNwMW9KVmxhanV0Vy8zYjUxZllydE9D?=
 =?utf-8?B?VXY5WTE1bW9jMWZjZnpqcjdvSmZXamR4bWpTVWVqMlhrTE9mOUdJZzdlWCtx?=
 =?utf-8?B?QlhhWXV5SjVZUXFLU1RIS0Rod1BtZmkxTi9peEIrS2NWZUQ5aUowTEZubEZu?=
 =?utf-8?B?dFZqTkZSc0VINHJDcjlGTnFDV041alJiRHBSSnBwVk1vTnFyOUdYOHJQaDRT?=
 =?utf-8?B?THM1WkxXekpHSWR6eUY5YkVGaml3TUJ5ZmJneDI5a3VpZkRCR2ZKR0x2c0R2?=
 =?utf-8?B?eGY5NHZtRnZsUjZaZnJZZEcwaG9BMHY0RGd6cVpOTFhxNWkxWEc0N04yYnVR?=
 =?utf-8?B?ZXdKUUJyN3dwc3crOTBua2pIV29uNTJXckRxc29jZUZTampvMGdDNS9LS1Qw?=
 =?utf-8?B?UXJPR2tMdXlpQnR2YXJZbzRmVlVseW5vRkY4c0x1MGhHbTVOZnZzVTE2aUlO?=
 =?utf-8?B?ODQrK0pXTjN3MGpXL2xrTHJKb1JGbVBDdUhuZTlDY29VMVhldGs1VDFFbTBZ?=
 =?utf-8?B?UEpoWVl6TlV1dG5DY2diQUdQVnU4Q0o2RkZSTWgyZFp0WEszKzlpT0wvMDZh?=
 =?utf-8?B?T0NUSU54dTRubjNreXpzMy9BSURtRll6RjlvcHc3UmVRby81UHl3Mkw0cXJ2?=
 =?utf-8?B?aTF1MmppcU1iNE9TRmpJTXRBb2pHNTEvYlp0TytRaFpTQVVXMUU3d1B5Tksw?=
 =?utf-8?B?TUo3alp1ckl2di9tNW5kOWpPL1FwSVhxMWxncG1wV1lWeGx1U1l4THlDWHNa?=
 =?utf-8?B?NWFYcUlEWWZYQjM0cHdrWFJOSVhJQmtxTkkrRmhvVDdUVzkvUWJoZ3FtNlIr?=
 =?utf-8?B?bnowTkt6QlI3c1lxRVY2NDREa2EwMDhMY0h4Wi8ra1kycExaZldUUUJiNG43?=
 =?utf-8?B?Um94M2ptaUk4T3Q4RW4ySytTNUVrcWVnbGJqcm83ZkFZWHROT0d6WStDMEU1?=
 =?utf-8?B?WFpiYlNKRjZkaTZqbS9vUW9hbkJVUG1pZ3I5MGpvbFFSL2VrR3QwWllXV3hM?=
 =?utf-8?B?WUFlL05pQnBPbFplaUFQWHJWUEd4MmZ0ZVR3cjNrTFZHOGsyeWc1Z0srdWJO?=
 =?utf-8?B?eCtXTFV0c3BOTmtOTE1FSlg3RDU1TkpNa2ZxNFBKL2ovOTd0alh3SGVGbERp?=
 =?utf-8?B?OXlFc2owUjNMUEtGSkpNbzBwaStKNG5KVitRUDlueVJ3dXAwUTN5bHNzS0VT?=
 =?utf-8?B?a2pxNTFBdmVHalFmRXBiWElNSVJYamIzWUVqa0N4Z05zZ1A5RHNrbk9sUHNs?=
 =?utf-8?B?OWlIakQ2QUJQOFB4QjFOQmptYUczdVhveEtlOWszUUtmUkp6TFdYMFd0VGpz?=
 =?utf-8?B?d0I1Z2RCQzZoRDJDKzNvbGlGdS9hUHAyY0ZVUktsMExIbVhpdzF0S2tuQWlr?=
 =?utf-8?B?QUtUMENVTGdhTkJ2S0V0L0FRYTRISFdsS2FuemNXVkN4Vmo4Tit6RTB3cUcx?=
 =?utf-8?B?SXNQTDd6VG9oVnVZdWxHSmVwZmFRM1dXNzR3aFRIcHAweHIwaWJsVWM0QU9u?=
 =?utf-8?B?L2FvaXUreGNCaXRaVWRZYnJOalNlTWJsbmRlRDBucFhsMkREQ1ROM0NjbGRP?=
 =?utf-8?B?THdtMEFOVDBsMjl6bUhTL3RmVWlrVmlMQkRqdUtqaTVKOC9YS01taDQ2Zlhx?=
 =?utf-8?B?cmJwZWIvMVdDVDJJdFlZMndBZ0xncVVlK292eTl0UFFZOGFjUHNyZllsaE5h?=
 =?utf-8?B?NFlmUjZ4YVBoVnlkTXEwTUR1U2NBcnZINzdvNmsyTEJldU5aTk4rNWhYdXNL?=
 =?utf-8?B?U2FIc3I1K0wwWHQ2U3lqSTZ2MTViSlFjWFN4cUs0RUtXM2Q5WGJzWXB1MGRR?=
 =?utf-8?B?eFRpVW5VSS9uZnZlbjc0cTh0c29jdkwxNXVGdEVNNTZjZzhpbkIzdld5YWN2?=
 =?utf-8?B?S0JxSWFJVm9iUlM5Wmx5NjRpeUQwc2NOTERPTmdQNklZdm02TXEzcjJkUHdh?=
 =?utf-8?B?REpUd2tPOHQyMXcwYzdRT1RzVTlKZ2MyV1E1blFSUlRIcjZjMlNBVUlUNDZ3?=
 =?utf-8?B?aGtCak5MUzVRWERYdnhibXdSNXJrdWVBNnRLNCtSalVYSXFPRzNZNmRYQ3Iy?=
 =?utf-8?B?eVYrS3Z5aW9JOTN2dVdNVzgwbjNxTDh4eTg2Z2NvMzVGRDI4L0FBai91aHhs?=
 =?utf-8?B?TFVZS2hvMExLbExrZjJWZ0ZnSE5DNkdGK1RnYTJkbnFWUEgzZXVadz09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 935637be-7d4a-4c08-c0b5-08df43a9ad80
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5521.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 06:20:15.1333
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2vyjR1GQTBgVn5RjfV+mJLzE3Z3stIhOYCySCgKqcmXNApKI8CJJ/RPVzsxz7Zrfrw7CtztUSxB98ji+cEQHtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7507
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_222026_221770_E3C9307E 
X-CRM114-Status: GOOD (  16.23  )
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

SGkgTmVpbCwKClBhdGNoZXMgWzEvNl0gYW5kIFsyLzZdIG9mIHRoaXMgc2VyaWVzIGFkZCBhIG5l
dyBTTUMgY29tbWFuZCBpbgptZXNvbi9maXJtd2FyZSwgd2hpY2ggcmVxdWlyZWQgYnkgdGhlIFM0
IHN0YXRlbGVzcyB2aWRlbyBkZWNvZGVyCnRvIGxvYWQgdGhlIGZpcndhcmUgdmlhIFNNQy4KCkR1
cmluZyB0aGUgcmV2aWV3IG9mIHRoaXMgc2VyaWVzLCB0aGUgbWVkaWEgbWFpbnRhaW5lciwgTmlj
b2xhcywKcmVxdWVzdGVkIHRoYXQgdGhlc2UgdHdvIHBhdGNoZXMgYmUgbWVyZ2VkIGZpcnN0LCBz
byB0aGF0IHRoZQpyZW1haW5pbmcgbWVkaWEgcGF0Y2hlcyBjYW4gcHJvY2VlZCBvbiB0b3Agb2Yg
dGhlbS4gSGUgaXMgZmluZQp3aXRoIGVpdGhlciBhcHByb2FjaCwgbWVyZ2luZyB0aGVtIGFsb25n
IHdpdGggdGhpcyBzZXJpZXMsIG9yCnNwbGl0dGluZyB0aGVtIG91dCBpbnRvIGEgc2VwYXJhdGUg
cGF0Y2hzZXQuCgpTbyBpZiB0aGVzZSB0d28gcGF0Y2hlcyBsb29rIGZpbmUgdG8geW91LCBhbiBB
Y2tlZC1ieSB3b3VsZCBsZXQKdGhlbSBnbyB0aHJvdWdoIHRoZSBtZWRpYSB0cmVlIGFoZWFkIG9m
IHRoZSByZXN0LiBPciB3ZSB3b3VsZAphbHNvIGJlIGhhcHB5IHRvIHNwbGl0IHRoZW0gb3V0IGFu
ZCBzZW5kIGEgc2VwYXJhdGUgc2VyaWVzIGlmCnlvdSB0aGluayBpdCB3b3VsZCBiZSBiZXR0ZXIu
IEFuecKgc3VnZ2VzdGlvbiBvciByZXZpZXcgZmVlZGJhY2sKd291bGQgYmUgbXVjaCBhcHByZWNp
YXRlZC4KCkJlc3QgcmVnYXJkcywKClpoZW50YW8KCj4gRnJvbTogWmhlbnRhbyBHdW8gPHpoZW50
YW8uZ3VvQGFtbG9naWMuY29tPgo+Cj4gQWRkIFNNX0xPQURfVklERU9fRlcgdG8gdGhlIHNlY3Vy
ZSBtb25pdG9yIGNvbW1hbmQgZW51bQo+IHRvIGFsbG93IGRlY29kZXIgZHJpdmVycyB0byBsb2Fk
IGZpcm13YXJlIHRocm91Z2ggdGhlIG1lc29uX3NtCj4gaW50ZXJmYWNlLgo+Cj4gU2lnbmVkLW9m
Zi1ieTogWmhlbnRhbyBHdW8gPHpoZW50YW8uZ3VvQGFtbG9naWMuY29tPgo+IC0tLQo+ICAgaW5j
bHVkZS9saW51eC9maXJtd2FyZS9tZXNvbi9tZXNvbl9zbS5oIHwgMSArCj4gICAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKykKPgo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2Zpcm13
YXJlL21lc29uL21lc29uX3NtLmggYi9pbmNsdWRlL2xpbnV4L2Zpcm13YXJlL21lc29uL21lc29u
X3NtLmgKPiBpbmRleCAzZWJjMmJkOWE5NzYuLjNiOTBiNDlkMDU1MiAxMDA2NDQKPiAtLS0gYS9p
bmNsdWRlL2xpbnV4L2Zpcm13YXJlL21lc29uL21lc29uX3NtLmgKPiArKysgYi9pbmNsdWRlL2xp
bnV4L2Zpcm13YXJlL21lc29uL21lc29uX3NtLmgKPiBAQCAtMTUsNiArMTUsNyBAQCBlbnVtIHsK
PiAgICAgICAgICBTTV9USEVSTUFMX0NBTElCX1JFQUQsCj4gICAgICAgICAgU01fQTFfUFdSQ19T
RVQsCj4gICAgICAgICAgU01fQTFfUFdSQ19HRVQsCj4gKyAgICAgICBTTV9MT0FEX1ZJREVPX0ZX
LAo+ICAgfTsKPgo+ICAgc3RydWN0IG1lc29uX3NtX2Zpcm13YXJlOwo+Cj4gLS0KPiAyLjQyLjAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFt
bG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
