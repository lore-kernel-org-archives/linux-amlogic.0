Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC40BE77188
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Dec 2024 07:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yWvBz3hu86uK1q/+bNhp6Ni/00/Yw04S0ljh4ASHMWI=; b=ieBeoAXE90j1Oy2bGNHQRw1rqg
	ke43wOT+06E70khakUPtputa5Ccp/TMNITtQnwRx20T6jgFeDya2ywa+VzLafSvj6e5+Hg5OVF+mI
	WPQiNQlNUgyFNqmiqrg5SaY5snA3/ehNWYgn37j4TFqMb0Zt6nf8gVxij3n6kSa7b0P6GToEoqzlg
	fET9C4o0ONyvxcwvV++Y9BzLB7WLxGsfdahMJzxW2oerCQ0nQnqanJy0EbsktJoB2pSynlLi2Sy4d
	RuGKijKN/8d0wOcYSneZwbdH2AVsAow3waMXINDabjsv1+MwgU6J6KBLq4rVKbj0Gd6wPC3MTeJLp
	C7IreRbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQieA-0000000FQEz-3yrP;
	Thu, 26 Dec 2024 07:51:06 +0000
Received: from mail-tyzapc01on2072f.outbound.protection.outlook.com ([2a01:111:f403:2011::72f] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQicx-0000000FQ4W-19DG;
	Thu, 26 Dec 2024 07:49:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qwv8iqJ8K4UE1dFE09pfoUMVu42hO5ySSIRtM0eff5fmWLVzHGAOfAV2oIxd/dSVxdQOcNFU1p4VrUgDfLG+GHIjYlQgoa1LzmGv1BMe+Z9TOK/bG/1M4xrgKkFm14s2tTAL7SUwOmpwZ4iUj+tXWUx8Frn7BQ/1lQD7NdUQulQtEo/uNkxfZipt7vWcPS5I8VpfR8NbyHC6iRdGOsuZXjl77xJkwTJvY0EMBUw0vU6IzWfIlM8hSVY5LBSMlHy9X/KDvB3diJ+YiK8fSjHNalBwkW0JV1XMyV/6f08lldL6FrU73G39FAr9UME2feAtqh0OTEbwcmi5rUsd/QmhGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZuWTqFAywmtnUuYv7lQ2NMnpuX1vQ0m6HPH2pCbZv/E=;
 b=faJIQRNa61it1ew+QoR8sTkwDazHOJLkfooVQwQq/u/7LfVvemcehLKGC2HOHR1LWp0Mo4qHgDb6/Yhc7W79y1/LlM4+RIY+jTFEW9XlXsKuJJ5JWN0lEB2XyUC2RTtk7PAIXiwZeOBzazo072Wt0R1zl+79QodWv+O/2pCmYuQ5sauz63XplRPSaJxM71+mNqcMPUpMbuGz4B+NlkXQ3JWlw3JDB851MkU4CI9C1AX3f3K6YHa60jN3rqhIFtub0JS2x0kHzmcvDRYlzz7TGXjns7CvabGhdWXCgL5BGEMcgIspRCOh/g8uY4278h80apSq9lUejIOdHLgd82mzjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZuWTqFAywmtnUuYv7lQ2NMnpuX1vQ0m6HPH2pCbZv/E=;
 b=pHYVO+e3ltjAfHodjtfCxsRfQLcW3sC3v873pt7wX7k/VuPlk2+0cZr9Is9W6M6G4LoUdl3hKALEuZC7MN5UGwMHlLjSAEwEgWQKVP73MczYiiVTQtQQmG4+LWYZao5FAd7AF96Uu2/n63Hj7lXtZK93cjv6XsjD8+u9l9MTLvOwM/TLSW8JKvFIR0zVg8aTBe5cfXaaLzfpMVGihEkAH9lUKd6wYXTx1iREpJQlEhJ1SR6EW7/HnB0C1CC6EEc3XcRIXOjrS2uQ/jGsRQYfVdYGha/wd2VN4nByGIohAnG7jhdCBABa7X8xECJjOFQWP0IARBzmBviXxNWAs2mEpA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by SEZPR03MB7403.apcprd03.prod.outlook.com (2603:1096:101:12d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.14; Thu, 26 Dec
 2024 07:49:32 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123%7]) with mapi id 15.20.8293.000; Thu, 26 Dec 2024
 07:49:31 +0000
