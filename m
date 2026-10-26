Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79428606A31A
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Oct 2026 10:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PwztjtWR;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=OUTLOOK.DE header.i=@OUTLOOK.DE header.a=rsa-sha256 header.s=selector1 header.b=RCBlX9sv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=bEmgUeWaknyT4jtqH+YrW3PO8rlutGaoYpkrDEvQd2U=; b=PwztjtWReHNVHkBJGMenJ7alBP
	6oKDYC3/EGMuB/bRTnGdmT+YKhUY4m7tbgWgFhYzX/d6qU/cuhDg6tVHSk77T/C8OwHxh3piJyU8O
	eM12qV32na1r1yKUyZmJrMsG6XEic1CGHvX5CH+Maw6Wf/uNTKsjO2sq/tSQi2uKIRGnhl+J9UhKG
	Afg9njhV5BHjWanNoglVle5sXglecSJ+lriNmDktZfoLcLiuSdtL7Ur9rMoqicU2L3krDxobgxByf
	+fn9p0JUauVqwus3bBlMDCx7XM6O6f+dm91zRnFjxyk5lPGt2yynX5sf+gwLCuiriLINIObt0fcbb
	87s9iu8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLHct-00000002Dx0-1RJA;
	Mon, 26 Oct 2026 10:08:23 +0000
