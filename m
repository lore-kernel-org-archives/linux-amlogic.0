Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA285C7EE29
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Jun 2023 11:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rdKnWw4pDSriobDpYS1pWjPU4YEFEmupgYCFJa9qGfQ=; b=Vfh3XWupy+7zEdvEac33/6PNE4
	MhMP13SlJEnyxiJDb5VVrCBh9s8lLkwSWKQcMab0MCSL51CscA9rilYhVAtMHy0SyAeDfFpZdUHih
	rJf33hhq3Zhqdf2FH02UXilnExy5JS5YKpkV2ETB09JGbwhhiYIlwniqWk5vWncOG6pFtCBr5hjzf
	6w94u11WLHi6AthVcwnagaBMIilosFHZob6KKjV9jao7cMd64RCbNwWWQP4BpekLSeFxpPya8t4Cl
	sjhU2T2iMXnuMBYcFLeSsexGjVNZab15Jgkd8qC0xSgwrOlQTXkWuFsB25CVcWy6HJ8jaoqkFWv/6
	y85LY6ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q92f2-0080A9-0m;
	Tue, 13 Jun 2023 11:58:08 +0000
Received: from mail-tyzapc01on2071b.outbound.protection.outlook.com ([2a01:111:f403:704b::71b] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q92ez-00808x-08;
	Tue, 13 Jun 2023 11:58:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hvmfr2mf3bPyIOxkxgOKIk530/J9m31E7x9ImA31Y0t40VXqWLVmkC1lOFg7IYhMTJFWQClXWsnJSPCNYIOZ1u9o99BbxALvcCufMQbZRBfkW3/ecEiACheLdxw9DcnA6FwId4fjpAs5i2xvRQhNJKHN/TEM6j3zSvRovFcjAF8uwXUK10Q/N+ulvH/VYPdHnBmlZzn9Vq+yzc3JZayiIAgZZWZ91sJphxIHGAYp0PLxrVvT2JwScQ5+WOLFFvd+rmf+xP4eF83FiyXXU+7jZZDZyIoLhKURt7QdJspdYltZ4MwKo/1Upflbg6IrqJuiURwl37J3e1X4DiP2ehhH/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RYSFrsSD46dy/ks1gp3MVL0PADZFYMRoXvs5cJizewA=;
 b=KrG+JkDYrwWakAESJlbEP+Cy+Iim1m/i0aeXy7NQGy8aY0lJSX4ATLk9Quh6NMjSk2vDyt5VR+FhaUTOflUtR3WcmSVhtRyaqorZyE1/E2a8zHWya1kMCL8nDbzyZzfJc9qmB8QBT3C8cgqlfmQYSBEGeUbu0FEp6sozkbssxHhoG+4zkn8YF00vjw+4SjvH8/4LJ+SWvSOjX7+6gzLEVxqbg8Nhx2mE2P/Pax5pNLthnIc4YosycQr9In4xHlWpDHtD8ouE6ERBcAPYRl15lNLDvo5t5jU+NNPyfn0LOTYfJL4j6Y9nuBZDuEbYaNDVBV7KDNiYxe5vs0aZHNv/Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RYSFrsSD46dy/ks1gp3MVL0PADZFYMRoXvs5cJizewA=;
 b=RGT1mfOtGErPAxKVOBX81tlT0NbdSPUYZ2Jm74tGBmx1FoLwOva6BBDP3xTGNgz9TMPlB/fJfx4StzweAnjKA8fU4d8Avn/lka/j0raTs0XNadDUieZ48/eMcPGDL3CzXnJQq/VFYOeoIebP8iQVoJkFe+8LkT4DyyH3jsUjgW+2JHhrvlMKlqUxflObfae4XRBcMJHtdV+rFXPar5TvJLF0kg5JRnZHQU2eSq3nw6QJHBYz2IRj2QeHwMjAv1nH50VQUMqx/s0IjaxsmvooQc/ZUEdpFEd7mdhib1oZ4cHSJ7oYwmJwgEQzEJYkTwe6QOQbE1gFYIEtYZBMNY6HoQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SEYPR06MB6009.apcprd06.prod.outlook.com (2603:1096:101:db::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.44; Tue, 13 Jun
 2023 11:57:50 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::76d6:4828:7e80:2965]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::76d6:4828:7e80:2965%3]) with mapi id 15.20.6455.039; Tue, 13 Jun 2023
 11:57:50 +0000
