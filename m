Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 177C2EB64DD
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Jul 2023 08:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KjYa1VerbRKGruMrBiXPKyIvJYVBxnffF7702MV2HBU=; b=t5K3fVLJtzZFEl
	pbsoQ6h1gyzxNqqsWv6djkACgpylOWIHNI2M08Kj6wNSRhOakm+1+okzpAxvFMCll6vwnnhnGgATD
	jxBah7Ofriyz4qVqAPWqS5WZr4NH1k7/0wgrhW0ClyE8nZU7cecss8+pRJdnnK4rsL5K2PPU049gq
	Lw4ZcOqFnxpNm7p5ENi3bmk6fzLyvgoRlLV28PW0t4rhceUxQIMQ1WWdOXMkW6p1BM3UivEi+w6zF
	Bda5cQTebUwynjIbFuqSLe45MJ51YzdioQ8Uj5QhZzyrjz79fSeykEyKk8lBT0C69atTwQux3+YVI
	3r8ok5jqofMe5TI9ONMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJrOL-002Nha-1E;
	Thu, 13 Jul 2023 08:09:37 +0000
Received: from mail-psaapc01on20721.outbound.protection.outlook.com ([2a01:111:f400:feae::721] helo=APC01-PSA-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJrOC-002NY2-14;
	Thu, 13 Jul 2023 08:09:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oepT/ZoJyvDVwxR4VR7zY+fG4EuW9UVnViY9J6S7zk1Bnfwuy0SKC9mXZphEXwqjLXryhI0XGwQfrj4x6QNIiN+Wu6jOn3E26H+0AheIvMAiQW1pG12CSI3VM2I+xGZStE0DQPpkvJYnJtivV49bp15CdGjLJEP0QhYhJjdFAEB33vVCSkBUkAlnrBizY+Gy+LqFTcsvrEywlGs1fkv6Np7mA+Hv/cYVskjazzadLo2VRsXr0JqKhgx7kL5F3SRqHU2lC10U6SNnXaDwRrAvQh1HzjYWwgI2rHLW0kdh6o6DyTTZBiClIIr0y5doudKQqhuzSzDNoo6BB0J+m7hCkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uMtEtYh4yggL3P4Ktr/c7Zr9RRKQR6LhGA6gTsORCp0=;
 b=AeuuckOgKEMLg6D8nyyu/sQNCsY7pMVrQx7YuOwIrtq8sZCCOZ7Ss49IZMF9pXs20IXgtYwypANjzsccpwuRe2C0AXv/QRe5Xx6iarYDu/hFoYaGNkmYTtJYwUmVWsdOMlCWf9pcIRLU1YfeTY/DHX3Ahj460c2tgJ8ICs2rWAB5kuSrP/ZoQHv/H+bentY+E6aN96It7We8tk/CNW8Mw6GSNHj++BLLZGgXbV4tpjJNG2FoLM82thX31nYRiaVybk7G/l5G3ejS41C1743kZ+thzn5FvrLFdiQ1wBAeb5unGpsAgb5aYZTpeLB30eX0DKcfMOPD2y3d/0AeXThjog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uMtEtYh4yggL3P4Ktr/c7Zr9RRKQR6LhGA6gTsORCp0=;
 b=get4PgZLKhRYMqQxX5xtrZBI4EueLM/enpmA6YrBHnN0tVo4RaC/rU2gfUgD5BGHIyBHuE/3kun6p1IPCYnj7cSAAV4CamNey0pfG4lzzcdQAdjqXvNXAFgczmYkR7bIA3/NZYHl66ZlJWPdTNbhVQHF9kQTA6RK4CbGXtDDxpcYkdN5JEB9xzZyRTqc1D0gaT9jJB5a3CogxY6JYzGmQNGs/5j0Xeq/l0kc1zovQ3SVBTtAwuCqZIFBef5QmeeUnNHyjxKlkLPHSyWQj5i7mVxeCSRoBlVOke/ULCRq6rttVVq7srquEboIX1IFeEp51aeTuwG0zP3A8XObijmvUw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SI2PR06MB4409.apcprd06.prod.outlook.com (2603:1096:4:15c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.24; Thu, 13 Jul
 2023 08:09:22 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c%5]) with mapi id 15.20.6565.028; Thu, 13 Jul 2023
 08:09:21 +0000
From: Yangtao Li <frank.li@vivo.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Yangtao Li <frank.li@vivo.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-mmc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 35/58] mmc: meson-mx-sdio: Convert to platform remove callback returning void
Date: Thu, 13 Jul 2023 16:07:44 +0800
Message-Id: <20230713080807.69999-35-frank.li@vivo.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230713080807.69999-1-frank.li@vivo.com>
References: <20230713080807.69999-1-frank.li@vivo.com>
X-ClientProxiedBy: SG2PR02CA0091.apcprd02.prod.outlook.com
 (2603:1096:4:90::31) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SI2PR06MB4409:EE_
