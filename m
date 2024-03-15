Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E357C54E58
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 Mar 2024 08:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X30VgAutXjLYboDlWfce05cAuerqrz8EQtlL/5sYWt4=; b=JmG6GRFOm4oc8/ojdUmiOGysjB
	9JBOjAdzzf5zX3fLLiWCWE/M+e+Tu5VS98nXiL5WEefK3dv5vSzML2EaA//2ioZq3IRTXx8ufxocp
	DJXUqTzRnhcDHaxaGDTjd95DX7x72IYoxdaxNsMeXZPm4tYLAGGZMhEOOClcyVyYb9PFEQQQc0osl
	Ctdtub5cYddu0jnwzGd9Iaguf11ZE21uTtJbABJECY+j1eYPrLBscIFy5PNVf5KXC8o0N1sR0VNHI
	FUX5IUzlnzGRTfgDAsoVErrrLaXsOiFo5WQhqQCpm4bhjcyeiO5/99grd6fAYA4RTXr/a6JP2W15p
	e59Trk+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl3FN-0000000HDpy-1R59;
	Fri, 15 Mar 2024 08:49:01 +0000
Received: from mail-tyzapc01on20700.outbound.protection.outlook.com ([2a01:111:f403:2011::700] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl3FJ-0000000HDp6-2VaZ;
	Fri, 15 Mar 2024 08:48:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iU6BM1cPk4Ugk9nuK7dc4hE6ZzrmMr3xRp6iEFUWBSmhp0ApXf8kTzzKjALx8K0pqPXtVJP9Gv8aGpA8K7RJz9nprq8tRRwv3NMpW03ZMQUxay49I6dXJpu/utZewHWOVB6T0IloPmQVtmWv59eVWrzWtky2qCThzWMTWndHiznTx65Oh7MehYa1gYVBDDdny1pdDxYGlnYW8DVsqNnapupBcR/JggVJYAVqeeLtb+Yey6zi+afsyUx1giHBZZ1QAC1VlBFL3me5QejgzxsYmrF1UWqdQ+r5eWcHEJNXO5YbvPP0vzsnjAY44kLJd4tzZg8pb+nt6U2Tt3S6nDRl/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oLZHAHdsGpjOGZdgTPiRO2NMM0AoHmv8EirUrXbdH10=;
 b=fwOca8RByK2I7Mt6uYZsksW6ZgWhkcu5wagIt9p+ERGARUAeAlhAknge7GekiOF0NUhXwzfRWywW5Dkop3kCXuJILqgG2MrUHY/9WNiQv7ceKBcbA3KbttQO/HZXmChpGj/J8ewWgcM7VY+R4ix4iHQeipmzEBTGdK7qYmbvrUkws6X7zfC1EJdYA+XC7MF0pG2cXmRBPoC5VaONVkonBsyECt9lXHPPGaVvCSml9ni6XJoMQP+BEFKXKn/tfLWMxQ2e6N295f1UG7IU+UCdT/n4RUVLYYFdfDq5V6Yi4wgjUwDGil1J0rVDUOopEE77NFQHjj8ru030pJz7rJ5RcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oLZHAHdsGpjOGZdgTPiRO2NMM0AoHmv8EirUrXbdH10=;
 b=GxFR8uRqAAMnD61MtPjWBeqGSSomjpPI5vsuIR6tpsQNVMalFJiNQm3oWeEemKCbT7ux90pEnTv+no5pol/jgnBmSo0EGIJzooVhwdab0wSRP6hcOxOJyc3dX3+zHhDsSL6MCU7jM4Rl/oMnFejdHnHdTvAsJBVmOwpZtrh2Lhk3u2AonAgWLJkdIRZWwQwUp8P1dYLmnvjNYAcTTG45x0lcGVosXNQYWbI+edu6eGwNUr2eQG5oos0agZxo+4hIxd0jaGrnGAqtAeSKgYsn5Pyf6Cd1akCfb/PnPrp+gZe/Z2x57tK9yw107lan3M4GQdLVMCH/vFdhRgRKoUVo3Q==
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by TYZPR03MB8657.apcprd03.prod.outlook.com (2603:1096:405:b4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.21; Fri, 15 Mar
 2024 08:48:50 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::5198:1b2f:8889:17b]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::5198:1b2f:8889:17b%4]) with mapi id 15.20.7362.035; Fri, 15 Mar 2024
 08:48:50 +0000
