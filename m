Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF6C0606A881
	for <linux-amlogic@archiver.kernel.org>; Tue, 17 Nov 2026 10:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Rll/iifY;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=amlogic.com header.i=@amlogic.com header.a=rsa-sha256 header.s=selector1 header.b=BZs4uXTB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=oRbt0b2x2B55MKrkmNdyLVLE29QQSlgN2XSGcehCYec=; b=Rll/iifY6ZArhm39/cH0aRfIXV
	nLBdGF5UUpcH8QCUvj3oGvYfWe31skJqIzornasmxtgk6upRTBj0f0lx1uxV9h2KVyfKoLu9SRrbt
	UdVeNyudoZbACcEfESPOKIomr5sVFagAo22ZqsBcx5TNfBLO/zIw0fi8XBfdqOkfT+bsRfbgYRYTW
	5IaWg5afEXZAWM7fkOEjYO7v6vvIdohDh3IAXGHQDDroFxL7hglUTHI5bmM3v4ymhjl3Mxq8MIQwH
	LtPulmcwPP54XkHgxvnrxjDfEOJOvgpJxsCrxutbuw4RfOdH5wcr8ruv1SOvH+JF5gviC65TKSlPu
	F4Leldlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTG0Q-00000005DGc-3SEz;
	Tue, 17 Nov 2026 10:01:38 +0000
Received: from mail-japanwestazlp170120003.outbound.protection.outlook.com ([2a01:111:f403:c406::3] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTG0O-00000005DGB-0MHT
	for linux-amlogic@lists.infradead.org;
	Tue, 17 Nov 2026 10:01:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s5UOQNoB/zXC2Zevlzz6xdyrxj/UiDflmUVNcH366bY5QRl9ar3mLy8UBWB979mO6OSGQGcfL5TJfS5fITHn6Siw+I18Qf/742bunBgzINy+kqrB6Je/A5WpknYJwXS51miCFwh0c3FcbAh5zISdvrTLFhCTDOi7IiOwdc4ApZWW30UDbpKRPw6bJr3aFaiIhsCk3J1fGNO1/jIfOSWxKQg1D3EAzSgpFWd+x6qjb0rKatUJ6Zd2YHdy173311xmog0R8Yn5aUjfIaSo9cnLLqKrmj6m6c+e/HYc/5x1kLoyieszRbF0CWGkyWEQj9SWNznSJAAS/GyqguBHv16tNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wd+q+q1B0EpOsj8l3RfyiGN4m0aqjMHCrU1KbhR9sZs=;
 b=e2aSkCyExQuQzPVyVZiRBhs2KeO2g7f6YH2mDVusKoHdzl9b7bUW7Luf1BwNk/jp1fo26xKdbPuncT5lQrrx3mtHrSHjXfAFhaNtNtp3AvlVIj7n6uhDW8Xyka4KGmzhLt0/l2V6I9BjUUFgXo29jjrrepaxagvNUvpQh1igO7arYWpnIoXhcqiKiI2u5SqpzyoMWhIzNe4zyW6DD9An2w4EXG6MREBTb8yG3DB/H1X0bFO6320h6v+Slzu0S9YIvmrEmBQOje4BtMo7bnP/w7JbD0L75Kch5QW5gETnVGZUZ4w2BV4JuhnQYS5ddzLTifFOz6efmHe+gql1NbzARQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wd+q+q1B0EpOsj8l3RfyiGN4m0aqjMHCrU1KbhR9sZs=;
 b=BZs4uXTBn1eLFDDkhp4HTBkXyb6/UrRIsyF3UqywAsdLFOnwdviGudF2jBfFUYsZCqJSfIywEJSgRWyRsR30LN4J7BfbPsyHtDF8yVPqmpi3AUC3kUzLif22veR1cmLkVsZuYMXD5TSF3WPe7GUpWWw1zvazm9WEuOPjkkc0lT3atOBhF2p3BzFfQGa8Z2mi+Sz2ErtbvBeY2fKtM3riebzCQV4R8T1PTvGcKie4hsLp3nUEaxpA6H1f6n7oB+gxxBJE7sHUhasneSf/l9reFuzDtW0YSfnyIPHUgesGalLAld8JBhQ8zuQVwpll/MIh2lxzWO5zxa/S66rzenaPPg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by KUXPR03MB9438.apcprd03.prod.outlook.com (2603:1096:d10:4d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 10:01:29 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::78d4:9dee:2e32:d1e4]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::78d4:9dee:2e32:d1e4%7]) with mapi id 15.21.0615.013; Tue, 17 Nov 2026
 10:01:29 +0000
