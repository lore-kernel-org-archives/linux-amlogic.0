Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36379606A31C
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Nov 2026 14:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=H4LVeB1t;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=amlogic.com header.i=@amlogic.com header.a=rsa-sha256 header.s=selector1 header.b=hL2WGzF+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=5jmbcY8iR3PHWydQeRj2OkjEfpjTTItH0iJhphM6MmM=; b=H4LVeB1tlWNQYnEjqyJVmmBqSo
	sOoWXrIid5Ao1qq6FlaSk7nKlhxWg9RjGNGwGXJxJsHnagBIZk4T20yi/yhvhucy9vIy0xcp1GhHI
	UbUu5vc1Xl2x0mPvbIrEoVgdD+gizb2UbYw3ul4NeQRv3EaZuDN8cESbyA8Qnct008OOvEp4+l3Lx
	zrgZWrmRAOsOX+K4OV2EbHdh0FXtUFKCax7s+z5++tbuCNSYIUidR8KgFEQt7ALQX4OosiV6Fo56D
	Fum4mphT8vS/iAkrddGru8SfEs1gsU/uc1hfGBu6Pmt7GbpBaJLOZMrk4flqLQ6uc4JPoLIGlEikm
	0KNog6WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSxYf-00000002nhk-0efM;
	Mon, 16 Nov 2026 14:19:45 +0000
Received: from mail-koreacentralazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c40f::6] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSxYc-00000002ngU-0VUI;
	Mon, 16 Nov 2026 14:19:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LmhoaGtwwzdLJhjMn8kUrDHvAz2zD6kDGbmEaD1I0R9CPMTgERcxiFXxFDz8wYO29ZDz+tbaDkaUcEYMEXvMK+NKbj5+kA67lwYDU06uZgoNh1E4DKiGoEMg1q/ReHDc61sd72O4iWC7i9y4owt9Shy46v1pKsBgei037MlvFKApdCLVOK7XqT0IMGKe7Be8h2O1DafEdvx2KrLm2hkhojVJNcjLBXoWyOJvV2jvUHg3+ZTkklvBI78moTc1KR9ToJe6jPYxpZQ+qYCkiiKDbTJckAyPtajyXVkO82C72I10FBGZPeD7HZ7iGUdMYDpW8Xmpjai6+3p+NlAd4p+rbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+I2KrwARNAIHmxonHJimQwIvKJHCFXgrvJPOS+54VLI=;
 b=sLTorfOmXqQQ9vbpP0fgoibYH6mjjz+F1+XviUKCVif9B8Jfmo5CMRm5vi65uDFqWvZE+/Po/B2YCYJIST21GmP7sOy9OMmY6/GQrYmXrxWIH19IfJA+InbupBSPlYhaE+sB4y8WzNDvAaYpfpT6qTa5yu0QdKHa29m2vV652qA5Y2H7zoRXskYgDWt5oQTSeNvXbf6mNCFYuCIcXpOWuHMaND2WxcVLlRi2Lzw/GKwZwic+i7dlKwh/XhExiOXGnomcAcpIuACIU44SUC59hNa94hQVcnBd6kJBH+nLsd/B+wrpRUUMk9rDK88Fi8e0nz4j/Gs5TcfAtxCoAVELEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+I2KrwARNAIHmxonHJimQwIvKJHCFXgrvJPOS+54VLI=;
 b=hL2WGzF+aG1ycQo/aC6JfE1mFnFRwXARxqd0TGOb4GBeD73VPSIACvxQD6c+zTWK6CgbCmpxy4P+iqMOkn+TM/xxR6U8RrjyZF3csBSci+hFGGAl4rtvQYI0hfnEwtAevnryR0xnwbO9S2fiF+M4G506ckNFwp4BJxYGZdLkm2I4dKNzpeiMjz7nl2rCzfCv9DjnH9ApdpagS4ve6E2NhMhFYksAPpjhsyWSlXEHCIjQwMzTSaHmLbIINGxZCnYCXn0q12PmNiqgE0n2XYyhBoqQtRpRmdWc2CuC/lgkM+yieOOmM0mACAwrayFplzPHC57M4HFuqbDLzUeiMA1xiQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com (2603:1096:820:6d::13)
 by KUYPR03MB10483.apcprd03.prod.outlook.com (2603:1096:d10:71::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 14:19:32 +0000
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::e1e:5c95:a889:828e]) by KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::e1e:5c95:a889:828e%4]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 14:19:31 +0000
Message-ID: <469f431e-de89-4d42-bc66-488ac5610162@amlogic.com>
Date: Mon, 16 Nov 2026 22:19:27 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/7] dt-bindings: net: add amlogic,t7-dwmac
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Lucas Tanure <tanure@linux.com>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 davem@davemloft.net, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261113121852.334604-1-tanure@linux.com>
 <20261113121852.334604-3-tanure@linux.com>
 <CAFBinCB+DkFDwXm9L+NYgtsUNR2F01xhJJnHN_8ydcRjcpNU3g@mail.gmail.com>
