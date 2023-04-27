Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61ECEC77B61
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Apr 2023 09:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GWsf9ke6JZEdrbDuq2AcWvK9TVpnvHcbQ6iQPSCqrXI=; b=d0kf8DFi2w/3fZEr/Tof5p9qmB
	ePKA32bksUJ05FQ4GhzZmkxVMsOhSUbXPWtaOYcAvnMdZtpZAwN18xlSYnv0dpYaW5Z7TMY15yIcS
	zwVNuTsME5iCbD8YHx3igHaOhU5DdYfnYpnuvk8yLu4sNGNz7OMzKeLxDywUpTL93eRgfD0iSsKS9
	e45rZ45V6Vmo3c4lcm0AaeyxHoP6KkS5btyIojXfYOZgEKLr7NbSBUU82n43nV1GAaFqs2aya+QjR
	5nXGErrMAuKToc1yCVMQ4bzbRds64Yv4nnDnhWBElWA05g6GK8gYNKK8KkDQezC4PTQ4CeEK66mnN
	VZrjVcEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prxrJ-005yoT-2h;
	Thu, 27 Apr 2023 09:24:13 +0000
Received: from mail-tyzapc01on20707.outbound.protection.outlook.com ([2a01:111:f403:704b::707] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prxrG-005yn2-0K;
	Thu, 27 Apr 2023 09:24:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V4lfbJ+N7UxsrqW21HoDC+YHG+BOQ+yk8BgWsAWZ6wp/UAy38pPEpmk7JUS4jCrygo2iB+oYJHMSfQktVOwteSj0SlwgycsUeXn32/tg+/hyROZVxBM+5VUGDYJY0R1imlA90mp7m4SAfrV1S1Ebxxl8mFClOq2pziytrFBwCqzOTYl1dsBTVaPEkqJ8Jiz5QR/i0q6HuPXTf1iB4C3EgBAzd29Fe4FoboeZj65pV3uEUPEhQgnS+F3IG5HKNskpUhSpfYkkDGXjAkBzcQ/J87jbzgd42D6gkXNT8fuEtHaHTKfn8g8X3GrSgGvxi4C8n3IZYTN1uUms/LpamCodIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EEAP1kd7Gsw1rT1BL/l1C3KIcmxNeczLhoxFAmhvXSY=;
 b=iKABgnLedcBlCns1ke5yR0At3Ak7x/RFTlASeDA9BYPA8jtfgpKJg1BVpOfkIBkkKQfGytdyLAFN8PfvdxV1JgcyEGUSL09wYW0ZIe+50eqQulUBkyOdSzX7B4GHynxSohdWZel/jDYhcMy/XpP3HZQTIBSduS/zDzVJkwH1HkBOz0PEkutDli7EPPedsW41OAmNNxNE2nM3elCV0p1tN/88Ssg6Qiq+IL10hHhaWuSOMsXS4abY+G1RTvk4ZA7nRzMM+8uSEeY+GU7rleGcnyalEhGV5fNR/9htV7Q1lk61YeP+AG+9V100YTfZOeGe3O924TOMvVRBDobdEjTqBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EEAP1kd7Gsw1rT1BL/l1C3KIcmxNeczLhoxFAmhvXSY=;
 b=gputZezqqWwLvtwVbtCQq9UnmP9HQaMJyM0zqTQAMIKTukhtocgJo/BzUiuZi3rFT/j1hDPDOSZrCN8adLqnkkTZ0WgqgILkw4UoEI5oTcB+BttAk4W39VUGFjQAfUlE4G2Pvn0j35+Q1nfRETgRHffD3TBXvck1kqqP0wtl7+Tzcv/y0QGqTQxdJ5Rr1oKptfeJ6H6twKNGZ9AjOVoSdkFYwSOJ84N6la36frtDQWkQEvqgtxRPbEmSJkP7hnhBiSiYE/sHyIeByictvuXdqHXXuxSmPRvPFGv5oE/rbutEBENSzFfdpM4OsgiV0QZpEOJzbATTq8AYoob8J+lQdQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from SEZPR03MB7033.apcprd03.prod.outlook.com (2603:1096:101:e2::14)
 by TYZPR03MB5648.apcprd03.prod.outlook.com (2603:1096:400:56::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.21; Thu, 27 Apr
 2023 09:24:04 +0000
Received: from SEZPR03MB7033.apcprd03.prod.outlook.com
 ([fe80::9d77:7adc:25da:b086]) by SEZPR03MB7033.apcprd03.prod.outlook.com
 ([fe80::9d77:7adc:25da:b086%3]) with mapi id 15.20.6340.020; Thu, 27 Apr 2023
 09:24:04 +0000
Message-ID: <dec4ab5a-acee-6dee-b4b9-edcd677c5cae@amlogic.com>
Date: Thu, 27 Apr 2023 17:23:55 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [RFC PATCH 1/2] arm64: amlogic: add new ARCH_AMLIPC for IPC SoC
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Dmitry Rokosov <ddrokosov@sberdevices.ru>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: =Xianwei Zhao <xianwei.zhao@amlogic.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230419073834.972273-1-xianwei.zhao@amlogic.com>
 <20230419073834.972273-2-xianwei.zhao@amlogic.com>
 <20230419131416.cns3xvkbzjeyrnux@CAB-WSD-L081021>
 <661cea17-a4dd-75d1-6a7e-16efa5aea52b@linaro.org>
 <20230419160405.d7qfir3nv6tlxx2a@CAB-WSD-L081021>
 <427e79ef-156d-027e-9296-6f4e6513a04d@linaro.org>
 <20230419170043.auzfa32weevmrt4e@CAB-WSD-L081021>
 <1c7322c9-8d2d-1cd1-95dc-dd9ec861981f@amlogic.com>
 <a28766ff-39aa-7e10-394a-6f4db524fff9@linaro.org>
From: Kelvin Zhang <kelvin.zhang@amlogic.com>
In-Reply-To: <a28766ff-39aa-7e10-394a-6f4db524fff9@linaro.org>
X-ClientProxiedBy: SI2PR02CA0033.apcprd02.prod.outlook.com
 (2603:1096:4:195::20) To SEZPR03MB7033.apcprd03.prod.outlook.com
 (2603:1096:101:e2::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR03MB7033:EE_|TYZPR03MB5648:EE_
X-MS-Office365-Filtering-Correlation-Id: bb52faf7-7b63-4d67-20b4-08db47012513
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	BcECIMN8/Bqi6Kq0KY1k6f2Tt1lSKcSgfpbwIFYCO7VwhdWh9a/huzcMT/+E3Wz7PZAq1vbkHI0KfTo0q+oStsvG43D3rMIMMrk4f7AOupw9YNslvJEhmu8WT8oXEOIedM6R/f+uv6foAULktDVDzfXzdt5ArziofSBtBtHysGXELT9h6KOgcE3LNkkJKETtzy3fTjTGs08b9K8hFKQ7NJwo0nqhlSKh+sAr+S5vF4IWWeXR0aJw87lxKpr7y+NcErneBwNg03rVPvwb7NC9yu86dF42z6+Xzbfd7jjvnE6LXVsSMzaJlmZR/Loatu++u+LmavmNigoHL5sGJwOLj4pIxKpX5MFW8mM5N3J4F1iShWjS3Wwzet1rlmVcEUpHhT9jBJokiN2kdR1nBaIThrWpEmS3+bUuG4P8uUtyWkLH/Qnl/Xyn3Ek7ern3N466H1qq9ghKHaY5rHTd+d6C2d/rQvUdWMheWSqX9QRValfzrLOnkrb4bdj8LskcXk7bbyJmsmZ/6JtSb4xa6w/l3EoEpcMg8ILzIQK5xKfFL1DLbYyLCK9bL56UhWTcDqsfuKJDc4NtkgUFDx78jfCnD6y1OVrIbNuSJAxO40JnJ91msJPIQGo4aZQEmo/TnBIvMnel6tAyiTXg7abyYBDP3w==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR03MB7033.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(39850400004)(376002)(366004)(136003)(396003)(451199021)(44832011)(38100700002)(7416002)(5660300002)(2906002)(8936002)(8676002)(36756003)(86362001)(31696002)(6486002)(6666004)(26005)(6512007)(6506007)(54906003)(478600001)(2616005)(186003)(31686004)(66946007)(66556008)(53546011)(66476007)(316002)(41300700001)(4326008)(110136005)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?bDY3b2FoMGU3bmQxSEMvUFU4YkF3eGM3UEVwODBweGdkYTBweDQ1RXBrYUp4?=
 =?utf-8?B?Q1g3SGJ0U2pJOUkrVWZvSHB1TWtsQXpybmRGV2QrcVRZa1JNcE9SWGZNOFFw?=
 =?utf-8?B?Nk9WNmMrR3R0dm9LTkpMdVZUUmd4emg3cU5SWXVRQWtIazVGYzk3WXlIbENN?=
 =?utf-8?B?dGZETjJocXMydXBRRVN0cWdpOFQ1LzdGWDMzRG9zcGRoaDZ5M3F3MHlMbExh?=
 =?utf-8?B?SDQ0R1dYTjFxNW4xWXB3VGRmUHl1clVLc2xGMDFPT1BQOVBvMUVkeEpjL282?=
 =?utf-8?B?VG0xeklWRzk1QlIrcUVqK3ErR010K2lQcXdvUkRjak5xYWZZQzNydyt6dklq?=
 =?utf-8?B?WkJ0YU1PLzl0MUJQaitRb0xsOWdUcnprM2VLZGlTWEtWeDhZZFVlcWJmNm5p?=
 =?utf-8?B?cjdYNFJrcmkvU0orakpTUmpBYllQWWJuWDdNS05WSWY5a2ZUNEZRays1WDNR?=
 =?utf-8?B?ejY3alRXdWE3bjJuMTM0aVJXNGtiZS9kbWYvR1g1dktIRm5NbWxiM00yVnJH?=
 =?utf-8?B?U2RnSk41SmxWRTdWNEYxVWZYcUtxSmJydGdoMDJLamI0ZmtoSDdOTlBBL1Ru?=
 =?utf-8?B?am52eGpkdkJ4UHpMTW1COHNxVmg1UEhJaEhpVUcweVFSQTRmMlJQQU1RemZw?=
 =?utf-8?B?VkpmWENBcnRNV2U1Y1NTNThhYm5rOFFGU1lLeUVka24rQTBtV2VjdUNpdzEz?=
 =?utf-8?B?UmJuc3oyblhZVHhLdUhJSzhJdklPeGpta2lwdmJ4OFExUUgzeGJuQnVOMThF?=
 =?utf-8?B?K21NbGE3L0NZSG9yaHhpb3QvM2tvNUxhSzYwS1BCUGU2QW5Nc3gyYTgwaGl6?=
 =?utf-8?B?SUFSQ1g5TUtYdXMyUXIydVI4YXdtNEcveHh2MTJiTTI0YWM3Vis3dHRwQlVB?=
 =?utf-8?B?MkV5Nk1aeURSRElFWmVITkRrV25NazFyVGZwWUNCTzBnbitHOWdteVpJN1FJ?=
 =?utf-8?B?aTZlcjFYRzk2QUJTWEFQVzNzU2MxNU9qTjgzaHRDMVZQMlBhS2xzVVZNWGVB?=
 =?utf-8?B?bkJLZkEzLzVGc2ZLbEJiMHdPSDgvZTNUemo0azlvSDlaNm84YnhiV0M4OXU3?=
 =?utf-8?B?MmVSU285YnR5Ync0SGQvTGxWVDFoUXByYUQxOHk2NW5jdXlYcEFUVWlGS1Vq?=
 =?utf-8?B?d2VqZ2djRUZkMGNDNWtYMnpvTEtTNWFwYURJdkNQNmlFeXRSaDVGZnYrUXpm?=
 =?utf-8?B?Z05aMG5qRi9ZQVEyeWliUzgxM3h3NjdESjFTS09lNFFscWwxYmFPQlBxNWk1?=
 =?utf-8?B?NlM5QXA4alBSTTNsRklzbWRKN0hZd21qekZLblg4R2ZHMzVMZmZiaHdMaHBB?=
 =?utf-8?B?N28xVFN5WGlSWCtHMVVKMjFFZXQ2ZS9kbHJrZDBady8xMHRNMWQ5VVliZTAr?=
 =?utf-8?B?Y2ZRK0ZtdWU0QjdwZmtpYWtNRmoyc0pCcWlWZWdpejVpcDJ6UGNxTHF4VnRh?=
 =?utf-8?B?cHFwVC8zUDNkZGZCVTJIMk8wZU5vaFJjTXk2aFkwOEI2YStIeERET0JrNHhW?=
 =?utf-8?B?OWpvSVNWdHdZd1pDQ2VkeUxQbzNDVVdjZGFGWWRyYTJsUVN0YlRoZFpSTjU2?=
 =?utf-8?B?OG9PSWhZOGp4SUQybEgwMWIxdWJCVmxXT3JHV09OcUI0Rm0zQlBlNnRSWER0?=
 =?utf-8?B?aWcwcXVSdVE3L0RHUkxBTTlOQnMrK0FFT2ZvcmdzMnZta0piaXAxNWtTb1hQ?=
 =?utf-8?B?Sy9nSkg4VGVPdGhIRmUyK0F4bEVuT01BZjh6Ym9sRzUzY1NjeG02Wnd6cVNU?=
 =?utf-8?B?SEsrNkVFczJLb2hxdWhzb3puWjlwQ1ZFOW1PTEdtUTRpS2hUSU9PZ3hmNnFz?=
 =?utf-8?B?emluaFRBMFdmNCtDSjJSUUtldDNOZUE0dlNNWm81d1dVM2FwYUtJOHBBa3hN?=
 =?utf-8?B?allDUWRERVlzUXd5VVAvK0NBSW1mY0dhV0t0d3FNbzZ0UnVmdEN5R0F6d25V?=
 =?utf-8?B?ODF0WWNkTHBGcGtTZjRLd1dncDlFRVRwOUFhY2Z2Z25udWc2MGVPQ2h3S3U5?=
 =?utf-8?B?Qm1XNXFxdlJTN3g3Z2w0b0hFOWN5R25Hczg3bWRGMjJsZEwyT0FocUZsM1Fq?=
 =?utf-8?B?ZXArMGhBTzZVZXR2QzhnaEZwaTNEN0prQW1RSXNUTjQ1cHUvMU1RdElCQ0Nk?=
 =?utf-8?B?d2NMSXhVM21TUEhBRk9hZjFVR3RSY3cvNXVpS3BHN3BjbWZ0em82WkZGSTB0?=
 =?utf-8?B?V1E9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb52faf7-7b63-4d67-20b4-08db47012513
X-MS-Exchange-CrossTenant-AuthSource: SEZPR03MB7033.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2023 09:24:04.8213
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tF+L5m2/TxexDqDROlLUrHYtm/M8TRIXvEk0jQc4UDjdA7OxFQkUiP9FbviEIz2xrLBmafa2eIKB/MPYqdhPkYzVlPHL1qxYLTfsnhqhG3c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB5648
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230427_022410_146403_26878600 
X-CRM114-Status: GOOD (  25.78  )
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


On 2023/4/20 20:39, Krzysztof Kozlowski wrote:
> [ EXTERNAL EMAIL ]
> 
> On 20/04/2023 10:43, Kelvin Zhang wrote:
>>>>>>>> +config ARCH_AMLIPC
>>>>>>> Do we really need a different ARCH for Amlogic IPC?
>>>>>>> I can imagine that it's not the Meson architecture at all.
>>>>>>> But maybe a better solution is just to rename ARCH_MESON to ARCH_AMLOGIC?
>>>>>> It should be changed treewide, and is it worth it ?
>>>>> As far as I understand, the A1 and S4 families are not fully compatible
>>>>> with the Meson architecture, and we haven't provided additional ARCH_*
>>>>> for them.
>>>> The GXBB, GXL/GXM, G12A, G12B & SM1 are also not fully compatible,
>>>> but they lie under the "MESON" umbrella which covers SoC since the
>>>> Meson6 architecture. It's a facility to include/exclude Amlogic
>>>> drivers/DT, nothing else.
>> GXBB, GXL/GXM, G12A, G12B , SM1 and S4 belong to media box.
>> So, "MESON" represents the media box series.
>> Up to now, "MESON" works well for all existing chips except A1 and AXG.
>>>> If you compare it to BCM or NXP, it's different situation, the
>>>> different ARCH_* actually targets totally different SoCs from
>>>> completely different Business Units or from companies acquisitions.
>> Firstly, the new C series is totally different from previous MESON series.
>>   From the perspective of application, the new C series is designed for
>> smart IP camera applications,
>> while MESON series is designed for hybrid OTT/ IP Set Top Box  and
>> high-end media box applications.
>>   From the perspective of architecture, the new C series integrates the
>> sensor interface, image signal processing unit, Dewarp, video encoder,
>> neural networking processing unit,

These new drivers are still under development.

>> which MESON series does not and will never have.
>> Secondly, there are C1 and C2 besides C3.
>> Moreover, more other series are on the way, such as T series.
>> If we always stick to "MESON", people will get more and more confused.
>> Therefore, I think it is the right time to add ARCH_AMLIPC.
> 
> Your DTS uses compatibles from meson, so I would argue that it is still
> part of the same architecture.
> 
So far, this patch only contains basic peripherals, which are reused IPs.

> Anyway, this is just config symbol, so it does not matter. There will be
> no confusion and no problem of keeping it ARCH_MESON.
> 
> 
>>>> We should have named it ARCH_AMLOGIC since the beginning, but we
>>>> can't change history.
>> Shouldn't we deserve a chance to make it right?
>>>>> In my opinion, it's a good time to split the Meson architecture into
>>>>> proper subsets, or rename it treewide (maybe only config option
>>>>> ARCH_MESON => ARCH_AMLOGIC).
>>>> MESON is only a codename to differentiate from other SoC vendors
>>>> because Amlogic used it as a codename for a long time.
>>>> Compare this to Allwinner's "sunxi" or Qualcomm's "msm".
>>>>
>>>> This config has no functional mean, it's only a config namespace.
>>>>
>>>> Renaming it would need renaming it in all subsystems Kconfig/Makefiles
>>>> and will certainly break builds with custom kernel configs
>>>> in various publicly used builds like Armbian, meta-meson, LibreELEC,
>>>> Debian, Suse, ...
>> Let's get back to ARCH_AMLIPC.
>> We just need to add ARCH_AMLIPC in the necessary subsystems
>> Kconfig/Makefile.
>> This change will keep the existing MESON related code,  and will neither
>> involve renaming nor break any builds.
> 
> It is also not necessary and not justified. We do not have multiple
> top-level subarchs for one architecture. We had such talks already and
> there was no consensus to change it.

Got it.
Thanks!
> 
> Best regards,
> Krzysztof
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
