Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC727CCF2D4
	for <linux-amlogic@archiver.kernel.org>; Mon, 19 Oct 2026 03:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UDRMoThkSy3hHHIGRP17fINS/cZlaCs0La6j9CD0K1A=; b=W0cTY/ubIvqejBIKfQpBf9SFfT
	PcRl+qfC9hVgTwejZbg0Sr+nls3bX637nlcPmxkXdnH5gZ7c52eDXtL0+x35z2xad9247anqZF73c
	V7sEzLNXuIMi8VIHOZQlVaF/9HNViEuXwGFxprN1JlZc9lxs+OGq2qpbdHPmEtSnXPAbRRIYDmKRv
	1aZOHEuRrM8UyD27CIkPEvPPmFQ2cO7LSH5j1MlTP8ELkmfpygBKLqzRJ75iBWctjauKNPzuQBxnV
	lm7E51LCPoYbTFdX8sMyAtLlpk8rJFiQgCOVcD5krJ/zIvcMwBaMxHmu8quNh1o0EKNC8NOP9ofzm
	LdL1ZUHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIe2r-00000006WwO-0SDC;
	Mon, 19 Oct 2026 03:28:17 +0000
Received: from mail-japaneastazon11022087.outbound.protection.outlook.com ([52.101.126.87] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIe2o-00000006Wvn-2Apd;
	Mon, 19 Oct 2026 03:28:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fK0Ddl6+vT3+VCNKWjtIYrsOzdTivDiBdAorzPNXY5pzIh9KahaTwparjd1sjn/BKEFn8tnxJkbl+k/A1/63fMbtN3aqOP1AhGYM4RiuRuFhwnTQt0oHkbz0/hq2vfXG9jxMjLrK+T83lA9KZa9i4twrlaAyJVzw89BNL1Wg8KFIPCvcglFN90opbNJTmEeYrNGtwVDvUCeUPC5UIRpPrIjSu1RXMrrXcVB9HYMWT1A0JZRb1utq1zZYqE51zhifOS0HXeZ1nbulq01j5AtqaNzZbT2hgRY7b4vRpovu2R9xbSQwEGrwC4Ma2GibdroJXdjL7yl84/GU2+h9eQNLnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KVr1yQ0PO5W29Dx2sfENrEJooi9zxIkZsucVBMg06RE=;
 b=QJJDLqzRXJXUPihZCxZQVCqxRvxPIVLJB2yYIYjxuoY7vjm9qEXOnEnFld3hTo/qemwyedKVPUrgAgmhXwfkSKxrY+GFFB2WqjvVtf0sTy38MEZVoetAzvLOZoQ+wxuRhd3H+Zq2g/6tC5xm0QrZ7XrNrd/O5Xbm6dYbOAKESK4FUrFN2hXXTf3fhO09vJM9OpRxWFOUaTQr930WbV+1SJ5TxGnmrNyY9fuTvQsixedqHvGyhgZp/kSuvt+gzDBnk6DOmKqT6m1wj142OORyYGkQz6+2Xn0a8q4NhZIktuuAjeJ/5VGC7butfMHSLjpq9kykLr8GKHTZpU+iwjahGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KVr1yQ0PO5W29Dx2sfENrEJooi9zxIkZsucVBMg06RE=;
 b=EDbNjNSGExIsCqHhM3oHKB1fhtSktQjP2MdNTQKgf07tk4pFoR94QJuG+MxIS8L/JCxF0wiHxZbIcWM5EGsc7FO+y9VN2e2I0l3yNRxHX2WsL3WTjlWup/7kbZYRi9utfG1abcUC9kpBorpcJpyKR44W3uH0CB+4rKFx8pgrkUKGAURCPQA+ciw/cXclO/6AD16v9h4q5Dusv6pxnay7qxc1+XNDw5CPLaNH4T2LHnMPZJpxmKixGjlEqbTcoMnSBtPt890Or5GGU+kc49C5Rs1sPa8wzz85Q8Rwaj44COd2x3htIBruLILesJrjG0nu5vmav/opxcNrSPFQbItFdQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by KL1PR03MB8449.apcprd03.prod.outlook.com (2603:1096:820:130::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 03:27:56 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::78d4:9dee:2e32:d1e4]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::78d4:9dee:2e32:d1e4%7]) with mapi id 15.21.0522.017; Mon, 19 Oct 2026
 03:27:56 +0000
