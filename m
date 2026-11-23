Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD02606A31A
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Nov 2026 03:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nttrEj34;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=amlogic.com header.i=@amlogic.com header.a=rsa-sha256 header.s=selector1 header.b=QV0fnC4e
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:To:Subject:
	Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=+gPM6lr+amDpAx+/TaHajQjwaAQ1N+R9cPYMMt47eI4=; b=nttrEj34DkeGrZGu7/1eM5Jm9g
	2iFgj7I6QvCFRvsEF5PUcWbE+7rz6/LA3DNd9lIj43bvvfrbt2l5dg5DH554aql810O2g/gvvv/t8
	Nbh09YiIY3ymmzU9tofGNeDtM3JmRE6EGTN8WqXkIRxoPwRBs3zhAQjRbWwM5zjDqFb1VI7um8UqZ
	fcDfcgelqFMaEXMr5RIXQcIsVf8Sx3iATT5mA96AVUFoRKjAxTZpaFFSl/dKBO9g0dvUkVv0REwYS
	8shU1NktfBW9iPy+VK19EPPDMr0JuVhf/PlC8Jgd89mpOlms+4iGFmZDXb5ZmJDWpgLISV5S1r1ba
	vmvFXJTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVKMR-00000002AAz-2rZO;
	Mon, 23 Nov 2026 03:04:55 +0000
Received: from mail-japaneastazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c405::5] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVKMO-00000002AAU-45Xh
	for linux-amlogic@lists.infradead.org;
	Mon, 23 Nov 2026 03:04:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RP/+2x759K8qVVRgjIXHZJNwS5y42Si3PcT29h5g/Xh71USH1mlF4BRG8ZLCuqV8LUeOQB5cyNyDEQOYCeO4/laG5cpCl1JxuMKCg13eTSdPecP0zBSq835IP+zVrNnE+fA7XJ1OCfQqcw9TE9f0q16HYkQNMQeiGT3nciYZalii2+bIQ+KE6DF3EoGbDlpPREHK2qrrudJccgUyb3bMf4X/y74sZwtiYwmnLFZZC5clPsrTacyMzXOyRLqRNWvPIPuj6OAibluDuPuycpBUgTEFiJgqZQ7JEsFpYndYnV6cJqIE84W3od91N9c9HvPnush3CzJQBVBOyygUAu4zVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O9sezsgnrkdf3D0PLk4Soehtn93rbnFgUq/F/+Xbx+c=;
 b=khSvVc4A6+ZsqICPLV4EIxOMyoUgBtIMX9+MkJZXM13POff3lYtGQIWEDWE1KSU468dZ0cXlDjQkX3vNMBBPGFUlxwUKa0t0R7wVbT1v5umfQ9N39Qac4PlavZynk4mOeIJ6mGo+f20oZSQFQFnCTYuzjNV6gzz1/uAiHFk7gNq/pk5ElNNXQUKCIG2VRu1WRURy8DIjDm4exif1BkI3ba2PNvXbjdhl3aIi20cDFnXaNVCEpS3vAH31766NvleRfzeR+cmHeRvDAnGNXPruD3drlNIYg2svKneaVecxVeNnD4L2QSXqS4844fmXSSsjf9WHJZigruf76ioLNqE1Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O9sezsgnrkdf3D0PLk4Soehtn93rbnFgUq/F/+Xbx+c=;
 b=QV0fnC4epnyx3WBKS3Fz1xSxybQgNYCycez5uoWd8o8BIeO8tvtWvgLJKTZsY4WEfHrRDcY53gj5fRiG27m4SH8bKg8OENJWsblG5dtXMGF0SoGGPdPQXkxF6wGE65HuMLfyGyCKLOHsI7r9YAajFCZ0J02xpIvJ8h+nYLS4WwB845UyKr22yQvulNy2FnDURsr9RIGeJJ+gfX8SKLKjIDbKCjnqu+x0Rg1MEiFVMU2dICBeTbAZyJCOTgcMnQUNA/Iq/BlY5bZQ9Puz+xXzI58u2TeOUmPTDAnqKDIFg2qCjNCVdPCH9ISUkt+yGXhaJCPWkb9qF4LllyltWXoetg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by SE1PPF2F43B4ACE.apcprd03.prod.outlook.com (2603:1096:108:1::84b) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Mon, 23 Nov
 2026 03:04:43 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::78d4:9dee:2e32:d1e4]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::78d4:9dee:2e32:d1e4%7]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 03:04:43 +0000
