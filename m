Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 636B1CD98DA
	for <linux-amlogic@archiver.kernel.org>; Tue, 16 Jun 2026 02:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ugRFz0kjGoQde8J0x63HfYcxoN5Kta2DypDsymmJq0o=; b=hMOuKTkf/wYoOIu01kdk045t51
	rZhpOyyMG6g+9tKKEBbKw91Qk9BtPkuS/tysZERvwgPxe4Pq/+A/Q8F23geAI+4QzvecYOGki4vAn
	CxHM0/y+/uRH7cxPP8waYXKsUI4sE3BwuEAXAUgB9HK44iufXCy2KCO7dmJDnBJnysMxCbC8GTpQs
	nvU/0afczFuqpVP+2KMXSf8oArtTvUFUQJb+aVqpFoRGrqx2/QTsfrrbya49hcQ5XwyqrcslaFIoS
	HLpEPrXPkxM8tqVYXuQPAqdImwY6eUF14BWaLDNbwPU+di/4XgCYwvlrULD6ZNd/Q7KV8DapdUwGu
	POah0M0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZJng-0000000F7Aw-0eMP;
	Tue, 16 Jun 2026 02:45:16 +0000
Received: from mail-japaneastazon11022096.outbound.protection.outlook.com ([52.101.126.96] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZJnd-0000000F7AU-2YBf;
	Tue, 16 Jun 2026 02:45:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hRm0RfFxh1qwjAgUqIoUS7ldOyzczndi/BpBmwnzKWaqzVAZmkUyR8UbPMdGbQquzeaSX9eE6nviLknq0+grNdnW8OnN/Wqj9cptBu+TYE8x9Dj4AEHryUXKtmaoV68vpeJO9CnS7BBGnuIakuY2jsUvSb2eK+rrdxKWnuFJcIe/l6Wyi8GjWPTtOhGzkppbfn63SW3VW5R+zN7rfuk1UK4V5D37hBbDhtYTC3Vfmb3JD1ivXNDjrplyhHRc71LLK/8VWlfK1fA4HKRsIegm9jx1cUzX9SoLFTcdCm4Cp3erywwTje4DmfKB+KENyAFSNx06Yn3pbrsZEMh4CVsong==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RJ24+PBU457m5TALk9AADR+om09WbbDN59RBSnutpFQ=;
 b=d7tEbF/4n+08muDDfCHjOBPT37I4A1WT4qgYzFe+unMGNCCVNYtopvVaFthe0/mpAOAWj0Ang/ivoziXLM2v205j5byM7M+PdhO2KZvvDKchqSWFBHUbpCs1GeddwDAP+dwnFaZtPwu21aoTFzP7RFYp/LDAGD2DRZOAWvCNA7gbpL6PVTGFDZ4nfYKA0lDJHJ79y2/qNi0bIV8anC88yzUWB7n3gUIm7+GC8H6V1nINabQ42MhK8oIDs+ReKZwkx0N+hBI/QCkjYABBUf8LpjG+8ZI2pdQSPMZt+A9zoknCLPf7YIpyEX9x4nN+Z7IUqQWhLTH8qPKSMHXZkH0puQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RJ24+PBU457m5TALk9AADR+om09WbbDN59RBSnutpFQ=;
 b=rp+Y+mZY4/0IujmBRVku5adom1h4+iSeVejE/t8afAiIN0TUzxnWeqKjEzfw3lzkTi1OkQuYaD9hWmqtqm6tyzWOjrwMqu5kWDRz7DpODENAtTQXiO+oDopKIGWN/+VaSQ0RLDiWIGscAM3UQrK+s3jK8CeQSSSAo0EF/pFXu+yBlM+s6p2LjdhX9Eshrq6+vYa7pdiZLfjW0OA7qcjnatmYNJeiboTck//X45XmLYNRuJK4mcSme5npLUBRLhyyr4WExHaewUCpl8l6r3BfdVK6mxyl9mhyjCWxpT4Z0hZZ3BrdYjP6zq3fc+Rfo819OKhf6OCIqqYLOvRcCXZ96Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by KL1PR03MB7939.apcprd03.prod.outlook.com (2603:1096:820:f1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Tue, 16 Jun
 2026 02:45:05 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::78d4:9dee:2e32:d1e4]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::78d4:9dee:2e32:d1e4%3]) with mapi id 15.21.0139.009; Tue, 16 Jun 2026
 02:45:04 +0000