Message-ID: <56e90646-f48d-4c85-afa0-80e09a21239a@amlogic.com>
Date: Mon, 19 Oct 2026 11:27:51 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] dt-bindings: net: meson-dwmac: add T7 support
Content-Language: en-US
To: Lucas Tanure <tanure@linux.com>, Conor Dooley <conor@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20260924-t7-node-new-v2-0-319d3c19b4b2@amlogic.com>
 <20260924-t7-node-new-v2-2-319d3c19b4b2@amlogic.com>
 <20260924-stinger-stoplight-7c327c3225fa@spud>
 <4460ec4a-1a28-4481-a33e-3fe72f68bf58@linux.com>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <4460ec4a-1a28-4481-a33e-3fe72f68bf58@linux.com>
X-ClientProxiedBy: SE2P216CA0090.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c2::13) To TYZPR03MB6896.apcprd03.prod.outlook.com
 (2603:1096:400:289::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|KL1PR03MB8449:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f348cec-69a7-4097-a2a8-08df2d90f772
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|7416014|376014|366016|56012099006|4143699003|11063799006|5023799004|261009223027099003|10067099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: wGo+dTr4n6ipfksjdg8MQ1MXTG+UwPaOrgEIjTCja3mmcvT/W69qV2rZbU+12e4hb6m3aBsDd+D8l928ypYHMzmNWCo8tPr7sfUJmPu1T1TyvV84nzrni0EFubASHjgsQ/Tdcl3/Xh+w4drXyZk6uMlPvd57gv/6IU0QIKn3WxuuktCP/fb6EdP1mfuYPGsnUzLZxsupOY0QetNKZGUJtj3K7ok3sCfesga41sw1YmL9x1/w/uQhU/MTJsUUNgA6DGzwdJFyOzu0wT6IWiz4+hEsE7GDQOY0OzsIe0MBr8iW7sswgE7coWCmj+j/qoM+S9xNgHQ62S/TAdB8NaQ+c9LtILodpOfBbpPm8Ll1X+vwrlPOLxki66zV5Uus5clZWsz6NENWIs4/2GHxbC4SHdpcbmFbZBS+5BQiC4Kw/2Gdv4uHq+EQoBNguMphHglUpRQzBf33ThZG93Z/1jOYVvBPTTJZnU4ZPf2l4/chDYu43fZAcaDEgL7HcF/Z9v+cB3/wWm4MpdHKsdZy2GjYXVUyPTkL6kk95I69KmEjmYcUG16R2iDG3vycul8s7NaG5iT2Qs1dEXkcKmZb5ll1dfCxGL/TKtuauMB1KaOXVJKCH6Y+Ks663m2isGQH1KuTAiUPJGlJNsHV9s+OKL002oeWuMD1VYlw1uF2TI+PiIk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(7416014)(376014)(366016)(56012099006)(4143699003)(11063799006)(5023799004)(261009223027099003)(10067099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bm5rbGdqRzNLekFERXUrVFpRM2xhRERXZStmQ2djK0t0d3lqNXQ1d1pLcjhv?=
 =?utf-8?B?dVZZaW1ZZ2MrRSszcUFSRHRrdXlyZ3FGQ1Z1QWlURy9OcHVES3JseW91U0RB?=
 =?utf-8?B?dGJyZVdNUnZkWFV1MmhnWmhIOFAzbUNTR0xmM3MvTlJCUStHMGR2ejZIbFhT?=
 =?utf-8?B?bnBoYlBrd1FsUk5NL0NERm1QdEg0aTEwQitRZE9tVFpiMklIUVBXSnJoNzhL?=
 =?utf-8?B?MzRyczd0U085dGg0TFpKaHRRYXJzazlzWkUrMzZhbkpkdTVNN2JsWVprZ0NN?=
 =?utf-8?B?R3lTUElieFJPZHRqVFlpNUlGREQ4bnRFaTVqR3ZLd0oxTzRCb2NLV3RzZ1BC?=
 =?utf-8?B?RVI1aE9vUzRWZEZmUDBESExWdDdPeHQraXdGMXYrUW9OTXVLVlVLT2ZSNUxv?=
 =?utf-8?B?bmI0T1Rhb0lveUg5T1B3WEo4ZVY1NzJZUnl0WHNzdm1xRnlrazdIZ3hHTGcx?=
 =?utf-8?B?dnFuTmZzWWN5ckZacTlnL0RmVVBiM1U1K2ZtaTNFTC93ejloYlBaeFY1Mzll?=
 =?utf-8?B?bXYvbnMwZTJiaHVXNWZna2F4dTd4RHliUlg1UXpEd1U3TVVFL3k4Sy9oTGRn?=
 =?utf-8?B?MUVabGxrWmo0elJvMTNLREUxdjNpWUt3a3Z1c0ptZ1RlNDU2d2V1anl6ZExM?=
 =?utf-8?B?Vk0vNHUweGdkek9JVDBoSjFSUS84aTdZQzZWMzNzTkZJOXdtdmNzMXZUTWY1?=
 =?utf-8?B?eVpOTnZVL0hqQXZKWFFwb3ovN2Q4L0orNXRIRkNlVUtndExxdFBqdkE1aVAy?=
 =?utf-8?B?a0NkLzYvR2Zxa2J0cWtOQjVEajJBdUorZEpLQ25JOHpPSjN3b081L2JwT0Fw?=
 =?utf-8?B?OXNGUEFFbmVmaVRVVGdUYlFzbElySlUxeFB2eDJFWDcxTWRNb3pIZmw0WmNp?=
 =?utf-8?B?ZlB5cis3MEZHZXF4bEJWTDNFVGxFak90V29tWVU5RVF6NE1ScktUTWRUZDdU?=
 =?utf-8?B?a3hvNnVKUnhGeG14VnVoT3huZTJuQ1E1b1hvUjRpTWJtcFhYMXhBUTBCQ0Rl?=
 =?utf-8?B?RnYzelNLb0huM1NHTE1ZdzRRRDhObFRkQm5NK0V3dG9zdktzSlBrcWd0dUs3?=
 =?utf-8?B?cnM5ZW5sczJvdUdmanp3RWowMXNYYkhiRkF4dHQrWjcvTktjTkw4THJSOWxm?=
 =?utf-8?B?UzJYczV5V0ZyZkxJRzVrLzIyVkVsSXRrQVFDdUNCMytQMVN3emkrbFVnbDB3?=
 =?utf-8?B?MnhUckoyNStiRmc3dHR0ZS9zZnFXMVM4T0xITFhGTG5SME1wNFBoV3BUb0FD?=
 =?utf-8?B?Wjc2MVNqMzJrU0dqVXpJcmtXOFMySmpVcDl5NDRwa3NyN1RvbVZqVWpGMzZr?=
 =?utf-8?B?cmNoSW9sY29MWDRKKzluMGdlc0xCcWJtVmFRL0xtWklWOFFvMnpjVEdIMjdM?=
 =?utf-8?B?dE1mai90UHJVTm5GOFQ2bjZPeEVZcnRGaVpQZGhMZHVLVDg3M1dqV1pOQ2tJ?=
 =?utf-8?B?UEdBOUEvUDUzTEg2Ylgwd1VjSk5JcjNGWHNsN2xlRmxnWjF4cDhXeHF2V2Mx?=
 =?utf-8?B?cC9Md1RKZk5LeTFoaTVrK0kyeGcyaEpGRWdORHp2ZFNzMUUxWDJEY2Z6RHhx?=
 =?utf-8?B?Q3ZBcnc1S0p4RHFRVWoyd3E0WXNxT0c0YUt2cUcxNDh0UzVNNWhtMCs4VXBI?=
 =?utf-8?B?ZWNBQnJwTElqbGpyNUt6QzBEYW9TcXRLUUozdGkxT0pscURlY0NUcHk1T0Z5?=
 =?utf-8?B?eUU3azFUUHNUYXJLZ0xzV3phSUhBVXVJaTNtVVBKb0h5ekJmWjNqbVdYQmRu?=
 =?utf-8?B?SUJSdGp2cDVtMklTZEF5WWxFbWdhalF1YklRZVBHZ05XMUM2YnRVVm4zWE5h?=
 =?utf-8?B?czZvYll2WDd4K3lkeUhtZTJOcHVxQklsUUlCZytUUWhpQjJJQ1lBSHBEWnJO?=
 =?utf-8?B?NE4wUVI2NHRSVXJsWGJnQ0xtdXRDZi9lRGkvQWFQV044aXRqWUYrTWJWeDhK?=
 =?utf-8?B?S2VheFppZTlYTDM4YUhBR3FJNkl5R1dxc3RJb1BmeU9GM1k4WURBenZXZk02?=
 =?utf-8?B?YzhtZDFOby8rUkZtOXErUkhsbzROYVdLWW5kOGVPWDJzS0UzaU5ERWdManJs?=
 =?utf-8?B?T292SlE3T2FWWkJIS3ppdWM4WUxoUU9RTFJzTW81WkpmZCtVZlRlN1VIalJZ?=
 =?utf-8?B?UG53NHVVdUpTOFNJNk8rdVdvaEhjaTEzdlJ0TjZFekg3d2ovRVB3QnBZTkJv?=
 =?utf-8?B?aFl5SzRoenNhZEVBMVlwWlV1QkFJWDAxL1kyYmNRUW5PRnkxa2R0eE1heGlm?=
 =?utf-8?B?UW1zLzMyN0VUVDJsS05GWkpxYlNBYnZRUCs5UGhIVS81S1pKYkt2UW10aTJF?=
 =?utf-8?B?TmRsaHViV0lJUmNGcEhrNldDcG9hN0FFdmdhVVo1OFEza0pBM0N0UT09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f348cec-69a7-4097-a2a8-08df2d90f772
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 03:27:56.1387
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uHwP8pKjd4t/IUQN6D7xNFeGoAmVECryb0S9nlcVDlJ37+oV0jOPwu+vqQXAbrnXu9yHj898lf17R4mQzaiQERYdMTHmCRUELoj8hZIKDvQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB8449
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_202814_569313_2F5184A4 
X-CRM114-Status: GOOD (  22.00  )
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

SGkgTHVjYXMsCiAgICBTb3JyeSBmb3IgdGhlIGxhdGUgcmVwbHkuCgpPbiAyMDI2LzEwLzQgMjI6
MDYsIEx1Y2FzIFRhbnVyZSB3cm90ZToKPiBbIEVYVEVSTkFMIEVNQUlMIF0KPiAKPiBPbiAyNC8w
OS8yMDI2IDE4OjIxLCBDb25vciBEb29sZXkgd3JvdGU6Cj4+IE9uIFRodSwgU2VwIDI0LCAyMDI2
IGF0IDA1OjUxOjA5QU0gKzAwMDAsIFhpYW53ZWkgWmhhbyB2aWEgQjQgUmVsYXkgCj4+IHdyb3Rl
Ogo+Pj4gRnJvbTogWGlhbndlaSBaaGFvIDx4aWFud2VpLnpoYW9AYW1sb2dpYy5jb20+Cj4+Pgo+
Pj4gQWRkIHRoZSBUNyBjb21wYXRpYmxlIHRvIHRoZSBNZXNvbiBEV01BQyBiaW5kaW5nLgo+Pj4K
Pj4+IFRoZSBUNyBEV01BQyBjb250cm9sbGVyIHJlcXVpcmVzIHRoZSBmb2xsb3dpbmcgY29tcGF0
aWJsZSBjb21iaW5hdGlvbjoKPj4+Cj4+PiBhbWxvZ2ljLHQ3LWR3bWFjCj4+PiBhbWxvZ2ljLG1l
c29uLWF4Zy1kd21hYwo+Pj4gc25wcyxkd21hYy00LjAwCj4+Pgo+Pj4gQWRkIGEgY29uZGl0aW9u
YWwgc2NoZW1hIGNoZWNrIHRvIGVuZm9yY2UgdGhpcyBjb21wYXRpYmxlIGNvbWJpbmF0aW9uCj4+
PiB3aGVuIGFtbG9naWMsdDctZHdtYWMgaXMgdXNlZC4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBY
aWFud2VpIFpoYW8gPHhpYW53ZWkuemhhb0BhbWxvZ2ljLmNvbT4KPj4+IC0tLQo+Pj4gwqAgLi4u
L2RldmljZXRyZWUvYmluZGluZ3MvbmV0L2FtbG9naWMsbWVzb24tZHdtYWMueWFtbMKgwqDCoCB8
IDE3IAo+Pj4gKysrKysrKysrKysrKysrKysKPj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAxNyBpbnNl
cnRpb25zKCspCj4+Pgo+Pj4gZGlmZiAtLWdpdCAKPj4+IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL25ldC9hbWxvZ2ljLG1lc29uLWR3bWFjLnlhbWwgCj4+PiBiL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvYW1sb2dpYyxtZXNvbi1kd21hYy55YW1sCj4+
PiBpbmRleCA1YzkxNzE2ZDFmMjEuLmI1MjljYTU1NzdhOSAxMDA2NDQKPj4+IC0tLSBhL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvYW1sb2dpYyxtZXNvbi1kd21hYy55YW1s
Cj4+PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L2FtbG9naWMs
bWVzb24tZHdtYWMueWFtbAo+Pj4gQEAgLTIzLDExICsyMywyNCBAQCBzZWxlY3Q6Cj4+PiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIC0gYW1sb2dpYyxtZXNvbi1neGJiLWR3bWFjCj4+PiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIC0gYW1sb2dpYyxtZXNvbi1heGctZHdtYWMKPj4+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgLSBhbWxvZ2ljLG1lc29uLWcxMmEtZHdtYWMKPj4+ICvCoMKgwqDCoMKgwqDC
oMKgwqAgLSBhbWxvZ2ljLHQ3LWR3bWFjCj4+PiDCoMKgwqAgcmVxdWlyZWQ6Cj4+PiDCoMKgwqDC
oMKgIC0gY29tcGF0aWJsZQo+Pj4KPj4+IMKgIGFsbE9mOgo+Pj4gwqDCoMKgIC0gJHJlZjogc25w
cyxkd21hYy55YW1sIwo+Pj4gK8KgIC0gaWY6Cj4+PiArwqDCoMKgwqDCoCBwcm9wZXJ0aWVzOgo+
Pj4gK8KgwqDCoMKgwqDCoMKgIGNvbXBhdGlibGU6Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgIGNv
bnRhaW5zOgo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29uc3Q6IGFtbG9naWMsdDctZHdt
YWMKPj4+ICvCoMKgwqAgdGhlbjoKPj4+ICvCoMKgwqDCoMKgIHByb3BlcnRpZXM6Cj4+PiArwqDC
oMKgwqDCoMKgwqAgY29tcGF0aWJsZToKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqAgaXRlbXM6Cj4+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIGNvbnN0OiBhbWxvZ2ljLHQ3LWR3bWFjCj4+PiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIGNvbnN0OiBhbWxvZ2ljLG1lc29uLWF4Zy1kd21hYwo+
Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSBjb25zdDogc25wcyxkd21hYy00LjAwCj4+Cj4+
IFRoaXMgaXMgbm90IGhvdyBmYWxsYmFjayBjb21wYXRpYmxlcyBhcmUgZGVzY3JpYmVkLgo+Pgo+
PiBJbnN0ZWFkIG9mIGRvaW5nIHRoaXMsIHdoaWNoIGFmZmVjdHMgYWxsIG90aGVyIGNvbXBhdGli
bGVzIGluIHRoZSBmaWxlCj4+IGJ5IGFsbG93aW5nIGR3bWFjLTQuMDAgZm9yIGFsbCBkZXZpY2Vz
LCBwbGVhc2UgZG8gdGhpcyB0aGUgbm9ybWFsIHdheS4KPj4gZHdtYWMgaXNuJ3Qgc3BlY2lhbCwg
aXQncyBqdXN0IHRoaXMgYmluZGluZyB0aGF0J3Mgd2VpcmQhCj4+IENhbiB3aGF0cyBjdXJyZW50
bHkgaW4gdGhlIGJpbmRpbmcgKGJlZm9yZSB0aGlzIHBhdGNoKSBiZSBsYXJnZWx5Cj4+IHJlcGxh
Y2VkIGJ5IGp1c3QgZG9pbmc6Cj4+IMKgwqAgY29tcGF0aWJsZToKPj4gwqDCoMKgwqAgb25lT2Y6
Cj4+IMKgwqDCoMKgwqDCoCAtIGl0ZW1zOgo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIGVudW06
Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSBhbWxvZ2ljLG1lc29uOGItZHdtYWMK
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIGFtbG9naWMsbWVzb24tZ3hiYi1kd21h
Ywo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gYW1sb2dpYyxtZXNvbi1heGctZHdt
YWMKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIGFtbG9naWMsbWVzb24tZzEyYS1k
d21hYwo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIGNvbnN0OiBzbnBzLGR3bWFjLTMuNzBhCj4+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gY29uc3Q6IHNucHMsZHdtYWMKPj4gwqDCoMKgwqDCoMKg
IC0gaXRlbXM6Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gZW51bToKPj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCAtIGFtbG9naWMsbWVzb242LWR3bWFjCj4+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgLSBhbWxvZ2ljLG1lc29uOG0yLWR3bWFjCj4+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgIC0gY29uc3Q6IHNucHMsZHdtYWMKPj4KPj4gWW91J2xsIGhhdmUgdG8gY2hlY2sgdGhp
cyB5b3Vyc2VsZiBhZ2FpbnN0IHRoZSBhbWxvZ2ljIGRldmljZXRyZWVzIGFuZAo+PiBzZWUgaWYg
dGhpcyBpcyBjb3JyZWN0LCBidXQgd2l0aCB0aGlzIHlvdSBzaG91bGQgYmUgYWJsZSB0byBhZGQg
eW91ciBuZXcKPj4gZGV2aWNlIHdpdGhvdXQgZG9pbmcgYW55dGhpbmcgc3BlY2lhbC4KPiAKPiBJ
IGhhdmUgdGhlIHNhbWUgcGF0Y2ggaW4gbXkgVDcgd29yayBhbmQgY2hlY2tlZCBpdCBhZ2FpbnN0
IHRoZSBhbWxvZ2ljCj4gZGV2aWNlIHRyZWVzOiBtZXNvbjYgYW5kIG1lc29uOG0yIHVzZSB0aGUg
dHdvIGVudHJ5IGZvcm0sIHRoZSByZXN0IGFkZAo+IHNucHMsZHdtYWMtMy43MGEuIGR0X2JpbmRp
bmdfY2hlY2sgYW5kIGR0YnNfY2hlY2sgYXJlIGNsZWFuLiBUaGUgZXhhbXBsZQo+IG5lZWRzIGZp
eGluZy4KPiAKPiBYaWFud2VpLCBmcm9tIG15IFZJTTQ6IHRoZSBNQUMgcmVwb3J0cyBTeW5vcHN5
cyBJRCAweDUxLCBEV01BQ19DT1JFXzVfMTAKPiBpbiBjb21tb24uaCwgc28gdGhlIGNvcmUgaXMg
NS4xMGEsIG5vdCA0LjAwLiBBbmQgdGhlIGNvbnRyb2xsZXIgcmVhY2hlcwo+IERSQU0gdGhyb3Vn
aCBhIHBpcGVsaW5lIHN0YWdlLiBOb3RoaW5nIGNsYWltcyBpdHMgZ2F0ZSwgc3lzX2FtcGlwZV9l
dGgsCj4gc28gY2xrX2Rpc2FibGVfdW51c2VkIHN3aXRjaGVzIGl0IG9mZi4gTXkgbm9kZSBsaXN0
cyBpdCBhcyBhIGZvdXJ0aAo+IGNsb2NrLiBEb2VzIHRoZSBBTjQwMCBkaWZmZXI/Cj4gCgogRnJv
bSB0aGUgZG9jdW1lbnQsIHRoZSBjb3JlIGlzIDUuMTBhLiBJJ2xsIGFzayB0aGUgZXRoZXJuZXQg
b3duZXIgYWJvdXQgCnRoZSBjbG9jay4KCj4gSSB3aWxsIHNlbmQgbXkgc2VyaWVzIHRvZGF5IHNv
IHRoZSBjb2RlIGlzIG9uIHRoZSBsaXN0LiBOb3QgYSByYWNlOiBJCj4gd2lsbCBkcm9wIG9yIHJl
YmFzZSB3aGF0ZXZlciBvdmVybGFwcyBvbmNlIHlvdSB0ZWxsIG1lLgo+CgpJJ2xsIG1ha2UgY2hh
bmdlcyBiYXNlZCBvbiB5b3VyIHN1Ym1pc3Npb24sIEkgd2lsbCBkcm9wIGV0aG5ldCBsYXRlci4K
Cj4gVGhhbmtzLAo+IEx1Y2FzCj4gCj4+Cj4+IHB3LWJvdDogY2hhbmdlcy1yZXF1ZXN0ZWQKPj4K
Pj4gVGhhbmtzLAo+PiBDb25vci4KPj4KPj4+IMKgwqDCoCAtIGlmOgo+Pj4gwqDCoMKgwqDCoMKg
wqAgcHJvcGVydGllczoKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBjb21wYXRpYmxlOgo+Pj4gQEAg
LTM4LDYgKzUxLDcgQEAgYWxsT2Y6Cj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
LSBhbWxvZ2ljLG1lc29uLWd4YmItZHdtYWMKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCAtIGFtbG9naWMsbWVzb24tYXhnLWR3bWFjCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgLSBhbWxvZ2ljLG1lc29uLWcxMmEtZHdtYWMKPj4+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCAtIGFtbG9naWMsdDctZHdtYWMKPj4+Cj4+PiDCoMKgwqDCoMKgIHRoZW46Cj4+
PiDCoMKgwqDCoMKgwqDCoCBwcm9wZXJ0aWVzOgo+Pj4gQEAgLTkzLDYgKzEwNyw3IEBAIGFsbE9m
Ogo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gYW1sb2dpYyxtZXNvbjhtMi1k
d21hYwo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gYW1sb2dpYyxtZXNvbi1n
eGJiLWR3bWFjCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSBhbWxvZ2ljLG1l
c29uLWF4Zy1kd21hYwo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gYW1sb2dpYyx0
Ny1kd21hYwo+Pj4gwqDCoMKgwqDCoCB0aGVuOgo+Pj4gwqDCoMKgwqDCoMKgwqAgcHJvcGVydGll
czoKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoCByeC1pbnRlcm5hbC1kZWxheS1wczoKPj4+IEBAIC0x
MzksOCArMTU0LDEwIEBAIHByb3BlcnRpZXM6Cj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0g
YW1sb2dpYyxtZXNvbi1neGJiLWR3bWFjCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gYW1s
b2dpYyxtZXNvbi1heGctZHdtYWMKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSBhbWxvZ2lj
LG1lc29uLWcxMmEtZHdtYWMKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqAgLSBhbWxvZ2ljLHQ3LWR3
bWFjCj4+PiDCoMKgwqDCoMKgIGNvbnRhaW5zOgo+Pj4gwqDCoMKgwqDCoMKgwqAgZW51bToKPj4+
ICvCoMKgwqDCoMKgwqDCoCAtIHNucHMsZHdtYWMtNC4wMAo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKg
IC0gc25wcyxkd21hYy0zLjcwYQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIC0gc25wcyxkd21hYwo+
Pj4KPj4+Cj4+PiAtLSAKPj4+IDIuNTIuMAo+Pj4KPj4+CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51
eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
