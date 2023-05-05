Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98F94C7EE21
	for <linux-amlogic@archiver.kernel.org>; Fri,  5 May 2023 02:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dT4LDrIHxQYnPpwt3oXocQAyeT6tEGen+kFdvhbnVm4=; b=wjVh3P4I/dU08GazN6JtS2YxEx
	mW6gSln9aCo2ThFfhGyiFcUhP/pZdfueFMoKQFXMjdFWRnHrGRBAUKOWKGuDASk/u9ie+b7jlPXsZ
	e/XQj8RNYQYTMeNsbdjv4bnC3gsrD0IRWj7Zx+fQT7Q6Za1ax1HYIKWRDZE8FooUXUsgDnUrgocQY
	Pg505U9548oQ4trQc1mdZbeCn4bC4pKACHh9lpCRgYCpJxhvf3mU+jSISJ7oFdes9wNGgjs/7f+RP
	Ft8nVyYze/wg+iXERre766JjPUMfO34PqvwfnZYuMb2Mw9lHShZ7iz4m4J3ySBAPiG7oEFKNZAynQ
	uO1Kbw3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pulKZ-009XqF-1G;
	Fri, 05 May 2023 02:37:59 +0000
Received: from mail-sgaapc01on20709.outbound.protection.outlook.com ([2a01:111:f400:feab::709] helo=APC01-SG2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pulKU-009XmW-12;
	Fri, 05 May 2023 02:37:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=co7RHowkl2y5J7IkOXYhCLFDRxE+DKt3oJg0MtPQ3w4889nMzkpSz7Q37BlFgiuQ/lKaDuzFNlD3aL1zZzsoHAPYS8JGezcAE1ZvaEvVekBVp0TQYYtJyujHWP+2qZI3uZWiKV1b7EzxGSe99p7s/lTywJBB82OLR1NPEyE5FxzEjmfxo401ywtJl3y2u/z3QeoHQ6F+upui8vHkrIaDV1jE5Cxp6jeuAEz9EWpcKl7zEQ29FKPJTiWmzIpY1RXwJCXlGdwzwM9/xNuwPR7v9K3cY0SYKG0UBqLwy2Tr0H0MwiU+L0zyfoumLqvp73ryU1EfrjVHkrmdKxX3RzfoVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EHF7BSXd6z4hLofN1zF1+oh3ep1qjRjrtp0hDxf4DNE=;
 b=h5f9M/3TzBzxonoh+5bDd2SLEXrAAyQgruyL0j7li/5anvdz5Uh+r6Q/Jjkfnw9qNd1G1ab7YswyidgVOo3aKEUGVByXjJ1VuUEQarL55OIaxK0C1JoA4A0wBUY/1hezZ0MXmJ+OO0zZkAyK3xu8y3OMHvUu3PXJ/J8ACxYqsTc6cySknCW5nNfcMxvRp7VSWmsWRGjOhYiQTRlECunsh/s1T5Wgi89W00DildcjhI4v23A+2wEdCpYxjwaJsuG8ox4TowB67K2Qjqz7kZ2v4KUbaUZ9OHZ/lBBpO6y4o1w463CTtpxScu1yiXfLqnstzQS5R910iGNRb7MODj7luQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EHF7BSXd6z4hLofN1zF1+oh3ep1qjRjrtp0hDxf4DNE=;
 b=nZdpd4RyS6TrnfH8V2X/8J8r10RQ8CGQH8bH+g61dvEfp5kdU3LLnGo6IGqGTRr+m5U/8F9wF2E0yncNGoP3uPaICRHfAXHslw4snZKsZXTpf4v4Bbcw2C2/MZLZ0UtOyKWATAW2Jhoj/TzkfnaQfuk+UqBMIeohsxmyYUjR8IwUN+WisNY1LyLNrd/Yo5U6JwNfklvzhvd4egodAiWkreQcVEKDE5A5x5y82b+q3tpHctCUWfe6TcHsIFDzu8DAmXLPgNRAzOgk3X5ar1WBVVG7Qe9N1hj6vaeITbesOeol9JiQ7Yn82jSmbmP3PxoECDsoOT+ycAztrT5OmvA4Mg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from SG2PR03MB2734.apcprd03.prod.outlook.com (2603:1096:3:21::22) by
 PUZPR03MB6104.apcprd03.prod.outlook.com (2603:1096:301:bb::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6363.27; Fri, 5 May 2023 02:37:46 +0000
Received: from SG2PR03MB2734.apcprd03.prod.outlook.com
 ([fe80::9c6d:3128:b370:5fb4]) by SG2PR03MB2734.apcprd03.prod.outlook.com
 ([fe80::9c6d:3128:b370:5fb4%3]) with mapi id 15.20.6363.026; Fri, 5 May 2023
 02:37:46 +0000
Message-ID: <e3083eab-ba85-3e9b-b3f2-f50816163f9f@amlogic.com>
Date: Fri, 5 May 2023 10:37:41 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH V2] arm64: dts: add support for C3 based Amlogic AW409
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230427085859.793802-1-xianwei.zhao@amlogic.com>
 <36e7a445-7d19-911a-1a94-ffc30172e1a3@linaro.org>
From: "xianwei.zhao" <xianwei.zhao@amlogic.com>
In-Reply-To: <36e7a445-7d19-911a-1a94-ffc30172e1a3@linaro.org>
X-ClientProxiedBy: SG2PR02CA0126.apcprd02.prod.outlook.com
 (2603:1096:4:188::11) To SG2PR03MB2734.apcprd03.prod.outlook.com
 (2603:1096:3:21::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PR03MB2734:EE_|PUZPR03MB6104:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c2990ac-b739-4271-5425-08db4d11b54c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	O80LkiKzO6t+d3WYu1BkE8eTBgtS8SFyoquYAPKZ1Knh2/zjKcrFWO38jPnMH/Q1rwA0nMTq0isprTyOyKudvZ2UzOinsW7BEFgryxzgrSZTP9NrwliFvj+e5Q3HMdaOEFnbn+Oq2K9QmGTA0ik+hkCHGO12SF/NdpLBkkJNTSYq6Wmvu4WBiMinXO7orU3P32Yy16CM0QwzaO7lc9+BvimudPDBvARlr+f0oXujUBbrFq6Qt8yjc99PW8LYxX3ZQcVwXkSKTy+XA7w3KtyJvuEcm6XjtI2pd+7LN7KUUp05g+8mnjWfMr5gsXB4lhg1TdczbJEUoO123kpgI8mN9R+8R0pqTrpeBVkq5oiz17HD/dN9dZqm0tM5cPlnH7tUQgnJg8S1mUyuE0pSH8XaoVCidAGKoEzW0qU/hOfB7wKCuyeSXhZ0amCNmXoa0jsxVTeCylP1UDeF1MAyT+Ohj9lYule7X8frM0sdV2lhMGKk2FwpS/eV9C7s+jxX8Jvp13ldywqLiu+zyRjg1ocyYq9rUy+YLa1JW2E3ZG2T2wKgZF4Nf92Fcung5b5eab5rda4pwpMjtam590O3Mk09On/y3XeyqdsGEIwFA1Qakg7VyV+jUG1wSYICRh6Ze4q4vz6oWZaEQuQvSMAFRxpotQ==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PR03MB2734.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(396003)(39850400004)(366004)(376002)(136003)(451199021)(31696002)(316002)(86362001)(38100700002)(31686004)(8676002)(8936002)(41300700001)(7416002)(54906003)(478600001)(5660300002)(4326008)(66946007)(66476007)(66556008)(2906002)(6666004)(36756003)(966005)(6486002)(83380400001)(53546011)(26005)(6506007)(6512007)(186003)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?VXpicTdVSDR5ZWtjZGZ2ZnVyNEhtUElmY2UvYXZUQWdxdmpjbGhmM083djFu?=
 =?utf-8?B?UEJTdjFUNXNDR01mbnBGT1RMRnhaeXZ0L0hhSkR1aXI2VE1TWTJoSE5Ybzk2?=
 =?utf-8?B?RDlDSXZhQ2dlMzJBNjlQNDFScS9vT1dDbStPRVo0QUkrRkozNTExeDRoeS9D?=
 =?utf-8?B?Q01FTFFMRHhOaWhJSnBIUW5ZVjBPUS9HMWFXWGhMdkR4V0VmeUFMSlhFYXVi?=
 =?utf-8?B?aVI3TEZCVWZrd2tnL2RYWG12RG5DV1EydU1GeCswM3NGREdjZ21PR1dMN1Vm?=
 =?utf-8?B?UHk5S2dTUFlCQTNZTW9CU08va3dJb2ROYnZlVUZHb3AxdWxWb3hta0RUQjI0?=
 =?utf-8?B?RzZ4OEIxbjRqdGJLbVA2bTE2bDJSa2xhVzVqUEFFVjhPaTZqODE3SjcwNU1R?=
 =?utf-8?B?akZOVVBPbFBXV2RteE92T05mdEN1SjQyZG4xR0hzZlAzR1ZrQVc1REo0ZGNP?=
 =?utf-8?B?WWgxV1ZvVGFmZHFIZnIzTGdaN3BKbjhCaHoyWlFrRUxrTzJGSnd5VStVR0ZP?=
 =?utf-8?B?VnVJT0xmbXdIU1cxV0FlZUxQdW56ZEZ4ZTdCRVFXMkpSdmdEdVd4WVp3dXFE?=
 =?utf-8?B?SDhXeTkrWnVSVVUwSHlBOTU4OWN4Y0dsa0lxWktmZjVveTZhTUJaSmF6WHpr?=
 =?utf-8?B?R0wzYk0xV0JrU05kblJmMzhZRytHcHhXNkhteVJ0QWJwNk8rNTVORk9SaDla?=
 =?utf-8?B?UkNXbUlRQ3c4dStyUkR0K0FHcFpMTVRwdE94NjBTV1ZHZXhuT1hzbHJpb0JN?=
 =?utf-8?B?WExvTE85ZFRRakJHY3Zram9VRnRvcVlnVE85UTdiZm9SaExpdUo3ZXlGRWhl?=
 =?utf-8?B?RUFPSWJnS1RpeEtDMUJRVDlTd3lnakM4REJYWXoyVEprS3lPU3kwUlkxbXJv?=
 =?utf-8?B?NnVzODZWQVV0dVcwanB5NExpUEFQeERIVDV3NVI4c0xOYlpOZTh3Z3FhN1Iw?=
 =?utf-8?B?a1B1VEJkS2NxNm5UcUtuVDJpS3M4QU5LQnphU0NNVlpYQ2F4ZDZpUmpQbk5m?=
 =?utf-8?B?L3BQZlBvN1BDQTM5d3NWenQ5OUlPM0Z0d0pGS1QyaVZRMHlvenpKUExBdDNC?=
 =?utf-8?B?N2R3Mk1naUNLVUtiaFZUdk5wdlQ0Nk9zaGY5WHQ5UFdMZysrbENVaCtqc2RD?=
 =?utf-8?B?UmxhV1RxaTVqTjhreXRtZjFPR3dBbWNtVkJXc1Era2lmTjUxVmxmNlZhNGpO?=
 =?utf-8?B?TGJDbEVHVWp4b0N0SHVaNGc1TzQ0VGZJK1J4NldpemhOMkRQOTQyU3M2ckNs?=
 =?utf-8?B?am5oVnR0WEEzNG9xREV6Z0pjSDdFOXp6d0xrZ0xRUjBvODN1clh6NGdtTVFl?=
 =?utf-8?B?K3lJM1RaUmtLeUtxZDE1Z2RYemFGMXIwL2FOakpjNXR5RTB0dHVJRGx6R213?=
 =?utf-8?B?WFlqb1lqbGpLTXRhV0diTTRlZnFXUFJRZFUzRnJLdEJETjZTTExhemJyakxC?=
 =?utf-8?B?YXFuZjBUclJrRm9GamNEWFdwd2EzL0NnRWY0YTdIbWNxOTJiV3dSYmJQVllx?=
 =?utf-8?B?cW8xaE0yamVaTDlWT1hGRXFpRXVlM3lCdlVrVU5iMkJKdnFWREM4RDJnZGVk?=
 =?utf-8?B?T2FMcDBQaFY2alBVQUFtOUFGcStjYVhqZUhLNkJ3RW9yUnZiL0JPellDNDcw?=
 =?utf-8?B?c0ZrdUVibjV5MjJhNUgvM1p4eWtCY2R2bWlJcXJFZjY5Z1R2OXlWeGhrSmZu?=
 =?utf-8?B?bXgzTy9WbW9JQkFLT00wYmVncWtYOTQ3K3o0MnFGZnR3L3grQnNWSHBrci9E?=
 =?utf-8?B?TGErVVhlL1BYakMrc0phYjRWRkJOK1FJVzlEWlMxRjFyR0p2VkRJVlB1enFH?=
 =?utf-8?B?SC9JSFZOV0lNZ0ZYaXhMZVQzcS90eHlGWWE2QUhVS3pLZlpQcG5RZ1NMM2RM?=
 =?utf-8?B?UDhocHN6djFpTlJ2UXA4OFVkVnBiOXRXZkdiZFE5V2lYM1J2bGlIZDdLamVz?=
 =?utf-8?B?NjdkZTYyZ3VsdFY3cDk0TkFOa3BDUm9MNGVFZVo0Nm9odGx5OEl2ZnlkOUxs?=
 =?utf-8?B?RDdwRVYySnJrSWFSZ2hzV01lZWRESmlYMmZ6aU5PY0g3VEk1TUMwZWZMWGly?=
 =?utf-8?B?VTlHVnNjUkRjdHVyZEZpaEVhSVZFbldnbUY3ZkpzSFRGcEhrR0praWx4VjhU?=
 =?utf-8?B?d0lxNjNJUHl5QkRaMzVLaUtwNWNaMFpnWVdaNmV0U1hQM1dNMjVaQUpaa1M2?=
 =?utf-8?B?bmc9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c2990ac-b739-4271-5425-08db4d11b54c
X-MS-Exchange-CrossTenant-AuthSource: SG2PR03MB2734.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2023 02:37:45.8728
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7UWH5crrJnXvK6AY8tergQM/SErTlcfcOFe/aH5JCHd2UquAorvyKlQ4AIXRmldPlqI10qp6ysi/LURZ7+o9uRc2rgB37Zqrz3e533BNwbo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR03MB6104
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230504_193754_363891_002E14F3 
X-CRM114-Status: GOOD (  17.87  )
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

SGkgS3J6eXN6dG9mLAogICAgICBUaGFuayB5b3UgZm9yIHlvdXIgcmVwbHkuCgpPbiAyMDIzLzUv
MSAxNzo1OCwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPiBb5L2g6YCa5bi45LiN5Lya5pS2
5Yiw5p2l6IeqIGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZyDnmoTnlLXlrZDpgq7ku7bj
gILor7forr/pl64gaHR0cHM6Ly9ha2EubXMvTGVhcm5BYm91dFNlbmRlcklkZW50aWZpY2F0aW9u
77yM5Lul5LqG6Kej6L+Z5LiA54K55Li65LuA5LmI5b6I6YeN6KaBXQo+IAo+IFsgRVhURVJOQUwg
RU1BSUwgXQo+IAo+IE9uIDI3LzA0LzIwMjMgMTA6NTgsIFhpYW53ZWkgWmhhbyB3cm90ZToKPj4g
QW1sb2dpYyBDMyBpcyBhbiBhZHZhbmNlZCBlZGdlIEFJIHByb2Nlc3NvciBkZXNpZ25lZCBmb3Ig
c21hcnQgSVAgY2FtZXJhCj4+IGFwcGxpY2F0aW9ucy4KPj4KPj4gQWRkIGJhc2ljIHN1cHBvcnQg
Zm9yIHRoZSBDMyBiYXNlZCBBbWxvZ2ljIEFXNDA5IGJvYXJkLCB3aGljaCBkZXNjcmliZXMKPj4g
dGhlIGZvbGxvd2luZyBjb21wb25lbnRzOiBDUFUsIEdJQywgSVJRLCBUaW1lciwgVUFSVC4gSXQn
cyBjYXBhYmxlIG9mCj4+IGJvb3RpbmcgdXAgaW50byB0aGUgc2VyaWFsIGNvbnNvbGUuCj4+Cj4+
IFNpZ25lZC1vZmYtYnk6IFhpYW53ZWkgWmhhbyA8eGlhbndlaS56aGFvQGFtbG9naWMuY29tPgo+
Pgo+PiAtLS0KPj4gVjEgLT4gVjI6IFJlbW92ZSBuZXcgYXJjaCwgYW5kIHVzZSBBUkNIX01FU09O
Owo+PiAgICAgICAgICAgIE1vZGlmeSBub2RlIG5hbWUsIGFuZCBkZWxldGUgc3VwZXJmbHVvdXMg
YmxhbmsgbGluZXMuCj4+IC0tLQo+PiAgIGFyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9NYWtl
ZmlsZSAgICAgICAgICB8ICAxICsKPj4gICAuLi4vYW1sb2dpYy9hbWxvZ2ljLWMzLWMzMDJ4LWF3
NDA5LTI1Nm0uZHRzICAgfCAyOSArKysrKysrCj4+ICAgYXJjaC9hcm02NC9ib290L2R0cy9hbWxv
Z2ljL2FtbG9naWMtYzMuZHRzaSAgIHwgODYgKysrKysrKysrKysrKysrKysrKwo+PiAgIDMgZmls
ZXMgY2hhbmdlZCwgMTE2IGluc2VydGlvbnMoKykKPj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgYXJj
aC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL2FtbG9naWMtYzMtYzMwMngtYXc0MDktMjU2bS5kdHMK
Pj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL2FtbG9n
aWMtYzMuZHRzaQo+Pgo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2lj
L01ha2VmaWxlIGIvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL01ha2VmaWxlCj4+IGluZGV4
IGNkMWM1YjA0ODkwYS4uYmNlYzg3MmMyNDQ0IDEwMDY0NAo+PiAtLS0gYS9hcmNoL2FybTY0L2Jv
b3QvZHRzL2FtbG9naWMvTWFrZWZpbGUKPj4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9hbWxv
Z2ljL01ha2VmaWxlCj4+IEBAIC03NCwzICs3NCw0IEBAIGR0Yi0kKENPTkZJR19BUkNIX01FU09O
KSArPSBtZXNvbi1zbTEtb2Ryb2lkLWhjNC5kdGIKPj4gICBkdGItJChDT05GSUdfQVJDSF9NRVNP
TikgKz0gbWVzb24tc20xLXNlaTYxMC5kdGIKPj4gICBkdGItJChDT05GSUdfQVJDSF9NRVNPTikg
Kz0gbWVzb24tc20xLXg5Ni1haXItZ2JpdC5kdGIKPj4gICBkdGItJChDT05GSUdfQVJDSF9NRVNP
TikgKz0gbWVzb24tc20xLXg5Ni1haXIuZHRiCj4+ICtkdGItJChDT05GSUdfQVJDSF9NRVNPTikg
Kz0gYW1sb2dpYy1jMy1jMzAyeC1hdzQwOS0yNTZtLmR0Ygo+IAo+IExvb2tzIHdyb25nbHkgb3Jk
ZXJlZC4gJ2EnIGlzIGJlZm9yZSAnbScuCldpbGwgZG8uCj4gCj4+IGRpZmYgLS1naXQgYS9hcmNo
L2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvYW1sb2dpYy1jMy1jMzAyeC1hdzQwOS0yNTZtLmR0cyBi
L2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9hbWxvZ2ljLWMzLWMzMDJ4LWF3NDA5LTI1Nm0u
ZHRzCj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4+IGluZGV4IDAwMDAwMDAwMDAwMC4uZWRjZTg4
NTBiMzM4Cj4+IC0tLSAvZGV2L251bGwKPj4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9hbWxv
Z2ljL2FtbG9naWMtYzMtYzMwMngtYXc0MDktMjU2bS5kdHMKPj4gQEAgLTAsMCArMSwyOSBAQAo+
PiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wKyBPUiBNSVQpCj4+ICsvKgo+
PiArICogQ29weXJpZ2h0IChjKSAyMDIxIEFtbG9naWMsIEluYy4gQWxsIHJpZ2h0cyByZXNlcnZl
ZC4KPj4gKyAqLwo+PiArCj4+ICsvZHRzLXYxLzsKPj4gKwo+PiArI2luY2x1ZGUgImFtbG9naWMt
YzMuZHRzaSIKPj4gKwo+PiArLyB7Cj4+ICsgICAgIG1vZGVsID0gIkFtbG9naWMgQzMwMiBhdzQw
OSBEZXZlbG9wbWVudCBCb2FyZCI7Cj4+ICsgICAgIGNvbXBhdGlibGUgPSAiYW1sb2dpYyxhdzQw
OSIsICJhbWxvZ2ljLGMzIjsKPiAKPiBNaXNzaW5nIGJpbmRpbmdzLgo+IAo+IFBsZWFzZSBydW4g
c2NyaXB0cy9jaGVja3BhdGNoLnBsIGFuZCBmaXggcmVwb3J0ZWQgd2FybmluZ3MuCj4gClRoZSBi
aW5kaW5ncyBjb21taXR0ZWQgYnkgTmVpbCwgaXQgaXMgYXBwbGllZCB0byAKaHR0cHM6Ly9naXQu
a2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvYW1sb2dpYy9saW51eC5naXQgCih2
Ni41L2FybTY0LWR0KSwKYmluZGluZ3M6IApodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAy
MzA0MDcxMDI3MDQuMTA1NTE1Mi0xLWtlbHZpbi56aGFuZ0BhbWxvZ2ljLmNvbS8KPiBCZXN0IHJl
Z2FyZHMsCj4gS3J6eXN6dG9mCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1hbWxvZ2ljCg==
