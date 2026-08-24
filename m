Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A8E7C5DF9C
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 Aug 2026 16:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Cc:Subject:
	From:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jp6R7u0nn6/l9TKI8vbFabktMW1qWUtdrztfIcVbDPU=; b=GaESa0+C2xnl2f
	F9LvIsLwe4w6LWb8ELEYVj2MBxe4K15yyEGs3ug0emYAvoUFjZIMij3AjwcvD6HbCr3kpeDwddN9E
	lyFXpAhphm4pxWRjBo/O+y1xQLqeujCUmo529C8oy/M/T6EDvQi9uV6ZyRZ5vKdVlge52Rme0DWzc
	qHnyLof1k0N4uvxdo1IwUBTOiA9l71vygPEmN0hFccYst+GfUfrLl/pAP3y+9MtF7Qd8Q7Hhdpoug
	Qgd+26WRY+uZbs1cGAArrlbLXmXbX5jUBCIK6siCbeU1Tqp2aUy6kHH4AGUfkmFZc6GNlGrjOgJMV
	7EZ5E3iBGYMTqw2EG9zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyX9O-0000000GzsA-1RRx;
	Mon, 24 Aug 2026 16:03:54 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyX9I-0000000Gzpa-3nYL
	for linux-amlogic@lists.infradead.org;
	Mon, 24 Aug 2026 16:03:53 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id ECBD01A17F1;
	Mon, 24 Aug 2026 16:03:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BB11A5FFC1;
	Mon, 24 Aug 2026 16:03:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 78E4511C7984B;
	Mon, 24 Aug 2026 18:03:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787587418; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=5Yw9p/e/gTObI0E0KW0aPmvh3/jojeNij8byOhPchOM=;
	b=aMfQljN/arHfb158wkr6CLAxSet5iYUnnt2uZH3SAyBHHe34JaDMHVlouYUDP/wu9UFPHk
	hhToPHJMaibC6ufFX3eAdBc4N0QOCeo3982Ddg5EQrWbF8Nx4HyjmUWDJUKiY1f9LSiZj+
	Z4qfvh5Sk96mK6eM1+uMQa95BFrAKYezzqHsO7LBQqj5M79l+3mFih7KxEYPtwLavaHp3o
	a3aFmclYXZxSB51anNKIJr9sIm2ahqqrgQkVk/ps+tRSZRlM7kFhE7Yueqf5+hyAy8XQsf
	w4Ct0qOqMzO8kHzgAy56q4Qg0mRmKjqhR8680oSotZYxSN/ShI1rvqATHHzXLQ==
Mime-Version: 1.0
Date: Mon, 24 Aug 2026 18:03:32 +0200
Message-Id: <DKXAUOKYDIWV.B30CB2QWDDXQ@bootlin.com>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Subject: Re: [PATCH net-next 1/3] net: macb: Make sure clk_init_data is
 fully initialized
Cc: <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-clk@vger.kernel.org>
To: "Geert Uytterhoeven" <geert+renesas@glider.be>, "Conor Dooley"
 <conor.dooley@microchip.com>, "Andrew Lunn" <andrew+netdev@lunn.ch>, "David
 S . Miller" <davem@davemloft.net>, "Eric Dumazet" <edumazet@google.com>,
 "Jakub Kicinski" <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>,
 "Heiner Kallweit" <hkallweit1@gmail.com>, "Russell King"
 <linux@armlinux.org.uk>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Kevin Hilman" <khilman@baylibre.com>, "Jerome Brunet"
 <jbrunet@baylibre.com>, "Martin Blumenstingl"
 <martin.blumenstingl@googlemail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <cover.1787240118.git.geert+renesas@glider.be>
 <00772e2fb1f8433a5d6c47dbd28cb4149495e1ab.1787240118.git.geert+renesas@glider.be>
In-Reply-To: <00772e2fb1f8433a5d6c47dbd28cb4149495e1ab.1787240118.git.geert+renesas@glider.be>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_090349_077893_3EE66114 
X-CRM114-Status: GOOD (  15.03  )
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

