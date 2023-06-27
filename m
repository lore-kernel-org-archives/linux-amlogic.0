Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E51F3EB64DA
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 Jun 2023 02:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vXQPyT9Uy44OkFzz6XIKlPXHOwZrywwIQ/kACtXsNJQ=; b=iK7MgL/2tr0Plc+ZzoyfClTw8q
	Ao6496NrnNmuN+3I8gD1TlRAZq9cJSbs6QKrE5b/mnZtfkxXHWSLsfCZRM3R418ItlPS27iFRyVeN
	el5f8yTr1cR961Ukq0H4WVsXjgjfQSrZvlzA2ykcmz2Pn9UrKu4sj8O0w6MVxBojmzSpcVLBAeosK
	1p1oi3Ab0Vky/bnaU6TBgAPpKcCgOMy35AWtZeyZryXXR3YeEdiC5gdkx/IQvuKAPtjG9dquomcpi
	guJ37W0d0dKDTdg7P1WPqRRLUFladzwSuL4TF1+7AZsD/yznPrruyA+gC36j6h7+vp7nmiLrlP9En
	crL0qSfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDyR4-00BRoR-2x;
	Tue, 27 Jun 2023 02:28:06 +0000
Received: from mail-sgaapc01on2070b.outbound.protection.outlook.com ([2a01:111:f400:feab::70b] helo=APC01-SG2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDyQy-00BRmp-1o;
	Tue, 27 Jun 2023 02:28:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZKQGRp/pQPziTtkg2Cfc0uUurTf3buS1b5BJTFNtm0ewQXIS1I/cKrsuBVlfNCY6bVoHZuRc3nHHSEZMHp1Ur9gTaqBQmgpGja2x7MQgqfebdlDh2E4AHKsx+YqCaPAdf9+Lx+aQS9Cvg/Ju7LBZTlIRK/wc5BSXCvCsQwpkBBSkO2sfPimxfPNLvLhOpeBrvamb79+sX2DrxOvJw1ImaMm01qykHE+6jM/tDjCB0TGBO+CprhuC+XjqQRtjL0PGHdY6ErnwYyXXOUEQf1LTHKNHu2aSbBkoh9yXtMs/25Cl8jikjMuwxiPnl7uUvGTYmBunsvkbfDmqQvGnzEO8HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hjmKSOvOWabp5WhsP0C2yC4c/AZNwRce/sLAi6/bNUo=;
 b=RfrcG9VFPp6iwTSCEyuuZZbICiM0nFzwldj2pzw5pyL7iVFOp0CGjtXsS4C9YoZEfYavQtmU/3HN2XK13KkZpsCSGow0bRmC99zRLckfKyk3DYh5Plb5m28fTwikDvCBmZBiGesSqk+Rld/uW399AyF6+wvvgqK7o6UeE66TtC1FhjYlXTUjP6mi8UtH6DhMuaXygDyA2SD97agOeg98apqqGGc2Bys1fpCWY/UoLw79sWkjl4rBMZ9JRy6bJCBzIqjfGrqUtOchdTGk/iPKWkt6yQ4fZHMnjVRJsKj6jXHgg1w/gp9kGbtMlliZgFSwLvptxRoVUBbuGcOCf10ppQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hjmKSOvOWabp5WhsP0C2yC4c/AZNwRce/sLAi6/bNUo=;
 b=L0bRpMcX4t9GrBA4BoGZJxCK7n3XOUWOfa0prIzv2FvdC5uR5JCxRtn0VQyhwi/yjful+mGvEAcUrKaMIFK6mz6S3KReVnTrEO6uic+Lp/5Idb0pC9t0BmVgh2DZ6lCTtpzIpAP4sS52ezi/VhBmm3bd0dnk1oLnv4SyuYS8wEMeEB15Kf/TfPzDaHqDstNKrWoLpS577Ox0dOsY9bNbCA+Cyzegv42JprTAcYxf8r5avlDu6pO2tGtdHrsJXJrtudMhiUuqU02VC/T8l21S0sR308SVNjBvnGe7OaNDFdQw9qnHPQW5A4OsISYIhAjwJe5PsN4EOxoQg7wMBoLHiQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by SG2PR03MB6294.apcprd03.prod.outlook.com (2603:1096:4:175::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Tue, 27 Jun
 2023 02:27:31 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::e659:543b:2ac9:8fd7]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::e659:543b:2ac9:8fd7%3]) with mapi id 15.20.6521.026; Tue, 27 Jun 2023
 02:27:31 +0000
Message-ID: <7e696f07-c5bc-4846-c96f-89158745a4dc@amlogic.com>
Date: Tue, 27 Jun 2023 10:27:21 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/2] dt-bindings: arm: amlogic: add T7 based AN400
 bindings
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20230626095223.721011-1-xianwei.zhao@amlogic.com>
 <20230626095223.721011-2-xianwei.zhao@amlogic.com>
 <cd9d82cc-d98c-f4d8-8dd5-01ce4130aa78@linaro.org>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <cd9d82cc-d98c-f4d8-8dd5-01ce4130aa78@linaro.org>