Received: from mail-norwayeastazolkn19013085.outbound.protection.outlook.com ([52.103.51.85] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLHcr-00000002Dwc-0b8b;
	Mon, 26 Oct 2026 10:08:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZN6ssiP/qpxt1+jIDBoBGBEH1kvjuj/vzLUqpbYawT1MxL9npes0JP4MkDoKXm+XHxS+arm3tUF06gQW7m1UPrrqM40HaLztDl7RXbITdbSrYAHsKWq4zLQjgNgm2qGO00nXxFa3OFdEIIKbFrokcv/DYQyJJsQPrdy7g2+Pvp8TGI+n5uxvELxQFoZDTBtDhyu16Gmg+9s17RztKVop69Hul5BNuuWslf/nGdnKuAE7KsG5x1Zujq0z0G5Ivt8rHqRxE/0Ykaezdi5LINMPh59Bg7cpziQivmGLTy3bjJvXa+fs322Z+gI+WRdc/69qaTCy6v/9kaeZS/4MJUHRKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jh3gJDtE8sPEumE5jIP9Jhv1Exct2n9Bhk02xWe4QPY=;
 b=K+Y+vGwW41SkWx7+9kawhKv/bOupNXj6Z6sVC+Vc8M5AR0nzMdGeUiO/Dk27/q7LTj6cPWv3KcCTBWAyxnJ5Z0oRzhwQnItIJSmCbncVZT7QzrzXhQgQV9G6ygG39USnpra1eEjfqDj9rd8WTxQA3rCAV6YHSs6Greqljjc1ZJPEhODc2BbPpK4RpgvXS5SCvy1ujEDGwxARkqCy0Ve6Wvre7vVlGBGrCE4lFwRUdjZvMVR7Y0o+4Grq41CUG3sVlWhdkugYQ89B6uTKt7PN/S8BbHlgwbuSYRIKfGpjv8IufxYmBJaarHwmJBw4BTvJ+s+okdvV9pZasFjoSPh+DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=OUTLOOK.DE;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jh3gJDtE8sPEumE5jIP9Jhv1Exct2n9Bhk02xWe4QPY=;
 b=RCBlX9svj7XWjVZdAkUUDAc/GIWKeCQY9rk43pZ81yZP1jSxtdnnrZg8lcGZnpCMGsDJPCtcWDgAVTRfvY+KmhpSjwt71zrUAIXWiWFUYJ8Gwx+3s0hVELfTs1YGNpjnP7pnpUC9Dnp4D234YkzD6a7RS+CbsGXuXez0/u2MruQ0DKmzCtboCVOdAMZmMwTWzdGHTqo+QFAo4pGGj7GFiCO+j43MWMfV56wEUtalcKDBiJBPMpJpMKx1xta2MtC8EKAg3mtZiXz+OZuNnbVZgVhfaALmpWT4pCpTQ7Nhw9VCwqinR9syRFyIWhVJ18ZO38Nzn35fr8mQBzEo5jgp5g==
Received: from MMZPR08MB549315.eurprd08.prod.outlook.com
 (2603:10a6:190:28::19) by AS8PR08MB9361.eurprd08.prod.outlook.com
 (2603:10a6:20b:5a8::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.14; Mon, 26 Oct
 2026 10:08:15 +0000
Received: from MMZPR08MB549315.eurprd08.prod.outlook.com
 ([fe80::21ab:3314:172:c7e5]) by MMZPR08MB549315.eurprd08.prod.outlook.com
 ([fe80::21ab:3314:172:c7e5%5]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 10:08:15 +0000
Message-ID: <MMZPR08MB549315DB32DCE8589A27E461B5DF612@MMZPR08MB549315.eurprd08.prod.outlook.com>
Date: Mon, 26 Oct 2026 11:08:04 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] cpufreq: add an Amlogic speed-bin driver
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: neil.armstrong@linaro.org, sboyd@kernel.org, bmasney+clk@redhat.com,
 khilman@baylibre.com, martin.blumenstingl@googlemail.com, rafael@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 =?UTF-8?Q?Christian_Stefan_K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
References: <20261025192219.209137-1-christian.koever-draxl@student.uibk.ac.at>
 <20261025192219.209137-5-christian.koever-draxl@student.uibk.ac.at>
 <at7lXEqds7ukoR2V@vireshk-B250M-D3H>
 <1jbj8gkff1.fsf@starbuckisacylon.baylibre.com>
 <at8WfX_G0tfTlFrm@vireshk-B250M-D3H>
Content-Language: en-US
From: =?UTF-8?Q?Christain_Stefan_K=C3=B6ver-Draxl?= <ckoever@outlook.de>
In-Reply-To: <at8WfX_G0tfTlFrm@vireshk-B250M-D3H>
X-ClientProxiedBy: FR3P281CA0097.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::15) To MMZPR08MB549315.eurprd08.prod.outlook.com
 (2603:10a6:190:28::19)
X-Microsoft-Original-Message-ID: <792d5a57-ba6f-4100-8145-7f863435a7c4@outlook.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MMZPR08MB549315:EE_|AS8PR08MB9361:EE_
X-MS-Office365-Filtering-Correlation-Id: da040348-fd84-4b6d-7fff-08df33490cfb
X-Microsoft-Antispam: BCL:0;ARA:14566002|39105399006|22141099003|25010399006|4140399003|19110799012|23021999003|8060799015|5072599009|15080799012|19101099003|6090799003|41105399003|40105399003|440099028|3412199025|1710799026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Qkt4NHhiRmlXeE10ZklNZGMrWGtNTEJPaGxDRUF6engrZ1YvaEprZFRDNkoy?=
 =?utf-8?B?QW9UVWw4SnRKcjJJdjF3MUhOMGlDTFVlM2JZRGl5K3l3M2plY0pqU05qS2hq?=
 =?utf-8?B?bGVoYUxaSzh1SzEyNkNhWHRzdWdwU0Zma2JLVzVuQUlybzNuajdmOEcrVHpJ?=
 =?utf-8?B?bGdjSUxEREIwcUlzTXRWbkRuaUFZaUx4bnZ4NU81b0VUWkpYcFpRWG5oMyty?=
 =?utf-8?B?RDVJMjZiVXYwUGw1aHRiNithWTV3WXZPNFhWcFJNMVR4Qi90bmlYRjBMTEsy?=
 =?utf-8?B?aDFkK0t3b24wQ1NhUHRvbDUzQ05OcDNwZGhjb1ZnQWc5bXZtdnpEUkJEZVVW?=
 =?utf-8?B?cEZRRmQ2MUlXTzZ2bUJGck5TeXE4TU96THpHbVpjSjZKSVNQLzRiT3QrbjhO?=
 =?utf-8?B?RlFXNnQyZ0lHTjlDeDZ0SnZEVU1FQWtQdFA0Mmo1Z1MvNERneVpoeldNTnAx?=
 =?utf-8?B?QXVyU0V1cWhZZ3UybTQrRUtkdFhpTDQ3Vlljb09pMFkwZ1JINlZQUU50TGZR?=
 =?utf-8?B?M3BKU0ZObGk1dTRiS1lKRnE2MWh0V3NFdUdudmtjdVZZOXQyWDYxMzAwdHpk?=
 =?utf-8?B?ZVNKM1dLWFFQSzZGK2ZvQWhDNTJKYnJlZC9mcmxxSG5NWmJXMDdwaXo5bFZR?=
 =?utf-8?B?N2Q0Vzk5MUg1cjAwd01TKytLbG9KRVVvRU8xdWh3ZGxGOWY5OVB1N09UcTQ2?=
 =?utf-8?B?SURwcFBEVEp3LzZjTWN6Z1pOT1Q0ZEtnejFmVzlsc2Z6NjF1MXJlcWtuY1cr?=
 =?utf-8?B?OW1UN0R0OUlIZWQya0NrekdnaU5VZnJEdmdSSmRHd090MWc1RXhEbmxUc0tG?=
 =?utf-8?B?WXdla0hUYkZIR2pobGtBdDhMN2ZiK0FNbWZqbEZTUTJRNXhwdyt2OGpFU3Nv?=
 =?utf-8?B?dGVDTVFPL3kwaGRqU2NsRmx6WFNFMXA2RGRYV3lpeUNHZGdHcmJtaHNHdlgz?=
 =?utf-8?B?aEQ3OCt3alllemJmNjNhdFFEU3ZqRVU5aTM5eDRNZ0M0Z2k2bkY3Yyt5MGw4?=
 =?utf-8?B?eFQwQjhzWjBJUHR3TzBqWm9TaU51VXVwTXhrVUk0VXFyQzVqamJFd1c3b0Vr?=
 =?utf-8?B?N2NoeGFqTmtjc25iSjFBM2ZZQTJKSG1zNDNXT1FNamlBVXhJUmhXWjFKNm1U?=
 =?utf-8?B?RXVlMm1yTnhJVEN4a2ZtTkxYaU9yNTVhems1ME0zcFhrbnZXU1BoTWNiNnE0?=
 =?utf-8?B?QkpRc1BuQk9nNnRJSFU4cWI1RFBDRTgwbmw1LzN2VEcwWmJuU1VGOTYzRnlC?=
 =?utf-8?B?Uzk1UXBjd0hjNVBrcDQ5S29xVHl4WThGT3RMUkZ3cnpSbnZGZDcrazZkREZC?=
 =?utf-8?B?RUl5UFFIRXFJc3ErYnFCaEpkalVCQVJRRVAvdkxoS0N5RTVLRmp3SzdFbXA3?=
 =?utf-8?B?am5UU0IzTENVR1RIaG1ia1JOdDJ3aXgxM0lpd3RtRFhPeStsanozcjhwOVV6?=
 =?utf-8?Q?cKdvhWTw?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TkFBU3cxQVJvUlAzcnFxTEpEdUJycWpwNHNib3Fjem5rNmpKMSsxVmh5K3I5?=
 =?utf-8?B?SmFmK0paTFM0Nm9sQmcrU2pHeXZCaDBPdnl1MmFEckx4NVAxbXRwVkpKM2pQ?=
 =?utf-8?B?ejJpUUxnSVI3V0wzTWFsR01YZ2xNd1RiaFh0V1c5d0VCa25STW1tZnhWSy9h?=
 =?utf-8?B?VktOSWxFU3YvMEpmR3dJT09YS2hkeGRFYmU2TjRlbjB1N043eDFzNmZoT1BR?=
 =?utf-8?B?amt5N3hrbE1zTVBYQkU0cmhJbEpqeXhmOFdMekQxdUZ2cmpRZk5DaVFzWUhl?=
 =?utf-8?B?czhmYzRJR3NzS1YwSGZMUElKOVZSdk9neiswVVN5TmFEQWFDNzZHdE91Qmdn?=
 =?utf-8?B?eEVVVXpZMmxnb3d1cGtnQzFMK0p5Nit5K1VzUDFtL2g3Q2hkSCtzYkZxeVNt?=
 =?utf-8?B?eFBZbFpkOUMxWWxOOWlraEVwZUFvOGlJaGIwbXZRWFhURUhPUnR0enYyUGo5?=
 =?utf-8?B?bEdtY3dReDNocjhYMGxiMmZNUkNDUVYrL291R0kxVWl3dFNEZWdESU94VU1E?=
 =?utf-8?B?LzlsTXdtKzJCQU5NMUZpY042VDFqTTVhQkQ5Q0xhWEJIK1ZTaVpndis0NkVr?=
 =?utf-8?B?UzVWTFVhZkJsRmM0eEtLOVdleVVscnV1L2NTYW1mN0h3ekVqWEN5QzRWZ1l1?=
 =?utf-8?B?US92N21uUnlqc3lCNmc0UnAyYTV1MlpMUk9Yb1daYiszc2xyRW1iZDNrdFdt?=
 =?utf-8?B?bTBBWSt3L0lwZDRKalF5RVhWbTNLcS9EbXF5cFAwZ2ZwZ1JTRER0Sk1PSGN0?=
 =?utf-8?B?dWxUendZWUFOZ0pvWm9QS1hyVHBMYi9EWDR4R3dwbHhuMVZqS2N4aVZIZ3E2?=
 =?utf-8?B?WnFjeFB2WHlSSkxYcS9YMUM2VTg5L0RQK0JnSjQ1WXBuZDNxVTU2TzBpUjFp?=
 =?utf-8?B?SVRySVNxb2dPNi9tUU5iRzgxWFJDbCtNNEFDeW5tbkE5RXdjbFdpNjRLLzIv?=
 =?utf-8?B?UDQwR0t2L1RLWktUZmRKNDVGYlRjVFI3NDZtUHB2NTdvRnJWMXAzRmgyRWdT?=
 =?utf-8?B?aTdmQzRsbXNNNHI2d25qcGV5Wm0vL2k1VllRaUJSNkQyVzJ4RVlhUFVzODBL?=
 =?utf-8?B?dUMzYnRxR0NXbUVZd3RBUUpCVThUTCtYc1dSSkF1LzFpSDVjd2x6Q1k4bUc1?=
 =?utf-8?B?cnpXcDJwZVRrSjNnNG9Ga0RjZ09pZXlGWmc2aFl5eTQvTHp4Um9HdjF2RUtX?=
 =?utf-8?B?aDREN00vV0I4ak1velkzWHUrNnFWWVdWQ1ZDZzFGRkIwdmN4Q0dEUGw5Uzhx?=
 =?utf-8?B?WGZtcnJReG55MGtXR0s0RjNoUllJUHpEdVhyZFlnVWNrU2RWeE15V3J5TW5R?=
 =?utf-8?B?QmJIVTJMME15SDNrUkxyRmZhS1BvVmZlMjgwSlpnZC9iQy9Ca0NBZ0JYZHVt?=
 =?utf-8?B?K2ZCZStseDFidHBmWEhuZDFsbVdMNzFKUit0dkV0cXZPSy95U1diYmIwZkpF?=
 =?utf-8?B?NkNJOHdzU3didDRZOTd3SXM5YnpzMzNxTVQ4UFArcStoZ2piUVkyWGl5SlBw?=
 =?utf-8?B?NjZzQi9CZWNJSTdzMHFOaXNTMytEbk9XdEJQRU0xbXJIOWlpNVlnMnQrU1dv?=
 =?utf-8?B?cHQ5QTRFL1hzQ0ZjQ290a3VNa3NPbXFlSENqb2E4alNadE9Hd25TaTFwV0dp?=
 =?utf-8?B?UHBKOHlUVVFkckJmYkZQZytxVjhSVThHdk9PMTdpM0xWdzBtN1o2bkZOYnBm?=
 =?utf-8?B?OTR1cSsxQnpPSTNEcUJ2VXNlcVRla05wVk5oa0dhdEdFa09QaEhVVFczMW1G?=
 =?utf-8?B?amhyMHMrb2NzMHBkdnBMRUdWaXZwdzVxRHZhZmxIQ2krYkF0YWJmTGNyNVNh?=
 =?utf-8?B?YmtWZXZHWmQwUGp6TmdpajRvL3RQWUVSYmRGUStjNDdhMHUwSTZwS0h2bkJN?=
 =?utf-8?Q?xIcN3KgFzrLsz?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-fbb9b.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: da040348-fd84-4b6d-7fff-08df33490cfb
X-MS-Exchange-CrossTenant-AuthSource: MMZPR08MB549315.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 10:08:15.5305
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9361
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_030821_192574_A2A0B50F 
X-CRM114-Status: GOOD (  11.08  )
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
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgVmlyZXNoLApIaSBKZXJvbWUsCgpPbiAxMC8yNi8yNiAwOTo1OSwgVmlyZXNoIEt1bWFyIHdy
b3RlOgo+IE9uIDI2LTEwLTI2LCAwOTo1NywgSmVyb21lIEJydW5ldCB3cm90ZToKPj4gT24gbHVu
LiAyNiBvY3QuIDIwMjYgYXQgMTE6MDAsIFZpcmVzaCBLdW1hciA8dmlyZXNoLmt1bWFyQGxpbmFy
by5vcmc+IHdyb3RlOgo+Pgo+Pj4gT24gMjUtMTAtMjYsIDIwOjIyLCBjaHJpc3RpYW4ua29ldmVy
LWRyYXhsQHN0dWRlbnQudWliay5hYy5hdCB3cm90ZToKPj4+PiBGcm9tOiBDaHJpc3RpYW4gU3Rl
ZmFuIEvDtnbDqXItRHJheGwgPGNrb2V2ZXJAb3V0bG9vay5kZT4KPj4+Pgo+Pj4+IEV2ZXJ5IFM0
IHNwZWVkIGJpbiBydW5zIHRoZSBzYW1lIENQVSBmcmVxdWVuY2llcyBidXQgbmVlZHMgaXRzIG93
bgo+Pj4+IHZvbHRhZ2UgY3VydmUsIGFuZCB0aGUgYmluIGNhbiBvbmx5IGJlIHJlYWQgdGhyb3Vn
aCB0aGUgc2VjdXJlIG1vbml0b3IuCj4+Pj4KPj4+PiBSZWFkIHRoZSBiaW4gZnJvbSB0aGUgZmly
bXdhcmUsIHNlbGVjdCB0aGUgbWF0Y2hpbmcKPj4+PiAib3BwLW1pY3Jvdm9sdC1zcGVlZDxiaW4+
IiBwcm9wZXJ0eSBmb3IgYWxsIENQVXMsIHRoZW4gcmVnaXN0ZXIKPj4+PiBjcHVmcmVxLWR0LiBC
aW5zIG91dHNpZGUgdGhlIGtub3duIHJhbmdlIGZhbGwgYmFjayB0byBiaW4gMCwgd2hpY2gKPj4+
PiBoYXMgdGhlIGhpZ2hlc3Qgdm9sdGFnZXMuIExpa2Ugc3VuNTBpLWNwdWZyZXEtbnZtZW0sIHRo
ZSBkcml2ZXIgYmluZHMKPj4+PiBvbiB0aGUgU29DIGNvbXBhdGlibGUgYW5kIG5lZWRzIG5vIG5v
ZGUgb2YgaXRzIG93biwgYW5kIFM0IGlzIGFkZGVkIHRvCj4+Pj4gdGhlIGNwdWZyZXEtZHQtcGxh
dGRldiBibG9ja2xpc3Qgc28gY3B1ZnJlcS1kdCBpcyBvbmx5IGNyZWF0ZWQgYWZ0ZXIKPj4+PiB0
aGUgYmluIGhhcyBiZWVuIGFwcGxpZWQuCj4+Pj4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3Rp
YW4gU3RlZmFuIEvDtnbDqXItRHJheGwgPGNrb2V2ZXJAb3V0bG9vay5kZT4KPj4+PiAtLS0KPj4+
PiAgIE1BSU5UQUlORVJTICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMSArCj4+Pj4gICBk
cml2ZXJzL2NwdWZyZXEvS2NvbmZpZy5hcm0gICAgICAgICAgfCAgMTQgKysKPj4+PiAgIGRyaXZl
cnMvY3B1ZnJlcS9NYWtlZmlsZSAgICAgICAgICAgICB8ICAgMSArCj4+Pj4gICBkcml2ZXJzL2Nw
dWZyZXEvYW1sb2dpYy1jcHVmcmVxLmMgICAgfCAxODQgKysrKysrKysrKysrKysrKysrKysrKysr
KysrCj4+Pj4gICBkcml2ZXJzL2NwdWZyZXEvY3B1ZnJlcS1kdC1wbGF0ZGV2LmMgfCAgIDIgKwo+
Pj4+ICAgNSBmaWxlcyBjaGFuZ2VkLCAyMDIgaW5zZXJ0aW9ucygrKQo+Pj4+ICAgY3JlYXRlIG1v
ZGUgMTAwNjQ0IGRyaXZlcnMvY3B1ZnJlcS9hbWxvZ2ljLWNwdWZyZXEuYwo+Pj4gSXMgaXQgc2Fm
ZSB0byBhcHBseSBqdXN0IHRoaXMgb25lID8gSSBjYW4gdGFrZSB0aGlzIHZpYSB0aGUgUE0gdHJl
ZSB0aGVuLgo+PiBJIHdvdWxkIGFkdmlzZSB0byB3YWl0IGEgbGl0dGxlIGZvciBBbWxvZ2ljIHRv
IGNoaW1lIGluLgoKVmlyZXNoLCB0aGFua3MsIGJ1dCBwbGVhc2UgZG9uJ3QgYXBwbHkgaXQgYWxv
bmUuIEl0IHdvdWxkIG5lZWQgdGhlIApzcGVlZC1iaW4gY2FsbCBmcm9tIHBhdGNoIDMgKG1lc29u
X3NtKSwgYW5kIHdpdGhvdXQgdGhlIENQVSBjbG9jayBmcm9tIApwYXRjaCAyIGl0IGhhcyBub3Ro
aW5nIHRvIHNjYWxlLgoKQmVzdCByZWdhcmRzLApDaHJpc3RpYW4KCj4gU3VyZSwgSSB3YXNuJ3Qg
Z29pbmcgdG8gd2FpdCBmb3IgdGhlIG1haW50YWluZXJzIHRvIHJlc3BvbmQgYW55d2F5Lgo+Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxv
Z2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
