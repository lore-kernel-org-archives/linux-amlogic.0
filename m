Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D71E5CED268
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Oct 2024 05:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U+Z/bPVIbR2STR/zGSZ1GsNSLvGZopTOdj6I+tqfim0=; b=PvOMeeAE7pxd0nywcmHyp5ZGyZ
	BwAEA6vgNAHc8/ZqjecThUHCA+ykMuKIVQufhqd61GkvsnThQZW0vfRNX/nYKCIYKx2+yiPEvFe3z
	lyUoHi0FR9eYiJXklLx/Kk1isVfrJlM8HuI02xHJhVDEdpJBfjx5q3ZjkuwgdCx89PS1PAJJI1Fmo
	EZtsYMNufsBl4gtm73PQTQgBib0LrhxmJR0+DONoL0wK11QhXS3zthz/C3L3omNjKH2asAJLUPNbn
	ZDuD667T0bpUVIQm5V7wmGedcIZUoVHxvGIdQ1l8UbekgTaHGj2OOneeT4JpjW0tHKsR+A+/7gePs
	v7lOZcfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sy32V-00000004aDa-3wFM;
	Tue, 08 Oct 2024 05:45:43 +0000
Received: from mail-psaapc01on2070c.outbound.protection.outlook.com ([2a01:111:f400:feae::70c] helo=APC01-PSA-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sy32S-00000004aCU-0yV1;
	Tue, 08 Oct 2024 05:45:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iJaXt3e+rE2aP/8Z94KyJT4xT7R3dDDfLvX8rzJOXK2T/bTXraEuteIvoMLi7Dtn78B0Aj1wUcpbDZOU0JSdwuu0BWAo0maCwXeOyVOu2RykOAqBpvasl79HokIUdZlX4yINWvxLqaMj5UOcWb5rPwFKaVX9qY/4LsgiSKtKCXkKwsjkVm1EFXKYSpnQFvgDpzjV9GzDKJNcb8ate7aHH7jQHs+7PsZLcw/bV50hzm0JpZzMRFXhf+5taeHqnmrTyyFQpuXsP3m+7Pmpeq4c9WBtgkmwlWfecMsF0ilpvIqSUCUjWxARekihpXjFmWGgaDcu+xX19S4W6BKdbuIINA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R/PxFrcZeAjlAAfbGHAgXgTDQFt+ghALtCGWb6i/R1Q=;
 b=thrUey5ljiaSwVamMCyMZYs3DSEDJZv5cphJvg90DXMS3IjAqG2REJHtI7f8CBogJhf+Oe2KcCAgCVVeZuqW7e9Tgux1fcsnSG1t+TKxm9zG+46+DVfmLo80na+0dpja5RC+G07SqLoe/T7sTS4rp7MCqk3vLuBXM6ehqKJOAV77/rxE+0royp8eCmI9bDGsbX01RCLL2iVJmhwTkjBTM1Sbtl3Ms8R9MFlX+BL0tqwD9j/oGCqZIztLjQ4sl1kYeWmPq8dp7khwj+kzOD+XIKSVtUVdo4yTbbtfLkRITgZP5LLggnkRSu+cLp5TtbTV+pLh2e0dLqFXoSxFgL6p5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R/PxFrcZeAjlAAfbGHAgXgTDQFt+ghALtCGWb6i/R1Q=;
 b=arSkMMCBHTGeUvom86iZYomreItLrC5VupNZvnlvIYp421mOCDy00xvs53m1Z4tTPcrZbnx8nawaxYrCQ1PB8OBDYg3wXGCMLI0FAOnDMYd36w05sFdy26uUvkfwrhHRV+kikFkTu6fHd+BKAzKUpIq81IfFvectj6JVVmj8Z2f44v3WmvdwoDJWHew6P6fjk2HwV9EyZk13Q2sboLE5AfPIoY5uSZ1uvBGBtcfQRNX1avACVc99DdPhg93MCjormyTb1yxhuAUucYLCm/8utP7jlVwM1mMTXpfSsZ27XfiJvDXSyZ0u9G5cqB4oLdmgvWBDKiPU+VgF60llpfiURg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com (2603:1096:820:6d::13)
 by SEZPR03MB8739.apcprd03.prod.outlook.com (2603:1096:101:219::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.22; Tue, 8 Oct
 2024 05:45:31 +0000
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::9d11:d1f6:1097:22ca]) by KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::9d11:d1f6:1097:22ca%7]) with mapi id 15.20.8026.020; Tue, 8 Oct 2024
 05:45:28 +0000
