Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AFD2C0015E
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Jul 2023 02:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vLGVJRK/2Upsqy9cViBgSBOWBizo0mOqdycb+OYehZ8=; b=JHNaIzzLxTnt69cI1GM6ny9fFV
	eWq2ZS+AYRcWORYP/pEyJCmFvTywqBkT+XTgG2SHZgCleFwbN6mDlTpPN0on+wpKQ1MSu1QgWdP/7
	E3gaNTYZnuTdVypgwrN7CMlMklh7DUanIP7D/PGlNedeH9BhNOu8Y6e3F3lap/8PTFb4xI8wyeMg2
	jsehtzRZ5HuJcf5J7m8tBF1IiqILGt2Qoxm9bmEXlqS2OPnrzIe/+kz5/7+X0mMLCeeBLI0ejbyg4
	PJscv4U+HrfeSXUyZmWLArZE/lrhYAj690v82wekoRY1PnhaJwbBRsNERKM8sUE6FBy0hZUjviGNZ
	gWxooxEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGVfG-00Bui8-2g;
	Tue, 04 Jul 2023 02:21:14 +0000
Received: from mail-psaapc01on20724.outbound.protection.outlook.com ([2a01:111:f400:feae::724] helo=APC01-PSA-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGVfD-00Bugk-0e;
	Tue, 04 Jul 2023 02:21:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mXFPdcgCP/H0yertXt08NxQKhyfQfMEZiS4PXzu5CBmu6rCrjKeuzjNIwNP7GP7S/UK0/puUNITXZ21/l01QBUE8zg6o3UjrHSb88ozftwFNlzINnoQddgZKiKA2CMvFHTzhaSd5AkMT0EONA5NgNHHgx8OuLcjcQNqjpJwRJ3bI/YZtHlb+mNWFUjvyKPMEYDKr8GH3Gv7lKKdjm8bqbe0MaMGktLjfmrGRq3CVHZ71E/AHSkFI70/k0rGudQqCb7Eih9m6sqCpZVQU7VN9iX9miTol5wEV8cA5/Su4Qtau55ofpC1YPK4B8Hukls9GX8uic9xfo3xp0GhN7OY7nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uTzXajv6NkdlGJahEkyxO7sJ2tUdORVWX1htD7GtWpo=;
 b=epG5RdcEdp61sPMP5PXwyZaSih5lXATAfP0qKqfyJTcEx8QR0ysozW1g3WA9UOVjmtwcra9b1meQbgvELqDdIfeI3pT9D7W3EF3uBGHLt4c9u7gbpEk26DPih0W3UfMFHjAdSvJ8z3hckFxS4aoqpAcn2d37PBRFsCRTPflVl5J9cJ5LfKvWD31sGGo14FDlQ8/enTnfo/XBhPV+X1FXq3q69Jfhy+oNRForP9U1OTKCL37fS+ZjdA11uINzM02rj2XA2cTgkZRpK3fNBYWiJkgLzw7ydiy3QarXICboVCfwHGg6768KWpki0ujd4Q6nhJRzIEcBhftO7ogWQhVUvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uTzXajv6NkdlGJahEkyxO7sJ2tUdORVWX1htD7GtWpo=;
 b=G0/6gwoZy8jgf32R3xDjRmiP/CWo57wcLcvDrj045hayUgO4WWbxkMTWn9twNH+L5xT9TjTEOeZGi+WLpx9Z+QjrbS7Y79NNjvR16JDuUeBiQVZ5UEGZ3qFwIziLhFUP2NnOEWRLym9ikgsBUxlnnmk/V8sILDyXv4R1sQALhuhTFA6u8r2g/cfMt09lkOhXxqikRlLL6kWYSYIA1vdY9FZvsLU3pbbmY8MJBNR8/EoNlMGWUW+ABOP+h/5zqKZPHmy8C/fck/ONPgYoAFj06wC9pFg9+yJM9kY7Jt7iwuNymwhtlxRGztKewDA8pWEhhhoSmteaHFQJmCO2vcw/gg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by SEYPR03MB7757.apcprd03.prod.outlook.com (2603:1096:101:147::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Tue, 4 Jul
 2023 02:20:57 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::c478:28ff:9d91:61f5]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::c478:28ff:9d91:61f5%5]) with mapi id 15.20.6544.024; Tue, 4 Jul 2023
 02:20:57 +0000
