Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06A30CD68ED
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Oct 2023 06:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e3L70H/KBwOTYoLeicSTtfJ/yyzTBpuYmUiObHVwT8Y=; b=kVWMHcBxgJTXJnH2dyFT5q/lez
	OxoAfbAseGCm9T5ZPLEwXfeNtNUE3s/+YeMwGhRTK/iQ1NWKS2AhJsLzAMh3cqYilWy0c9kR9n36m
	tY/ihgOuJ2hG3BGusYBTI4S8SvGd6MaWfqv033k2fpRJoCtYr443jnCcOJmd4H5DyaJQphRUmibXJ
	/UfOK/PP7vfNTiK4PjrkOHMQgj6OTUUGj3ZajsS6YnnsvoqTWmNwUVTtGzm4YdD+H1I8sVEf6gVWx
	jRLK92NysYbPp/GpF28GGcP/N1V71UfFgWXUOY7O170npnrF01SrKN4b/nxz1e3QrK8E8cGRnLv2n
	hWY/SCOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qq5pW-00CWj4-2m;
	Tue, 10 Oct 2023 06:02:54 +0000
Received: from mail-psaapc01on20731.outbound.protection.outlook.com ([2a01:111:f400:feae::731] helo=APC01-PSA-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qq5pT-00CWhI-0D;
	Tue, 10 Oct 2023 06:02:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A5Kxu2H31SfDlVFqnk02w3GyYOvSPJoSwpS0Z6utIBIJe+XS0H88FUVRcMVF5gK859X6oaKnrHSKV+YAwMjj+2PCi/onlN/GnqlHaeoSVJheGtKlDYZH1P5ixQ/ASh8HN19o7kDc0PFvRD1z7cKqBWr/nMMCeuomEUbeGycGFB9Ug+9qHV+r0qB/bvMPCUSCATVP3rHXJQEyZZ1ePU7OaQNQU1XySjB0KkNfCIAS/A51i+F16rqqFHyqkbi/oq52NTQrn1Rrc3D7Y2vO8H2S7nxsiYncfaPlkrKeihuigEhHinS16c44qQ2LOFvPtad7bu3vlwhBvmsUdd04TutFFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=panj5sUFIdkvehbIA5hXXkT8yn/VoYjYjf7czZ4j7C0=;
 b=Nw9n7boEHNmTQb0vBTpAw5J0WZnug6bxl5uta3ACaFF8bdlwmCbgBdVrlXEswiD6ZJRKLHCRw3A/MrW/hSesoAk1jYTTWts0BjAJlHqgo4JcFKZlP6adKXQeiTaSmQQJImyjXzzuh6TN3wTkhLCD4umoaqwex+YVn4q+pzNFHOVYVTjD4w1CA4rl9L1vqD/C70ducKSaSrvXknng6xp1Ov5/9rYQxVWATo1vGnD+jxZq3CIPL5E36ImV4oqNb0U7iuT5VS6nyoh5DWjR8UQllDESKmN34sLY88UlZ8+FQZDT5YI7amHc6DikUyvTHt7XyUOoW/uUgMDf17iEhN9xoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=panj5sUFIdkvehbIA5hXXkT8yn/VoYjYjf7czZ4j7C0=;
 b=TQe40n0305qmk2j+p18gNvEIFws02zAxJlNHnmjjcOUXMZrjGNghZvZj2ZUJufTdUxRssVuSXgphVnqtHIyOaGjEveUxqITE99Dch0v0gR+FRHldJOs71nnwgpNaqGuVwdGofzl0Rjb884Umg/u1+NXjwVhXhVyDZKFqOxEdnHYCcAfWTaYm7nMM+YqVISqv97OZFiNcHs+wP/+spLRYniH7x3mttfdPWLs6RHTLqnU0evR+eTQOkkjaBVNKJjVbLQay30+6amE92ManNZJNOwrJN1G2mwt2RLBSJCUuf0eBemmEQaFITIZ+WG5jmrpmScOkJW4pv2uYdJLhON7m8A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by SEZPR03MB7753.apcprd03.prod.outlook.com (2603:1096:101:128::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.36; Tue, 10 Oct
 2023 06:02:31 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::792a:209d:4919:5db6]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::792a:209d:4919:5db6%6]) with mapi id 15.20.6838.033; Tue, 10 Oct 2023
 06:02:30 +0000
Message-ID: <2663c344-4fd6-6fb7-982b-7371be2ede38@amlogic.com>
Date: Tue, 10 Oct 2023 14:02:24 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 0/4] Add C3 SoC PLLs and Peripheral clock
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20230928063448.3544464-1-xianwei.zhao@amlogic.com>
 <51abc760-8d6a-41b6-8a10-e03be5edc486@linaro.org>