Message-ID: <8be8337a-5b73-4a9a-82a5-5acbdb6d6964@amlogic.com>
Date: Mon, 23 Nov 2026 11:04:38 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: Amlogic S4 (S805X2) video decoder firmware for linux-firmware
Content-Language: en-US
To: Paul Menzel <pmenzel@molgen.mpg.de>, Arden Jin <Arden.Jin@amlogic.com>,
 zhentao.guo@amlogic.com
References: <cda06da6-e7e0-4522-b1ab-ec542d4703d2@molgen.mpg.de>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <cda06da6-e7e0-4522-b1ab-ec542d4703d2@molgen.mpg.de>
X-ClientProxiedBy: SG2P153CA0027.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::14)
 To TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|SE1PPF2F43B4ACE:EE_
X-MS-Office365-Filtering-Correlation-Id: 87e37336-b884-4fca-2ddc-08df490e859e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|261009223027099003|22082099003|18002099003|261021121427099003|261022105027099003|261022075727099003|261026140227099003|261026121527099003|261028144727099003|56012099006|10067099003|261102123227099003|5023799004|11063799006;
X-Microsoft-Antispam-Message-Info: Fr+Mbd1T6WIOkM7+bhaP1zvzr6O4+3XmJ09+Z3nyb8Vb0OdBmGOZhf0FWjkw4f/5r0B2NRXTUgXjo6tkAPGsnULDl2neAsW949uE7ZI9TLXnNujNy+AXDX2jDrQpFMsznTCBHpYkBRH+SuRGpOJEKcUAIeotj0UcuzLHkA/bkOe1ncnymRa69A8ztw73y6asLUFn/aII1RsJR3ZjaChYDf9VQPcKjpj2fpgHbkLhGkFuHQdzPUSC+mjlJPwZGU5ZqitrW48udOXQe64qJzKMVQxeaClZVkxUc874MRT1hxhZNXFpNMRat6ra5PrcpRx7sLdpWvVNU2Atsh+sLMpGQP9BDEzz9KMQvmHYXB+0UGG5jWnw0VUclLMHwxUlqsIrbzPW+yDtSf69x2Db0ZxSwvRuO9XYlxHOOD1041ZUX1XQWtvaxhsieqysf0Ww22xPPWIiO3puwqWeo3yto6I+QVsTyOKXRROxYSw/Iyp5Oc/7lFNuvTO18jw1ebkd2Qd7M5IZSDNRG+vgZgynp3fVYr9R4j5bupDmpvYgE06FoD86Voe7arsRGJFOkjO+vxWjfRbwrKfgzj5ZR75n7ATXieY/nR+FVvNI33ADI9kwi7k=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(261009223027099003)(22082099003)(18002099003)(261021121427099003)(261022105027099003)(261022075727099003)(261026140227099003)(261026121527099003)(261028144727099003)(56012099006)(10067099003)(261102123227099003)(5023799004)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QzNib0FRaWtJMTAraDgzdjZrMFpaL0J4cHc0bmRCL1diQnpuNXI1cnpldjlt?=
 =?utf-8?B?M2tvN2U3WW5CTHZVU1QveE9aQWxXL0EvTWg3MTVZd2UzaTJ5dEN3ZVN4V3VW?=
 =?utf-8?B?bUV4N3ZjQmRjZzZ5cWxYNHFLZ1pGcmZhVUJ1WTRhZ3ExeFU2UjNnWSt0cXND?=
 =?utf-8?B?dllndGpyTXh5OGhLcHZGdUFxRFIrNVc1U0gxdms0aEFxRUVhTElZL2dsQ1By?=
 =?utf-8?B?R1dZRlQ2SkdZdG80MTAzZzBqVG1RMWtrOURlZSs2ZEdXMWhLcllnNnNVSGxa?=
 =?utf-8?B?WjNKK3I0YjB0TUNkbHp6d2tRS0VIb3dVSWE4amVOU04rNjdJK1gwSWlLdCtm?=
 =?utf-8?B?QTUrTVUrcnlHVkdQamhReFBDTkpIZ053UGJ4NUxwM1lORGUyWk13YmVjelZ3?=
 =?utf-8?B?TStWbTl4ZlFxK3BVRWFiNzJnVEFhYzNrYWx6QzQ5dkhoWUZBNDFsakNudDdy?=
 =?utf-8?B?ZkV3Q1JEVUtzdFMrNFhkK1FzcG1YbnR6N1puV2Z2Um1kQ202SHgwYkF0c1cx?=
 =?utf-8?B?YzVDb0srWHlQTGF5OGkxY1E0bUJ3ZlI5MUFPeXpDaW92RTVTSCtmejVNM3dT?=
 =?utf-8?B?NGxVVlUyOFZwRlMwUE8wemduYSt2SEdJS1E3YjZFb1VQVG5STHhVYjdEaC91?=
 =?utf-8?B?cnZMcDJuZmxjZmJ6am5DOXBsRUpmNkFpZjlBMG52aG9qSG5Ec01Wd3IyeGdz?=
 =?utf-8?B?NitWSDhxQXlKNXRyZXlqdFUwQ1krY0pkOG1PY2xrVnpORGdlbWdGdndMTUxW?=
 =?utf-8?B?djZkSG14ZlVVNmJhUzVkdmY5d0YrNy92TVF1VWlrSVNJbUdGL3Y1QzZXY2NV?=
 =?utf-8?B?MFRsNkdLakw1b3B1ckpQdmxWVUZGNzZpNnI2YlRpU2Q0Z1J3ZmNvQnIvZFBW?=
 =?utf-8?B?L01GNDhNc0c3ZWdPd1lnd1lEOGVySnFFY0I0MnhBNW9mNWx1YmJxdjRQc1c3?=
 =?utf-8?B?VUFmL2JTSElwc3l1N08ycmpaNGc5UTdabCtCWndNTHZLUlNTKzdtRHF3a3gz?=
 =?utf-8?B?UWNEY29EWXVSQXgrV25YNFczUU51TGhnb3lwQnlRdTlXM1BuSCtza1A0R3BK?=
 =?utf-8?B?NkwzYUY1ZUtlbkJ1VVFGbXhVaGFVWVJVb005OFBHUzJ1RHZTdW1rSjYyd1lR?=
 =?utf-8?B?b3E4d2cvdEp2SWdCb1pKb1pnYUc2QlI4b1RBaFBDSHY3c3dvQS9HZXltUVpO?=
 =?utf-8?B?Rk5NUTF4WnNsQXNQbXgvS21BajVyaExPVDRXYyt4ZzBWc2FuQXNPL2dWcmhi?=
 =?utf-8?B?aGVrNEQ4MGZZdlhKL3lmckdWSDc2Q3F3ZUhPWC9pVVF3by9wcEF5MU1TZ2Uw?=
 =?utf-8?B?YnhzdjcyclhaSzAwTE41bURlenJGOU1JN3JjLzdjbkdpd3JSNjNmejEzM0RO?=
 =?utf-8?B?L2gzVmRxU2podkNTY2RRTlp5ZnVVS0doUFR6eG9HczlLbmsyRmJ2VkkxenBq?=
 =?utf-8?B?OEF4OTQxZDBGMFgvZjZ3c0hUc1d6SFEyM3dNTEtpNjNucFpBVXc1MStOd0Ry?=
 =?utf-8?B?dzNwMm13OFNvNzdLMmxHTGl5d3FmVmI0T1oxOG5zM2FjMXNPejlzVzZZeS9l?=
 =?utf-8?B?MGI2SmE1VHN2RWl5NEgwTEY1akxnUnZ0VEUzeW5zbUhNc1BGR2gwRENuUnQ5?=
 =?utf-8?B?TFpSRWRBOXpkcHVscndxR3VhQ29tY2xhZnFWem5IMEdIMGcyV2tGVTRxdzJG?=
 =?utf-8?B?MTduSU1uTFRHdEpaT3ZrWEhId3RtRVhrWWhjMzR4cUYzUnc4UW1YVVFDcTc5?=
 =?utf-8?B?dDR4QXVES1Yyc0xYY3UydDA3U0JVS0N3L1I3anVCSEZIN2h1c2oxMW9hY2ZX?=
 =?utf-8?B?UWRnREVLakRJbU9lU2I2QjFSdmVEYkc2OXlJUmtCZHpzRElVVi9FOTJaTWFN?=
 =?utf-8?B?YmlrZktoMk92NGRUZUVtVWZMdnJnN1lWYk13ZEhTYnZNVjVZSGk1VTk3dldj?=
 =?utf-8?B?Q3Jna2NXUm5XTjFCYzNjV3ZqVWo3OXF5dHFiT1RNZE4wTEVjMUVtNnFHVTc2?=
 =?utf-8?B?QzBSaUpBNDNpNHlRZWNoK21ucGJ1VHN6V0ZFWGI1a3VQRUJpc1dyWmU2NW13?=
 =?utf-8?B?U2x2d1l6SHlSMmFweHBGWSt4OEZhOUVjV2t3N2E1bDlvdGZUNVRSWjI2Nngz?=
 =?utf-8?B?SHBFSStYRzdXODliNVVjMytUY2xobVorVWxqYU8zN1ZWVXFWVnZXSXgwcHEx?=
 =?utf-8?B?UW4rbkE5V25kWGpOZVgza2ZpcXdzditGME54Yy9UVkc3dWR3RmNMTWpnenow?=
 =?utf-8?B?blhOeExQaHZyb3lNVGNzdzF5aWdGMlhIRGhYelh1eXJZTDVOc3ltMDBnWnda?=
 =?utf-8?B?TVcyWnBZMm5CNEdRQnhoamdFV2RaaTNmS1RZbFMzSDJua3llSXNmNndEL2Zk?=
 =?utf-8?Q?4GSgDRGlweR/+A40=3D?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87e37336-b884-4fca-2ddc-08df490e859e
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 03:04:43.1083
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7N049N+xi9WLBPEzhlKvtb+7kXz2uFC81dohIOSF6bUIKSM6zdUVNSF0RFFao12wLT3r1E5XM3wRksbgEyMwnL82z2PJkKgnzUnsEUJpD+U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE1PPF2F43B4ACE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_190453_021909_D358BE09 
X-CRM114-Status: GOOD (  18.83  )
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