Message-ID: <37fe4ab3-323d-f025-5168-352b054faf8b@amlogic.com>
Date: Tue, 4 Jul 2023 10:20:52 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 2/3] soc: c3: Add support for power domains controller
Content-Language: en-US
To: neil.armstrong@linaro.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>
References: <20230703093142.2028500-1-xianwei.zhao@amlogic.com>
 <20230703093142.2028500-3-xianwei.zhao@amlogic.com>
 <e85f6dee-d62c-9f2f-b1de-8c38bb5aeb14@linaro.org>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <e85f6dee-d62c-9f2f-b1de-8c38bb5aeb14@linaro.org>
X-ClientProxiedBy: TYCP301CA0031.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:380::8) To TYZPR03MB6896.apcprd03.prod.outlook.com
 (2603:1096:400:289::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|SEYPR03MB7757:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e92b1a3-9c73-4bcd-0716-08db7c354d26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oDO7DWjmRgayUAmlcgdBB5F806vqkuc+op7ELnhqLOqMYucswIztk6B1dpkm0r9OPPKu0p0j4NX19BpW+ee83mmjxkNUV0K8KZhmd54hBrE6jHSms6eaDC26JVFy6QUlkFs4RfFBG8yvdess3XA/zv6cO9wh5hcLIiC8j/gExbpo7qyxRWe6xNfQxZYHZ8H/7R5Ulg0djJMRUy+Pb9Cu/YJjv1PN5obAmELE9grXSdeV4bfC7DiB1CrGWjt64wVGx/8xY6BR0CGCuOlaMRJB2PbqSBOwAW8dXQQHXXSUSWdx2VuqYS5wyJgUwD4VzW2eH/tZLuXid9lyZQXCVYXcF/1/AyWqmSR2k9HpLdSjbe1VfiLu+poMzVGH+HN4zeuaW6ZO2Mt2MdwQo8a6dnTDsTulI9Txs8Ek4j8ALkhvhiZ5r7niGxam2hNpYECV1YX/DT4JQ2ShFh4lkUdK7dKBj7tuFpPOYD23Pa5yT1cLNAfIY9WEjExsMYVraoKJnKyf8wc0eMXGkSHHVp9VlvqfBxWyjuMC5YlXLQ89B3fHIh580iYjqazjiO765QncpAGJq0UvI9VYlc/kZvhe3qvP0VLp2IKq4KsbjV6pHyVGzAVijtDQYblb19Jzs4vuO1dD2xX/tbvnT9tQlZf2Vc2mLCb1eEFYx40N6HJIWjp2OYDGi127DGoxHk70dVsGpUDtd9KvOeMaRh2SMkNIHuS7OQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39850400004)(366004)(396003)(376002)(136003)(346002)(451199021)(2906002)(41300700001)(5660300002)(8676002)(8936002)(44832011)(36756003)(86362001)(31696002)(186003)(2616005)(478600001)(26005)(6512007)(6506007)(6666004)(31686004)(53546011)(6486002)(316002)(4326008)(66476007)(66556008)(66946007)(38100700002)(54906003)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VGNFZ2tpNHkzYkx5V2IvMS9Edk52SGRRVXJzUUhndGVDbThhVlNKdDBiMkF0?=
 =?utf-8?B?ZDJyNDdJSjRadXlyLzh3eG10RkdQNkh6aTIyMmV6QUxYQUFZWldYT0VEMHEx?=
 =?utf-8?B?a2JLdU05RmRDa25McUtkVUxjRy9YdmZuMEJLS1QrMTlwUjBBdmNRWC81cURM?=
 =?utf-8?B?TFdIWUNZTXhWMWVIODZhelVsUnFaQ0Y5UmdYVEc1QnBnWEwzTjJpam9HM1NR?=
 =?utf-8?B?dFdBS29DT3BEMzFTYm9rQzhvdEJXWTF3SDBCSncrbXh2bVdET2VOV0theElm?=
 =?utf-8?B?MldWRUFPZ1VUSmt1cWtSY3h3d1ZVblVLdkhwUFBTTUxvT0tCK3BVNHhMOXBj?=
 =?utf-8?B?Vys3a3FtOHRveEZJTjNvMStSbURxYVVEMG0wRXFnTTRPRVZMQ0RteWVvSnhl?=
 =?utf-8?B?aWRIWVFid2g1eFhrMHZIOFMzNE04Y2pqOUJ3L2h2M2x6YWpqQ20weVQxN1JT?=
 =?utf-8?B?UXlXaklwc3BrM0ZjK096c3VnQTJFbTUrZDNGaXBVb1pndURFd3JDU1pjUFYy?=
 =?utf-8?B?MTEycWFoWWV6YUwzMWNFeEtPanFWS2hnUUlhRGtkNXJzL3FLZnE1NU5aU3ds?=
 =?utf-8?B?bzhCUVVSdW9EM3U1TDEzQzBWd3kwWXJzc2FoV3d1T0NIblN3YkdJbHlXVUxD?=
 =?utf-8?B?S0tROGZ4S0hLcC9oMHBKbjNsSG9uNVVGSm1lQjl3d3lpakV4MnlTM3p4U010?=
 =?utf-8?B?QkdIUnFwT0ZvQTBGV0pjbWtGSHkwODZrVnJUVzEyL1pOUjJJZXlSQ1JEcy9v?=
 =?utf-8?B?UmlkTnlmRnl1YjBGR0I4MDhSZld1akxVaUxJZWNhQ3A1ODkzay9tRlRQNGNi?=
 =?utf-8?B?UTRRUDh0WFY5NUNZdHNqUCtYOS8rRnlzSzlyemNvc3NIZDRrUkx1OXgwRW9L?=
 =?utf-8?B?T0tCNERlaU1zQVNvM25ZditjdmZjY3ZEc1JKZUVTby92dEk1OExSOEl1THRL?=
 =?utf-8?B?UDZVZVJuSm53ZFRRRGJDYlREMDQ5V3VMc2kxMG9VU0xrVXBkRzk4S1JyZ3BD?=
 =?utf-8?B?M1BVcUloN3E1VjlQQUFGRDBERW5SdDVNZkd1dlNGZzdVYS9rVVVORVM2cXE4?=
 =?utf-8?B?Snc3b2F1ODB2bmU4Q1h5Y3ZOODkzRnRSYVg2UDgyemJyMk0vZUc3TDV6WFhF?=
 =?utf-8?B?Z3k4N2MxZ0pqZkdieHpGelBCejNLWlRLK2txZjExVUVEeEFQV09iQ1dwbnpK?=
 =?utf-8?B?SkJlbm0rQ2JlQ2NrZzBQL3NqQ1Zrb2RvUUZqSjZiYTYzd21qSVU4NHVqYTlS?=
 =?utf-8?B?b1ViNFRPSnlGV1paOTcraWt0Q0pCYWEvS1dTYml6dVhUVWxzZWh3eDdJNnNt?=
 =?utf-8?B?NFNHT01JZ2FtQnZjREgweHIvbEhPMlRaQWFiY2t6QTBPbEllRm9IM1RLNEh3?=
 =?utf-8?B?UWFMZ3FxRkJycDhtRDUzcmErRld6SGJtOGpoeHJUNm1CK3k4dmR5VUJ1eHNB?=
 =?utf-8?B?cjE3MmxpUGFhOHJ3eC9oRjVXNEdtY1lBK05QNThrdUxhVG8xQzdSOFBJZm53?=
 =?utf-8?B?cm5WZEpwS0JncThDb29KT3pMZzRLZjdPYkl1RThINlEzZDBuMlNSVGJnSXpl?=
 =?utf-8?B?dGYyVG5uQ1IrNGhkSFhrZjk1U1lyc01KWUpBU2VBUGRqcmtDYm1IbGowZ21V?=
 =?utf-8?B?dU1qdFRFVzFiUmhrSU9zZWxVOTN3RnlHc0dYMmhPMElHaERSRzJpdmF2S1lU?=
 =?utf-8?B?MXliejVXQ2R3UjFIbE5zZWhUN1VzanhLQXNML1c4d0x1THZuYVJuTm1FWFRQ?=
 =?utf-8?B?ZHZiRWpSbXk2NDIwYndSMExwRmM3bjJUa0JuWWVJa0dTTjkzZUoyYzZXTGIy?=
 =?utf-8?B?eG84Mit2dTNGRWRGcXV0bFRPNkJSajg1OFJOYmlxSE5HYWVyM1lOckdvODBU?=
 =?utf-8?B?eW84NHBDdTZLZHd1TUU5azYwUU1BamtZc0Jla2k0S2wwM3hKSkladFFnUmNx?=
 =?utf-8?B?ZFlwQkZwSVhiYWtHd0VVanM3dzFxV2p1UFBYMzNodXVSRFRrRWJwZTAyTjRJ?=
 =?utf-8?B?MVZQYmxibDA1OUgyeVI5c2dYRGZ3b00xcVhXYXFXUmNVYXV5Um1OMWd3QjBl?=
 =?utf-8?B?YTFUK3c5R1VuZDh1cXlkQUxvV3J6bUhOZms2cnYyL2R5bldFNFhrME5xSlIv?=
 =?utf-8?B?aEtMNTN3d3pVMUlLM2FWZ1ZLZHVmVjBMYUQxOUFwRGVxNWE1QnlqLzZzZW5C?=
 =?utf-8?B?NUE9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e92b1a3-9c73-4bcd-0716-08db7c354d26
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2023 02:20:57.3496
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L5+bUkyL0W2JwPjqJ95A/txQ9qdxlFPB8wPdwIMyMr745sc+U6oiw33Xze/gCE40Gh0Av0gbyUO5TKQv0ntupNtHLJJD/PxfnmujHM7bPMw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7757
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230703_192111_256613_B3A7F9A6 
X-CRM114-Status: GOOD (  22.86  )
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

