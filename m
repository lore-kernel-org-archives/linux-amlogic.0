Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D256C001DE
	for <linux-amlogic@archiver.kernel.org>; Wed, 26 Jul 2023 04:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zWTzelKEV/zE4/4a8qJZSiB5X/PjoQEirOzBBLPLbWI=; b=dp7d8Ti3JPtO7S
	4ijvumrHWF73b4DOvdBcyRA7hPiw+CKnqjTMwsgKZGLmQlvaGsCJEJPuzgUMVkxM17pVkcPxR7eM7
	11QB/HXZCgzuQyyH6M1sZ4vj4XOpf7LBhw0+TEBraS0lYoE3xZqCNf/3TqtXDPhopGzneUx1YIb64
	zZ/lVFIMv4gR3MxR1ZUhMfD6c7Tog8Ep4TQGQ7xFlK7yOE2K+qP1/J+NHUs8ehJFNDTS9Xoa+t6zd
	DlCgy+v0f9r3EZmY8m1dl0L/iePL0JwrEmIWMtk3dNt/MLgkD2xtKtnElhtxNbESTi83pITlCRfoc
	Q2DzSOuAo+QDLqVX2sTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOViV-00940y-2t;
	Wed, 26 Jul 2023 04:01:39 +0000
Received: from mail-tyzapc01on2070d.outbound.protection.outlook.com ([2a01:111:f403:704b::70d] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOViQ-0093xB-1o;
	Wed, 26 Jul 2023 04:01:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TbXHsr2SfrsSqt8WFFzVsKTLmWka5EbQGRRdyTUbYdKLAmMJygsII/haJobW2eqAzW0X/pVApqgS/TAK2BLBcvabdDAz7uhecmkFUtiIDQj1mF31lhc9DXKNVEjDtvRWqxCDdDMBrZQszmjw011dfcLH+LvlXAn3k4hc2NRiyXMAu83fWTNzqQGtOR7oK20KB/tvRMEDgC4w64MwNFzePDEF1q2rP/bhuUFvOzGUXiRvdj77g9mH4hsPt5BU8fRXm/Lcz5TM7fdZatBaePJO+wZu/3sZs3F/auzuhVeK1+wDGZPuz89L8E2zJo4tNhNjNq4r3VE7FaCM42C5UjnShA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bTCEmJzZRC/a6SHh4C2nbpGEXcRFJ6SVNGbm/AwkaN0=;
 b=MjTZu5C1PBdfXLvYrzWVmO3hnIjkGj3YPmW4f7q/kU1ZE0VNDajI78TSXoRwcYHeQLjqyoZccJrsX4DkHgtH83mBbDbyqYkmm6+5OQr3QkRgjH8F4O4YYrqXjap1KemVlIp1tdD86rqoQnnvKISc8JkBpjFPNoKmcD8PwMKurUrQKUYwmslS8EQg8oFlcpOUo8JSYYp7I5rnFd56j98o7v8hfr74gaBWOpeg4mz6qK4+cNefifVzrPdd//f3JC4O1+VxFpMJUi/0QD7ElHxk+SX/qvt6QYaAqRnZzQzck9Aqp28BZlCSJCbVuyP3Pt1K3xYRafALwn4328oytaS/7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bTCEmJzZRC/a6SHh4C2nbpGEXcRFJ6SVNGbm/AwkaN0=;
 b=fFKKS/Gh5hmWJVZfF9P+zbvtcMDVZJvAxjqBdHxyoUGsIL2ib0PXmILaZiDYGwLPhgjvz1HxEOqa63vr8Kh6895HT9dxB676mllcCWKcSwh9uuSCZV02k2z5YaKeCIfKk3NPqvwE5aHSa6NVSqo1s3/rJOe1CZyxAXFITWI1MRt+bsuqNy+nXCLEhFosfDY7ZLuWixLZ6UoMqDeNCjOlB70yUkYhuXcjLK8RFmCuxzACmy4Mz/MPZF9WKRLxx1f+DfjNFigFB3tvUm1dhfArUDsZOd1IzULSLlJ96543kbZg29ocwVVKB+tiWwV3cZjRNedrWwWww6+JPDXpGh3WbQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by TYZPR06MB3934.apcprd06.prod.outlook.com (2603:1096:400:7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Wed, 26 Jul
 2023 04:01:31 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::732f:ea1d:45a1:1e0b]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::732f:ea1d:45a1:1e0b%3]) with mapi id 15.20.6631.026; Wed, 26 Jul 2023
 04:01:31 +0000
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
Subject: [PATCH v2 19/61] mmc: meson-gx: Convert to platform remove callback returning void
Date: Wed, 26 Jul 2023 11:59:59 +0800
Message-Id: <20230726040041.26267-19-frank.li@vivo.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230726040041.26267-1-frank.li@vivo.com>
References: <20230726040041.26267-1-frank.li@vivo.com>
X-ClientProxiedBy: SG2PR02CA0093.apcprd02.prod.outlook.com
 (2603:1096:4:90::33) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|TYZPR06MB3934:EE_
