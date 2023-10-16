Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D090CDB465
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Oct 2023 06:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9DmGQI0GqsAbKuUwTmSJN8KI7EfbC8hLVtI8crX2gJ4=; b=CpFPHVfr/k0fgtOHsPlne12sXk
	VTzStPhEYftFQQbw8pBdwpfzrYqZpOURUhNRthoLYYA2wgELjThXW0HKJ2grMB1cTUrgV0rkuUX1H
	BJ5Lvoo9DtY+v3hV7L1Pka3qh4B/edo7HLdywob+xuYdSj/vY2tP1h6Y5g8BLKXdpfpcZ79x32d+P
	BWC4pq64ilytLWPLgxXnyXpefkF8jefu4DSBTg7NOztPzclkPRjDMry+JAnHZz2Iod3Qnd+idCxuT
	c2UYdVBU8HsDZO3RYxtdDpdQTjOGgBaR4KT2QqvnCv08KmV8vUuOlJ3dj90ykH9/C7wDNO+sD7Lo+
	plBNZ1Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsHQW-008ZpG-3C;
	Mon, 16 Oct 2023 06:50:09 +0000
Received: from mail-sgaapc01on20706.outbound.protection.outlook.com ([2a01:111:f400:feab::706] helo=APC01-SG2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsHQU-008Zop-0C;
	Mon, 16 Oct 2023 06:50:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZP/v8gD6Gh+45nuxN3+jXoFtmAA0iHG49sf5SPNjkKKlAbTolhjANSFXETjenaDWSb1chcwnqEYFN0ZX0rx3wigzMNg9YHX2EM+RVDWrjw/O3HvLEVbwZJDfgauviA1mNx7BaXMVTcpUfCBQAYNNKfw5GePlkDVZCKtyXKVv2PMWcbUClSzp13omXOfVbJ/sNi3IVYiMSvqSPa0N72qLeqnRxaJy9ZAubHqva2W95Zh6Y8LrHbL4oMQmdrnMsTV16aexI1KREqtt9g6GaV6jA7C2iocLO35ySiDs+z16e8OwlW8wOEom9gN0MRNNosFowXK1NnqPHg5ZyMqWnSQTgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Xk9upDCMy0vf6RhD1vTAHHrvZYLgHYLWmUcsKSnwog=;
 b=hDBWh5jZCE3JT2/+EucXHQhp3ab6LIckDnbDhxk1NV7EeNnf4Jxhy61tqCzqTj/gwVmZZ0rfjohl4GHM8FugDQzbUZ/BLmm9PChyUrYRpsN/pWxenGBOhxLI2oywSWPkUuGh3pnNAn5Ik+LZLzPB5/0x2TvDUbZ0X6DeqytTwAhHasSznEaSB/+SUCgFiuUV6js+tcRFYpeeEapsFmHWbF1hHOs3yLI3Hk7EE4cZuM6QrFI+0EHSfX6wMDGUG9jizbcKumVI5aXUp+Oxphd4ntmxzV1Rj6c4Vac0zhzc8+Kf1yQtDNbRLXj97JwSYiWPOhqtX6xE4zlD8HTPX4U8qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Xk9upDCMy0vf6RhD1vTAHHrvZYLgHYLWmUcsKSnwog=;
 b=nU22Zioa7rXTugvjR6Q+cUGOjpJ0mNkqwLqS5YM5LpUao5IxKQ/t43EKmQ+gRtgBORxPXK7rD5W1Xr/1AuzErAf1W5ySglfy0AAhDBg0pgyIk3JgCLADubLOwvwCzymrD9nnDIP6KgpML+/oO0m71YG9+8zJzQwZ/oNx1MydA37GkoYxX0C67yO8b/4qpGoKTcoMf4I6Wz/gh2bJ/K3igZelyByw9XrlmDB66/8wOMYcj0kOOcYncdrB7OmE0Aa1a72KYX17UQ+Hffp9Cha7SlmLGVqRSDexFUdmJ379ljembhL1O2OTqA9rCQt7k1TR0jULy9V3TyKFL2LWtfGrMQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by SEYPR03MB6578.apcprd03.prod.outlook.com (2603:1096:101:87::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.34; Mon, 16 Oct
 2023 06:49:54 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::792a:209d:4919:5db6]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::792a:209d:4919:5db6%7]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 06:49:54 +0000