Message-ID: <1431a1a9-6ce2-664e-080f-42483aa2b124@vivo.com>
Date: Tue, 13 Jun 2023 19:57:23 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [RESEND 1/9] thermal/hwmon: Add error information printing for
 devm_thermal_add_hwmon_sysfs()
To: Daniel Lezcano <daniel.lezcano@linaro.org>, glaroque@baylibre.com,
 rafael@kernel.org, amitk@kernel.org, rui.zhang@intel.com,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, linux-imx@nxp.com, thara.gopinath@gmail.com,
 agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
 anarsoul@gmail.com, tiny.windzz@gmail.com, wens@csie.org,
 jernej.skrabec@gmail.com, samuel@sholland.org, thierry.reding@gmail.com,
 jonathanh@nvidia.com, edubezval@gmail.com, j-keerthy@ti.com,
 f.fainelli@gmail.com
Cc: linux-pm@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org
References: <20230613095624.78789-1-frank.li@vivo.com>
 <3ab066e3-97f5-8bd1-eaae-3d790432fb6f@linaro.org>
From: Yangtao Li <frank.li@vivo.com>
In-Reply-To: <3ab066e3-97f5-8bd1-eaae-3d790432fb6f@linaro.org>
X-ClientProxiedBy: SGXP274CA0012.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::24)
 To SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SEYPR06MB6009:EE_