Message-ID: <20178015-4075-40e9-bbf4-20ae558c2bef@amlogic.com>
Date: Tue, 8 Oct 2024 13:44:54 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: meson: Fix glitch free mux related issues
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20240929-fix_glitch_free-v1-0-22f9c36b7edf@amlogic.com>
 <20240929-fix_glitch_free-v1-2-22f9c36b7edf@amlogic.com>
 <CAFBinCBd5-s6vaBoJNerXavQiHgsv4Fm3v0svUX7geL=kJvVYg@mail.gmail.com>
From: Chuan Liu <chuan.liu@amlogic.com>
In-Reply-To: <CAFBinCBd5-s6vaBoJNerXavQiHgsv4Fm3v0svUX7geL=kJvVYg@mail.gmail.com>
X-ClientProxiedBy: SI2PR01CA0008.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::10) To KL1PR03MB5778.apcprd03.prod.outlook.com
 (2603:1096:820:6d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5778:EE_|SEZPR03MB8739:EE_
X-MS-Office365-Filtering-Correlation-Id: f5dcf9d0-4d3a-4e87-dbdd-08dce75c6a0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MnQwMCtIUG1XMEcxeDJFbzRhZ0tHU1laemg0aGR0YW02Y0tQQmZoVWdVT3pj?=
 =?utf-8?B?V2hKUk56S2hhTFRPU09WWG56SGpwSkE2Z0xaRi9JcEVaN0UzazhHUDdLeWFN?=
 =?utf-8?B?NThUM0NGRkFlU2R4ZzFLVGJiK1RYcXovVXhTa01lZzUrd2pBYlJjNUN1YkR0?=
 =?utf-8?B?WnhRZERtY3NNVnhUL0Y3azlpY3h6VXhJT1Rnd0FoeTZ6V0M1elFrOStYSllP?=
 =?utf-8?B?ZUU0L2FKS3NTaUhEcGZMbEtBY3Rid2lqeUhCL0xIOG5RQy8vUjBDSXhJUUsy?=
 =?utf-8?B?Z0MybytwaDl4aFlPekg4ZkZyQU82dFI2dzhRUFJESEIrMzRMV0d2UjIyQTFB?=
 =?utf-8?B?TUV5eFh0bkNzN1cvbi9SV1RrYS8rTmx6Mm95TEhxSUU2eUhlMDRkbjQyTkxE?=
 =?utf-8?B?aWErd2pwWWdUTk5RbWU3MzRBNHFiT1piZ0ZjWEQrSXJDV0hUL05BQVVOelBV?=
 =?utf-8?B?ZGUvaHAyQlBaWThRa0VIaFlIVWxZemlUMFdTZ2Z3NGdzazhmMFhvRC9PcW5h?=
 =?utf-8?B?bDdEYVpEVm9tSjN5TjJYUEhCQmkwRjllUmwwOURITnVwSEJEUzNSWnVNK0d4?=
 =?utf-8?B?Tk9MalBiOHZCTEpjTVZhVzVxTjVQalVKV2ppNEZ4Q1lWMEY2eUxoby9vNytp?=
 =?utf-8?B?dmZuS3dSWFd6U0tCLzMrUjRTbHFWOWVUcVF5WERpMTJvNFVUeWRVeFFXTm14?=
 =?utf-8?B?R1BNalRUOXJFUVZWNGtKbjRkYXd1L3ArMzZuODhTZUR5L2V2K093RFdNeDR5?=
 =?utf-8?B?U3pXUm5zUXNBWVJHOGVPNXJkMDRjZ1ZJMUo3RzhBdW1xdTBLUm05b3pDenRI?=
 =?utf-8?B?d2tlOXN3cm01RWpOZWd3NXZFeUNsS1Joc2xSeXNmcXZ4Z1QyNXpteVlqdEl1?=
 =?utf-8?B?SjBHSi81YmNZb0Y0MlphT0dWRmxPZGFTVXJUVTUvYlJMVG9qVFdOVDhpQWtp?=
 =?utf-8?B?TmkwK3FVTGs4Q2Ztb3BxZ0x0aFRxaElXNjNadUw5U0wyaUpNSUVVVmJBVDVw?=
 =?utf-8?B?SVhPd0kxaW5VcnlkYUxqdXVQV1ByNUo2dmo3NUk0QWwrSUhNVnRweVlYUUNq?=
 =?utf-8?B?dFc4YlRndlIxeTg1aUlFOFZmU2RQTkRzdzZ0VW10blJMU0VZUzE2T2M1NEJr?=
 =?utf-8?B?RktUdFUwS1pzVEFBSjR6S3VWUmFOYWpjWEhZNWRocFl5bS9GOWp5Wm96MlNP?=
 =?utf-8?B?NUozais0WUpidXpnQTV4eXB6V1liaTQ1QmorcGNwcmdqZ3FnZ2c5SXRDZEkr?=
 =?utf-8?B?L1FBKzFJa2FGQjFtTTRBeGxjWXZSYTdoekVla1VvL0ZBMnFSR1RDOHNRUEwx?=
 =?utf-8?B?eHlYZE40aE84TVZFT0xRM0FDMjROOUx6ZWJiN2NudXh6NU1pZUlPdDJUZ0Fq?=
 =?utf-8?B?dzA4UURhaEJMcG1xR3pSdGFOeHd0aXgxdDhiZFpRYnArbUtsYy9HRmtrSy9h?=
 =?utf-8?B?RTVzaXpMNEJ6WW1jSVRRVnk2V0MyaXYyY1Fqc2dsOGpyZnVwNWFNV0Rpay9k?=
 =?utf-8?B?cnFDQ3ordTNPSUZzc0JMckllRS9Ld0lsTm5YUmJUVE0xVXZFZG8wNU5DWG5z?=
 =?utf-8?B?MHo3UUhKOU9kbjlTdUtCb1hnMWFEVW1oTGxwK0trOHZCclZQWE1IWmZRNXp2?=
 =?utf-8?B?bVJuajZycUkzSnl0V3hNMWlHN2txSlhYOFhYRHA2Y25mQzhzY0FFM3k3WUZC?=
 =?utf-8?B?Wk0yNGRZa0NudUR4TjVTbnEwNWp6RC95Z3U4ckdncVp3U3RzSDdqRFpBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5778.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VnN6SFI2N2JiODQ3Mk9qNjI3cTlsUklhTXNSQjRidGxndWk3THJXRGJWaHU2?=
 =?utf-8?B?UFVWdStzcHc3OVN6TG9xbWpVUElWeXp3Wmg5bk81V2w4Y3ZPWkI2TzRjTmRy?=
 =?utf-8?B?WTNZakJaQlFObHhETGFrZmdtSGkza3NFNW5EYkN3TFNCc0xmaWg3dU1MblUw?=
 =?utf-8?B?T2xqVkZzVTYvbTFUOEJabXd2enRCL0NFZUpUSS8yVGNQaTB0aWhmVU1XUnNp?=
 =?utf-8?B?SEtLMkFRVjlEWnc2Z09aTFhPTnYzOEtrSEU5emFxTUh0TkdaTTFENEM0OCtZ?=
 =?utf-8?B?OVcyWnF3YUdCbldaSUI1OHFmSzVQaXVXYk5USFlxc1pLZ3AyYmF6SmNjZW9m?=
 =?utf-8?B?a1Z4cUpNRkRwZVEyYzZORjJ4YllFOFhVbXNUaEVZTm1wSWlkdS85TkxoQXlD?=
 =?utf-8?B?Y3lSOVEzdnhnc2YxK2ZYdGhwMDQrNkJZakRiNU9teHlqdkZOdkhHZXExZlRD?=
 =?utf-8?B?d2VQd0FhVHhGNEVRdDBPVXV3RWJSQVYrcldaSDRmWXcvOTlSN1Q3T2pHdU9u?=
 =?utf-8?B?ZVF1TVNYZHVCUGI0eTFhOWtTLysxelFmQmdvUUZsWVoveE8vTjJnalo4QnVQ?=
 =?utf-8?B?MEVyOW5ZaTRmdHl2SE5mVlgvV2FBTk5ZdUZhVGxUK0pmQ1J5aXJIVEdBSHJZ?=
 =?utf-8?B?VTJkMkFQQ2N4VlJ5a1pTa2c3NHA1aVNRVU5icXg4S0x1YUZiZGVmdktYeVRu?=
 =?utf-8?B?WnNWbGw4dEJFV25HNDVISGU5YWxFLzhaNHhlWDd6VHdoN2dPaWxvejViS2wz?=
 =?utf-8?B?eHdJYXJYOVlpalVtUlVvUWp5d05HVXNtcXVVbk5SWXducXA5TG10Uk1wQy9p?=
 =?utf-8?B?cXFzUXVhMkJVNG9RTTlMb0hjeUhSd2pneEY2ZTZtYVdSRi9zb2E2aEg5Y0hk?=
 =?utf-8?B?ajBjRzZRem1pTy9QSzFYT3FYR3NtbjQxdGtST0V4YWo0QmhqbDkzMHVtR2ZN?=
 =?utf-8?B?c0djT2lLVzJZRFFlL2lQRTUwdVIwSnJVOFl2RTFpUG1WZ0JDOUt1MEJENEVT?=
 =?utf-8?B?bWFLdDAvK2pXdjRHNGorTG1mUjhQSVlkQUNmc29DVVNvYWQxazJqcGZ0V3h6?=
 =?utf-8?B?S0MzczRlbW4zQndVTGdld2tQcUMxbncvWSsxSGdSWDZtZ0ZsNGlyQ3NHSzVQ?=
 =?utf-8?B?S1plc2wxOHlXekRsYWdQNXFjWFJjdTB3R3lLbEhaZ0JFbERNdFM3QVM2Zm8w?=
 =?utf-8?B?NktZSTRpa21WSHV4VE9CaVBldEg0eHdTZTIrYmJsZzVSS2UzYVFwdDZhdGJo?=
 =?utf-8?B?SDVjejdLYVJNdXFqZkJ0YVJzaUhxWFRoV3hZaUU3ZzBUMzVxSTUzMHhUcnh6?=
 =?utf-8?B?Z0llMjZ4MVlCVEpVaXZFbHR0MnBGZytlWmpKR3RXYXRDeXZZVjB0TE05N1BW?=
 =?utf-8?B?SHFqODRoRjY1ZUVSNHVwRWNzV1NYRUlMdmZiOWJtc0xtdTJvcDNEYkFVTU1h?=
 =?utf-8?B?VHZhVGxveXNGWEZQcjFCdlRlWUhyZ29MTmZ5YzhLb0RnZGt6eHdyL3F3elhm?=
 =?utf-8?B?MkgrUGtna01Ob0tMa2hzNW4vZFZXa3JOTDQzMWg5a2dwdXZiNFJzclZ1ZHdI?=
 =?utf-8?B?aWgxNnlsM1UzeUxrYUJlVG1rc1NDbkFYUmhPK0ZZN1ErRi9sRm8wZGlhT1dZ?=
 =?utf-8?B?WUdiVGJQeHBEMjhkYjA3cnlERjhGMlpKT1NHbmFHNTNHa0paOHJYTEp5Yi9h?=
 =?utf-8?B?YXFpZjJKdFVFcUdDckVjRERsQ1ZBTnVMcjBuRXhjQlB5YW9qajVsRWhYUWNB?=
 =?utf-8?B?eFdRRmphckFPajJtRGtZRVUwSi9BRFZxTDN5QXM5TkV6QjFCT2x0Mk55VlNa?=
 =?utf-8?B?eSsxR1hycVVhTHhPN3hPSk11d3JJbklSNzZDRFlzKzZGaEhBdzZkU3BuZ1Ar?=
 =?utf-8?B?WjdGRHpxSlZZeGt5N2gvK2JRNlVlekRUTHpwbXRjRi9kNnVVeCtQZjBFYVVx?=
 =?utf-8?B?MFp2cWc0bjBsc0szVTZGVHQyeXZhTTl2byt6dW9ZQ1l5WEx5aEVVT2JRYWxV?=
 =?utf-8?B?YVc0ckk5OGlJb21YV2hDQXYzUHlBN0F5Q0hTbHFBVnVRMXY1UzMxM2xrdG1M?=
 =?utf-8?B?aUJ3cTdtNU1qZ3hNUmdLLzlMZnRxRkNHQStsLzVNcEJ5dWdsQThIWTVSNnJo?=
 =?utf-8?Q?gRPBzGgw69slGKrzWdxJN0RNf?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5dcf9d0-4d3a-4e87-dbdd-08dce75c6a0a
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5778.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 05:45:28.2904
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kqRCb6Svbp1k9EINdgMleMClwM8EuTIWjWr77eHODeZu4+JUwmIDMPk1scPp6tmVdObpL90iaWglRHwRjMf81A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB8739
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_224540_303088_050C8F43 
X-CRM114-Status: GOOD (  30.13  )
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

SGkgTWFydGluLAoKCk9uIDIwMjQvMTAvMSA0OjA4LCBNYXJ0aW4gQmx1bWVuc3RpbmdsIHdyb3Rl
Ogo+IFsgRVhURVJOQUwgRU1BSUwgXQo+Cj4gSGVsbG8sCj4KPiBPbiBTdW4sIFNlcCAyOSwgMjAy
NCBhdCA4OjEw4oCvQU0gQ2h1YW4gTGl1IHZpYSBCNCBSZWxheQo+IDxkZXZudWxsK2NodWFuLmxp
dS5hbWxvZ2ljLmNvbUBrZXJuZWwub3JnPiB3cm90ZToKPj4gRnJvbTogQ2h1YW4gTGl1IDxjaHVh
bi5saXVAYW1sb2dpYy5jb20+Cj4+Cj4+IGdsaXRjaCBmcmVlIG11eCBoYXMgdHdvIGNsb2NrIGNo
YW5uZWxzIChjaGFubmVsIDAgYW5kIGNoYW5uZWwgMSkgd2l0aAo+PiB0aGUgc2FtZSBjb25maWd1
cmF0aW9uLiBXaGVuIHRoZSBmcmVxdWVuY3kgbmVlZHMgdG8gYmUgY2hhbmdlZCwgdGhlIHR3bwo+
PiBjaGFubmVscyBwaW5nLXBvbmcgdG8gZW5zdXJlIGNsb2NrIGNvbnRpbnVpdHkgYW5kIHN1cHBy
ZXNzIGdsaXRjaC4KPiBZb3UgZGVzY3JpYmUgdGhlIHNvbHV0aW9uIHRvIHRoaXMgYmVsb3c6Cj4+
IEFkZCBmbGFnIENMS19TRVRfUkFURV9HQVRFIHRvIGNoYW5uZWxzIDAgYW5kIDEgdG8gaW1wbGVt
ZW50IFBpbmctUG9uZwo+PiBzd2l0Y2hvdmVyIHRvIHN1cHByZXNzIGdsaXRjaC4KPiBJdCB3b3Vs
ZCBiZSBncmVhdCB0byBoYXZlIHRoaXMgY2hhbmdlIGluIGEgc2VwYXJhdGUgcGF0Y2guCj4gVGhl
IGNsb2NrcyB0byB3aGljaCB5b3UncmUgYWRkaW5nIENMS19TRVRfUkFURV9HQVRFIGFyZW4ndCBz
d2l0Y2hlZCBhdAo+IHJ1bnRpbWUgaW4gbWFpbmxpbmUga2VybmVscyAoYXQgbGVhc3QgSSB0aGlu
ayBzbykuCgoKT2theSwgSSB3aWxsIHNlcGFyYXRlIGl0IGludG8gdHdvIHBhdGNoZXMgYW5kIHN1
Ym1pdCBpdCBpbiB0aGUgbmV4dCB2ZXJzaW9uLgoKCj4KPj4gQ2hhbm5lbCAwIG9mIGdsaXRjaCBm
cmVlIG11eCBpcyBub3Qgb25seSB0aGUgY2xvY2sgc291cmNlIGZvciB0aGUgbXV4LAo+PiBidXQg
YWxzbyB0aGUgd29ya2luZyBjbG9jayBmb3IgZ2xpdGNoIGZyZWUgbXV4LiBUaGVyZWZvcmUsIHdo
ZW4gZ2xpdGNoCj4+IGZyZWUgbXV4IHN3aXRjaGVzLCBpdCBpcyBuZWNlc3NhcnkgdG8gZW5zdXJl
IHRoYXQgY2hhbm5lbCAwIGhhcyBhIGNsb2NrCj4+IGlucHV0LCBvdGhlcndpc2UgZ2xpdGNoIGZy
ZWUgbXV4IHdpbGwgbm90IHdvcmsgYW5kIGNhbm5vdCBzd2l0Y2ggdG8gdGhlCj4+IHRhcmdldCBj
aGFubmVsLgo+IFsuLi5dCj4+IGdsaXRjaCBmcmVlIG11eCBBZGQgZmxhZyBDTEtfT1BTX1BBUkVO
VF9FTkFCTEUgdG8gZW5zdXJlIHRoYXQgY2hhbm5lbCAwCj4+IGhhcyBjbG9jayBpbnB1dCB3aGVu
IHN3aXRjaGluZyBjaGFubmVscy4KPiBUaGlzIGRlc2NyaWJlcyBhIHNlY29uZCBwcm9ibGVtLiBJ
IHRoaW5rIGl0J3MgYmVzdCB0byBoYXZlIHRoaXMgaW4gYQo+IHNlcGFyYXRlIGNvbW1pdC9wYXRj
aC4KPiBBbHNvIHlvdSdyZSB1cGRhdGluZyBzb21lIG1hbGkgY2xvY2tzIChlLmcuIG9uIEcxMiBh
bmQgR1gpIGJ1dCBub3QgYWxsCj4gb2YgdGhlbSAoTWVzb244YiBmb3IgZXhhbXBsZSBpcyBtaXNz
aW5nKS4KCgpZZXMsIE04IG1pc3NlZCBpdCwgSSB3aWxsIGNvbXBsZXRlIGl0IGluIHRoZSBuZXh0
IHZlcnNpb24uCgoKPgo+IEkgc3RpbGwgaGF2ZSBzb21lIHF1ZXN0aW9ucyB0byB0aGUgQ0xLX09Q
U19QQVJFTlRfRU5BQkxFIGFwcHJvYWNoIC0KPiBwbGVhc2Ugc2hhcmUgeW91ciBmaW5kaW5ncyBv
biB0aGlzLgo+Cj4gVGhlcmUncyBtdWx0aXBsZSBjbG9ja3MgaW52b2x2ZWQgaW4gYSBnbGl0Y2gt
ZnJlZSBtdXggaGllcmFyY2h5Ogo+IC0gYSBudW1iZXIgb2YgY2xvY2sgaW5wdXRzIChlLmcuIGZj
bGssIHh0YWwsIC4uLikKPiAtIHR3byBtdXhlcyAob25lIGZvciBldmVyeSBjaGFubmVsIG9mIHRo
ZSBnbGl0Y2gtZnJlZSBtdXgpCj4gLSB0d28gZGl2aWRlcnMgKG9uZSBmb3IgZXZlcnkgY2hhbm5l
bCBvZiB0aGUgZ2xpdGNoLWZyZWUgbXV4KQo+IC0gdHdvIGdhdGVzIChvbmUgZm9yIGV2ZXJ5IGNo
YW5uZWwgb2YgdGhlIGdsaXRjaC1mcmVlIG11eCkKPiAtIHRoZSBnbGl0Y2gtZnJlZSBtdXgKPgo+
IFdoZW4gc3dpdGNoaW5nIGZyb20gY2hhbm5lbCAwICh3aGljaCBpcyBhY3RpdmUgYW5kIGVuYWJs
ZWQpIENDRgo+IChjb21tb24gY2xvY2sgZnJhbWV3b3JrKSB3aWxsOgo+IGEpIG9uIGNoYW5uZWwg
MToKPiAtIGZpbmQgdGhlIGJlc3QgaW5wdXQgY2xvY2sKPiAtIGNob29zZSB0aGUgYmVzdCBpbnB1
dCBjbG9jayBpbiB0aGUgbXV4Cj4gLSBzZXQgdGhlIGRpdmlkZXIKPiAtIGVuYWJsZSB0aGUgZ2F0
ZQo+IGIpIHN3aXRjaCB0aGUgZ2xpdGNoLWZyZWUgbXV4Cj4gYykgb24gY2hhbm5lbCAyOgo+IC0g
ZGlzYWJsZSB0aGUgZ2F0ZQo+Cj4gVG8gbWUgaXQncyBub3QgY2xlYXIgYXQgd2hpY2ggbGV2ZWwg
dGhlIHByb2JsZW0gb2NjdXJzIChnbGl0Y2gtZnJlZQo+IG11eCwgZ2F0ZSwgZGl2aWRlciwgbXV4
LCBpbnB1dCBjbG9jaykuCj4gQWxzbyBJIGRvbid0IHVuZGVyc3RhbmQgd2h5IGVuYWJsaW5nIHRo
ZSBjbG9ja3Mgd2l0aAo+IENMS19PUFNfUEFSRU5UX0VOQUJMRSBzb2x2ZXMgYW55IHByb2JsZW0g
c2luY2UgQ0NGIGlzIGRvaW5nIHRoaW5ncwo+IGF1dG9tYXRpY2FsbHkgZm9yIHVzLgo+IENhbiB5
b3UgcGxlYXNlIGV4cGxhaW4gKHByZWZlcmFibHkgd2l0aCBhbiBleGFtcGxlKSB3aGF0IHByb2Js
ZW0gaXMKPiBzb2x2ZWQgd2l0aCB0aGlzIGFwcHJvYWNoPwoKCklmIENMS19PUFNfUEFSRU5UX0VO
QUJMRSBpcyBjb25maWd1cmVkIGluIG11eCwgJ25ld19wYXJlbnQnIGFuZAonb2xkX3BhcmVudCcg
d2lsbCBiZSBlbmFibGVkIGZpcnN0IHdoZW4gX19jbGtfc2V0X3BhcmVudF9iZWZvcmUoKSBpcwpj
YWxsZWQuIEFuZCBkaXNhYmxlIHRoZW0gYXQgX19jbGtfc2V0X3BhcmVudF9hZnRlcigpLiBPdXIg
Z2xpdGNoIGZyZWUKb25seSBoYXMgdHdvIGNsb2NrIHNvdXJjZXMsIHNvIGFkZGluZyB0aGlzIGZs
YWcgZW5zdXJlcyB0aGF0IGJvdGgKY2hhbm5lbHMgMCBhbmQgMSBhcmUgZW5hYmxlZCB3aGVuIG11
eCBzd2l0Y2hlcy4KCkluIGZhY3QsIHdlIGp1c3QgbmVlZCB0byBtYWtlIHN1cmUgdGhhdCBjaGFu
bmVsIDAgaXMgZW5hYmxlZC4gVGhlCnB1cnBvc2Ugb2YgQ0xLX09QU19QQVJFTlRfRU5BQkxFIG1h
eSBub3QgYmUgdG8gc29sdmUgb3VyIHNpdHVhdGlvbiwKYnV0IGFkZGluZyB0aGlzIGZsYWcgZG9l
cyBzb2x2ZSBvdXIgY3VycmVudCBwcm9ibGVtLgoKCj4KPiBMYXN0IGJ1dCBub3QgbGVhc3Q6IGlm
IHdlJ3JlIHJ1bm5pbmcgaW50byBidWdzIHdoZW4KPiBDTEtfT1BTX1BBUkVOVF9FTkFCTEUgaXMg
bWlzc2luZyB0aGVuIHRoYXQgcGF0Y2ggc2hvdWxkIGNhcnJ5IGEgRml4ZXMKPiB0YWcuCgoKVGhh
bmtzIGZvciB0aGUgaGVhZHMtdXAuIEknbGwga2VlcCBhbiBleWUgb24gaXQgaW4gdGhlIG5leHQg
dmVyc2lvbi4KCgo+Cj4gQmVzdCByZWdhcmRzLAo+IE1hcnRpbgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QK
bGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
