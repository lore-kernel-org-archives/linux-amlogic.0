Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27F27C27C40
	for <linux-amlogic@archiver.kernel.org>; Thu, 24 Aug 2023 08:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Np8XoC9Fixzx8fh/2bvkiln9MI7qOi+5gCx8SZpVAAs=; b=reIe+UzfI2RDPMUGPXb1EENgpk
	tIhbc1qOVhfmzQccD4IrQtys4MgHS1RCfiCUevDKcOx1WQGSLiOATomhwtTYz+5Srfp5pVputonyw
	PmE9XvZ9Y01MWyU7lexi211FuF5w0uWIUfWBK/dB7RvGYrXEj7uan5ZtNHNlVUHCcH/s046qg1Dvs
	lFWzu/xIUjHjcUuhSz6RR+2WMyZX7pDyHDC1lZ3PEeIJorI8Z+vU/2JK4H8O1hhsSvModJjSC6+KE
	jg3+oGOeU7mdEV9PPVHXkVO/FUlV/bFu9CnL3rQzmH0SXXKx9yQTJ7cgsdYMb6IO4w3NDF9jkqutc
	DwuCSBjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ5z2-002cBi-2R;
	Thu, 24 Aug 2023 08:46:28 +0000
Received: from mail-sgaapc01on20703.outbound.protection.outlook.com ([2a01:111:f400:feab::703] helo=APC01-SG2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ5yz-002cAT-0O;
	Thu, 24 Aug 2023 08:46:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VaPN800neYuE1Na6xKL/YNN5KgZ5cWUlbQy683TlixbSAG5wJWjvyXz56EOQAsJsUnrNoP3k3igTrt+ORtxv+82m2h48mbsvSQG7oHJfXcbHkO8zsYLJJvfYe3138MxohR8Hb+qrrBr91Kwubh7SVDpDWj5aBwxbUwYPPtUhoUwfSiiTIvhKlUL0Bnxw72CRxnOTT+l/PnLLSTVLFNGi0XSbMtNcK58+rQ4bdNcg1XY9AfJlIt0JfJO1dqFEGmxx1yZ73aKaaon/bn0XU7s2h9HDHA+vVckNFkYzyBy63O3AYZkVZbp6zfp8W+rxjcp5vdB8kPJ5fdxAsAuHfMMVlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kBW7YUDrFW5AEPUE8vlSwBsrSF5LzqyLyO+gpJqFzZA=;
 b=E7CNa0bQsARiYbAUOtnbotDbG5ApeeyMMigi0jPRQn9aNA5Ol7h+RCOsTy+yUWJf+IheZYd8jg9YsEECQN8eG5J3/PceqFsuV7cPPNtgvsPk7e6PKec2+CD2OxQr/aDT65ViOTSap/wzPQ9I0wx++w+nSiB/damORiCqzWioB4xxWwmuhOIIVAJO6UttyLK5QW+VNGfsqvnEbUKekxQCd2SQ+i66N8ZKw3Ma6z0ebux/7ciML8gqLZQzq9a3nDyj4vHDIh5jdFoiJI7oBTiPTuFbtvYpejgmxt6WNcY5yCyvgTOk9zpIIHY/GnGVdzvRIdG0ojxmet1SVurtNn6/WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kBW7YUDrFW5AEPUE8vlSwBsrSF5LzqyLyO+gpJqFzZA=;
 b=Wg+8Qvk+qWRAUDR+6JlRLSgGViorjPf9upeZKpAC7CcL8/h/1vGfApo6OenXqAOScu2aSIoD845+TkW7cfQq8QfKsuT10ZEmzrTdsqQUTH3uRQN8/FxHRtJ54hAEjW6jdhSxUs4xavSB9kdeGgA3cH0pByoeQUiiaoUwUN7l/bla+sso6JJ1+EKM4C/f1CRIjIwZ5Tor20Pt9IsGbR564cKSOjiLVWUPLTR8gfCscSXWjF4qqCJHzEblpTcE6Ia1xr94LlChy/qBFMiJ/h9XL7x1Qi91KZPmvHgJxMaRXpZbn9up6XB4k9nlSkJVjO7LxOcGOxMylsknpuMv7VsdMQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by SEYPR03MB8203.apcprd03.prod.outlook.com (2603:1096:101:1a2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Thu, 24 Aug
 2023 08:46:15 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::f065:6e23:803b:2a75]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::f065:6e23:803b:2a75%7]) with mapi id 15.20.6699.025; Thu, 24 Aug 2023
 08:46:15 +0000
