Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 622E3C07E8E
	for <linux-amlogic@archiver.kernel.org>; Wed, 24 Apr 2024 11:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3SpcGal9e2lJ3CLCcwf2wHt9sBoM+X4xpFxhYDOQgLw=; b=hfghTL6R0GmY/9SPJaBLm7363/
	BKCKxFVfwkKyppzOgvAwW53AD0rviMT9Maln7um8Wv5MA1VahbXJc/IcHzLlTaHMZQWdG83HJgkK5
	vMxx3I/XYT7ZJ/r8iZ5aA11elKgOOe716QhDFPRTkMsk19K2soHXaSHrgcX8fDJjEigHWgCz3M3J+
	0l4SPFEw24DHMTDTx9JVqhf/ZtxBZBlcQNuyZtAjjRoAJseawbcdSjY4Dixm5X9dzXqiLV9ieY4QO
	J3Ety4Toj4dWYoV8nRXBvayaoETFw6OUDzhJcun02Ppr6Uwzff8BcBgu2JkrUC82qgT/CTVHKqgqL
	CKjRwGaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzb3u-00000003wvV-1wMr;
	Wed, 24 Apr 2024 11:45:18 +0000
Received: from mail-tyzapc01on20700.outbound.protection.outlook.com ([2a01:111:f403:2011::700] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzb3p-00000003wpG-3Gmn;
	Wed, 24 Apr 2024 11:45:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b8QCefKw5xWlyBrQKJ5v2Qc2gueC2RV/6xgsr5upMHCsR+gtCMgEKDquBsgMofkR2ykfpVytysYaxcTALT2VqZXrfxgEFpE0ZR66Z1Hfo3EBo5nEoVlMbjdxsxxHSl57wjyLjUqnkn5UMNrskXTJRD6MvU+RpjfJcDNc6RCl/GqohSEU9+nhdcPBirGqOwAXPFmgSleRZ9dX2jpsYEWJpocSyf/89hXLXMotWzZH+PJjMhPjepbbnYujeiTWUPYWBqkC11hQZ7m/PKSUgyxQYbqi4qyTxttOPTxrfW0ZFCo5qgH9fE+mWSRtj+PSLWQ0e25coJtTQkpuqAzONK0w6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OhgWJl2YQp1nPx5KAAYKPc7sk4JECAu0OEBthrslMvU=;
 b=bm2KcBdNGlaJQOnda6vDLYVw+s94PzDcBIp+XnWybdhExDTS2fU4DID+74nW6ThabEmtXktNAGcwfpLO1FkkJ4JmObwwYmeoxKjZiL3kSSN0V+eWi6n3IOdG9E+qNyZ5RExTq4JBtXU67C8cQX5XaUpGs2Icoz7llRP30mFyiolYLp9fJcqPQCNJYaPgs9HNDBiaHk+ZxQcM2TurlY7hCxNvbvfCWDoZPQ05ljk8bm2Ah5L0LeJatnS3aVEW86wcaZB53sQsctHTzMNPvtZlkd6pTIcGdYKZ2ivtOj6UxZMFp5GgdbqTxe+96CBEoyo7rTrzDx2CcV/p6QGI20KzZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OhgWJl2YQp1nPx5KAAYKPc7sk4JECAu0OEBthrslMvU=;
 b=hyY8wM+Nfo5WQjhVKseYut61kaLmUlf1C5fm10O9thWKR4UQc4Rw56Rf77giOm/tQQviwtT5LTHSUjwYXyK5XdCCVmfQzKClEwgteOr7bc98Or0ykaVMHRnoutyxmxUml/MNPjEEdL3fGn3yD+m4S4O7DZDih7FT5k+9PydoMFrq2wpvfOUC7gWE7FIoQXPEVpDUO9Elurucmf6PFzQQ/nrDUkhGit6hrGQj6MR3kT661mAFcqN7cwIJx1t04/sEbZ9mHlolj0r2hurx+9xhGmhIsRCMVmynxD/7E9aqeexUGpWI+tQ63w9TcMQUpVgc5IG4P6kCZY43Wgoaok5JOA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB5743.apcprd03.prod.outlook.com (2603:1096:400:74::7)
 by JH0PR03MB7344.apcprd03.prod.outlook.com (2603:1096:990:16::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Wed, 24 Apr
 2024 11:44:54 +0000
Received: from TYZPR03MB5743.apcprd03.prod.outlook.com
 ([fe80::340d:421c:7221:56e6]) by TYZPR03MB5743.apcprd03.prod.outlook.com
 ([fe80::340d:421c:7221:56e6%7]) with mapi id 15.20.7519.021; Wed, 24 Apr 2024
 11:44:53 +0000
Message-ID: <d990d835-e4bb-4248-b17e-da8907cf16e7@amlogic.com>
Date: Wed, 24 Apr 2024 19:44:08 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] pwm: meson: Add support for Amlogic S4 PWM
To: Jerome Brunet <jbrunet@baylibre.com>, kelvin.zhang@amlogic.com,
 George Stark <gnstark@salutedevices.com>
Cc: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-pwm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20240424-s4-pwm-v4-0-ee22effd40d0@amlogic.com>
 <20240424-s4-pwm-v4-1-ee22effd40d0@amlogic.com>
 <1jil07f3ps.fsf@starbuckisacylon.baylibre.com>
Content-Language: en-GB
From: Junyi Zhao <junyi.zhao@amlogic.com>
In-Reply-To: <1jil07f3ps.fsf@starbuckisacylon.baylibre.com>
X-ClientProxiedBy: SG2PR03CA0126.apcprd03.prod.outlook.com
 (2603:1096:4:91::30) To TYZPR03MB5743.apcprd03.prod.outlook.com
 (2603:1096:400:74::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB5743:EE_|JH0PR03MB7344:EE_
X-MS-Office365-Filtering-Correlation-Id: 307286c3-e97f-4493-25c7-08dc6453f4d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eHl5UlRnZGtlYmZhSmZSVkdSTHZuMGI4dGZZd0RxZm9GMkRTbDEwRGZSR0h4?=
 =?utf-8?B?UmNuWHpUYWZ6RlB5UVI5a3lpYmcrWFZETmxCVjc2TWN1L2F1UzBVRFM2ZlB1?=
 =?utf-8?B?TFJlMXlra3RnTDdlZ3pQeExuRzluc0R1QmI0SnVOZTBnNXFmUXcrUDlyMHNP?=
 =?utf-8?B?STVnM3d0N0s4R0hIbWJJUHlkMzRYb0xpaTBMaVVOdFArd0lrRXl4a2VkTzE3?=
 =?utf-8?B?Q2ptUzBtdEF2K1hvZWlORlhMYjlzWlFQZng1c05pQWlOTVhFWTQ5MFJCYVEz?=
 =?utf-8?B?dkFCR3VINHJZZTYxQ1lReXowdU90WS9INlhmcExiYnVyM0I2OFhNcVlDS29l?=
 =?utf-8?B?bXFBRnhPQStBVzdFYXRacjBoeVNzdXpjS1RjSE5UajJoaXo1VDlCUE12TkVz?=
 =?utf-8?B?RGpDSmQ0cUhaQUhHaVcrWVFMSk1xKzlYS0xNOVBGN0FnQ2VxU1lWcUU0cW5J?=
 =?utf-8?B?c1VBU0ZhSFZxTlB1N2Zva2pMU0RmVnplbmxaYWw3WWpPWTJiUDNPZU5ZdXNu?=
 =?utf-8?B?NVNSOVpqN1lHUTd2T1lQMHlSYklIY2E1amlaaDVrMmtpZk85VXJvSWk0UzJG?=
 =?utf-8?B?bGo5aWo1eUgydGVvWjVBV0tudzU5VFBWTFZBVmh6ZkRpNzAxVUJtdWhjL28z?=
 =?utf-8?B?eTdkcWVOYUtCRlptWURBUDRUUFJCdUxsWkprT3ZqZmFtdzRvVGNRaWlMNG5j?=
 =?utf-8?B?U1paejF0bkF3MVRpajRjUTM5TFJNbmU1OXhSL0tldVQ3OWgzQVNhWGU1NzFY?=
 =?utf-8?B?YkgvRjM3RjQ0SWtwdUplWXQ3YkFQMDhRSDVOTnNUbGM0WkIrTnBwU1orT0J4?=
 =?utf-8?B?eEJybFZGS3hDQXV3S0Q4N3lJL3F3Q2U3UWxUcUx6RGlGYm44UW13aHkxN2wx?=
 =?utf-8?B?Mm52TTE4N0kzeEs5bG9IbUoyaWZwWTVrcEFiOFhRR2VyL1RVNnhUZWg5MFFK?=
 =?utf-8?B?SURMMnQ1dW1EeWVsOC9TVXdLQ3RQV3FnSkg3enR1UU1qdVJEeXcrTmdwRWYx?=
 =?utf-8?B?UkhaSkJoeFRDT0kydk9IU3puUHhHV2RGOXVGeTNGR1dza2EyMDhTOW5sV240?=
 =?utf-8?B?YWxBQ210TCtMNXRIRTd0WW1TVFhKWkM4SHdzT3JXbXdRSTIxRmNWRkpUSWZH?=
 =?utf-8?B?Vmt4ZW8yYUtlS0RBSjJUM1lTMzd6d1djZVRGK3hZdXVsNFNacEZmUURSU0xs?=
 =?utf-8?B?STdEejhCOTVtcmtjNWF2WjZZcHRUZjA5ZGFXVE9ycktGZkpuNWtqQStOMjhJ?=
 =?utf-8?B?dlg0aEVoRWVndHNJd0xETXFGMUFkSDVSY2M1Ni9zelIrR3cvNjdmYUNrNDli?=
 =?utf-8?B?S1gzYmdyRWVad3NOd1FTTk03MGk1WXhrUHpHWVJuVTdwaFZHTytRdEIxUVkr?=
 =?utf-8?B?d3FBQ2g3bks4UFA0VzhTZnlZUk5raysyckFGK1h1ajBkb0loQzNyMWZ6RktB?=
 =?utf-8?B?ZWMyZTRZTis0aHZlc1BMVDZ3bUlvM2ZERHJtTUhkZFg3Y3ViVFR4ZFBmQkFx?=
 =?utf-8?B?T3RDeDFNWFppWXBVMmpqTGd0c3cyMlg2TXRQS0lkR1RBdDN3Ty9OaWNmeGtO?=
 =?utf-8?B?SWlQWVhibytRN011eW5tZkhlL3AzNjlWSUFpM0t0bFhQYzIvMThMaWFFZUdD?=
 =?utf-8?B?b1VQUnF1eFJrK3FOR0EvZkVsaE5mWG1nS2VyY3E0TXR6WGlQMWFHVTBIMzU4?=
 =?utf-8?B?aXpNZDM4LzVYeHpBQ1o5bERYbHorRVByRVVuTXV6ZDBKNXVqdUY5VWZnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB5743.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(7416005)(1800799015)(376005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WTJWR1c3ZUpwSEc1M3ZGVzJkL21GNXhLcUN3WTVVYnlUdHdpTnMvbnR1TVRr?=
 =?utf-8?B?VGMyZ1UyVDZBbjhWS3lRUG9IUW9YWEkyYmpGU0hiL1ZqUDM2VUxMcDBmNjlr?=
 =?utf-8?B?SXNCaml3Wkd1ZFVYSFhJYVlsQjlSQUt4VXhWd0xyVCttWTgySGJhYjBUZEJC?=
 =?utf-8?B?ZTlBalhjbmt4c1VGelRRbHNoM3JPS2FUZlREdjdTOE1ORTFnTytSMnRsWEli?=
 =?utf-8?B?OVc1bjQwK1ZoZ1QvNkR3L0ZFWTljaWxxNjNrcEsvRCtscjZYTnBpNTU3WjFG?=
 =?utf-8?B?Q0U3WGozb1Zza3RiSXg2WGpBK3M1di9DQXJCa085bzlrUVh5V0plVGhIMGRZ?=
 =?utf-8?B?UmpzNWd6U3pzZXVvUmk1dnNsM0hQUkpvNnliOGNaTVNyNkszK3QrVW9OaVE0?=
 =?utf-8?B?ZytCQW9ZVG91TlV0ckdFMHBPc00yb3E1Sll2R1V4UFVDcmtUb1dWU2JueTNM?=
 =?utf-8?B?YnQydHBaVGxhS3ViQVZrV1daRkR0TVhhV1ZIZ0J5MG1sL0FzUXNNanZUL0RU?=
 =?utf-8?B?RWh4VVp1MVFMaWEvWldqWGh1OUtrdFl6WWJOK2N1K0JSTmtvNjByVXhkVkZN?=
 =?utf-8?B?bndEazN0YnNRdjZaYkM5RVpCejA5RWtobUIxalBsc3N0YUoxTk93RU9JNEdG?=
 =?utf-8?B?NmZwdE9TMjNpVWl0VkhUNFAyYTI3dk1CY0dyeFpwWmdGUUttMjNYWjZFbnN3?=
 =?utf-8?B?T3J3R0lERGtWYVhqVDBSbWplajE0eDI3V3o1dG5GaDlWdUp6T3VVS0hTRUpp?=
 =?utf-8?B?ZEk2eWxSelNJdlk1c2laV3ozZ2pYRHBPTXZLa25TL2U4ME9QSzFFR3RSSVox?=
 =?utf-8?B?Y0RVZzFFdnBmdGR0dDZlL2N6WlZOeEhEQTdNRXB2aG1XOS9aY1lwdGxNSjZT?=
 =?utf-8?B?OEVYcVlLeTVWS2luZC9sWlJaWHhtRmgxUnlpdlpYYnpMbnJBQm8vZ0Vra2JH?=
 =?utf-8?B?bVloZ0w3RzhpbzJBMHlOdXNIblpLYTM2WlFkblhlNjZqQXBDM00wM3RNSHF5?=
 =?utf-8?B?V0w0ZEhzMDRISk5HQkJ5MURpbXJsbXlvWVdFMjNDaTBhVVA1NWtGajR2QWhv?=
 =?utf-8?B?eFhnOUkzWWU4Y2Nsd043V3Z6UENwdlpQbFd2enN3N0pQMjNXYWVuNUtDREJ6?=
 =?utf-8?B?SkhKSDJnTmNPcW40eUEwSU5EQUF0Q3V4U3dkLzR2dkM5Rk5jMVVuakRLY2lH?=
 =?utf-8?B?YmR1c1ZBZWRQYWdOd0J4Q2ttREJ6cjhDVFVXU0doTk5HOWRVZlYyWEJPRU9j?=
 =?utf-8?B?OHFPaDlnVVNlaURQUzNzdGJmemhvN1lnOTU1UGZESGljMStydDdKK2tsV2d6?=
 =?utf-8?B?UWZzcUxYenc1QnR2ZDhPUitMbURWdUJpMWRYZ09vR29USWZiY2xmSlZCOG9F?=
 =?utf-8?B?NFJtWmxhMWNGQWwvWGdVTnlxd2pDSnNHYXd3M2tyQUxwbGxkc0g1dkRoQ2xP?=
 =?utf-8?B?S0FuZHpqRThubHpRUnJHMk56dzhzOFh1TXdkUktldFViWVh3VUFwVkV4VXI5?=
 =?utf-8?B?VzU5SStCRWdUOEZMelJHMXdDTnRXSDYwS1BLLzJaS1pScHRSYjhyOXIxUlhH?=
 =?utf-8?B?ZGxYYWdJbHcvRlJLS3Nlc3lhcWUyb3RPM1REVTlOYjFQcmF0ZmRqaHQ3U0dM?=
 =?utf-8?B?VU9qQnRrbVpXbWdQTWdPZ0t5aGd0dDRTV2RDUTJBTDdleElXRHlXMlpYTnZC?=
 =?utf-8?B?aFFJaWlsSEVmYzlsVVNlZmJsc2lBZkNubDdUczFLSzZwaFZZYU5vTWhTeUJQ?=
 =?utf-8?B?R096UzZJNkF1SW5yV1haMEEyMFE3aWdKU0p2NURCY0lYdTVSYldqSHdaRHRR?=
 =?utf-8?B?Ym1UMXJqazdTMXlUbHRiVTB6dmRuS1pIRG1CQ1FyV1c4QjY1WWp0Q21pYW05?=
 =?utf-8?B?QytQQ1Q3YzBYVUZLa1Q3R2RzSXdsNVBxWGxFRWFsOSt3VVJaSUkxRzdVa043?=
 =?utf-8?B?dEEreU55RUgxcmRNVkYwUzVtMmx4UUZKc1AwRXZabWxVeXRzZW5lWW5wRDRp?=
 =?utf-8?B?S3pUZXYxZ3JJU3pObi9uYkZZdExLbHIxVmp2d0VGOGNCVnAwOFEvK2J3am9W?=
 =?utf-8?B?SVdGd0kvZzRnSVAvU0toRDFBUGdpanZJLy8rdWkyVnhLdERtRjUzMEhZeDdT?=
 =?utf-8?Q?t2odUm94jR9MmOHg7LAWiEwFV?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 307286c3-e97f-4493-25c7-08dc6453f4d5
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB5743.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2024 11:44:53.4559
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g0C4yg5GuSS7l8CEwI0XSd4sgjlLLkG4c8uwdsNHg/shwyYP99QMd0GVyxrMoFTkgsJW/CiLwJ2pC9BaXQIYTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB7344
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_044513_870170_D16A1875 
X-CRM114-Status: GOOD (  20.21  )
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

CgpPbiAyMDI0LzQvMjQgMTg6MzIsIEplcm9tZSBCcnVuZXQgd3JvdGU6Cj4gWyBFWFRFUk5BTCBF
TUFJTCBdCj4gCj4gT24gV2VkIDI0IEFwciAyMDI0IGF0IDE4OjI4LCBLZWx2aW4gWmhhbmcgdmlh
IEI0IFJlbGF5IDxkZXZudWxsK2tlbHZpbi56aGFuZy5hbWxvZ2ljLmNvbUBrZXJuZWwub3JnPiB3
cm90ZToKPiAKPj4gRnJvbTogSnVueWkgWmhhbyA8anVueWkuemhhb0BhbWxvZ2ljLmNvbT4KPj4K
Pj4gVGhpcyBwYXRjaCBhZGRzIHN1cHBvcnQgZm9yIEFtbG9naWMgUzQgUFdNLgo+Pgo+PiBTaWdu
ZWQtb2ZmLWJ5OiBKdW55aSBaaGFvIDxqdW55aS56aGFvQGFtbG9naWMuY29tPgo+PiBTaWduZWQt
b2ZmLWJ5OiBLZWx2aW4gWmhhbmcgPGtlbHZpbi56aGFuZ0BhbWxvZ2ljLmNvbT4KPj4gLS0tCj4+
ICAgZHJpdmVycy9wd20vcHdtLW1lc29uLmMgfCAzNyArKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDM3IGluc2VydGlvbnMoKykKPj4KPj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvcHdtL3B3bS1tZXNvbi5jIGIvZHJpdmVycy9wd20vcHdtLW1l
c29uLmMKPj4gaW5kZXggZWE5NmM1OTczNDg4Li42YWJjODIzNzQ1ZTQgMTAwNjQ0Cj4+IC0tLSBh
L2RyaXZlcnMvcHdtL3B3bS1tZXNvbi5jCj4+ICsrKyBiL2RyaXZlcnMvcHdtL3B3bS1tZXNvbi5j
Cj4+IEBAIC00NjIsNiArNDYyLDM1IEBAIHN0YXRpYyBpbnQgbWVzb25fcHdtX2luaXRfY2hhbm5l
bHNfbWVzb244Yl92MihzdHJ1Y3QgcHdtX2NoaXAgKmNoaXApCj4+ICAgICAgICByZXR1cm4gbWVz
b25fcHdtX2luaXRfY2xvY2tzX21lc29uOGIoY2hpcCwgbXV4X3BhcmVudF9kYXRhKTsKPj4gICB9
Cj4+Cj4+ICtzdGF0aWMgaW50IG1lc29uX3B3bV9pbml0X2NoYW5uZWxzX21lc29uX3M0KHN0cnVj
dCBwd21fY2hpcCAqY2hpcCkKPj4gK3sKPj4gKyAgICAgaW50IGksIHJldDsKPj4gKyAgICAgc3Ry
dWN0IGRldmljZSAqZGV2ID0gcHdtY2hpcF9wYXJlbnQoY2hpcCk7Cj4+ICsgICAgIHN0cnVjdCBk
ZXZpY2Vfbm9kZSAqbnAgPSBkZXYtPm9mX25vZGU7Cj4+ICsgICAgIHN0cnVjdCBtZXNvbl9wd20g
Km1lc29uID0gdG9fbWVzb25fcHdtKGNoaXApOwo+PiArICAgICBzdHJ1Y3QgbWVzb25fcHdtX2No
YW5uZWwgKmNoYW5uZWw7Cj4+ICsKPj4gKyAgICAgZm9yIChpID0gMDsgaSA8IE1FU09OX05VTV9Q
V01TOyBpKyspIHsKPj4gKyAgICAgICAgICAgICBjaGFubmVsID0gJm1lc29uLT5jaGFubmVsc1tp
XTsKPj4gKyAgICAgICAgICAgICBjaGFubmVsLT5jbGsgPSBvZl9jbGtfZ2V0KG5wLCBpKTsKPj4g
KyAgICAgICAgICAgICBpZiAoSVNfRVJSKGNoYW5uZWwtPmNsaykpIHsKPj4gKyAgICAgICAgICAg
ICAgICAgICAgIHJldCA9IFBUUl9FUlIoY2hhbm5lbC0+Y2xrKTsKPj4gKyAgICAgICAgICAgICAg
ICAgICAgIGRldl9lcnJfcHJvYmUoZGV2LCByZXQsICJGYWlsZWQgdG8gZ2V0IGNsa1xuIik7Cj4+
ICsgICAgICAgICAgICAgICAgICAgICBnb3RvIGVycjsKPj4gKyAgICAgICAgICAgICB9Cj4+ICsg
ICAgIH0KPj4gKwo+PiArICAgICByZXR1cm4gMDsKPj4gKwo+PiArZXJyOgo+PiArICAgICB3aGls
ZSAoLS1pID49IDApIHsKPj4gKyAgICAgICAgICAgICBjaGFubmVsID0gJm1lc29uLT5jaGFubmVs
c1tpXTsKPj4gKyAgICAgICAgICAgICBjbGtfcHV0KGNoYW5uZWwtPmNsayk7Cj4gCj4gRmluZSBv
biBlcnJvciBidXQgbGVha3Mgb24gbW9kdWxlIHVubG9hZC4KPiAKPiBTYW1lIGFzIEdlb3JnZSwK
PiAKPiBBZGQgdGhlIGRldm0gdmFyaWFudCBvZiBvZl9jbGtfZ2V0KCkgaWYgeW91IG11c3QuCj4g
VXNlIGRldm1fYWRkX2FjdGlvbl9vcl9yZXNldCgpIG90aGVyd2lzZQpIaSBqZXJvbe+8jGJ1dCB3
ZSBoYXZlIGRpc2N1c3NlZCBiZWZvcmUuZGV2bSB2YXJpYW50IHN1Y2ggYXMgZm9sbG93c++8mgpk
ZXZtX2Nsa19nZXRfZW5hYmxlKHN0cnVjdCBkZXZpY2UgKiBkZXYsIGNoYXIgKiBpZCkKc3RydWN0
IGNsayAqZGV2bV9jbGtfZ2V0KHN0cnVjdCBkZXZpY2UgKmRldiwgY29uc3QgY2hhciAqaWQpCnN0
cnVjdCBjbGsgKmRldm1fY2xrX2dldF9vcHRpb25hbChzdHJ1Y3QgZGV2aWNlICpkZXYsIGNvbnN0
IGNoYXIgKmlkKQoKYWZ0ZXIgaSBjaGVjayBhcGkgcGFybSAsdGhlc2UgYXBpJ3MgMnJkIHBhcm0g
ImlkIiBpcyBzdHJpbmcgbm90IGluZGV4LgpiZWNhdXNlIGR0IGJpbmRpbmcgaGF2ZSBubyBuYW1l
IHByb3BlcnR5LiBjb3VsZCB3ZSB1c2UgZGV2be+8nwo+IAo+IENvdWxkIHBsZWFzZSBzeW5jaHJv
bml6ZSB0aGlzIHNlcmllcyB3aXRoIEdlb3JnZSBhbmQgZGVhbCB3aXRoIGFsbCB0aGUKPiBzdXBw
b3J0ZWQgU29DcyA/IGExLCBzNCwgdDcsIGMzIC4uLgo+IAo+PiArICAgICB9Cj4+ICsKPj4gKyAg
ICAgcmV0dXJuIHJldDsKPj4gK30KPj4gKwo+PiAgIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbWVzb25f
cHdtX2RhdGEgcHdtX21lc29uOGJfZGF0YSA9IHsKPj4gICAgICAgIC5wYXJlbnRfbmFtZXMgPSB7
ICJ4dGFsIiwgTlVMTCwgImZjbGtfZGl2NCIsICJmY2xrX2RpdjMiIH0sCj4+ICAgICAgICAuY2hh
bm5lbHNfaW5pdCA9IG1lc29uX3B3bV9pbml0X2NoYW5uZWxzX21lc29uOGJfbGVnYWN5LAo+PiBA
QCAtNTAwLDYgKzUyOSwxMCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG1lc29uX3B3bV9kYXRhIHB3
bV9tZXNvbjhfdjJfZGF0YSA9IHsKPj4gICAgICAgIC5jaGFubmVsc19pbml0ID0gbWVzb25fcHdt
X2luaXRfY2hhbm5lbHNfbWVzb244Yl92MiwKPj4gICB9Owo+Pgo+PiArc3RhdGljIGNvbnN0IHN0
cnVjdCBtZXNvbl9wd21fZGF0YSBwd21fbWVzb25fczRfZGF0YSA9IHsKPj4gKyAgICAgLmNoYW5u
ZWxzX2luaXQgPSBtZXNvbl9wd21faW5pdF9jaGFubmVsc19tZXNvbl9zNCwKPj4gK307Cj4+ICsK
Pj4gICBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBtZXNvbl9wd21fbWF0Y2hlc1td
ID0gewo+PiAgICAgICAgewo+PiAgICAgICAgICAgICAgICAuY29tcGF0aWJsZSA9ICJhbWxvZ2lj
LG1lc29uOC1wd20tdjIiLAo+PiBAQCAtNTM4LDYgKzU3MSwxMCBAQCBzdGF0aWMgY29uc3Qgc3Ry
dWN0IG9mX2RldmljZV9pZCBtZXNvbl9wd21fbWF0Y2hlc1tdID0gewo+PiAgICAgICAgICAgICAg
ICAuY29tcGF0aWJsZSA9ICJhbWxvZ2ljLG1lc29uLWcxMmEtYW8tcHdtLWNkIiwKPj4gICAgICAg
ICAgICAgICAgLmRhdGEgPSAmcHdtX2cxMmFfYW9fY2RfZGF0YQo+PiAgICAgICAgfSwKPj4gKyAg
ICAgewo+PiArICAgICAgICAgICAgIC5jb21wYXRpYmxlID0gImFtbG9naWMsbWVzb24tczQtcHdt
IiwKPj4gKyAgICAgICAgICAgICAuZGF0YSA9ICZwd21fbWVzb25fczRfZGF0YQo+PiArICAgICB9
LAo+PiAgICAgICAge30sCj4+ICAgfTsKPj4gICBNT0RVTEVfREVWSUNFX1RBQkxFKG9mLCBtZXNv
bl9wd21fbWF0Y2hlcyk7Cj4gCj4gCj4gLS0KPiBKZXJvbWUKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0Cmxp
bnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