X-MS-Office365-Filtering-Correlation-Id: 113f54cf-6a28-4450-3a96-08db8d8cfe9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4i+GW4ZCuJ2TzDRzX/d6lVv9THQuNO3JKJaFjG9KKdh9iVRdWC8ryrT0P4Wkw1KyRjaQatkpZu7yM68LPtwyMqqeaftczL4EorImd+H3VxVbrYhWb11qBzZkHOfe1l44udzik1jJ/TIWT7BisLDZ0oERWWuXDcA+1uDcEdntYVL94CB+ySSyGLymfGe+yXwWzdl1FqE68nny7yy2m97XkoTsrQW8zARTOG4x+CEAhesrq7Qs932fRRQPI3zcAC7oj/E1IKkh/7N5gZAmbXbLtM3c8MsIUyEB80F03F9eypJCnJN+AEB8TI1cotVmocE8l3dgynX9EvNw7NxPp6MciUU2ErBHXoQKFbgm1Prs/lYAdkPwAh6kO7dFvY4EPKJSLSJSSGVRXa56hRRsP4NpXVglTqULCeRCumFo6OC7Ru0wO2eTIYv7p6wx97h6/WTQMlmaUmeXRfwRT0X5DpYo7AG995i0D7Py0OaTlrwvKTOkZCmWi/nd9xcF0mzwbjRqT6BIaZfHOjQZBLw/z7DKzP99ceV/qPOQjI/i4nAcmxuPCGo/jyAngXekGap7V8+JqqdKN9Hgyn/vj+lWU0YVHub1Nz4t5CS6oNuLdamHU8wbwnTBiWIoKZpDGo5NdGCq
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5269.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(346002)(39860400002)(366004)(136003)(451199021)(66946007)(66556008)(83380400001)(2616005)(41300700001)(38100700002)(38350700002)(86362001)(36756003)(8936002)(8676002)(5660300002)(478600001)(110136005)(6486002)(52116002)(54906003)(66476007)(316002)(4326008)(6666004)(2906002)(7416002)(6512007)(1076003)(186003)(26005)(6506007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z3A5cm1ZZ2FlSktSb3JxMS9qQ2dwU0xhRXI0QUF1bmZrR3VMNWhpSE5rZ1Rj?=
 =?utf-8?B?aUhjWEdOTXBPZERDR0FOVHJwYVErdngyVWt5Ujlpc3N1MVR0dEJSVUVaY1oy?=
 =?utf-8?B?NlkzbHE1dXhET0E5Q0daUmE1eXdJY3ErMExxYVFHMmllL2RRL2dOZUxrdUN1?=
 =?utf-8?B?R3FhdWV1MjZUQXJDM21OQ1BuTkFoaUxjR2U0NXVFMkFETFFTcVY5ZVdyS3lz?=
 =?utf-8?B?TWt1bFZXUGpVc3ljUmhJcjAvVzFrNDllTVlDWDNrNTNybXBYUVJrTEgwRFNp?=
 =?utf-8?B?ZHIvTnF6dmpwOGJyajhIWkZIWHBzc2pndjlTTWhkZGJmUGNScklQUHZ5ZjNS?=
 =?utf-8?B?Y0UyYjh6dG9iNGZvLzV0Y2dZMWVRaTJ1SFMwMXBwb05HRU9NRUl5bDNaWFds?=
 =?utf-8?B?aVowVTdDdU5qNWw2SG8vOU1TdWVBeXM0K2htRUhSNEEyQjFtSDlHSml2UWZD?=
 =?utf-8?B?dmwxVHhqdnpkS3ZPcG5WQlRsL3puNXJRbWhhdGlsamk3eGUwRzFRbUtOUi9m?=
 =?utf-8?B?clZWZmhuUTdveEYwa3pQYjkvS2N4enhpVVBNUkZEYmlpMjV1RU9ob0cyQmdY?=
 =?utf-8?B?SzJkanFwWWRyRnVlRzBJWnF4cUx2dXQ0NkRpL0wvVUc4K3BmOFFyT3BqWk1k?=
 =?utf-8?B?bmJZd1hsN0JGTElsRjV0a0pKQlkyb3JDaTJQdjVBY2ZYc0VVci8zTm9Na3BQ?=
 =?utf-8?B?emlaSWl1S1dvTHhiZzAwUHd3RmJCeFg5UkYyWElxdFdIWWVnVDY4MjlraFl5?=
 =?utf-8?B?WDc5Y2ZIWkNPVFZCazBTby81bGMvOUJUL3JlNjVwbkI1V2pwWGRPdDNTemJG?=
 =?utf-8?B?Y1FEUnV3MnN6VmdwN0IzOEE0K0FEellVNTU3QXNFQmt1bUdkS3ZoM0ovOWw1?=
 =?utf-8?B?dktjQUd1ZE5KSVpITDJUS0hSTFlsa094Mjk0aTVuUXplSm1CQlBvY2Njc0ZQ?=
 =?utf-8?B?L2Era0hzTCthUHhQcjZBcGFoUlZjSStnT0s3b2t6ekxxUGhlN2NLd0MwUkFH?=
 =?utf-8?B?TFMxZ1NSZUZ4WmI4OUkvQy93NjZiS2lOcG1LbS92b1Z4bUk2SFF0aXNWakRr?=
 =?utf-8?B?VEhJbG5FWFpVaXZ6SXRMMmsybFpqd0xRZ2I5TFhMUU9SL1hmbW9BVGVGTG5r?=
 =?utf-8?B?QWlYbXc4dnFPc3NFNEhiRVNzYjNqU2ZVZjNGVDBVVnE1K2FpbHZ2K0wxbjZt?=
 =?utf-8?B?a0EzS1BXV1dKc2dabFJnWUZvVTdCWmwvMXJ3MDAya0xzSDNkZnB6dTEraWZ4?=
 =?utf-8?B?WERFZGJYQWM2dW5WSitQUDhUSjVURmp3cmlBOGxZZk9PQy92YklRZ0ZwVjdH?=
 =?utf-8?B?U0E3RUJkV3hIUmp6VEx5TmpXTHlsazJZV0VzV01zZ2Q2SE1aY0wzdHdtZUN0?=
 =?utf-8?B?M1YyMHgzL0RwS1RNcWVQRDFJVXYvVTVOYS9hQUhVSXNRZnZNTzE2amNsTlpr?=
 =?utf-8?B?RVNzVk1TSURCR01rSENTYlQ3T3Jsa3JaazdUT0hLUVhpWVhaOGhxdEtnelFp?=
 =?utf-8?B?eG5GV2ZjdmVZajZ3MGREc3F2YWh2Y0lwczFMUkk5dzFReTZ3cjZ5OHdmYjNp?=
 =?utf-8?B?d0J4UzF2UmZFODA5bzNJZ2xhQ3puTTZGVzdWOENIa0I4eEtkdTRpZzFiZU5p?=
 =?utf-8?B?WUVzQXlWMWYwTk5yRHA5TERVNEZaSThGY1Z5ZEc2bkZKdUl6UVMzaE9MZEdH?=
 =?utf-8?B?THhEWUhrck5PWmxVT3ZFanNqNmxRYldVenJzYWZiQnIzK1lxMWExdzRLQjVx?=
 =?utf-8?B?UU1idlgxVnBlbUVBUFRZTmFKNGRIblpPbXd4MU1nWkQxM0ZzUEMxcS8zVnlw?=
 =?utf-8?B?SVdCU0Jjek9lU2lTTjFoZmZzY08zOXlwemNSNU9taXRzMkFuYlpMMlIvMnNt?=
 =?utf-8?B?RU1YYXFHcnJpVTV1Z2lBNU5HRXZRV3FEdUUvRHlKeE5UQ2hKMGNXaVcrVE5l?=
 =?utf-8?B?Z3BWN25UM1BlU0xnWG5qNlZIYmk1aG8rT2tKaGFqS3BXc09CZHovV3c2RTBJ?=
 =?utf-8?B?R3RYOFlraW5LNVNhYjZqTVlHeThEOUJoM093Ylg1T2EwSmFXQVo1M3FGMHI4?=
 =?utf-8?B?QkdlbU8zVWIvKzdCVCtFa29lN3ZGY2FMYURUM3RpRU90Mm5Lc3hSZTVOOEIx?=
 =?utf-8?Q?siItjHkjMM5BHb/3taQ/J6qBZ?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 113f54cf-6a28-4450-3a96-08db8d8cfe9e
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2023 04:01:31.1017
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xuyG4YWJ2HTz7FBNxSzQWRqJxmPCStqp2IqjNbn0kK+npngC7Q3nxtfvLEnZMp7EjUUKH+0xDwE+6VuI2FbvHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB3934
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230725_210134_603326_3879D7B2 
X-CRM114-Status: GOOD (  15.09  )
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
dGFvIExpIDxmcmFuay5saUB2aXZvLmNvbT4KLS0tCiBkcml2ZXJzL21tYy9ob3N0L21lc29uLWd4
LW1tYy5jIHwgNiArKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDQgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tbWMvaG9zdC9tZXNvbi1neC1tbWMuYyBi
L2RyaXZlcnMvbW1jL2hvc3QvbWVzb24tZ3gtbW1jLmMKaW5kZXggZDY1MjM3NGYzN2IyLi5hMjYw
MWQwZWNlNzEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbW1jL2hvc3QvbWVzb24tZ3gtbW1jLmMKKysr
IGIvZHJpdmVycy9tbWMvaG9zdC9tZXNvbi1neC1tbWMuYwpAQCAtMTI5NCw3ICsxMjk0LDcgQEAg
c3RhdGljIGludCBtZXNvbl9tbWNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikK
IAlyZXR1cm4gcmV0OwogfQogCi1zdGF0aWMgaW50IG1lc29uX21tY19yZW1vdmUoc3RydWN0IHBs
YXRmb3JtX2RldmljZSAqcGRldikKK3N0YXRpYyB2b2lkIG1lc29uX21tY19yZW1vdmUoc3RydWN0
IHBsYXRmb3JtX2RldmljZSAqcGRldikKIHsKIAlzdHJ1Y3QgbWVzb25faG9zdCAqaG9zdCA9IGRl
dl9nZXRfZHJ2ZGF0YSgmcGRldi0+ZGV2KTsKIApAQCAtMTMwNSw4ICsxMzA1LDYgQEAgc3RhdGlj
IGludCBtZXNvbl9tbWNfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJZnJl
ZV9pcnEoaG9zdC0+aXJxLCBob3N0KTsKIAogCWNsa19kaXNhYmxlX3VucHJlcGFyZShob3N0LT5t
bWNfY2xrKTsKLQotCXJldHVybiAwOwogfQogCiBzdGF0aWMgY29uc3Qgc3RydWN0IG1lc29uX21t
Y19kYXRhIG1lc29uX2d4X2RhdGEgPSB7CkBAIC0xMzM3LDcgKzEzMzUsNyBAQCBNT0RVTEVfREVW
SUNFX1RBQkxFKG9mLCBtZXNvbl9tbWNfb2ZfbWF0Y2gpOwogCiBzdGF0aWMgc3RydWN0IHBsYXRm
b3JtX2RyaXZlciBtZXNvbl9tbWNfZHJpdmVyID0gewogCS5wcm9iZQkJPSBtZXNvbl9tbWNfcHJv
YmUsCi0JLnJlbW92ZQkJPSBtZXNvbl9tbWNfcmVtb3ZlLAorCS5yZW1vdmVfbmV3CT0gbWVzb25f
bW1jX3JlbW92ZSwKIAkuZHJpdmVyCQk9IHsKIAkJLm5hbWUgPSBEUklWRVJfTkFNRSwKIAkJLnBy
b2JlX3R5cGUgPSBQUk9CRV9QUkVGRVJfQVNZTkNIUk9OT1VTLAotLSAKMi4zOS4wCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBt
YWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
