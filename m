Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFE7AFD5304
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Feb 2026 07:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1UBEmTO/UtOTLX/ARkgZNUOj/ktjcNH3A59HYOYG2vQ=; b=BRsIT8Tu440cbD2WU+os2tSedI
	G/R80TvwijmfQEcR3pT5Q0Tk24zIyUALM0DvzzovD8ljkbKzxLakZwKu8QwFx1r9okwJmVX1Q4H62
	Cr6bRzKoYcVgkQXiAj1IZjkst/Qno14+UBL/PPq3fmfAa3JoCj4V1+kkflkV3kgSMH6QKTTNScS87
	TX7r3ApeQ8GU9pFdRSclrDnpSqFw4eId41KpTk88yn//GLbOzV+yhtulTybj5pmtojigpGeWleCSV
	5tEGu7WYsqi4OyN5w134EiBXEHEmcEIS5aSgPvKfvwKUFK2JYxnqTYBRZlLPW0aGezqaqVhqlwtj8
	VesNSPMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvs9A-00000007rl8-2Ukw;
	Fri, 27 Feb 2026 07:20:24 +0000
Received: from mail-koreacentralazon11023084.outbound.protection.outlook.com ([40.107.44.84] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvs97-00000007rkV-3Ibf
	for linux-amlogic@lists.infradead.org;
	Fri, 27 Feb 2026 07:20:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fwlEeRVnQmCK5JzASxWJbLk/13hFjfnY5kDkxN0Jx33to1NkUkTVdWFDJtkR/VI3CcSIaKb4XXiv+b9TG2wpcdU5C2g8nh5MiTZbifkWWyzMiSJYqjOpFhPIAydJacShWps1Omfu5v9Du3OrixhTKMYhaw/Fb98BtcnuMKmKh+83b0w1q/ApDAkTP/ZVi7eaRSKAbCl+c+6DhdZ0wh6FGj1kdxr2Rmlad9bYZUsV7xpsHv4O5NFbSqZDW+eS6w32FoLBDHSvSeNpielRlptXF5xtxTSqBs4O9tK94S8TQ3cCPIDDZ/ip8n6jMQOUl3Lr36pSCtJhJuFUmR4RAKUciA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c+rcMrKdhLwAudmnmoPV/R6VroCeQ+JWR02Eoisgjx4=;
 b=OuXCW71ceW25kq4A5TefGA+wF5kN+pDNb9POiXuHJIdTMdk6x8HJe4q8+NpQiin6gsDG/4KKkZtsCRaaU/xo0vSJLMph5MwpPjwkFN+OHKygV4q1m2Rrz13FUt7RrJfGwWtCj+tZvt5G1bnpULNmqCCtEpZZYwsIWJv0Aa2YHpEEh/kppRbNAFmScfScbpHOlAFUQsYSzAixvcXYtNljlEKlP/dMhQ+CML1MbCd/zwJvVRXARgZQGQfa6msGPEgt+fLwFTzesUV/iyCrsC1NAAdAYLjhGPKTaXnV2p6sGvAViqT5x8ynTPXPIKU9HDR7d/TBfujNdSwMRV08fH/HFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c+rcMrKdhLwAudmnmoPV/R6VroCeQ+JWR02Eoisgjx4=;
 b=VwySzs6zQ80E1SZNcNVZS2YgZs+YfRhBP3aH4vS+F7X6S/rBKfXMB3UftNwpCOVKU2tpjrYa/V9tN0kys9+lCk+lN4DpqeFBPyb5muNbu1m2EWDArjvo28QP8CWSVO3zHDsjHw8Y9rKVceKSGfomrtipbKJVhU0roANbrNAWcGY/OG193xjVTG/ioPjnwWo3OnIyc1wB91uzIvbfROcSpGFHEfUC0lHvjaVydAX9KvgJ5cnIqQ9GrRD8wqg/A4Xppu97wyBmHRn9/qpFbVdRs3oysCxjlQUa27dqKvzYfu2g8yiyZOUKxSkpCJzVj3dnlw5hcbWEa27YdCGvMiw4OQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by KU2PPFE09DED81A.apcprd03.prod.outlook.com (2603:1096:d18::42e) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Fri, 27 Feb
 2026 07:20:13 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::78d4:9dee:2e32:d1e4]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::78d4:9dee:2e32:d1e4%6]) with mapi id 15.20.9654.013; Fri, 27 Feb 2026
 07:20:13 +0000