Message-ID: <423f82b6-d6b8-ee2e-1b31-fe5f1552553e@amlogic.com>
Date: Thu, 24 Aug 2023 16:46:09 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH V2 3/6] soc: amlogic: init power domain state
Content-Language: en-US
To: neil.armstrong@linaro.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>
References: <20230824055930.2576849-1-xianwei.zhao@amlogic.com>
 <20230824055930.2576849-4-xianwei.zhao@amlogic.com>
 <91e4a3f1-84ed-4433-90fc-bdfb9b08e57a@linaro.org>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <91e4a3f1-84ed-4433-90fc-bdfb9b08e57a@linaro.org>
X-ClientProxiedBy: SI2P153CA0005.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::11) To TYZPR03MB6896.apcprd03.prod.outlook.com
 (2603:1096:400:289::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|SEYPR03MB8203:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e535ddd-0cab-4028-7079-08dba47e9390
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uvhdhvg9AGtj9O7JLNR9YhGzJugCo23GReqnbQe902l/HxoUCzAzVP97eMw1d/S9H0GXobxkKQ3Cp4ZJl+Rhva+L6Z0/WUpDsJMgVOFEXRWxkc01WWUrUhSb5A4dyKv9eQXVnYaQJsdMDGy/17yQPazaq02EIRLLppLmV+o+W2qHPLGL43sYyowtSWOSXDlfBPYm3iL06OoOzT2+JNB+anU1wdkuZQtCW0Jhq4r6KsZhCQnRnOjnObrwipGitA0crsR8b8UGuXjz3hfUW1q6fVElI2DfFwiNg/ktdz3jZuY4h/PLwnXEiVnUXyEGq4WIYngEtSRglQqDwYqUhyDcK0Yb0+7J/1VQXbRmtsIWiyZICBPqKVNyT/Z6x2ow9QbRxJTXjjIgVo2yD6trprODgSwlmMYOjazKIp+8SE/ZsHDbAta/cYMovHGEliF4k2clqkrEr4DvzvRNvARXkkudcTXDGkM0YxCQ4Ak4AyFUm1lKJ+YAj6uy4UFulO3ozLX+x+qnfgI9bYEQPYivl+S49XE4pmWJ4UGxEHjeL7iBPw7lctqtB7+MC5xj5MagKjCTl+KHUhJ0EACHcTdcpPnadGr2hU+fPRLo63JZ43ucF2ZzI4x1g0axFJTYYBznIRiz1s5aKsmgPbsudonkVS/N2vz7RhmrYz7JPzY5wxIoy+QcY7+c7EypZR9ywrXBDZlBBiSONrqYcF0wm5KVKXExNAe2SM6Tfo6sQy0DRVYIgANNv/yfQEKZ+EbqDZQCPxY/
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(376002)(346002)(396003)(39850400004)(451199024)(186009)(1800799009)(54906003)(66476007)(66556008)(66946007)(316002)(478600001)(26005)(44832011)(38100700002)(6666004)(86362001)(53546011)(6486002)(31696002)(41300700001)(6506007)(6512007)(12101799020)(31686004)(4326008)(8936002)(8676002)(2616005)(5660300002)(2906002)(83380400001)(36756003)(45980500001)(43740500002)(309714004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R3JrNjNZdHRHSjh1Y2JkdzcwWHo4MktBZXhQVFFvck1laWFQdUZZU3d3M2s4?=
 =?utf-8?B?L0tzeTNCN2xsaDIyWXFiS3J1a3ZmTnpVeEtWSXJIVVBmQ0RQc2hLMFZYSGdD?=
 =?utf-8?B?UTFqZDVXOEp0Z0Rjc0FRTTEwc2o5ODVubmg5WmgydlBZc1lEMGhDZGFxbVZq?=
 =?utf-8?B?L2FXN0xxbm85UUV4OWw4akVkRFR1M1hyVEVDQUFXcVdRWGduWkE5YUZwdjFv?=
 =?utf-8?B?QnlacWFjSHYvbUV3eFlKQlN1UUVQTzBNcUVVaVpSTWFjV2kvMWZNa0xsaDVs?=
 =?utf-8?B?YWdCaDAyNHVvZVR3ZTdteGVCNlBDSnRIT3E1ZmMxRHJxb0U5bEtDQjlDaHM0?=
 =?utf-8?B?cmx2L0R0WXR4bnhPaUlVSnJMeS9oN29Ha1ZCcWxFVUJML3MrQ0plaFRMY0M3?=
 =?utf-8?B?SWRFbkZENm5DT09tZXU4WUFRUHJZZklIQjU2RWpkTnIrenZYNFZqMWM1aEdW?=
 =?utf-8?B?NHlsZ0lPSEY4b3N4YVBieXpFcHI4SWhaVFJ5Z3A4UzhHb2NHMWZLSW44WWpj?=
 =?utf-8?B?NVN3dFJxK3lib2R3VG5tSWM3MUluQzNOZnI3cFpyS0hndlE1cjRsMjhxeU5J?=
 =?utf-8?B?YWpmaGtDaTVLL01Ca3daSmNTQTJkb3lSQ2ZRU21vT3dxYlBvQURBVmlYN0px?=
 =?utf-8?B?cTJvamxvTlQ5M1RSUDl2bExSUkV3K25WdUhWRlA4MXF2SEw0ZHpaQUhwaEgr?=
 =?utf-8?B?WXk1V0VUZUdrS2tWRVc0aTgyMU9tWE1qNFFSUUJWeEk1cWtDWjlSSFJHK1Nk?=
 =?utf-8?B?Zkk5V0FTTVdSRGVRWjlyVVR4aTVKZFQ2bFNqblArNGlxd21zQk00NTU2Njcr?=
 =?utf-8?B?bncwb21IQkh2SHh5V0RVOGNhTGx5U3Y5aWc2QVM1NUR0RUw1cWM0REMzYWRL?=
 =?utf-8?B?TzlkaDcxVGEzdEJvQmhwL2liblZDVnhjQjZWdWN5Qm5BME8zSG1zL0hHR1Fk?=
 =?utf-8?B?WkNwOVRaWlR5aEJnVlIvWHJEWjd5QnYybTl2KzdoWnRkZXRKSmdYTEVZWXNE?=
 =?utf-8?B?SGlTelJPUjBhaTZaOG5JaC8vNy9VazdhczJrSThUeU02OHpDV1c1V0pSWXUz?=
 =?utf-8?B?VG1FWm5iaG5VQkErRFRVUXJZTUJCYTU3ZkRISVR5NUR3R2ZOYi9wYlZNREFq?=
 =?utf-8?B?YXhCemhaS3RYK1VBTU5mdVhMcWtVbW5UaUliQ2pPYTRCS2hGdDErdndneVVy?=
 =?utf-8?B?dnJnQ0I3U0wrUFhDRVB4OHhZdVowaXltQ2k1NEYzU2VhU2kwYngxV2F0Q2Zs?=
 =?utf-8?B?VnN6enJsNmVhbkVGOFAvdUl5MUYvWkREaW1oOEJ0SDBEMzNTK3BXYmwxZmNp?=
 =?utf-8?B?bitGRTRDS2F2cjcrOEo4MGllMUtCL2ZpMHgyOGMyZ24xaCtjZGNhNEhZcFBS?=
 =?utf-8?B?NjNZbWJLREE4RmJKZDNDQXB1cHRPQVJEcFdJSi9zUlR1N0JVTnoweHFuVWlj?=
 =?utf-8?B?d1hyZFcyMkgyTFVXaitZUEluN1llQVgrZ0JlR0cxemllTHZaZlFPV1pLL0RF?=
 =?utf-8?B?WnowNVRnZlhvcFA5QllObjMzVG5HM1RIeFFPRkRPdU52RHdBdkdxNDlqNEpC?=
 =?utf-8?B?TldZKzJ2TXRRaFkyYllFcHZlRkRyY0JzRFFKMTNZcmM5T0hHVUlMNXN6b2tq?=
 =?utf-8?B?UTgrUDR5UEVhNDBFUWJ4TDJBenBtV1VHNUNzY3FPT2FnQlBNZVZBU3U2Z0RO?=
 =?utf-8?B?dzFkZlNzSkNod1hIS3JremI5WExDZ0pqc0k3Z1QwUWVpTzBYVmxaQ1hZS0Qz?=
 =?utf-8?B?bFhIZzZYU1hIQVVUZm54Z1o1V1pnQU5lT2t3Vkw0ZzlqbU5KT0Q4T2NDd1Br?=
 =?utf-8?B?U0s0dzVvOU9NMHpIMkg0SjdqMVRsVFFNejg4TzcyckhSQm1EaEYzWlU1YzF0?=
 =?utf-8?B?SFNDVWV3T1E3azEwVWZKNHdaYlpjR2E2SG92U3RmVHVUQmZLcnNpRk1TazZD?=
 =?utf-8?B?bHk5eDkyaEFWeWd1SnBTYmFJWWExWjI2T1FHaisvSmlCNEJ3dk5VWDV4VzVS?=
 =?utf-8?B?emFiMmY2Ri9pR2sreEdENFNHenVSNEtSOEoyb1lpVVdsZnZkVEoyN0pkTDBG?=
 =?utf-8?B?ODBESzYrWG1qQXo1NVNqVC9qTWIvUTArYnJPSkhtM0J1SkxtNGUzZ3Z0RzdL?=
 =?utf-8?B?dGs3K3IvRzBGUUxJdWVhUEVldHZNOWpiOHh2R1l2QzVsYVhhNXNuK0JHS1Q3?=
 =?utf-8?B?T3c9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e535ddd-0cab-4028-7079-08dba47e9390
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2023 08:46:15.2650
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sa3Wap/jp6Zk2bb1JYXoSV81YzfmbMRWnOaaIl1UzjCEw03Dg1cii2Lh+fyyEQCLHFEDl148HVhqBFG7q9ThLZ2VaPg7iDCWwbMcbnEqnyo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB8203
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230824_014625_160793_51F41EAF 
X-CRM114-Status: GOOD (  19.00  )
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

SGkgTmVpbCwKICAgIFRoYW5rcyBmb3IgeW91ciByZXBseS4KCk9uIDIwMjMvOC8yNCAxNjozMCwg
TmVpbCBBcm1zdHJvbmcgd3JvdGU6Cj4gWyBFWFRFUk5BTCBFTUFJTCBdCj4gCj4gSGksCj4gCj4g
T24gMjQvMDgvMjAyMyAwNzo1OSwgWGlhbndlaSBaaGFvIHdyb3RlOgo+PiBGcm9tOiAieGlhbndl
aS56aGFvIiA8eGlhbndlaS56aGFvQGFtbG9naWMuY29tPgo+Pgo+PiBJZiBpbml0aWFsIHBvd2Vy
IGRvbWFpbiB3aXRoICdBV0FZX09OJyBwcm9wZXJ0eSBzdGF0ZSBpcyBvZmYsCj4+IHR1cm4gb24g
dGhlIHBvd2VyLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiB4aWFud2VpLnpoYW8gPHhpYW53ZWkuemhh
b0BhbWxvZ2ljLmNvbT4KPj4gLS0tCj4+IFYxIC0+IFYyOiBOb25lCj4+IC0tLQo+PiDCoCBkcml2
ZXJzL2dlbnBkL2FtbG9naWMvbWVzb24tc2VjdXJlLXB3cmMuYyB8IDUgKysrKy0KPj4gwqAgMSBm
aWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Pgo+PiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9nZW5wZC9hbWxvZ2ljL21lc29uLXNlY3VyZS1wd3JjLmMgCj4+IGIvZHJp
dmVycy9nZW5wZC9hbWxvZ2ljL21lc29uLXNlY3VyZS1wd3JjLmMKPj4gaW5kZXggNzY1MjdmNDk0
NmI0Li4zZTdlM2JkMjVkMWYgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvZ2VucGQvYW1sb2dpYy9t
ZXNvbi1zZWN1cmUtcHdyYy5jCj4+ICsrKyBiL2RyaXZlcnMvZ2VucGQvYW1sb2dpYy9tZXNvbi1z
ZWN1cmUtcHdyYy5jCj4+IEBAIC01NSw3ICs1NSw3IEBAIHN0YXRpYyBib29sIHB3cmNfc2VjdXJl
X2lzX29mZihzdHJ1Y3QgCj4+IG1lc29uX3NlY3VyZV9wd3JjX2RvbWFpbiAqcHdyY19kb21haW4p
Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcHdyY19k
b21haW4tPmluZGV4LCAwLCAwLCAwLCAwKSA8IDApCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHByX2VycigiZmFpbGVkIHRvIGdldCBwb3dlciBkb21haW4gc3RhdHVzXG4iKTsKPj4KPj4g
LcKgwqDCoMKgIHJldHVybiBpc19vZmY7Cj4+ICvCoMKgwqDCoCByZXR1cm4gISFpc19vZmY7Cj4g
Cj4gQ2FuIHlvdSBleHBsYWluIHRoaXMgPyB0aGUgZnVuY3Rpb24gcmV0dXJucyBib29sLCBzbyBp
ZiBpZl9vZmYgaXMgPiAwLCAKPiBpdCB3b3VsZCByZXR1cm4gdHJ1ZSwKPiBzbyBJIGRvbid0IHNl
ZSB3aHkgeW91IHdvdWxkIG5lZWQgdG8gdHJhbnNmb3JtIGlzX29mZiBpbnRvIDEgb3IgMCB1c2lu
ZyAhIS4KPiAKSSB3aWxsIHJlbW92ZSB0aGlzIG1vZGlmeSwgaW4gbmV4dCB2ZXJzaW9uLgo+PiDC
oCB9Cj4+Cj4+IMKgIHN0YXRpYyBpbnQgbWVzb25fc2VjdXJlX3B3cmNfb2ZmKHN0cnVjdCBnZW5l
cmljX3BtX2RvbWFpbiAqZG9tYWluKQo+PiBAQCAtMjIyLDYgKzIyMiw5IEBAIHN0YXRpYyBpbnQg
bWVzb25fc2VjdXJlX3B3cmNfcHJvYmUoc3RydWN0IAo+PiBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYp
Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRvbS0+YmFzZS5wb3dlcl9vbiA9IG1lc29u
X3NlY3VyZV9wd3JjX29uOwo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkb20tPmJhc2Uu
cG93ZXJfb2ZmID0gbWVzb25fc2VjdXJlX3B3cmNfb2ZmOwo+Pgo+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGlmIChtYXRjaC0+ZG9tYWluc1tpXS5pc19vZmYoZG9tKSAmJiAoZG9tLT5iYXNl
LmZsYWdzICYgCj4+IEdFTlBEX0ZMQUdfQUxXQVlTX09OKSkKPj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbWVzb25fc2VjdXJlX3B3cmNfb24oJmRvbS0+YmFzZSk7
Cj4+ICsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcG1fZ2VucGRfaW5pdCgmZG9tLT5i
YXNlLCBOVUxMLCAKPj4gbWF0Y2gtPmRvbWFpbnNbaV0uaXNfb2ZmKGRvbSkpOwo+Pgo+PiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwd3JjLT54bGF0ZS5kb21haW5zW2ldID0gJmRvbS0+YmFz
ZTsKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9n
aWMK