X-MS-Office365-Filtering-Correlation-Id: a52f53fc-6599-4b91-d5c5-08db6c05698a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FNj6uT98/xwcYnFEBYk34ValRfGY69kbgOcM+M80K6EDhRtOv2qpFjp1FVuuEafG4wHl13IE0SH4hqvzDwXTAW9lctSggztwLHTkNULbDCpORHONlwOTE/xoxw25VOI/i4uUGktoA/3oOF3kuGJF0mRx4sOopeKk25t0RdahWkC3WdCZwTxlEMYJgt62nHl+CNUx0TDe/mscxx2Lfj0AuAHcy1odbfOI0fumeUSG2Iy6zBeumAjIcAr5ACIONsOda9J5DZoni5UE+tWZITymPckvU0Z2nRcajoOmWCytnC0oepO4XA+p9gklDEyTJJnRZ9kWcTBnu/j6cptk3e2KCQ5ZjAG5M0SzKgrwUWRRblYOtf6oUOzVW2Nteel8ZQrgqHYF/WfPNg5L9I5sY81Nfdr5kvlKTPxM8J67l0NkQroblreOok4oQZWvn1tuFFzvLIciufe6v0h1TRLjKvDOdrdx+iylXI9147qipLx1iRTv5RvlIPABIBMlp0fZN1fvhb7UeSTNBiafibptWf+64cGXCsrg7foHSQtwe2rQfGzCtqQcUGXtppb6E3/wT/BhVQNN+770ezuzvGe8SnrH8H4K+0fMAF8TVZnQ/8QOnUi7ayjzut9ZbOhZVi3ekmkufRcVJ5RBWtFvyqbcPE35nss+3ZpoaAlfSfZqUglrD3qU4BNAxkK0gFs+epF2UfdX
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5269.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(396003)(39860400002)(136003)(366004)(451199021)(4326008)(66556008)(66946007)(316002)(7406005)(7416002)(66476007)(31686004)(84970400001)(41300700001)(186003)(2906002)(478600001)(8676002)(8936002)(5660300002)(6666004)(966005)(52116002)(6486002)(6512007)(6506007)(53546011)(26005)(921005)(83380400001)(36756003)(86362001)(2616005)(31696002)(38100700002)(38350700002)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aCtYRDBUdXBRVy9VZkEzVGNKNm5qeE8rSEVkRGorYjBCQTBGRzEyT2g0Y2tE?=
 =?utf-8?B?dEdKd0M0bTBGL1lpNFJJRllJcjBEaFhsMUgyTlMzNUxFK29QSHpSVG5XZ3Bl?=
 =?utf-8?B?YkVocDFaVGh0b2JYRmZIVHJGajdZTi8zNStKNW5CY1h5NzYzSlZwWmo5VzV1?=
 =?utf-8?B?QmNSeHkxSlg1TFlOMlg4VWdzSHRWRDIvK3YyWWpGWDBmeEFScUdOTnVTakw1?=
 =?utf-8?B?QjZEU1c0QXIyRVJ2TmFKckczdnVSbVhVUXFZOHZqU0pRWUtsMGp4WWZlenNK?=
 =?utf-8?B?MDRvazhrVmNXRXcrdzRiKzM0cGFjV3dtWFpxVkVTV2NGY08wWDY5VzVqd0JY?=
 =?utf-8?B?THArYlpiR3AxWmgzUHVpVFRyWTRkYlhIN2VZVHZaM01UMHBGRGVxS1ZIV2hD?=
 =?utf-8?B?NzFKNnhvRnJCS0UrTTl5SjBaQTR5OU81YjJ4TE5KSEtTUHF0VnV3Q1BlYzAy?=
 =?utf-8?B?WTRBaW0rYXpWaXdQRTJwSHhBZXB4cmxKZDZJSXpHRWZaRm1aY0dMSHZWMG1B?=
 =?utf-8?B?Q2FUSjJqRHh0ZG9rRzlnRDRKVnlNb3RVUGpoanlQRTBEdjl3NkFTbTB4YjNH?=
 =?utf-8?B?R3dSL0JhemROcVhwOW9pM1BXUWJ3eVVrS0ltOWFoY0poT0N5bytKRk5uZDlJ?=
 =?utf-8?B?NkxPU3JLMDE1cGVHZmtsMTRRWENuOURYbXNVNlpET1pqN09Na21qNGtjL2hR?=
 =?utf-8?B?QklTanErb3NOTnlicGwyd3NBUGY4OVZUbUlNalZMTm9MVTV2MTVwcm5hU25G?=
 =?utf-8?B?WDl3c0VqNUNRRzNMZ2h2Yy82dmtidHltb2hBSG10OUxIcEtzSGN2ZTZDNkI5?=
 =?utf-8?B?ejJ3ZXJtRkdNRlJjd3ZVaC93WjN4dXNmeEFvSGRERnhPVWpIZGNQUzIvaEVZ?=
 =?utf-8?B?emhFWThSRnVnZmN2NjVQYjA3czRzWGpJRXI1Z1d3VGdoV1dROTgyTzEzd0tw?=
 =?utf-8?B?VnRYYndocENEVTZqQmJ3alc0YldwWVdtZkJYU3ZGUTNlZUVDZEJhSmFxbU1Q?=
 =?utf-8?B?c3hKRG9xY3RWOWtSdGZ2NDNlZlFaNW9ZNlJESVRDRzF3cngxcXFZSGRUQTFF?=
 =?utf-8?B?VjFnOFA3Z0RuT3NJNUhoQm9iYmtKUHg3anZiQTFEdTJ2d1I3RlAwNlNOVWdE?=
 =?utf-8?B?bDh2NzBSMWNmdTR5TG95NExaQnRWbmhncHJmVlhsa25Ta0NNWC9wWGJ0aFA5?=
 =?utf-8?B?Mk1lZUFNYVBDKy9JRUhobE5CUDRTZWIzWlRxc0h4L01GUlAvRUlWTGs0Mk4r?=
 =?utf-8?B?N1NUSjNscytBWHY1NFJmdFJpTWlqbHFFL1k1UkVPUTk0dEFtbGtrVmo5cDIy?=
 =?utf-8?B?SzN6VnlIcE5OdkkvTHI1NkZ0akU4WTJGTElaQUFYT1BMTG04aUpXb0ZGNGlL?=
 =?utf-8?B?M2ViZ0MxRnZURjFEWG9rYzFVRW1EYjhFZnFhdXVxUUJqUWZGQlpGcXFGaEFo?=
 =?utf-8?B?TDdiREo4ZU9zTDNRNk0rRC9PbnE3bHZENEZISTE4Y05ZdHIva0J5eDRRZGZj?=
 =?utf-8?B?aTlzblZXOGlKZDUwMytXbUp1MUxTRy9Ob2hkZko0VnlrbTFvRlBKZXRzSXF3?=
 =?utf-8?B?SjJyYXhKNG9OdWdPdjk4WVFFWEsxaUY4ZS85Y3hsdVFQYzM4MDFZeVIyV3hT?=
 =?utf-8?B?Wk90NUFvUkViUlNNZUk5VmdTNlV4akNJL3kvQWFPUmVwZ2U3b091RkZ2Z0pO?=
 =?utf-8?B?Z3dRZ1hId1JVRWhiTkRYTmpYaUtHbFJwckk5MGtjZWxjSkZ0bkY1MDk2Z1cz?=
 =?utf-8?B?eWVkaDEzdjhvTzJwUCtMS3ZTdHhVM25Xay82YWtPYzJsc0thMm8yUU5qUnJq?=
 =?utf-8?B?eHR3N1liNzhId21oZkZwaXlKUTB3Tmc1MmtHa256RWZkQXF6bWxnUjBlV21T?=
 =?utf-8?B?VGhEaEs4elVXcVpNdDRzdUsveDJiUE01STNoU0NjSDZBSUJJSkllY0wzZ2RZ?=
 =?utf-8?B?UjdjUTBtWEpPcVZ1Q0xwTGszWlpRdFlZbVNEaUdoTXFINlcyNnNjc1NpVW9z?=
 =?utf-8?B?Zm92MjR2SFFiVm1VYmxrZWRrMTU3NE1weDdZMEZpN2FWMWFSMWQ1cWwwZkdq?=
 =?utf-8?B?Qmo2Y25VR2N0dE4wWm5hdEFHdU9sWThlOWdpTHVyZTFSZWF1R2NiY1FIT3ds?=
 =?utf-8?Q?KKKnUSrJaGGVl0zsVowkUxxS9?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a52f53fc-6599-4b91-d5c5-08db6c05698a
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2023 11:57:50.6351
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4l2J6ICqbOOnX6EGrDVjjScwdXOqFLWif6gDxFo3/BRNeEuFJrBPri5/aoS57Bipl0nhkG29Gt1YEBo/D7PLjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6009
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230613_045805_088631_C3EB306E 
X-CRM114-Status: GOOD (  15.82  )
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