Message-ID: <c4239952-44b6-4f4a-8c57-5df2ece82302@amlogic.com>
Date: Fri, 27 Feb 2026 15:20:11 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] dma: amlogic: Add general DMA driver for A9
Content-Language: en-US
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-amlogic@lists.infradead.org, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
References: <20260206-amlogic-dma-v3-0-56fb9f59ed22@amlogic.com>
 <20260206-amlogic-dma-v3-2-56fb9f59ed22@amlogic.com>
 <CAFBinCD5ZzjQc6ve-zZJ0MqN-a0rrp6pHYf3X_0ao3MRwi2Jrw@mail.gmail.com>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <CAFBinCD5ZzjQc6ve-zZJ0MqN-a0rrp6pHYf3X_0ao3MRwi2Jrw@mail.gmail.com>
X-ClientProxiedBy: SI2PR04CA0008.apcprd04.prod.outlook.com
 (2603:1096:4:197::20) To TYZPR03MB6896.apcprd03.prod.outlook.com
 (2603:1096:400:289::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|KU2PPFE09DED81A:EE_
X-MS-Office365-Filtering-Correlation-Id: ad28e645-373a-4d3d-7303-08de75d0a60b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|1800799024|376014;
X-Microsoft-Antispam-Message-Info: WuKaupxV62CW5MghBrGCRIPtlN2iOTGXyO6mFa3k2bdE3V3tfyIuvXSrhs7tkKwwgPaRHKyd3/VIs5D5ADIr7L0eXTmtsPCtvL2RRdBid8djiMzO+FNWSsyXbQzuA2iS2+B9VfEM936l6CZGcBa6AawCT7Po/FYMFOJHt4efilZFg1opCBaEUVn6sfrRSvWoV5hhbRizcV9Jl8uFUmca2ph+NPkZzjrD3HzncAWfeRpKtlWyqEEpmx6NjCWZ/yr7V6GQIBscN6kCKX0AtYw8yzfYshiRQPlWBljW3CKZsPqmQloeJ1XZ69EHuLxR6gtpbHeLWRCF9cI7gDOIpY5l7YB/ZrpZfxC0WbvVe2pAmFiynpeU1Wqe1og/wIbsaFPXbtWWtSjXb9lR7xnOgyMM2lj30oAoS1cpCzoPsHqe6qUpA6QDga/piniYn3qeazK4sG9YywDDGkVnJogioVKi3oThJlLeA5JgacL5BBbUXXxQUSAeiwcMGX4a4c+HtoFTU71gUT4vm7CYtlRS7WIim0Kf/aR1ly84QfZmmyWUtoazaduqxkpB1pxEFcTv+Yu06E3gPscMHTwQ908Q6XsTt9haJx91YTFmO2eJ9BKodHg2INYTZyOQtUVjAgTc3QI3fXr7GkwwWCteYcr2rDucSZZjWIpnpVvOK+6il7AkOSWVGexBkvhyFLZYYirgfyoKC67YuGHCSHzsBLOIfOlRRornHQotay0jNSDS43uZpm4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MG01ODdJMVJqRVp2QzhybzFPQkFrNHpUQjl0UkFubUFESmwyOERwdGlqN1pO?=
 =?utf-8?B?cDNRMTU3bFFjdDF0Z01NMERzTnRkNVRqYmFRL2JXSUlRbHkzWFZIMmMwNG9I?=
 =?utf-8?B?ZllUNlJrKzNjQm9zNjZEQnRya3ZKT3lSZDBNTW1xcm9NTS85MVpaL01Bbjdt?=
 =?utf-8?B?Y3dnSFNNdG5NRVc3ak83cjFualhPSFZidWdoOU9NZDdNNEdUMWI0TENoTE1a?=
 =?utf-8?B?eWdpYzdkYmozdkFxV0lnZ2R1YXFBYmdiQWRVS0JnendWTFNoOFZqN09Ud25E?=
 =?utf-8?B?VDArTlJ6SjNIL202UVRBM3pQekhwUTFkR2RoTTZFWWszVUNmQ3V4c1RoTjQv?=
 =?utf-8?B?UWNINTNUNW9kMWNhRllOVE1XQWc2QzVvdDdacDNhNEx5blc2ZVB5V2pjeTZ1?=
 =?utf-8?B?UE5VUFk1YytRNXozeHlVWFFQWFFpcHZVWGdNWG9FY01aR3BhVGY5RGNvYW01?=
 =?utf-8?B?eHk2NldXYVJ3dUtlU2tVTm5wWmpEcGdUY1RSY3FNdVdSbXdpOGk1RGZHUFNU?=
 =?utf-8?B?Q1FuTWhpcTA4WExlVEp1WThpU0pIRTZRRmQwclptcHZNaXQ4cHBUQUVFYXZh?=
 =?utf-8?B?QnZBSWFYaks3Y2lHb21rbHNSYWZiYjNTU2VxdWU0V0ZiUlNwWlZ4TzMyVFhF?=
 =?utf-8?B?N3FIbzRua2tjM3NPZHQ3bnV4RlhhZjJFSVZYd004UmJoK29rN091ODV2S01I?=
 =?utf-8?B?L3dnWnpHMHlFMEJRYmhhTUl5YS9TL0owSnVrTTc4bVQ5bldyeVIxN2YzWWxn?=
 =?utf-8?B?dmg1R0xPRStwd1RtRTQrYmc2Z0pUU0o5d1B6aUgxQmJaakc2R3luampNQ3Vu?=
 =?utf-8?B?VXU4K1JzNU9lM0c0TERhMWlrQktNMTZZeWx4QUlvVTlVNTZyb2ZjWHhOeGY0?=
 =?utf-8?B?Umh5VVd5VEJQZzNTRWhMN2VleTdUOVZVK1RmSGlQMTk5TjJxY2d3aGpscWVh?=
 =?utf-8?B?ZjhXWXVnRzFKcGtCVFBUZUFIT2szbmdUKzRrbVdEcDYwNnl0S3dCaXpUTUpR?=
 =?utf-8?B?Z2QrenM4MzhacUhyQmdrTE11YkdhTEJLOWlheW85RWltakR6dTJoZ1h1cmxJ?=
 =?utf-8?B?Rkh3YmJUNXpCd2FzTmpmWmZvaVFqc2MwTThZNDd2V3RTcUlhUDRzR2htbW9V?=
 =?utf-8?B?TXBPcVRJeThadG5MNkNUaTIzK1hFK3BwV1YyTG53d0Q1ekZvcEJMeGJ3TFJX?=
 =?utf-8?B?M0h5SU5qWlVUN1cxazVNMGdwdnUvdURmK1NtR3RqTzZIaXBJTEZzMThCVHBS?=
 =?utf-8?B?dTBiQUt1R1dneWNCTVU5SlJpQmdQM3k2T05xOE9kNUFwd1QxYnZiQVpZQjcv?=
 =?utf-8?B?bXdhb0VnOFg4d1J1ZVd6aWs1OGRUa1V2ajN0L2JTTVJSeFRjY2tLaWJjZE5w?=
 =?utf-8?B?R3kxTEw1d053Vnp4VmhneDcxbjNFQ2M3cS9CM0c4RHlhemNCdmFtbGMxVUxP?=
 =?utf-8?B?OUF0YlpSdWdsVk54dnBrak5HdHhuOVQ5S0JGd28xVVE2WncrZlhlM2dpLys1?=
 =?utf-8?B?L01Od2kwRGhlMGtiYXloTitVZlhUMmpkS2ovaVZlUDNacitDOUR5V3JhaS9R?=
 =?utf-8?B?V245elVRblQ3QjNaQ3FDb053S1JRdE90VXpiRkVuVGtOMG1WbktQODNHVFJF?=
 =?utf-8?B?THY1ZjVySkxnWTNzWFdYK05HbzFMSk0veWtkeGdPY1NmU2tIK3JzdWJVeHFM?=
 =?utf-8?B?SlEyZU9iWVJNMVY0MFlQOGhoSVRUZi9VQ3FEV1UwVTNUQ3RnUmtzWWVCZ3hl?=
 =?utf-8?B?TUlXVGFTMm1xK0RLeG1jN0Q0Wng3VzJmd3o0MzVDNUhiMlNMK0JWeWhUYXU4?=
 =?utf-8?B?ZllTU0IwNkYzSU14TStwaTJMcnFxUWhOdXZJcXBIR1ZXdkZBRGZUVEpTdGgw?=
 =?utf-8?B?dHJ0NTIycmhkSzdwYklaS0t5VWhtSHorbThXMDB2a2pmSmM3Zk13SzAzQnZU?=
 =?utf-8?B?SmVUeXljRFBaWDAwemhuRzUyY095RG53SzV3NFpndFlZR2wzeXJJN2FodGFi?=
 =?utf-8?B?RU1aanZFQWgvb3BKNVUybG1KV0tINHJTakNVdHp6TmpMTnNidEFWQ1dHMDZK?=
 =?utf-8?B?YXBZSXBiWnBFc0xyT0lSekxLVHQzNnROc09sYUJPemdGTm9ZVGlqNTFwMTVa?=
 =?utf-8?B?c2htaW82aFJxekxWSHpNaTYySUM3V1IvNE95YytIVWtYT1dWc3pMN1JyNkFL?=
 =?utf-8?B?TkxRT0ZhWkI3a0JabGp6eXcyQkZwSjVBNXVKS0xwbTVuMlRjMzBmT1JNZTgy?=
 =?utf-8?B?S3hLK1ZRb0dPTnY4clNDL3hwMUlQNkF5YjlVeDA3M3VSbk1hOGtJemZRcUF2?=
 =?utf-8?B?a1lKcEk3aGRkRFJLSXljY280djZvaGVRdTBwZ2F3Qjd3WDlEWEpsdz09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad28e645-373a-4d3d-7303-08de75d0a60b
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 07:20:13.4664
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2BrNvy/aHhXFVXS8xdTpUqkyl1+R17m3mBaJdRTR3MwEsFXdIUzOYTe5qv3Rf4ER3d5H4hxkh4mS8LmGQh2ifIYIrNoi9o1i8aFBe4oxtlw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KU2PPFE09DED81A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_232021_830455_EC78148D 
X-CRM114-Status: UNSURE (   9.43  )
X-CRM114-Notice: Please train this message.
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

SGkgTWFydGluLAogICAgVGhhbmtzIGZvciB5b3VyIHJlcGx5LgoKT24gMjAyNi8yLzEwIDA1OjI4
LCBNYXJ0aW4gQmx1bWVuc3RpbmdsIHdyb3RlOgo+IEhpIFhpYW53ZWkgWmhhbywKPiAKPiBPbiBG
cmksIEZlYiA2LCAyMDI2IGF0IDEwOjAz4oCvQU0gWGlhbndlaSBaaGFvIHZpYSBCNCBSZWxheQo+
IDxkZXZudWxsK3hpYW53ZWkuemhhby5hbWxvZ2ljLmNvbUBrZXJuZWwub3JnPiAgd3JvdGU6Cj4g
Wy4uLl0KPj4gKyAgICAgICAvKiBQSU8gNCBieXRlcyBhbmQgSTJDIDEgYnl0ZSAqLwo+PiArICAg
ICAgIGRtYV9kZXYtPmRzdF9hZGRyX3dpZHRocyA9IEJJVChETUFfU0xBVkVfQlVTV0lEVEhfNF9C
WVRFUyB8IERNQV9TTEFWRV9CVVNXSURUSF8xX0JZVEUpOwo+IEkgaGF2ZSBub3Qgc2VlbiB0aGlz
IHdheSBvZiB3cml0aW5nIHR3byBiaXRzIGJlZm9yZS4KPiBTaG91bGQgdGhpcyBiZToKPiAgICAg
IEJJVChETUFfU0xBVkVfQlVTV0lEVEhfNF9CWVRFUykgfCBCSVQoRE1BX1NMQVZFX0JVU1dJRFRI
XzFfQllURSkKPiBpbnN0ZWFkIChzaW1pbGFyIHRvIHRoZSBsaW5lIGJlbG93KT8KPiAKV2lsbCBk
by4KCj4+ICsgICAgICAgZG1hX2Rldi0+ZGlyZWN0aW9ucyA9IEJJVChETUFfREVWX1RPX01FTSkg
fCBCSVQoRE1BX01FTV9UT19ERVYpOwo+IEJlc3QgcmVnYXJkcywKPiBNYXJ0aW4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFp
bGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
