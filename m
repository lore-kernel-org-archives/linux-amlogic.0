Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25CE3606A31E
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Nov 2026 12:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4xmQFr8w;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=amlogic.com header.i=@amlogic.com header.a=rsa-sha256 header.s=selector1 header.b=tpbqtlcM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:To:Subject:
	Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=SLgV9qpGgQuVIdu0gPdj0PiHVrok2GnShLWU8nmR1Gg=; b=4xmQFr8wVYUx+gmV9CE703h0Ba
	8v5VqO2pH0Dn+bNXDfCh5l6YSmuXnJbOPWpudl/QAg5qzQF95iG8RAA8fBV8CZMviwJqihQQBaliO
	Z2FZIXpGPJ2OwTe2OSTZckNjXxlXhOG52Wmp2jyUTYQSA9A7QkgFIr2SGxWstEr4JZZ4t45xIwdIp
	PZyvX3kxJQxcIaaaEg9a8Ls5AHdOT/8ENtq4uXTkuc4HXU7MQvusowV4w66mwAOdDAhSYXYkmw+KI
	7CVTS45tOLq2i6LIxKU4g15SSC5nJirYZQnpNx4V0xdJ6ewvB5AgB0P56qtpPrBnh5s3x8DlrV58s
	FuFwzR1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVT5r-00000003Lf2-1H0V;
	Mon, 23 Nov 2026 12:24:23 +0000
Received: from mail-koreacentralazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c40f::6] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVT5o-00000003Ldo-1nnj;
	Mon, 23 Nov 2026 12:24:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FP5BEEozl2QHO19kVo7vL61E4GLmSMODaPO7t7WGtjAHg4S/I6Iva1veUDAXbnlu7ccOZpsjIte3JG3sfd21oLjw79mjIR+5ShOgqbrmxpIjHC0azh9R2GmGg+RHkpgsH1eLYU26nrYR0DTGa+Iq2xIHtkI803oCQYn8z9Tldud2kVdW9fubJFShF+oImRCb0381ON2DaypYBYuV0jovZ5HFgRCTnm1/gJMsIhbAVt2YB6wzdFCbghptDXdophv6X7fk5a/07gsIhROaPffea+xUFQjehsFlAF35LqhO4IG2jLPqCcIgjKl9XbpuZsD5eo8hKhogczujFiymSFwPEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qe+WnX/uVdFD9IZfK7yAjEwOAl/mxKoAfroHvk6dJHw=;
 b=sf9ZdHMZOsEow5u3/LBmW5b3bjP39iefsyNIjs7spOpdyOxjMH4nBaWA4RN50UyAqA59Olp3tGeDRSSL2cwZFsbQCYAoBCVOrg/27G4MJ/VysffNK1+l6Mg+rWKrZVV7N0g0dgWK3w/DX0X+bZrGNAcugvs8f8F2EKf7cYdyGZBlWI3EEqkwSH2KB5xvHL1Xq0VeCqcJVHHiMoG40DVDO9fQ00KoCgr3ZsSpnu8uoJYPbrfsGmQGxVVluk+A0qmL7HN0irrXgG3xFrPPJ32YdyuQXzuPdppSbh5FxStD2iHhu6yTNTXRjK8gJZb9nzbqy1xexrtrQKVFEIza17BMWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qe+WnX/uVdFD9IZfK7yAjEwOAl/mxKoAfroHvk6dJHw=;
 b=tpbqtlcMu4DZA1yXwF6Oae7k19T1sv39Gr44j++wpJ3fU5H2Bka0g6uX25P4WPpcBlB/WSqyZbgU5XR9SQtxSAwKLQs1gm1376tWyi1tY/iX6MUl9hzyBRsNematUtIIl1UVKkwMzE0uJPG+ToCtQAmC3IIM0xcn4hiM4feVKRoVK2mNA1ogG+7WHvdpVZYpA/TOdhwIhLGuxP/hw36XVv8XGGG3m0UqTbQoXFAwPEWNb/5mXsHnCIENX2ncwduMvtqf7BaxgwYmGGfhA1naSZIwuQU8X7q0xtzqMoRFcB9A4WH+BOeJVcLndP+DpCUdAwXekPsCk2MaKCEQ3JtCIw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com (2603:1096:820:6d::13)
 by SEZPR03MB8523.apcprd03.prod.outlook.com (2603:1096:101:21a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Mon, 23 Nov
 2026 12:24:06 +0000
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::e1e:5c95:a889:828e]) by KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::e1e:5c95:a889:828e%4]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 12:24:06 +0000
Message-ID: <b606819a-661e-4488-b5fb-9e786de463c6@amlogic.com>
Date: Mon, 23 Nov 2026 20:23:59 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] cpufreq: add an Amlogic speed-bin driver
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20261025192219.209137-1-christian.koever-draxl@student.uibk.ac.at>
 <20261025192219.209137-5-christian.koever-draxl@student.uibk.ac.at>
 <at7lXEqds7ukoR2V@vireshk-B250M-D3H>
 <1jbj8gkff1.fsf@starbuckisacylon.baylibre.com>
 <at8WfX_G0tfTlFrm@vireshk-B250M-D3H>
 <9556e959-daf3-4c85-8794-9613e7e7a9ae@gmail.com>
 <A45EC676-5B14-4932-A4CF-87ED3B71108D@gmail.com>
 <4a51e879-708c-49dc-a08a-3f64eeec8bbf@amlogic.com>
 <CAFBinCBkJJeRPKLFBA9KYjwXMxFjow_NOtvFoKRQdxD=rOPW3w@mail.gmail.com>
 <48b333a3-ef88-4739-a087-3ed9d8ec60a4@amlogic.com>
 <CAFBinCCgmRmk--W53wqdJhF-SzJbai--s7wyzDNt3LpfN00spw@mail.gmail.com>
