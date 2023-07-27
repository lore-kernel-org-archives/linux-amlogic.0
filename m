Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5747BEB64DD
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Jul 2023 07:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KjYa1VerbRKGruMrBiXPKyIvJYVBxnffF7702MV2HBU=; b=0eBA0Rq01U/p2Y
	SwPtBDbamp9b7b35XC6Zy1FbAJiEN0D5AZ3lj+YBPU9pGXa8N6haGFCfpaKFQJ5dF8LjAX9uOqQ5U
	x6vjHnMUXrI1BTb3wVDe0pnXbsDMgFIyIJnTRwQTOtzE4+W5cm3wgY0dkq/zmkW5XVCynV1o+Tpbe
	Qnpsev7rYYwv0pJT9pIUTYl1DINwUfprOgmAWE7ftjzmugvQeFy7C3ZpwiPPq6m2gGw6rJSQxCH1u
	egI+n200z7OaMP5YVmPNV/lKImblT5Tg1nVf1SGWsK1nVDAz424+RMG+MBpFYfVHbUowJHvt6RMqw
	TZw3apLru8JOtyVQKUsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOv1G-00CP6u-1N;
	Thu, 27 Jul 2023 07:02:42 +0000
Received: from mail-sgaapc01on2072f.outbound.protection.outlook.com ([2a01:111:f400:feab::72f] helo=APC01-SG2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOv0p-00COhr-2O;
	Thu, 27 Jul 2023 07:02:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kiy8fpqcp+uNTV8EGISWkzfm6FYRJqrhdHDdxc6Uoc0RfOXCUKsdJzeZox4RV9pED9gWhv/VW0R22qGhNVOImeFd83pxs+Th2eyfxSxSn4vBWq97f7FrzoaMveQgTxTOJRFpL4QSI4rK7cKqjN5g8SuRorDbSB7RpKnybnjVIpy+AxHIj5s7OIGPBadMGWcF4B0KxAAKki/H0eZaTvOZ9iUd3MC2HhwwSbtub15MQPCVZ7tZmdlhJ3ORxZykJ5igfC9zOSeUep7xcL8WwEyf3aBSPpqDRwGq5gBFOYrDX8KzBqWwX5swem3nmG+pfmdsZD8tx6b3YgIe3vXTs9LDbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uMtEtYh4yggL3P4Ktr/c7Zr9RRKQR6LhGA6gTsORCp0=;
 b=C/8wYarhD0g763S+2R0YVLoA8YWma4oSOAa6lSGF3wZ3Jdil/S7vy2epA05lHEiRIgiVYsMUAoz0Kv1K2vslF/g5+k3TyQT0xqjuQjDRtO3pLd9K2suSlG6TLK0vnyryuQ+h+RRxkZxNTr75M1cS0r6YNj6qlVSU2cmgFArm31tikDSOv9Vvy9CswROhAuPZjdQiXy48Nr0hh0ddQHRbL7SAx8SZApWCcrEk0dbQi9ZiYsfF6kQg5ObPzfBy4KKiIB5cf+3u8Kg3XcU31lmxiB4ulgeNH7xITCZl8jVM+iOQabBDt5RxNmV/ES5v0iCRfB75fuFhAAkNLSYS2NhjLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uMtEtYh4yggL3P4Ktr/c7Zr9RRKQR6LhGA6gTsORCp0=;
 b=RFNIOrLd7nMRu6PF734qYE16QISHRovR/ECDUObPbc6D7CEGfg8T2OzknJdxboJa1X5M+B8rdCQMnSw2Dc+Y5SZUqz7k5CoXZE8Hvck9utSiO4S8u2IoJ/CNlZ1yMuQGUQ17ejRP1G7+0VqCyB7OFPvh/4stiag+9lx3MSrQvM4k4jr+2x3sOqTfHdsLOH3cG9ZYnehqcrfJor+c2OA4p50GzJMpBrCD4a3205HuYHI1XRzcB6jJgjVd/Ra2O3ykJWCJPzS59bbBGIow2HV9uW6aDh2wv350V+4mDU2xvQMYPUZhEtR+G0pIXfwZIQlYgDm7wtxM0hwTT00H0KXncQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by TYUPR06MB6027.apcprd06.prod.outlook.com (2603:1096:400:351::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Thu, 27 Jul
 2023 07:01:59 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::732f:ea1d:45a1:1e0b]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::732f:ea1d:45a1:1e0b%3]) with mapi id 15.20.6631.026; Thu, 27 Jul 2023
 07:01:59 +0000
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
Subject: [PATCH v3 34/62] mmc: meson-mx-sdio: Convert to platform remove callback returning void
Date: Thu, 27 Jul 2023 15:00:23 +0800
Message-Id: <20230727070051.17778-34-frank.li@vivo.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230727070051.17778-1-frank.li@vivo.com>
References: <20230727070051.17778-1-frank.li@vivo.com>
X-ClientProxiedBy: SI2P153CA0017.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::10) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|TYUPR06MB6027:EE_
X-MS-Office365-Filtering-Correlation-Id: 01ec279a-c658-4fbd-3b46-08db8e6f5f20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o6XoQrqFprSoK1KdhqPVLq7ymr3BXLNLLfQzFhp0fsXsQH3EjQp/hSaibvYZEwaEzTekM5eqHdrDotP9CK5S3S5miiIc2Au7jnRsmV7D4SUodym8TQW6/wBCc05bj2TTF51fXga60ze6k0J9q3ubgkujUmRTcwaFDiojbvke3sr+wPOGHjhSWn3Htjla1nal8MQ+dwBvQuabmOY80BIOpwbzXlF77FpNeEzibbLAPTP1KACCc07hsVLLKJzwUJxrRPRg4y+WE32jxnE9OpE5n/c8oowxvqQZtLu/J1i3DKNy8oatYfzmJRx25xGjBEfcjSzZg7RRjc9YNcMVG+xlLQCHLI/4zeuW0lshxfmXAebUbRfgtZhVByKzotu47qk5+HOnMCL47ILsjjLVozLBnwuEbqVnfXAX4YqS0rPVDobqIbO7ZZOyxL6QuKnsg8FvRG0Da8ogu7evhcJKKTJbQYJiEely7TjOpFNTXeoJF/tUsTKT9gosawC8+rlvLEllKaVLaJwESpZhxKj7vqtdqV76sE3j3EfiuRfnMGIbD1JyedgdZMirzByawLRIsIy3z9K0fOuf75wrEc+Y4VSRL8yZLqk5y7M30lC8Uxk+B9MVUB9G8M7A6VjSu/O5c5Ze
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5269.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(136003)(346002)(39860400002)(396003)(451199021)(2906002)(1076003)(6506007)(26005)(186003)(86362001)(316002)(38350700002)(38100700002)(2616005)(83380400001)(5660300002)(66946007)(41300700001)(66556008)(66476007)(8676002)(36756003)(8936002)(7416002)(52116002)(110136005)(6512007)(6666004)(4326008)(6486002)(478600001)(54906003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K05uNmg1aVhUTHVLRkZtUm5LVkZYZlpKZkpydDA5K3VLb3ZBcVZwK0dvSFMr?=
 =?utf-8?B?c2M2eGRvT21kSUhrTGwwckI2S1JpVjRnWCtrQThiZTV5TENjVEVuLzRjcDRJ?=
 =?utf-8?B?a2FYeisxYWhvVkMzME1IZ0JQZ2UxRkdhMFdUNHVDZDFFWjVrTHRmVmU2NUV2?=
 =?utf-8?B?MDFuV0ErR2pGaVl0T2dqUjBlWFM5VUZsNE1UMndaa1AweSt2aGVHNUZRcC9U?=
 =?utf-8?B?cjBuRDFUWkJEMmVOUld3dWR3d0E0UDV6TEgxWnBXUWl2bG5aU3ZKT1o4YkFE?=
 =?utf-8?B?OTlMNVlUNmNNcDQ1SHROekZNenlnM0RlTUN2ZldoaUFKMXNwV2VKNE9iQkk1?=
 =?utf-8?B?UW9qb0hKcTVkbEEvVElZWFhaTUVSaVFLeWZFaG5LZmNpSjY5NUlIVkgxNElh?=
 =?utf-8?B?TGE0MFZtejFuU2I4dklUdHVRdW0wN05qVFhVazlMZDBOSTlqdWhCcUluVWpY?=
 =?utf-8?B?bDFpTHZkeGh0bDFRc0dCYXIzaUdsUHhSdGRIQTIycEQzYVFaNGUrYmUxclNV?=
 =?utf-8?B?RUhUVVgxd2ZwWUdwUWlZMUlzRXhIOFJDK2svcEMzZWZwQnh6eGRVL1Y4NTJp?=
 =?utf-8?B?WUpQYW00dzBZcjFXNnAwdWEyMXRDQlRzMkpFZHE3Snlha0c2d0FYdEZDYjIy?=
 =?utf-8?B?UUZsclRNeDVkUWVhOUY2aVJFa09NMjE2bFBYV2dTZnBRbTBIYVd1OHFyWDdv?=
 =?utf-8?B?TGhFMVM5WHkwdnNwS2o5ekVwUW1yUXcwbHRnM1FZTGtRLy9lY2U3YjN6QjJr?=
 =?utf-8?B?NVQ3dktzQ2pRQjMyR0ZkQXM2TE8yQWxpQW4wMk5RWFhBcmtWQTdiT3RsWTNx?=
 =?utf-8?B?ZE4wSVhPdzY4amZhNHEzcWxxSk5hV0NjZStxbWF2ekZCK1hPSDlxYnVxeEdW?=
 =?utf-8?B?dDRXc2tIVUM3WmpoY0p0V01BdGtMV0hBMm51eForOFFQSXRJcjN0ODBYNjB1?=
 =?utf-8?B?MnlQeU0rV0ZINDQ3cEVyNXZXUE1iWXBnbkU5WnQ4TWNZTVBnZnhjUEhiem5o?=
 =?utf-8?B?eis5SE5PS3FSS3JmQTN4TzRFQjdZNkFsQ2FlMmQ5TGptNnBuYi9sKzMxWmhs?=
 =?utf-8?B?amc4ZEFUT2JuSDRnakdqMHZ3aDRVdmE4bXpEVWpOWURINlVNNDBMR3VjbEw3?=
 =?utf-8?B?VEUzU3loSHZoY3llYXY0Z0ZXQ25JZXA5TVdZaGN3UTJ0SytwK2FFVkJRNUJj?=
 =?utf-8?B?VHlLOGd1TGZSemh2bE9lTzAwZXhpVkFQQlVCQU1FVVJaSWhtaWlVRmFqdy9w?=
 =?utf-8?B?YUtNUnQySUJ6bFRzWUZUSXpwcDNOTDJzazh5Nm5oVTc4OGU0bTVDOTJwZms1?=
 =?utf-8?B?UWhjWWlWcTloaWdHZWNZL1hkRngwSHoxNzNuNFloblYva0tPS0UyVDhzazBv?=
 =?utf-8?B?b210QkJRY003bnV0ZzJtamczdHF0TCs5Q1c2R2FtdnVLOEhBNklBY2hacUpJ?=
 =?utf-8?B?ZEhBOXhSaDFaYnVJVGs0MElnblR6NGlKbDJGNGZ6dS9qWmxhb1EvVTNobnly?=
 =?utf-8?B?U2FYbTRrSnJqQ25tQUlNV2dwZVA2ZEdrS1h0QmluaXlabzlFenRNQ1BEYmpt?=
 =?utf-8?B?dWdRTk5LejIyckhjY0w1Q3dNVTVCSTd2Sks2SnNnc0YybWlheFNFY3g2TUNO?=
 =?utf-8?B?aUJPVU15UHliY0xXbmU3RFJhWTlrYlRoOHhHbUxyajNvOTB1MTF6OXR4blNp?=
 =?utf-8?B?aU96TTRjYjhqRDhxNFR5c3U3RWdyNmdQSC90a3VaWDkwWlZObXBUbUpNS3V5?=
 =?utf-8?B?QlBqa1M2Y2x5Zmwwb0s4QXVYMFRTdnF5L2d6ME5UUVE4U0J0ZVAzcDBaUW1i?=
 =?utf-8?B?Y09rVGhjZTFUNFAzSWlZaGs0dmxOU1JZNzFHVHduY2FtOXFDZHBVNWM3MGhW?=
 =?utf-8?B?WWJyU004SDdpSlhWNms4TEtTTWErSXVmTDVud29mWkJleldGZXlQd2hMS2lH?=
 =?utf-8?B?MVo3SDJVZEFyWk16dkRQTG9aQWNHV2p2a09CbG5XaGRjY29OSlNnR1M0bmNC?=
 =?utf-8?B?eEFYc1NEa3BWWEo1N0xxMXl4L2FJOXBtc1NOQ3VzdEFLbWh4RzNGNHQwRXlP?=
 =?utf-8?B?YlF1QXV0MFdrU2tXY2ErbXVJbnA5bjNVYStsTnFxdlBKTmJLK2hRZjVqWDYr?=
 =?utf-8?Q?0KHY1zVQmN+CIitJyMhSOs99D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01ec279a-c658-4fbd-3b46-08db8e6f5f20
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2023 07:01:59.3414
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3hzrNXyFfTDAKTY4M9mihnw0CU/7Yx41Mu+vb0rLBSrLEStUm2fN15U9PUijxzFSsbiM0rabtqPgDoODjTrJZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYUPR06MB6027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_000216_039864_BE4D5282 
X-CRM114-Status: GOOD (  14.85  )
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
