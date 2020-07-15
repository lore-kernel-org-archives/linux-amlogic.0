Return-Path: <SRS0=rXaj=A2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,
	CHARSET_FARAWAY_HEADER,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80035C433E0
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 Jul 2020 22:04:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0129C20657
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 Jul 2020 22:04:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PcQfcXIe";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="QaONSO2+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0129C20657
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=outlook.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IuEbZR0t/JJNh3OjJfJimxQQIP64+BLizcSjJR0vh08=; b=PcQfcXIe/u/lxbo5L1Dbbl1Jce
	2stLsf8i9qyaPJGhfDEWG0ZZXyg7dlim4WsIoQ8paOVxZe6YLXqF/kcyrthKg/QQUeiUO3OvVXAPi
	TVD9yWB0FJzjHJfd2Tx2a+ZGB6nPpyFDjcx5ShEQvBpiSguyW2aqTbZchRiX81g2MGx6Q6PzNn9J7
	Uaf6/sNDz1BOXTGPQhcHcDyh+XWXySWk0lDRBdCWvF9TnPqdC/6wdP9/xkJteLOMSINMbxzVnTSxj
	ezFk9i0NViBKHbb3NbIwtvhSNkHE4fMNxDxWxYXjiBIPzDZTSWqZ34dqBKHk6OKL6F4+5pbK64V9c
	FKYbbF6g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvpVn-0001Kh-6n; Wed, 15 Jul 2020 22:04:23 +0000
