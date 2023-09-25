Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FAD0CE7A81
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Sep 2023 11:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:Cc:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=gDeO/0DqbsTMasvIUqVBeLwQEsOns6MhPu98WZ0dORg=; b=mChmwCY+Lq6783xz74VbgTU8wA
	EFyXit1OtxxKSVkwb6vYXVK98gcJSDVkTZ1SyOZdOoKz38iICO6vbx4e+d2zOtDO7eG9UkjLE9+wx
	qa4WxdYavybydSyerY9Ryv2MF812A+5f5V5qsVFTWaDSDoTvN4jTNsydrwFiP+HXQaTTH7D2fXnko
	0uwFdMjE42yl8/vo/MdKYRKw/QpmPP2/SzAA0TEil1gI9wwNSR8KgB6qAP5WbI9HqH5w8ax2dOK4N
	KTJ4/ueW+RsbQBO7O8abwhXXW9/hitMUde70dX1iO+mazmsdfjUUeRbUCJLeSZfsXAjE1geDgJk92
	ndNez1Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkjQy-00E8gW-1V;
	Mon, 25 Sep 2023 11:07:24 +0000
Received: from mail-psaapc01on2072f.outbound.protection.outlook.com ([2a01:111:f400:feae::72f] helo=APC01-PSA-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkjQu-00E8e7-0F;
	Mon, 25 Sep 2023 11:07:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nypxu7Vg5GKWAFS1nfhClHFNlyXgPC0ZGq1hoVwLnG12TW0pmGQ5/RDPOx9DfrFLsMGQfL12z05hQNlJslHdXRIjXV2Sbj/Ffq8L1UIHrHSc8sU+xrzT4HM7O4yUOlu0uF0+GXFDblYxkic3tXMm4Ck/AylCgWd0gEB26rsUhIgPq+YsJlsBbghVFx1wfTO6VZ38I1rNJMQE5TGQILvSIZtih1HTzlkBCON5Etis0fdFIL3wwvVxDhRuBh+26PAOM20k3dxrRtlVNkuQcaIr64fhXcPLCpxvq1rfVO+5bywDsvLKJnF6O3kHaY4m9CuaMPSWG1bi70ONSyRnxKrkfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lIm9wZqevhhSSwjMjOH9qpIXwAUdu5OW+ho892eOmf4=;
 b=KnW5L2cjOX9NUfdXUPC+J05HuplqouU19S9mxVvk1o5ryDIfgbOelC3PrOpKGmCzjY9k3o2QaMJzreaHkSpeI0cGgs9dZfAvZDG+CPlYC/ZzVE9bwnzRveozh6xbF/1UvWZPDWZoMxTX7pgPRHXPykeq7CMQQVIz3Kc7CNBcqBuUrkTSSuYUK9AB55xb3b300eBUkn4OP1Y+MwB9Z4RHbTl9OKkYx8ddktVCNVsmL/fA0Dc2cw4njiDfu/3bE9Kk0VGV6bQ6b95/lFmzI8i7WsxZN6ZRI7doj4zJQ1xZNVCg5i2ocAx2l4ac1oBXHiuZV/yaG84xuTTzWgAgNew1jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lIm9wZqevhhSSwjMjOH9qpIXwAUdu5OW+ho892eOmf4=;
 b=ynd1+a9y46S3CIqNvbShUPTjZTXVG/VsFF84k9WbANGvsN2Nf0Y1ALC//eqomJ9dtNJcTk5YTKze8JaLWdRMLPULestG1H3ZeeHELfMfGQPDfoZJ1pRIjlcrsd7fBNzyJuk/lafo+bpJoACjmQEUhFInRL3l0PhHfgnXwfr9sXnUXe6X/L8HvlhxPG4CXAjxcpZ6793LlXbWWlSk3KDZaoj+QIzToiEy9DRISQo95rdv8huKf3/O4neyk7Vuy9yIeW1KoSX+NJiGAdNfozKpfUAi8NgJ5AOC7CXPjzI5SY3PtcEu2x3xtFkfaw0RW4BkTD7hUCK7QwJX79aX9MDiSw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB7221.apcprd03.prod.outlook.com (2603:1096:820:cb::11)
 by TYZPR03MB7790.apcprd03.prod.outlook.com (2603:1096:400:45c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.25; Mon, 25 Sep
 2023 11:07:09 +0000
Received: from KL1PR03MB7221.apcprd03.prod.outlook.com
 ([fe80::3f14:c67:12ac:af39]) by KL1PR03MB7221.apcprd03.prod.outlook.com
 ([fe80::3f14:c67:12ac:af39%3]) with mapi id 15.20.6813.027; Mon, 25 Sep 2023
 11:07:09 +0000
Message-ID: <dc8fa418-e913-1bea-2f1f-6d7a0e331c29@amlogic.com>
Date: Mon, 25 Sep 2023 19:07:05 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] arm64: dts: Add watchdog node for Amlogic-C3 SoCs
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230925090641.1185942-1-huqiang.qin@amlogic.com>
 <51470d7a-65a7-44c7-856b-53ca4b065553@linaro.org>
 <bb20efd5-4f60-5ded-caa6-2c9c94a10a44@amlogic.com>
 <235b17ef-b34c-4006-baa4-a1d4360dca16@linaro.org>
 <e9334edb-bf2e-4dca-9752-14b2924763a4@linaro.org>
From: Huqiang Qin <huqiang.qin@amlogic.com>
In-Reply-To: <e9334edb-bf2e-4dca-9752-14b2924763a4@linaro.org>
X-ClientProxiedBy: SI1PR02CA0006.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::11) To KL1PR03MB7221.apcprd03.prod.outlook.com
 (2603:1096:820:cb::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB7221:EE_|TYZPR03MB7790:EE_
X-MS-Office365-Filtering-Correlation-Id: b1c4886e-0617-4b06-40f2-08dbbdb78ed0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: A714JeLtPJYxMxo6MqMA/6Gk6po3mY1eTNz5GM6zNG+3bjzoG4geLEAcEwSNrGEYlNARtugi7h280tA22qrzv7Py5OZ8ic+ZqTreeti1p/ChyHa7YVZyZg5HzSvL6bMvWLdHpNJXNMNQyed0o3KzrzVtuuICmbhKnq3gpA8fxQO0bSgxT7fw0F51HNAuL3u/ksc8WmPUqYO1IxsWkjYaX+3hQ9bRYBiZOsHDNu26aA4fng0dVcHWkElepwLGbgVV3yvv9rYfmynn4asL41dkBRxaQM/T16IdAOBqIs1VOyrvkWqTUJ99QfcUtwSg4gczvGG8ruIrweGXIvV4rc6IFGdX93YOFapIviVvNW9QcupQOchamMV21XxUsz5TtxLeMVZTUJWa79ydA4++ui24gn1SqO53b2oXInsJajSsDFOPSIuFOexrp+8wnlVScKoKBhWlLsJD0dRY111tIacwuWjjo01QOWCgDV2kZznTIzbAmaMhYnTg7RSBMxTyNaWW3hud4I0VsBDo1oiEYjZaZoR5hhq7YO+8VB7cyffmv/YGs01xzUGDZsbGZlWPjN9Wt8h2zopSSyfd1hlAbILgh26BtnlY5rpxJjTT/8yILCrznymYaC2kpB4K1hYfX+UxBh7Efdu8nf48Cu1EsK36PLpx3kSNgseI1KFH7F00Tbb/Ua1VeYMUgMkMBGzO2CvX95ghsn0oJR2lzMNznPnjRQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB7221.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(6029001)(136003)(376002)(366004)(346002)(396003)(39850400004)(230922051799003)(451199024)(186009)(1800799009)(7416002)(8936002)(4326008)(8676002)(2906002)(86362001)(31696002)(31686004)(38100700002)(38350700002)(2616005)(26005)(316002)(6486002)(52116002)(966005)(5660300002)(66476007)(66556008)(44832011)(41300700001)(36756003)(66946007)(53546011)(6506007)(6666004)(6512007)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N1JJcGE0a1VlK2JLYkhUVCtRVHZPN0laU09PNU11VGRGT2xHeTczN0JRQXJV?=
 =?utf-8?B?L1FWTDQ3cE1ZOEYvQTdjMjJOMHpBQXpSQzFMaVY4TU9jeXpuV2VxSk5qcGs0?=
 =?utf-8?B?eFNrNnpYWUVNOElTbDFYQTZobE9oci81dmlXV2lkRzNURE9QNnlLemV1RVZn?=
 =?utf-8?B?aGNjUVNUcmZ3WXJudnlCeHFCKzBzeXY5WDBJVElONjJNamp2WjM2M096Tjdt?=
 =?utf-8?B?YS9OQWlZY2RNZ1JTbzF0N1B4cGlzNlA1Qy9KYlBLWXRJamhrd1k2bXdVRU1k?=
 =?utf-8?B?NnpXWnd2WUw1ekNTeEdQKyttYlpYU2h0R0x0THJWSWlHYUw0VHZHb0Jyekpj?=
 =?utf-8?B?YXhSWnRrK3RQMlE0Vk5DQkpLSE9MemdPOWVSWE1zU1d3NzcwUzYyVFg3a25v?=
 =?utf-8?B?NDQ2ekZYaTJyRlhWbHNiZXNCNEFqb2lMZzM3dDB6dVp0cTRjV2ZBZVZNaHF5?=
 =?utf-8?B?NXdON3BKVGpOSDFJNEdUbThDUGZtRGo5aUEyZ0VhQjlBL1h3SjE5SkI3Yit2?=
 =?utf-8?B?V3FoMkxqL1owSDFvR0Fwb2RlTVFwSmdQK0pHTVhRR2UzRlc5U1p0VjBKNzRq?=
 =?utf-8?B?MWlxTGxCVDBsQ0VkUUNJMktMUXB6U2tvVlFrZldjeHVKUzVjTkFYUmNoQXJM?=
 =?utf-8?B?bXZqTmI0cjh5OWkwWGJuRm9sT3hLSUNEKzlRVk5BK3BwZmxYTklPRUF6WkZU?=
 =?utf-8?B?Sys5RkNrTFN4NlBvdDdpU3ZnNnQ4aUxRMzNBaDlDTERyaVphODhXdmRuVnBM?=
 =?utf-8?B?RVcvNU9IdEJCekIzbFQ0YlNnY3l4blVDVkdNNUN3WGR4eCtkT2Z3T0pzRXdo?=
 =?utf-8?B?dllGczRQbzBudW9CNzlySHV1TFdkYmx0b0xCOXM2bnZjbXdESTdTaW5rTHY2?=
 =?utf-8?B?WUJ1VFNWeHhaUUsyenNnYythNm5yVEdIU21oaGFmYUdvNEhPcWxyak0vOTlj?=
 =?utf-8?B?R0tKZE5jQW5hMzJwQitvTnpuZE5ZeUNWK1Axd2J3eExRcm1IKytlL3drNnVV?=
 =?utf-8?B?UW5yQzlMOWkvOERraTdKUmlDRC9qRHN0MmtMYVNxYnpCalBjMUR4aElCSjlJ?=
 =?utf-8?B?VUswSTdWVFVGZkgzYzhlOTlNVXF1cXZqb08vTFk4UFNyNkdBUmNDN094L2Za?=
 =?utf-8?B?ZmtDeUlPTVJQY1ZnTTllUm1PN2xKNkRib1lvS2g2T1N5T2ZSK2xCSzJkblcz?=
 =?utf-8?B?ajJXRHVCWW5lVEEwVUwxSnNLVFptWGQ5YWRKbWhzRG1wUng1NFRQVWs1NDNM?=
 =?utf-8?B?OUFJOTc1NkNUc0IwaXlzc1BQRFkvMURVZDI3NklSaFgwaTI2Y1l3ZmxWb0JN?=
 =?utf-8?B?cUI4ZmFuTEZrRzNDSWJ2NFBQa0ovWS9CUGJFRWYxS2hsYWFFOFhvTVFyTmhM?=
 =?utf-8?B?bXY2cVYvMzNzWjhZckFHcFVzTlpLdjZ0Y2tDZlN6dVRtMUhuOGpmay95UUNB?=
 =?utf-8?B?NXh3czh5bEhFVkNiQzBQVnJ3QTdXdXdSOE50Y1J1dkU0dXNCelhoblhKL2NV?=
 =?utf-8?B?QjZNVTVKdmhnbDdnblI5dzZBQzN2ZitiT0hiU2VNZk1RbW54NExVL0Z1djkx?=
 =?utf-8?B?a0ZGb3FQUDNFZEsvYkQ1b2lSbVhRVXM4MkVGdGoxK1pWRy9hSjlMbzJlWEFo?=
 =?utf-8?B?eUhPclE1NnFreVZkejNNZVpZUnRoTmV2OVJTK2w4QWZxV0c5MURKUHR3aFNK?=
 =?utf-8?B?RUYzK0dNUU80RW51VGNlQkk4OVlhN2Q5TElhaSs3NUJBaTlabW1LTXBGeWxi?=
 =?utf-8?B?YzUrTDB2akhDWHpaVlM0UWZsZzJ4YkFpeUhTcnFvOGsrWFZFQ0VaSkN1T3hw?=
 =?utf-8?B?c3pCZzdDckhGUkhPanBVeUYvZERia2w5dWR3K016RmpUZjBYTkwwT0p3SVJV?=
 =?utf-8?B?cXp0VGxqb3AxdEl4UHVKejlHVlowc29MbTNYdkpHaExrMlRrTkZmbkFxN2J4?=
 =?utf-8?B?NTBkUExmdVowNS96Y3hjbnQ1dzVYcFBNNURZbjZWWFIvTlc1cU12OEZXbzdH?=
 =?utf-8?B?ZkxTZ2F4NmQzZ2N5aFdWS1RoL01QMnhzdkpld2pNdXZkY01mVVJzNXZJSjFj?=
 =?utf-8?B?bWt0Z1lJYm9XRHZOVlZna0JyR1Q0R1hNbVFzRlcvcDJFaVpDVGYyR2xuQW1B?=
 =?utf-8?B?VGpkNGVtQVZiSDJLMjZIVVBhSUhxSFRSOWZmV25sV2ErRVM4MFFLRXllb2Js?=
 =?utf-8?B?Ymc9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1c4886e-0617-4b06-40f2-08dbbdb78ed0
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB7221.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2023 11:07:08.2990
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cRcPMUx7t4A/hoLD0ywQ+MMBDSdMG8aFBoKPDYQb3eudh1m1f/qA3attXEhuxhyuEOf34o6IsdCTxLxLTwntyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7790
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_040720_116406_77F332F2 
X-CRM114-Status: GOOD (  11.41  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On 2023/9/25 18:58, Krzysztof Kozlowski wrote:
> [ EXTERNAL EMAIL ]
> 
> On 25/09/2023 12:45, Krzysztof Kozlowski wrote:
>> On 25/09/2023 12:42, Huqiang Qin wrote:
>>> Hi Krzysztof,
>>>
>>> On 2023/9/25 17:33, Krzysztof Kozlowski wrote:
>>>> This is c3, not t7. Why do you use t7 compatible alone?
>>>
>>> The C3 and T7 use the same watchdog controller, so they are compatible.
>>
>> I am not saying that they are not compatible. I am saying that different
>> SoCs should use the same compatible. Just like for every other platform,
> 
> Eh, missing "not", so "should not use":
> 
> I am not saying that they are not compatible. I am saying that different
> SoCs should not use the same compatible. Just like for every other
> platform, Amlogic is not special here.
> 
>> Amlogic is not special here.
>>
>> https://elixir.bootlin.com/linux/v6.6-rc1/source/Documentation/devicetree/bindings/writing-bindings.rst
> 
> Please define compatibility list with t7 as fallback.

Okay, got it, I will modify it in the next version.

Thanks


Best regards,
Huqiang Qin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