X-ClientProxiedBy: SI2PR02CA0051.apcprd02.prod.outlook.com
 (2603:1096:4:196::10) To TYZPR03MB6896.apcprd03.prod.outlook.com
 (2603:1096:400:289::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|SG2PR03MB6294:EE_
X-MS-Office365-Filtering-Correlation-Id: cc741108-684a-4302-303a-08db76b60e6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E4v17hLoqURm96oS64jZ0Qy4T3/YCGL9M7lbk9L/VoSy81KK781MwozMZd4nA9yPs29vaZRIsEC+iIFJ5w6Wvzh9x5e5PdoMCFu4RcYoUsDmDXkaDecfJVJNnjsMncvuqq8GlxmBQnoke9su7H4LpMuMu4vchTUxvizZsGBJpKJzHCPG9TKIk7+J3Ug9rTILUbo8ydwifsga9vDHFs2ynC0h/bFIjIMbSigf05a6+AGPtsf5AXiOqWnI2wNol2X1c+bo9bQ08wq3fVqGR3BpvQW/xerRXXAB94JAysoplJZZjiBMYA66c40YV4BhODBfLU2dMymltzEKrxzsLbQdDp8NOzk2//pMQcOeKOt/qUTzEtXXoQ+e/COMqaBq7B1SdYgZs7XXOZGnAxMpt1Jk7A4ZUpky3jDPgKVADy/Pj/PuqiZlw7/2syClf33Ob4qjgyjHg5G0Ej32K+mFTfDnr9i0+ZTwFYmSpEKR+FPNcH6eLGcnvG4c+v1LwSA1V+Bj7qsaYcrgYlNxgLJGiTTjtqKSKe1pIeexq8kLU0WaUndkcCovc2KvXVt9SvAjfgS0mts5/ALdsWtHeemIA1+OhbgxRNXJfZF+gjwbz3Ds77DNyLZfp4WV5k+TsXQyzHl5Cvl9EQW+qghVZu05X3vwr0BSWWgYjOzww+Ni8Jkn5xP1Yp0Us4aePxHwYSyxpPpn
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(136003)(39850400004)(366004)(396003)(451199021)(6666004)(6486002)(478600001)(54906003)(53546011)(6512007)(6506007)(186003)(26005)(4744005)(2906002)(66556008)(66476007)(4326008)(316002)(66946007)(44832011)(8936002)(8676002)(7416002)(5660300002)(41300700001)(38100700002)(36756003)(86362001)(31696002)(2616005)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZVBaNDNDSHpxcjZBMDZESU5nenlqV2JnTEFXWm5yam1VSEtwMEZTVkNsbXlL?=
 =?utf-8?B?WnF0T25YNjNZbzJoZlNHSHNlMEk0bDJ5SExEMmZXZ2M1dEx3Tnl6bmVqbG1z?=
 =?utf-8?B?MkpMeFEyV1NVVHl3bTBKSEZvSFdBQlowSUV4VDBrOHY5QW00U0pVdkhxZlpQ?=
 =?utf-8?B?RXo2ek1nRWxpWVQxSGQ5UWlMaEw5aC90b3ZGNG5takpYbFZ4UzdnUkJjZUFa?=
 =?utf-8?B?RmIxRnpJdmlOWnZFYUxsWlBabnl2SGNydmVaN3VaNGlDK3c2eG9sZjJWY1BL?=
 =?utf-8?B?Ri9Ld2ZxYlovN0o2U3RhYjBhMk9xS2VTeERJM0c1UnI0bjZjaFIzaGV3dWQv?=
 =?utf-8?B?Qno0UTNadUxkS1VVS1FlNkJlY0dXMWNUaU9VT1EvTmVReHVBNEJZV05DSEdt?=
 =?utf-8?B?SDdFRWJrK012ZDFoOWtmblh5SDJzUjZYakQreHpRS3c4dmY1b1k5NjBWOWZi?=
 =?utf-8?B?NDU5WUJVWGJPKzl2aWZCK2RPRlpoSWxnR1ZVcTRIMXRVKzZvTk1jcGtlNFl1?=
 =?utf-8?B?ZENKckFLdmdqeXFreUgyeWRYc2NoUmw3Y1dabVZVaG5aR2xKQTNieHlKakFB?=
 =?utf-8?B?M1l5SXYxSi9RV2NqTmgwUi8wVnZLTmNTMjIwaGtzWUppcU1pL3BoeVhuWllk?=
 =?utf-8?B?RnliMVBJbjBneUNPK3EvZWFMWDNJL2N3TTJFUXFKYXJob1ArNW8rVUQ2aDZk?=
 =?utf-8?B?UWdWSDdEY25aMW1rUlIxdVFBZktvMjAvZzFBSGNCVHlZUkN4d2wraDJrSVFZ?=
 =?utf-8?B?S2VBWGRvbWxTdUlXMEdTMEFiNURSMjFOMHJvNVl2eXYwMFZlQ3Q5aWx6OHFp?=
 =?utf-8?B?M0hEK3kzZkZtTExqSmE4UUlTUU5vTVlzM1BhcDh1dFJ2MElwUU53cTJGci9r?=
 =?utf-8?B?ajVIZkZhZ2RhSUdDdVd2NU1RaysyaWVXSkJ5dk5TTWQ2SmRSMkdCUXpHZjdX?=
 =?utf-8?B?K3NKbys4K1NuSlBKK3FSQytWRDlQajFWaHdNVE1sYm00VUdRZ29jZStqd0Y5?=
 =?utf-8?B?RGdwMnY4bDJra1FycU9URTNXTHVreW1zL3JQUGlVR0djZ2p5dm8yeDNWS0Ev?=
 =?utf-8?B?TDluQWM0SmVQUnpQdXNocmJmc0s1M1pmN3NEWG9CelFGRm1jRnhEelZGY1gw?=
 =?utf-8?B?a05OZXB0L2Y1SlB2RVlzaDU5U2xtK1VheXJtWEZSOGRKTzZYWHV5VzA2ZVI4?=
 =?utf-8?B?eUpGclJaL09XRWp1ZVA2SitNbHpEeUxUZzE2UnNsWGZUeGZKa0w5VFZmK1Nx?=
 =?utf-8?B?dzdzYS94Wk83SXIxazgxRjcveDlwbWt0ZU8ycVZQV25sd2VvN2VqMDNTd2Ur?=
 =?utf-8?B?S0g5WG5zdnJ3ZXVxempyT0pYanIveFdwZTFQTVRIZS9KSXlFWGZGa3cxWjgy?=
 =?utf-8?B?dkVieHNtV0kxTTE3L0NENmN6SXhpRE9mVmZ0M2xPYzExY3RWQ1VDTVJNMzl1?=
 =?utf-8?B?WFB3dVp2bXl1NUx0R0NxQUozak8wTDl5S3NaTUw0NVA3cG9MS2FUNEV1OUpv?=
 =?utf-8?B?UGdRVU5YYlNhWG5kYWh0RzZqcVY3U1JuK3dtUzRXajZwMy9HNkR0bmthRlN6?=
 =?utf-8?B?anNaUnl2bFRVMzNHRXdrWlhha2thby9wQnBWQlB6L0Y1UVRjZm1OWXp5UWVH?=
 =?utf-8?B?RHl0anI4Z0VyRjlDUXJCMlVPQVVmOFV3eE8yNDVGZmJOL3hQTFlRQVJadUpl?=
 =?utf-8?B?YTgxODROR1NXeTY4R3I4V1dGVE1NWW5zaXlnYWNOZTRnWHVXcUcvOEVPODhZ?=
 =?utf-8?B?dlBSNHlwT1FVdXhya3hMV1hRZlRrMkdNRHZHOWxiNFJZY1puSW1PWGVZczdq?=
 =?utf-8?B?UlNNelUrNkZMMG1HQXZyV294YmIwdXY5VmMyNmdCZktVVUtvTEl3LzNXMlp2?=
 =?utf-8?B?RGlkQ1NvRTVGTWpTNmFrU0xkSUlTQ2VuUUNsN0ErM240ZHJ5ZE14Yk9McWFv?=
 =?utf-8?B?SEVPdkkxRm5DUkdXSXl0SmhNaW1KVTZLSjNpOU1KUHFXbW5KZElNSWp3UmR2?=
 =?utf-8?B?cTJmYXE0b0dHU1RWaEQvdlUzcmpoOWVYVmRUM25WS2liREh1UmNmNDA1TGhl?=
 =?utf-8?B?eUNxWmZPbExieGdyQ1FkOVNac0xXV1ZaVWJGSFBoRkdDdDR1eVVJbm45aGRV?=
 =?utf-8?B?M1Z0RFM4amN6UnJyR1podkUwRHJwc204ekZ5U0ZHUWdqT0puWUtVWWk2R2Rt?=
 =?utf-8?B?Q3c9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc741108-684a-4302-303a-08db76b60e6a
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2023 02:27:30.8164
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pBtYEfgtWfPipAbKOCpyUaBF0FFQcGelJZN6TM/6SA/8t93JAeO+ThonyAJVLYdpc66qTWoixVUM6XKy8m08J54Z5eVbq9075Cqk2WzWYJk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR03MB6294
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230626_192803_449301_5B0FF0DB 
X-CRM114-Status: GOOD (  11.97  )
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
       Thank you for your reply.

On 2023/6/26 23:38, Krzysztof Kozlowski wrote:
> [ EXTERNAL EMAIL ]
>
> On 26/06/2023 11:52, Xianwei Zhao wrote:
>> Document the new T7 SoC/board device tree bindings.
>>
>> T7 is an advanced application processor designed for smart display.
>> It integrates a powerful CPU/GPU subsystem, a secured 8K video
>> CODEC engine with all major peripherals.
>>
>> The main system CPU is based on Big.LITTLE architecture,
>> with quad core Cortex-A73 cluster and quad core Cortex-A53 cluster.
>>
>
> If there is going to be new version, subject: drop second/last,
> redundant "bindings". The "dt-bindings" prefix is already stating that
> these are bindings.
will drop bindings in next version, thanks.
>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
> Best regards,
> Krzysztof
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
