Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B90E606A31B
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 Oct 2026 03:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UR8cNY6F;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=amlogic.com header.i=@amlogic.com header.a=rsa-sha256 header.s=selector1 header.b=h/gCXJyr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=KEscNrf6zj0QeyusYUkdHST//ks2Bnjd5qbVFNy5Wk0=; b=UR8cNY6FW9TBBaqF4h0046C73W
	VmeURbf/D0SxviByYDe8w9RezOMEjARw8/5sErRlr6EI3wM8Egp9ZDz+v9LNOAoVO4X0koIX6X+ht
	EGmYMUo3QE5rs3cIa8WYxYFe8iH8NRr19kJgowYeydp8EWvlKWnEkBZpKFlyZaZXq+Y4oFzuPXCWA
	XIviMbD7aD/xIwUw6LSjPaB7zxQicaJMOjBWWFx4FpXvu6Dx8nwhOeT+sS5GI6Fi8S7oVI1yf5lYk
	s+TdzgZ2eJj9r9SRAQQTv7/97hmlAOtafCxX8y+2mlXMx1KOTtjssF8mR9LDjTEoCevfK2esFP/vZ
	FU/YvmUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLXiJ-00000003goh-33mf;
	Tue, 27 Oct 2026 03:19:03 +0000
Received: from mail-japanwestazon11022122.outbound.protection.outlook.com ([40.107.75.122] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLXiG-00000003go7-2VFJ
	for linux-amlogic@lists.infradead.org;
	Tue, 27 Oct 2026 03:19:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e1vTagZWhOX2W+CNCAP/tZqLCU0CuMN9Kll1MZBcIUEiQOut0eht/tyJ7aR5p51RNkYkn4IK+TXHAmss8QRV58/jzxXQDcjZ5JtT7k19wdLusXoWCAPGwA4uJcXSz4McJhQF2THsBFaoqTm3pZLJqAvHDoYStLs0PGjqGgPO2w6fLuJFfmM9WVAQe6mkVbXamobfDezqmEoONt4T1JHNlK/OXEfopSPaKp6ieDkX56+hPIq9PxFdE0ZeUSgtD5ACszckK2LsObUuxxMkBpAh9ynurQGPxDiAU45OTiSpk+KVGksWyRGHEfdim/0PyTDJHQd1U8YMkNImrGEC+e5o7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M9GETrwyT1aV7g19g9EfeatfmGwyZ0WdB7cy+9tz8ck=;
 b=KFWRlPbpBjOlC4lUYV50GazrgCkEhXNen3NMowHg/8I5sG1lgV78o4i5k2kSBqD407SDu7L6H4F9Wr8+W8+VRT7OQSZrvINNh6hgvFGeesUu7bAulWjVV068hoG3aJCAHBaO3aER5hfSUNGeGTtMVGAxkem2VdKKVIncSwWxp4tOmDBJ+Wf+odls35vuf04iNfb5CK4YwGV0hZ8sNjQ4lfD45unvUgb5/2KrfAsImdKilW+dFGRZTSpqHpl2RigPQG9eW+l7B2LiahgSifBfzGV/ZL3xch9OfBsYj9i2s/rPdoKNE6emT2tQjF6Y2ugvXAsak3VvrqrRA9tp1MdC2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M9GETrwyT1aV7g19g9EfeatfmGwyZ0WdB7cy+9tz8ck=;
 b=h/gCXJyrS0j0n5JVbpufufQpuQznkX73UdfX9mlubLBXT7UERo1ZMUee9vtQUDHvGXn29TLeRuZC6uZElg/LdWrcDTXSix6cf6sGmQu8XjwgYnHcQEMzmXTdW3/ahnWNHyXiYPVjH1T6Pb37TQ6Cy83IakWZKajXiJBWr/MLgXH4wL0mznfHcY6ioE/hvye83eN6nwLtq9vC5CxBrOQERcEZgy0y02+tpqVpr4uiAWN6PCdkhwLI9O1doQLq/E3iS1ikCYJLZgSp+7UKCQioOgaW7r7/dd6zN+fEnGRwVhKXNsAN0qV04Rd3yHIHLIw82bfnmsmdGwRkfPqISad76Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by KL1PR03MB7526.apcprd03.prod.outlook.com (2603:1096:820:e6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.21; Tue, 27 Oct
 2026 03:18:46 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::78d4:9dee:2e32:d1e4]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::78d4:9dee:2e32:d1e4%7]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 03:18:46 +0000