Content-Language: en-US
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <51abc760-8d6a-41b6-8a10-e03be5edc486@linaro.org>
X-ClientProxiedBy: SI1PR02CA0010.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::17) To TYZPR03MB6896.apcprd03.prod.outlook.com
 (2603:1096:400:289::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|SEZPR03MB7753:EE_
X-MS-Office365-Filtering-Correlation-Id: df4caee9-afc6-4542-f670-08dbc9567cc2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: reD18s3zOheCLs7WBSeuVdjM96Vjj7VEPQAHtREwHdyQgwZKiY1hmV4OwS4zLtX2+HD3/C52IYYnvBQfgI3uEXysPjIQHp6wk0fwqEkTNGaYTge0fzuvwhn3sVp0vxRDtkqYPvL9H+te8VwrL8R/ha9M5pqsMj5/KAm5uPaZE6fusWPF6WyjwvIBEejQYMtDC0zZeK8S3drpL6fXPjlAnAbGSbAp2IdTT5qG411vQxI/eN2Yqr5PzH6em1BwVFK+szGcYyGO9Wycdw/w6TMi4VZRVsn5on+E7cszQaGe8sRTZLOxHIXicaBNQReMkc3i3poe5yxwaRwUovxA8dzDxk1YojBI9C7hbaZF30u7xu6g+gl86K70ZeQ8Wh0lLcUSzwPTVwBklsCWv5BFv/utLM8z+1sm2LPmJSDhjchj/V7mdunJqKDFPpCptWd/fT/5Li+DkVCsAoU1Dz8j6CVNIHS9Z+oaVoNTiCQJ4AcFeWAMfGQyDZka8vk1IrC1g+/6Wftw7COs1artG2josD9robymCMd/e+O5EIIG1DqCfyVN86PKPa5h0k2BTfjpEc0ILvVeiJ3IXA1LTxUdCD9Q/olxjsMnhUxZkWmbC+Ki/Ol9WifILzqk/FjKChYEQ89AqvVpPdo4XL0ZWca8p3QCxRB97xhASL9rihK9KzTqoT3IYOYvWKQDZlirq0dOuy2ezOWWDedI3l2bE/JK9Zjx9w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(346002)(136003)(376002)(39850400004)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(31686004)(31696002)(86362001)(38100700002)(36756003)(53546011)(66476007)(6512007)(478600001)(2906002)(6486002)(4744005)(41300700001)(4326008)(44832011)(5660300002)(6666004)(8676002)(8936002)(6506007)(83380400001)(2616005)(54906003)(66556008)(7416002)(316002)(66946007)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SGIxTURDQ0VBZWVNbC9SUlZMaFNJdDFCUTArd2VpUXRmbUdsOG5LaVNxSUty?=
 =?utf-8?B?RUNHUFlFR2ZwRGUxWE1pZ2JIZDBzaFdwd3d1ZkNIRFVLa3Nyb3FlRDNQS1VS?=
 =?utf-8?B?R1lEN0J1Y2FZdzNiTFRNWThZeGF3SS9XdTJXVW9PSU5FZnU4RnRVUkhNeEMx?=
 =?utf-8?B?NzdKM2tvQjdtMXVySnZiaU43Zm9YVGRGL2c4dWIyN1U0a2Z5YUthRFJBV0dW?=
 =?utf-8?B?dDVPVVp0RlRTTzgySTlSLzJoemExQmVqNHYyYVJlL291Skd4dTl3M2ZlQlll?=
 =?utf-8?B?ZGxleW50VFFNek9YNU1KWndQS1EzU1hVWkhubWxaRDFNTUhDcklmN2lHQUt2?=
 =?utf-8?B?d21PNWJQMHB4YkMyQVFuMXhpLzhINlpoYXpJamkwalpja24xNlRTTGZ1MDBt?=
 =?utf-8?B?SWlXd3lGL0hjQlFldjB3dWJtVVRVNlc4a1h1UExocExnU21ieUMxRUkxYTNN?=
 =?utf-8?B?QUZza1pEeGF6Q282M0QvM21DWDhUREE4WG1tTnRMS1BkSk1WenQ5ajdlM2JG?=
 =?utf-8?B?Tkl2WTdRWFdHU3ljYnpjNEVpQ2tvUVQxZ2pVTHEzYzBPekxZOXNiMXZTbWdP?=
 =?utf-8?B?WCtzWU1xN1hCbXRHdzdvSHQ2SjVLaVArSHdsRDRodVNDWk4wenRGZVJnMmxS?=
 =?utf-8?B?L0RJMEY0WnhjWm9GajlHVWd6c2J6ZTBOaDhaenFqSFBydGFGRnhrbGFObzZs?=
 =?utf-8?B?MklCWWlBQWJObnExL3UwRUozczFQejJEQVhlaUNDdFdoNFBLeUxkVExTbmIy?=
 =?utf-8?B?QTczOUpXdlI1RDV0ZzNHOXUxelQ0c2FvVXZBOGdGSWpqMGxyZDB6bEg4SjR0?=
 =?utf-8?B?QXlYRkVHdWVMU2I5ZXkrVTJXV3Ayb0JoL3lFUlBGaDZkcjJzRVRsQmhGYW5q?=
 =?utf-8?B?NjdkN2hTdmdBdUwvUFh2MW5NM3ZjNHFYWENTKzU2SkhnUFVZU3V4Nnh1WjRG?=
 =?utf-8?B?Und3QXdoU2lVSEQzbVB0ZVF4R0hOTU1LWmcwdkRhSVdmV0R3a3htQXpEMGg3?=
 =?utf-8?B?ZFJSQkdGblh0NzFyUHNmb0ViWXNiWXBXb3J5TFA2SDZEUW1nam81dXVYVmJm?=
 =?utf-8?B?cXVNd043NSsyWkg2Sk9qdGYvbXJLYnlIK2pCVXRJS3BWQktzK0F4ZDc2ZlA4?=
 =?utf-8?B?Njc2VnI0L21INDdKRHQ1N3JWTWZKUURieGFiL3lvWmxldEtpNnQwVVJZb3lk?=
 =?utf-8?B?MExKUVRLa1FRd0xWcVhRbnJIclQ0ZDB3MmV1RG1qSUppRlZUY3NEWTJoK3M3?=
 =?utf-8?B?QnJaZEdKakxxWFh6UUF0cUMvcTZBUHJUaFY5SmNoZitZclNDUVFYWElZVUFl?=
 =?utf-8?B?eTAyUlEvWkxScURuVVIwOTI5Z1hMYWI5QmxkWGk1cW5LVEtoc1gxZmFhMmVH?=
 =?utf-8?B?K0JuQUQ2UDJLZ1pBQVk3ZndVa25zRDh3L2FHd2xTYkd5b2xQblFHSzRiWXU4?=
 =?utf-8?B?NVRDdnRBcFVkRENtMWlOa0tVNWlobFU3WCtlek1sZ1l2Unk3d2ExbE5mZXVs?=
 =?utf-8?B?ZWxUSEJPMGtWdkVJVXRZenRFTjVZUTNrTEoxME9XMW1ZR3B6Y3h4QStrVFJy?=
 =?utf-8?B?OVF0eHc3Yzlhb0tCZEU3MFlsWElyV1pOSXRQdjBlek94a2IrL0Z5R1VQUTJu?=
 =?utf-8?B?dm10Y3JKZXpFcGJOUnNtYlBpdTdnRStFeVY1YnFCMGw3RklZSStiRnA4eWs4?=
 =?utf-8?B?K3E4MitpMHpVMjc1YXQvU1o3a1pkMW5FWm1OSVd0NnZaMlY2WmJpOWk2YzFQ?=
 =?utf-8?B?YXVSMjVsZFM2c09tOEhLZVI4QkZTUlZkcEdwMlF5bW1pZWYzb0NqSzNkVG5s?=
 =?utf-8?B?MU82Tk5rTVpXS3VEZGxLcmlpSXhyYjlWS2kyZGZwa3RVZEhSTGxZT2Z2QVJo?=
 =?utf-8?B?WCtzanI4MFhtaVRkT3E2S1lKWE9Jbkd3TWdER3NoeG5DV2p0VzJBa3I4M0hO?=
 =?utf-8?B?ZmR4M0NqYWEwOXFZYVZONHV3dW1UekdqMTJVQXd2Ny8zOHFxaWdtQlF1YjlW?=
 =?utf-8?B?TnF6UXQ1RHRXdzR2citYNHhxZDFCS0oxVlZmNVN5c1ZyWVJoS0UwYitKcjVG?=
 =?utf-8?B?bU1JcVhNMkk4NkVzSGl3a005WFlCeTljOFdsWVdhMWgzYmRJS2h0Y1hST1c4?=
 =?utf-8?B?dmxRUlMwTjg0c0hYNUd5YTFTZm5UL29wUXdQZ3Y1Z1lxUlhSUFhqM0w3VEFa?=
 =?utf-8?B?MFE9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df4caee9-afc6-4542-f670-08dbc9567cc2
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2023 06:02:30.3233
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e12q0Pe0W2OAFnnD0n/FXJOElcr3/QrhZxDpvy4/taKXtFkNGKPOCKmGB2EMFHuSwFKsxoKP4jaLVF73Xlu9KLPsIwt2WtU5K8fZ2FkTCe8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7753
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_230251_130384_07A3C8E5 
X-CRM114-Status: GOOD (  12.59  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Krzysztof,
    Thanks, I will fix errors of bindings in next version.

On 2023/9/30 23:53, Krzysztof Kozlowski wrote:
> [ EXTERNAL EMAIL ]
> 
> On 28/09/2023 08:34, Xianwei Zhao wrote:
>> Add C3 SoC PLLs and Peripheral clock controller dt-bindings.
>> Add PLLs and Peripheral clock controller driver for C3 SOC.
>>
>> Xianwei Zhao (4):
>>    dt-bindings: clock: add Amlogic C3 PLL clock controller bindings
>>    dt-bindings: clock: add Amlogic C3 peripherals clock controller
>>      bindings
>>    clk: meson: C3: add support for the C3 SoC PLL clock
>>    clk: meson: c3: add c3 clock peripherals controller driver
>>
> 
> This was absolutely never tested :(
> 
> It does not look like you tested the bindings, at least after quick
> look. Please run `make dt_binding_check` (see
> Documentation/devicetree/bindings/writing-schema.rst for instructions).
> Maybe you need to update your dtschema and yamllint.
> 
> Best regards,
> Krzysztof
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