Message-ID: <fee79370-b992-46a0-a675-80b913d48e05@amlogic.com>
Date: Fri, 15 Mar 2024 16:48:40 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: add support for A4 based Amlogic BA400
Content-Language: en-US
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
References: <20240312-basic_dt-v1-0-7f11df3a0896@amlogic.com>
 <20240312-basic_dt-v1-3-7f11df3a0896@amlogic.com>
 <1jsf0vephv.fsf@starbuckisacylon.baylibre.com>
 <9a38fd52-5eea-468d-bd7c-29a505503268@amlogic.com>
 <1jcyrxi2l0.fsf@starbuckisacylon.baylibre.com>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <1jcyrxi2l0.fsf@starbuckisacylon.baylibre.com>
X-ClientProxiedBy: SI2PR04CA0018.apcprd04.prod.outlook.com
 (2603:1096:4:197::9) To TYZPR03MB6896.apcprd03.prod.outlook.com
 (2603:1096:400:289::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|TYZPR03MB8657:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yRjru0q2pcrRPApF4LZip/MOM+B3Fh+CXZJbtTn0K5Vso08ddrpAMVEnrmRd2yNvvUYmY/tsROPUQ2wdVpJMgHNHX+0n56rA47/i4TtUSI2fAsdRtPBfuCfVRTc1U8i8FN8F3gFZZMdDXmjXxDpFIx4GFmnlf+d2l7HSl1lWv8TKFlV0fIrGH8buHj1+xCV1mKhLWB6F+kgfd664HWQo7RyMntcO/aFnUYLY6YXbD//Dx6k4sqqz40W65elbsyLFwk0JGpGleKMZ3ZConJOJQiUl+x6PMmGMEIhJEjdJLIbE1MrU2LCL8E4iKVbw2NT5aVXh69MAdvFJjNqVx4NTnmxJBFVRjA9SSJ0jhQQ8pUYOXeYuDs9nwe3LC7CID782FUpmANLFkED/XPjTjEdW/78TTAMzxlcMn+bm6rldyHJ8cfh3pTdYd09SM9QXmnfExafh15vweV/t6Fx7PJm7Oz35IfqWv8n09mosFgxJ4HolV7FuJ78jG4CI9f4ZVM3FGIEJQaCt9f8zD8vBtrhwQhdPqEsVLv4ZKgKzXjJavuaBjHGu1qVwdu1PYg1m+5GaO89L5mw3qw1Hxpxi0SzJP0IcmSMn/ZR+zP8rNleatpOU7j8qAYgZk/MarZQYv93ACkl0V9FRs5gKB0FCZcQgwhLjaEKgXS1mXvvWide8x/g=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(7416005)(376005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VUlyeHpoN2ZHb2dSK3hoblBuS00wM2wweG5wMVRab25MTFhUVEwxdUJDZ2ha?=
 =?utf-8?B?SkV1c1FJK3VmUDRJc2N3ZEdHUVZtN0dydUQ4cG5ISjI4UlJWMGtKVitTVDN1?=
 =?utf-8?B?VzRsREJ3eVBRRTJFR2NnVXZ6dDEvVllZY3BsWWxYWlBQdTdNM21uTDF6Tmh4?=
 =?utf-8?B?ZFNIZFV6VmFsdW8reFY1VUE2Z1JmeXAzdFArdnVzTjFZOHlDK1lnMXNCVm9z?=
 =?utf-8?B?Y3pRM1lncWNVMS9ObXNGa0kxb3l3NlMzak5OekRTUThMbHlhbHpnTE82czU3?=
 =?utf-8?B?TlgvdExLdnp3S2tGN2cyT25mUmtoZ0VQWTdBYmdrekZ1TUd3S282WFl2NnJ2?=
 =?utf-8?B?cFpNNzZWZjBMelR1TWV2Y3R0bTB1V1dHeWdEeTFnU0QwckIyaUZtUkhsaDUz?=
 =?utf-8?B?ZEpSZmtPMUJVNVZ2QlZBSVd0MVZmUnVTcW1veHdoaUdncGl6TWJYaUlSZlNL?=
 =?utf-8?B?cHEvenI4QVJ3UmQzNC9IS3Rvb3J5d05PZzJBMmZHUTVDWWwzYWxJZFlULzVZ?=
 =?utf-8?B?S3dhVVUxdzdKN1lRZVRmbUtoenlPaVNhb2RobzMwdis1Y3VhUW5PTjNTNEg0?=
 =?utf-8?B?dFJid3BGWlBXR0h6ODNzWExNU21uN2x6Ujk1TXFNVDY5dWtOblp6MXAzdTJ1?=
 =?utf-8?B?cHE2MGxtTGk2cmE0WnFYNXVRQ0xsSW1UaTBCRjA1b2p4aVBGYTIreXRqelBy?=
 =?utf-8?B?K0RWWEwwMGZsNHdXYXY1eHJVVFRaczhIbEFDTmUrK0MxYWxqRDk3S0hpSytq?=
 =?utf-8?B?UzVzM2JRTm9waVl3NVFxS2ZxTVFsS2trdE10QTVOV1dWVHNDZWlCL2hIUjhW?=
 =?utf-8?B?M3A3VU9UUUZJUVRoaVhqSGJuNElLQ2YyNXFJWmI2Nm1kZTQ0ek1walRaV2F6?=
 =?utf-8?B?TnR1bWFoVG5JcjI2U1l5cU50aWE3S1hQS1o5SGhwVEQ3b21oMjdZd3dsN0wr?=
 =?utf-8?B?M1lVUDdCNXVSRDNWNklOYTRTNVczRjJzRHQ3UTdtSnJxamlrU05NK0JSV0dK?=
 =?utf-8?B?T1dWcVlXNWIvUlhxTmdPOFplVGtPZTlEcFlPRWZuQmFwT3ZIaTZleGJSQlJ5?=
 =?utf-8?B?a3IzcWRhYVpjeDZHR2Yvc2l0NGtMZVBibU82WnFUaFFJYVdjVHBiZDRZTzVJ?=
 =?utf-8?B?L1VhbGpvZkpHczZicWF6elBsME5sWENwdC9PN2hEdUliQm5mNmZIUjc0YWlM?=
 =?utf-8?B?UlZwUkwzWEw1dFRHckxkdHFkNU1CYmhxR2hod29BMDFQeHpaek40NUxKWmp2?=
 =?utf-8?B?NHplWDE3Q2N4T2ZOSzdaRlIzdzY4VkljZGpxT2oxQ0NGMm5JYmszbWtKSTVl?=
 =?utf-8?B?OW1UVFJBdVNkVDNCWXkvdXNMN3pRQlc0eEFtZnZyU0JuYUh6dGZCZExxeWhX?=
 =?utf-8?B?N0pvZnIzSGlvUEJJajhFT3gwc1dwWWNONzNTMWRsN3pSSkF5Zm1KRUpBMWpo?=
 =?utf-8?B?VXgraDNlMEsxNmpGWG1CM2RHcmhISkdRNHlvUktQRkc3bnNqcjdXQjZIRnU2?=
 =?utf-8?B?UTdoZWNtT0VhQmhCRExKYnpTSlBCdndHa1dabG5RNm5JMUJtRXhLY0JUb2Q3?=
 =?utf-8?B?TmdXSFBJemM4VE01dVRDajZiU3EyNVdkWkwzdkhPVmY3Y0wyeGFIR1ZhNlUr?=
 =?utf-8?B?Y1BPSFozMXZXQzVqanBIdmJrb0lSdmo4cU1MWTdFNjBSOGFzM2RvUzJjd0dG?=
 =?utf-8?B?TE5ZVXZzYlYvSUREellBbmpBUEEwYXpSTzNtb0Z4SFgyL3MyTHVwRmd1WEVV?=
 =?utf-8?B?MHU2MU05TUNnYURBUk1EaFhKcXlKcDFhc3o0aHk2eWlHWWxxbXJrellNTU8y?=
 =?utf-8?B?aW0wM044TjFtelhBeGplK3lmOWVUSkFTZFVXOGIzRFZJenpaRnRMUG5Eb0Uw?=
 =?utf-8?B?akRhLzI0cHU3b2Q3Si93WW16V0FUK1VMSm43bFNnZ05YUm9tV2g0YTQ1OG5F?=
 =?utf-8?B?UlEvcC9PZTEvQ2doK0p2aWxFUnQxMm4xZWpDR1ovT0I2MXFhK3BVaDdnSC9o?=
 =?utf-8?B?cU9YWEIxMTc2N3M1a3VoMnRGZklEMVFmei84VmxvbWhXcGQwT0VUa1JrbUtG?=
 =?utf-8?B?eTRRUk44Ni95OUZTT0RXa0JCTzlWTHVrR2IrNEpDYXZvRG96L1NjYlBKWmF5?=
 =?utf-8?B?RGNGYUxXakpoa0lsbUw2OU9FUGUzMzliYzhSK1dNbTc2dyttRkpxc3NvNXBq?=
 =?utf-8?B?U1E9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64732050-5d10-443a-8621-08dc44ccbc67
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2024 08:48:50.6375
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kuazDdj11MSbgVrd0RwYqEZgAJA8Jj5FW5p13Mbvj/xP1yz0rWrYBYKf9J44SGWj4cM9/sdwEoRDI+8RsPJk2BBBGDHoT80GKCOzZS4R548=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB8657
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240315_014857_693208_C27DA296 
X-CRM114-Status: GOOD (  16.55  )
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

Hi Jerome,
     Thanks for your reply.

On 2024/3/14 17:26, Jerome Brunet wrote:
> [ EXTERNAL EMAIL ]
> 
> On Thu 14 Mar 2024 at 16:08, Xianwei Zhao <xianwei.zhao@amlogic.com> wrote:
> 
>>>> +
>>>> +#include "amlogic-a4.dtsi"
>>> Could you describe how the a4 and a5 differs from each other ?
>>> The description given in the commit description is the same.
>>> Beside the a53 vs a55, I'm not seeing much of a difference.
>>> Admittedly, there is not much yet but I wonder if a4 and a5 should have
>>> a common dtsi.
>>>
>> They are mostly the same, A5 include HiFi-DSP and NPU, but A4 is not. And
>> some peripheral modules are different, such as SPI and Ehernet phy.
>>
>> I would like to wait for the follow-on chips to come out before considering
>> a merger with common dtsi file.
>>
> 
> No, Please do it now. There is no reason for the community to review the
> same thing twice if the SoCs are "mostly the same".
> 
OK, I will do it.
>>>> +
>>>> +/ {
>>>> +     model = "Amlogic A113L2 ba400 Development Board";
>>>> +     compatible = "amlogic,ba400","amlogic,a4";
>>>> +     interrupt-parent = <&gic>;
>>>> +     #address-cells = <2>;
>>>> +     #size-cells = <2>;
>>>> +
>>>> +     aliases {
>>>> +             serial0 = &uart_b;
>>>> +     };
>>>> +
>>>> +     memory@0 {
>>>> +             device_type = "memory";
>>>> +             reg = <0x0 0x0 0x0 0x40000000>;
>>>> +     };
>>>> +
>>>> +     reserved-memory {
>>>> +             #address-cells = <2>;
>>>> +             #size-cells = <2>;
>>>> +             ranges;
>>>> +
>>>> +             /* 52 MiB reserved for ARM Trusted Firmware */
>>> That's a lot of memory to blindly reserve.
>>> Any chance we can stop doing that and have u-boot amend reserved memory
>>> zone based on the actual needs of the device ?
>> Yes. U-boot will change size of reserved memory base on actual usage.
> 
> Then u-boot should add (not change) the memory if necessary.
> Please drop this.
> 
Amlogic's u-boot will change the reserved memory size, size is not an 
issue. But Some one use u-boot himself not Amlogic's, If here drop this, 
there is a strange problem when it runs.
>>>
>>>> +             secmon_reserved:linux,secmon {
>>>> +                     compatible = "shared-dma-pool";
>>>> +                     no-map;
>>>> +                     alignment = <0x0 0x400000>;
>>>> +                     reg = <0x0 0x05000000 0x0 0x3400000>;
>>>> +             };
>>>> +     };
>>>> +};
>>>> +
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
