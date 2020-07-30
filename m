Return-Path: <SRS0=1HBj=BJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,
	CHARSET_FARAWAY_HEADER,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BA38C433E0
	for <linux-amlogic@archiver.kernel.org>; Thu, 30 Jul 2020 02:23:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9A5420FC3
	for <linux-amlogic@archiver.kernel.org>; Thu, 30 Jul 2020 02:23:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TNsPeJBJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="B6MtliSb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D9A5420FC3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=outlook.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5nqrXG7FPGUUm4CKZLhZLNSH76vRfsk+xS5ezH5cLac=; b=TNsPeJBJKugLD5L08uUvTbe5cL
	sj5sT5veadm0UJP7npnayY7eFBWzqhnB1BanFYSSguPubCRRtGnaS72DDu956OdgZwnYBjXd5mPjZ
	vBsf/7cU+/UeOowY2StDZNv8ttwb8tewOFVHA7ZyRlKqVnbAbk2IpG+hoZ3oNLdVumI0sUkTxA/75
	AeW/efZxXNyHKBagtztFVymBEteUETB7x0UFmL/8DtoVuxVxxW4fG80v/4fUMmHaKIbZP6j9DIpG1
	XQAAGmHDeXx3EoysNzKPeW5MYknwwtegK87FWiPKLlU/CpZcDdML/n2oeDxK2MV/h9vx0giTy6EnE
	Cy3D59uw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0yDv-0001cD-Er; Thu, 30 Jul 2020 02:23:11 +0000