SGkgUGF1bCwKICAgIEEgY29sbGVhZ3VlIG9mIG91cnMoemhlbnRhby5ndW9AYW1sb2dpYy5jb20p
IGtub3dzIHRoaXMgcGFydCBiZXR0ZXIuCgpIaSBaaGVudGFvLAogICAgQ291bGQgeW91IHBsZWFz
ZSB0YWtlIGEgbG9vaz8gVGhhbmtzIQoKT24gMjAyNi8xMS8yMiAxNzoxOCwgUGF1bCBNZW56ZWwg
d3JvdGU6Cj4gCj4gRGVhciBYaWFud2VpLCBkZWFyIEFyZGVuLAo+IAo+IAo+IEJlZm9yZSBidXlp
bmcgYSBDaHJvbWVjYXN0IHdpdGggR29vZ2xlIFRWIEhEIChib3JlYWwsIEFtbG9naWMKPiBTODA1
WDIvUzQpLCBJIHdvdWxkIGxpa2UgdG8gc29ydCBvdXQgdGhlIGZpcm13YXJlIHNpdHVhdGlvbi4K
PiAKPiBsaW51eC1maXJtd2FyZSBoYXMgbWVzb24vdmRlYy8qLmJpbiBmb3IgR1hCQiB1cCB0byBT
TTEgdW5kZXIKPiBMSUNFTlNFUy9MSUNFTlNFLmFtbG9naWNfdmRlYywgZXh0cmFjdGVkIGZyb20g
QW1sb2dpY+KAmXMgSnVseSAyMDE5Cj4gcmVsZWFzZSAobGludXgtZmlybXdhcmUgY29tbWl0cyBl
MDRjYzU2ZCBhbmQgZmI1MDVhNjksIHdpdGggQXJkZW4gaW4KPiBDYykuIFRoZXJlIGlzIG5vdGhp
bmcgZm9yIFM0Lgo+IAo+IEluIHRoZSBtZWRpYV9tb2R1bGVzIHNvdXJjZXMgR29vZ2xlIHB1Ymxp
c2hlZCBmb3IgYm9yZWFsIFsxXSAocGFja2FnZQo+IHYwLjQuNjYsIGNvbW1pdCAxNzUyMzU3LCBi
dWlsdCAyMDI0LTEyLTI3KSwgSSBmb3VuZDoKPiAKPiAxLsKgIGZpcm13YXJlL1M4MDVYMi92aWRl
b191Y29kZS5iaW4gYW5kIGZpcm13YXJlL1M4MDVYMkcvdmlkZW9fdWNvZGUuYmluCj4gYXJlIE5F
V1AgcGFja2FnZXM6IG9ubHkgdGhlIGhlYWRlcnMgYXJlIGluIHBsYWludGV4dCwgYW5kIHRoZSBt
aWNyb2NvZGUKPiBpcyBlbmNyeXB0ZWQgYW5kIGxvYWRlZCB0aHJvdWdoIE9QLVRFRSAoVEVFX1NN
Q19MT0FEX1ZJREVPX0ZXKS4KPiAKPiAyLsKgIFRoZSBoZWFkZXJzIHJlY29yZCB0aGUgQ1JDMzIg
b2YgdGhlIHBsYWludGV4dC4gRWFjaCBvZiB0aGUgMTQgUzQKPiBlbnRyaWVzIGhhcyB0aGUgQ1JD
MzIgYW5kIHNpemUgb2YgYW4gZW50cnkgaW4gdGhlIGdlbmVyaWMgcGxhaW50ZXh0Cj4gcGFja2Fn
ZSBmaXJtd2FyZS92aWRlb191Y29kZS5iaW46Cj4gCj4gIMKgwqDCoCAtIFNNMSBidWlsZHM6IGgy
NjRfbXVsdGksIG1wZWcxMl9tdWx0aSwgdmMxLCB4dmlkX211bHRpLCBhdnNfbXVsdGksCj4gaDI2
NF9tdmMKPiAgwqDCoMKgIC0gRzEyQSBidWlsZHM6IGhldmMsIGgyNjRfbXVsdGlfbW11Cj4gIMKg
wqDCoCAtIFQ1RCBidWlsZHM6IHZwOV9tbXUsIGhldmNfbW11LCBoZXZjX21tdV9zd2FwCj4gIMKg
wqDCoCAtIFNDMiBhdjFfbW11LCBUNyBhdnMyX21tdSwgRzEyQiBtanBlZ19tdWx0aQo+IAo+IDMu
wqAgTm9uZSBvZiB0aGVtIGlzIGJ5dGUtaWRlbnRpY2FsIHRvIGEgZmlsZSBpbiBsaW51eC1maXJt
d2FyZSwgYW5kIHRoZQo+IGN1cnJlbnQgcGFja2FnZSBubyBsb25nZXIgY29udGFpbnMgdGhlIHNp
bmdsZS1pbnN0YW5jZSBILjI2NCBhbmQKPiBNUEVHLTEvMiBtaWNyb2NvZGUgdGhhdCB0aGUgbWFp
bmxpbmUgZHJpdmVyIGxvYWRzIChnMTJhX2gyNjQuYmluLAo+IGd4bF9tcGVnMTIuYmluKS4KPiAK
PiBUaGUgZmlsZXMgY2Fycnkgbm8gbGljZW5zZSwgc28gSSBjYW5ub3Qgc3VibWl0IHRoZW0gbXlz
ZWxmLiBNeSBxdWVzdGlvbnM6Cj4gCj4gMS7CoCBEb2VzIEFtbG9naWMgYWdyZWUgdG8gZGlzdHJp
YnV0aW5nIHRoZSBTNCB2aWRlbyBkZWNvZGVyIGZpcm13YXJlIGluCj4gbGludXgtZmlybXdhcmUg
dW5kZXIgTElDRU5TRS5hbWxvZ2ljX3ZkZWM/IENvbmNyZXRlbHksIHRoZSBwbGFpbnRleHQKPiBi
dWlsZHMgUzQgdXNlcywgYXMgbWVzb24vdmRlYy9zNF8qLmJpbi4gV291bGQgeW91IHByZWZlciB0
byBzdWJtaXQgdGhlbQo+IHlvdXJzZWxmLCBvciB0byBhY2sgYSBzdWJtaXNzaW9uIGZyb20gbWU/
Cj4gCj4gMi7CoCBUaGUgbWFpbmxpbmUgZHJpdmVyIGxvYWRzIHRoZSBtaWNyb2NvZGUgZnJvbSB0
aGUgbm9uLXNlY3VyZSB3b3JsZCwKPiBieSBwb2ludGluZyAoSEVWQ18pSU1FTV9ETUFfQURSIGF0
IGEgY29oZXJlbnQgYnVmZmVyLiBEb2VzIHRoaXMgd29yayBvbgo+IFM0LCBvciBkb2VzIHRoZSBE
T1MgYmxvY2sgb25seSBhY2NlcHQgbWljcm9jb2RlIGxvYWRlZCBieSBCTDMyPyBJZiB0aGUKPiBs
YXR0ZXIsIGlzIHRoZSBTTUMgaW50ZXJmYWNlIGRvY3VtZW50ZWQsIGFuZCBkb2VzIHRoZSBCTDMy
IG9uIHByb2R1Y3Rpb24KPiBTNCBkZXZpY2VzIGluY2x1ZGUgdGhlIG1pY3JvY29kZT8KPiAKPiAz
LsKgIERvZXMgZzEyYV9oMjY0LmJpbiB3b3JrIG9uIFM0LCBvciBpcyB0aGVyZSBhbiBTNCBidWls
ZCBvZiB0aGUKPiBzaW5nbGUtaW5zdGFuY2UgSC4yNjQgbWljcm9jb2RlPyBPciBzaG91bGQgdGhl
IG1haW5saW5lIGRyaXZlciB1c2UKPiBoMjY0X211bHRpIG9uIG5ld2VyIFNvQ3M/Cj4gCj4gCj4g
S2luZCByZWdhcmRzLAo+IAo+IFBhdWwKPiAKPiAKPiBbMV06IGh0dHBzOi8vbmVzdC1vcGVuLXNv
dXJjZS5nb29nbGVzb3VyY2UuY29tL21hbmlmZXN0X3JlcG9zL21lZGlhX21vZHVsZXMKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMg
bWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
