Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5D37C5DF97
	for <linux-amlogic@archiver.kernel.org>; Sat, 22 Aug 2026 10:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oH6guawFW+OHa/O8PKFEjLJChbhW2HB6EZYDf1FNvxA=; b=bLYSy8YvYjLbJL
	kAaikXI3k/lpqIFURYkElTc0ae20iNf+lchV8Jdw13LgffaCZmuvz4k5KLoerHv9DPsHyonyAxRH8
	RwukZja1uVfDyJYQxWnI/jrjilnSlZEHYYXbUM28DyoU9ucVb03VGft/NqaCkaFiD9n6N4J53qLmw
	VWk+2io7lOZxziPJ3R4+gKamM5d/PUAOcVuc0ilEKF35vrUywwun+H0GBEKE3jbMuDyVHOj6mDs1X
	EoRHHNuQTUSbTIb4JYx9xuiziQm9uZ9ixAzmwPG5DhI6y6/Qn+WkyE3q1BcD3a1g5kdzNwFzOyqK8
	mY32sP/Mtw/5GL1QmnDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxidz-0000000ESCw-16TH;
	Sat, 22 Aug 2026 10:08:07 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxidx-0000000ESCf-1usf
	for linux-amlogic@lists.infradead.org;
	Sat, 22 Aug 2026 10:08:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A91624039C;
	Sat, 22 Aug 2026 10:08:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E9961F000E9;
	Sat, 22 Aug 2026 10:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787393284;
	bh=be5cKA1YghPdvtiqYO/6wGJ2/nWfF2lc+uo/0No6aws=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XwKPyYFWRU2vTUnPtUNsKoTml791Houk8QmxFZ9kTe4ChAd4/rtzJWRGtOHsdIxu2
	 BsVyR2DFbjFY1xxzYQWntAvB14LaV+Hk/XrpOIib/BNYwwS/DXE4VVbBtyvFz0RVRl
	 vSRqd31ISgbSLyWxEbI9M5NjJbYGFkAJheD9q1trawo0vIQin6z1/77UHJu4YUuo5J
	 9aWxYs+Ip2rwOBrZlUyQ50sTCgCsCMpzwFeFQ6MU6mrqhPTiFNkvOS4/b3wwRXrPcY
	 sa8y84kg8lhd2mZSQrXdfkELr/4fACqYBJjgp0wMYhDe0MQc5HfSVvs/1ywj4jtitA
	 HdnavLtaBJzdQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next 1/3] net: macb: Make sure clk_init_data is
 fully initialized
To: "Geert Uytterhoeven" <geert+renesas@glider.be>
Cc: linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org
In-Reply-To: <00772e2fb1f8433a5d6c47dbd28cb4149495e1ab.1787240118.git.geert+renesas@glider.be>
References: <cover.1787240118.git.geert+renesas@glider.be>
 <00772e2fb1f8433a5d6c47dbd28cb4149495e1ab.1787240118.git.geert+renesas@glider.be>
