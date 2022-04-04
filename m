Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F264DC433EF
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 Apr 2022 10:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LQywRBwinmujbrmkOZXaUpPbD+8dksZTcxkPRLf+654=; b=qD2vEEwS4UqJb2
	bD8ezNt6Er2N/ukfkGcGuLAr/WARxBCuxPXgweTKcX/3NGec7L+qWZfXHrQzWYewm6l8wYWt9zLKo
	Zo2tH63MuwqsFjDT0/3IzBmcTaDU9koHQlo+iP/OshvzE2yzbTyevFClOBtjfXxZYqm3HNcR4HueM
	dRpGrKXuLQilxqGxLuiUzvsc975qFH4KkTFpgJJQCnMxdga6Ry5FgfnA38rC1LKZH5UrKc8zPgc5C
	+Cn41B/TKbKjPPUgNmX0gmXzuahxdDVJCiUsaasmr5K4DOLlKFcoVY1vPmoQgY5+w32M7i0X4YW5e
	hYKNd4kS58MTKjuVaZ/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbJls-00ERWj-9U; Mon, 04 Apr 2022 10:17:16 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbJlp-00ERUQ-8Q
 for linux-amlogic@lists.infradead.org; Mon, 04 Apr 2022 10:17:14 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1nbJlj-000280-Vt; Mon, 04 Apr 2022 12:17:08 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1nbJlk-0010WL-IW; Mon, 04 Apr 2022 12:17:07 +0200
Received: from pza by lupine with local (Exim 4.94.2)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1nbJli-0006gF-Ep; Mon, 04 Apr 2022 12:17:06 +0200
Message-ID: <de4755da238b7333ea32785d0d5d47d7008a296d.camel@pengutronix.de>
Subject: Re: [PATCH 0/3] reset: meson-s4: add reset driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Zelong Dong <zelong.dong@amlogic.com>, robh+dt@kernel.org, 
 khilman@baylibre.com, narmstrong@baylibre.com, 
 martin.blumenstingl@googlemail.com
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com, 
 devicetree@vger.kernel.org
Date: Mon, 04 Apr 2022 12:17:06 +0200
In-Reply-To: <20220107023931.13251-1-zelong.dong@amlogic.com>
References: <20220107023931.13251-1-zelong.dong@amlogic.com>
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220404_031713_332910_B89DE43B 
X-CRM114-Status: GOOD (  10.23  )
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

T24gRnIsIDIwMjItMDEtMDcgYXQgMTA6MzkgKzA4MDAsIFplbG9uZyBEb25nIHdyb3RlOgo+IAo+
IFRoaXMgcGF0Y2hzZXQgYWRkcyBSZXNldCBjb250cm9sbGVyIGRyaXZlciBzdXBwb3J0IGZvciBN
ZXNvbi1TNCBTb0MuCj4gTWVzb24tUzQgUmVzZXQgQ29udHJvbGxlciBoYXMgNiBiYW5rcyAodGhl
IG51bWJlciBvZiByZXNldCByZWdpc3RlcikKPiBhbmQgdGhlIGxldmVsLXJlc2V0IHJlZ2lzdGVy
IG9mZnNldCBpcyAweDQwLgo+IAo+IAo+IFplbG9uZyBEb25nICgzKToKPiDCoCBkdC1iaW5kaW5n
czogcmVzZXQ6IEFkZCBjb21wYXRpYmxlIGZvciBNZXNvbi1TNCBSZXNldCBDb250cm9sbGVyCj4g
wqAgZHQtYmluZGluZ3M6IHJlc2V0OiBhZGQgYmluZGluZ3MgZm9yIHRoZSBNZXNvbi1TNCBTb0Mg
UmVzZXQKPiBDb250cm9sbGVyCj4gwqAgcmVzZXQ6IHJlc2V0LW1lc29uOiBhZGQgc3VwcG9ydCBm
b3IgdGhlIE1lc29uLVM0IFNvQyBSZXNldAo+IENvbnRyb2xsZXIKPiAKPiDCoC4uLi9iaW5kaW5n
cy9yZXNldC9hbWxvZ2ljLG1lc29uLXJlc2V0LnlhbWzCoMKgIHzCoMKgIDEgKwo+IMKgZHJpdmVy
cy9yZXNldC9yZXNldC1tZXNvbi5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHzCoMKgIDYgKwo+IMKgLi4uL3Jlc2V0L2FtbG9naWMsbWVzb24tczQtcmVzZXQuaMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgfCAxMjUKPiArKysrKysrKysrKysrKysrKysKPiDCoDMgZmlsZXMgY2hh
bmdlZCwgMTMyIGluc2VydGlvbnMoKykKPiDCoGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2R0
LWJpbmRpbmdzL3Jlc2V0L2FtbG9naWMsbWVzb24tczQtCj4gcmVzZXQuaAoKVGhhbmsgeW91LCBh
cHBsaWVkIHRvIHJlc2V0L25leHQuCgpyZWdhcmRzClBoaWxpcHAKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0
CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
