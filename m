Return-Path: <SRS0=njkK=OQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,T_DKIMWL_WL_HIGH
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 883DEC07E85
	for <linux-amlogic@archiver.kernel.org>; Fri,  7 Dec 2018 10:48:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 58B7720892
	for <linux-amlogic@archiver.kernel.org>; Fri,  7 Dec 2018 10:48:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XCLHwTec"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 58B7720892
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m6K8WBIGIGQhKoUNAkKcSp4aV0jiArpZ6CaliBVKmFo=; b=XCLHwTec/w696q
	Vo+UYvxTG+pHM0cYu00xgAvuexTLPhW0tqM4HAdetTIesDXOWlXA/Oe/orvMF5nm8Vi2AT0PqWgGO
	6yrmeUQ+EZSfgt0GCr+SNItbon8g+9m/Fu8u/kYWYeCH8lCUUUw8gBdsILkAVSal5G8TbN7OxDgGl
	0W8YZLjUYNbEDKue285NkbHJnbtAVLYI61XTPqF+QQaMx+r5cRqlemghAUyIJZeQHDsrU3F6713Zr
	DYw1WqY2wjOfXA5hGXRUxZBV3D8Bnmlxzh/APfM53MqIxWZ20ZTdnx79NGOFRzhe0kN88PD6feqhO
	TWZzQs5M8SkBm6ApazCQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gVDgZ-0004hl-2g; Fri, 07 Dec 2018 10:48:43 +0000
Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gVDgV-0004fZ-CS; Fri, 07 Dec 2018 10:48:41 +0000
Received: by mail.bootlin.com (Postfix, from userid 110)
 id 7CD3C20733; Fri,  7 Dec 2018 11:48:27 +0100 (CET)
Received: from xps13 (aaubervilliers-681-1-79-44.w90-88.abo.wanadoo.fr
 [90.88.21.44])
 by mail.bootlin.com (Postfix) with ESMTPSA id 07AE320CC5;
 Fri,  7 Dec 2018 11:48:17 +0100 (CET)
Date: Fri, 7 Dec 2018 11:48:17 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Liang Yang <liang.yang@amlogic.com>
Subject: Re: [PATCH v7 2/2] mtd: rawnand: meson: add support for Amlogic
 NAND flash controller
Message-ID: <20181207114817.7a90f3ab@xps13>
In-Reply-To: <ac486ae7-7997-6f35-f29c-267c9c6f0f8c@amlogic.com>
References: <1542386439-30166-1-git-send-email-jianxin.pan@amlogic.com>
 <1542386439-30166-3-git-send-email-jianxin.pan@amlogic.com>
 <20181207102456.1dc67e07@xps13> <20181207104254.0ecfc1e5@xps13>
 <ac486ae7-7997-6f35-f29c-267c9c6f0f8c@amlogic.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181207_024839_562829_C40E62C9 
X-CRM114-Status: GOOD (  10.24  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Rob Herring <robh@kernel.org>, Hanjie Lin <hanjie.lin@amlogic.com>,
 Victor Wan <victor.wan@amlogic.com>, Jianxin Pan <jianxin.pan@amlogic.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Richard Weinberger <richard@nod.at>, Neil Armstrong <narmstrong@baylibre.com>,
 Yixun Lan <yixun.lan@amlogic.com>, linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@bootlin.com>, Jian Hu <jian.hu@amlogic.com>,
 linux-mtd@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>,
 Carlo Caione <carlo@caione.org>, linux-amlogic@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGkgTGlhbmcsCgpMaWFuZyBZYW5nIDxsaWFuZy55YW5nQGFtbG9naWMuY29tPiB3cm90ZSBvbiBG
cmksIDcgRGVjIDIwMTggMTg6NDE6MzkKKzA4MDA6Cgo+IEhpIE1pcXVlbCwKPiAKPiBBcHByZWNp
YXRlIHlvdXIgdGltZS4KClNvcnJ5IGZvciBiZWluZyBsYXRlIHRvIGRvIHRoaXMgcmV2aWV3LgoK
PiBJIHdpbGwgZm9sbG93IHRoZSBuYW5kL25leHQgYW5kIHJld29yayBzb21lIG5leHQgd2VlayBh
cyBzb29uIGFzIHBvc3NpYmxlLgoKVGhlcmUgaXMgbm8gaHVycnksIEkgZG9uJ3QgdGhpbmsgdGhl
IGRyaXZlciB3aWxsIGVudGVyIDQuMjEgKG9yCndoYXRldmVyIGl0IGlzIGNhbGxlZCkgYXMgd2Ug
YXJlIGFscmVhZHkgbGF0ZSBpbiB0aGUgcmVsZWFzZSBjeWNsZS4gSXQKc2hvdWxkIGVudGVyIGlu
IHRoZSBuZXh0IHJlbGVhc2UgdGhvdWdoLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcg
bGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
