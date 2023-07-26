Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43BFBC001DC
	for <linux-amlogic@archiver.kernel.org>; Wed, 26 Jul 2023 04:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KjYa1VerbRKGruMrBiXPKyIvJYVBxnffF7702MV2HBU=; b=WA1lzIU8xncGRi
	mOqzIr9zHoGPBODK1IHjQ8bCZDr9ZdhnXaJOFaIWrvG39Sy/QcKm4RwXZEsLNgtD+yu0tOuOF2/BO
	eg+Gixn528ExXPcWK54UPT8536usdMawk93Y0kuZtKLThTd47oNrSVfnsxsYdvMZIBqcbkL2mrq9f
	MbOmO4y/5wFd8jCSsbJeZo+UXwWgQmKeQu6U/xZvFwnghc+Y1NbL0z5h68bmCaHX3Wg4/HX5hojXa
	aGl0U78jS3/Bllx2Knn5NnTwdZCeRW0V+YVfssYd25Quln1DpExGtmoInfGtvp8GP61IN8rA+Gz7j
	typ52jaZQ2W/JAUX6ASg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOVjW-0094WN-12;
	Wed, 26 Jul 2023 04:02:42 +0000
Received: from mail-sgaapc01on2072d.outbound.protection.outlook.com ([2a01:111:f400:feab::72d] helo=APC01-SG2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOVjM-0094Mv-1R;
	Wed, 26 Jul 2023 04:02:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G4V/6frPZcW4FMjoVNkOcaspGo+swmq2yx0C1PyQsr1vJecn+L1Bqt+GK8DADH2GnopsNO0d6OkKjDRqW+nqIQahoPl9Rr8A0cYQmnhK7BumCG9QMj29g1/65hdeaU9VTlXge0QfnBq8fV79OawtHnLCgBAmuCLtblboYv9T+SJ89jGCGcxDDD3W4uEu/V1kYh909ZsCH1/3wiTYknXm4/vfynfmAApzqo2P3w/crFk80mfCc1d5I4YDYqJYLKUHG1PL9pEyVBAQFbnK0Yitba7emlGdU+Ltc6uVnu6a2wij4lxBwb4Cr1eo/qUjIUQv3r/bZ3aviXMBoW6HsT50PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uMtEtYh4yggL3P4Ktr/c7Zr9RRKQR6LhGA6gTsORCp0=;
 b=AnKPJhoVozAzcWi8YwnS6XpJOWXaUUGiesAZtgULDHQhmjM1S7KSWrDr0R93oX3AQpJG8s4cDwvPcUKALxV870v061aus2RPFy46eTHwInpCHQVDwn9AymyzpXsPoR55ss/6qr6kJ9ysrLNn9hKl4frp5aWm0uHTJ17NLGMXlKL3DO5sMgBAdiK+2Ymk1P0ATCz5VBEoyt+Z/EE26yiym43gqMhhhRBzTr1M9jbPlUhl3xdT38c8NZ6x3LFbReLej5KBvzY842/LJrUnxN+y3fmMbzR7lIYAAaOH6A8yEIGkYW2OVEqsLG+RYPY338yWkLJXMzZgL0nMWOb+DlD8sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uMtEtYh4yggL3P4Ktr/c7Zr9RRKQR6LhGA6gTsORCp0=;
 b=ojocoCYpCeQjEArK5y0HDcpzsvhgA5hjZkQN2/9NDbl7IUVbgsoZxI7kItuaOlIv0ZyAn7/ZkM+9jTxQAKKL4JNTDLuQj4b7pEmc57cJjaf2BjMIGuGwxDZ4mIwqgjohXKY/QyH3urFLpssNUdwVvx927ExZtWmKnbQ0QNc8GDk65AQqGjO27EmugHuD5kxeGtjN4gpVi/Rj36Cp1Z09dwBFggSmDtXlLL6DqzC+FPLZc4Qk+4vc78W1pxQXheqongN7uOBIG1DfNiZnz7TK919VLyeKvn/r9ttxwKqYWFycxoK8ViYfKZMIu18j5aqkSqQyPfd89xn5EfFHisdc2A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by KL1PR0601MB5463.apcprd06.prod.outlook.com (2603:1096:820:c3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.25; Wed, 26 Jul
 2023 04:02:24 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::732f:ea1d:45a1:1e0b]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::732f:ea1d:45a1:1e0b%3]) with mapi id 15.20.6631.026; Wed, 26 Jul 2023
 04:02:23 +0000
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
Subject: [PATCH v2 35/61] mmc: meson-mx-sdio: Convert to platform remove callback returning void
Date: Wed, 26 Jul 2023 12:00:15 +0800
Message-Id: <20230726040041.26267-35-frank.li@vivo.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230726040041.26267-1-frank.li@vivo.com>
References: <20230726040041.26267-1-frank.li@vivo.com>
X-ClientProxiedBy: SG2PR02CA0093.apcprd02.prod.outlook.com
 (2603:1096:4:90::33) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|KL1PR0601MB5463:EE_