X-MS-Office365-Filtering-Correlation-Id: ec7bf0a4-a3ac-4054-a764-08db837876e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 16MSeHMUey2zVk3KeGERPfX8XV6QLbsK4hPHIMot37+9Sz7Qahqwq7+UvyUwmAZeK+0C9wIpRCRiU4eTyFxry4dF/NsRJwxJ6nMvJiB8RP8X7hBmboEUqPzEEPIqjhDJBlXStNyK/SybASANvjVEHv0YZyO6zpuNaJT2wZqhgxxuVb8fGNxyauMBtPrmmeUJtiueU7EgXT7X8m3OVGeKD8X6vLPRmF0H6DjU1s5qa5A0kWVbMCTACgSFWGOhIdekM41Vk2WgJSRjYA0OJiiZVAcsXeHdO1MzRdYet2/VPps3rEpVvwB3kSzGkFVoAs8QNf4FSe9Ge6JQHCW2YJ9Pxi6M6/oPjvSK8ZpjEyR+EWmA0MxBdiHuG+j6+SqayjFFaGEehkLZApJEQC6pcpvh1cCY7dYjrcA9ilaUlIXMlEZKvMVPLqY6KhVP9UndiEPJwOQGUzb0huZVsO330lvWWiHDvnlhISTkZMwLylLYnnNoJERZCysgOQ8q8gRCSTtqELlEAJI+neAUHl19aCDo7umLUOPPj33RteHKOk9p2wy3Fja+D9OvATSSmTBmVDENHEag4q1K1bSncOgQf73kMo+5qXXwQuFWdlKFl074oC23RMvM+msI49SA9lNtW7lq
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5269.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(396003)(39860400002)(366004)(136003)(451199021)(478600001)(52116002)(6486002)(6666004)(110136005)(54906003)(83380400001)(2616005)(36756003)(86362001)(2906002)(186003)(26005)(6506007)(1076003)(6512007)(38350700002)(38100700002)(4326008)(66946007)(66476007)(41300700001)(316002)(8676002)(5660300002)(7416002)(66556008)(8936002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SlZQQVp0QTVsUkxTcGlXRTdUb0JSOWpVTWNEK1RPOEV2OS8zeUhDMWNOZy9H?=
 =?utf-8?B?MzhZZTJZR093V0FYeHZnSGlkczZEWVIrNng3S29OV0NTYkk3bHEwZTA3Y1JV?=
 =?utf-8?B?T0VOQlB3MkY5Q0JQcURGWXlRQ2JaeGkwdWZ5QXl3bEo2UEQ0Y05McXpkdDd3?=
 =?utf-8?B?NzliRkxHekZBYlRHTDY0WW1lOVkyR2pVUmQyb1dqOUJvdUNlMUdRRnAzeUtu?=
 =?utf-8?B?N2ZlQStJaUd5TWhJSGpDdzcxL2FOTmprMFhEN3YzNU9LS21HSUlxZy9QdDgy?=
 =?utf-8?B?dkNENllTaHhTQ0hKVll4YmNucGFUdjJtdTYzaWlIVTdlWFgrQ0RYUlNOQkY0?=
 =?utf-8?B?TG1ScUJiZHhOdE5kSzIwZi9iV2lEQkFYdEZKVnRwY2hualJ6czBSZTIxK2k2?=
 =?utf-8?B?T1hDMVpLRm9veDZCL3g1ZlU4Kyt0K0RkTnBPaEpVeEs2UE1CQnZBb0ovK0lE?=
 =?utf-8?B?MStFRFQ2OXJrb1cvUFVTSFNYekljTTZZRy9OMmZaQk1OT1FYOHRqODlubWpK?=
 =?utf-8?B?R3BUSktoWkhnQ01yOEZlMmY0UEtWL2JVK0t0Qng1azJYdkR0bVJObldnZHI1?=
 =?utf-8?B?eVBwQ3AwcDZPelNqK2Ixc1Z5RnhhZTZGSGtyNHNYbXltWER4ODY3VUQzUUVE?=
 =?utf-8?B?WXIxWjJ1K0xLZ1JNUUpEb1RqYlQyd3NsZ1A1RlhrTC9LSE51V25rZWFkU0lV?=
 =?utf-8?B?RDFwaXlDYW9POHZVdkxrcUVoK0s3bFR6QkE0VjhVNkRhZ0NSWWlCYVhKa1hN?=
 =?utf-8?B?YitnSnBZZS9YbTgwSTFLOXlZMjhvUTlnb3dKd0RCTDZWQm9DT2tiL0V2dGRi?=
 =?utf-8?B?Wm9OcW5lV2U0bU9aTzZQOHE1MkUyVC9EYTdQZnZsUWFYTGh2Vkl1TVFSTXZn?=
 =?utf-8?B?SkhpREtNeWtmK0hOWm9peUJqa1JkblRRMjJwWGZaUEgvb3hSQkNwYnRZcTdH?=
 =?utf-8?B?KzMyMGpIM2Qrd3U4c2M3M05DbE1RSDd4MzNkejhWaldJVlNINGpranhXM283?=
 =?utf-8?B?RDBsYWlSVmtXSEw2RXRzUlBCMGxlQldhUkp1enFNM29XSlhOZzI3WFhGaTRk?=
 =?utf-8?B?b0F1S0QvZVIrRkIwNE55QVZlT1U3ekhOaUkwcjc2bitLQ3VTK2JHT1k0c3or?=
 =?utf-8?B?SzRpTmJnellQZjdUK1dpOXpaOER3eTZYNWk0WWtCYXVkbm1rSmpZRkZIYTNt?=
 =?utf-8?B?WUkzSE82UjBGU2pSTTdDZjNrbEU0VFpoWGtLRE5rTnN6bVNYcFhnVHFjMUpR?=
 =?utf-8?B?TXBDNnFYMkZ2R2QzSlkvd0lXaDN5V3ppaDlhWDNISDFRUTgvTDY5dUsrRHpq?=
 =?utf-8?B?bWoycWpsUm9NdVZqVklkRTFTMmxTM3Q0SmJ3ZENCQ1ZBOGVlazdGWWVidFZJ?=
 =?utf-8?B?MlZMY2srVHRIcWVvVWRnSVE3bDA5TzBmWWlKaTM3TXZMalZ2M00rQi9LR3VD?=
 =?utf-8?B?MnJxLzIwTnVKTVJUeUxXWS9KbHNBUzRxdzZadFJWeHltNEtrNnVINXR4THly?=
 =?utf-8?B?TFFUQkNCdVpTVzcyYmsvTTVUMW9TN3JiMFB2WWJUYUZVYVRGcnMxMUFXVU5E?=
 =?utf-8?B?MmNEMkRlUlVXTkh3amREZHdiUHErNTJqSm4wUW4xaVFRSnJiMlo5R3hQaXdG?=
 =?utf-8?B?dERVcmV6a3BleE9ZM1Yvbm5SNm95WmpFcmJOZTd1c0tXQWpaZFBUL3ZDcm9t?=
 =?utf-8?B?ZEZpZjBaL1MyakVCWmxhd3ltVE5lOG5jaWw3M3JIQWxhUkp3Y1pQOFEwZE03?=
 =?utf-8?B?SmRPQzlDNFkrWTJ5cEhXMDdtOTFLMmlVUDV6cWlaeFNIMHhreHk2bFNkWE0z?=
 =?utf-8?B?cFFtd1V5bFh3TURUQmJwQldGZHk3UmxlcUlsWTBRUEZIcVVycTdvVCtUWEc1?=
 =?utf-8?B?VWhYVUJEcis1WHExMURHQWo2a3RKbGNZcU1GaFhWcWRDYWY3OE9KaDRxTnFy?=
 =?utf-8?B?V3RTL1RiVDZKaXg1WFZ0dUhTaWx0bHJHUkwrMEhSZGdUOThydnJJdVYvSE1R?=
 =?utf-8?B?WDB3M0FOQjI1b0ZPcmt5RUxtZWcvKzVkb3NmM0hIYWl1MndHallyamliSCtJ?=
 =?utf-8?B?QkgybGZoc2loWkVBZTgwSjlkRk81K3ZzRE9DU3BKUVZCamxiTTZaTi9iS2wy?=
 =?utf-8?Q?fC+YcwYQfRpYUCgrm5HS+rdRC?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec7bf0a4-a3ac-4054-a764-08db837876e3
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2023 08:09:21.8488
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vUDynbJ95iJrmAuHYp84wtGmS2lPp3GnPWZQtu30c5ff/3E7x+0lxwNM2rc4wq5kJTd6SWVrYg7eSmQrkLvhbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB4409
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_010928_375067_1C4794E2 
X-CRM114-Status: GOOD (  14.47  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

VGhlIC5yZW1vdmUoKSBjYWxsYmFjayBmb3IgYSBwbGF0Zm9ybSBkcml2ZXIgcmV0dXJucyBhbiBp
bnQgd2hpY2ggbWFrZXMKbWFueSBkcml2ZXIgYXV0aG9ycyB3cm9uZ2x5IGFzc3VtZSBpdCdzIHBv
c3NpYmxlIHRvIGRvIGVycm9yIGhhbmRsaW5nIGJ5CnJldHVybmluZyBhbiBlcnJvciBjb2RlLiBI
b3dldmVyIHRoZSB2YWx1ZSByZXR1cm5lZCBpcyAobW9zdGx5KSBpZ25vcmVkCmFuZCB0aGlzIHR5
cGljYWxseSByZXN1bHRzIGluIHJlc291cmNlIGxlYWtzLiBUbyBpbXByb3ZlIGhlcmUgdGhlcmUg
aXMgYQpxdWVzdCB0byBtYWtlIHRoZSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuIHZvaWQuIEluIHRo
ZSBmaXJzdCBzdGVwIG9mIHRoaXMKcXVlc3QgYWxsIGRyaXZlcnMgYXJlIGNvbnZlcnRlZCB0byAu
cmVtb3ZlX25ldygpIHdoaWNoIGFscmVhZHkgcmV0dXJucwp2b2lkLgoKVHJpdmlhbGx5IGNvbnZl
cnQgdGhpcyBkcml2ZXIgZnJvbSBhbHdheXMgcmV0dXJuaW5nIHplcm8gaW4gdGhlIHJlbW92ZQpj
YWxsYmFjayB0byB0aGUgdm9pZCByZXR1cm5pbmcgdmFyaWFudC4KCkNjOiBVd2UgS2xlaW5lLUvD
tm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPgpTaWduZWQtb2ZmLWJ5OiBZYW5n
dGFvIExpIDxmcmFuay5saUB2aXZvLmNvbT4KLS0tCiBkcml2ZXJzL21tYy9ob3N0L21lc29uLW14
LXNkaW8uYyB8IDYgKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA0IGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbW1jL2hvc3QvbWVzb24tbXgtc2Rpby5j
IGIvZHJpdmVycy9tbWMvaG9zdC9tZXNvbi1teC1zZGlvLmMKaW5kZXggM2ExOWEwNWVmNTVhLi5h
MTE1NzdmMmVlNjkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbW1jL2hvc3QvbWVzb24tbXgtc2Rpby5j
CisrKyBiL2RyaXZlcnMvbW1jL2hvc3QvbWVzb24tbXgtc2Rpby5jCkBAIC03MjgsNyArNzI4LDcg
QEAgc3RhdGljIGludCBtZXNvbl9teF9tbWNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAq
cGRldikKIAlyZXR1cm4gcmV0OwogfQogCi1zdGF0aWMgaW50IG1lc29uX214X21tY19yZW1vdmUo
c3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKK3N0YXRpYyB2b2lkIG1lc29uX214X21tY19y
ZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIHsKIAlzdHJ1Y3QgbWVzb25fbXhf
bW1jX2hvc3QgKmhvc3QgPSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0YShwZGV2KTsKIAlzdHJ1Y3QgZGV2
aWNlICpzbG90X2RldiA9IG1tY19kZXYoaG9zdC0+bW1jKTsKQEAgLTc0Myw4ICs3NDMsNiBAQCBz
dGF0aWMgaW50IG1lc29uX214X21tY19yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRl
dikKIAljbGtfZGlzYWJsZV91bnByZXBhcmUoaG9zdC0+Y29yZV9jbGspOwogCiAJbW1jX2ZyZWVf
aG9zdChob3N0LT5tbWMpOwotCi0JcmV0dXJuIDA7CiB9CiAKIHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
b2ZfZGV2aWNlX2lkIG1lc29uX214X21tY19vZl9tYXRjaFtdID0gewpAQCAtNzU2LDcgKzc1NCw3
IEBAIE1PRFVMRV9ERVZJQ0VfVEFCTEUob2YsIG1lc29uX214X21tY19vZl9tYXRjaCk7CiAKIHN0
YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIG1lc29uX214X21tY19kcml2ZXIgPSB7CiAJLnBy
b2JlICAgPSBtZXNvbl9teF9tbWNfcHJvYmUsCi0JLnJlbW92ZSAgPSBtZXNvbl9teF9tbWNfcmVt
b3ZlLAorCS5yZW1vdmVfbmV3ID0gbWVzb25fbXhfbW1jX3JlbW92ZSwKIAkuZHJpdmVyICA9IHsK
IAkJLm5hbWUgPSAibWVzb24tbXgtc2RpbyIsCiAJCS5wcm9iZV90eXBlID0gUFJPQkVfUFJFRkVS
X0FTWU5DSFJPTk9VUywKLS0gCjIuMzkuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9n
aWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
