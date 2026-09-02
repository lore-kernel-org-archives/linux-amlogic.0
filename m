Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFB31C624D3
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Sep 2026 13:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8fPFc8csdure52s+OeDpddtxlfxu6srJKKJ3qKrvcoM=; b=zbl8abqUy6mCdX
	A0VWx4xGoUCLEzDmCdJfizbvYHFrF2Mm/YZgDLV4PJNHGrEySBDP2u6X+JruQHbpPFK7OWIXTRz03
	InB5JYo3H/4rn1ZB09ujlSvewmBZ/Vy5tePcBOgBSIMhHLoblqOfnF5r5Axou6vXz/vyYI9TWShde
	YLvB+EkrC2Scc6ludcX3xF25E3+yCwB7XSIEF+KDvjcYIH7BMKv7XGqQxVfJ4gEMS0ahgDbazW2BH
	4vRq3hj6wSf3JhivPF+CEMLJ/0c/evPgYqYoTv9ZVDcRFDmCe5IVGPZnryuSAYwW/kwDOy1UFh4U2
	QCRGz/b/9h5BPMASH0GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1kbb-0000000EkLS-03TO;
	Wed, 02 Sep 2026 13:02:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1kbZ-0000000EkKm-3z38
	for linux-amlogic@lists.infradead.org;
	Wed, 02 Sep 2026 13:02:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 19D6B60213;
	Wed,  2 Sep 2026 13:02:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55BC21F00A3A;
	Wed,  2 Sep 2026 13:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788354136;
	bh=8nenKJP/ssNGfl8oKVblXsmCwc+pLn2VBTadIzA5UHU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TEVj8FK9mQmq/iwm7LgBb7166tSrVZvpIzPnJ0TzECOLIhn7ysc1lTZui02EFanHZ
	 ytNp6DMP72tbeNUfoNNlTBZ2JlwXOpT4CoQ3YrTM+bskgxVaiR130NbqFEGbg1Eb6O
	 EwRJa5uldFoZVZdAA4rodX2xb6XJxKVFm+lyLw6gR9CYg5fq3eVgwxJ58ZK6Y6hR1O
	 fu/2RE9Xyy0Tx0JGo8uc1Ypp6vQxdLJ+r6pTa2N8Xx6CW/fY5nOPim2C9KdDnpI1+K
	 +ZTjEoEqKImcNPMW5ptic4JheUc6XyBYv+eWYuWqBgFtJdePJnpHPae8B9VWm/XI5Z
	 /DjEneVwAny0g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 1/6] mfd: khadas-mcu: Add per-variant configuration
 infrastructure and VIM4 support
To: "Ronald Claveau" <linux-kernel-dev@aliel.fr>
Cc: neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, mfd@lists.linux.dev, robh@kernel.org, lee@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260902-add-mcu-fan-khadas-vim4-v11-1-5f1610d83bf0@aliel.fr>
References: <20260902-add-mcu-fan-khadas-vim4-v11-0-5f1610d83bf0@aliel.fr>
 <20260902-add-mcu-fan-khadas-vim4-v11-1-5f1610d83bf0@aliel.fr>