Message-ID: <7bd4a0ff-7e28-4a43-b17d-6d92697b127f@amlogic.com>
Date: Tue, 27 Oct 2026 11:18:43 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] i2c: amlogic: Add Amlogic A9 I2C controller driver
Content-Language: en-US
To: Markus Elfring <Markus.Elfring@web.de>,
 Junyi Zhao <junyi.zhao@amlogic.com>, linux-amlogic@lists.infradead.org,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 Andi Shyti <andi.shyti@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>
Cc: Junyi Zhao <junyi.zhaol@amlogic.com>,
 Xianwei Zhao <xianwei.zhaol@amlogic.com>, LKML <linux-kernel@vger.kernel.org>
References: <20261022-a9-i2c-v2-2-45e3cef175bf@amlogic.com>
 <7015dc55-5f19-4a6a-89aa-d11da0190b7e@web.de>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <7015dc55-5f19-4a6a-89aa-d11da0190b7e@web.de>
X-ClientProxiedBy: TYCP301CA0003.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:386::9) To TYZPR03MB6896.apcprd03.prod.outlook.com
 (2603:1096:400:289::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|KL1PR03MB7526:EE_
X-MS-Office365-Filtering-Correlation-Id: a50bb1ce-1c21-4a92-cc9f-08df33d9034e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|56012099006|261026121527099003|4143699003|11063799006|261009223027099003|261021121427099003|261022075727099003|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info: lrgHNkyL3npVqFiy91+qhivirzAQirX7X1rp2mqU5tFLBRBUADOrvC287FGrQ9eX3GQ4raLskVQIcGWZW1Y3GXabqD9FmKyu67xVWkIbEH4k5GPQqcpu81UiF4TM+mhwCsr4gJUft//U/Rv+DcSiu0abPMVn8bnZ2nKiKaZ/+1ZJ0rXps1lMegC9X8zhhIDkda3eSaYIhIOMO9K3rKd8cR/3Q7bdZlA7oz9GBvqWuEXL7SPnkqaromWn+tXArmjiRxK8nddLrbA1c4ii07ZoTfBjw535AABExMNMXr50KwUYM8eU0o0oMNRpNd36r/bJTChaqIdClYgozblHZ8oH2uwFplIAXzAaT7kKztDyBA8rPFJQdi2+xz9lpgZCl9Oxfv3f7RElSfCiO543xtATVKexPZucem9lXSaWV3ihMUkQqZnwOvA8fRvnAju21drPl53DpZJOAUxaiWA7raI1ZrxK7wbkX7yIJIddz3zH024PmI3R0Fa7GMQBdZI6+Sjb31TxHtb6Dn9hjocLD+nCVs8IuVKvJjMkezcJvTbq2/qQeJG5SMtF2EHr29C+RB18XBNeUEcnB+8cLep7Z4GO3jNMhafREARgjFdJ89cpVZG+TkJ/8Sifnr71GkkYkBxzXjXzTIBYwlKWpllPspWEW9/+ABJU58sNwcUzRKWe/Dc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(56012099006)(261026121527099003)(4143699003)(11063799006)(261009223027099003)(261021121427099003)(261022075727099003)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bkRiRG9tblEvSExrNi8zSk1PanVXWlhjbUFkT1l3R2pieGc3OEJzaXowcTIw?=
 =?utf-8?B?aGkzUktwZEFsTnNycDZRQzg0bUptUnFYaHk5MEZ6WDdaY0h5UmMrV1A0Q2pR?=
 =?utf-8?B?a2xnVFdvdXJCak1OajNPYVNWajRsZkNxcGlpUDE2YVB0U1ZCalNqdFlxS250?=
 =?utf-8?B?cUh6YW9uODg0eC82THZ5T28zQXVicUdvZ0N5REVobU44VndvMmFNSlNpSUJu?=
 =?utf-8?B?Z3hSdWlYS1NaL2JDRGlWV0hSdzhyazNGdk9nczRsQUNxR25XZ2srSWJyK05m?=
 =?utf-8?B?MFhndXg5YWZwc0ZQRHZZOHZvNjd4Si9sNmdLeG90OG82NFVrNkZLN21CUUpN?=
 =?utf-8?B?Y2ZUTVV0VXZaeS9Jb0F1UXNOY0FjUk5GYmhHd0hwbjdYVkczWktlSE85THk2?=
 =?utf-8?B?ZENDWU51ZHJSOEF0amg0QTNGWk0vYkxGS05KYm9Oa0Nqajh2ck9xU3RjV2Vw?=
 =?utf-8?B?MjFvTDQwbUYySzNPYVlKT29tNUh1SzQrRTdSOGtvbk5YVURLT2xnNFRZaFh0?=
 =?utf-8?B?aFN3THpsQ3VLTmhYRHlCaXFEelZic3VYeUUwQ0hWM1dpc1l0eDM0ZWNsd1Rq?=
 =?utf-8?B?N0NrZStSSnptTmhRVUwrTktmQWVSaTkzSWRVM2ZpKytjZkxHRGxQSkZ1bExw?=
 =?utf-8?B?WHp2YUhOeWVGdVFuV3l2WXFIUTdQZzEwZk5YbXlyQmNWMk92OVVuNEt2VlBP?=
 =?utf-8?B?RkVWMkVTMm4yUUppNHpuRkRJcVZOS2kyZm5EVWVtT2hoZXY1OWhwdGdaM001?=
 =?utf-8?B?WnlYaTFFeHIwUm16S0VCd3F4NnRBdE8yVXQ1YmVjSFVobk1uVFdPKzNPSk5p?=
 =?utf-8?B?VGFST2tvTkd5M29rTXM4NUJXTzYwZklTVit3THpaR3Jwd2hPRkNNUW1rc0Y3?=
 =?utf-8?B?ZDF1bjVuNHo3cFJRUUxtWmtHYklwWGJ4TUlrKzVncjFnc0RDNCszNkVDU2lp?=
 =?utf-8?B?ZzZHVUQrLzJpZUJ0Y3ZvamlSb2lUTE1aY2lsbXh0M2NyUnVJSXNRanFjNGNM?=
 =?utf-8?B?Y0x6cCszRFRzK2o0bTJ5QnU1Z3hFelRHMjBUZDF2Z2ZqU2dJSFZLQ1NUdk00?=
 =?utf-8?B?eXg1YmRhbDQrWHNmMUpocHlVYTB1Vi9KMnhvRmU5N2hFemtISGs0ZG1mRy9Y?=
 =?utf-8?B?NTBOTURLRFdxRUl2d2dmdjk5N1hxK1hTME4zSlNFV3FESFN6a2FRUHR4dGoy?=
 =?utf-8?B?Y24zcmM1d2g1SVdTN3Z4WTNWVEdWVEFZcDZLVWl5U1BTM0xmTlVWNTJFNE1I?=
 =?utf-8?B?YkdwdG1KbVNERmY5Y1AvdFJNKzIweHNiZkJHeGRXZXlaT3lpZDJzQjRZUmpI?=
 =?utf-8?B?UCtsa0FXVEV4Ri9DbnhQbEc4YXRFNnpEOUkzUGx4RmM4SHEreHdHcWdjZ0hl?=
 =?utf-8?B?WTNoQVJmRm1UbUVwMndnV3JWQ1dxOVltMUtJWi9TQ0xVUm1KQU9ldmJlMUpT?=
 =?utf-8?B?VnVFeHF2RHUyMTE0dVdudGR2WHc0T1BGUFhjYS9iRXQ5ZG1PeE52Q051T3RC?=
 =?utf-8?B?eUNGN0ZIeEV4QUpKRE9ERVo5Q0x5MW8ydFV5eE9DbGFNN2dnWm5EUnRRcC9S?=
 =?utf-8?B?UHhwZ0NwZytVREpNVEZsUVhBMG9NN2NGTyttZFM4NU0rU0xYUGFqcWdDU2NY?=
 =?utf-8?B?bUdGTzF2b1JMN2JWU1I3QzhhME5Ua3QxRnhEQnc2RTJhTW01QUlyMmc1UmZw?=
 =?utf-8?B?dndlOUhVVjRLeStURG54MnpOdTcxVURrSDFjYVRXTVhhM1dvbGxsSDA5RDRy?=
 =?utf-8?B?OWo2dkJ0R01iR0tOUnNOUmp4bFBITjFMQ3MvZ3o3ZGdQdkJtKy9vanBhd2JO?=
 =?utf-8?B?bjlzWFNZRWdwTlRnbVlGMU9KZHVsZWxSVmREOVJaaEJ4M2FRa3JaUzhRMEdH?=
 =?utf-8?B?VW1xK3VTaTVZUTJEZWd6dW0vdGUxNC9lQm16Q3BWY1l4K0J4c1M4OUFjeW00?=
 =?utf-8?B?RHAzL3VkVEFvQVFLUVZZcmVBd1IyV1RPeUxsUVhtSmpUd3BtdE1CSm55aE5Q?=
 =?utf-8?B?Z2JLRHRUV3ZOZ3p5MnpQQnpoSVFwQlJPVldjaTlnRXFkanBKUDNpNjJjNUwy?=
 =?utf-8?B?NlJTYit6YS8xY1NaNkdhVkcwN01SZlo0ekQ4WW12eWNBMHpYTmRtbkR0TkFt?=
 =?utf-8?B?R0Z4cTVRTGJxZEVDMTVFOXBsUTNhRDJCTWhySnJ2U0xMZWp3eWUvZHY1aUxR?=
 =?utf-8?B?blphTVo5SDVvVU5NaHFiZFVMdE9yeVF3bWFocU10MXhmTGR4WDhOU1Z3U3ov?=
 =?utf-8?B?SU9qMW16bEw4S2taUnFabGhnZlFKblVoK1VsaG5QLzlUNlp0YnNFaTIyaWZP?=
 =?utf-8?B?Mlljb0NmRG5lVmJ3aC9LRWdkVUlOa0I5dXpRK2pCZVJHQmFZVGxNUT09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a50bb1ce-1c21-4a92-cc9f-08df33d9034e
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 03:18:46.7233
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +UXcDJWlSp29c6+Er+7WS0ye9nvCK70IRCwLlE3/oH37iVbLF4/Qti4s94jRWeyZsmbUeSN+PGnIktyxLyumxnXoJGJCG+0hPlSJ/v8E2Y4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB7526
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_201900_669949_B33DEC17 
X-CRM114-Status: GOOD (  11.23  )
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
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgTWFya3VzLAogICAgVGhhbmtzIGZvciB5b3VyIHJldmlldy4KCk9uIDIwMjYvMTAvMjcgMDE6
MjgsIE1hcmt1cyBFbGZyaW5nIHdyb3RlOgo+IOKApgo+PiArKysgYi9kcml2ZXJzL2kyYy9idXNz
ZXMvaTJjLWFtbG9naWMtYTkuYwo+PiBAQCAtMCwwICsxLDQ2OSBAQAo+IOKApgo+IAo+IEhvdyBk
byB5b3UgdGhpbmsgYWJvdXQgdG8gYXZvaWQgYSBiaXQgb2YgZHVwbGljYXRlIHNvdXJjZSBjb2Rl
Pwo+IApUaGlzIG9uZSBoYXMgYSBkaWZmZXJlbnQgSVAgZnJvbSB0aGUgZXhpc3RpbmcgY29udHJv
bGxlci4gVGhleSBvbmx5IApzaGFyZSBzb21lIHNpbWlsYXJpdGllcyBpbiByZWdpc3RlciBhY2Nl
c3MsIGFuZCBtb3N0IG90aGVyIGxvZ2ljcyBhcmUgCmluY29tcGF0aWJsZS4gVGhlcmVmb3JlLCBp
dCBpcyBub3QgY29uc2lkZXJlZCBmb3IgdGhlIHRpbWUgYmVpbmcuCj4gID4g4oCmCj4+ICtzdGF0
aWMgdm9pZCBhbWxfaTJjX3ByZXBhcmVfeGZlcihzdHJ1Y3QgYW1sX2kyYyAqaTJjLCBlbnVtIGZp
Zm9fZmlsbF9tb2RlIG1vZGUpCj4+ICt7Cj4g4oCmCj4+ICsgICAgIGlmIChtb2RlID09IEE5X0ZJ
Rk9fRklMTF9GVUxMKQo+PiArICAgICAgICAgICAgIGkyYy0+Y291bnQgPSBtaW4oaTJjLT5tc2ct
PmxlbiAtIGkyYy0+cG9zLCBBOV9JMkNfRklGT19ERVBUSCk7Cj4+ICsgICAgIGVsc2UKPj4gKyAg
ICAgICAgICAgICBpMmMtPmNvdW50ID0gbWluKGkyYy0+bXNnLT5sZW4gLSBpMmMtPnBvcywgQTlf
STJDX0hBTEZfRklGTyk7Cj4g4oCmCj4gCj4gKyAgICAgICBpMmMtPmNvdW50ID0gbWluKGkyYy0+
bXNnLT5sZW4gLSBpMmMtPnBvcywKPiArICAgICAgICAgICAgICAgICAgICAgICAgKG1vZGUgPT0g
QTlfRklGT19GSUxMX0ZVTEwgPyBBOV9JMkNfRklGT19ERVBUSCA6IEE5X0kyQ19IQUxGX0ZJRk8p
KTsKPiAKPiAKCldpbGwgZG8uCgo+IOKApgo+PiArc3RhdGljIGludCBhbWxfaTJjX3hmZXJfbXNn
KHN0cnVjdCBhbWxfaTJjICppMmMsIHN0cnVjdCBpMmNfbXNnICptc2csIGJvb2wgbGFzdCkKPj4g
K3sKPiDigKYKPj4gKyAgICAgaWYgKGxhc3QpCj4+ICsgICAgICAgICAgICAgYW1sX2kyY19zZXRf
bWFzayhpMmMsIFJFR19DRkdfQlVTLCBCVVNfTk9fU1RPUCwgMCk7Cj4+ICsgICAgIGVsc2UKPj4g
KyAgICAgICAgICAgICBhbWxfaTJjX3NldF9tYXNrKGkyYywgUkVHX0NGR19CVVMsIEJVU19OT19T
VE9QLCBCVVNfTk9fU1RPUCk7Cj4g4oCmCj4gCj4gKyAgICAgICBhbWxfaTJjX3NldF9tYXNrKGky
YywgUkVHX0NGR19CVVMsIEJVU19OT19TVE9QLCAobGFzdCA/IDAgOiBCVVNfTk9fU1RPUCkpOwo+
IAoKV2lsbCBkby4KCj4gCj4gUmVnYXJkcywKPiBNYXJrdXMKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0Cmxp
bnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