Message-ID: <cd67acd0-2595-496d-a725-6c3e509492aa@amlogic.com>
Date: Thu, 26 Dec 2024 15:49:28 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 2/3] pinctrl: Add driver support for Amlogic SoCs
Content-Language: en-US
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
References: <20241211-amlogic-pinctrl-v1-0-410727335119@amlogic.com>
 <20241211-amlogic-pinctrl-v1-2-410727335119@amlogic.com>
 <CACRpkdbuj-_sPpdfcyg3_QNtzt9r7n-0HBGBKgy-rKUMhvGo4w@mail.gmail.com>
 <23899c54-14ad-4724-9336-2df6fb485fd6@amlogic.com>
 <CACRpkdZn75ks4Gc7rm8jzkKM6y0JeQmUF3qmbJA+O+cEA9r--Q@mail.gmail.com>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <CACRpkdZn75ks4Gc7rm8jzkKM6y0JeQmUF3qmbJA+O+cEA9r--Q@mail.gmail.com>
X-ClientProxiedBy: TYCP286CA0166.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c6::17) To TYZPR03MB6896.apcprd03.prod.outlook.com
 (2603:1096:400:289::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|SEZPR03MB7403:EE_
X-MS-Office365-Filtering-Correlation-Id: 10c2afc9-b507-41db-0370-08dd2581d554
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cVFnSzlmS0EvY0tjSU96K1FZZSsrV0QyZkl3SzJ6SVF3Z1RBbmxORUx1bTYx?=
 =?utf-8?B?allud2o1ZTFrYUpKKzJHRkpKODV3ZW1KNVZmMis5ZlZrMENuUXB5OHF0WCtZ?=
 =?utf-8?B?Kyt1bnVxSFNycWN4WldmK1FxenhtVDFjdU5JSUVrWmFDN3B6WlBSc1AwY0RS?=
 =?utf-8?B?UHpUUFBwSTBNbGg1MXNFekpkYlBIa2pwYTA2TlI5dVAvbnNMK2k1Z1dNaU5C?=
 =?utf-8?B?L0dOWmVLV0Y4ZzZybXhXS3VwbFh4Z2VLZTRjVkNyc1p5OHNsMXVRN3VGOUxF?=
 =?utf-8?B?WTROMUFwV2l4bkNtcGZHS051MDY4TE5UcjNvU20yZ1NwV1l3VUlMdnhWZWhS?=
 =?utf-8?B?QmJEWkpybmV1cUxINVlWdS9GczFPMEJDQ3l0Q2tmSk1YUWk4bEVvV2x2bU9U?=
 =?utf-8?B?SmVPZFhNNUlqQnRMcVBFUmJaOHErM1oybSs4RUFoc0l1OHZYMlp0YWRmc3NB?=
 =?utf-8?B?UzJOeUpnUUhFSEl6amtGVGJRK3VFanM5d1p4ZXBsdE5RUE9TUzVrcHJvZzRp?=
 =?utf-8?B?RGFhajJrWXZJeU50QWtlSG5EZlpkalNISXkwWnBZVW5kYnZNYjdiQ2IxOXMz?=
 =?utf-8?B?dFZwZWxGd1lDS3BHS3pvMUZPWGNXRTcwMHV5Zmw2N1BERU9teFl5bU5DTDZR?=
 =?utf-8?B?RWlPY2VlVkZPdk1KL2dEc2NJenA4cmdMWTJHQkc0b05adjdoc3VNUFN5Yk9G?=
 =?utf-8?B?SW1tUW9yMExjQTBJVFlpTmtna29wQWpXOGY1TElOZ2Y3YjBGaEc1YmtxZEpO?=
 =?utf-8?B?Wlo5dEhCdXRuZmVVVGk0WHhxQ0NUdU1mZzJhYk9xQ0hMRFVad0pwTlVYNGkw?=
 =?utf-8?B?MUJyYXdnRjNlSmhvakxqL0U3Yk51Q1BWa1hEVnhlVE8xN3JDS3kyVnZ5enk3?=
 =?utf-8?B?d1N0TmVDMkpCV1pKMEE1RERWSlNhVFdtU1lFREI1QmlSODh6ZldZeEkvYVNI?=
 =?utf-8?B?OUVUTUlySnZVanc5ZDBDUjFZaDY5Zkd6NUJITDdaMytjTXYwc1FMb0dXSVQ4?=
 =?utf-8?B?MVBnTTBrMFhBTUlEc2hZYWtYR29wK05FdUNSTktHcnlVWkxiT29hR3dIYVFl?=
 =?utf-8?B?YTMwM1JzMzYwRks5QmlCTjJhQ2lMaWVTanh3cGtNa1o5WkJLNnZjQktKYTJE?=
 =?utf-8?B?eDdzYVo3aGtUL2p1Z0FoMVkzb2h2QitML2FXVUNwb282VTYyWnV2enJ5K3BL?=
 =?utf-8?B?cXVtUzdhSjlRTDFhcG1ndHljQzZReisvaXA2cjZhQi9FVW82MWFEc1ZJWjU1?=
 =?utf-8?B?SWpUNUVpaG9oMTdHZGpjMXFVUHlzTmF3a0hrdkR2WGFEZ3JZQ0J6U3BndHJT?=
 =?utf-8?B?SFZTVzFPMzFtTklWNythK0pFa251T1VKQm5QcmRqYTZZajRoL2hPS0h1SFdE?=
 =?utf-8?B?QmJ5ZU1GOHpVMzNLMUpoQnlLRTZZVUlWMTljQU56RkhMb1hlN2pDUmMwK3Jo?=
 =?utf-8?B?TDN3bTd3K3poMUtVbjlZRzBEWlRQMzRQdU41NHVrcFZ6QXlXSWdvaERnZC9J?=
 =?utf-8?B?VU15SGdqNDU4OU12SExKekVqNmVESU90Z3pGQ3lnVnFPUTFlY3c1a2N1dVhk?=
 =?utf-8?B?Q3lNZ3d2THlKMmwzeURDR0RmVGZaT3IxL1NySTFhMWdnUGl5VXVVLzZtOG5y?=
 =?utf-8?B?RzNuUWI3aVhVL2dyQWV6ajBoaTNicEliS3UwckdPUFdTK0laUGZnK3M1cVlT?=
 =?utf-8?B?aGFaVUllcjFTWU8zNUxLbVRZYll5K3VoWkF2V20xWTNoOXdPNXhuUm02QzNw?=
 =?utf-8?B?MFpZdTZPdGIvVm1ZWHNFb0FBaU51alZoMFI3dE0raytIaVJ6MHlvTXIvTk9K?=
 =?utf-8?B?aWZGWWpHMW9aZktOSEQ0TkJqRUQ4ZUJNNk4va3ptZ2Y2NjZpUEZ5bzVpVXVW?=
 =?utf-8?Q?OT7wgHD4mtR8W?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WmtYSnpXZzRsa29uVmVZdXZuZ2NEaDhYZlU0TU9ZTzZnVVRxckxUQmpySVg4?=
 =?utf-8?B?N290RGN1NmR1N2JyZkV2NXJvQlJNWUxsQ24zVE9Vdld1bXVGZjJpMWRyeGlH?=
 =?utf-8?B?QlllN1FaWmF5Snd5UFhWclZCUnh3RDF0eWdUZktxMnJhZkRhME1qdFFpNCtP?=
 =?utf-8?B?MGNiay82NkVLbWxxY1JqZDc0TFp3eXFtandDbVQxNC9ITWowTDJxb3V2dm93?=
 =?utf-8?B?N3RSelBJMlBhdHJxYkZXbUhYZWRYTHBxcVkwV1RYb1hhRytOWXloVjF3cTZW?=
 =?utf-8?B?aGl0TWhkaWUwRHhvbFRvZVNvZzJuT2p1WVZRVGpveGFoWjRuYk9Oakd2dnNw?=
 =?utf-8?B?OURuRHRNREp3eHVMTjJ1NldocWFCTWNsdDZPYnYvdEZqS01tVk9peEJUZjFv?=
 =?utf-8?B?bmxwTk5OZWZ5T3V0RkdDd1N3dGlGeWtza2dyaXp4MzZnM3pUUEg3MHNHQVZy?=
 =?utf-8?B?K0N2Y2dscFpZWmxVTXhSTlZuT05QeDZiMzNTREt1Y1ZoM205dFNpcnQvTXEw?=
 =?utf-8?B?cE9NT3p3U0FDVWNtV3RVTEd6bEVwUXNmWVFxaFBDK05DbHRaekFlYWVreWpE?=
 =?utf-8?B?dGJDRC9EaHJEbHdIQ3NETmVYcTJPcjJseFo4Q0RBOG5GS3dJVGJja2d1T0E0?=
 =?utf-8?B?YW40TGUwdFBxVFFqN3l0ZC9LekN5RkF4c3dDNGpNaFpiRkl0WDZpeGpDc1Rs?=
 =?utf-8?B?ekpkWHV4T3ExNEdtSUlabmpJbFI3V0lQdmV2bjVNMkVBemVtZzU3aUppTWdT?=
 =?utf-8?B?YVpoU3pRMXJ5VVF6YXNHbGUzU1R6bjlybGhVRndsdmtJSGRJMWdCWWxZQVYw?=
 =?utf-8?B?cENkYU5DdGNFeUN1aFp0NEFtcURPN2dTMW90NVhpUktWWVJCaHBlbmlJVVdE?=
 =?utf-8?B?L1VtUTduZVNMNE1ybS84WFBkNDhjRWtWOGp1ZDdISjQ4dElPck1ucnQzOGJw?=
 =?utf-8?B?WjY1TDkwWFd2RjVJUXZpOHpPNVBSR1ZVTEoxek1aaTV0dnRIeCt4SS83azhi?=
 =?utf-8?B?RnErN21XY29Kek9mZmM4L05FK1R6azZPSWpqS05ZRURuZFVCN3VGbjcyNWUw?=
 =?utf-8?B?MWszRFI2VGU5ZFlsOG5kWFhBRzhuRzluTXNzdHdaODFFRkg5amdrOFJjUmV6?=
 =?utf-8?B?S2JPY3JYR21BK1J0K1l6d0JlMEpaVUJYakxVNDRiUThjbCtSVjlKdlVoYTRo?=
 =?utf-8?B?cklXSVV6UTB0d2VOeGNsZUxkbWJ5bStvVGNnVTZ6WncvblM5QkJYTXBrUkNp?=
 =?utf-8?B?UVY4UUQ4M21zV1dVU3d5bmNJWG9WWjRmRFY3c2tSV2pBblJmaDR1RHQ3dmtx?=
 =?utf-8?B?VFViWjNqejJVZi9ZR1lBSjhRVGsraHNhbWZNNWRQQ1YvKzluWG1tQkFuMUhM?=
 =?utf-8?B?TUNRWkhrRzV4Snl6OXZYOE94MzBRbmM1VG1Ld0FuM2VucVRRTEZKWU5oMGtp?=
 =?utf-8?B?WE5rQjdkUitDUFZQNmxPTGJTeHNBWUkwNUJ0QTFQem9VOU84SjNMNnFhMmY4?=
 =?utf-8?B?TEY2R0ZRcTRjWEhCNXV0OEZ2MHpqdWRaNXJLbkExV2lGaTBxNlM0eUoxbTBR?=
 =?utf-8?B?UUUzZGp3a1M3ME0yMUxFcnRqNGJoR25HalNnU2hSQ0kvMzJDSDdYczJocThL?=
 =?utf-8?B?NVRQbWlndXdLcWI5MCtHbW5EM3JDYnV1OEFVMnNDVERPdVNZaUdhNkdrbXNF?=
 =?utf-8?B?WHRLQ0xUekpXTE9UTGVhajZPZU4wRkZsSUFyM1FzSjdiVFBDbFFzOXlYelRT?=
 =?utf-8?B?MUNDTnVEcTF1T3RReXl4Q2paQ2xsM1JmdXlaZ0dYMFFxK2tsMGREWjl6RmJv?=
 =?utf-8?B?NUVYTEM4QkJra1kyVlZ1WFNsS0tsYlFXVDZEckllUFpoaFpRcnZwT1NoN000?=
 =?utf-8?B?K2l1S1N1K3JrSXhJaW5uRklacGtTMjBVUVJYS0V5YlZrNDlHQTh6VnFZOU1O?=
 =?utf-8?B?TjRXcVgxNnFVSm5kRitnVWE2TFRoU0sxMkZkUWhkMktkTUNUWkxDSEVac2xp?=
 =?utf-8?B?SldnMUo2MXpoSEdkSDA2dGlud05OQUJUK1JuQWUwNnFNdkg5cVpseDUzT1Zt?=
 =?utf-8?B?TXVielBJWGVidVREZU9TVnlUakFkMVFqUzBHVHhjOVFJL0ZKV0RlRzhHaFN4?=
 =?utf-8?B?bDRjYldoa1gvempYaGY5WldtZnZmNkhHdXg2SC9DMG51Rit2UnV0WUdtaVli?=
 =?utf-8?B?RGc9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10c2afc9-b507-41db-0370-08dd2581d554
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Dec 2024 07:49:31.7998
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tA/L9sUdhUAwQXJUz0XcYWXoOVItkcCp2uTgBlUqk6ajcbbT/2Xh5qQu0I1+I6nVnZBvuaHZwdmvkLQihULf1cTXjyqp1GnuSjvhSTYbLt8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7403
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241225_234951_320290_4DCF7EB2 
X-CRM114-Status: GOOD (  26.66  )
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

SGkgTGludXMsCiAgICBUaGFua3MgZm9yIHlvdXIgcmVwbHkuCgpPbiAyMDI0LzEyLzIyIDE3OjA4
LCBMaW51cyBXYWxsZWlqIHdyb3RlOgo+IFsgRVhURVJOQUwgRU1BSUwgXQo+IAo+IEhpIFhpYW53
ZWkhCj4gCj4gT24gV2VkLCBEZWMgMTgsIDIwMjQgYXQgMTA6MzfigK9BTSBYaWFud2VpIFpoYW8g
PHhpYW53ZWkuemhhb0BhbWxvZ2ljLmNvbT4gd3JvdGU6Cj4gCj4+IFtNZV0KPj4+IEluIGFueSB3
YXkgSSByZWNvbW1lbmQ6Cj4+Pgo+Pj4gLSBSZW5hbWluZyBkcml2ZXJzL3BpbmN0cmwvc3VueGkg
dG8gZHJpdmVycy9waW5jdHJsL2FtbG9naWMKPj4+ICAgICBzbyB3ZSBrZWVwIHRoaXMgc29ydGVk
IGJ5IGFjdHVhbCB2ZW5kb3IsIHN1bnhpIGlzIGFwcGFyZW50bHkKPj4+ICAgICB5b3VycyAoQU1s
b2dpYzpzKSBpc24ndCBpdD8KPj4+Cj4+Cj4+IEl0IGlzbid0LiBTdW54aSBpcyBBbGx3aW5uZXIg
U29Dcy4KPiAKPiBNeSBhcG9sb2dpZXMuIEkgbWl4ZWQgaXQgdXAgY29tcGxldGVseS4gOigKPiAK
PiBXaGF0IGRvIHlvdSB0aGluayBvZiB0aGUgaWRlYSBvZiBhIHNlcGFyYXRlIGRyaXZlcnMvcGlu
Y3RybC9hbWxvZ2ljIGRpcmVjdG9yeQo+IHRob3VnaD8gSSB0aGluayB0aGVyZSBhcmUgYWxyZWFk
eSBxdWl0ZSBhIGZldyBhbWxvZ2ljIFNvQ3MgdGhhdCBuZWVkCj4gdG8gYmUgc3VwcG9ydGVkIGFu
ZCBtb3JlIHdpbGwgY29tZS4KPiAKCiBGcm9tIHRoZSBleGlzdGluZyBzcGVjaWZpY2F0aW9ucyBv
ZiBzZXZlcmFsIHN1YnNlcXVlbnQgY2hpcHMsIHRoZSAKc3VwcG9ydCBmb3IgdGhlIG5ldyBjaGlw
IGRvZXMgbm90IHJlcXVpcmUgYWRkaXRpb25hbCBmaWxlcywgYW5kIHRoZXJlIAptYXkgYmUgYSBs
aXR0bGUgZGlmZmVyZW5jZSBmb3Igc3BlY2lhbCBiYW5rIGluIHRoZSBmdXR1cmUgY2hpcCwgd2hp
Y2ggCmNhbiBiZSBzb2x2ZWQgYnkgcHJpdmF0ZSBhcmNoaXRlY3R1cmUuCgo+Pj4+ICsgICAgICAg
cmV0ID0gcGluY29uZl9nZW5lcmljX3BhcnNlX2R0X2NvbmZpZyhucCwgaW5mby0+cGN0bCwgJmdy
cC0+Y29uZmlncywKPj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgJmdycC0+bnVtX2NvbmZpZ3MpOwo+Pj4KPj4+IEJ1dCBjYW4ndCB5b3UganVzdCBtb3Zl
IHRoaXMgY29kZSBhcm91bmQ/IGdycC0+bnVtX2NvbmZpZ3MgZ2l2ZSB0aGUKPj4+IG51bWJlciBv
ZiBjb25maWdzLCBzbyB3aHkgZG8geW91IGhhdmUgdG8gZ28gYW5kIGxvb2sgdXAgcGlubXV4Cj4+
PiBhYm92ZSwgY2FuJ3QgeW91IGp1c3QgdXNlIGdycC0+bnVtX2NvbmZpZ3MgaW5zdGVhZCBvZiBv
Zl9waW5zCj4+PiBhbmQgbnBpbnMgYWJvdmU/Cj4+Pgo+PiBUaGV5IGFyZSBkaWZmZXJlbnQuCj4+
IFRoZSBvZl9waW5zKGdycC0+bnBpbnMpIHNwZWNpZmllcyB0aGUgbXV4IHZhbHVlcyBmb3IgcGlu
LW11eCByZWdpc3Rlcgo+PiBhbmQgcGluIGluZGV4IGluIHBpbmN0cmwuIEl0IGNhbiBpbmNsdWRl
IG11bHRpcGxlIHBpbnMgaW4gZ3JvdXBzLgo+Pgo+PiBUaGUgZ3JwLT5jb25maWdzIGFuZCBncnAt
Pm51bV9jb25maWdzIHNwZWNpZnkgdGhlIGNvbmZpZ3VyYXRpb24KPj4gaW5mb3JtYXRpb24gZm9y
IGFsbCBwaW5zIG9mIHRoaXMgZ3JvdXBzKHN1Y2ggYXMgYmlhcy1wdWxsLXVwLAo+PiBkcml2ZS1z
dHJlbmd0aC1taWNyb2FtcCkKPj4KPj4gdWFydC1kLXBpbnMyewo+PiAgICAgICAgICBwaW5tdXg9
IDxBTUxfUElOTVVYKEFNTE9HSUNfR1BJT19ULCA3LCBBRjIpPiwKPj4gICAgICAgICAgICAgICAg
ICA8QU1MX1BJTk1VWChBTUxPR0lDX0dQSU9fVCwgOCwgQUYyKT4sCj4+ICAgICAgICAgICAgICAg
ICAgPEFNTF9QSU5NVVgoQU1MT0dJQ19HUElPX1QsIDksIEFGMik+LAo+PiAgICAgICAgICAgICAg
ICAgIDxBTUxfUElOTVVYKEFNTE9HSUNfR1BJT19ULCAxMCwgQUYyKT47Cj4+ICAgICAgICAgIGJp
YXMtcHVsbC11cDsKPj4gICAgICAgICAgZHJpdmUtc3RyZW5ndGgtbWljcm9hbXAgPSA8NDAwMD47
Cj4+IH07Cj4gCj4gT0sgSSBnZXQgaXQgLi4uIEkgdGhpbmsuIEl0J3MgbmljZSB0aGF0IHlvdSBj
b21iaW5lIG11eGluZyBhbmQgcGluIGNvbmZpZwo+IGludG8gdGhlIHNhbWUgbm9kZSBsaWtlIHRo
aXMsIGl0J3MgdmVyeSByZWFkYWJsZS4KPiAKPiBUaGluayBhYm91dCBpZiB5b3UgZXZlbiB3YW50
IHRvIGFkZCBnZW5lcmljIGhlbHBlcnMgZm9yIHRoaXMgaW4KPiB0aGUgZ2VuZXJpYyBjb2RlLgo+
IAoKSSB3aWxsIHRyeSB0byBhZGQgQVBJIGZvciBwaW5tdXggcHJvcGVydHkgdG8gcGluY29uZi1n
ZW5lcmljLmMuCgo+Pj4+ICtzdGF0aWMgdm9pZCBhbWxfcGN0bF9kdF9jaGlsZF9jb3VudChzdHJ1
Y3QgYW1sX3BpbmN0cmwgKmluZm8sCj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgc3RydWN0IGRldmljZV9ub2RlICpucCkKPj4+PiArewo+Pj4+ICsgICAgICAgc3RydWN0
IGRldmljZV9ub2RlICpjaGlsZDsKPj4+PiArCj4+Pj4gKyAgICAgICBmb3JfZWFjaF9jaGlsZF9v
Zl9ub2RlKG5wLCBjaGlsZCkgewo+Pj4+ICsgICAgICAgICAgICAgICBpZiAob2ZfcHJvcGVydHlf
cmVhZF9ib29sKGNoaWxkLCAiZ3Bpby1jb250cm9sbGVyIikpIHsKPj4+PiArICAgICAgICAgICAg
ICAgICAgICAgICBpbmZvLT5uYmFua3MrKzsKPj4+PiArICAgICAgICAgICAgICAgfSBlbHNlIHsK
Pj4+PiArICAgICAgICAgICAgICAgICAgICAgICBpbmZvLT5uZnVuY3Rpb25zKys7Cj4+Pj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgaW5mby0+bmdyb3VwcyArPSBvZl9nZXRfY2hpbGRfY291bnQo
Y2hpbGQpOwo+Pj4+ICsgICAgICAgICAgICAgICB9Cj4+Pj4gKyAgICAgICB9Cj4+Pj4gK30KPj4+
Cj4+PiBUaGlzIGxvb2tzIGxpa2UgYSB3ZWlyZCBkZXBlbmRlbmN5IGJldHdlZW4gZ3BpbyBjaGlw
cyBhbmQKPj4+IHBpbnMgdGhhdCBJIGRvbid0IHF1aXRlIHVuZGVyc3RhbmQuIFNvbWUgY29tbWVu
dHMgYW5kCj4+PiByZWZlcmVuY2VzIHRvIHRoZSBiaW5kaW5ncyB3aWxsIGJlIG5lZWRlZCBzbyBp
dCBpcyBjbGVhcgo+Pj4gd2hhdCBpcyBnb2luZyBvbi4KPj4+Cj4+Cj4+IEEgcGluY3RybCBkZXZp
Y2UgY29udGFpbnMgdHdvIHR5cGVzIG9mIG5vZGVzLiBUaGUgb25lIG5hbWVkIEdQSU8gYmFuawo+
PiB3aGljaCBpbmNsdWRlcyAiZ3Bpby1jb250cm9sbGVyIiBwcm9wZXJ0eS4gVGhlIG90aGVyIG9u
ZSBuYW1lZCBmdW5jdGlvbgo+PiB3aGljaCBpbmNsdWRlcyBvbmUgb3IgbW9yZSBwaW4gZ3JvdXBz
Lgo+PiBUaGUgcGluIGdyb3VwIGluY2x1ZGUgcGlubXV4IHByb3BlcnR5KHBpbiBpbmRleCBpbiBw
aW5jdHJsIGRldixhbmQgbXV4Cj4+IHZsYXVlIGluIG11eCByZWcpIGFuZCBwaW4gY29uZmlndXJh
dGlvbiBwcm9wZXJ0aWVzLgo+IAo+IE9LIEkgIGd1ZXNzIHRoZSBiaW5kaW5nIHBhdGNoIGV4cGxh
aW5zIHdoeSB5b3UgbmVlZCBzZXZlcmFsCj4gc2VwYXJhdGUgZ3BpbyBjb250cm9sbGVyICJiYW5r
IiBub2RlcyBpbnN0ZWFkIG9mIGp1c3QgdGhlIGJhc2UKPiBub2RlIGJlaW5nIG9uZSBmb3IgYWxs
IG9mIHRoZSBwaW5zICh3aGljaCBpcyB0aGUgbW9zdAo+IGNvbW1vbikuIEluIGEgd2F5IEkgbGlr
ZSBpdCBiZWNhdXNlIGl0IG9mdGVuIGhlbHBzIHRvIGRpdmlkZQo+IHVwIEdQSU9zIGJ5IGJhbmsu
Cj4gCj4gWW91cnMsCj4gTGludXMgV2FsbGVpagoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1s
b2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