Date: Wed, 02 Sep 2026 13:02:15 +0000
Message-Id: <20260902130216.55BC21F00A3A@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0xvd10gUGFyZW50IE1GRCBkcml2
ZXIgaW50cm9kdWNlcyBjaGlsZC1zcGVjaWZpYyBwcml2YXRlIHJlc291cmNlcyAoZmFuIGNvbmZp
Z3VyYXRpb24pIHZpYSBhIHBsYXRmb3JtIGRhdGEgc3RydWN0IGluIGEgZ2xvYmFsIE1GRCBoZWFk
ZXIsIHZpb2xhdGluZyBNRkQgc2VwYXJhdGlvbiBhbmQgY291cGxpbmcgcHJpbmNpcGxlcy4KLS0K
CmNvbW1pdCA4NWQ3MTZhMWY5MWZhOWU4ZTJmNDg0NzlkZjhjN2IwN2UwY2YwMjc5CkF1dGhvcjog
Um9uYWxkIENsYXZlYXUgPGxpbnV4LWtlcm5lbC1kZXZAYWxpZWwuZnI+CgptZmQ6IGtoYWRhcy1t
Y3U6IEFkZCBwZXItdmFyaWFudCBjb25maWd1cmF0aW9uIGluZnJhc3RydWN0dXJlIGFuZCBWSU00
IHN1cHBvcnQKClRoaXMgY29tbWl0IGludHJvZHVjZXMgcGVyLXZhcmlhbnQgY29uZmlndXJhdGlv
biBzdHJ1Y3R1cmVzIGZvciB0aGUgS0hBREFTIE1DVQpkcml2ZXIsIGFkZGluZyBzdXBwb3J0IGZv
ciBWSU00IHNwZWNpZmljIHJlZ2lzdGVycy4gSXQgYWxzbyBpbnRyb2R1Y2VzIGFuIGVudW0KZm9y
IHZhcmlhbnQgbWF0Y2hpbmcgYW5kIGEgZmFuIHBsYXRmb3JtIGRhdGEgc3RydWN0IHRvIHBhc3Mg
ZmFuIGNvbmZpZ3VyYXRpb24KdG8gYSBzdWItZHJpdmVyLgoKPiBkaWZmIC0tZ2l0IGEvaW5jbHVk
ZS9saW51eC9tZmQva2hhZGFzLW1jdS5oIGIvaW5jbHVkZS9saW51eC9tZmQva2hhZGFzLW1jdS5o
Cj4gaW5kZXggYTk5YmEyZWQwZTRlMC4uN2E5OTgwZWE2M2U3ZSAxMDA2NDQKPiAtLS0gYS9pbmNs
dWRlL2xpbnV4L21mZC9raGFkYXMtbWN1LmgKPiArKysgYi9pbmNsdWRlL2xpbnV4L21mZC9raGFk
YXMtbWN1LmgKClsgLi4uIF0KCj4gQEAgLTg4LDQgKzk1LDIxIEBAIHN0cnVjdCBraGFkYXNfbWN1
IHsKPiAgCXN0cnVjdCByZWdtYXAgKnJlZ21hcDsKPiAgfTsKPiAgCj4gKy8qKgo+ICsgKiBzdHJ1
Y3Qga2hhZGFzX21jdV9mYW5fcGRhdGEgLSBmYW4gc3ViLWRyaXZlciBjb25maWd1cmF0aW9uCj4g
KyAqIEBmYW5fcmVnOiByZWdpc3RlciBhZGRyZXNzIHRvIHdyaXRlIHRoZSBmYW4gbGV2ZWwKPiAr
ICogQGxldmVsczogdGFibGUgbWFwcGluZyBsb2dpY2FsIGNvb2xpbmctZGV2aWNlIHN0YXRlcyB0
byByYXcgZmFuIGxldmVscwo+ICsgKiBAbmxldmVsczogbnVtYmVyIG9mIGVudHJpZXMgaW4gQGxl
dmVscwo+ICsgKi8KPiArc3RydWN0IGtoYWRhc19tY3VfZmFuX3BkYXRhIHsKPiArCXVuc2lnbmVk
IGludCBmYW5fcmVnOwo+ICsJY29uc3QgdW5zaWduZWQgaW50ICpsZXZlbHM7Cj4gKwl1bnNpZ25l
ZCBpbnQgbmxldmVsczsKPiArfTsKCltTZXZlcml0eTogTG93XQpEb2VzIHRoaXMgc3RydWN0IGlu
dHJvZHVjZSBjaGlsZC1zcGVjaWZpYyBwcml2YXRlIGNvbmZpZ3VyYXRpb24gaW50byB0aGUgY29y
ZQpNRkQgZHJpdmVyPwoKQnkgZGVmaW5pbmcga2hhZGFzX21jdV9mYW5fcGRhdGEgdG8gcGFzcyB0
aGVybWFsIGNvb2xpbmcgc3RhdGUgbGV2ZWxzLCBpdAphcHBlYXJzIHRoZSBwYXJlbnQgTUZEIGRy
aXZlciB3aWxsIGJlIGZvcmNlZCB0byBoYW5kbGUgY29uZmlndXJhdGlvbnMgc3BlY2lmaWMKdG8g
YSBzaW5nbGUgc3ViLWRyaXZlci4gVGhlIE1GRCBzdWJzeXN0ZW0gcHJpbmNpcGxlcyBpbmRpY2F0
ZSB0aGF0IHRoZSBjb3JlCmRyaXZlciBzaG91bGQgb25seSBoYW5kbGUgc2hhcmVkIGNvcmUgcmVz
b3VyY2VzLCB3aGlsZSBjaGlsZCBkcml2ZXJzIHNob3VsZAptYW5hZ2UgdGhlaXIgb3duIHByaXZh
dGUgY29uZmlndXJhdGlvbnMuCgpDb3VsZCB0aGlzIGFwcHJvYWNoIGNyZWF0ZSB0aWdodCBjb3Vw
bGluZyB3aGVyZSBhbnkgbmV3IGZhbiB2YXJpYW50IHJlcXVpcmVzCmNoYW5nZXMgdG8gdGhlIGNv
cmUgTUZEIGRyaXZlciwgcmF0aGVyIHRoYW4ga2VlcGluZyB0aG9zZSBkZXRhaWxzIGNvbnRhaW5l
ZAp3aXRoaW4gdGhlIHRoZXJtYWwgZHJpdmVyPwoKPiArCj4gK2VudW0ga2hhZGFzX21jdV90eXBl
IHsKPiArCUtIQURBU19NQ1VfR0VORVJJQyA9IDEsIC8qIFZJTTEvMi8zLCBFZGdlLCBFZGdlLVYg
Ki8KPiArCUtIQURBU19NQ1VfVklNNCwKPiArfTsKPiArCj4gICNlbmRpZiAvKiBNRkRfS0hBREFT
X01DVV9IICovCgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8j
L3BhdGNoc2V0LzIwMjYwOTAyLWFkZC1tY3UtZmFuLWtoYWRhcy12aW00LXYxMS0wLTVmMTYxMGQ4
M2JmMEBhbGllbC5mcj9wYXJ0PTEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LWFtbG9naWMK
