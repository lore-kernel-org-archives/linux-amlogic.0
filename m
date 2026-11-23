Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52DC9606A31A
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Nov 2026 07:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VpZcxdV1;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=amlogic.com header.i=@amlogic.com header.a=rsa-sha256 header.s=selector1 header.b=HcaPxNe/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:To:Subject:
	Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=5JWd1JgMfEchNjcrz5QLwSChvB+GTzHS1aoXGewnkx8=; b=VpZcxdV1M6avKsoaOXLPC6xVTf
	MMV9v8BCEe/mGkUI6dBXu+McmK2u6LXhKncuTDnWJai4neKrl1vO2toJot43YA2k3jyzpk6r8fOOr
	ij882bUZsZMtzP/hBr87pn/KQ6UyshjwvWkU72O7v7FkoPh79pevycFjyFcUEe8RoX3GFlum9r9Ed
	8VKmWkXNBh2mRUSRrzWM4Gpe8r8ezT0VHTWWj13PRswDGVadgdauZc/HN7aGnfnD9H428fH8mxcom
	ij4RJXb3qEtyuy7Zro4aOUhYi5yGAFUV0MzGcvGHj8i+AXFN7G4l0/cgQo+3z6vdcnC1Ayy9he9tR
	CLzZGU0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVOai-00000002T1T-1rzm;
	Mon, 23 Nov 2026 07:35:56 +0000