T24gMjAyMy82LzEzIDE4OjIwLCBEYW5pZWwgTGV6Y2FubyB3cm90ZToKCj4gT24gMTMvMDYvMjAy
MyAxMTo1NiwgWWFuZ3RhbyBMaSB3cm90ZToKPj4gRW5zdXJlIHRoYXQgYWxsIGVycm9yIGhhbmRs
aW5nIGJyYW5jaGVzIHByaW50IGVycm9yIGluZm9ybWF0aW9uLiBJbiB0aGlzCj4+IHdheSwgd2hl
biB0aGlzIGZ1bmN0aW9uIGZhaWxzLCB0aGUgdXBwZXItbGF5ZXIgZnVuY3Rpb25zIGNhbiBkaXJl
Y3RseQo+PiByZXR1cm4gYW4gZXJyb3IgY29kZSB3aXRob3V0IG1pc3NpbmcgZGVidWdnaW5nIGlu
Zm9ybWF0aW9uLiBPdGhlcndpc2UsCj4+IHRoZSBlcnJvciBtZXNzYWdlIHdpbGwgYmUgcHJpbnRl
ZCByZWR1bmRhbnRseSBvciBtaXNzaW5nLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBZYW5ndGFvIExp
IDxmcmFuay5saUB2aXZvLmNvbT4KPj4gLS0tCj4+IFJlc2VuZCBwYXRjaHNldCBzbyB0aGF0IHRo
ZSBjaGFuZ2VzIHRvIHRoZXJtYWwvaHdtb24uYyBhcmUgY29waWVkIHRvIAo+PiBldmVyeW9uZS4K
Pj4gwqAgZHJpdmVycy90aGVybWFsL3RoZXJtYWxfaHdtb24uYyB8IDUgKysrKy0KPj4gwqAgMSBm
aWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Pgo+PiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy90aGVybWFsL3RoZXJtYWxfaHdtb24uYyAKPj4gYi9kcml2ZXJzL3RoZXJt
YWwvdGhlcm1hbF9od21vbi5jCj4+IGluZGV4IGZiZTU1NTA5ZTMwNy4uYTU4MGFkZDVhMmY2IDEw
MDY0NAo+PiAtLS0gYS9kcml2ZXJzL3RoZXJtYWwvdGhlcm1hbF9od21vbi5jCj4+ICsrKyBiL2Ry
aXZlcnMvdGhlcm1hbC90aGVybWFsX2h3bW9uLmMKPj4gQEAgLTI3MSwxMSArMjcxLDE0IEBAIGlu
dCBkZXZtX3RoZXJtYWxfYWRkX2h3bW9uX3N5c2ZzKHN0cnVjdCBkZXZpY2UgCj4+ICpkZXYsIHN0
cnVjdCB0aGVybWFsX3pvbmVfZGV2aWNlCj4+IMKgIMKgwqDCoMKgwqAgcHRyID0gZGV2cmVzX2Fs
bG9jKGRldm1fdGhlcm1hbF9od21vbl9yZWxlYXNlLCBzaXplb2YoKnB0ciksCj4+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEdGUF9LRVJORUwpOwo+PiAtwqDCoMKgIGlmICghcHRy
KQo+PiArwqDCoMKgIGlmICghcHRyKSB7Cj4+ICvCoMKgwqDCoMKgwqDCoCBkZXZfZXJyKGRldiwg
IkZhaWxlZCB0byBhbGxvY2F0ZSBkZXZpY2UgcmVzb3VyY2UgZGF0YVxuIik7Cj4+IMKgwqDCoMKg
wqDCoMKgwqDCoCByZXR1cm4gLUVOT01FTTsKPj4gK8KgwqDCoCB9Cj4+IMKgIMKgwqDCoMKgwqAg
cmV0ID0gdGhlcm1hbF9hZGRfaHdtb25fc3lzZnModHopOwo+PiDCoMKgwqDCoMKgIGlmIChyZXQp
IHsKPj4gK8KgwqDCoMKgwqDCoMKgIGRldl9lcnIoZGV2LCAiRmFpbGVkIHRvIGFkZCBod21vbiBz
eXNmcyBhdHRyaWJ1dGVzXG4iKTsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGRldnJlc19mcmVlKHB0
cik7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gcmV0Owo+PiDCoMKgwqDCoMKgIH0KPgo+
IFNvcnJ5LCBJIGNvbW1lbnRlZCB0byBxdWlja2x5IHRoaXMgcGF0Y2guIFBsZWFzZSBkaXNjYXJk
IG15IGxhc3QgCj4gY29tbWVudC4gSSB0aGluayBpdCBpcyBhIGdvb2QgaW1wcm92ZW1lbnQuCj4K
PiBDYW4geW91IHJlcGxhY2UgdGhlIGRldl9lcnIgdG8gZGV2X3dhcm4gPwoKQmFzZWQgb24gdGhl
IHRoZXJtYWwvdHV4c3VpdGUgYnJhbmNoIG9mIGRhbmllbC5sZXpjYW5vL2xpbnV4LmdpdCwgcGF0
Y2ggCnYzIHdhcyBzZW50LgoKSW5jbHVkZWQgWzFdIGZvciBjbGVhbnVwIHRoZXJtYWwtZ2VuZXJp
Yy1hZGMuCgpbMV0gCmh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1w
bS9wYXRjaC8yMDIzMDYxMzA5MzA1NC4yMDY3MzQwLTEtd2Vuc3RAY2hyb21pdW0ub3JnLwoKClRo
eCwKCllhbmd0YW8KCgo+IFRoYW5rcwo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2lj
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1hbWxvZ2ljCg==
