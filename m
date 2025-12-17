Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96069D6406C
	for <linux-amlogic@archiver.kernel.org>; Wed, 17 Dec 2025 02:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iYBai9H3Qn3HhGse76N8ccyHtro3MwLclF0J1eYUpfI=; b=cCSB927vfpvvFUTJWFKa9xlyxR
	AlKok2+rbGpyToYw0pMkghOz9OKbQCfuUbCWA7cYGs5F1kf5qVIhaijbyeqAFolo+XQBOAc3g7/gc
	3lhXO/DHFWvfGwiZM2BmSoRjE9Q4aXEev9gElpC9C8ZLPsXhlkadIQOk4EX1nT39kd+RNmPVCw0tD
	mk6OTHB3NwbQ2eetA52xgGYA6SpX8x3MXwreCxBQX/wDVEITHFs/AMI49UunAoohAdMA6SIcXgdT+
	hIYWf7rk4gr5mn3IGJf/MdcsTXqlVWEDXUeFZEYyttF1z8BOF58lWNt2xDrf9UyoFc9qo4zEg9gy/
	Ow+TvaBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVhRC-000000063qp-0cOr;
	Wed, 17 Dec 2025 02:38:50 +0000
Received: from mail-japanwestazon11022077.outbound.protection.outlook.com ([40.107.75.77] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVhR9-000000063qL-2YS3;
	Wed, 17 Dec 2025 02:38:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VvThZGkV9ELQPsglAudxOWWSUfvXlKB53WQyxo+/eSLhusrmf3+nV9MPT8whM5+BOUp/2GFEZThxstTcfGRmOFLM8fmEdONexjbptZtBPnWxshkczF0iF62kpNSsVvuruHJCZcgzO1kHa8gDzQQBnbRor3LiDsIK8pPrN53kZlvZbqwD8QrmAkNiCMrKlQD2TAoAohi8l8rdeskN8u8+3x1kXnrVCOGjdv0Ht2gaRc6N22JggjGCk5FrLeqRv44W5v5s/5CsN7fO7ZEUgNKgQZWcHJB9CCqUGUK5y7gWyGrkI0NlU/YKZfagR7U9KbODqcyxhcWdeMQ0HQt4eDNRAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DPQcLvgIPm0srHMtdp6yEblasdjsKuWxgUFKZ13WL2k=;
 b=g2AOw0sHEJwVv2ZbzQC8g2Nk1B2qjGIlj2FwFsXCW0qDU9FKOwWaMrVw2jLfo04vBdYKU2Un2cKWxh+BOosF693N2ZNGLZv3xCHvL7b7BhX2t0ofmY0CYfIl+psFHyZXxIo/48aV60+rtYGcRZO3zdaRUyJLCc/q1IkNBYzMLgioFR+cS6l86kb4BYaYqU8u49MPgc9m52pTLvkJxKiotp5YUbeLXk46Vpvh57RGsdgQtRnrPNWMr2p+85HPfOPzsrdqAD1wk6t9g7OqIsGcZqia6tigMrL6rDe6atkmRx41XZMIcODJL9RbVAWjNRLynTzOqgrO7Yb2uzsISIa6PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DPQcLvgIPm0srHMtdp6yEblasdjsKuWxgUFKZ13WL2k=;
 b=m/8hhH9/+P6MBilLeILdR2MY73TsSkRM1KZ9QFmntYJua8J71kIoU276w0H5/mv94Olf0/tiLwPs7I0VLOFOIAIENPMVvfJLh2dUnkzglrEjbp8cjZ+LUDO0yKyfBCgDVdPAsX5EhUS6xTbi2GjRlrEqwfrHpChFXfU+cpz7iUMQvbuk+nj7sUqg3qd0OJlXxCD81UaooDmrRVubAsw+6fC3TXj4wqa8ofx4FcieHmJWZSYq9/jm61ezRBHABo0VFfKICp7zdWfh5vDFmAbPDDZhgJxzMhVzJ2hj6w4ABMSBSNWrdxexkWfq/8cw1D5jA1YucO8MkK2M3Z+bg4+vvA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5521.apcprd03.prod.outlook.com (2603:1096:820:51::12)
 by JH0PR03MB7324.apcprd03.prod.outlook.com (2603:1096:990:17::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Wed, 17 Dec
 2025 02:38:36 +0000
Received: from KL1PR03MB5521.apcprd03.prod.outlook.com
 ([fe80::f12b:85e:f95c:191e]) by KL1PR03MB5521.apcprd03.prod.outlook.com
 ([fe80::f12b:85e:f95c:191e%4]) with mapi id 15.20.9434.001; Wed, 17 Dec 2025
 02:38:35 +0000
Message-ID: <7ea65b00-a2d9-471c-bc3d-cc340ee1046d@amlogic.com>
Date: Wed, 17 Dec 2025 10:38:33 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 1/3] media: dt-bindings: Add Amlogic V4L2 video
 decoder
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
References: <20251124-b4-s4-vdec-upstream-v2-0-bdbbce3f11a6@amlogic.com>
 <20251124-b4-s4-vdec-upstream-v2-1-bdbbce3f11a6@amlogic.com>
 <CAFBinCDO5UWVEtbOOdMn9vy=0H2Q1hJDKhH+X7i0nMsSsw=wbg@mail.gmail.com>
From: Zhentao Guo <zhentao.guo@amlogic.com>
In-Reply-To: <CAFBinCDO5UWVEtbOOdMn9vy=0H2Q1hJDKhH+X7i0nMsSsw=wbg@mail.gmail.com>
X-ClientProxiedBy: SI2PR04CA0018.apcprd04.prod.outlook.com
 (2603:1096:4:197::9) To KL1PR03MB5521.apcprd03.prod.outlook.com
 (2603:1096:820:51::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5521:EE_|JH0PR03MB7324:EE_
X-MS-Office365-Filtering-Correlation-Id: 35d8e456-cf37-47f6-2ba6-08de3d156060
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UGxvc056aXhTNzlKREFGaDRYUXNkaGQyamI0eGNxU3gwVVFON2tmQ0JKOFpU?=
 =?utf-8?B?a0pDb1ZKVjUzY0JwdTVyZGJobG5XYzAzcmc4MzFCbmdHYVRCdW9UZHdQRGpG?=
 =?utf-8?B?WHNwRWY0b09tWnBXY1BDOEZlNnF0NXNwTVh5K1lGMXlocGhTTU9CZHlvRDBy?=
 =?utf-8?B?aWFmSEZQb2QrS2EzNFdONnNaeGovZ29KY1VWbGNZd0NCd3JCUWRQZkk5bmpZ?=
 =?utf-8?B?Z0F3VHhOT21pMGJwKzlBYWl2WHJnWkIxWlRuU2gwaG5jbnpjdmtjWVlwZWlp?=
 =?utf-8?B?bk4zYkNHMW1vWGdXUDMwUjZ6YXFuMU1yaFk0RjFpVjFSaWxScmp0QTUraXdw?=
 =?utf-8?B?Nkw3TDBlWFBQZHRpRm82ZndKMklrNFFscGJ0S3BudjNLYVVuUDZsQ2w4dkxI?=
 =?utf-8?B?K25yUGc1YnlZZGVha2EyVEpqYmkxZHB2NDNrbGF0U2Z1ZWJ1VE5yU242bUJC?=
 =?utf-8?B?SDEvVDcyamIrTjM5T1lTRXJHbFJoeTdSUkoxTXFnVW5BcU9kUk5HTUZTZ00w?=
 =?utf-8?B?LzNib2Z5MHRONitwb0k2SU5tSDZVU3JZNVBSdm4wYUVtRTMxbFkwOVJnSndp?=
 =?utf-8?B?Ky94SDBqeWc4UXZnV3QyOUhHajY3K3JFT0E0RFFLaTU0TmZEVG9yTklINEpl?=
 =?utf-8?B?cWE2ZWMvaWRVYVhsYWJSWDlKc3BJL3c3bmlKd1o2a3ZBZkM2SXlCV2hOVWVj?=
 =?utf-8?B?dlA2SU5ZMzRpZG0xUUIxVHhwOVlrc2I5NkRJYy9jc1o1bjIzdDdCS3NjV3ox?=
 =?utf-8?B?MGo2OFFaQUQwdytuMDBTN1EwSGVHbFdsVjMrUTJ2N3hjRi8rYVYrNktCZWUy?=
 =?utf-8?B?TkllYjB0TFJ1VGpyQThOazBYY3llYmY3bVp1aWZUWDlQd1pDS3ZVbXdmeVZ3?=
 =?utf-8?B?YU84OVVaaCtjTkFkRXZOVGVRL2JBbXljejZ4THZGc2c0Um9CSGtzS3p5cERB?=
 =?utf-8?B?bGI0TVl5VDBDZmNKejFsdTJSN3NuR1JzMGQ5bStTY0JRcFdiNVFuSWFZYkhF?=
 =?utf-8?B?clhUVUNmbHV0bjdQWHBPWENCMkM3cHBiY2RNNm9WR0RLcDQzOGhqSTRRMW8x?=
 =?utf-8?B?OVRjQ0kvbHg3cWZzZUtIOWtVTHQxbStBTjYyMEtDODBOZUEwWE0zL1lzd05G?=
 =?utf-8?B?eDNpV3FGYjMydHpuNDFVczRoZzZQaXlmTnNPTWJsWDlzZnNpcUQyNnB1Wmo5?=
 =?utf-8?B?ZnBqc0RVczRXUTRGNTc3UFl5NEtWMHlMUlFyS0VnZitiK0lPM1lWbndyS2VT?=
 =?utf-8?B?YTl3N1RVNTNONkJVTDZMSGRYRFh6Mi9taDFxdkIvMTM5a3VXMFBKUHh4dVZC?=
 =?utf-8?B?dCtMVlA4RFpuK1Nrek5idWUrdDBDNDhSS3hLQVBhcFBiWTNVR3YrdHV6UDlj?=
 =?utf-8?B?ZE1ZbGNCM0NIRjE0bTNrNlRMU3dwSWwxOFc4bGwwVjVhVitGdTRmd241MjRt?=
 =?utf-8?B?QVdyR3hJRzNoMWNYNEljMUVLdHdKZDl1aGJhdW9qaUtjNUJ3SURaU09lOGVk?=
 =?utf-8?B?MFYzMm16bGxsSFovWmljNW9RblN5Vm90SHMyUTZkdmtrdWxNNWVkc2xqTVVQ?=
 =?utf-8?B?b1JCaHlZVzZrQ0dEdTh1bzNwS3AwQ3R2TWY2SHNWZXRyRVBOcG9KZldzKzAw?=
 =?utf-8?B?RU1qd3FCcmdSYVhYTWhDa1dpcEl0Snkxd3QyZTF3QncxSHdJUXlPblJZaFp3?=
 =?utf-8?B?aXhnMVZqVjY4WVJtbS8zVzErcmswYVdFeFk0THVPdndoeXNqZ3dMTFNmejFZ?=
 =?utf-8?B?bmhTczhMbjV5MTJPeGh3L0g5RlhONXZRT3ZTSjZNeVFkOWNCRnpEV3pDTjhQ?=
 =?utf-8?B?emFBM2xmZXVwcEk0ZzVJWUMrU3JBTVUxaUIzQ0xnRHJ1YlhJOGlnM2YxKzg5?=
 =?utf-8?B?d1VPRTB5SVNocFZsSXdMVzZhdDh6SmkvU0lCNXRBK1ZNekE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5521.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ell4dm1iclluV01MdXlxR0hXZmJsRVZ3akxkZS9YOFdONU0wckxDUVR6VW1K?=
 =?utf-8?B?cGZZbjVpek1HTGluWFVGa1hJcm1WY0hLVHgzMXlDNVBOZ2FLWm4zRVRDNTB0?=
 =?utf-8?B?T05iS255Z1JxdFRlajMvSCtlVXJzU3dVVzEyMUpKQmJhQTI0bTg5dDFvVmhZ?=
 =?utf-8?B?ZWhveEEvZ2w3NkovbW41RGRaQUw5c0doTG1xRkNNUmR6QXJtTVQrYkozT2lS?=
 =?utf-8?B?UjlieHVQNHdoR09adlpGVDhpbllLNjAwM21ZM2I0U0N0S3BJZWdqSTBOWUZR?=
 =?utf-8?B?dUp2bk9MdGhnSHJPSGxtM3RrRDFkVkRLeCs1dG1nUE80YmFWUzdNeWFNTExV?=
 =?utf-8?B?bW4wUGhnWU56U0cxWVJPVStWc21lQUFwVGJ5Sm5EMzNIeXFNaXFEU3F1eU55?=
 =?utf-8?B?WlM2bXVKVUJudEVNNVBVK091THFaMEMvb3dnUlFxVnJua0NOUEFDZkVjZjBP?=
 =?utf-8?B?WEdjcER2aXFwNExSVENKYU1mQ05XNnp1K0ZaRWFpTVE1bkp4QWQ0d0QvWlJQ?=
 =?utf-8?B?d3BPbFl4MEFlbXc5RFFvYzRLd1FpN1pBSE1ydHliVlVRWmVUdFQwVDRCSUht?=
 =?utf-8?B?NTRtOVRFamRXZVZFSkxhamdCTUpzSHR0aXhpa2RpeXk2aUpWWnBzRkNUdGZy?=
 =?utf-8?B?WGw2KzRRMUhDODJld3hGNlY1UkRmS21taE1PQklDTk5UL2R1Mm9xd0xlVWpz?=
 =?utf-8?B?RXZ5TXovcjBteWRSZkxsMWJTVDlkZ1NoQjhZQS94ZE45OHBJcVdFOE1uUDZi?=
 =?utf-8?B?MzJ0RFJsSXF5TTVsNUR2a25vMHJPODBSOGlLdGU0bXdrTTRkU1N3S1VKYUdE?=
 =?utf-8?B?SG1ReEVXd3RBN3k4RkJlcjM2dGEzaEhBNHYxOUN6bDY5VTVlY0JyWWtxT04r?=
 =?utf-8?B?VVNUVEIrUVBYci9VTFI1em51TGE4cm5HUjRaUGl2OWFNbWh0NVJsVjVTVjRj?=
 =?utf-8?B?UnRYVTMxN2g0dkZEQVlFeXhZZnFLb3BvTHY5NFNWaDlDNXl3RXA4ZFBJMzJY?=
 =?utf-8?B?ZTNzV2NBaGQ4VEdZQ2RRVjhDMFlWbHJrdXlYK1IrSzRsS081ZmFlQ2hoRVFx?=
 =?utf-8?B?SFZCZ2sxZVl2OUZkZXlrNDhrZWgyMWFsZjVOaEI0RnI1ZDIxdkhlNlk3WkE3?=
 =?utf-8?B?bkFVcHE3K2hYdHFjWWNsL0FvUElMaGRTYVRuUXZwbnhPMmw1VGJ1cW9pMTdz?=
 =?utf-8?B?cW42a1VZb01NWUR0cVQ2UDZZNFRiMTNmT29hMWVDZ1krMTZGbHZ3SkJFaTBi?=
 =?utf-8?B?QlRkRExRamlsVGFIanNFd3EycjQyNGhRQmZIYUpxRVJ3RDUzUlFvQWtYZGFC?=
 =?utf-8?B?U2NneFZWSTJqOUxUZWZHODV3WXJTNWRMdW1GREhtaklQZWxJVlVDWUxyTjJw?=
 =?utf-8?B?SGk5TzdDdXRidXhCSDMvQ1lOSGtEaFBDdWxCWkhtL01tYThPKzdaZkNxNCta?=
 =?utf-8?B?VWNld2dLMkczM2FvdUFnMXJIRXpaYjJkK3NORFJSWUtLb0FGeGRDZjY3b3ZZ?=
 =?utf-8?B?L0ptTzJJWStyMWxRcmVpSWd6UXBLdWxaUUZROGJLNEtDT1FaRXpPLzlyVzZs?=
 =?utf-8?B?Zm92Y3R1V1NEVGUwMXdlVjRoL2N0K2U1RmM3VWdqbEpVUlkveURuamZYSGNn?=
 =?utf-8?B?ZUZ4Ky82WTlyWVpFMUNuWG5QUzVJQTYxUko5eDh1dVBIMVVRSSt5aG5YTEd6?=
 =?utf-8?B?WVFUYmRBOW1xLytoTlh6WnhoZUJ2R3QxcHNHS0dNSDU4RlRQNHpXZ1ZSb2N4?=
 =?utf-8?B?ZTZ1Skg4Ung5TXlZbEZ2K1FQa3NSNlU0ZUFuM0MvQWFwa2hvbzhBaEtnYjRw?=
 =?utf-8?B?blloVUdNelNKV0tEVnhabjdYVFRvL0E5Y29TUGxtWkcrZW1mVUV4VDNKODNt?=
 =?utf-8?B?VEFHSWs3eUo4MzJTb2hqMVhVTVhielhyK1VIOFJMellRNVJEVFB2NnpwZnN5?=
 =?utf-8?B?RWhMcnpaWWFsK3RiNFJPeVIzb1N2MjVta1RFZFdqa0FOQ3lMRG1oRnNGeUtS?=
 =?utf-8?B?cXNyVGIrSGYxZ1dwU0s3eGhIVjMySW85QWc0Z0JaZjhqK3BCOGhtYlVzQ0ZD?=
 =?utf-8?B?Z2o2b2JFOTlscW1DVW91ZEJTVzZXdUpmblBoTC9GVWFrV0szYklxR3lMbEFl?=
 =?utf-8?Q?PdTHf4h/+XOQn5FTKqDG1ZVJo?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35d8e456-cf37-47f6-2ba6-08de3d156060
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5521.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 02:38:35.6416
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nerSsSIHLPOJ5JgSjI1dqCzXmAXePa79aYliUT01CJVFr490ps7mC6eLoixSC0PLvSVEJwoWDPS3wwb8gG6ilw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB7324
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_183847_663678_B2B93C8A 
X-CRM114-Status: GOOD (  29.82  )
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

SGkgTWFydGFpbiwKCuWcqCAyMDI1LzEyLzE3IDc6NDMsIE1hcnRpbiBCbHVtZW5zdGluZ2wg5YaZ
6YGTOgo+IFsgRVhURVJOQUwgRU1BSUwgXQo+Cj4gSGksCj4KPiBPbiBNb24sIE5vdiAyNCwgMjAy
NSBhdCA0OjMy4oCvQU0gWmhlbnRhbyBHdW8gdmlhIEI0IFJlbGF5Cj4gPGRldm51bGwremhlbnRh
by5ndW8uYW1sb2dpYy5jb21Aa2VybmVsLm9yZz4gd3JvdGU6Cj4+IEZyb206IFpoZW50YW8gR3Vv
IDx6aGVudGFvLmd1b0BhbWxvZ2ljLmNvbT4KPj4KPj4gRGVzY3JpYmUgdGhlIGluaXRpYWwgc3Vw
cG9ydCBmb3IgdGhlIFY0TDIgc3RhdGVsZXNzIHZpZGVvIGRlY29kZXIKPj4gZHJpdmVyIHVzZWQg
d2l0aCB0aGUgQW1sb2dpYyBTNCAoUzgwNVgyKSBwbGF0Zm9ybS4KPj4KPj4gU2lnbmVkLW9mZi1i
eTogWmhlbnRhbyBHdW8gPHpoZW50YW8uZ3VvQGFtbG9naWMuY29tPgo+PiAtLS0KPj4gICAuLi4v
YmluZGluZ3MvbWVkaWEvYW1sb2dpYyxzNC12Y29kZWMtZGVjLnlhbWwgICAgICB8IDg3ICsrKysr
KysrKysrKysrKysrKysrKysKPj4gICAxIGZpbGUgY2hhbmdlZCwgODcgaW5zZXJ0aW9ucygrKQo+
Pgo+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlh
L2FtbG9naWMsczQtdmNvZGVjLWRlYy55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL21lZGlhL2FtbG9naWMsczQtdmNvZGVjLWRlYy55YW1sCj4+IG5ldyBmaWxlIG1vZGUg
MTAwNjQ0Cj4+IGluZGV4IDAwMDAwMDAwMDAwMC4uNDAxYTVhMzI5MDJlCj4+IC0tLSAvZGV2L251
bGwKPj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL2FtbG9n
aWMsczQtdmNvZGVjLWRlYy55YW1sCj4+IEBAIC0wLDAgKzEsODcgQEAKPj4gKyMgU1BEWC1MaWNl
bnNlLUlkZW50aWZpZXI6IChHUEwtMi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlKQo+PiArIyBDb3B5
cmlnaHQgKEMpIDIwMjUgQW1sb2dpYywgSW5jLiBBbGwgcmlnaHRzIHJlc2VydmVkCj4+ICslWUFN
TCAxLjIKPj4gKy0tLQo+PiArJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9tZWRp
YS9hbWxvZ2ljLHZjb2RlYy1kZWMueWFtbCMKPj4gKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVl
Lm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIwo+PiArCj4+ICt0aXRsZTogQW1sb2dpYyBWaWRl
byBEZWNvZGUgQWNjZWxlcmF0b3IKPj4gKwo+PiArbWFpbnRhaW5lcnM6Cj4+ICsgIC0gWmhlbnRh
byBHdW8gPHpoZW50YW8uZ3VvQGFtbG9naWMuY29tPgo+PiArCj4+ICtkZXNjcmlwdGlvbjoKPj4g
KyAgVGhlIFZpZGVvIERlY29kZXIgQWNjZWxlcmF0b3IgcHJlc2VudCBvbiBBbWxvZ2ljIFNPQ3Mu
Cj4+ICsgIEl0IHN1cHBvcnRzIHN0YXRlbGVzcyBoMjY0IGRlY29kaW5nLgo+PiArCj4+ICtwcm9w
ZXJ0aWVzOgo+PiArICBjb21wYXRpYmxlOgo+PiArICAgIGNvbnN0OiBhbWxvZ2ljLHM0LXZjb2Rl
Yy1kZWMKPj4gKwo+PiArICByZWc6Cj4+ICsgICAgbWF4SXRlbXM6IDIKPj4gKwo+PiArICByZWct
bmFtZXM6Cj4+ICsgICAgaXRlbXM6Cj4+ICsgICAgICAtIGNvbnN0OiBkb3MKPj4gKyAgICAgIC0g
Y29uc3Q6IGRtYwo+IE5laWwgaGFzIGNvbW1lbnRlZCBvbiB0aGUgZHJpdmVyIHBhdGNoIChpbiB2
MSkgdG8gdXNlIHRoZSBleGlzdGluZwo+IGNhbnZhcyBkcml2ZXIuCj4gVGhlIHNhbWUgYXBwbGll
cyB0byB0aGUgYmluZGluZzogeW91IGNhbiByZXBsYWNlIHRoZSB3aG9sZSAiZG1jIgo+IHJlZ2lz
dGVycyB3aXRoIGFuICJhbWxvZ2ljLGNhbnZhcyIgcHJvcGVydHkgKHNlZQo+IERvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2FtbG9naWMsbWVzb24tdnB1LnlhbWwgZm9y
Cj4gYW4gZXhhbXBsZSkuCgpJbmRlZWQsIG9ubHkgYSBzZWN0aW9uIG9mIHRoZSBkbWMgcmVnaXN0
ZXJzIGlzIGZvciBjYW52YXMuIEZvciB0aGUgcmVzZXQgCnBhcnQgb2YgdGhlIHJlZ2lzdGVycywg
Y2FudmFzIGRyaXZlciBzaG91bGQgbm90IGFjY2VzcyB0aGVtIGRpcmVjdGVseS4KCkZvciBleGFt
cGxlLCBvbiBTODA1WDIgcGxhdGZvcm0sIHRoZSBETUMgcmVnaXN0ZXJzIHJhbmdlIGZyb20gMHhm
ZTAzNjAwMCAKdG8gMHhmZTAzODAwMC4gVGhlwqBjYW52YXPCoHJlZ2lzdGVycyBvbmx5IHJhbmdl
IGZyb23CoDB4ZmUwMzYwNDggCnRvwqAweGZlMDM2MDVjLgoKVGhlIGRlY29kZXIgZHJpdmVyIGFs
c28gbmVlZCB0byBhY2Nlc3MgdGhlIHJlZ2lzdGVywqAweGZlMDM2MDAwLCB3aGljaCBpcyAKbm90
IGNvbnRhaW5lZCBpbiB0aGUgcmFuZ2Ugb2bCoGNhbnZhcyByZWdpc3RlcnMsIHNvIHdlIHN0aWxs
IG5lZWQgdG8gCnJlbWFwIHRoaXMgcmVnaXN0ZXIgaW4gdGhlIGRlY29kZXIgZHJpdmVyLiBUaGVy
ZWZvcmUsIHRoZSBwcm9wZXJ0eSAnZG1jJyAKaXMgc3RpbGwgbmVlZGVkLgoKPgo+IFsuLi5dCj4+
ICtyZXF1aXJlZDoKPj4gKyAgLSBjb21wYXRpYmxlCj4+ICsgIC0gcmVnCj4+ICsgIC0gcmVnLW5h
bWVzCj4+ICsgIC0gaW50ZXJydXB0cwo+PiArICAtIGNsb2Nrcwo+PiArICAtIGNsb2NrLW5hbWVz
Cj4+ICsgIC0gcG93ZXItZG9tYWlucwo+PiArICAtIHBvd2VyLWRvbWFpbi1uYW1lcwo+IEkgZGlk
IGEgcXVpY2s6Cj4gJCBnaXQgZ3JlcCBSRVNFVF9ET1MKPiB7aW5jbHVkZS9kdC1iaW5kaW5ncy9y
ZXNldC9hbWxvZ2ljLGFyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy99Ki5oCj4gLT4gdGhhdCBs
aXN0cyBET1MgcmVzZXQgbGluZXMgZm9yIG1vc3QgKGFsbD8pIFNvQ3MgdGhhdCB3ZXJlIHN1cHBv
cnRlZAo+IGJ5IHRoZSBvbGQgdmRlYyBkcml2ZXIgYXMgd2VsbCBhcyBET1MgcmVzZXQgbGluZXMg
Zm9yIHRoZSBTNCBTb0MgKGZvcgo+IHdoaWNoIHlvdSdyZSBhZGRpbmcgc3VwcG9ydCBoZXJlKS4K
PiBJZiBzb21lIG9mIHRob3NlIHJlc2V0IGxpbmVzIGFyZSB3aXJlZCBpbiBoYXJkd2FyZSB0byB0
aGUgRE9TIHJlZ2lvbgo+IHRoZW4geW91IHNob3VsZCBpbmNsdWRlIHRoZW0gaW4gdGhlIGJpbmRp
bmcuCj4gRm9yIHJlZmVyZW5jZSBpbiBjYXNlIHlvdSBhcmUgbm90IGFscmVhZHkgZmFtaWxpYXIg
d2l0aCBpdDogWzBdICJbLi4uXQo+IG1ha2UgYmluZGluZ3MgY29tcGxldGUgZXZlbiBpZiBhIGRy
aXZlciBkb2VzbuKAmXQgc3VwcG9ydCBzb21lIGZlYXR1cmVzLgo+IEZvciBleGFtcGxlLCBpZiBh
IGRldmljZSBoYXMgYW4gaW50ZXJydXB0LCB0aGVuIGluY2x1ZGUgdGhlCj4g4oCYaW50ZXJydXB0
c+KAmSBwcm9wZXJ0eSBldmVuIGlmIHRoZSBkcml2ZXIgaXMgb25seSBwb2xsZWQgbW9kZSIuCj4g
KHRoZSBzYW1lIGFsc28gYXBwbGllcyB0byBhbnkgYWRkaXRpb25hbCBjbG9ja3Mgb3IgcG93ZXIt
ZG9tYWlucyB0aGF0Cj4gYXJlIHdpcmVkIGFzIGlucHV0cyBpbnRvIHRoZSBoYXJkd2FyZSB3aGlj
aCB5b3UgaGF2ZSBub3QgbGlzdGVkIHlldCBhcwo+IHRoZXkgYXJlIG5vdCBuZWVkZWQgZm9yIHRo
ZSBpbml0aWFsbHkgc3VwcG9ydGVkIGNvZGVjcykKWWVzLCBJIGFsc28gbm90aWNlZCB0aGlzIGlz
c3VlLiBUaGUgRE9TIHJlc2V0IGxpbmUgc2hvdWxkIGJlIGFkZGVkLiBXZSAKd2lsbCBmaXggdGhp
cyBpbiB0aGUgbmV4dCBwYXRjaCB2ZXJzaW9uLiBUaGFua3MgZm9yIHlvdXIgc3VnZ2VzdGlvbnMh
Cj4gQmVzdCByZWdhcmRzLAo+IE1hcnRpbgo+CkJScwoKWmhlbnRhbwoKPiBbMF0gaHR0cHM6Ly9k
b2NzLmtlcm5lbC5vcmcvZGV2aWNldHJlZS9iaW5kaW5ncy93cml0aW5nLWJpbmRpbmdzLmh0bWwK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFt
bG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