Date: Sat, 22 Aug 2026 10:08:03 +0000
Message-Id: <20260822100804.3E9961F000E9@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6CgpQcmUtZXhpc3RpbmcgaXNzdWVzOgot
IFtIaWdoXSBUaGUgVFggZXJyb3IgcmVjb3ZlcnkgdGFzayBtb2RpZmllcyBUWCByaW5nIHBvaW50
ZXJzIGFuZCBzdGF0ZSB3aXRob3V0IGhvbGRpbmcgYHF1ZXVlLT50eF9wdHJfbG9ja2AsIHJhY2lu
ZyB3aXRoIGBtYWNiX3N0YXJ0X3htaXRgLgotLQoKLS0tIFBhdGNoIFsxXTogW1BBVENIIG5ldC1u
ZXh0IDEvM10gbmV0OiBtYWNiOiBNYWtlIHN1cmUgY2xrX2luaXRfZGF0YSBpcyBmdWxseSBpbml0
aWFsaXplZCAtLS0KY29tbWl0IDcyZjA1YjVmYmVjMjI4MjhmODYwMzk2ZDYyNmY1YTZiYmFhY2Qz
MzYKQXV0aG9yOiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPgoK
bmV0OiBtYWNiOiBNYWtlIHN1cmUgY2xrX2luaXRfZGF0YSBpcyBmdWxseSBpbml0aWFsaXplZAoK
VGhpcyBjb21taXQgaW5pdGlhbGl6ZXMgdGhlIGNsa19pbml0X2RhdGEgc3RydWN0dXJlIHRvIHBy
ZXZlbnQgaXNzdWVzIHdpdGgKdW5pbml0aWFsaXplZCBtdXR1YWxseS1leGNsdXNpdmUgbWVtYmVy
cyB3aGVuIHN0YWNrIGluaXRpYWxpemF0aW9uIHBhdHRlcm5zCmFyZSBlbmFibGVkLgoKPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvY2FkZW5jZS9tYWNiX21haW4uYyBiL2RyaXZl
cnMvbmV0L2V0aGVybmV0L2NhZGVuY2UvbWFjYl9tYWluLmMKPiBpbmRleCAxNDc2YmNlNzdmMzRk
Li4zMTllNDMwOThmNTdlIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L2NhZGVu
Y2UvbWFjYl9tYWluLmMKPiArKysgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9jYWRlbmNlL21hY2Jf
bWFpbi5jCgpbIC4uLiBdCgpbU2V2ZXJpdHk6IEhpZ2hdClRoaXMgaXNuJ3QgYSBidWcgaW50cm9k
dWNlZCBieSB0aGlzIHBhdGNoLCBidXQgSSBub3RpY2VkIGEgcHJlLWV4aXN0aW5nIGRhdGEKcmFj
ZSBiZXR3ZWVuIG1hY2JfdHhfZXJyb3JfdGFzaygpIGFuZCBtYWNiX3N0YXJ0X3htaXQoKSBpbiB0
aGlzIGZpbGUuCgpEb2VzIG1hY2JfdHhfZXJyb3JfdGFzaygpIHJhY2Ugd2l0aCBtYWNiX3N0YXJ0
X3htaXQoKSBieSBtb2RpZnlpbmcgVFggcmluZwpwb2ludGVycyB3aXRob3V0IGhvbGRpbmcgcXVl
dWUtPnR4X3B0cl9sb2NrPwoKSW4gbWFjYl90eF9lcnJvcl90YXNrKCksIHRoZSByaW5nIHBvaW50
ZXJzIGFyZSByZXNldCB3aXRob3V0IGEgbG9jazoKCiAgICBxdWV1ZS0+dHhfaGVhZCA9IDA7CiAg
ICBxdWV1ZS0+dHhfdGFpbCA9IDA7CgpDb25jdXJyZW50bHksIG1hY2Jfc3RhcnRfeG1pdCgpIGFj
cXVpcmVzIHRoZSBsb2NrIGFuZCB1cGRhdGVzIHR4X2hlYWQ6CgogICAgc3Bpbl9sb2NrX2lycXNh
dmUoJnF1ZXVlLT50eF9wdHJfbG9jaywgZmxhZ3MpOwoKU2luY2UgbmV0aWZfdHhfc3RvcF9hbGxf
cXVldWVzKCkgb25seSBtYXJrcyB0aGUgcXVldWUgYXMgc3RvcHBlZCBidXQgZG9lcyBub3QKd2Fp
dCBmb3IgYW4gYWxyZWFkeS1leGVjdXRpbmcgbmRvX3N0YXJ0X3htaXQoKSB0byBmaW5pc2gsIGNv
dWxkIHRoaXMgcmFjZQpjb3JydXB0IHRoZSBzb2Z0d2FyZSBUWCByaW5nIHBvaW50ZXJzPyAKClRo
aXMgbWlnaHQgbGVhZCB0byBvdXQtb2YtYm91bmRzIERNQSBvciB1c2UtYWZ0ZXItZnJlZSB3aGVu
IHRoZQpkZXN5bmNocm9uaXplZCByaW5nIGlzIHN1YnNlcXVlbnRseSBwcm9jZXNzZWQgYWZ0ZXIg
YSB0cmFuc21pc3Npb24gZXJyb3IuCgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9z
YXNoaWtvLmRldi8jL3BhdGNoc2V0L2NvdmVyLjE3ODcyNDAxMTguZ2l0LmdlZXJ0K3JlbmVzYXNA
Z2xpZGVyLmJlP3BhcnQ9MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtYW1sb2dpYwo=