X-MS-Office365-Filtering-Correlation-Id: 37aa22ff-92ae-443f-fe98-08db8d8d0f41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hbam9d6l7XOUl6ysMZwFRiRuBIQrhp5a3KR48jAH9K3EmiJxMoJbgYw6NPErsVz/HNBRztQXh7LYY4WlcfTB3BBJxL+JRIh+eIw1zdOI+ZgHECtDIGqNHnwMlRr+xYkTYag67zaUcxDPeftyJfp22B1rai1AwEYnZU2w0EK7GtBgxKMoXhimyMegTRQFoqa4zG+oLMvsgcltasoLf0XoLu1r51JKt/PFX3bngBNbDQ7q9CXGHrMahh8MRMoxy1VRQBI4Qwmdn3j7Qc0rYzGN2UhuYxblhyVTVCP7bU+ak7OQdmGLUpPckFP0pMHzS13/v018ODWAFjiXWD3MAtypeasHitKXEhoyFwv+QcViuSsTHXeqZ+2ZMe8roGBDBYygcPlBAZoMfnXVlqu737M8QfNwxn8kpSTVWF32iFAcRtvfNbRa4VLtneETTLcVbdB2VV2nJLNpR44DEBEEz9mahZbjBJhblCiIOTznH0Mmyje9TVdcJV0VeIkFFi7Vh4IIC1ZRzY/EfxIjPjP1TSifLqYxWuabxV/+IqPxTVHBNdym8TOtQSt1oqfdDJNNMbossmUoyhVXNU7aer/eGSqIohd/FtwSpBU6ZY23EMhSZ1Y+0Qv9cPlFHyaiP008w0LM
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5269.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(346002)(366004)(376002)(136003)(451199021)(110136005)(54906003)(38350700002)(6512007)(38100700002)(52116002)(6486002)(6666004)(478600001)(41300700001)(5660300002)(2616005)(8936002)(8676002)(66556008)(4326008)(66476007)(66946007)(316002)(186003)(83380400001)(6506007)(26005)(1076003)(86362001)(7416002)(2906002)(36756003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VG10WFQvT3BISzFDM1YzWjRBdEZaZE9NUENFdlZFVHFNUUFYUndMOWswK1gr?=
 =?utf-8?B?Tm56MVpWRUo5K2RqRXdUOXhsUEQrQXlVTFFuV2NLdFg0dXlRdVJRcC92TkhM?=
 =?utf-8?B?TXFUaEl5UFdPaHdCekErbnJXQXI1eEhpTjJTbzhFUGVuLzErcEp4emp1dzhR?=
 =?utf-8?B?MjRCbGFkRnA1ZnlsMUIrS0VTV3BydVd0TDQyNVlONlF2NlIzb2JNN2NzRExo?=
 =?utf-8?B?Z3pCVkp1R29HT3psWll3NEJTdXRPN0lla0tnVGQwakVMMzBBdStxalc3MzJo?=
 =?utf-8?B?TUdiamw0aFI0TVk2VWtJL2hBa1VzdmNmK2NiNkdoNHQyUWFPbVJZYm5Lemkr?=
 =?utf-8?B?aldKR2NtcUVjemFJUU5rR3VJa2RyVW5yS1hwcTdKd0trZkRNSisva1hSTnh2?=
 =?utf-8?B?bzF5NExCb2NFZW1KdGo0OC9tc3Q0c0MweDFkd2xHU0UxQ0MrVGNmUTdrd3dh?=
 =?utf-8?B?MFJvSm5mZmdWTSttalU5WHljV3R1cEIrN2tuRXRmbEtrK1BpWVJJeTIvb0hV?=
 =?utf-8?B?ektoR2JMeHlRZGdJbkRpMU9lQ3NRWTMwMGVreWU3eUNwT2RGcDlRVVFBU1c1?=
 =?utf-8?B?Q0NtOG5KY0VZQWFETmt3Ymw3NWdPSWQ2UUxiMmhQQjdaMnNVS201VE9icHVx?=
 =?utf-8?B?M2xNY2dCZFd1UllWSkMxMVBMaHUxNTIvdHVkUDZpRzJwc3dqRWtiMlRNL0JD?=
 =?utf-8?B?MUtLWElhRHhtTHp6YlF5ZzFCMWZUQTRVUFVtRkt6T1M5VWpPQXNqYkpKdGNU?=
 =?utf-8?B?aDhUZ29uckVjaFRoTVg2VGJ1TE9iaXVleDF3Uzd1UndwSXd1cy9iOUl2YSs2?=
 =?utf-8?B?ZHVMamZTT3VDN3hNNmN2ZXRZVk5BaStLYld4cThhUWxma0ZwL0p4Z0RKNi82?=
 =?utf-8?B?VVRyRGRqWnhNSGZ4OTBOTzVTK2k0RkowbytEdVV4SkRYWWVDME9VTldLVURM?=
 =?utf-8?B?TXI1RXZFay9MQlRaWFkwMFI2bjdKMmgyK213ZHBLQU9NYXRseElFZGhzYVhX?=
 =?utf-8?B?VzNrVUFvZTdWT2poNTBIQldyZi8wN2lkTGt0eUtySG9MZTM0eEhiejgzQVlF?=
 =?utf-8?B?d2FDOGNQLzlKUWFIaFh2cDVkMjlWN2ErSGF2T2VYRzNpNFcwUm5nZmF6cCsy?=
 =?utf-8?B?cXhDb1NmZUhDL2hlbnl6SVhsOTdSa2MyalhBVGNIUUpXblhYYnUxKy9LNDJL?=
 =?utf-8?B?YkNWb2hxZ2RCWkpsQ3I3ZUo4a2IwSVdKQVorT1NyUjNuclJhTnY4cEVkbllQ?=
 =?utf-8?B?MTBoUG9KdnJLWXR1RXA3b3ZUbUJha010UHZUK0N4and1MjBmZGVIb3RxaUZy?=
 =?utf-8?B?ZEFISTRMM1Bpc1hocjdyOC9yRStzQzNiaDRaYjdROW5jN3I3T2xrekIwY2t0?=
 =?utf-8?B?K0l6VWd3N1pXSUovVEVtVS9xOXBXMkVCWnFKZ05CdjhkOFFzMkQybkhOV0RT?=
 =?utf-8?B?ODFwZ2J5SndPTSttWWY5Nnl1Q0h4MzR6UDd4NG9kaUk4K2hZSU1samI2U3E0?=
 =?utf-8?B?clU1bkRlTmFRQXh1Kys1SjJTKzh0MzNIUVFZT0VtWHVDMjh4NnpsSWhPT2ZK?=
 =?utf-8?B?Z0ZwK1B2L1pFaW9xOHJ4TWVGaDh3bGJFQVJUWkUySTFPVmhjbmFObVpFTDRU?=
 =?utf-8?B?a0dvTkxPMnRtSTNqWEdkVE1XeVFHc1dmWWdyVFF2N2NvQ0hUek93SUFwQUl6?=
 =?utf-8?B?dHExTnh3RW11ZW1xYms3SitnTHhVRSswUjZ2ZmZuZlU5SThwZnRENWlGelR1?=
 =?utf-8?B?dnBzSkMzWmhQMWljelRBblhidysvdzRUWUFFS2dQYW9CK21uN0lDVjF6Y1Bz?=
 =?utf-8?B?cjJ1MDF4eVpWVXJqc1pKZU5NUndZVlI5ZjdSWnBxVWVPZXBrVyt2RzlCRFNa?=
 =?utf-8?B?SW84eStDejRJWlQ1dzArdTdWc0QvN0h5VFlMd0VPTDE4cHoxbm9LdC9PZkxX?=
 =?utf-8?B?T0djazJiNnptMFFuU3lCM0JucXJxeGJYMTNmVjlSSjBqMUxORGhYdHI3bEd1?=
 =?utf-8?B?cTViZFZzMkI4OERJQTY1SnpkaTBkMHpjaHRzVzl2TWNXdTJoa2ZuaDFRdWtH?=
 =?utf-8?B?QUkwNkV0V0NueXZQR0g4ZW5IR3dCVlMwR2VBRVpaekpqLzJNUHJEZkVJdDRE?=
 =?utf-8?Q?rmcXoAVyf0NThhGdVWfMQ+9GE?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37aa22ff-92ae-443f-fe98-08db8d8d0f41
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2023 04:01:59.0234
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gFemOGYolw1aPGhILnq6p4rZNgOP0Z6aEg4Nq0ti/T4ZjmBobImDKiWslG1s24MVNHROCJriwy04TNRn7mp+ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB5463
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230725_210232_486001_48AEDBDD 
X-CRM114-Status: GOOD (  15.49  )
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