From: Chuan Liu <chuan.liu@amlogic.com>
In-Reply-To: <CAFBinCB+DkFDwXm9L+NYgtsUNR2F01xhJJnHN_8ydcRjcpNU3g@mail.gmail.com>
X-ClientProxiedBy: SI1PR02CA0029.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::20) To KL1PR03MB5778.apcprd03.prod.outlook.com
 (2603:1096:820:6d::13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5778:EE_|KUYPR03MB10483:EE_
X-MS-Office365-Filtering-Correlation-Id: eeda1cff-f781-4785-2c04-08df43eca1bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016|23010399003|4143699003|5023799004|11063799006|10067099003|56012099006|261026140227099003|261028144727099003|261022075727099003|261022105027099003|261021121427099003|261021123027099003|261102123227099003|261009223027099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: iWAARYwkm5O9kW8Ps8IRpZ9wXIJBXw1+IX+yTPKwANam6LTAQnu9awTJN8ML3W7RZIsVscQ291zEzF6CAxvsIOOPMMme72qgXBY5ngHCLbOu3PIPXBzDaBxiTHydgbvAW74oyW6YNEqmoPsyzQcqA82EeWbbW9HO5oseoSnD/eULzL5694rIBkzkCW7Q7TWm0+X6WPgB1GPp5Ly6W1B6RIsv2iBBmUrMjDhofz2gtXjz8Us6zSx4hDlujtj7W8brbO2VeGwGuYfLu1bK/YzicXP0dmgd75U6aDUj/Ef7lCX0RpqjUKAJJg6FySvlYduFdM2uVCgKMhXwkl6vtbK1ztjChq5a85KHiMzdrR4wg9uI/E1fKGuFZ/w8NudYBD6LAaIv4nna+tAWW0LMgE1DEFIdzHycp9pXF+9W8EYBJE0gf2VxsaisYPCKLTG1aVdkEHDORJidolSlsPsXp8fmBVwMxNpajVBIBrjOWWT8M8pbZ+EugkqNhmplTq5nkvgWuvdqjK+YwszWpul4R92Qj+wa+mOnFtTVDsukQXAqz/blauW2rgzGX8FT1zZOGsLqPm+cyD+jtvqqnnbwzEPB1U8+pHEGdmbmvaZqQWl5mMmSxoWGd3PRIx2kZYWF/YP+
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5778.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016)(23010399003)(4143699003)(5023799004)(11063799006)(10067099003)(56012099006)(261026140227099003)(261028144727099003)(261022075727099003)(261022105027099003)(261021121427099003)(261021123027099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?czlPakVXZk5GdkY1Ny9tZ0o5QlZSc0Q1dGlaVWRDV1J6ZjhEL1UrSWdac2lL?=
 =?utf-8?B?RkhUb0pkeWdWaTZjT1RDdTMzSE5rVHBPaWZYNHJSVno1eUVlcG9pUHZ6ME9H?=
 =?utf-8?B?TFRPeFl3YUVYaEtYWXJiNDJoU3NNbkE0NkdsRzlmTk5kOUZUZmhOc2E3MzJO?=
 =?utf-8?B?Mzl0c0lkWjRHR2svYWtLZVRCU0ZWZkJXd3crT1ZQZTc2czZPZmdtVXY1QlFJ?=
 =?utf-8?B?Sk55Y2RvL0JnbGVpZlFISzBYNlBEZ2h6ZnhndjZTU0k5NkV2bnhEd2xyUWJU?=
 =?utf-8?B?TSs1TWl1T2xKSnA2SmJ2VUlvcUs3am1EZG5ObmZ3QjA0TFBUVFBNTjZjcURP?=
 =?utf-8?B?SE1FN3N3Q3ViRktHZTJOcjcraURJZEJBK1pHZVZXZ0pnV01GODJwSXpUeHp5?=
 =?utf-8?B?VDdKTDRBbW4wUHNEZ2MzRm9ZdzBFUHkzdHh3MGpFb0VubGpoWTBVczgvYVFv?=
 =?utf-8?B?RUFYTjBrYzhYb3NLZ1dlWlpvb2dlaStwQVlkdjRQQ0xON1VBUlBYS213RHRp?=
 =?utf-8?B?a0krM01GaVhRaGVCRmhib3N4SVEvYTBFZEVqRVR0MXgrWVZSUmN4b3RDK1ZF?=
 =?utf-8?B?MnhYVnBQZ1A5SGUvSmdRVjVmNVQvRTJvUy9ZWG82d0xZWCt5cEJmbmJhYlR1?=
 =?utf-8?B?REZ5d2hBQVZUYm1RUGhpenlWSjU4dXNva21SaytKTHVILzE5NUZXQXJWL0t6?=
 =?utf-8?B?VGc1OEYxZnM0RkMxVGpVOThQeXhsbkRidm8wU1JPSFAvaEJpMGptdEE4c0VR?=
 =?utf-8?B?R0tUWitQeGs0bkMxQkdaWWFKdnliazZ5ZGwyellrNXpVUzAvbU5xMlcwMlFm?=
 =?utf-8?B?UVBkZGo1U0haZ3ViNm9DMDA0cXllaHJXT3gxdHBlbHhvYVFBVm93RCtaNVE4?=
 =?utf-8?B?OVlmempuNFRyMldHUkhKSzl0NWlveWxVSlZXYWREdEdpVzBYcVVXc3A2dzc4?=
 =?utf-8?B?ZGJWT25qZEJRUzV3WmhzeEs5QXIwcUFzeXNGcHplbzZFZ2diNkNya2xkL0JO?=
 =?utf-8?B?Uk8zN010NGtORG12cHdFZnlxUTlPV1haUWpLT3dxVUhFeU83WGVQVk1WSFpk?=
 =?utf-8?B?Zmx5bWIxQ09qdHhrZEFQanVFWCtOaFNWekJ6YWkvK2o3TUVJRnNQSHhya2kr?=
 =?utf-8?B?UEovSjNOOTF6YTVBS0tDeExhclJpOTBkUnJvR0pZRituZHBIVm9wR24rMHNS?=
 =?utf-8?B?VWczSkd2OTduTGlKUzNRUzN3MWo4a0xtaWlvazJ1MVA0YlRlNkJKZHRLYlA3?=
 =?utf-8?B?RmswRjNZdmlXdlUvSEFoYmErM0FxTDdiZEViZTVBclRiVkx2S1AvRDVsQUNo?=
 =?utf-8?B?S3VGbjU4dXVzREtiWG4vSWY0NWtwTFE5Yk9EdGV4ZGRIM3Y4QWtGRkNZeVZi?=
 =?utf-8?B?aVViejJMbkFYdW1OUlhSWm9uUkEyN0dJY3N0bncvSHUzQ1NEb0V5bjVrSS9u?=
 =?utf-8?B?aXBlVGsrSWhQMlBmYUtjVmRmeFU2V01SYzNqNUNMTDdqOVlLcU90aGxVdlkz?=
 =?utf-8?B?TmF3RDRpQ0xTMjJERnhDSVhhbk9FWDdSYmM5YzJvVUZzSEtXYU8xTGw1TTJD?=
 =?utf-8?B?YlpaOGp4d0gwYlg1TTU3ZW5ydXEyVlJ4MmFZQjM4QnBoT1BSRXBmcUVqUHdk?=
 =?utf-8?B?VjlNbmxsM1p3K0JTb2ZUWW1YMVBDT1AzS3VLUjRGamNEb1Q4VzRkd3NETkN2?=
 =?utf-8?B?SUxDZjJCSjVwYjVlOUwrU0lSa2U5ZkRNYkJKWjA3VVFhZW16aDR6S0ZVUkkv?=
 =?utf-8?B?V01jako1MzdRa0FrR2NLKzR0UDlaMkhldVM5WnFmT1dkMDZFZFoxdDY0Q3Qw?=
 =?utf-8?B?b2JLZUgwWUVFSEJlWFlaaXRJd3NOczdGZ2kvUW5BSU9QdFVCd3MvSUJRbmtV?=
 =?utf-8?B?TjUzZlFzc1ZlaWNjaGEvQmdXOHFXWmRabUVPZHJlaGpHN3pVVjVKWTZYSFJR?=
 =?utf-8?B?NTdscVM3ZjhkZE1zMXFLYlhMZEExQ24xYnczekJ1dDBHS3JWRE1mZy9UNXNt?=
 =?utf-8?B?TXNvRVhKckVpUGZqam5OYUhHQVErQWVCc1ltUTB5ZDJ0VENZdFJ0TnZhWWps?=
 =?utf-8?B?aVlWS25lZE1TM2p0RkNIMjEwOWE1Z2w3c0ppS0hCSkx3a3pKOEJjYmpNSWpo?=
 =?utf-8?B?TUM2SVNVeEFKZnlVVkVoZHRGRDZIWnY2QXFOM1R5QmJzeDhTQ1RZK2MxU0Jx?=
 =?utf-8?B?cWx6ZjJQeHpYN0czdVZYUVhpalhjcGdkNDFYdm9JTlo2RHlaVHo5OEpqaEw2?=
 =?utf-8?B?dkRLUjlXRkxwMUZHV3BLeFNteEh3enJKSS9ZSGlVRnVXZjVsazVSRVpEdERK?=
 =?utf-8?B?WUE3dWZCcThjTmtMKzB3Tm9JQUpZZE1OWUZxQ2FQcWQ0enhPREJFdz09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eeda1cff-f781-4785-2c04-08df43eca1bd
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5778.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 14:19:31.6194
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fxAIeAVt2YY/AJaPpJXQKz7Y2IEIwzhD4/CV4UVX2O45JpiPnEYPvs1CwucItYhufeG8G/yxF6SJPuDYNXYdkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUYPR03MB10483
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_061942_160966_4460FB77 
X-CRM114-Status: GOOD (  14.92  )
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

SGkgTWFydGluLCBDYyBMdWNhcywgQ29ub3IsCgpPbiAxMS8xNi8yMDI2IDE6NTYgQU0sIE1hcnRp
biBCbHVtZW5zdGluZ2wgd3JvdGU6Cj4gT24gRnJpLCBOb3YgMTMsIDIwMjYgYXQgMToxOOKAr1BN
IEx1Y2FzIFRhbnVyZSA8dGFudXJlQGxpbnV4LmNvbT4gd3JvdGU6Cj4+Cj4+IFRoZSBUNyBoYXMg
dGhlIHNhbWUgZXRoZXJuZXQgZ2x1ZSBhcyB0aGUgRzEyQSBidXQgbmVlZHMgdHdvIGNsb2NrcyBv
Zgo+PiBpdHMgb3duLiBUaGUgY29udHJvbGxlciByZWFjaGVzIG1lbW9yeSB0aHJvdWdoIGEgcGlw
ZWxpbmUgc3RhZ2Ugd2l0aAo+PiBpdHMgb3duIGdhdGU7IG5vdGhpbmcgZWxzZSBjbGFpbXMgaXQs
IHNvIGl0IGlzIHN3aXRjaGVkIG9mZiBhcyB1bnVzZWQKPj4gYW5kIHRyYW5zZmVycyBuZXZlciBm
aW5pc2guIFRoZSBnbHVlIHJlZ2lzdGVycyBzaGFyZSBhIGdhdGUgd2l0aCB0aGUKPj4gTURJTyBt
dWx0aXBsZXhlciwgd2hpY2ggcHJvYmVzIGFmdGVyIHRoZSBjb250cm9sbGVyIGhhcyBwcm9ncmFt
bWVkCj4+IHRoZW06IHRoZSB3cml0ZXMgYXJlIGxvc3QgYW5kIHRoZSBwb3J0IGtlZXBzIHRoZSBi
b290bG9hZGVyJ3MgZGVsYXlzLgo+Pgo+PiBXaXRoIGEgbmV3ZXIgY29yZSwgYSBjbG9jayBsaXN0
IG9mIGl0cyBvd24gYW5kIGRlbGF5cyB0aGF0IGZvbGxvdwo+PiBldGhlcm5ldC1jb250cm9sbGVy
LnlhbWwsIHRoZSBUNyBnZXRzIGEgYmluZGluZyBvZiBpdHMgb3duOiB0aGUgUEhZCj4+IGFkZHMg
dGhlIDJucywgYW5kIG9ubHkgdGhlIHJlY2VpdmUgZGVsYXkgbGluZSBvZmZlcnMgZmluZSB0dW5p
bmcsIHNvCj4+IG9ubHkgcngtaW50ZXJuYWwtZGVsYXktcHMgaXMgdmFsaWQgaGVyZS4KPj4KPj4g
U2lnbmVkLW9mZi1ieTogTHVjYXMgVGFudXJlIDx0YW51cmVAbGludXguY29tPgo+IExvb2tzIGdv
b2QgdG8gbWUgaW4gZ2VuZXJhbAo+IAo+IFsuLi5dCj4+ICsgICAgICAtIGRlc2NyaXB0aW9uOgo+
PiArICAgICAgICAgIEFQQiBjbG9jayBvZiB0aGUgZ2x1ZSByZWdpc3RlcnMgUFJHX0VUSDAgYW5k
IFBSR19FVEgxLgo+PiArICAgICAgICAgIFdpdGhvdXQgaXQsIHRoZXkgcmVhZCBhcyB6ZXJvIGFu
ZCBpZ25vcmUgd3JpdGVzLgo+IFBsZWFzZSBnaXZlIENodWFuIExpdSBhIGZldyBkYXlzIHRvIGNs
YXJpZnkgdGhpcyBjbG9jayBpbnB1dDogWzBdCgpUaGFua3MgZm9yIHRoZSByZW1pbmRlciwgSSBo
YXZlIGNvbmZpcm1lZCB0aGF0IEx1Y2FzJyB1bmRlcnN0YW5kaW5nIGlzIApyaWdodC4gSXQgaXMg
aW5kZWVkIG5lY2Vzc2FyeSB0byByZWx5IG9uIHRoaXMgY2xvY2sgdG8gYWNjZXNzIFBSR19FVEgw
IAphbmQgUFJHX0VUSDEgbm9ybWFsbHkuIEkgaGF2ZSByZXBsaWVkIGluIHRoZSBwYXRjaCBvZiB2
NSBbMF0uCgpbMF0gCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWFtbG9naWMvYmQ0Yzhh
MTUtYWIxMy00NTlmLThmYjUtZmUzZjNiMDRhZjQzQGFtbG9naWMuY29tLwoKPiBJdCB3b3VsZCBi
ZSBncmVhdCBpZiBoZSBjb3VsZCBwcm92aWRlIG1vcmUgZGV0YWlscyBvbiBpdC4gSWYgdGhlcmUn
cwo+IG5vIHJlcGx5IHRoZW4gSSBzdWdnZXN0IGdvaW5nIHdpdGggTHVjYXMnIHRlc3RpbmcgZmlu
ZGluZyB0aG91Z2gKPiAod2hpY2ggbWVhbnMgdGhhdCBjbG9jayBpbnB1dCBpcyBjb3JyZWN0KQo+
IAo+IAo+IFswXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1hbWxvZ2ljL0NBSlhfUSsw
c2VGd0R2ZDZ6a3NMbkpqV1lKSlkxUWNMYzFnQWpyPUZOMXArYVRkdW1wd0BtYWlsLmdtYWlsLmNv
bS8KCi0tIApCZXN0IHJlZ2FyZHMsCkNodWFuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1s
b2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
