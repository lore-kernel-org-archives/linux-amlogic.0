Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D89CFEB64D9
	for <linux-amlogic@archiver.kernel.org>; Fri,  7 Jul 2023 04:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:Cc:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=uoC1cNWwi5wZ2Cvmc7/0xFMahY/KZChcV1gaUzwGPlE=; b=iUMatzSgmmFOXkg2P0f7haaq3V
	Yh4IuQgVM5dgQTjmXCUrIf6V3AOY38kYHFjft4OKugsnuyG7tf5IXgaYjEOwwiIWPxB2zst1bwvgq
	vZcyKOEFPPhboe9fzS0QhjTEwiBxQIaAWkWRvIdVwVH+3i7s6pzY4x9eXf/iIRrI0rYNL8r6emlw5
	lYQU01+LyJkK6gt1KtS6lOHdFlAjvNC5UV1aSN5esOuXq07TFPDxfySURj/eSMQcob6yfxu9gP6h6
	wrmy3MKtr1chQ/UgmbnHp/bEGcyX9G0hu+Dm1Gir/YP7NOGKfnF0kPg/EomaL9w0KJIByquLSYciz
	jnC4KrzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHclY-003RBG-0K;
	Fri, 07 Jul 2023 04:08:20 +0000
Received: from mail-tyzapc01on2070f.outbound.protection.outlook.com ([2a01:111:f403:704b::70f] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHclU-003R65-2U;
	Fri, 07 Jul 2023 04:08:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TttV+IB56N8VMTpPADA/irKE1bu9mM7BmNQvIUlOz4dJ4kfFOzfsyPGlOVOJRxYJTP/U7HtseEqXqy1GN8p+qy/exJndfhnOw+tJU72urSEA//cXYih25H6ljoJxC1Se3DJcIe/apEF3nX0savtkfZFGWWw3jrJBAp6FjhqoUYWPal9C1D2TdFrKW1nn2+OtMqfSfKtjx9hnwvGAjs1MjfGeIdcCC05+CtwhnVoa/9OCm0DUnOzU+TO6kpO3Mw62g/gxkBIgx32A9fbTQuQ2644NEFTWP28mb2+hKoxUwO9vAXBIaA62zYcKKjiowf312X8Lod46DtC3osYU6JwwNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B66F1EcxhHk+U58MKSvVI+KwsTDmMosCkKc6mK/cpRw=;
 b=nYJT7YcYbrU9hEylJm7byXE1bm27h4yHD0rrgMaqDVZEYNcbn2TyJJ1kGXIc7yNooKExHBJjc8J3/0ouR32jL/eN/d4WhLwJTpEijEQsEzd2nqFpQ6ADOlxc50pBcYfI2s9EIo+bnmH/9W3+U2Bix4TjbNrNdkU+i9XUlAra0v+VFpjvgUvJ45eNIgOAl5vpesyp64ecTehzCQ1J9rCaYXVJ6ZArt+oOQuaKJepEJ1NojkvX590iavgVb/dp6JST9Z0O9h58VfTidU5ubqW4vvxRvWCUAOgR05LwebYes0X75faUZTVRzlL+ODx4a2VT21HwHKPDHfoSDimpO5fzCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B66F1EcxhHk+U58MKSvVI+KwsTDmMosCkKc6mK/cpRw=;
 b=WPt9AdH6aX9swMGDKiny2nnAPL7jvLwpWOxE8gNuiO+liXU959sIFx4NYnsZ1g+b7CLAOk41BdBL3plh4A533D2r8OR+BT3oO5/jfdiNMfXz94zbVvyKVxnQh2YXNKGN8ThXc0AKilt83eM2c214vRTNhgm5TqI3Kcq6z/WhYYnhq3gI/2FG2jYMGNnwqE0tf6qI4pdoD5ZUSt3ldbPSxHRHvV7r+xfxGEK7DcgK9X3QK5WjxQtjudzuIPfNDTB72OrKBvWchYuaUwtwwwX/4wfeQvoO7qFfyWEt8Pg1fZY3OCyx2MZP98gXvjdcZMY/r1mSxGqSAT1bk2rvUE9Jrg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB7221.apcprd03.prod.outlook.com (2603:1096:820:cb::11)
 by TYZPR03MB5215.apcprd03.prod.outlook.com (2603:1096:405:5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.25; Fri, 7 Jul
 2023 04:08:07 +0000
Received: from KL1PR03MB7221.apcprd03.prod.outlook.com
 ([fe80::66e9:429b:7b34:639a]) by KL1PR03MB7221.apcprd03.prod.outlook.com
 ([fe80::66e9:429b:7b34:639a%5]) with mapi id 15.20.6565.016; Fri, 7 Jul 2023
 04:08:06 +0000
Message-ID: <508344ff-6cb7-0658-89ae-c6873079e1b3@amlogic.com>
Date: Fri, 7 Jul 2023 12:07:59 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 2/2] pinctrl: Add driver support for Amlogic C3 SoCs
To: Andy Shevchenko <andy@kernel.org>
Cc: linus.walleij@linaro.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, brgl@bgdev.pl,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20230706114522.2490655-1-huqiang.qin@amlogic.com>
 <20230706114522.2490655-3-huqiang.qin@amlogic.com>
 <ZKazwMpmsNzBuWA7@smile.fi.intel.com>
Content-Language: en-US
From: Huqiang Qin <huqiang.qin@amlogic.com>
In-Reply-To: <ZKazwMpmsNzBuWA7@smile.fi.intel.com>
X-ClientProxiedBy: TY2PR04CA0012.apcprd04.prod.outlook.com
 (2603:1096:404:f6::24) To KL1PR03MB7221.apcprd03.prod.outlook.com
 (2603:1096:820:cb::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB7221:EE_|TYZPR03MB5215:EE_
X-MS-Office365-Filtering-Correlation-Id: a9204bd0-7a4f-478b-601c-08db7e9fc41f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JhDhgdnkX1WvcnYUhbM+meg2S3TUh+wdh+QUC8x6vmD67ZszMltoScMoqCICBQUKoRQKFAy1FD6TzsLLGEY0bbeBNbzjNBjEtz8hz5lnPXLl6pP2NWaMbK8QhhU1NexOe5smsgj/42mDg9SQGvbIf0IOKTxolG0iW+QKeAl3RyDgSBQDQG2i4/s7U1b80K9YgsNvM986rxjnlCVAhGiDEsuKBDmmYyzDD+9A4T7EFksdAEH+H61bJ8YaigYKzO81hMViqIn2AITLAeXpAOkqoVsDm/tU/A1sYN7sn/+xqARjFJsGWazRaxP1rP6RexTtVuobU/0KKvJkBACCeRGtdWPo/+hRqwZOnTxmhxGi6NIbRRdV0nn6ZwBTX5YAUjGOwWaUu8LoypztBNlflf8jODgcY/kwHKoGnzOAkoAqJNw3cRq8C1i2LgWx72/veoahnk13KDCUmHfo1K9cxj0Xl4Ub+yxyFyaJnEPSGUg9H/LMI1nCcsCKLIZ9py7FHzuDNCzQcW8MH18ugLoDS7Fdh36ocdBkLzumaUIWAO7SqifQgNWAnre0zudFxAPfjBHX2KSZkILqs/X5kPOTT28XCiu5mp/JJVT5O4rJbXtQZd/db1lumMd1CL4linVSTJsAFUaFo6EyeV0eAuLf2Bwb9GHpPqg7qgKB+Fj5XXmNGXmZEmfkQOAxNOQeO1ANpFTfJjVZn98BxCkeoc/BWOPnk2T18K0viv08ZlIA6mnH0sE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB7221.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(6029001)(4636009)(136003)(396003)(346002)(376002)(39850400004)(366004)(451199021)(2616005)(2906002)(83380400001)(66476007)(66556008)(6916009)(4326008)(6486002)(66946007)(316002)(52116002)(6666004)(478600001)(5660300002)(6512007)(26005)(6506007)(44832011)(186003)(53546011)(7416002)(41300700001)(8936002)(8676002)(38350700002)(38100700002)(36756003)(31696002)(86362001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UUxIQ3Fnc214VW93eVJjMkhJeExYNnZhWmpIWTdTRTJBdnliWjQ5R0c1TEE0?=
 =?utf-8?B?b3ZYR0Myd3pzOVF5WGNGVVRXZzB5OC9ZRWJGU1hLelBaUm1PTEg3RW16Nkxk?=
 =?utf-8?B?NVQ4OE90OHIxUndxdUs2Y2U1TFg2Q0VnNzFlcTdHSGZrTzZweE9zdWJQV0xl?=
 =?utf-8?B?TC92NW4vekU0cUZjUmQ2TWtONTNIOU83QTAxSnhYVXBKUWIxWXY5cW9kTHJE?=
 =?utf-8?B?dkQwdXNyaXh5OTk3ZnNCbWY1clRYVUxoWmNZQml5NS9Ib2x4YWFmU2FJTk9C?=
 =?utf-8?B?a0xOQVYzNTdPc0NjMzFlVnVPeVRwZlB4ZG1aWGJaVUJBQS8xZkRkbzZtUS9D?=
 =?utf-8?B?UmJXSzlmWkJ5MDZCVnE5MlkvemhYTHhCWE4yMG9Lbzh3UGROanlFRWhBRXF0?=
 =?utf-8?B?RnpTN2ZHdUc2VzNEUHpiTDhPR3hicVo0STVRcWd0MnJyaSsrTEhWcTladnd1?=
 =?utf-8?B?aVhFdk9hYjJoYjluY1dCQmdzZkhCeXlXRFJKT3AyYlRoQ21xUWxXWTRMTjNa?=
 =?utf-8?B?blJqN0VYZit2NW5WZ2MxR1RGMXZ5T3lKWGg5REovWTF1K0Nnc0dqTzVWY0R3?=
 =?utf-8?B?SXlWM2RMSUpGdU1ITi9rRms0Ync4dUpyRzNOVGJMY2xoTUZDakk2VGpFZzVR?=
 =?utf-8?B?WElVNGl4Zi9YaC9ocHYvNHRNNDJpWHJZTWx5T1loczlaa2xCYjBpYVpXdU16?=
 =?utf-8?B?RG9LQkc3ZkFReG9ldFY0cEJPdzdsQ0hpSnpxRUdvNlpPaTlsdGNCT1lqcE5X?=
 =?utf-8?B?cW55Z0JOWmJYdlIxTk5TTDNkMnorNmxDMmQ2aG9BMFVGWDF6TVdobU5SOXFa?=
 =?utf-8?B?SWNkTVNSeGtlditucVVlREZvVUFDU014cWZsSlAxNnNpMUM0d0NEaVRncVZC?=
 =?utf-8?B?dTZHeDllNkd6YzFzMnIxc0NJeStXUlU5NHFabldVSTRpd0VmNXNsTEdGdnEr?=
 =?utf-8?B?eDAzZU0wM3VQL3UvSDltWGpuZUhDR2tvUTRNSThQK1gxTkhZb1hndzllSEkr?=
 =?utf-8?B?NGMwaDI3TEo1dmdHdVV5OEU5OUw3UTgvb05QbFlTaVZyVll0UEh2TXNYSTBw?=
 =?utf-8?B?d1c5NzVuMGNqd0UzSHpobmtzbXJrUkhnbXpmMzJkK3BzN1ZzRVF2WXpUejBQ?=
 =?utf-8?B?Mkg0eVJMbGRTRlBXenhSOTFTVzZwbXE0SGZDcGdjdHR4aEhNZzgwcUcwbjhU?=
 =?utf-8?B?NG5OOXkyQkZhaVhuWjV5V3g5WkdXbTBOK3FSRE10clJySjZwT1dCNGN4Q2FD?=
 =?utf-8?B?ZTZsYnZNK05BQmdlL0xOQSsrQTk5U2s0YVJLMlYwTTdmKzNEVWFpdW1sMXQ5?=
 =?utf-8?B?SUF0VXd5MTlOTnlqdDhPR1pGTjdUWUxITzlVMUV4aGxSamdnaTIvYm8zTFl6?=
 =?utf-8?B?ejNCNFRCZkNtMFM4M04vQ1ViRyt1UVNwYnI2T0xsMlBST3IzUHREVGVZWmYv?=
 =?utf-8?B?bXUxY3orWkhOcFh2SzVtblZxQUh1bEtvcmg3NlZISk5hRlhnTEpGcWpWSFlt?=
 =?utf-8?B?TEhQZ0IrUEZvQ3ViUk85a2R1QkdZZFVWdHNLR20rS1Vud1QzaDVzUW45dXBG?=
 =?utf-8?B?L1BVcEdDOHh2eDZUUkczZHVmTktwS3lrSVd3aGlubmZZM3VFbHJXdjBrb0xT?=
 =?utf-8?B?bFc1QlFGL2ZnOFMyNHFPd2d1UnlTbGpLam00Szl3TXAvM3JTTWZudVN3RUZz?=
 =?utf-8?B?M3hQOWJKQXNwOWUwYS9MSXZNS01LNWs0cVU3WnM5Sm9uc0VGWDc4UWZXR2hu?=
 =?utf-8?B?VjRGWlRkMHNEYld0U2xDSkMrRS82REpSTGxXUVhLanVSOEVPbmxJTUR3QkpT?=
 =?utf-8?B?MEJnM014Ui9Ja2p2bGRScElrMkZ5aHN2QUVCZTN3Ym1HcGkwVmVQKytmcGxI?=
 =?utf-8?B?SG5zWTdqVjBxdmQ3UjZGZEEwcklXeFhhN2JWL0RwV1ZvblJHVUZmT1E4Vk9z?=
 =?utf-8?B?ZTdsU2E0SkRkNkU2eGFyTFNVMmJ5bktveWFBZmFkd3R6UEJQNmdUVVVLS3lF?=
 =?utf-8?B?TXc3RCtOMWRqaXNtUStYUVFrVjNWTEQvVDkydFNpM1EySi9GVkduODYrZXF2?=
 =?utf-8?B?SG1iMnN3RzJ1ZTVjRWF0bG9SdFN5Wm5PTTl3OXpNbjdqZlNZR2xheU5iQ01r?=
 =?utf-8?B?VkNHZkl5c0lBMUQrSTRKWWVFY3R6c0c2b3FNbUxadVVCN0ZHbVUvOG5wQjRD?=
 =?utf-8?B?N0E9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9204bd0-7a4f-478b-601c-08db7e9fc41f
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB7221.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2023 04:08:06.2592
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3gwKenrljWCQKMO/haa2/UnSD3VN6jZrTZ8R+p26jxldP9T2MkOL5t+7Pg5cTUHOOFu3i8W5pust+9FNzXTTCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB5215
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230706_210816_877146_F53A775D 
X-CRM114-Status: GOOD (  19.33  )
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

Hi Andy Shevchenko,


On 2023/7/6 20:29, Andy Shevchenko wrote:
> 
> On Thu, Jul 06, 2023 at 07:45:22PM +0800, Huqiang Qin wrote:
>> Add new pinctrl driver for Amlogic C3 SoCs which share the
> 
> a new

Okay

> 
>> same register layout as the previous Amloigc S4
> 
> Missing period at the end.

Okay

> 
> ...
> 
>> +config PINCTRL_AMLOGIC_C3
>> +     tristate "Amlogic C3 SoC pinctrl driver"
>> +     depends on ARM64
>> +     select PINCTRL_MESON_AXG_PMX
>> +     default y
> 
> This default seems a bad cargo cult. Why ARM64 kernel should have all them be
> opt-out, instead of opt-in? Shouldn't this be a distro problem?

The Kconfig structure is as follows:

menuconfig PINCTRL_MESON
	tristate "Amlogic SoC pinctrl drivers"
	depends on ARCH_MESON || COMPILE_TEST
	...

if PINCTRL_MESON
...
config PINCTRL_AMLOGIC_C3
	tristate "Amlogic C3 SoC pinctrl driver"
	depends on ARM64
	select PINCTRL_MESON_AXG_PMX
	default y

endif

When ARCH_MESON is not selected, all pinctrl drivers of Amlogic will not be compiled by default

> 
> ...
> 
>> +     MESON_PIN(GPIO_TEST_N)
> 
> Is it real one?

Yes, it's real GPIO and supports interrupts, similar to Amlogic S4 SoC

> 
>> +};
> 
> ...
> 
>> +     /* Bank A func6 */
>> +     GROUP(spi_a_mosi_a,             6),
>> +     GROUP(gen_clk_a4,               6),
>> +     GROUP(clk12_24_a,               6)
> 
> Leave trailing comma here as it's not a terminator.

Okay

> 
> ...
> 
>> +static const char * const i2c2_groups[] = {
>> +     "i2c2_sda", "i2c2_scl"
> 
> Ditto.

Okay

> 
>> +};
>> +
>> +static const char * const i2c3_groups[] = {
>> +     "i2c3_sda_c", "i2c3_scl_c",
>> +     "i2c3_sda_x", "i2c3_scl_x",
>> +     "i2c3_sda_d", "i2c3_scl_d"
> 
> Ditto.

Okay

> 
>> +};
> 
> ...
> 
>> +#ifdef CONFIG_OF
> 
> Drop this ugly ifdeffery.

Okay

> 
>> +static const struct of_device_id c3_pinctrl_dt_match[] = {
>> +     {
>> +             .compatible = "amlogic,c3-periphs-pinctrl",
>> +             .data = &c3_periphs_pinctrl_data,
>> +     },
>> +     { },
> 
> No comma for the terminator.

Okay

> 
>> +};
>> +MODULE_DEVICE_TABLE(of, c3_pinctrl_dt_match);
>> +#endif /* CONFIG_OF */
>> +
>> +static struct platform_driver c3_pinctrl_driver = {
>> +     .probe  = meson_pinctrl_probe,
>> +     .driver = {
>> +             .name = "amlogic-c3-pinctrl",
> 
>> +             .of_match_table = of_match_ptr(c3_pinctrl_dt_match),
> 
> Drop the rather problematic of_match_ptr().

Okay

> 
>> +     },
>> +};
> 
> --
> With Best Regards,
> Andy Shevchenko
> 
> 
> 


Best Regards,
Huqiang Qin


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