From: Chuan Liu <chuan.liu@amlogic.com>
In-Reply-To: <CAFBinCCgmRmk--W53wqdJhF-SzJbai--s7wyzDNt3LpfN00spw@mail.gmail.com>
X-ClientProxiedBy: SI1PR02CA0057.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::10) To KL1PR03MB5778.apcprd03.prod.outlook.com
 (2603:1096:820:6d::13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5778:EE_|SEZPR03MB8523:EE_
X-MS-Office365-Filtering-Correlation-Id: 6912feb1-0a8e-4888-3654-08df495caaf8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|23010399003|10067099003|11063799006|4143699003|56012099006|261021130227099003|261021121427099003|261021123027099003|261021135927099003|261026130827099003|261022105027099003|261026121527099003|261022075727099003|261022113327099003|261009223027099003|261022115727099003|261026140227099003|261028144727099003|261102123227099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: fWE1/j+HZdMm3VvEDtV/aPlYmeAMv520RjCfzg4Cr/Ygt+lU+pZx3K07tOz8OYFXLgWnSvHMzeL0wRlSE3xqM9K3wRKcPS3vfabUE0d0LlAp+LctdXowp1AOtGe8Cr7khQbFCo3ohmKPZeSXUlbeK5jxzqWxbUyUS62QF0Mu9ZbKauUzKAnm0/n0Fcg0S6e4Quqnpd385847ADDsq++igFd+COXNvL3xyHRQo7SObzNjYqsj4cpMChG2RlkxghmFTxO4iDwFhvhLf9VyJQ0dnAQ+RckRaYah4tLdrpCXl3hxaSUCjYSIdkpsDEk5B/gCNMRB7FRYhPk/+F9pMeLwLxfroBjFmDv0CqAXv9tgA//SbAuIiCpxbfS319zSjRr7vWmhLj1IAf7USCNYNgVWMVynyckitV4k/T7SMEe7S4C5G/3nDlRldZl/UUg9Pt6LpJV2gcc56zyXMvCvS5a8uVb1b/QUObck2sjxGTmQg+ifxmoSsj4VAkWgJKpobzrw4bdD4uSn5gHuJMuoPuAwsV1BdluO5xKRZpPhBdqMS6n0UpWGbDM4O/XP3Fk53e+/esncXYsZ3POzu94WONPaMKuj1FFNFn/mLWHWaCRLnO42zqER1yGMaXpxeDyTdXav1S1xBU0gvLGu6a84Qnf8qUa7g+Oq1kg3P4xSeAL3ghc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5778.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(23010399003)(10067099003)(11063799006)(4143699003)(56012099006)(261021130227099003)(261021121427099003)(261021123027099003)(261021135927099003)(261026130827099003)(261022105027099003)(261026121527099003)(261022075727099003)(261022113327099003)(261009223027099003)(261022115727099003)(261026140227099003)(261028144727099003)(261102123227099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NVpjdFArczVGMVE3aFJKcm1XSFcweFJjdDF1bzNGTEs3MFRON2Y1dktXZE0z?=
 =?utf-8?B?M0l0aml0bUxWS1ZmK1p3OXdEc0hZREw2NUltUWovMm4yNExpNmpTdEJWdWJn?=
 =?utf-8?B?bkRUWXhkRCtwTERIM29zNlpJTER2bE9hRGora3UzdmprVEtsTmp5Y0VSVGJC?=
 =?utf-8?B?QWY0U1FYWUd4Y3k3RGRxUm5PUmdRNHBxbXR2cmFIK1lFQmhuSis2RHhVaVM2?=
 =?utf-8?B?dU4xeEFUbUNoaGlHK1daYXdtcWsvTnNNQTFDUHpGZFoxZXVOUWZ2cXpLRUFu?=
 =?utf-8?B?Ujg2U0E1K2xnRFRpUk1IVW42WXlqNDY1Z1BCTWxXWGR1ZlAxa25wSkluMzZn?=
 =?utf-8?B?SWd5ZE92WEFnbUlWNEZZc0NzZ1U2Y0ROYy9DTWRsR0VvOW9oY1BVKzl4OTd0?=
 =?utf-8?B?L2JFNVJIZ1pGY3FZSnRWNVo0c0xVZm9XTFlEVk9qVkN2aUJUaWtVOG1OM1dD?=
 =?utf-8?B?WUNjVTI4eDFXazhTZ08ya0pjWkhKYjNKRmUvbU1lYjVXNEhsSEpQQmluQ0NH?=
 =?utf-8?B?UmZPR0hKK1R2SG4xSlJZOHE0MEJ6c1Yrc20xeStwamt1ZzdPL3RjNXhaRDN3?=
 =?utf-8?B?cmNPWEpZejVRZ0FIM3ZkY3B1MTdtK2hLWVJxQkNFQjd1dllqeWlWVEplT3FB?=
 =?utf-8?B?T3EyS2tvWW5YVDYzSCs4Kzhkek1rSmRabStSUkZ0bWYxNjFuZVVMOU0zZnlD?=
 =?utf-8?B?R0x5N2pBVjFtcnRjaCtUMEZEUWF1OXh3eU5qbHh1UENiTXZDZVgzRm1yOFUr?=
 =?utf-8?B?TkR0V29NR3lTemVqNXpSblEzYlg1b1N1NUFUV1piME5LVlpQRVlZVXlSRExi?=
 =?utf-8?B?dFZhNkdWWjY5VjR0bEpaaWRQVUN3dnpNZ1B0N3F2c21iWVNJQlVaVDRWNGt3?=
 =?utf-8?B?Mk1FY29OSS9yenY5ZG14dElFRlhCN0RHeTJLeFlQU2JaSHlPMkNUL3gwZThD?=
 =?utf-8?B?OUlDSUJiNWUyUDN2SHdVbUFLcGs1WHNDWVl6TTB0d2JJcXlqd2RFOHhvL21U?=
 =?utf-8?B?aTlTMEZQU3RCSWZabEVIMW5wVGttZGlyTGJHeDVzZXlWRW5CdUllV2NudUpK?=
 =?utf-8?B?Y0YxSkNMVUpxYnh6cTE4QlA2VDgxTjNEWDRWbmMrajFsclh6dmNvQlVQR251?=
 =?utf-8?B?SEtYeXptTHlHdURORk8vY1pKQnBqT2EyUUVGcFJjSmNMdzNoTTVpQjZucnA1?=
 =?utf-8?B?bUIrZDROZnM2d09SVk9ZNjNkTzVOZ1NiSm5yUVVEL2ZQZ0JZTmxvN1JBeGRK?=
 =?utf-8?B?cUluSjVRbmF4TW5CNVR0MG1qWjBRQlNBNWRrSlUxbFFRT1Joa2V2L0FvcDVr?=
 =?utf-8?B?d2k4OHRXTk5NdVJVSVVySTluSlBEZ0lRWHFzQmdEWE03K3V3N3FyQU14R3JG?=
 =?utf-8?B?VnJmdzk4a3VJVDRnemN3ZllUMzd1T29LbGNCSi8zY2lpV25rK3QzZFkxanli?=
 =?utf-8?B?V1dRVXRiMElCdDh0a1VMSEMxMHpQQTNhRTJ0NE5CWGNjUDh4SGZ2WGREVVpP?=
 =?utf-8?B?NFFlQXk4S0lkTXRIZFJidW5TRC9BeFEvN2NRWk9YQlFPMTNUUWJsOVZhTStR?=
 =?utf-8?B?R3RDVFNuY0dBTU9CNjVqZU5Xc1lXbFI0MDJ1RVBxakhDSmlpRHBWRXZEZ0ZE?=
 =?utf-8?B?UWVrWXBucGhvckszc1hmM1hjWkxyTGRVOUorbG1TSmVwaDhQVDQ0YTR2ZW1l?=
 =?utf-8?B?ZXhGZGFZOUZCRDRhMGQrVFZtV09zQ3BYTk81Nmo4cXhzb2FwRWNmTzIrRmRv?=
 =?utf-8?B?SW4xTUtkOHlqWDAyYTZOMWdxOUJsY3gvd29LUjZuVXVxaDlvclJ1WFJPRk56?=
 =?utf-8?B?SlVMVDhDZ1ppSVlvOWExSG5Td2RKRkl4bStucjY2YkUxKzF4YkNQeFdKdFJi?=
 =?utf-8?B?aCs0UVhPWXBYd1VySGNUeElscnpycGFpTXl0UElsbmlDYWFIZWdydjRiZE9a?=
 =?utf-8?B?eGoxMXVoNExmY0JLNWZLbEVqOEs0RkpRdWZwazFxSU5wMEozSUJOTGRldWFF?=
 =?utf-8?B?Y011dGVnVDJhMEQvSTZBZ1lvU3U3WEhCcW93VDJ5b01GSm5BUkZiQTIyVlVa?=
 =?utf-8?B?WDdJVGtFOGgzMUkwTFhpS2ZuVGRKTFJLWWFjdGthZ01KSlFueFZXK0xSRTNS?=
 =?utf-8?B?QzNSWVJwNzNzTmxueXJsb3BaRjFEb1NBNHJkdHJLQ0Y5TjBqb25FNjV4R3BZ?=
 =?utf-8?B?Lzhzc2sva1M2eCtlVTcwcHVidFNqQTlMbUlWOFZzaHljYXMreXpmOEw4MlQ4?=
 =?utf-8?B?SjNCUE1mbHM0UHY2WXhHR0Zrd0FIMm9qSVA3clA3MWYweXBLcVNTd2tFU2Yw?=
 =?utf-8?B?WFhOd3ZrNzdzdnN0WGlZZFhGRTVSVXR6eHFXRmpmdnFVK0tGbk55dz09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6912feb1-0a8e-4888-3654-08df495caaf8
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5778.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 12:24:06.5455
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cDbv8Cv16mtDiNpMSeZRIxdVs6QD/gjS+h8dU6p08HpZQ2PdqFg4Imy1Dz6ug1ZBgDASRxu68rJFYJmycPOySA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB8523
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_042420_621393_C0A977FE 
X-CRM114-Status: GOOD (  29.69  )
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
Cc: =?UTF-8?Q?Christian_Stefan_K=C3=B6v=C3=A9r-Drax?= =?UTF-8?Q?l?= <ckoever@outlook.de>, neil.armstrong@linaro.org, conor+dt@kernel.org, christian.koever-draxl@student.uibk.ac.at, rafael@kernel.org, sboyd@kernel.org, Viresh Kumar <viresh.kumar@linaro.org>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, khilman@baylibre.com, linux-amlogic@lists.infradead.org, krzk+dt@kernel.org, bmasney+clk@redhat.com, robh@kernel.org, linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgVmlyZXNoLCBDYyBNYXJ0aW4sCiAgICAgSSd2ZSBydW4gaW50byBzb21lIGlzc3VlcyB3aGls
ZSBhZGFwdGluZyB0aGUgQW1sb2dpYyBBOSB0byAKY3B1ZnJlcS1kdCB0byBzdXBwb3J0IHRoZSBj
b29yZGluYXRlZCBhZGp1c3RtZW50IG9mIG11bHRpcGxlIGNsb2NrcywgYW5kIApJJ2QgbGlrZSB0
byBhc2sgZm9yIHlvdXIgb3Bpbmlvbi4KCk9uIDExLzkvMjAyNiA1OjQ1IEFNLCBNYXJ0aW4gQmx1
bWVuc3RpbmdsIHdyb3RlOgo+IFsgRVhURVJOQUwgRU1BSUwgXQo+IAo+IE9uIFR1ZSwgTm92IDMs
IDIwMjYgYXQgMTA6NDbigK9BTSBDaHVhbiBMaXUgPGNodWFuLmxpdUBhbWxvZ2ljLmNvbT4gd3Jv
dGU6Cj4+Cj4+IEhpIE1hcnRpbiwKPj4gICAgICAgVGhhbmsgeW91IGZvciBqb2luaW5nIHRoaXMg
ZGlzY3Vzc2lvbi4gOikKPj4KPj4gSSBoYXZlIHJlLWV4YW1pbmVkIHRoZSBjYXBhYmlsaXRpZXMg
cHJvdmlkZWQgYnkgcG1fb3BwIGFuZCBjcHVmcmVxLWR0LAo+PiBhbmQgaXQgc2VlbXMgdGhhdCB3
ZSBtYXkgYWxzbyBiZSBhYmxlIHRvIGFkYXB0IEE5IGZhaXJseSB3ZWxsIGJhc2VkIG9uCj4+IHRo
ZSBhbWxvZ2ljLWNwdWZyZXEuYyBoZXJlLiBTbyB3ZSBoYXZlIG5vIG9iamVjdGlvbnMgdG8gdGhl
IGRyaXZlcgo+PiBpbXBsZW1lbnRhdGlvbiBpbiBhbWxvZ2ljLWNwdWZyZXEuYyBoZXJlLgo+Pgo+
PiBJIHdhcyBtb3N0IHdvcnJpZWQgYWJvdXQgYmVmb3JlIHdhcyB0aGF0IGNwdWZyZXEtZHQgbWln
aHQgbm90IGZ1bGx5Cj4+IGhhbmRsZSB0aGUgY29tcGxpY2F0ZWQgY2xvY2sgYW5kIHN1cHBseSBh
ZGp1c3RtZW50IGxvZ2ljIGJldHdlZW4KPj4gbXVsdGlwbGUgY2x1c3RlcnMsIHdoaWNoIHdvdWxk
IGhhdmUgcmVxdWlyZWQgYWRkaW5nIGEgc2VwYXJhdGUKPj4gY3B1ZnJlcV9kcml2ZXIuIEJ1dCBp
dCBub3cgbG9va3MgbGlrZSB0aGlzIGNhbiBiZSBzb2x2ZWQgYnkgYWRkaW5nIHRoZQo+PiBjb3Jy
ZXNwb25kaW5nIGNvbmZpZ19jbGtzKCkgYW5kIGNvbmZpZ19yZWd1bGF0b3JzKCkgY2FsbGJhY2tz
IGluCj4+IGRldl9wbV9vcHBfc2V0X2NvbmZpZygpLgoKT3VyIG9yaWdpbmFsIGludGVudGlvbiB3
YXMgdG8gdHJ5IHRvIHN0cnVjdHVyZSBvdXIgQW1sb2dpYyBjcHVmcmVxIApkcml2ZXIgYXJvdW5k
IGNwdWZyZXEtZHQuCgo+IFRoYXQncyBncmVhdCBuZXdzLCBpbmRlZWQhCj4gCj4gWy4uLl0KPj4g
QWxsIGluIGFsbCwgaXQgbG9va3MgbGlrZSB3ZSBjYW4gY3VycmVudGx5IHN1cHBvcnQgYWxsIEFt
bG9naWMgU29DcyBpbiBhCj4+IHNpbmdsZSBhbWxvZ2ljLWNwdWZyZXEuYz8gVGhlbiwgZm9yIHRo
ZSBzcGVjaWZpYyBjaGFyYWN0ZXJpc3RpY3Mgb2YKPj4gZGlmZmVyZW50IFNvQ3MsIHdlIGNhbiBk
aWZmZXJlbnRpYXRlIHRoZW0gdGhyb3VnaCB0aGUgImNvbXBhdGlibGUiCj4+IHByb3BlcnR5IGFu
ZCBhZGQgdGhlIGNvcnJlc3BvbmRpbmcgZHJ2ZGF0YSBmb3IgZWFjaC4KPj4KPj4gSSdsbCBhbHNv
IHRyeSB0byBzdXBwb3J0IFM3L0E5IHdpdGggcmVwcmVzZW50YXRpdmUgZGlmZmVyZW5jZXMgYmFz
ZWQgb24KPj4gdGhpcyBwYXRjaC4KCkkgaGF2ZSBhbHJlYWR5IGNvbXBsZXRlZCB0aGUgc3VwcG9y
dCBvbiBBOSwgYnV0IGNwdWZyZXEtZHQgY3VycmVudGx5IApvbmx5IHN1cHBvcnRzIHRoZSBzaW5n
bGUtY2xvY2sgY2FzZSwgZm9yIGV4YW1wbGU6CmR0X2NwdWZyZXFfZWFybHlfaW5pdCgpCiAgIC0+
ZGV2X3BtX29wcF9pbml0X2NwdWZyZXFfdGFibGUoKQogICAgIC0+ZGV2X3BtX29wcF9maW5kX2Zy
ZXFfY2VpbCgpCiAgICAgICAtPl9maW5kX2tleV9jZWlsKCkKICAgICAgICAgLT5hc3NlcnRfc2lu
Z2xlX2NsaygpCgpzZXRfdGFyZ2V0KCkKICAgLT5kZXZfcG1fb3BwX3NldF9yYXRlKCkKICAgICAt
Pl9maW5kX2ZyZXFfY2VpbCgpCiAgICAgICAtPmFzc2VydF9zaW5nbGVfY2xrKCkKCkJvdGggb2Yg
dGhlIGludGVyZmFjZXMgYWJvdmUgYXJlIGxpbWl0ZWQgdG8gInNpbmdsZV9jbGsiLCBzbyBTb0Nz
IHRoYXQgCm5lZWQgdG8gYWRqdXN0IHRoZSBEU1UgY2xvY2sgaW4gY29vcmRpbmF0aW9uIHdpdGgg
dGhlIENQVSBjbG9jayAoc3VjaCBhcyAKU00xLCBTNywgQTksIGV0Yy4gbWVudGlvbmVkIGFib3Zl
KSBjYW5ub3QgZGlyZWN0bHkgd29yayBvbiB0b3Agb2YgCmNwdWZyZXEtZHQuCgpJIGNoYW5nZWQg
YXNzZXJ0X3NpbmdsZV9jbGsoKSB0byBhc3NlcnRfY2xrX2luZGV4KCkgaW4gdGhlIHR3byBmdW5j
dGlvbnMgCmFib3ZlIGFuZCBpdCB3b3JrcywgYnV0IEknbSBhZnJhaWQgc3VjaCBhIGJydXRlLWZv
cmNlIGNoYW5nZSBtYXkgYnJlYWsgCnRoZSBzZW1hbnRpY3Mgb2YgdGhlIG9yaWdpbmFsIEFQSXMu
CgpUbyBzdXBwb3J0IHRoZSBBbWxvZ2ljIGNwdWZyZXEgZHJpdmVyIGNvb3JkaW5hdGluZyB0aGUg
YWRqdXN0bWVudCBvZiAKbXVsdGlwbGUgY2xvY2tzIGFzIHNwZWNpZmllZCwgV2UgY2FuIGN1cnJl
bnRseSB0aGluayBvZiB0aHJlZSBhcHByb2FjaGVzOgoKMSkgRXh0ZW5kIHRoZSBjcHVmcmVxLWR0
L09QUCBmdW5jdGlvbiBpbnRlcmZhY2VzLCBmb3IgZXhhbXBsZToKICAgLSBBZGQgZGV2X3BtX29w
cF9pbml0X2NwdWZyZXFfdGFibGVfaW5kZXhlZCgpIGFuZCAKZGV2X3BtX29wcF9zZXRfcmF0ZV9p
bmRleGVkKCkKICAgLSBBZGFwdCBjcHVmcmVxLWR0IHRvIHRoZXNlIG5ld2x5IGFkZGVkIGZ1bmN0
aW9ucywgc2FtcGxlIGNoYW5nZXM6CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9jcHVmcmVxL2NwdWZy
ZXEtZHQuYyBiL2RyaXZlcnMvY3B1ZnJlcS9jcHVmcmVxLWR0LmMKaW5kZXggN2Q1MDc5ZmQxNjg4
Mi4uODk0MGQzNmYyMzcxZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9jcHVmcmVxL2NwdWZyZXEtZHQu
YworKysgYi9kcml2ZXJzL2NwdWZyZXEvY3B1ZnJlcS1kdC5jCkBAIC01Myw3ICs1Myw3IEBAIHN0
YXRpYyBpbnQgc2V0X3RhcmdldChzdHJ1Y3QgY3B1ZnJlcV9wb2xpY3kgKnBvbGljeSwgCnVuc2ln
bmVkIGludCBpbmRleCkKICAgICAgICAgc3RydWN0IHByaXZhdGVfZGF0YSAqcHJpdiA9IHBvbGlj
eS0+ZHJpdmVyX2RhdGE7CiAgICAgICAgIHVuc2lnbmVkIGxvbmcgZnJlcSA9IHBvbGljeS0+ZnJl
cV90YWJsZVtpbmRleF0uZnJlcXVlbmN5OwoKLSAgICAgICByZXR1cm4gZGV2X3BtX29wcF9zZXRf
cmF0ZShwcml2LT5jcHVfZGV2LCBmcmVxICogMTAwMCk7CisgICAgICAgcmV0dXJuIGRldl9wbV9v
cHBfc2V0X3JhdGVfaW5kZXhlZChwcml2LT5jcHVfZGV2LCBmcmVxICogMTAwMCwgMCk7CiAgfQoK
ICAvKgpAQCAtMjQ1LDcgKzI0NSw3IEBAIHN0YXRpYyBpbnQgZHRfY3B1ZnJlcV9lYXJseV9pbml0
KHN0cnVjdCBkZXZpY2UgKmRldiwgCmludCBjcHUpCiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIF9fZnVuY19fLCByZXQpOwogICAgICAgICB9CgotICAgICAgIHJldCA9IGRldl9wbV9v
cHBfaW5pdF9jcHVmcmVxX3RhYmxlKGNwdV9kZXYsICZwcml2LT5mcmVxX3RhYmxlKTsKKyAgICAg
ICByZXQgPSBkZXZfcG1fb3BwX2luaXRfY3B1ZnJlcV90YWJsZV9pbmRleGVkKGNwdV9kZXYsIAom
cHJpdi0+ZnJlcV90YWJsZSwgMCk7CiAgICAgICAgIGlmIChyZXQpIHsKICAgICAgICAgICAgICAg
ICBkZXZfZXJyKGNwdV9kZXYsICJmYWlsZWQgdG8gaW5pdCBjcHVmcmVxIHRhYmxlOiAlZFxuIiwg
CnJldCk7CiAgICAgICAgICAgICAgICAgZ290byBvdXQ7CgoyKSBLZWVwIGNwdWZyZXEtZHQgYW5k
IGFkanVzdCB0aGUgRFNVIGNsb2NrIHN5bmNocm9ub3VzbHkgd2hlbiBhZGp1c3RpbmcgCnRoZSBD
UFUgY2xvY2sgaW4gY29uZmlnX2Nsa3MoKSwgb25seSBhIHNpbmdsZSBDUFUgY2xvY2sgaXMga2Vw
dCBpbiAKInN0cnVjdCBkZXZfcG1fb3BwX2NvbmZpZyBjb25maWcuY2xrX25hbWVzIi4KCjMpIENy
ZWF0ZSBhIHNlcGFyYXRlIEFtbG9naWMgY3B1ZnJlcSBkcml2ZXIgaW5kZXBlbmRlbnQgb2YgY3B1
ZnJlcS1kdCAKKHNpbWlsYXIgdG8gbWVkaWF0ZWstY3B1ZnJlcS5jKQoKV2hpY2ggYXBwcm9hY2gg
d291bGQgeW91IHByZWZlcj8gRG8geW91IGhhdmUgYW55IGJldHRlciBzdWdnZXN0aW9ucz8KCj4g
R3JlYXQsIGxldCdzIGxvb2sgYXQgc29tZSBjb2RlIHJhdGhlciB0aGFuIGRpc2N1c3NpbmcgdGhl
b3J5IG9uIGhvdyB0bwo+IHdyaXRlIGNvZGUgOi0pCj4gCj4gVGhlcmUncyBvbmUgbGFzdCBkZXRh
aWwgdGhhdCB3ZSBoYXZlIHRvIG1hbmFnZSBpbiBjYXNlIHdlIGFsc28gd2FudCB0bwo+IGluY2x1
ZGUgdGhlIE1lc29uOCogY29kZSBpbnRvIHRoZSBzYW1lIGZpbGU6Cj4gY29uZmlnIE1FU09OX1NN
IGRlcGVuZHMgb24gQVJNNjRfNEtfUEFHRVMKPiAzMi1iaXQga2VybmVsIGJ1aWxkcyBjYW4ndCBz
YXRpc2Z5IHRoaXMgKG1lYW5pbmc6IHdlIGVuZCB1cCB3aXRoCj4gbGlua2VyIGVycm9ycykuIEkg
dGhpbmsgYSBzaW1wbGUgd2F5IHRvIGdldCBhcm91bmQgdGhpcyBpcyB0byBhZGQgc3R1Ygo+IGZ1
bmN0aW9ucyB0byBpbmNsdWRlL2xpbnV4L2Zpcm13YXJlL21lc29uL21lc29uX3NtLmguCj4gSSds
bCB0YWtlIGNhcmUgb2YgdGhhdCBvbmNlIEkgY2FuIHN1Ym1pdCBNZXNvbjggc3VwcG9ydCBwYXRj
aGVzIGZvcgo+IHlvdXIgdXBjb21pbmcgYW1sb2dpYy1jcHVmcmVxLmMhCj4gCj4gCj4gQmVzdCBy
ZWdhcmRzLAo+IE1hcnRpbgoKLS0gCkJlc3QgcmVnYXJkcywKQ2h1YW4KCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcg
bGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