SGkgTmVpbCwKICAgICBUaGFua3MgZm9yIHlvdXIgcmVwbHkuCgpPbiAyMDIzLzcvMyAyMToyOSwg
TmVpbCBBcm1zdHJvbmcgd3JvdGU6Cj4gWyBFWFRFUk5BTCBFTUFJTCBdCj4gCj4gSGksCj4gCj4g
T24gMDMvMDcvMjAyMyAxMTozMSwgPVhpYW53ZWkgWmhhbyB3cm90ZToKPj4gRnJvbTogWGlhbndl
aSBaaGFvIDx4aWFud2VpLnpoYW9AYW1sb2dpYy5jb20+Cj4+Cj4+IEFkZCBzdXBwb3J0IGZvciBD
MyBQb3dlciBjb250cm9sbGVyLiBDMyBwb3dlciBjb250cm9sCj4+IHJlZ2lzdGVycyBhcmUgaW4g
c2VjdXJlIGRvbWFpbiwgYW5kIHNob3VsZCBiZSBhY2Nlc3NlZCBieSBTTUMuCj4+Cj4+IFNpZ25l
ZC1vZmYtYnk6IFhpYW53ZWkgWmhhbyA8eGlhbndlaS56aGFvQGFtbG9naWMuY29tPgo+PiAtLS0K
Pj4gwqAgZHJpdmVycy9zb2MvYW1sb2dpYy9tZXNvbi1zZWN1cmUtcHdyYy5jIHwgMjggKysrKysr
KysrKysrKysrKysrKysrKysrLQo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMjcgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zb2MvYW1sb2dpYy9t
ZXNvbi1zZWN1cmUtcHdyYy5jIAo+PiBiL2RyaXZlcnMvc29jL2FtbG9naWMvbWVzb24tc2VjdXJl
LXB3cmMuYwo+PiBpbmRleCAyNWI0YjcxZGY5YjguLjM5Y2NjOGYyZTYzMCAxMDA2NDQKPj4gLS0t
IGEvZHJpdmVycy9zb2MvYW1sb2dpYy9tZXNvbi1zZWN1cmUtcHdyYy5jCj4+ICsrKyBiL2RyaXZl
cnMvc29jL2FtbG9naWMvbWVzb24tc2VjdXJlLXB3cmMuYwo+PiBAQCAtMTIsNiArMTIsNyBAQAo+
PiDCoCAjaW5jbHVkZSA8bGludXgvcG1fZG9tYWluLmg+Cj4+IMKgICNpbmNsdWRlIDxkdC1iaW5k
aW5ncy9wb3dlci9tZXNvbi1hMS1wb3dlci5oPgo+PiDCoCAjaW5jbHVkZSA8ZHQtYmluZGluZ3Mv
cG93ZXIvbWVzb24tczQtcG93ZXIuaD4KPj4gKyNpbmNsdWRlIDxkdC1iaW5kaW5ncy9wb3dlci9h
bWxvZ2ljLWMzLXBvd2VyLmg+Cj4+IMKgICNpbmNsdWRlIDxsaW51eC9hcm0tc21jY2MuaD4KPj4g
wqAgI2luY2x1ZGUgPGxpbnV4L2Zpcm13YXJlL21lc29uL21lc29uX3NtLmg+Cj4+IMKgICNpbmNs
dWRlIDxsaW51eC9tb2R1bGUuaD4KPj4gQEAgLTEzMiw2ICsxMzMsMjIgQEAgc3RhdGljIHN0cnVj
dCBtZXNvbl9zZWN1cmVfcHdyY19kb21haW5fZGVzYyAKPj4gczRfcHdyY19kb21haW5zW10gPSB7
Cj4+IMKgwqDCoMKgwqAgU0VDX1BEKFM0X0FVRElPLMKgwqDCoMKgwqDCoMKgIDApLAo+PiDCoCB9
Owo+Pgo+PiArc3RhdGljIHN0cnVjdCBtZXNvbl9zZWN1cmVfcHdyY19kb21haW5fZGVzYyBjM19w
d3JjX2RvbWFpbnNbXSA9IHsKPj4gK8KgwqDCoMKgIFNFQ19QRChDM19OTkEswqAgMCksCj4+ICvC
oMKgwqDCoCBTRUNfUEQoQzNfQVVESU8swqDCoMKgwqDCoMKgwqAgR0VOUERfRkxBR19BTFdBWVNf
T04pLAo+PiArwqDCoMKgwqAgU0VDX1BEKEMzX1NESU9BLMKgwqDCoMKgwqDCoMKgIEdFTlBEX0ZM
QUdfQUxXQVlTX09OKSwKPj4gK8KgwqDCoMKgIFNFQ19QRChDM19FTU1DLCBHRU5QRF9GTEFHX0FM
V0FZU19PTiksCj4+ICvCoMKgwqDCoCBTRUNfUEQoQzNfVVNCX0NPTUIsIEdFTlBEX0ZMQUdfQUxX
QVlTX09OKSwKPj4gK8KgwqDCoMKgIFNFQ19QRChDM19TRENBUkQswqDCoMKgwqDCoMKgIEdFTlBE
X0ZMQUdfQUxXQVlTX09OKSwKPj4gK8KgwqDCoMKgIFNFQ19QRChDM19FVEgswqAgR0VOUERfRkxB
R19BTFdBWVNfT04pLAo+PiArwqDCoMKgwqAgU0VDX1BEKEMzX0dFMkQsIEdFTlBEX0ZMQUdfQUxX
QVlTX09OKSwKPj4gK8KgwqDCoMKgIFNFQ19QRChDM19DVkUswqAgR0VOUERfRkxBR19BTFdBWVNf
T04pLAo+PiArwqDCoMKgwqAgU0VDX1BEKEMzX0dEQ19XUkFQLMKgwqDCoMKgIEdFTlBEX0ZMQUdf
QUxXQVlTX09OKSwKPj4gK8KgwqDCoMKgIFNFQ19QRChDM19JU1BfVE9QLMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIEdFTlBEX0ZMQUdfQUxXQVlTX09OKSwKPj4gK8KgwqDCoMKgIFNFQ19QRChD
M19NSVBJX0lTUF9XUkFQLCBHRU5QRF9GTEFHX0FMV0FZU19PTiksCj4+ICvCoMKgwqDCoCBTRUNf
UEQoQzNfVkNPREVDLMKgwqDCoMKgwqDCoCAwKSwKPj4gK307Cj4gCj4gUGxlYXNlIG1vdmUgdGhp
cyBzdHJ1Y3QgYmVmb3JlIF9zNF8KPiAKV2lsbCBkby4KPj4gKwo+PiDCoCBzdGF0aWMgaW50IG1l
c29uX3NlY3VyZV9wd3JjX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4+IMKg
IHsKPj4gwqDCoMKgwqDCoCBpbnQgaTsKPj4gQEAgLTE3OSw3ICsxOTYsNyBAQCBzdGF0aWMgaW50
IG1lc29uX3NlY3VyZV9wd3JjX3Byb2JlKHN0cnVjdCAKPj4gcGxhdGZvcm1fZGV2aWNlICpwZGV2
KQo+PiDCoMKgwqDCoMKgIGZvciAoaSA9IDAgOyBpIDwgbWF0Y2gtPmNvdW50IDsgKytpKSB7Cj4+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBtZXNvbl9zZWN1cmVfcHdyY19kb21h
aW4gKmRvbSA9ICZwd3JjLT5kb21haW5zW2ldOwo+Pgo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGlmICghbWF0Y2gtPmRvbWFpbnNbaV0uaW5kZXgpCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgaWYgKCFtYXRjaC0+ZG9tYWluc1tpXS5uYW1lKQo+IAo+IElzIHRoaXMgY2hhbmdlIG5l
Y2Vzc2FyeSA/IElmIHllcyBwbGVhc2UgbW92ZSBpdCB0byBhbm90aGVyIHBhdGNoCj4gYW5kIGV4
cGxhaW4gaXQncyBwdXJwb3NlLiBJZiBpdCBmaXhlcyBzb21ldGhpbmcsIGFkZCBhIEZpeGVzIHRh
ZyBzbwo+IGl0IGNhbiBiZSBiYWNrcG9ydGVkLgo+IApUaGlzIHZhcmlhYmxlIGZvciBDMyBjb3Vs
ZCBiZSBlcXVhbCB0byB6ZXJvLiBJIHdpbGwgbW92ZSBpdCB0byBhbm90aGVyIApwYXRjaC4KPiBU
aGFua3MsCj4gTmVpbAo+IAo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgY29udGludWU7Cj4+Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRvbS0+cHdy
YyA9IHB3cmM7Cj4+IEBAIC0yMDcsNiArMjI0LDExIEBAIHN0YXRpYyBzdHJ1Y3QgbWVzb25fc2Vj
dXJlX3B3cmNfZG9tYWluX2RhdGEgCj4+IG1lc29uX3NlY3VyZV9zNF9wd3JjX2RhdGEgPSB7Cj4+
IMKgwqDCoMKgwqAgLmNvdW50ID0gQVJSQVlfU0laRShzNF9wd3JjX2RvbWFpbnMpLAo+PiDCoCB9
Owo+Pgo+PiArc3RhdGljIHN0cnVjdCBtZXNvbl9zZWN1cmVfcHdyY19kb21haW5fZGF0YSAKPj4g
YW1sb2dpY19zZWN1cmVfYzNfcHdyY19kYXRhID0gewo+PiArwqDCoMKgwqAgLmRvbWFpbnMgPSBj
M19wd3JjX2RvbWFpbnMsCj4+ICvCoMKgwqDCoCAuY291bnQgPSBBUlJBWV9TSVpFKGMzX3B3cmNf
ZG9tYWlucyksCj4+ICt9Owo+IAo+IFBsZWFzZSBtb3ZlIHRoaXMgc3RydWN0IGJlZm9yZSBfczRf
Cj4gCj4+ICsKPj4gwqAgc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgbWVzb25fc2Vj
dXJlX3B3cmNfbWF0Y2hfdGFibGVbXSA9IHsKPj4gwqDCoMKgwqDCoCB7Cj4+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIC5jb21wYXRpYmxlID0gImFtbG9naWMsbWVzb24tYTEtcHdyYyIsCj4+
IEBAIC0yMTYsNiArMjM4LDEwIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIAo+
PiBtZXNvbl9zZWN1cmVfcHdyY19tYXRjaF90YWJsZVtdID0gewo+PiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCAuY29tcGF0aWJsZSA9ICJhbWxvZ2ljLG1lc29uLXM0LXB3cmMiLAo+PiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAuZGF0YSA9ICZtZXNvbl9zZWN1cmVfczRfcHdyY19kYXRh
LAo+PiDCoMKgwqDCoMKgIH0sCj4+ICvCoMKgwqDCoCB7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgLmNvbXBhdGlibGUgPSAiYW1sb2dpYyxjMy1wd3JjIiwKPj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCAuZGF0YSA9ICZhbWxvZ2ljX3NlY3VyZV9jM19wd3JjX2RhdGEsCj4+ICvCoMKg
wqDCoCB9LAo+IAo+IFBsZWFzZSBtb3ZlIHRoaXMgZW50cnkgYmVmb3JlIF9zNF9XaWxsIGRvLgo+
IAo+PiDCoMKgwqDCoMKgIHsgLyogc2VudGluZWwgKi8gfQo+PiDCoCB9Owo+PiDCoCBNT0RVTEVf
REVWSUNFX1RBQkxFKG9mLCBtZXNvbl9zZWN1cmVfcHdyY19tYXRjaF90YWJsZSk7Cj4gCj4gVGhh
bmtzLAo+IE5laWwKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LWFtbG9naWMK