Received: from mail-oln040092005030.outbound.protection.outlook.com
 ([40.92.5.30] helo=NAM02-SN1-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0yDt-0001bS-4T
 for linux-amlogic@lists.infradead.org; Thu, 30 Jul 2020 02:23:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=assymYHQ+SLKJyEnixbLdpkwXGGdY4v/zzfSlPmnmu7KqHAVhab67OGU7EK7Ry1NzmGS4ydDdfH+MvF9qgGg/d9N3Tf8FBlxCuqQ/gorbILMIPgUTP9JmxwYGaZC50iXQkgt/nWiV48v+WGp49GjYsqf+b2qhrzUGqqyj6DWIt4Up65k/3UWnlIbVg+6R7rgGpcG1jyBocc6ekTIN8UDbrtN7O9RZR+GIKqj2h9ZvNbY/UI/atqr5jN/cDPYNvfiWcvDFiZwkO096Q8gLs9kayW/8ybFwM2vTryry6NTNyDC16i5LU7O01b/ScPvQ8188Q9rENW4Bl5V7pFnwqtyiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9hd71o2kBnmucdS8IuFjYO30qsRK/0JIX/GUtK2s6Q8=;
 b=UjXwJBgEcLdKRqOOouACysGME6WIhpNLjwkzl6zuDKKkpkA51BblhdD1lK1EEaUz/dh/IEq59TzFQb9yZYpWjn4Zyi5WMmqLaD1QU3G/NEOt2MWdFDoM8To7Aiv6dIAC2YP6l1GQGBxxRlNsjNkUJIOa4sTYmGcQrHT+CsjJACXNqw7dsbKFz+BV9MId3RKb0yHqdFwTglVT8BSicehdUHX256krdUF2L+LXhd5w9eAWyHdziuCEfLP5ef5j1duaXRZuDe3H9JjaLPOUycRVZ3kIAwf2l4v8qI48Ug0uRYhXqScjNyvpADan/PN/9/6PA2eNYnI8fdgiMLg1SNGOcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9hd71o2kBnmucdS8IuFjYO30qsRK/0JIX/GUtK2s6Q8=;
 b=B6MtliSb9UfmJlobXEtiTlBDmKbEBUcg05puKJ+gKzZXJIAnQLZwBgK4hqqrOTZldMea/3rOQhQtEQBmw8mc//NFxMM3D8eOtbDlA3FInIUgeHSfiqmxgt6N/+MoOM35Ts7Mi0Y62mJE4HsOY1g70xnh75JSH/EubzWnUOaPS4dP2sKRIpmCCHpmFBLQLK3y1bm2KdRPS/jEHU3fGcrWGS5rAaGaoAyeZjIK4oKUU0YCQrMkMd4tSvcl+IEYmHOhfTbwELNv4leVsr/sSNJ/QhPZAFW3RDCBWVN1iTUMSTawfhM/Zj+m2H9Cwu32ccHfuOu5bF7LTe+5e+M/2yNWBQ==
Received: from SN1NAM02FT013.eop-nam02.prod.protection.outlook.com
 (10.152.72.54) by SN1NAM02HT046.eop-nam02.prod.protection.outlook.com
 (10.152.73.119) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.31; Thu, 30 Jul
 2020 02:23:06 +0000
Received: from MWHPR1601MB1343.namprd16.prod.outlook.com
 (2a01:111:e400:7e44::44) by SN1NAM02FT013.mail.protection.outlook.com
 (2a01:111:e400:7e44::98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.17 via Frontend
 Transport; Thu, 30 Jul 2020 02:23:06 +0000
Received: from MWHPR1601MB1343.namprd16.prod.outlook.com
 ([fe80::41c:7919:14d7:223e]) by MWHPR1601MB1343.namprd16.prod.outlook.com
 ([fe80::41c:7919:14d7:223e%10]) with mapi id 15.20.3216.034; Thu, 30 Jul 2020
 02:23:06 +0000
From: =?gb2312?B?1cUgxP4=?= <zhangn1985@outlook.com>
To: Nick <nick@khadas.com>, "linux-amlogic@lists.infradead.org"
 <linux-amlogic@lists.infradead.org>
Subject: VIM1: not able to poweroff with "xhci-hcd xhci-hcd.0.auto: Host halt
 failed, -110"
Thread-Topic: VIM1: not able to poweroff with "xhci-hcd xhci-hcd.0.auto: Host
 halt failed, -110"
Thread-Index: AQHWZhaxSxW3488jy0Wchm0dttpfkw==
Date: Thu, 30 Jul 2020 02:23:06 +0000
Message-ID: <MWHPR1601MB134345D310D9D1311EE01F41CD710@MWHPR1601MB1343.namprd16.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:3E2D1ECFF130E75A3C552EABD21F03178393BF2B2FB0FB015B5B4092FFE993EF;
 UpperCasedChecksum:CC0C6C3CC3BD1BA839F7C02971855C8045E114540B539E898ED378D1DE9A8A5D;
 SizeAsReceived:6807; Count:41
x-tmn: [SZB+aKQMp4qyKXVbAFJUZ3FT2kYblbec]
x-ms-publictraffictype: Email
x-incomingheadercount: 41
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: ac2f91b9-f8c9-4254-bf75-08d8342f7eaf
x-ms-traffictypediagnostic: SN1NAM02HT046:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HeC3Hu9a6erIKgSnvdaBjiGtV3YBu5u+yE6uohl6yJNEMqHFEqNSSB9DzPKlAH7sfsiaxSx0Ih4Vs6/pC7J8lZs1BJfY1WHtHQQyyXn1JxKpULFTEa7mGMZxj2SboBptTSopJ0MbxlofP1pLtCCx6unNXQXAi4NUEprzg5Uy/QgpjULSGnP5QW8JrItxrlvOTtfXUTzLYeSjKHlB1tVmIA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:0; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1601MB1343.namprd16.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:; SFS:; DIR:OUT; SFP:1901; 
x-ms-exchange-antispam-messagedata: Ox3hyFrm6W0QLMw2ZHC+x6ALx8ZtcFTBsigLPLJ3BXRUCHHytKWic0UlNY6E8xUBuFfUMqlBEo0pgwK9ZlLrcBJA6QzLOeAIjMVjHTsWqMFI89Wq44czB3WvVSrKP/jEb/wyrgTlE7zCMelc5a1wQg==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT013.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: ac2f91b9-f8c9-4254-bf75-08d8342f7eaf
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2020 02:23:06.4680 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1NAM02HT046
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200729_222309_286228_E216B3C6 
X-CRM114-Status: UNSURE (   6.58  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

hi, all

I find in certain case VIM1 can't poweroff or reboot, with below log in console.

```
[   68.965258] systemd-shutdown[1]: Syncing filesystems and block devices.
[   68.967336] systemd-shutdown[1]: Powering off.
[   68.970769] kvm: exiting hardware virtualization
[   68.994071] xhci-hcd xhci-hcd.0.auto: Host halt failed, -110
[   69.020136] xhci-hcd xhci-hcd.0.auto: remove, state 4
[   69.020285] usb usb2: USB disconnect, device number 1
[   69.025355] xhci-hcd xhci-hcd.0.auto: USB bus 2 deregistered
[   69.030315] xhci-hcd xhci-hcd.0.auto: remove, state 1
[   69.035275] usb usb1: USB disconnect, device number 1
[   69.040306] usb 1-1: USB disconnect, device number 2
[   69.045206] usb 1-1.3: USB disconnect, device number 3
```

Linux kernel: 5.7.10

reproduce steps:
1, connect USB/Bluetooth combo keyboard via USB cable, keyboard in USB mode.
2, switch keyboard to bluetooth mode, do not remove USB cable.
3, poweroff.

The keyboard I use: DAREU EK820. no link provided.

BR.
Ning.
_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