Message-ID: <cd3d821b-1cc7-4134-b902-1f05ca2526dc@amlogic.com>
Date: Tue, 17 Nov 2026 18:01:24 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/2] i2c: amlogic: Add Amlogic A9 I2C controller driver
Content-Language: en-US
To: Markus Elfring <Markus.Elfring@web.de>,
 Junyi Zhao <junyi.zhao@amlogic.com>, linux-amlogic@lists.infradead.org,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 Andi Shyti <andi.shyti@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20261117-a9-i2c-v9-0-7b303c894fea@amlogic.com>
 <20261117-a9-i2c-v9-2-7b303c894fea@amlogic.com>
 <7026e0f7-5d7a-4756-8783-4d8558f420d1@web.de>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <7026e0f7-5d7a-4756-8783-4d8558f420d1@web.de>
X-ClientProxiedBy: SI2P153CA0026.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::18) To TYZPR03MB6896.apcprd03.prod.outlook.com
 (2603:1096:400:289::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|KUXPR03MB9438:EE_
X-MS-Office365-Filtering-Correlation-Id: d34ff406-4659-46f6-be8c-08df4491c010
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|4143699003|11063799006|56012099006|261026121527099003|261026135527099003|261026140227099003|261028144727099003|10067099003|261022115727099003|261021130227099003|261021135927099003|261021133027099003|261022075727099003|261021123027099003|261022113327099003|261021121427099003|261022105027099003|261026130827099003|261102123227099003|261009223027099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: l3HnYdkiGf7E1+sKKUqjlkLC6MPjvufG1ZYA93ZUtSbhnQnh21HLwFelIGF0vL8I4VJzUkjcOzXMYxMqtwsS2U+twp09sMHAuC6JL9A0R8sTsd+Tl57apAI4m3O5EJqEfj/u5g+Pwa8lX0ULm2swSPQc88lNan17auZQNXNa/Sl49tklyZwMizjNY4+G1+dXWIxwpeKgu57PiCIsCyP6xGjkUuQj6Fp5n3DPW0RlAc9GkB1urhJM7R3RUe04NlUZmsprw0Uh7dbmgF1Zdij8P0ewWDHFIUZIq54tUkr4fjltnA0VkG9wwr2Gru/ad6MfFjy9QHNwKdZN9G5IFgXgm2Sd1HyNFoazToJssyIlCQhYfg84xjMzukKPf8dKhMVRc75Pt7eQCBvDN7qfW0Ti1GwdNcVr1zgk7dO7AxpWaLJ5q9RGWie+OzgyK2gf4RN/zUWzW8HnoC7uaDm7xWzxeACnHjNuUdfoxYpCYfRXJTR1yNy43pJXpbv1xS9o7YqjO5+9I9rlKiFcMbd2niiMk7CR+naZVlHs8M16gRMDHidwM5rackqe3yPrUZWaH0XFupTGOl0kHJ27jA+vTBJ8lAjJFWxRkmUk4jFBWB8CCjfVj7hS58d5UY6bG58kt0Jf
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(4143699003)(11063799006)(56012099006)(261026121527099003)(261026135527099003)(261026140227099003)(261028144727099003)(10067099003)(261022115727099003)(261021130227099003)(261021135927099003)(261021133027099003)(261022075727099003)(261021123027099003)(261022113327099003)(261021121427099003)(261022105027099003)(261026130827099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bDBvUUtpam9hL25OQlRVNFJ5RmpDa0ExZW1KSjhnT2Y1M0hEcTNzcjV3eHNq?=
 =?utf-8?B?dE9QYjJGVGM4Wm43aDFTUXBpSEpsMG5MTldCNmd3ckFFbHBzQkp2Zzd3dk1N?=
 =?utf-8?B?NUl4dUhGWHJBZ1VRTWE2SmJ3bkFmV1l1OFNhOG1Nd0NvVmYvcE5aWXppY1J2?=
 =?utf-8?B?R2lLcm1QZU1QcXVta2p3WEE1cElTTWlpK0JyYkg2VVczN1V2NlpyQ2VFYjRH?=
 =?utf-8?B?cFNldTRLVUg4cDZxZEY0VktzeWFjdkF3K0N0MXNtOU9CMlZvaXAyRGxvWlM2?=
 =?utf-8?B?S2FOaVFpYkF4YTFKSWV5WWZOWXYxV3dNMURwOTNGUDJOMXVhd2l2bnBacW9z?=
 =?utf-8?B?NFJwVm9PbVVsaHlodFlWZDhDclE2OVZ1ZFVjbGJtZTczS2o2K2svYmhJWjdN?=
 =?utf-8?B?dkRBN2JkYlNENG5XZHE1RjBzdGluMjJBVjZGWnZVdEpZMkNDNHU1RjBlMGZR?=
 =?utf-8?B?K2RXcFU2bmVnc1d2bHphbzRPTlhPTFFDTnJxV0thMmFpb29hU0ZZVmZWdGN4?=
 =?utf-8?B?UFZlMTJSV2FIa3NrWlplWnJZNVRHZUcwUzhzRWU5YldVb0duNS9DbUNJeU1B?=
 =?utf-8?B?TFkyNDNkSnNLL2lOMEdhSk1CV01yV2JGbWU0Y0NieksweUhkbHJiUXdTM1RM?=
 =?utf-8?B?NDlXd0VNbU85aEx1dFFNdW9jRDRLYjhBdWpFYW9VbmpnRHNwTHA1UllmS1BB?=
 =?utf-8?B?aE9sUVl3ZWplY2lQS3BrdWRiZms2Z3Q3L3l3aktHa3hJN0p4WkNoVTNmeUhT?=
 =?utf-8?B?d1FxMGdNVVJhSndaMzVqaHFPWWw4aWpxWU9pR0tGdlI2eTE2YTBiczl0V0lm?=
 =?utf-8?B?SmFNVTRramFMKy9ET29Rbk9IdVEwM0FPMkh5V2hVWUVLK1pEODVJWC9qdWdV?=
 =?utf-8?B?YTZ6bFp6WSs4ejhTVVNUc0E0QWRYY3Rsc3RhcEJ5clltUWVvc05jQ3lleDJ5?=
 =?utf-8?B?QzFnTWhENUY3bURsWUZPb1h5YUEyRENMM3lmWmU2ejVFUzJoSVVLQm9JYnov?=
 =?utf-8?B?UEYrSk5Kb1MzZ2JOQ1YwRElOb1hLSDZ0aXgvOWduU2hXVHJuM1VNRG5HRkN6?=
 =?utf-8?B?NnQzZ0pFajN0M0JuZTdkcERqeWg1SDhVQkpzdjl3VytnOFhva09Rd3o2bUJG?=
 =?utf-8?B?T0FlV2FlOHJDRFRoQ0ZBcnYycnNjaGo4RUxkT2dWek5hU3Nsb3BUNFdSVWhS?=
 =?utf-8?B?Ym1UOUphSWdLVzdTckt3OVFOdVZ6Vk0yWjN6TnRMZU1MR2dMYmFocHN4RVFs?=
 =?utf-8?B?NHgwam5oamxrN3JkNFAxai8rOTh2alNSTWNlRVp1NlBJQTRSY3FTK3hySWo0?=
 =?utf-8?B?Y2hqeURYbElJSzNad2sxMXVPMkhYRlJwNjRuQ2xoUzg5aSs1M1RQdS8zZGMz?=
 =?utf-8?B?WjUyaUk5Y2JOaTBsT28vaHhFUkd2cmE1U2lKUkw3dFlPVEIyS1lPZ0RUUVB6?=
 =?utf-8?B?N2lENHZLNlBlTUlSOWlYRjU5azJTQWJ1R2twTTV0Y0dpckhSVi9zSXI4T2tB?=
 =?utf-8?B?MmNZbTFLa1AwOWRmaHA0QzU2ci84dEhWRW4rUGh3dFRrbW53VkNXTUpoS2RL?=
 =?utf-8?B?dUJNSENnNFZkS29KVEFidXUwNE0vQVA2aWxoTCtpWHREM0MxNnRwV2pIbisw?=
 =?utf-8?B?QU80MEp4V3JjQitzRmZKTU5QT3V2SFUvbVJ6MEdCeDRaQ0JHY3hjYjRHd0FY?=
 =?utf-8?B?cGMxZEpTTmwyQlFXT0l5enkyY1htalRnb3JBU2hYeFZFb096N2JuZzFhQ1Ew?=
 =?utf-8?B?YVZ4SGZCOGJ4amhFQy9rRWFZdy8vK0xTb25TWkg3a0paUEtrNWwrSUxpUXFL?=
 =?utf-8?B?cy80RlB2MVJqem1ldWROVmVSS282cTdyUk42VWFFVE1KK0FBT1VVQmtYcmVV?=
 =?utf-8?B?RjUxcFdJbGg1MEVJcTM2N2VBZWJja0FVNWl3VVk5MXRDU2xqLzMyRUNzN0NQ?=
 =?utf-8?B?T2FsYkpLdVhkSEVqMFB3bjVIQkZiaElRdFF2NndiaUJQOHRMWVR4b0dqYTB2?=
 =?utf-8?B?dGhkT2dzT25QbDZWUUNxL1cwVGsvZjVqc3I0THZlbVgraGRpV1pQTCtHWTBN?=
 =?utf-8?B?WENFb2EvUWdsQk5pSVNYaXBGZnZDdzA2eGswQTFzdlBybEpUYjFYQjhvSlNY?=
 =?utf-8?B?dkJnNnljajNvdklQVlMrZk1lcTJMN05EK2dwS1E3dWJ2WGVQTnJBQ0JBb3dX?=
 =?utf-8?B?OVJYYnoyMHo2amtkQ3djNGRQUExhczcvcW1JWFJyd3NlSjdDUEdYdlc5SmU4?=
 =?utf-8?B?WmlPWWpIZlorVkM3N2ZkTWNqNVpmL0dSRXpwTmRZdWoyL3Y3WXRkVzJwS2U1?=
 =?utf-8?B?bHE4WXFqSmt5S1hSaHdpNUhhelhGRDZVQkNaRVJ2Wkk0SFZiVW9MUT09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d34ff406-4659-46f6-be8c-08df4491c010
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 10:01:29.4898
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tnD1jhQIk0uA/ARh7EocX/DE6njS1xxg9bj6aMWGc0YJ/imzWhL0oa0bjMJbKxM8rQLDWKzHSuRWn8LUvIhBQFv9OjpF4InNPJjq+UGmNKc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUXPR03MB9438
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_020136_159424_3B2B0295 
X-CRM114-Status: GOOD (  14.62  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgTWFya3VzLAogICAgVGhhbmtzIGZvciB5b3VyIHJldmlldy4KCk9uIDIwMjYvMTEvMTcgMTc6
MzYsIE1hcmt1cyBFbGZyaW5nIHdyb3RlOgo+IOKApgo+PiArKysgYi9kcml2ZXJzL2kyYy9idXNz
ZXMvaTJjLWFtbG9naWMtYTkuYwo+PiBAQCAtMCwwICsxLDQyOSBAQAo+IOKApgo+PiArc3RhdGlj
IGlycXJldHVybl90IGFtbF9pMmNfaXJxKGludCBpcnFubywgdm9pZCAqZGV2X2lkKQo+PiArewo+
IOKApgo+PiArICAgICBpZiAoIShpcnFfc3RhdGUgJiBBOV9UUkFOU19ET05FKSB8fAo+PiArICAg
ICAgICAgKGkyYy0+c3RhdGUgPT0gQTlfU1RBVEVfUkVBRCAmJiBpMmMtPnBvcyA8IGkyYy0+bXNn
LT5sZW4pKSB7Cj4+ICsgICAgICAgICAgICAgcmV0dXJuIElSUV9IQU5ETEVEOwo+PiArICAgICB9
Cj4g4oCmCj4gCj4gSG93IGRvIHlvdSB0aGluayBhYm91dCB0byBvbWl0IGN1cmx5IGJyYWNrZXRz
IGhlcmU/Cj4gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQv
dG9ydmFsZHMvbGludXguZ2l0L3RyZWUvRG9jdW1lbnRhdGlvbi9wcm9jZXNzL2NvZGluZy1zdHls
ZS5yc3Q/aD12Ny40LXJjMyNuMTk3Cj4gCldpbGwgZG8uCj4gCj4g4oCmCj4+ICtzdGF0aWMgaW50
IGFtbF9pMmNfeGZlcl9tc2coc3RydWN0IGFtbF9pMmMgKmkyYywgc3RydWN0IGkyY19tc2cgKm1z
ZywgYm9vbCBsYXN0KQo+PiArewo+IOKApgo+PiArICAgICBzcGluX2xvY2tfaXJxc2F2ZSgmaTJj
LT5sb2NrLCBmbGFncyk7Cj4+ICsgICAgIGkyYy0+c3RhdGUgPSAobXNnLT5mbGFncyAmIEkyQ19N
X1JEKSA/IEE5X1NUQVRFX1JFQUQgOiBBOV9TVEFURV9XUklURTsKPj4gKyAgICAgYW1sX2kyY19w
cmVwYXJlX3hmZXIoaTJjLCBBOV9GSUZPX0ZJTExfRlVMTCk7Cj4+ICsgICAgIHJlaW5pdF9jb21w
bGV0aW9uKCZpMmMtPmRvbmUpOwo+PiArCj4+ICsgICAgIGFtbF9pMmNfc2V0X21hc2soaTJjLCBS
RUdfQ0ZHX0JVUywgQlVTX05PX1NUT1AsIChsYXN0ID8gMCA6IEJVU19OT19TVE9QKSk7Cj4+ICsK
Pj4gKyAgICAgLyogU3RhcnQgdGhlIHRyYW5zZmVyICovCj4+ICsgICAgIGFtbF9pMmNfZG9fc3Rh
cnQoaTJjLCBtc2cpOwo+PiArICAgICBzcGluX3VubG9ja19pcnFyZXN0b3JlKCZpMmMtPmxvY2ss
IGZsYWdzKTsKPj4gKwo+PiArICAgICB0aW1lX2xlZnQgPSBtc2Vjc190b19qaWZmaWVzKEkyQ19U
SU1FT1VUX01TKTsKPj4gKyAgICAgdGltZV9sZWZ0ID0gd2FpdF9mb3JfY29tcGxldGlvbl90aW1l
b3V0KCZpMmMtPmRvbmUsIHRpbWVfbGVmdCk7Cj4+ICsKPj4gKyAgICAgLyoKPj4gKyAgICAgICog
UHJvdGVjdCBhY2Nlc3MgdG8gaTJjIHN0cnVjdCBhbmQgcmVnaXN0ZXJzIGZyb20gaW50ZXJydXB0
Cj4+ICsgICAgICAqIGhhbmRsZXJzIHRyaWdnZXJlZCBieSBhIHRyYW5zZmVyIHRlcm1pbmF0ZWQg
YWZ0ZXIgdGhlCj4+ICsgICAgICAqIHRpbWVvdXQgcGVyaW9kCj4+ICsgICAgICAqLwo+PiArCj4+
ICsgICAgIGlmICghdGltZV9sZWZ0KSB7Cj4+ICsgICAgICAgICAgICAgc3Bpbl9sb2NrX2lycXNh
dmUoJmkyYy0+bG9jaywgZmxhZ3MpOwo+PiArICAgICAgICAgICAgIGkyYy0+c3RhdGUgPSBBOV9T
VEFURV9JRExFOwo+PiArICAgICAgICAgICAgIGFtbF9pMmNfc2V0X21hc2soaTJjLCBSRUdfQ0ZH
X0lSUV9FTkFCTEUsCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBBOV9SWF9USFJF
U0hfUkVBRCB8IEE5X1RYX1RIUkVTSF9XUklURSwgMCk7Cj4+ICsgICAgICAgICAgICAgY2xlYXJf
aXJxX3N0YXR1cyhpMmMsIElSUV9BTExfTUFTSyk7Cj4+ICsgICAgICAgICAgICAgcmVzZXRfZmlm
b19wb3MoaTJjKTsKPj4gKyAgICAgICAgICAgICBzcGluX3VubG9ja19pcnFyZXN0b3JlKCZpMmMt
PmxvY2ssIGZsYWdzKTsKPj4gKyAgICAgICAgICAgICByZXR1cm4gLUVUSU1FRE9VVDsKPj4gKyAg
ICAgfQo+PiArCj4+ICsgICAgIHJldHVybiBpMmMtPmVycm9yOwo+PiArfQo+IOKApgo+IAo+IFdo
YXQgZGlkIGhpbmRlciB5b3UgdG8gYXBwbHkgZnVydGhlciBsb2NrIGd1YXJkcyBmb3Igc3VjaCBh
IGZ1bmN0aW9uIGltcGxlbWVudGF0aW9uPwo+IGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xp
bnV4L3Y3LjQtcmMxL3NvdXJjZS9pbmNsdWRlL2xpbnV4L3NwaW5sb2NrLmgjTDY0Mi1MNjQ1Cj4g
Cj4gCldpbGwgZG8uCj4g4oCmCj4+ICttb2R1bGVfcGxhdGZvcm1fZHJpdmVyKGFtbF9pMmNfZHJp
dmVyKTsKPj4gKwo+PiArTU9EVUxFX0RFU0NSSVBUSU9OKCJBbWxvZ2ljIEkyQyBCdXMgZHJpdmVy
Iik7Cj4+ICtNT0RVTEVfQVVUSE9SKCJKdW55aSBaaGFvPGp1bnlpLnpoYW9AYW1sb2dpYy5jb20+
Iik74oCmCj4gV291bGQgYW5vdGhlciBtYWNybyBjYWxsIOKAnE1PRFVMRV9BVVRIT1LigJ0gYmVj
b21lIGhlbHBmdWwgaGVyZT8KPiBodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92Ny40
LXJjMS9zb3VyY2UvaW5jbHVkZS9saW51eC9tb2R1bGUuaCNMMjMzLUwyMzYKPiAKCkRvIHlvdSBt
ZWFuIHB1dCBNT0RVTEVfQVVUSE9SIGluIGZyb250IG9mIE1PRFVMRV9ERVNDUklQVElPTj8KCj4g
UmVnYXJkcywKPiBNYXJrdXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LWFtbG9naWMK