Message-ID: <05a5c068-6766-ade4-0e7c-e94b48c4d754@amlogic.com>
Date: Mon, 16 Oct 2023 14:49:48 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH V2 4/4] clk: meson: c3: add c3 clock peripherals
 controller driver
Content-Language: en-US
To: Stephen Boyd <sboyd@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>,
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Chuan Liu <chuan.liu@amlogic.com>
References: <20231010062917.3624223-1-xianwei.zhao@amlogic.com>
 <20231010062917.3624223-5-xianwei.zhao@amlogic.com>
 <5e0bd4bba88701dd1a7a3e89d18412f0.sboyd@kernel.org>
 <1jmswnvub2.fsf@starbuckisacylon.baylibre.com>
 <2fb931d1aa2190b918d0ddba87579eeb.sboyd@kernel.org>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <2fb931d1aa2190b918d0ddba87579eeb.sboyd@kernel.org>
X-ClientProxiedBy: SI2PR04CA0012.apcprd04.prod.outlook.com
 (2603:1096:4:197::14) To TYZPR03MB6896.apcprd03.prod.outlook.com
 (2603:1096:400:289::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|SEYPR03MB6578:EE_
X-MS-Office365-Filtering-Correlation-Id: 978ebec6-6b94-4cea-9af9-08dbce141a4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 69S+DDA6kHtI3lq+vg0+Mh6QiQ6eew99zteSMrd2L6CAThmROb68ls11aISlI5OA1bK8CLcoOTz2p7bSGtcBe/Lo4XG/tf4RVRlvFMF0OsUj1+hbF5qGhSKoHfZfbwCBgpRgvDl+QUfwL7yFby+/9uEM9B58pLPgOr1taKR5uw846N/8WygRnD3a34r/uj+BMeKyrFLwt8hUUtbTJtvXtwXw81AmDBbYtDXTo84lu24TS+twIcbvDWflHNOwNwWgJLl5pNT45IjrpdMXvMKudpk+As6NFWaUqy09W4d/aseDMpDF5eeVHof9164JOMKftPOAqkpGvDMXqQniw5gGA/kaGNXp1NAifQEO9RbW2Kw4iRAHST4DdAXwIhBdN5hXP6JQme+YGYiDL4daQNQMIYj4ZC45uBp6ZQdU40JOlVXJR4P9RbhUHB1RhgMc0L2z+rLkBkuno9hPIOGb3VmhLnNnKjs1vqpiXEM5o1PE2jSd+zk7HL2+PIf1gnapfHWyuxj90/ywVzROG3dt2J51hrxwxUuFbza3s2nOQdyQQLoxVUSn7or2t3aKEBgCdTrkEPterzgNp9fsPbTJcq0VZkM8JZCI5NsnQ+gqQ1fvNJhDaDVkRXitY71vALP1ahMoPyXa2ZpQDdAjaubNkhdqwg//QBcPTe+jiOIO5FFsBA6dyoyNwDABFG9qzwGMlMoQZj2QeyOPXJzLhiYxbOibvw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(346002)(376002)(366004)(39850400004)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(31686004)(36756003)(66476007)(66556008)(110136005)(54906003)(66946007)(316002)(86362001)(31696002)(38100700002)(53546011)(83380400001)(107886003)(2616005)(26005)(6666004)(6512007)(6506007)(8676002)(4001150100001)(8936002)(2906002)(6486002)(478600001)(41300700001)(7416002)(44832011)(5660300002)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dm8xdHROUTZrb3BodTYxZkx6VU5zc29yaE5tV2VnTTNSYk9LeVlSbGFqZFdV?=
 =?utf-8?B?VTlPc3RuMVp3S2RwdjlpWmt2YmtiN1lqMERzZisvaU1IU1A3M3VJcU9pYjMz?=
 =?utf-8?B?anhIbWN3Sk9QQ09UOFRGQnRJdDdnSWVJcSs4Qk8zWnNudFdDbUdlQ2JSMFhO?=
 =?utf-8?B?UWROdVJhRk5NdXJYUXliVG11NktHVWVRQlBuM2FvQzFZNGR2Y3V4NERsOEFu?=
 =?utf-8?B?MzlHMnNXZUZOY2dWTnRSdEZvQmVhY1dBaTdFaGJiZnJZWWx6TTJobGNZdW5h?=
 =?utf-8?B?ajlkV0xBMHQzcC9ONUplbVBvQmZDTEo2QnppcnYxekljSGhYeEhSZ2xoemc4?=
 =?utf-8?B?LzJTdUVmWFdKdko5U0xDbEZXenZFQ05ITzJZanArbkZyRzZ6LytzOUtDNXNG?=
 =?utf-8?B?ZHRqTUUwRVlYdHhNYnBsT3FBYmVsN1VNR05QbDlMUlpjUC9ER0JpTVZnYkNJ?=
 =?utf-8?B?WTF1SWZJWWZtUjY1WTNqMjhPbXZFYW11SkNhU3JyMTQ5bzZZbEt3MEhtMFBK?=
 =?utf-8?B?U0dLb3hNcStDdDFRcDVLRmZ4SU9NUjkxTFFKOHFETUdNU1hBbWNiNm1JR0Nh?=
 =?utf-8?B?My9CeHRTRi9VbG8ydnFzbnd0L2NUT1FFRTQzZzZQdHR5M2wydW9sMW51MFl5?=
 =?utf-8?B?bXN0Y2lhem16RGs4RlgwU0RlOU5yeVY5Sk95encvTUYvd1J2VXhUZTZWMWJK?=
 =?utf-8?B?d2pQVmhCUDRpaGdGQTdCL0xxMlhudVZEb2E4S3JueDlOTVpkNzlRM2x3UDNM?=
 =?utf-8?B?ZEJRbE1wTDlqYVJaY2Z5UU9aQk4vK1BkWWREajhYQ0FQV2xnTGR5Y3pqK2VF?=
 =?utf-8?B?ZVZ4eXFQSG1DRmlkc2tKVUMzOXI1RnlPaytoNXo2VG4wa1lKYkZHTGxpVGN5?=
 =?utf-8?B?SDJhekV6YWpDeXdRcmtoK09McjM2Tmc5N0JTRGtKV3JHNU9XVlp1bmpGd244?=
 =?utf-8?B?OS96UjBXYWFBZ1hyYkIyaTU5Y3pKY0hpN0ZlVkh1azI5bEM3aFJPYlRmMlZF?=
 =?utf-8?B?ZWZjNVhFSlpGQldZd0RGNVpWL1pNMUd2Q21haGthcGRSOE9qcXRmNVpFRFMy?=
 =?utf-8?B?Y0gvRlhGVDdsc0xWekZDU0F1TFZmZmNPOHJydGQzamdvZDZMZldmKzR6UkxT?=
 =?utf-8?B?SVBwNVQvcEF3R2RCeUNNOWh1SFZBUHVuSWhYQmp3aHpBRFlJb0g0NHZUV3gz?=
 =?utf-8?B?cTlGQTY5aEF1TXd0VUdSMzcwKzRlamxZL3RIZnByQjFVb015WXZpNmMxUmVt?=
 =?utf-8?B?d2pnWjlUb1ZZSmR2bE9PcStTQ29QOE82UGVUcWhUNFM2VE5rNDFORG9NQThy?=
 =?utf-8?B?bUVDdFB6WEtXMEVPaVdsdERmdWhTb1BOc3dFUUNBN3BVUXpKaFVJZWdFT2tn?=
 =?utf-8?B?UEExSTlEZWNQbUV3czNRUVM0UWlMeXhuMXdNZE1kNXRuU3BxMzFuRE54NWZq?=
 =?utf-8?B?U3lrSkFsb09hTW0vV1JHYi9CZU5tSFRsVTFvQ2NWekVwSGxCU05qL0NDTkxE?=
 =?utf-8?B?YTkxSkdIbjhvbURLak9LYWpiS09XRUp1ZDNuZVNOaFF0bjVEZlVoZUowRTJ5?=
 =?utf-8?B?b0EwVzdCa2MyVXZKSGZRUlZkbXRnakdxRXNEallYVk9ydjZjdysxakVZamlQ?=
 =?utf-8?B?bFlKeFRneTY0SEVrQ0RJZzFIVTc2TFpzN2Mxam9kUlc3YUlEdEZZUmNnMmpq?=
 =?utf-8?B?VjloNTNRYUgwek5BZnAzeTRFVnlkc2dGMlVpSmhmWEFHc3pIdkxtWVFwTmFS?=
 =?utf-8?B?a1R6SmlJVS9iSmVIa21la3VOUTVINjBSZ3BSK3FObnVvb3p0R0tmc2dGeTJj?=
 =?utf-8?B?N1Z2TlFZOXNuMWl5SmlMOU43V2lhUXZqQm9RLzZUdVVxOWc0OS9ra0tKZW1X?=
 =?utf-8?B?WTltUGhOQjhTblNFU1BYcEVoQlhaaGp3RVE1N2p2RUs0bVlSU084K25NUjhk?=
 =?utf-8?B?SmxrVEhrT1pZRmllQm5OaUowTCsxRUM5M25UNzlEa2QyQ2xxd21aZE9kQmJX?=
 =?utf-8?B?T3U3YnFNV2ZnS3ZnekdOT3dueDNwT1ZMT3ByRC9JcGFHQ1B2anZBWGZsK3Bl?=
 =?utf-8?B?SWh5cVEweEkrZ3ptaDBpVThrOWQ3M3lsV1pXOTl3anJna0ZnZ3VEc00zQ3Ju?=
 =?utf-8?B?bWRXRG1kQVB6OXV3OFBzUm5mZG5HTUFVelBvblVtUm5FaHNoZ0NsTXZ6aCtk?=
 =?utf-8?B?Z2c9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 978ebec6-6b94-4cea-9af9-08dbce141a4c
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 06:49:54.0748
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EoyM4FVZqU2iYx7JQPnMXB14/ErAMq5DSbyh1yeHyfbYpscht9QLrDOuPHakGF0NBmobVqQaoj1FSeFh5HUlE4OxcKyDbkqIvkyAi2Mu/XU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB6578
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231015_235006_415137_619DBBBA 
X-CRM114-Status: GOOD (  15.80  )
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

Hi Stephen & Jerome,
        Thanks for your reply.

On 2023/10/14 06:01, Stephen Boyd wrote:
> [ EXTERNAL EMAIL ]
> 
> Quoting Jerome Brunet (2023-10-13 00:38:14)
>>
>> On Thu 12 Oct 2023 at 16:51, Stephen Boyd <sboyd@kernel.org> wrote:
>>
>>> Quoting Xianwei Zhao (2023-10-09 23:29:17)
>>>> diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
>>>> index 76be4bbd2afb..c8d59d28c8ff 100644
>>>> --- a/drivers/clk/meson/Kconfig
>>>> +++ b/drivers/clk/meson/Kconfig
>>>> @@ -140,6 +140,19 @@ config COMMON_CLK_C3_PLL
>>>>            Say Y if you want the board to work, because PLLs are the parent of most
>>>>            peripherals.
>>>>
>>>> +config COMMON_CLK_C3_PERIPHERALS
>>>> +       tristate "Amlogic C3 peripherals clock controller"
>>>> +       default y
>>>
>>> Why are these default y? They should depend on something like ARM64 and
>>> even then I don't see why we want to enable them by default if we're
>>> building the ARM64 kernel.
>>
>> Should indeed depend on ARM64.
> 
> Cool. >
Will add depend on ARM64  in next version.
>>
>> Those are the main clock controllers. Like for other AML SoC families,
>> they are necessary to boot the device which is why they use 'default y'
>>
>> Is it a problem ?
>>
>> The whole meson directory depends on ARCH_MESON, so the drivers will go
>> away if Amlogic support is removed on ARM64.
> 
> No it isn't a problem if the entire section is implicitly depending on
> ARCH_MESON.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