Message-ID: <4a37fa94-d96f-45ac-9823-5bacfb5c44ea@amlogic.com>
Date: Tue, 16 Jun 2026 10:45:00 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 0/2] pinctrl: Add support gpiod_to_irq
Content-Language: en-US
To: Linus Walleij <linusw@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260611-gpio-to-irq-v1-0-12201716f23f@amlogic.com>
 <CAD++jLk3YdMUSkk71rgT=taQZnEhqgMgGP0dKBPx7_5Bsxmu+g@mail.gmail.com>
 <2bb2c0e8-29e1-444b-851b-a9932f547c6a@amlogic.com>
 <CAD++jLm9+8RSbBCi-k=8S98XvVJ7taYrK=kuBp3_RqxE_bcxbg@mail.gmail.com>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <CAD++jLm9+8RSbBCi-k=8S98XvVJ7taYrK=kuBp3_RqxE_bcxbg@mail.gmail.com>
X-ClientProxiedBy: SEWP216CA0094.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2bf::11) To TYZPR03MB6896.apcprd03.prod.outlook.com
 (2603:1096:400:289::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|KL1PR03MB7939:EE_
X-MS-Office365-Filtering-Correlation-Id: 93aeee47-aa10-4a77-8818-08decb5144cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|7416014|6133799003|11063799006|4143699003|5023799004|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: pq6v2adlYmBZ5VEFASsQpoWaZBcM7KucVs8wYA7YGRn3nL7jtNW7oD8dtBD5vKaEhla9FQK64StwLglP4tk2dUab4ih9YuntwbFBsslt4hYMD0Z2kCGhqHYMFfgHsI43qGsgy5fPK5iuSmr8cA8jzZbiPrVdv/c5dd4OUUdGwpwCPdZmeuCb+ymQAnuqMDUbwrjndJ3d9CyQmJx5fHTaRnwtygEK5glYR+oCiSL7wUZLdRWhMzs8vvE5VG743N5UDolIkM2Fu1GgfbDeVuUv71vl1fzyuUdGvwYMdoxZ/EJas2Lyp6V1cVPqhUl8A+ZTOst69eL/cRE+oZ1xKU72UvIhIy8pQTFwMXqndYBkbS3yNtLyOv8L0ZIW74PwdVWUEQiSnm8zILPXNeK8WVhIMs1E9iEV1suORAC0let51+Dd5lFikP2H8L79xt9u66M4/zW0nPI/CstjqLtsIGdHY8EesuXQs4VRbXO7DCI44GCcdb01GEvgOnpHkgZjfbv0ilAKIATi1ILezZBmvAkFNfGxgOfcRX2Z2Ouv4cFnMakl8enobFLT9xGvErbop6IQfDjAWeR0WUcbwSVoKVkzzr9zLlp1Mla7LKq3ikHRM8UHc02znRVp6yygzpFFloiwCBrHQnAtYpFNVx7laKZGWX3cJCmjTiF62kctSK1K/kvBoM9wnom+F/sUHnvRxugFdkAfdH5EKf+CjtYKAIbpGw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(7416014)(6133799003)(11063799006)(4143699003)(5023799004)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M3U4QW1BYlc0QnlGVG5XU2hwV2FESzVJL3BNMDIwbFAvY3RldGtZRGNmYmx5?=
 =?utf-8?B?QTdkYm1GTUxpVlFQd1Z3eUhrcm0zVEtVbVUyNWxweDJkMm1hWW9oOU9JeVo2?=
 =?utf-8?B?QU9HVFA4ZjE1VjZwQUNFWEtXeDgyN0dHaUg2VTJWTlhPU09icmV4bVlzRGZp?=
 =?utf-8?B?cXI5RXg1NjNQY3BiQ2IwWEcrTUszVlRZc1JiTUpTVkZ5MjlDeEFnUHFxYUVV?=
 =?utf-8?B?c0NKN2JFWmdzQkphU0xUa1VRWUJLRkxqV2RkRjRNZ3dYcE5sb3lNdFpNamp0?=
 =?utf-8?B?eU1mOU8wOVhWMzRVc0NOUEMxQ3BVTGxtMTkzOXlzWjlLK1FXejFtRi9GeEpz?=
 =?utf-8?B?ZVl3SkxNZTNwTVdZQkxwcFNIZWJKQTM1dCszSkFTVWlvZmh6Y3BmWGtnVnhK?=
 =?utf-8?B?MEhEYnlFWjY2UkFwTWRzU1hIV0t6ajlxenMxd04rTTNvR2xVWXFwS0twK3dO?=
 =?utf-8?B?QXhITHVTR0NuMWJucktqWnBqYit5eFBKY09FM2RoZ3M0WHNRdC9ER0RxRFV6?=
 =?utf-8?B?WU42MHpsTk1IaHYyZUpLZlk2SmxkaVZWQmZpSGQrUGE1TDBMY3o5bEU3WHVP?=
 =?utf-8?B?MXhSM1lyMU1QS0xjSko3d3VKRmRqQTNTby9kNTUyL1lvSnUrcEp1b0tvd1Ax?=
 =?utf-8?B?QXhNbVRVVmxVOWp4amtHdG5GRmFpalNIaVpiZlN3ejRyVUR0UVgyQmZJaW9B?=
 =?utf-8?B?dk1zOERTUmwrUXNReDNkQW9vakFTV2F3eHpUdFVLdWRjZEhqMWdJaFd5S1Ey?=
 =?utf-8?B?cXZNQTdkdVNhL05lSHhVY0VEWDBUYkY1dnJpUTVKaXJPcXVUUWlBVDRaTDNT?=
 =?utf-8?B?MXp2Z1hTdkFWcVI0RE9oYTFJYVZqOHlFSnM3bTlLSXp2V0RmdVhQbHlkRlR4?=
 =?utf-8?B?MkYwNUloTE5kS2REZEtuUkdpS0dZRGNDdVRJa0pPSVNUeUJycmJCbXdkeE90?=
 =?utf-8?B?Wml6MHZZejlwQ0xaSzBvZ1BqeGk2ZFEvckhTMHZjVWhlN1V2c2EwM3piN3c4?=
 =?utf-8?B?NERRZHpHbCtpMmtjdURiUmg5bmxrVU5VUkxvcTJTSDNHWUdmdFFaUFEvdVd2?=
 =?utf-8?B?T2xEUzRRZ1pUeGM1WjVvNHFKa1RXM1lXd003ZmkzT0pCOUZaVVpMRVQxUlNm?=
 =?utf-8?B?M2FkR25KU1lYUFBMS2lpMXJJckZWMFBpemREM2NFV2h2bERkcjVnTG1hRmx5?=
 =?utf-8?B?V3BuV1BiZE84eEpRYnFOeHZEZG5JOUd4L09RcHVrR3daYXFWdjI1WGJvenJO?=
 =?utf-8?B?QmlQSytBdW93WjE0VmxmaFVINlZCclF6eHFpZjBiaU9ERytiVGpoNm50R1d6?=
 =?utf-8?B?azhFTHNUdWF0eEpiYWd3b3NuNGZ6S2Q4TDhHWnU3TElhMHdxNXBHQlI0RGxw?=
 =?utf-8?B?K0djOExKTXRMTnBoLzRQMW5tMjZ1aXgxTWtwK2lMQnBDc2Z6QnZXWTFpcjNX?=
 =?utf-8?B?RjhnYk5yMGxaM2M3OGtHRG5FWHVEb2w3elMwN0pFU3NTZHpIZ09SSVkyQ2Ew?=
 =?utf-8?B?UXNCQk5FRzJxcG9KU1NiNC9NMHBISlpSazZVc1BScDlXbi9aMDZJSEt0VkVN?=
 =?utf-8?B?YVhBQnMrMUNMRXpBWUc3eW1tTGJCR0hvckRHdU44NlFEcEF5aWk2S2dQSThF?=
 =?utf-8?B?akZmNndpa1MrUDBZbzNubXRxd0ExSzNielRwZC9DQlpmWjRMUmlTbEVtNzgw?=
 =?utf-8?B?OVllbUNwSFJZOFdoajhoMVg4OFBsY0FKNzlrM2YrWTg0aTBtZHVLaEFuQkNL?=
 =?utf-8?B?TnNmTzd1MlJGNUJ0VmxoY1pRZlpOQ012Y1o0di9iODNLMzBabnRyYjdrSzFM?=
 =?utf-8?B?dTJHbmN0aHZUWHF1Y1ZsVnpxQkhZTGI5VU9pRnpDZHN2WGRodUhGY010TTJl?=
 =?utf-8?B?Y1lib2pENG9vajF3aDNFeGhUQm4ybmZZV1ExWlR6Ry9rRjlORk9XTzBoaDRX?=
 =?utf-8?B?RDZJR1F3cmtEUEdnK3BPODhqSXdFUEc5WmhPT1ZOazROK2MwZHJ6cURVdG16?=
 =?utf-8?B?OEJxNUNDRFcxamVuNWRxSG54Ykx2aWNnUmZVSWFDQzJRN041M2djWkIwbmll?=
 =?utf-8?B?YVJHV0xtQTRzcFY5THRGQmFoTmpHZWhzYUlkdEdyaFRwRlIwL0E4SUlWL2JM?=
 =?utf-8?B?TFJYSytabG9rMjVaa3VLV2tQaVl2Y2FWcXd6emJoL1V1Qzlma05MWHUxTHNL?=
 =?utf-8?B?WnlUSERQaWs4c3hDckZzUkVLU1pybFg3Nm90TTFxdjhDTjlyZmpXYjZvem84?=
 =?utf-8?B?NGs4bVZtblUzK3RPb2VVbE9nQ1M1N29ONFFweWlrMENwQ1h6VHVPNEk1NEto?=
 =?utf-8?B?NTkyUy9oTDZZVkQzRTZLbHc3ZXd5ZitVOGJnd2UwTXkyNHVicmtSdz09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93aeee47-aa10-4a77-8818-08decb5144cc
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 02:45:04.1889
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7QfUSQl0p+nPV1J0sFjvDH1gVqU+iz1ggqyr7kLsP+HcAur9U1G8rtbmtHTimj8yK69pP5JGww7+EP8UgZ/OoQs5nhGM4949oivtRSe0gew=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB7939
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_194513_685609_74691009 
X-CRM114-Status: GOOD (  24.80  )
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

SGkgTGludXMsCiAgICBVbmRlcnN0b29kLiBUaGFuayB5b3UgZm9yIHlvdXIgZGV0YWlsZWQgZXhw
bGFuYXRpb24uIEkgd2lsbCBkcm9wIAp0aGlzIHBhdGNoLgoKT24gMjAyNi82LzE1IDIwOjU5LCBM
aW51cyBXYWxsZWlqIHdyb3RlOgo+Pj4gSGkgWGlhbndlaSwKPj4+Cj4+PiB0aGFua3MgZm9yIHlv
dXIgcGF0Y2hlcyEKPj4+Cj4+PiBPbiBUaHUsIEp1biAxMSwgMjAyNiBhdCA5OjU04oCvQU0gWGlh
bndlaSBaaGFvIHZpYSBCNCBSZWxheQo+Pj4gPGRldm51bGwreGlhbndlaS56aGFvLmFtbG9naWMu
Y29tQGtlcm5lbC5vcmc+ICAgd3JvdGU6Cj4+Pgo+Pj4+IFNvbWUgdXNlcnMgbmVlZCB0byBvYnRh
aW4gYW4gSVJRIGRpcmVjdGx5IGZyb20gYSBHUElPIGRlc2NyaXB0b3IgdGhyb3VnaCBncGlvZF90
b19pcnEoKS4KPj4+PiBBZGQgdGhlIHJlcXVpcmVkIERUIGJpbmRpbmcgYW5kIGltcGxlbWVudGF0
aW9uIHRvIHN1cHBvcnQgdGhpcyB1c2UgY2FzZS4KPj4+PiBTaW5jZSB0aGlzIGludHJvZHVjZXMg
YSBuZXcgRFQgcHJvcGVydHksIHRoZSBwcm9wZXJ0eSBpcyBrZXB0IG9wdGlvbmFsIHRvCj4+Pj4g
bWFpbnRhaW4gY29tcGF0aWJpbGl0eSB3aXRoIGV4aXN0aW5nIFNvQ3MgYW5kIERUUyBmaWxlcy4K
Pj4+IFRvIG1lIGl0IGxvb2tzIGxpa2UgeW91IGhhdmUganVzdCByZS1pbXBsZW1lbnRlZCBoaWVy
YXJjaGljYWwKPj4+IGlycXMuCj4+Pgo+Pj4gTG9vayBpbnRvIHRoZSBzZWN0aW9uICJJbmZyYXN0
cnVjdHVyZSBoZWxwZXJzIGZvciBHUElPIGlycWNoaXBzIgo+Pj4gaW4gRG9jdW1lbnRhdGlvbi9k
cml2ZXItYXBpL2dwaW8vZHJpdmVyLnJzdCwgZXNwZWNpYWxseSB0b3dhcmRzCj4+PiB0aGUgZW5k
Lgo+Pj4KPj4+IFNvbHZlIHRoaXMgYnkgdXNpbmcgR1BJT0xJQl9JUlFDSElQIGFuZCBhIGN1c3Rv
bQo+Pj4gY2hpbGRfdG9fcGFyZW50X2h3aXJxKCkgY2FsbGJhY2sgdG8gdHJhbnNsYXRlIHRoZSBH
UElPIGludG8KPj4+IGFuIElSUS4KPj4+Cj4+PiBUbyBqdXN0IGltcGxlbWVudCBncGlvZF90b19p
cnEoKSB3aXRob3V0IGFueSBpcnFjaGlwIGFic3RyYWN0aW9uCj4+PiBpcyBhbHNvIGJyb2tlbjog
eW91IGNhbid0IGZvcmNlIGFsbCB1c2VycyB0byBqdXN0IHVzZSB0aGlzIHdheQo+Pj4gdG8gZ2V0
IGFuIElSUSBpdCdzIGV4Y2Vzc2l2ZWx5IHJlc3RyaWN0aW5nLgo+Pj4KPj4+IEFkZAo+Pj4KPj4+
ICAgICBpbnRlcnJ1cHQtY29udHJvbGxlcjogdHJ1ZQo+Pj4KPj4+ICAgICAiI2ludGVycnVwdC1j
ZWxscyI6Cj4+PiAgICAgICBjb25zdDogMgo+Pj4KPj4+IHRvIHRoZSBwaW5jdHJsIG5vZGUgYXMg
d2VsbCBzbyB0aGF0IERUIHVzZXJzIGNhbiBzaW1wbHkgcmVxdWVzdAo+Pj4gdGhlIElSUSBmcm9t
IHRoZSBpcnFjaGlwIGluc2lkZSBvZiB0aGUgcGluIGNvbnRyb2xsZXIuIEl0IHdpbGwKPj4+IGJl
IGhpZXJhcmNoaWNhbCBhbmQgbGlnaHR3ZWlnaHQgYnV0IGFuIGlycWNoaXAgbmV2ZXJ0aGVsZXNz
Lgo+Pj4KPj4+IFRoZSBHUElPTElCX0lSUUNISVAgYXBwcm9hY2ggd2lsbCBoZWxwIHlvdSB0byBn
ZXQgdGhpcwo+Pj4gcmlnaHQuCj4+Pgo+PiBJIHJlYWQgdGhlIGRvY3VtZW50IChEb2N1bWVudGF0
aW9uL2RyaXZlci1hcGkvZ3Bpby9kcml2ZXIucnN0KSB5b3UKPj4gcG9pbnRlZCBtZSB0byBhbmQg
Zm91bmQgdGhhdCB0aGUgY29ycmVzcG9uZGluZyBpbXBsZW1lbnRhdGlvbiBoYXMKPj4gYWxyZWFk
eSBiZWVuIGFkZGVkIGluIHRoaXMgZmlsZToKPj4KPj4gaHR0cHM6Ly9naXRodWIuY29tL3RvcnZh
bGRzL2xpbnV4L2Jsb2IvbWFzdGVyL2RyaXZlcnMvaXJxY2hpcC9pcnEtbWVzb24tZ3Bpby5jCj4g
VGhhdCBpcyB0aGUgcGFyZW50IGludGVycnVwdCBjb250cm9sbGVyIHRvIHRoZSBwaW5jdHJsK2dw
aW8gaXNuJ3QgaXQuCj4gCj4gSXQgd2lsbCBiZSBldmVuIGNsZWFyZXIgb25jZSB5b3UgdXNlIGlu
dGVycnVwdHMgPSA8PjsgaW5zdGVhZCBvZgo+IHRoZSBod2lycSA9IDw+OyBoYWNrLgo+IAo+PiBI
b3dldmVyLCBpdCBpcyBpbXBsZW1lbnRlZCBhcyBhIHN0YW5kYWxvbmUgaXJxY2hpcCBhbmQgaXMg
bm90IGludGVncmF0ZWQKPj4gd2l0aCB0aGUgR1BJTyBjb250cm9sbGVyLgo+IFJpZ2h0LCBzbyBp
dCBpcyB0aGUgcGFyZW50LiBPZiBjb3Vyc2UgaXQgaXQgc3RhbmQgYWxvbmUuCj4gCj4+IEluIHRo
aXMgcGF0Y2gsIEkgaW1wbGVtZW50ZWQgdGhlIEdQSU8tdG8tSVJRIGNvbnZlcnNpb24gdGhyb3Vn
aAo+PiBncGlvZF90b19pcnEoKS4gVXNlcnMgY2FuIHN0aWxsIG9idGFpbiB0aGUgaW50ZXJydXB0
IGRpcmVjdGx5IHRocm91Z2gKPj4gdGhlIGludGVycnVwdCBwcm9wZXJ0eSwgZm9yIGV4YW1wbGU6
Cj4+Cj4+IGludGVycnVwdHMtZXh0ZW5kZWQgPSA8JmdwaW9faW50YyAxNiAxPjsKPj4KPj4gVGhl
IHB1cnBvc2Ugb2YgdGhpcyBjaGFuZ2UgaXMgdG8gbWFrZSBHUElPLXRvLUlSUSBjb252ZXJzaW9u
IGVhc2llciBmb3IKPj4gdXNlcnMgd2hvIGRvIG5vdCB3YW50IHRvIGtub3cgdGhlIGFjdHVhbCBp
bnRlcnJ1cHQgbnVtYmVyLiBUaGUgaW50ZXJydXB0Cj4+IG1hcHBpbmcgaXMgbm90IGZpeGVkIGFu
ZCB2YXJpZXMgYmV0d2VlbiBkaWZmZXJlbnQgU29Dcywgc28gdXNlcnMgc2hvdWxkCj4+IG5vdCBu
ZWVkIHRvIGhhbmRsZSB0aGUgaGFyZHdhcmUgaW50ZXJydXB0IGFsbG9jYXRpb24gZGV0YWlscy4K
PiBUaGlzIGlzIG5vdCB3aHkgZ3Bpb2RfdG9faXJxKCkgZXhpc3RzLiBJdCBpcyBub3QgYSBjb252
ZW5pZW5jZSBmdW5jdGlvbgo+IHRoYXQgaXMgdm9sdW50YXJ5IHRvIGltcGxlbWVudC4KPiAKPiBJ
ZiB5b3UgaW1wbGVtZW50IGdwaW9kX3RvX2lycSgpIHlvdSBpbXBsZW1lbnQgYW4gZW50aXJlCj4g
aXJxY2hpcCBvdGhlcndpc2UgaXQgaXMgYSBidWcuCj4gCj4gSWYgdGhlIHBpbiBjb250cm9sICsg
R1BJTyBkcml2ZXIgc2hvdWxkIHNlcnZlIElSUSBudW1iZXJzIGluIGFueQo+IHNoYXBlIG9yIGZv
cm0sIHlvdSBuZWVkIHRvIGdvIHRoZSB3aG9sZSB3YXkgYW5kIHByb3ZpZGUgYQo+IGhpZXJhcmNo
aWNhbCBpcnFjaGlwLgo+IAo+IEl0IGRvZXNuJ3QgbWF0dGVyIGlmIHlvdSBkb24ndCBuZWVkIHRv
IHNldCBhIHNpbmdsZSBiaXQgaW4gdGhlCj4gcGluY3RybCArIEdQSU8gaGFyZHdhcmUgZm9yIHRo
ZXNlIElSUXMsIHRoZSBmYWN0IHRoYXQgdGhleSBhcmUKPiByb3V0ZWQgaW50ZXJuYWxseSBvbiB0
aGUgU29DIG91dCB0aHJvdWdoIHRoZSBwaW4gY29udHJvbCBhbmQKPiBHUElPIGJsb2NrIGJ5IGRl
ZmluaXRpb24gbWFrZXMgaXQgaGllcmFyY2hpY2FsLgo+IAo+IFlvdXJzLAo+IExpbnVzIFdhbGxl
aWoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
