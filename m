Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42072C3DA6F
	for <linux-amlogic@archiver.kernel.org>; Thu, 24 Aug 2023 08:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MeT5f8lCHTOZhZ1E31jcot+Ocjba8s0hmfKLf5wr1dE=; b=3tFDzJ+D2O8GjkRGhQP9L/TZAl
	eVGM1ClfMh8T7/5l+4V63snYyqWUumztPX0NGlRjMWX9aZ5kDIfD/nyzJPAIZGR5WtbDglLmYEFjL
	4VDeM244pR2jyRzlMuCHzQ6VZDfcBX2IBgOOrdAhqrsb1iQdfSPWztfNgQQZOHtSVJjHAwm9E7+F2
	u9PQsCajcx6q1qWJ9VyJd03IaeuGLqm+AmNWI3OjJfuw70RYs1ny+7mX6hTHjeW9GybXA+ggDt+db
	QfvmiuFWuqvUglRzzWY7O3sslAZff0DalaghNNtKXoA0v4vaLmUcOVP90Z/3aJecdaDU9OYQi90Vc
	xrZTQYTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ5w1-002bPg-2R;
	Thu, 24 Aug 2023 08:43:21 +0000
Received: from mail-sgaapc01on20716.outbound.protection.outlook.com ([2a01:111:f400:feab::716] helo=APC01-SG2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ5vy-002bOk-2i;
	Thu, 24 Aug 2023 08:43:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d5rXi8todLtCwYghQ8KxskKCi5V303+0TSPIkfa1N2J6TehD8aZ6VY8LhuNmRchXSV4UwJhR1CNNHT19tIBGvLDbZr8Pky1tx848iGbHllSKiaHKuVwnzv+UAWIXYXswbbgy1N1IuP/Yl7pX8JPNbb5wU1VpF9Afo3fAbzoV4Zeyq3SjF9/dbi9lSwR/79KNDEI88+ctUbEDW9Gvlb+mHQ9M/xDxZZy2VpVENBbbiCVA2Z7CyBM3oni4ksHLNQtcQ30eZbamoFfUedIoDbJQjH7Ppgd7J68KRf/l+ByJE0rbZshkzZq4tGNlqOP5YhJRBuc0LepT6sfUE/48OgfRsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F3BTpD4cOvuZRhSc2XzzvaGCH/+fVXx1m9e1lkp7BqU=;
 b=ngOwYe/GIR3mfQZ9eVpzeANwvKM8CKQfAh1XNKi8XkMIplzYxvsr33Q285fNoahn+MBrVVPyz2Isjlq+vfE7T9T/MhndwUHDSx3n0qYKbQDjrkqvpFH7DEnnEiVJAMxafvXSXKJRBzAwWy3usInwEvY5RT46dmBVb7oj0qVftUcMhpfX2NMxbApz/OEeEjpJ7dkoc7BOcXPRwk2mr1meilHp7G550EN4cFptq5+aY79QSG4Rl3sER60zwwNUQiezCvXCOG+GdeDjnngzZPz9soxeAp5l9XaG1ZSv53cp04m40gPcxzGrCo92NKwnnqRiwvOhcRR4G8qMZySGKAAvng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F3BTpD4cOvuZRhSc2XzzvaGCH/+fVXx1m9e1lkp7BqU=;
 b=aCPAv8EXj4WZ6JwmDXqRhyi1uQBRgK3D1OmKM7ARx5ImKIiiMAHa2KhbQQpf/QCkahzh1xRBAO9rqVFunZnRHdcKOsYMVqUniEWTOlDvQDYW49D34asaAsKeVQMDpxpB9D5s+i2kTRUMICFv051vDxL6bTZ2zjAEa5peEtAb2EW/pdhxV7NM0hkVo/bh1vdPj93MqC7XZk2QpCcdtAm1BMQY2JvwMtq1b1YMrlFznwsj7k/dT2UIBaMVYckiqO+9trAr9ZLyshIanfA2ww/wFlS7PHQZMmD6wpb9UK3sjE9ndg2AnYFmNmbqmWZlzFbSdr8bBTgCFdjghTi9mUaUiA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by TYZPR03MB5310.apcprd03.prod.outlook.com (2603:1096:405:5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.26; Thu, 24 Aug
 2023 08:43:04 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::f065:6e23:803b:2a75]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::f065:6e23:803b:2a75%7]) with mapi id 15.20.6699.025; Thu, 24 Aug 2023
 08:43:04 +0000