Received: from mail-dm6nam10olkn2109.outbound.protection.outlook.com
 ([40.92.41.109] helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvpVj-0001JA-R9
 for linux-amlogic@lists.infradead.org; Wed, 15 Jul 2020 22:04:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZQ1jWK9Xtj+Wt/RGtQ2ym0Xu2WBDVfua0iYYROKdrx69yKC5fCfKPBsEEJ1PRAU5iQLqDmQPJimf+++meDfbPtrlSo2yPv9fHOA2r+uxcaNY5ZH07FzRVPqm46LT0gIga7HWAsieX8l7IB7+AKIdmPg6NLwqKA7lAEWUkm8ysmFBAD/PsJ687icNaiZgw/d4E9vSjqZZ1D6PGcO7RuQuyTONAZA88wUfxYp9vDtMcp1nT5RlPzMMFpeAdVg4w+Lu+WZg9OnAo/sT0vhdufJgWqoMD940JaHjlGFEMuE5i4Cf09t2OsadNKI1v6OyooSpUmkYhkbXxnjoeSoa7J1cMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PyUJstjLKhDjQWgG1o6ZfIDpm5PzOC9Tp+yGVginwCc=;
 b=MelSSmHhj58wZ+FQ+XUepUuAVz2S3lIeR40ncJgqHnigaKgFGtaw9bAH7TJtg0ta2jSDR7DiUXzac2YWFGm5cTK+dAyYDYahYJQ/ewXBvkCLHkuPgwr3S6eAfIrU6slb67POFVirWo2zJCRmQHmWtCc0QBd18MvLIfzu97+FGYsjo0CVomkfDdFFa62uQl7e5OxdxEOrzAG3ETJBgwJqeTYqPl5JG7YLdv3Hj9x/SSvMQbbpSzwYZrrsmaIc5kepOOW4W4dKRFMrPeA8QFx1yH3V+szFtsZ3iQcftGrwtZv4UEgOS1ozGeItUqqImsIPiCYZZGT69quU/sjlN434dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PyUJstjLKhDjQWgG1o6ZfIDpm5PzOC9Tp+yGVginwCc=;
 b=QaONSO2+iid+HYocN3Ivef9hFsDEKHWp2g39Zh6MX6/vvdqZvmawKdfNLX6KZNG+Ot+aBHid1kGC56BQ/EEF6pTmZRiqsad9jVxKpHet01EfIYaLE+ZuJc/BbMi+M8Qkkj+y+KU40pMzMx49qE71rQ8wsjtuDgQrb9WzZkvbTTHZuStfIoTstiPGgXzjFWIB5flfzDMo47/SJJW8UYNTCYf6Z+Crm7Punx4dvi1mbyGwd+K3PwPOj2LY8YxIFjztPNODBUVEAHxbRP3W0BqvIax8F98qtU8egtbZ1VEomWhoeLphDr3xCVqr+9x7q+N1PmuEHV1gbfOvP0wu0eMQIQ==
Received: from BN7NAM10FT040.eop-nam10.prod.protection.outlook.com
 (2a01:111:e400:7e8f::4b) by
 BN7NAM10HT149.eop-nam10.prod.protection.outlook.com (2a01:111:e400:7e8f::404)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.22; Wed, 15 Jul
 2020 22:04:15 +0000
Received: from MWHPR1601MB1343.namprd16.prod.outlook.com
 (2a01:111:e400:7e8f::4e) by BN7NAM10FT040.mail.protection.outlook.com
 (2a01:111:e400:7e8f::238) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.22 via Frontend
 Transport; Wed, 15 Jul 2020 22:04:15 +0000
Received: from MWHPR1601MB1343.namprd16.prod.outlook.com
 ([fe80::41c:7919:14d7:223e]) by MWHPR1601MB1343.namprd16.prod.outlook.com
 ([fe80::41c:7919:14d7:223e%10]) with mapi id 15.20.3174.026; Wed, 15 Jul 2020
 22:04:15 +0000
From: =?gb2312?B?1cUgxP4=?= <zhangn1985@outlook.com>
To: "pierre-louis.bossart@linux.intel.com"
 <pierre-louis.bossart@linux.intel.com>
Subject: S905x: No sound with error log.
Thread-Topic: S905x: No sound with error log.
Thread-Index: AQHWWvOtBibOHwz8MEuVyuIa9iGXNw==
Date: Wed, 15 Jul 2020 22:04:14 +0000
Message-ID: <MWHPR1601MB13434435DE38471CEB6675CECD7E0@MWHPR1601MB1343.namprd16.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:97397DBACB0FDCBCD5651CC45BB85398CC2473DAF2AE2AA694900086B2A9B0A6;
 UpperCasedChecksum:3AB3E093D99CAB2F3B6C49EBBEC7FD98251D735BD0D23AEEEFF3B592FAC0BF28;
 SizeAsReceived:6744; Count:42
x-tmn: [Dfhf/Arst6xiVaMlCEvEondjpuuq4P8U]
x-ms-publictraffictype: Email
x-incomingheadercount: 42
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: 7f5e6593-7b7c-457c-2706-08d8290b035d
x-ms-traffictypediagnostic: BN7NAM10HT149:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9HgFj5FlyTINuZ39C7YU9KH0GvS7RSEbKexp+wFpde0wozHgAfekIKxQDDzZ24mab/swO03DXtDcu6ykjaBcL/5YBeRGeOIUVDZGzB1KLLTqixEVa2GTXASPQYEIY/3h+khVQ+0kBKL/TiAHuuNtgWfRC6cOFIEe5Ppug6fsd7dtmTWbMyvLIWfCL2DYEUFaulftFHQoeD5QjCSZ6wk5bDGkdp75Iurs//9wq+DOOBkzYzziptieuCwfZfoMmP7x
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:0; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1601MB1343.namprd16.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:; SFS:; DIR:OUT; SFP:1901; 
x-ms-exchange-antispam-messagedata: kx7z7Rpf4wMnRmmowePpTsZQe5Y0GMwilmXXyZEe+H1us9Y8XX8JbwSkRziijJxBV3dSFrY952GarfET/09ec7fE2bw0tRADD8LO2kuvmzKqnv3ZA4fs1eeXfXrFue/Iy5qMQ8Fi/bUfxcQEiS98sg==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-AuthSource: BN7NAM10FT040.eop-nam10.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f5e6593-7b7c-457c-2706-08d8290b035d
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2020 22:04:14.9431 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7NAM10HT149
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200715_180420_192689_7DD80D8E 
X-CRM114-Status: UNSURE (   5.27  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGksCgpSZWNlbnQgYXNvYyBjaGFuZ2UgbWFrZXMgUzkwNXggYXVkaW8gY2FyZCBwcm9iIGZhaWxl
ZC4KClsgICAgNi4zMzg0MjhdIGd4LXNvdW5kLWNhcmQgc291bmQ6IENQVSBEQUkgSTJTIEVuY29k
ZXIgZm9yIHJ0ZCBiZS5kYWktbGluay0xIGRvZXMgbm90IHN1cHBvcnQgY2FwdHVyZQpbICAgIDYu
MzQyMTc2XSBneC1zb3VuZC1jYXJkIHNvdW5kOiBBU29DOiBjYW4ndCBjcmVhdGUgcGNtIGJlLmRh
aS1saW5rLTEgOi0yMgoKR29vZDogNS43LjMKQmFkOiA1LjcuNgoKQWZ0ZXIgcmVhZCBwYXRjaGVz
LCBJIGZpbmQgc3VzcGVjdDoKCmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9r
ZXJuZWwvZ2l0L3N0YWJsZS9saW51eC5naXQvY29tbWl0L3NvdW5kL3NvYz9oPXY1LjcuOCZpZD0x
YmI3MDdmYmZkNWMyNDYwMjhkNzZiOGYxMWExOWRmZDExOGQ2MzA2IAoKdGhpcyBwYXRjaCBkb2Vz
bqGvdCBhbGxvdyBwbGF5YmFjayBvbmx5IG9yIGNhcHR1cmUgb25seSBkYWktbGluay4gV2h5PwoK
QlIuCk5pbmcuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFt
bG9naWMK