Received: from mail-japaneastazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c405::5] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVOab-00000002T0b-2plk
	for linux-amlogic@lists.infradead.org;
	Mon, 23 Nov 2026 07:35:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AQOOHKRTE1HHJzpX8lxLlCTZKyPmZi7aZOdIM7xtp8sAM7aQULmUHAh6O5amGDeJoX0trFG60RSTqNtmm+uuAI7LcOygmFFLp2JBrI+dho9Uvv1uMCRc1FYnj0D0D8ZEO8oq4vrwNnNrzabH1+Qhwu+sc0vVMH08S3p7nuxgf0YW4r1CG9MPdWm6Iy6wTkB7b9UyFsNDMHiDUc5ufl1EuhGa8Vuo5MvfJqfjIR0EN6sJ2q5ndPCyCFCpRFGElqu5d1x8IXoBONsydjUzW5oUtR3nTL23obIdcm9zMzvvHTM3RiM3LrbzisHLIu1moH+0Jb9yMI+k3IjKiUt1W5Lvrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UAprrplEPsRyklvJQG2BEriwF3KmZrQkcKVu4nyTnok=;
 b=DnetbCyfESpkkaw5iYp+SYHP9ZsmbURhkS/KiKutSPz6L55EriJcfoP4n/DPIyIeWvnq3UOqJDI2jS+8dW2cbcyv9ALq0GTRM4sqUKWkPXAry5ar5z9i4r9xQu/07FsLsBhEWcE/JEOZW1vH8a1tyo6HoUrJR+EW8fE8iozn6GKGpq6H4JjoKrcBVbz6UAtgWVBhngBsJBGh9UHy7FV5r/9VPJzCsrFh1/LK2MCkLI7v7JIEQ2WVnCl9HRXcqPquJ3R+nJCMtpHFbDihuBWCFz4jHc5KhEmJWR8Ka3bCybrSdCJToKg/q8kwXUFlKDr9/oaZqckfjTG6jVVMPJOjPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UAprrplEPsRyklvJQG2BEriwF3KmZrQkcKVu4nyTnok=;
 b=HcaPxNe/23CMnhm9eSzakhuGFKW+qIh+4E1wr7llPXqFziC9YX2XxzKG83nCNkGJg/Mh2RFS0zEtmIKjG/YiifCq7jf10u6iamwE0RAkKOZXtAFv7DuV1lXz2gor+JKMuL/BtK9LjPd+/zCOSB5MNsmVQHXDMXLqoxoFO2U3jZ3VHSqoXCPSdrKi1ksQviBX8ogYldSlcIto1Sb9y54s4pI6Xiu0aDLdOlfdtpaLz6pw2GIXtmRlVvCg3iNnR0IZ+olM32p2ShoP+2Fh9udz6XqP7o8HPnbYpmn9ztlMj259NUujbWAcKSCtp1B0r2jshQ7dH2qXD629Mrv81SvvJQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5521.apcprd03.prod.outlook.com (2603:1096:820:51::12)
 by KUZPR03MB9455.apcprd03.prod.outlook.com (2603:1096:d10:45::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Mon, 23 Nov
 2026 07:35:38 +0000
Received: from KL1PR03MB5521.apcprd03.prod.outlook.com
 ([fe80::f12b:85e:f95c:191e]) by KL1PR03MB5521.apcprd03.prod.outlook.com
 ([fe80::f12b:85e:f95c:191e%3]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 07:35:38 +0000
Message-ID: <9a5feadb-13d9-4654-9c5e-f7e97a1b8081@amlogic.com>
Date: Mon, 23 Nov 2026 15:35:36 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: Amlogic S4 (S805X2) video decoder firmware for linux-firmware
To: Xianwei Zhao <xianwei.zhao@amlogic.com>,
 Paul Menzel <pmenzel@molgen.mpg.de>, Arden Jin <Arden.Jin@amlogic.com>,
 Hui Zhang <Hui.Zhang@amlogic.com>
References: <cda06da6-e7e0-4522-b1ab-ec542d4703d2@molgen.mpg.de>
 <8be8337a-5b73-4a9a-82a5-5acbdb6d6964@amlogic.com>
From: Zhentao Guo <zhentao.guo@amlogic.com>
In-Reply-To: <8be8337a-5b73-4a9a-82a5-5acbdb6d6964@amlogic.com>
X-ClientProxiedBy: SI1PR02CA0019.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::15) To KL1PR03MB5521.apcprd03.prod.outlook.com
 (2603:1096:820:51::12)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5521:EE_|KUZPR03MB9455:EE_
X-MS-Office365-Filtering-Correlation-Id: bed05e22-ae01-4f28-f05c-08df49345e75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|261028144727099003|10067099003|11063799006|261102123227099003|4143699003|5023799004|261022075727099003|261009223027099003|56012099006|261022105027099003|261026121527099003|261021121427099003|261026140227099003|18002099003|22082099003|13003099007;
X-Microsoft-Antispam-Message-Info: rMNZa0Vl6OrAyCYJQC0UVsz1ElQTTB/slhDEFn4fxtDUumhrr3PDyIUIpUgLqajwRgSQWyOaNwmjwieLXt5NXiJIFCC4NtIlgfJyFvKE7yzamHy3PXMrzqPCRZDQJhnuKAzDSzF34t77oJ2mJNuyBnckZf5FjUFDYDLpD6nAC/5msKv1gA2We4Mgeeqq2rSJMo+BqE7TcY6IsRxRN2y2Y5Jq5S8zH9dGjyzNvejJtz4I2ch+1xQIRv8+ylv73l0yh3fWVOgTgQ18nd96Z7OyHMNa4kRKzSO4wOHEqgqRnHylW7b6kZVKlBW3auDuR61a36cY3/SywrcA4fMEj//lTeY5hUZHgJGJWcXcBaAOWsXMz0mKtBGNbAS5JH1heOiBtIsYJ4nb1n81/LX7tulyQdSH1i0T4M88vrBWw2Dta45hOUtqPDzVPCxP02SEVsHTpZXavseLn7VE2njmcw7FdtodvQAOzZHiIDtHfNvYr+aBm8KAJwyeFa4L/8bVB86cCpX3sGtUhXX+ycElHuUui5twRunR6MzRmGVdIE7RYebzFd+ArYXmYRQ5IWZuU1V2GZrQs+7v8aDRq4ZgTb2pU8yTU1yQIHHAlAJh2uCgvzY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5521.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(261028144727099003)(10067099003)(11063799006)(261102123227099003)(4143699003)(5023799004)(261022075727099003)(261009223027099003)(56012099006)(261022105027099003)(261026121527099003)(261021121427099003)(261026140227099003)(18002099003)(22082099003)(13003099007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K3JGb0h0YkZPaS83UzlhaUhZMVVPZ0RWS0NmdWpOMWptdUdsUDNEc1FuNEx0?=
 =?utf-8?B?UVdSaGFmOGc1cS9NYXlablJjY251cHYvZVJLTWtkc3ZNS0U4TWZLajk5TlU3?=
 =?utf-8?B?aWordEgvRzVZdllXUWdZR29ZZU9yWncyRUZERTV3UytuTDI3eDNibzBiOTVG?=
 =?utf-8?B?REFFZnRBME82LzdpQTJ0YkpIc2xkazFyWTRXd3JUak5hMEVha2dKM0VmbjlE?=
 =?utf-8?B?UWRKeExrUXVHRzQ5TENXVHRlQ1I0QkhYRTAwZ1FjMXFZVmVpaGFnWk4zWk1x?=
 =?utf-8?B?Y3BId3pFWnUvZlJVSktCdFNvZGhsNjFsWXM5cGJTREdZaEp0VU91ejVHdEJt?=
 =?utf-8?B?MEVPWlFibDFMRlBFZXNmdDRnR00xNHpnZ1hzVFdLM2g3VFZiYkZHV2Y5NGJR?=
 =?utf-8?B?cUR2bmtSRThOcVRISGJvTTFqUWRUbnVveEJ3czludXNvSHE0L3M4a1VMaHF3?=
 =?utf-8?B?RlcxZndmVVFCOXJLRndzMHFUOVVqR25KWEliTUtCc1ozUWF5Vjdib09nSzBE?=
 =?utf-8?B?cHVsT0h2cldQb3ZJdCtpdnZKS0JkLzVYZ2FPUk50azNvWlFUL2Uwa0pwa2xM?=
 =?utf-8?B?WU1xb0ExSngwZDJkRnJmZGlKaThJcW0yclZaSmx1WG0rd1M5L1Q3ZWR1RldS?=
 =?utf-8?B?VS9hQUMvOEFMWlpiVnJQeEJLYVR2MkFQSWc3Q1RKVlQvdWVzaXlwOHVCY3dY?=
 =?utf-8?B?bzlPcTVCdC9zMVNDc1QySGE5RVhQWit0bVFKMTcvKzlqN2M0R3JFUzJIRkxm?=
 =?utf-8?B?WjJPUG5vcjJHZVhvUlhXbVNOOEVjRUhpNGN0OGdOc082TDVLSG5QcXhlR0ZY?=
 =?utf-8?B?aUFmSXhLd0RHeDQ1RW5hWXByMVZra2lMalV1bEorY1d5VlN6N2owK3JISUIv?=
 =?utf-8?B?NVE1QUFnaGhwRFNVcVhYOVFmTFhIbXVwTyswOTlTQnJ0aWNqb1RPKzFYWXdK?=
 =?utf-8?B?N28raXp0WXpwbHQyRUwzUTlwSlROYmdyaEVvNThGT2RPeDRzV3BjTGZXb2d3?=
 =?utf-8?B?NEErVEszQWZnNjVyTGhCUi8vWEVkTEJqN25CaVZNMitXZUdOcVQ2YTdIdnRZ?=
 =?utf-8?B?RnFwUElzSkQraHZodWdGR3ZVbXFwUkRSYkluUllzVjJJbkc4TEZrSnlPUy9Z?=
 =?utf-8?B?QmEvN2hBRHdzazROdDlHYVlaWmdSRHRidGRaS0JSaFNscjArRGo3cTNtbXVw?=
 =?utf-8?B?Q1h3dis5REpUZnJLZkRVVmtiVGdadk53UmFqMHFYNi9ldElxZEMrY3ZpU0o3?=
 =?utf-8?B?NmZBanpORStXd0xIaFdzb29sN3dnOXJESFRKaTVlMUpIeks2Z2M4L2lYVzRv?=
 =?utf-8?B?eWtMcjgzbldLYkdTbHJUVTJNYUxMNzdFQ2o0VURESFlJWVFjZGJZdnB6d2Jr?=
 =?utf-8?B?VGpjeHcwMnNhT1dNZklSa2ErVzdnTitqdFJkV1FJSXlYTGROU1Znc3BQUzZv?=
 =?utf-8?B?aXM0dXNqMmJwQ0w2dHhNa1pmelFYNkdiKzhWSUtSMUdoSk9NdjU5STJNcUdN?=
 =?utf-8?B?V0xUVUpCSVU4NGZRQ0JsNzViKzJCSW9NdTZKSUtSRlordjRoemFJanJvMFN6?=
 =?utf-8?B?bnRsZ1k1eTNYa2k0c2dWMUM5Qld4bUNQMkNTVTFreUhyMUlaS2JtMHhoVGNv?=
 =?utf-8?B?Ym5LMCtiQ2pDbEZHaUlRSmFPenJLN3BzKzBFNkJzNUNNc2h1UHlZUi9ZOFVJ?=
 =?utf-8?B?a2FXUnVZRVJKOUJ4WmlXKytadWY3VVZQNjJ5ajZOK3lsTGxRYVJiK1RRSzJv?=
 =?utf-8?B?bzU1MUZQNVBKMFNQbWV1cnNPNXVjaE1QcHoxUXdzMEduWXhjYVNoZXAraWVG?=
 =?utf-8?B?MFc1bTY2WEtkbWwzdlB5K0dqNVNFSzVRY29mMVNsM1hJbW1NQ0dmbGxHVER5?=
 =?utf-8?B?eHlkN1RBY0gwd2p3aTZKK2pRanFBQVZmNzhPUEI5ZEJTby9oNXRlaU1xbHFS?=
 =?utf-8?B?c29pNkhJK3FGdzg5RUFBRzU5TFZ6NXdDbVlhQjJwSDlvU0FGcVNGcWFabE9t?=
 =?utf-8?B?aGY0S1Q5dHorM2xYSmVLcjdhakF4Q1h4ekxiYnRnV3JqbTVZaXJWRENhRlhV?=
 =?utf-8?B?eWxlNFhlVytiUWkrMjR3anFRNExZMVdTT3JaR0xRRnZvZ3pHb1dHcGIxMFph?=
 =?utf-8?B?bUQ3c2ExZDJmeklBc3F2M2p6bE9SclJBano5VlNOVmV2TjU4ZVE3N3ZzNk5h?=
 =?utf-8?B?ZENrbEpudk52MUJtaVg4RTczQjZtZ3RwbjZHT3lqVGt1ZzZPcGZhRUp4VVlN?=
 =?utf-8?B?a3VvVnJDc1c4VDRKdUtCcktBUTY5blBaZzdzcEpEQkVPUlZ5bmIzaU1DOG53?=
 =?utf-8?B?YzR4bEZ3bmFoSFpzRU9iLzc3Nm1SQmlodHRreHhDcWpsbWt1Y2lHUT09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bed05e22-ae01-4f28-f05c-08df49345e75
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5521.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 07:35:38.4445
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DHdbg5otClEOTzLwZdQFJS98DfjyZ3+NdwwUzYaumj9ZQXhFjn/g3o9yl1JrnKf/99vmSzhDFGvXC2HCRdrmDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUZPR03MB9455
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_233549_731739_4F47D3B4 
X-CRM114-Status: GOOD (  18.53  )
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org, linux-media@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

RGVhciBQYXVsLAoKPiBIaSBQYXVsLAo+IMKgwqAgQSBjb2xsZWFndWUgb2Ygb3Vycyh6aGVudGFv
Lmd1b0BhbWxvZ2ljLmNvbSkga25vd3MgdGhpcyBwYXJ0IGJldHRlci4KPgo+IEhpIFpoZW50YW8s
Cj4gwqDCoCBDb3VsZCB5b3UgcGxlYXNlIHRha2UgYSBsb29rPyBUaGFua3MhCj4KPiBPbiAyMDI2
LzExLzIyIDE3OjE4LCBQYXVsIE1lbnplbCB3cm90ZToKPj4KPj4gRGVhciBYaWFud2VpLCBkZWFy
IEFyZGVuLAo+Pgo+Pgo+PiBCZWZvcmUgYnV5aW5nIGEgQ2hyb21lY2FzdCB3aXRoIEdvb2dsZSBU
ViBIRCAoYm9yZWFsLCBBbWxvZ2ljCj4+IFM4MDVYMi9TNCksIEkgd291bGQgbGlrZSB0byBzb3J0
IG91dCB0aGUgZmlybXdhcmUgc2l0dWF0aW9uLgo+Pgo+PiBsaW51eC1maXJtd2FyZSBoYXMgbWVz
b24vdmRlYy8qLmJpbiBmb3IgR1hCQiB1cCB0byBTTTEgdW5kZXIKPj4gTElDRU5TRVMvTElDRU5T
RS5hbWxvZ2ljX3ZkZWMsIGV4dHJhY3RlZCBmcm9tIEFtbG9naWPigJlzIEp1bHkgMjAxOQo+PiBy
ZWxlYXNlIChsaW51eC1maXJtd2FyZSBjb21taXRzIGUwNGNjNTZkIGFuZCBmYjUwNWE2OSwgd2l0
aCBBcmRlbiBpbgo+PiBDYykuIFRoZXJlIGlzIG5vdGhpbmcgZm9yIFM0Lgo+Pgo+PiBJbiB0aGUg
bWVkaWFfbW9kdWxlcyBzb3VyY2VzIEdvb2dsZSBwdWJsaXNoZWQgZm9yIGJvcmVhbCBbMV0gKHBh
Y2thZ2UKPj4gdjAuNC42NiwgY29tbWl0IDE3NTIzNTcsIGJ1aWx0IDIwMjQtMTItMjcpLCBJIGZv
dW5kOgo+Pgo+PiAxLsKgIGZpcm13YXJlL1M4MDVYMi92aWRlb191Y29kZS5iaW4gYW5kIGZpcm13
YXJlL1M4MDVYMkcvdmlkZW9fdWNvZGUuYmluCj4+IGFyZSBORVdQIHBhY2thZ2VzOiBvbmx5IHRo
ZSBoZWFkZXJzIGFyZSBpbiBwbGFpbnRleHQsIGFuZCB0aGUgbWljcm9jb2RlCj4+IGlzIGVuY3J5
cHRlZCBhbmQgbG9hZGVkIHRocm91Z2ggT1AtVEVFIChURUVfU01DX0xPQURfVklERU9fRlcpLgo+
Pgo+PiAyLsKgIFRoZSBoZWFkZXJzIHJlY29yZCB0aGUgQ1JDMzIgb2YgdGhlIHBsYWludGV4dC4g
RWFjaCBvZiB0aGUgMTQgUzQKPj4gZW50cmllcyBoYXMgdGhlIENSQzMyIGFuZCBzaXplIG9mIGFu
IGVudHJ5IGluIHRoZSBnZW5lcmljIHBsYWludGV4dAo+PiBwYWNrYWdlIGZpcm13YXJlL3ZpZGVv
X3Vjb2RlLmJpbjoKPj4KPj4gwqDCoMKgwqAgLSBTTTEgYnVpbGRzOiBoMjY0X211bHRpLCBtcGVn
MTJfbXVsdGksIHZjMSwgeHZpZF9tdWx0aSwgYXZzX211bHRpLAo+PiBoMjY0X212Ywo+PiDCoMKg
wqDCoCAtIEcxMkEgYnVpbGRzOiBoZXZjLCBoMjY0X211bHRpX21tdQo+PiDCoMKgwqDCoCAtIFQ1
RCBidWlsZHM6IHZwOV9tbXUsIGhldmNfbW11LCBoZXZjX21tdV9zd2FwCj4+IMKgwqDCoMKgIC0g
U0MyIGF2MV9tbXUsIFQ3IGF2czJfbW11LCBHMTJCIG1qcGVnX211bHRpCj4+Cj4+IDMuwqAgTm9u
ZSBvZiB0aGVtIGlzIGJ5dGUtaWRlbnRpY2FsIHRvIGEgZmlsZSBpbiBsaW51eC1maXJtd2FyZSwg
YW5kIHRoZQo+PiBjdXJyZW50IHBhY2thZ2Ugbm8gbG9uZ2VyIGNvbnRhaW5zIHRoZSBzaW5nbGUt
aW5zdGFuY2UgSC4yNjQgYW5kCj4+IE1QRUctMS8yIG1pY3JvY29kZSB0aGF0IHRoZSBtYWlubGlu
ZSBkcml2ZXIgbG9hZHMgKGcxMmFfaDI2NC5iaW4sCj4+IGd4bF9tcGVnMTIuYmluKS4KPj4KPj4g
VGhlIGZpbGVzIGNhcnJ5IG5vIGxpY2Vuc2UsIHNvIEkgY2Fubm90IHN1Ym1pdCB0aGVtIG15c2Vs
Zi4gTXkgCj4+IHF1ZXN0aW9uczoKPj4KPj4gMS7CoCBEb2VzIEFtbG9naWMgYWdyZWUgdG8gZGlz
dHJpYnV0aW5nIHRoZSBTNCB2aWRlbyBkZWNvZGVyIGZpcm13YXJlIGluCj4+IGxpbnV4LWZpcm13
YXJlIHVuZGVyIExJQ0VOU0UuYW1sb2dpY192ZGVjPyBDb25jcmV0ZWx5LCB0aGUgcGxhaW50ZXh0
Cj4+IGJ1aWxkcyBTNCB1c2VzLCBhcyBtZXNvbi92ZGVjL3M0XyouYmluLiBXb3VsZCB5b3UgcHJl
ZmVyIHRvIHN1Ym1pdCB0aGVtCj4+IHlvdXJzZWxmLCBvciB0byBhY2sgYSBzdWJtaXNzaW9uIGZy
b20gbWU/CkluIGZhY3QsIEFtbG9naWMgaXMgY3VycmVudGx5IHdvcmtpbmcgb24gdXBzdHJlYW0g
ZGVjb2RlciBmb3IgdGhlIFM0LCAKaW5jbHVkaW5nIHN0YXRlbGVzcyBkZWNvZGVyIGRyaXZlciBw
YXRjaHNldDogCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWFtbG9naWMvMjAyNjEwMjIt
YjQtczQtdmRlYy11cHN0cmVhbS12MTItMC02MTYyNDA5Nzg3OTJAYW1sb2dpYy5jb20vIAo8aHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtYW1sb2dpYy8yMDI2MTAyMi1iNC1zNC12ZGVjLXVw
c3RyZWFtLXYxMi0wLTYxNjI0MDk3ODc5MkBhbWxvZ2ljLmNvbS8+LCAKYWxvbmcgd2l0aCB0aGUg
bWF0Y2hpbmcgZmlybXdhcmUgc3VibWlzc2lvbjogCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xp
bnV4LWFtbG9naWMvMjAyNjExMTYwOTQwNDAuNDE3NjIwMi0xLXpoZW50YW8uZ3VvQGFtbG9naWMu
Y29tLy4gClRoZSBjdXJyZW50IGZpcm13YXJlIHN1Ym1pc3Npb24gY292ZXJzIHRoZSBTNCBwbGF0
Zm9ybSBhbmQgdGhlIEguMjY0IApjb2RlYzsgd2Ugd2lsbCBleHRlbmQgaXQgdG8gbW9yZSBwbGF0
Zm9ybXMgYW5kIG1vcmUgY29kZWMgZm9ybWF0cyBpbiB0aGUgCmZ1dHVyZS4gQW5kIG9mIGNvdXJz
ZSwgd2UgcGxhbiB0byBtYWtlIHRoZXNlIHN1Ym1pc3Npb25zIG91cnNlbHZlcy4KPj4KPj4gMi7C
oCBUaGUgbWFpbmxpbmUgZHJpdmVyIGxvYWRzIHRoZSBtaWNyb2NvZGUgZnJvbSB0aGUgbm9uLXNl
Y3VyZSB3b3JsZCwKPj4gYnkgcG9pbnRpbmcgKEhFVkNfKUlNRU1fRE1BX0FEUiBhdCBhIGNvaGVy
ZW50IGJ1ZmZlci4gRG9lcyB0aGlzIHdvcmsgb24KPj4gUzQsIG9yIGRvZXMgdGhlIERPUyBibG9j
ayBvbmx5IGFjY2VwdCBtaWNyb2NvZGUgbG9hZGVkIGJ5IEJMMzI/IElmIHRoZQo+PiBsYXR0ZXIs
IGlzIHRoZSBTTUMgaW50ZXJmYWNlIGRvY3VtZW50ZWQsIGFuZCBkb2VzIHRoZSBCTDMyIG9uIHBy
b2R1Y3Rpb24KPj4gUzQgZGV2aWNlcyBpbmNsdWRlIHRoZSBtaWNyb2NvZGU/ClVubGlrZSB0aGUg
bGVnYWN5IGNoaXBzIHRoYXQgYWxyZWFkeSBzdXBwb3J0ZWQgaW4gbWFpbmxpbmUgKHN1Y2ggYXMg
RzEyLCAKU00xLCBldGMuKSwgdGhlIFM0IGFuZCB0aGUgbmV3ZXIgY2hpcHMgY2FuIG9ubHkgYWNj
ZXB0IGZpcm13YXJlIHRoYXQgaXMgCmxvYWRlZCBpbnRvIHNlY3VyZSBtZW1vcnkgYnkgQkwzMiBh
bmQgdGhlbiByZWFkIGJ5IHRoZSBBTVJJU0MgaGFyZHdhcmUgCmN1cnJlbnRseS4gVGhlIG1pY3Jv
Y29kZSBvbiBwcm9kdWN0aW9uIGRldmljZXMgaXMgYWxzbyBsb2FkZWQgZm9sbG93aW5nIAp0aGlz
IHNhbWUgcHJvY2VkdXJlLiBUaGUgbGVnYWN5IGNoaXBzIGNhbiBzdXBwb3J0IHRoZSB1bnNpZ25l
ZCBmaXJtd2FyZSAKbG9hZGVkIGJ5IENQVS4gVGhlIHN0YXRlbGVzcyBkZWNvZGVyIGZvciB0aGUg
UzQgd2lsbCBhbHNvIHN1cHBvcnQgdGhlc2UgCmxlZ2FjeSBjaGlwcyBpbiB0aGUgbmV4dCB5ZWFy
LgoKPj4KPj4gMy7CoCBEb2VzIGcxMmFfaDI2NC5iaW4gd29yayBvbiBTNCwgb3IgaXMgdGhlcmUg
YW4gUzQgYnVpbGQgb2YgdGhlCj4+IHNpbmdsZS1pbnN0YW5jZSBILjI2NCBtaWNyb2NvZGU/IE9y
IHNob3VsZCB0aGUgbWFpbmxpbmUgZHJpdmVyIHVzZQo+PiBoMjY0X211bHRpIG9uIG5ld2VyIFNv
Q3M/ClRoZSBnMTJhX2gyNjQuYmluIGRvZXMgbm90IHdvcmsgb24gUzQsIGFuZCBubyBtb3JlIHNp
bmdsZS1pbnN0YW5jZSBIMjY0IAptaWNyb2NvZGUgY2FuIHJ1biBvbiBTNCBhbmQgdGhlIG5ld2Vy
IFNPQ3MuIEFsbCB0aGUgbmV3IFNPQ3MgY2FuIG9ubHkgCnVzZSB0aGUgaDI2NF9tdWx0aSBmaXJt
d2FyZS4KPj4KPj4KPj4gS2luZCByZWdhcmRzLAo+Pgo+PiBQYXVsCj4+Cj4+Cj4+IFsxXTogCj4+
IGh0dHBzOi8vbmVzdC1vcGVuLXNvdXJjZS5nb29nbGVzb3VyY2UuY29tL21hbmlmZXN0X3JlcG9z
L21lZGlhX21vZHVsZXMKCkJlc3QgcmVnYXJkcywKClpoZW50YW8KCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlz
dApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