Message-ID: <3aa87be6-4961-9074-d417-d84e9c981195@amlogic.com>
Date: Thu, 24 Aug 2023 16:42:59 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH V2 2/6] soc: amlogic: add driver to support power parent
 node
Content-Language: en-US
To: neil.armstrong@linaro.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>
References: <20230824055930.2576849-1-xianwei.zhao@amlogic.com>
 <20230824055930.2576849-3-xianwei.zhao@amlogic.com>
 <741c1e35-648d-4c2f-a939-24bcbec93911@linaro.org>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <741c1e35-648d-4c2f-a939-24bcbec93911@linaro.org>
X-ClientProxiedBy: SG2PR01CA0161.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::17) To TYZPR03MB6896.apcprd03.prod.outlook.com
 (2603:1096:400:289::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|TYZPR03MB5310:EE_
X-MS-Office365-Filtering-Correlation-Id: 664e41ac-07b7-49b7-9d9c-08dba47e217c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o08+0lI/Cty9vmKF0D/fjvSl7HNJPoc7d4MGNcOXxFzrApINy7Cg+hqCKC3P75upcu7p9qqF3U7FnOglvcUr9gPPn0KOpn9XVnEBvi8Uu5uziqQsmF+pTyw6Sf9VMlT4vz07fyWkyHcNdclQVf04RQc7OwKsesrCW/w3LiwIb4gVHlcL6I/sF1Fx9rHwKj4akf1z7ij8p0OyFMQALv5HnLZMrJv7HV/L40wxXH01TL8JpXMm+Trb6bxtxPK+oVSWFO26X/qMtcNvsKWEjhZbJp08Yh+6YP6jUXBG91JD4PAVPAvPRJScqZ8r1qCseqOfDDakgEfZVsxuxip9J3dpDpYiFSv2DT+oBnTX8xjBBdz259BXoUDAnNN/OELbg48Ih20rZZXpMCjtICjiCp3wJmEvBo9DUrRACvKiwz3WG2k910FNZPMATtKw1BlyY2FnAr35ENQYSgDTPwqgtMCqyNEZFRUwdU3F7iU2oQVb4t1wRd2nDYAsNMqv2lEjBMLylOdhDAlfxv1ZxBPTYmumQTnUz5DpOTvI79zh5yqOkkx9Y4L+RpflZW/MLrKbz2/7q4iYejJsSG0+vRthm6dCTyUx1GMUrjjbQXuEk3UDcIKwAA+CkMHsJVAIKOUFg1+56QyVRJ4UtCIK3ahp/9LY0RCJ+GIq0RqAAxcSkO9YGerHrBVYPTMjD5bdvUSV9GNNKOtfg80LuSsf3vLtiSGfQZ5Qk6X+EtJR+L1Lxb0fagA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(396003)(39850400004)(376002)(136003)(451199024)(186009)(1800799009)(83380400001)(38100700002)(26005)(36756003)(2906002)(41300700001)(6512007)(478600001)(6666004)(66946007)(54906003)(66556008)(6506007)(316002)(6486002)(66476007)(31686004)(53546011)(2616005)(5660300002)(31696002)(12101799020)(44832011)(4326008)(8676002)(8936002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UW5ZYUptSCt3OHZweFhtaS9oVVRMTXRUR3hqMVRZNmhqNWZKZW1TcEx1NDBK?=
 =?utf-8?B?b3JaNm1jRWtwZ0FYMS85MjA4OWJwWEFhTkhjdno3ZmhJRDNWTFhBV0pjNDdI?=
 =?utf-8?B?ZTJ0a3FiMHRtZDZ5UzNlcm5odXBxRnQwakwrN0ZBWFZwcUJBci9Nc3hXMFVy?=
 =?utf-8?B?K2E2bDRwZXlETS85ZUJ4WGNIMmdpOVdYU1RGOEF4TmIrcDlueDVxRnJlSG9o?=
 =?utf-8?B?VmF1bHkxenZLUkNWZ1FkU014Y21PMTNOOXpXVExvY21vQ0drVGJKMDlwQncv?=
 =?utf-8?B?OVJMRXd5U0pTSm01NHdiOENHQlJ4OGNqa0J4SWFHYjBhS0E1cHlEYWIrcWwy?=
 =?utf-8?B?SWUxSGg5V28zNXViS3llQm9FMzhKeUNXbFV0ZERseUNHcXd4TlVXcXY4NFBy?=
 =?utf-8?B?NjRwUlpLUzY3MWMvRkpCUEpMeDczSzVjUUxJdlNOUjdGNGJrN0M2S295UEFG?=
 =?utf-8?B?WHZ1Z2ZnQzFRM1VFMzd2aTl4bHFIWmxGOEQ1bnBpSlFpRG9MdFNIN29STnFJ?=
 =?utf-8?B?emtoeExMd3NyUTYwbzBxTFB5M29ZZkppTStldjRqYnpyKzVKZTI2RnlabmZJ?=
 =?utf-8?B?anpvdmtucm5uTi9ac2lwVXorUDJNT2Z2SjZ4WWtJR1RIVG1Yd1c1dnd6dnRI?=
 =?utf-8?B?RW05bW9GNkdmeGM1azJ1dS80VGdHL3Y3dVRhZGF3WlRta3NtL082VHZTVlI1?=
 =?utf-8?B?RHFZQ2ZVaTlvR1RtQTVXdFlPcXdTNEtldWxjNkN2ZzM5UzExdEpsM1RObFd2?=
 =?utf-8?B?dHUvZjdYMzBxd0lTRldDWi81NkIxZmo1cEVaSlpYb29jd3AraW40blBodGtm?=
 =?utf-8?B?Y29YVDdQOGRncmFCQVdsU3ZGUHpQbUJRbUxzYzgwVG5hSmdLYnNGMldZZ0s0?=
 =?utf-8?B?dXBMUXdvNWZSNStvd0tSZ0QwY0tqYTJhcWVnT0JVYkVRcEdPU3VqWWZZSkVm?=
 =?utf-8?B?WHlsNDlsS2pscXI4cjR1TmcyVlIyc1A4THg3VW9PeTNQaVR2YXZQNjhyRko4?=
 =?utf-8?B?aVNHNVhLL3ArTmpEYjVjMFpkTURIMWxaOFJNdmxvQmhNTmp3NXRNaUxjeEcy?=
 =?utf-8?B?cWE0RGMzS0R0aXNYdmFuZ0dxR0hNQUk3WUNCeGZ2RnRrV2lBSGJIdWpJdVNt?=
 =?utf-8?B?TnhCblI1K1hnRmtCeGNYVlFjTDhlZW1kSVlZcUIxcHQyR1ZuWXZ6dEhKS2tM?=
 =?utf-8?B?dFN1aU5tRXp6RlFUQ2l6dmtpTmdXaitHRTNuZjgvRWFTaHBmSkpZSjIrRUI2?=
 =?utf-8?B?d2lOK3ZSc0JwOFg2Tk5HU01ad0ExeDc0aHdqZXp0Sm81OUwyY2ZjNm1IaXU2?=
 =?utf-8?B?T3EzM21VWlR2WXpmMDU2TnlRVXVpR0lFMHY4VWxaTmRhSGhSaVJucmdhZ0Zx?=
 =?utf-8?B?d0FpbkdUanZGZElLbjNqdlZOY20za2cyeTFlWmJncEVyeTRicHEzQ0EvelRz?=
 =?utf-8?B?M2ZzOHM2bWpDSXpqWVFUaGNySmYrUzNzSHJ1dzQyM1NRaCt6QmZIUFd4RWtY?=
 =?utf-8?B?Um5MbGRoT0l1REkvcUd5L25uRi9wb1ZiMUNpbGlJN1hoTUNqeUUwUzVkTXVG?=
 =?utf-8?B?OFpoQ2FORTgyUS9GelRla3IwY21oanJyc3crUzN0SUFiQzhwY1NSOVcyVjlJ?=
 =?utf-8?B?R1hLTWJyUm1Zd3BPbkZSVm5iVlkxeTFmNndZTUVOM0FkZTF3Z01TeTNOU05R?=
 =?utf-8?B?QmRzYzl5dDltVldBMkZQYnNlZmJZWDBRdkR4Y3pBMTZ4R2JqTVhIWjdRK3Rr?=
 =?utf-8?B?NGZBN2NUVTYyTU9TKzhaSXZCQ0ZMb2VsSE13Yk5qUnFrenhhdXRSM0MxL2NB?=
 =?utf-8?B?NlFvRmpEbTI1TzBYaHV0aHNPSTVHcGxaN0g0Tm5DaE1PZTRNeFFoUTY2Tzli?=
 =?utf-8?B?VGxtWlh2MHZaQXBFa3JrVElMRTBoa0tUbDliTVdKRWNFRUoxamNScXB4YSs3?=
 =?utf-8?B?RXJsS3N6UmdjVXo5SVVPUjVrMWQ1UTVmMzJ0b296N0Fmc200eW1XbmVkc0Ir?=
 =?utf-8?B?bVVKeURSZ0QyK0IySlpjSS9zbWV6S3EyL0c3V1QveEMwTFE5V0lKWktCbXR1?=
 =?utf-8?B?bUpJL1lJM3lhVmZ6VDU0MHBkS045TTNUcE82N3hWcFIyaU5aZDM4emdtMjdx?=
 =?utf-8?B?MVFvcDh4UG5ITnVvKzl2VDA4U2VuQ2tBeW5ESzVlbnE2bE5mcyt1eSs5SlZr?=
 =?utf-8?B?MXc9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 664e41ac-07b7-49b7-9d9c-08dba47e217c
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2023 08:43:03.9807
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BQZ4fcKUZNLJCo2b3qm3rGT3J4qGSWpAmXDLc62k5q4dzUtfn8ChcljtZLfL8rhFJ0LjC32+/0yplVQ7EcRmklfRy1gU6/1LjcZlswFs7Fc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB5310
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230824_014318_884962_DA57F412 
X-CRM114-Status: GOOD (  19.50  )
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

SGkgTmVpbCwKICAgIFRoYW5rcyBmb3IgeW91ciByZXBseS4KCk9uIDIwMjMvOC8yNCAxNjoyNywg
TmVpbCBBcm1zdHJvbmcgd3JvdGU6Cj4gWyBFWFRFUk5BTCBFTUFJTCBdCj4gCj4gSGksCj4gCj4g
T24gMjQvMDgvMjAyMyAwNzo1OSwgWGlhbndlaSBaaGFvIHdyb3RlOgo+PiBGcm9tOiAieGlhbndl
aS56aGFvIiA8eGlhbndlaS56aGFvQGFtbG9naWMuY29tPgo+Pgo+PiBTb21lIHBvd2VyIGRvbWFp
bnMgZGVwZW5kcyBvbiBvdGhlciBkb21haW5zLCBTdWNoIGFzIEFtbG9naWMgVDcgU29DLgo+PiBB
ZGQgcGFyZW50IG5vZGUgdG8gc3VwcG9ydCB0aGlzIGNhc2UuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6
IHhpYW53ZWkuemhhbyA8eGlhbndlaS56aGFvQGFtbG9naWMuY29tPgo+PiAtLS0KPj4gVjEgLT4g
VjI6IE5vbmUKPj4gLS0tCj4+IMKgIGRyaXZlcnMvZ2VucGQvYW1sb2dpYy9tZXNvbi1zZWN1cmUt
cHdyYy5jIHwgMjYgKysrKysrKysrKysrKysrKysrKysrKy0KPj4gwqAgMSBmaWxlIGNoYW5nZWQs
IDI1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ2VucGQvYW1sb2dpYy9tZXNvbi1zZWN1cmUtcHdyYy5jIAo+PiBiL2RyaXZlcnMvZ2VucGQv
YW1sb2dpYy9tZXNvbi1zZWN1cmUtcHdyYy5jCj4+IGluZGV4IDVhYzI0MzdhYjhhZC4uNzY1Mjdm
NDk0NmI0IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2dlbnBkL2FtbG9naWMvbWVzb24tc2VjdXJl
LXB3cmMuYwo+PiArKysgYi9kcml2ZXJzL2dlbnBkL2FtbG9naWMvbWVzb24tc2VjdXJlLXB3cmMu
Ywo+PiBAQCAtMTksMTAgKzE5LDEyIEBACj4+Cj4+IMKgICNkZWZpbmUgUFdSQ19PTsKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCAxCj4+IMKgICNkZWZpbmUgUFdSQ19PRkbCoMKgwqAgMAo+PiArI2Rl
ZmluZSBQV1JDX05PX1BBUkVOVMKgICgoMVVMIDw8IChzaXplb2YodW5zaWduZWQgaW50KSAqIDgp
KSAtIDEpCj4gCj4gVGhpcyBpcyBmaXNoeSwganVzdCB1c2UgVUlOVF9NQVgKV2lsbCBkbywgdXNl
IFVJTlRfTUFYIGRlZmluZSAofjBVKS4KPiAKPj4KPj4gwqAgc3RydWN0IG1lc29uX3NlY3VyZV9w
d3JjX2RvbWFpbiB7Cj4+IMKgwqDCoMKgwqAgc3RydWN0IGdlbmVyaWNfcG1fZG9tYWluIGJhc2U7
Cj4+IMKgwqDCoMKgwqAgdW5zaWduZWQgaW50IGluZGV4Owo+PiArwqDCoMKgwqAgdW5zaWduZWQg
aW50IHBhcmVudDsKPj4gwqDCoMKgwqDCoCBzdHJ1Y3QgbWVzb25fc2VjdXJlX3B3cmMgKnB3cmM7
Cj4+IMKgIH07Cj4+Cj4+IEBAIC0zNCw2ICszNiw3IEBAIHN0cnVjdCBtZXNvbl9zZWN1cmVfcHdy
YyB7Cj4+Cj4+IMKgIHN0cnVjdCBtZXNvbl9zZWN1cmVfcHdyY19kb21haW5fZGVzYyB7Cj4+IMKg
wqDCoMKgwqAgdW5zaWduZWQgaW50IGluZGV4Owo+PiArwqDCoMKgwqAgdW5zaWduZWQgaW50IHBh
cmVudDsKPj4gwqDCoMKgwqDCoCB1bnNpZ25lZCBpbnQgZmxhZ3M7Cj4+IMKgwqDCoMKgwqAgY2hh
ciAqbmFtZTsKPj4gwqDCoMKgwqDCoCBib29sICgqaXNfb2ZmKShzdHJ1Y3QgbWVzb25fc2VjdXJl
X3B3cmNfZG9tYWluICpwd3JjX2RvbWFpbik7Cj4+IEBAIC05MCw4ICs5MywxOSBAQCBzdGF0aWMg
aW50IG1lc29uX3NlY3VyZV9wd3JjX29uKHN0cnVjdCAKPj4gZ2VuZXJpY19wbV9kb21haW4gKmRv
bWFpbikKPj4gwqAge8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcCj4+IMKgwqDCoMKgwqAg
Lm5hbWUgPSAjX19uYW1lLMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgXAo+PiDCoMKgwqDCoMKgIC5pbmRleCA9IFBXUkNfIyNfX25hbWUjI19JRCzCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIFwKPj4gLcKgwqDCoMKgIC5pc19vZmYgPSBwd3JjX3NlY3VyZV9pc19v
ZmYswqDCoCBcCj4+ICvCoMKgwqDCoCAuaXNfb2ZmID0gcHdyY19zZWN1cmVfaXNfb2ZmLMKgwqDC
oMKgwqDCoMKgwqDCoMKgIFwKPj4gwqDCoMKgwqDCoCAuZmxhZ3MgPSBfX2ZsYWcswqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcCj4+ICvCoMKgwqDCoCAucGFy
ZW50ID0gUFdSQ19OT19QQVJFTlQswqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcCj4+ICt9
Cj4+ICsKPj4gKyNkZWZpbmUgVE9QX1BEKF9fbmFtZSwgX19mbGFnLCBfX3BhcmVudCnCoMKgwqDC
oCBcCj4+ICtbUFdSQ18jI19fbmFtZSMjX0lEXSA9wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwKPj4gK3vCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBcCj4+ICvCoMKgwqDCoCAubmFtZSA9ICNfX25hbWUswqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcCj4+ICvCoMKgwqDCoCAuaW5kZXgg
PSBQV1JDXyMjX19uYW1lIyNfSUQswqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcCj4+ICvCoMKgwqDC
oCAuaXNfb2ZmID0gcHdyY19zZWN1cmVfaXNfb2ZmLMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwKPj4g
K8KgwqDCoMKgIC5mbGFncyA9IF9fZmxhZyzCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIFwKPj4gK8KgwqDCoMKgIC5wYXJlbnQgPSBfX3BhcmVudCzCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwKPj4gwqAgfQo+Pgo+PiDCoCBzdGF0
aWMgc3RydWN0IG1lc29uX3NlY3VyZV9wd3JjX2RvbWFpbl9kZXNjIGExX3B3cmNfZG9tYWluc1td
ID0gewo+PiBAQCAtMjAyLDYgKzIxNiw3IEBAIHN0YXRpYyBpbnQgbWVzb25fc2VjdXJlX3B3cmNf
cHJvYmUoc3RydWN0IAo+PiBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4+Cj4+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGRvbS0+cHdyYyA9IHB3cmM7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGRvbS0+aW5kZXggPSBtYXRjaC0+ZG9tYWluc1tpXS5pbmRleDsKPj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBkb20tPnBhcmVudCA9IG1hdGNoLT5kb21haW5zW2ldLnBhcmVudDsK
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZG9tLT5iYXNlLm5hbWUgPSBtYXRjaC0+ZG9t
YWluc1tpXS5uYW1lOwo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkb20tPmJhc2UuZmxh
Z3MgPSBtYXRjaC0+ZG9tYWluc1tpXS5mbGFnczsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgZG9tLT5iYXNlLnBvd2VyX29uID0gbWVzb25fc2VjdXJlX3B3cmNfb247Cj4+IEBAIC0yMTIs
NiArMjI3LDE1IEBAIHN0YXRpYyBpbnQgbWVzb25fc2VjdXJlX3B3cmNfcHJvYmUoc3RydWN0IAo+
PiBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHB3
cmMtPnhsYXRlLmRvbWFpbnNbaV0gPSAmZG9tLT5iYXNlOwo+PiDCoMKgwqDCoMKgIH0KPj4KPj4g
K8KgwqDCoMKgIGZvciAoaSA9IDA7IGkgPCBtYXRjaC0+Y291bnQ7IGkrKykgewo+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBtZXNvbl9zZWN1cmVfcHdyY19kb21haW4gKmRvbSA9
IHB3cmMtPmRvbWFpbnM7Cj4+ICsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoIW1h
dGNoLT5kb21haW5zW2ldLm5hbWUgfHwgbWF0Y2gtPmRvbWFpbnNbaV0ucGFyZW50IAo+PiA9PSBQ
V1JDX05PX1BBUkVOVCkKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgY29udGludWU7Cj4+ICsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwbV9nZW5wZF9h
ZGRfc3ViZG9tYWluKCZkb21bZG9tW2ldLnBhcmVudF0uYmFzZSwgCj4+ICZkb21baV0uYmFzZSk7
Cj4+ICvCoMKgwqDCoCB9Cj4+ICsKPj4gwqDCoMKgwqDCoCByZXR1cm4gb2ZfZ2VucGRfYWRkX3By
b3ZpZGVyX29uZWNlbGwocGRldi0+ZGV2Lm9mX25vZGUsIAo+PiAmcHdyYy0+eGxhdGUpOwo+PiDC
oCB9Cj4+Cj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1h
bWxvZ2ljCg==
