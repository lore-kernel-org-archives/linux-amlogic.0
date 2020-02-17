Return-Path: <SRS0=uJma=4F=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C29AC7619B
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Feb 2020 06:39:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5ED1C20718
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Feb 2020 06:39:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PDNMRq7F"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5ED1C20718
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=siol.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D4knaWVPvCuWEtt3Z5XmmX21wcy/rOLLV2BBfsn3xFI=; b=PDNMRq7F1ozxRL
	hUVkGTGLC9s6UJpUEH93rxdlKFzkufMT+UdEreIrOYYOC/Bzui44Gr46zHwC0dDsCMxlj9wcU4VPm
	Lcu1xGkrVyIu5w1/Ljbi55DjFQLVKzkn3GHzDG9VgNCGQn/ckL0cfeNsCVHgTvUivpcqvP+l0PZOI
	CoIORy8d1zRD6KbY98JP2d42J6/Svw/lHcqDB+451VgPp4MXCwvRTYOXzOPccep0rLDapCWVG7TG6
	ZKDB4fs5YRD5K7YxJHvVeCrcyuiIzZhOf4xBqhH80D1ORDy2acyxR823JP7Nf5CbR7p5M0IOSayz8
	0nvOrQM6G4Ctu05uVXTg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j3a3q-0001zK-EF; Mon, 17 Feb 2020 06:39:18 +0000
Received: from mailoutvs5.siol.net ([185.57.226.196] helo=mail.siol.net)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j3a3n-0001xS-A4
 for linux-amlogic@lists.infradead.org; Mon, 17 Feb 2020 06:39:17 +0000
Received: from localhost (localhost [127.0.0.1])
 by mail.siol.net (Zimbra) with ESMTP id 51884522CE8;
 Mon, 17 Feb 2020 07:39:01 +0100 (CET)
X-Virus-Scanned: amavisd-new at psrvmta12.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
 by localhost (psrvmta12.zcs-production.pri [127.0.0.1]) (amavisd-new,
 port 10032)
 with ESMTP id aQUjgWNbNH1b; Mon, 17 Feb 2020 07:39:01 +0100 (CET)
Received: from mail.siol.net (localhost [127.0.0.1])
 by mail.siol.net (Zimbra) with ESMTPS id F4052522C8E;
 Mon, 17 Feb 2020 07:39:00 +0100 (CET)
Received: from jernej-laptop.localnet (cpe-194-152-20-232.static.triera.net
 [194.152.20.232]) (Authenticated sender: jernej.skrabec@siol.net)
 by mail.siol.net (Zimbra) with ESMTPA id 1C5E9522CE8;
 Mon, 17 Feb 2020 07:38:59 +0100 (CET)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
To: a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 boris.brezillon@collabora.com, Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v4 02/11] drm/bridge: dw-hdmi: add max bpc connector
 property
Date: Mon, 17 Feb 2020 07:38:58 +0100
Message-ID: <11463907.O9o76ZdvQC@jernej-laptop>
In-Reply-To: <20200206191834.6125-3-narmstrong@baylibre.com>
References: <20200206191834.6125-1-narmstrong@baylibre.com>
 <20200206191834.6125-3-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200216_223915_503312_2F492E16 
X-CRM114-Status: UNSURE (   7.90  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGkhCgpEbmUgxI1ldHJ0ZWssIDA2LiBmZWJydWFyIDIwMjAgb2IgMjA6MTg6MjUgQ0VUIGplIE5l
aWwgQXJtc3Ryb25nIG5hcGlzYWwoYSk6Cj4gRnJvbTogSm9uYXMgS2FybG1hbiA8am9uYXNAa3dp
Ym9vLnNlPgo+IAo+IEFkZCB0aGUgbWF4X2JwYyBwcm9wZXJ0eSB0byB0aGUgZHctaGRtaSBjb25u
ZWN0b3IgdG8gcHJlcGFyZSBzdXBwb3J0Cj4gZm9yIDEwLCAxMiAmIDE2Yml0IG91dHB1dCBzdXBw
b3J0Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEpvbmFzIEthcmxtYW4gPGpvbmFzQGt3aWJvby5zZT4K
PiBTaWduZWQtb2ZmLWJ5OiBOZWlsIEFybXN0cm9uZyA8bmFybXN0cm9uZ0BiYXlsaWJyZS5jb20+
Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jIHwgNCAr
KysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMKPiBiL2RyaXZlcnMvZ3B1
L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jIGluZGV4Cj4gOWUwOTI3ZDIyZGI2Li4wNTEw
MDFmNzdkZDQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9k
dy1oZG1pLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWku
Ywo+IEBAIC0yNDA2LDYgKzI0MDYsMTAgQEAgc3RhdGljIGludCBkd19oZG1pX2JyaWRnZV9hdHRh
Y2goc3RydWN0IGRybV9icmlkZ2UKPiAqYnJpZGdlKSBEUk1fTU9ERV9DT05ORUNUT1JfSERNSUEs
Cj4gIAkJCQkgICAgaGRtaS0+ZGRjKTsKPiAKPiArCWRybV9hdG9taWNfaGVscGVyX2Nvbm5lY3Rv
cl9yZXNldChjb25uZWN0b3IpOwoKV2h5IGlzIHRoaXMgcmVzZXQgbmVlZGVkPwoKQmVzdCByZWdh
cmRzLApKZXJuZWoKCj4gKwo+ICsJZHJtX2Nvbm5lY3Rvcl9hdHRhY2hfbWF4X2JwY19wcm9wZXJ0
eShjb25uZWN0b3IsIDgsIDE2KTsKPiArCj4gIAlpZiAoaGRtaS0+dmVyc2lvbiA+PSAweDIwMGEg
JiYgaGRtaS0+cGxhdF9kYXRhLT51c2VfZHJtX2luZm9mcmFtZSkKPiAgCQlkcm1fb2JqZWN0X2F0
dGFjaF9wcm9wZXJ0eSgmY29ubmVjdG9yLT5iYXNlLAo+ICAJCQljb25uZWN0b3ItPmRldi0KPm1v
ZGVfY29uZmlnLmhkcl9vdXRwdXRfbWV0YWRhdGFfcHJvcGVydHksIDApOwoKCgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFp
bGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
