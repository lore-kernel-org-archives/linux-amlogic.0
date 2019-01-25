Return-Path: <SRS0=B80X=QB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19CEFC282C0
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Jan 2019 12:30:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DCADC2146E
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Jan 2019 12:30:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="C4uK2byJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DCADC2146E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zf4jsCBZs1a5/JmU6GYfcHKcFfh1cH4cqHLDMLHlJtI=; b=C4uK2byJZS7+RY
	amx0LZoFWlB009URR85OPt0zRSdU1UTWVT0LSw1J4K86N6rCFLGNwJD6hcP5nro6CpZUnv537Jm5C
	GCOlAOeiBnVKbmPqDOVyUKCyTRKTr+GIgPqPOyB4T+iy8hWo1FWurRJJJBCoMr0h2oEVXdXeZJF8x
	APbVFNub91PgkrncozQXuGP1xN6YITGbNKqJL+P1VokTvfeWxkGKjdGdRTmWMHgWsE8OKHtPvPKsK
	gxkR3JnEcGky3uyqBwXErY61PDJNrKJ/FEeqmW309LPkm8PZNpDKWrtmDeL9OV+GMYhpq/s0G2lyQ
	NSDF2kq1TKjd4ShgqsXQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gn0cU-0001UR-UR; Fri, 25 Jan 2019 12:30:02 +0000
Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gn0cR-0001Mk-H2; Fri, 25 Jan 2019 12:30:01 +0000
Received: by mail.bootlin.com (Postfix, from userid 110)
 id 23418207B0; Fri, 25 Jan 2019 13:29:58 +0100 (CET)
Received: from xps13 (aaubervilliers-681-1-87-206.w90-88.abo.wanadoo.fr
 [90.88.29.206])
 by mail.bootlin.com (Postfix) with ESMTPSA id 8F2DD209BF;
 Fri, 25 Jan 2019 13:29:20 +0100 (CET)
Date: Fri, 25 Jan 2019 13:29:20 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Jianxin Pan <jianxin.pan@amlogic.com>
Subject: Re: [PATCH] MAINTAINERS: Add entry for Amlogic NAND controller driver
Message-ID: <20190125132920.7354c0ec@xps13>
In-Reply-To: <1547917355-13179-1-git-send-email-jianxin.pan@amlogic.com>
References: <1547917355-13179-1-git-send-email-jianxin.pan@amlogic.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190125_042959_718463_2E8CCEF1 
X-CRM114-Status: UNSURE (   8.35  )
X-CRM114-Notice: Please train this message.
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
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 Hanjie Lin <hanjie.lin@amlogic.com>, Victor Wan <victor.wan@amlogic.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Richard Weinberger <richard@nod.at>, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, Boris Brezillon <boris.brezillon@bootlin.com>,
 Jian Hu <jian.hu@amlogic.com>, Liang Yang <liang.yang@amlogic.com>,
 linux-mtd@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>,
 Carlo Caione <carlo@caione.org>, linux-amlogic@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGkgSmlhbnhpbiwKCkppYW54aW4gUGFuIDxqaWFueGluLnBhbkBhbWxvZ2ljLmNvbT4gd3JvdGUg
b24gU3VuLCAyMCBKYW4gMjAxOQowMTowMjozNSArMDgwMDoKCj4gQWRkIGVudHJ5IGZvciBBbWxv
Z2ljIE5BTkQgY29udHJvbGxlciBkcml2ZXIgYW5kIGl0cyBiaW5kaW5nc1swXS4KPiAKPiBbMF0g
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8xNTQ3NTY2Njg0LTU3NDcyLTEtZ2l0LXNlbmQt
ZW1haWwtamlhbnhpbi5wYW5AYW1sb2dpYy5jb20vCj4gCj4gU2lnbmVkLW9mZi1ieTogTGlhbmcg
WWFuZyA8bGlhbmcueWFuZ0BhbWxvZ2ljLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBKaWFueGluIFBh
biA8amlhbnhpbi5wYW5AYW1sb2dpYy5jb20+CgpBcHBsaWVkIHRvIG5hbmQvbmV4dC4KClRoYW5r
cywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
YW1sb2dpYwo=