SGVsbG8gR2VlcnQsCgpPbiBGcmkgQXVnIDIxLCAyMDI2IGF0IDEyOjA3IFBNIENFU1QsIEdlZXJ0
IFV5dHRlcmhvZXZlbiB3cm90ZToKPiBUaGUgY2xrX2luaXRfZGF0YSBzdHJ1Y3R1cmUgY29udGFp
bnMgc2V2ZXJhbCBtdXR1YWxseS1leGNsdXNpdmUgbWVtYmVycwo+IGZvciBkaWZmZXJlbnQgbWV0
aG9kcyB0byBzcGVjaWZ5IHRoZSBwb3NzaWJsZSBwYXJlbnRzIG9mIGEgY2xvY2ssCj4gcHJvbXB0
aW5nIGRyaXZlcnMgdG8gaW5pdGlhbGl6ZSBvbmx5IHRoZSBtZW1iZXJzIHRoZXkgbmVlZC4gIEhv
d2V2ZXIsCj4gbm90IGluaXRpYWxpemluZyBhbGwgbWVtYmVycyBtYXkgY2F1c2Ugc3VidGxlIGlz
c3Vlcywgd2hpY2ggYXJlIG9ubHkKPiBleHBvc2VkIHdoZW4gQ09ORklHX0lOSVRfU1RBQ0tfQUxM
X1BBVFRFUk4gb3IgQ09ORklHX0lOSVRfU1RBQ0tfTk9ORSBpcwo+IGVuYWJsZWQuCj4KPiBNYWtl
IHN1cmUgYWxsIG1lbWJlcnMgYXJlIGZ1bGx5IGluaXRpYWxpemVkLCB0byBhdm9pZCBzdWNoIGJ1
Z3MsIGFuZCB0bwo+IHByZXZlbnQgZnV0dXJlIGJyZWFrYWdlIHdoZW4gY29udmVydGluZyBkcml2
ZXJzIHRvIGEgZGlmZmVyZW50IG1ldGhvZAo+IGZvciBzcGVjaWZ5aW5nIHRoZSBwYXJlbnRzLgo+
Cj4gU2lnbmVkLW9mZi1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRl
ci5iZT4KPiAtLS0KPiBDb21waWxlLXRlc3RlZCBvbmx5Lgo+IC0tLQo+ICBkcml2ZXJzL25ldC9l
dGhlcm5ldC9jYWRlbmNlL21hY2JfbWFpbi5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC9l
dGhlcm5ldC9jYWRlbmNlL21hY2JfbWFpbi5jIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvY2FkZW5j
ZS9tYWNiX21haW4uYwo+IGluZGV4IDE0NzZiY2U3N2YzNGQyYTUuLjMxOWU0MzA5OGY1N2VkN2Ig
MTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvY2FkZW5jZS9tYWNiX21haW4uYwo+
ICsrKyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L2NhZGVuY2UvbWFjYl9tYWluLmMKPiBAQCAtNTM3
Niw3ICs1Mzc2LDcgQEAgc3RhdGljIGludCBmdTU0MF9jMDAwX2Nsa19pbml0KHN0cnVjdCBwbGF0
Zm9ybV9kZXZpY2UgKnBkZXYsIHN0cnVjdCBjbGsgKipwY2xrLAo+ICAJCQkgICAgICAgc3RydWN0
IGNsayAqKmhjbGssIHN0cnVjdCBjbGsgKip0eF9jbGssCj4gIAkJCSAgICAgICBzdHJ1Y3QgY2xr
ICoqcnhfY2xrLCBzdHJ1Y3QgY2xrICoqdHN1X2NsaykKPiAgewo+IC0Jc3RydWN0IGNsa19pbml0
X2RhdGEgaW5pdDsKPiArCXN0cnVjdCBjbGtfaW5pdF9kYXRhIGluaXQgPSB7fTsKPiAgCWludCBl
cnIgPSAwOwo+ICAKPiAgCWVyciA9IG1hY2JfY2xrX2luaXRfZGZsdChwZGV2LCBwY2xrLCBoY2xr
LCB0eF9jbGssIHJ4X2NsaywgdHN1X2Nsayk7CgpSZXZpZXdlZC1ieTogVGjDqW8gTGVicnVuIDx0
aGVvLmxlYnJ1bkBib290bGluLmNvbT4KCkkgY2Fubm90IGdpdmUgeW91IGEgVGVzdGVkLWJ5IGJl
Y2F1c2UgdGhpcyB0cmlnZ2VycyBvbmx5IG9uCnNpZml2ZSxmdTU0MC1jMDAwLWdlbSBjb21wYXRp
YmxlIG1hdGNoaW5nIHVwc3RyZWFtIGRldmljZXRyZWVzCnNpZml2ZS9oaWZpdmUte3VubGVhc2hl
ZCx1bm1hdGNoZWR9LWEwMC5kdHMKClRoYW5rcywKCi0tClRow6lvIExlYnJ1biwgQm9vdGxpbgpF
bWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20K
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1h
bWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
