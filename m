Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6680AC982D8
	for <linux-amlogic@archiver.kernel.org>; Sun, 20 Sep 2026 15:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WrBm0GeRUu4HKEtS8JfW/vKk957dUhN5YvRoMm96DoI=; b=Zf15FGfAaWvqHs
	XPyc/L9RcuKBTdJl6LmGqTp1JDBovRZKSlrj+oXvhGNSPqUhVcY2fvKFtcxPtgI2bMXRANJllclJv
	CFzsQ3k0XHoBc3RJj7u6eJp127dNli33S6QeaWCSMECvvx1uREUxKvwqSdubsZN2unb//C9HDGOL0
	+AJFK6RISyEMMPauLJILbcbeHjR4oSulq29Y5HVKoADjXuK7pJmI660yX3AqNbAPRjMHtHQ26sqUe
	L7LFtdCuheoS3+7jaXYjLflETYgf5X58T55XB5sEPJTjCbcZOFQcxlsCqZJ2/CU4syqT3B0ZbvAMI
	TK8TVSKj+LhZl1oovphw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8JBo-000000002LJ-3rd6;
	Sun, 20 Sep 2026 15:10:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8JBm-000000002LB-3XVR
	for linux-amlogic@lists.infradead.org;
	Sun, 20 Sep 2026 15:10:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 51A8141143;
	Sun, 20 Sep 2026 15:10:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3BBC1F000FF;
	Sun, 20 Sep 2026 15:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789917046;
	bh=QtVbNLcDa/iTthid63Qll4pVWqWerOdn9F8dCJT8zFQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KJJW3bWgPDuZAwPSJ7XyIWvS0BkVW/i8vaxBzw4+cgFgzL/44Zh80gZ6ZvsobC6Am
	 B0dw8zAuVNHfwyo7J+XoSS3DIn9oCwQjsx2D2+sP3i7YrwvjT5jdezdeSxeuhRjhRF
	 +o4b2GoKmpz8lyQO7F4D4buNRRHoKNWdTnxnRIx5jeL3yYqJLQknAsbWZPx8FNCKWD
	 uGXQHK5wbPviq4gw3v+8/n2IvfAHBg6jSueibA2COtUYc+mbPGLOg6A0y/ZnRM53Ry
	 qXtKu6QGyPXMYetdNkDaOxgyt4knpin69l4/ab1qGO7381XrkcSZMVFFCrkcfRVJ6Q
	 Nq4jA5Un1MZHA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 5/8] drm/bridge: pass down IRQ_HPD to the drivers
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org
In-Reply-To: <20260920-hpd-irq-events-v5-5-ff1de0090c72@oss.qualcomm.com>
References: <20260920-hpd-irq-events-v5-0-ff1de0090c72@oss.qualcomm.com>
 <20260920-hpd-irq-events-v5-5-ff1de0090c72@oss.qualcomm.com>
Date: Sun, 20 Sep 2026 15:10:45 +0000
Message-Id: <20260920151045.D3BBC1F000FF@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0xvd10gZHJtL29tYXBkcm06IGhk
bWk1X2JyaWRnZV9ocGRfbm90aWZ5IHNpZ25hdHVyZSBtaXNtYXRjaCBjYXVzZXMgYnVpbGQgZmFp
bHVyZQotLQoKY29tbWl0IGMxMmE5YmU1NzIwOGExNDUwYzg5YjdiMTg2Y2E4ZjlmZjY4NDg5OTUK
QXV0aG9yOiBEbWl0cnkgQmFyeXNoa292IDxkbWl0cnkuYmFyeXNoa292QG9zcy5xdWFsY29tbS5j
b20+Cgpkcm0vYnJpZGdlOiBwYXNzIGRvd24gSVJRX0hQRCB0byB0aGUgZHJpdmVycwoKVGhlIERp
c3BsYXlQb3J0IHN0YW5kYXJkIGRlZmluZXMgYSBzcGVjaWFsIGtpbmQgb2YgSFBEIGV2ZW50cyBj
YWxsZWQKSVJRX0hQRC4gVGhlc2UgZXZlbnRzIGFyZSB1c2VkIHRvIG5vdGlmeSBEUCBTb3VyY2Ug
YWJvdXQgdGhlIGV2ZW50cyBvbgp0aGUgU2luayBzaWRlLiBQYXNzIGRvd24gdGhlIGV4dHJhIHN0
YXR1cyB0byB0aGUgYnJpZGdlIGRyaXZlcnMgdmlhIHRoZQpocGRfbm90aWZ5KCkgY2FsbGJhY2ss
IGxldHRpbmcgRFAgYnJpZGdlcyB0byBhY3QgYWNjb3JkaW5nbHkuCgo+IGRpZmYgLS1naXQgYS9p
bmNsdWRlL2RybS9kcm1fYnJpZGdlLmggYi9pbmNsdWRlL2RybS9kcm1fYnJpZGdlLmgKPiBpbmRl
eCBlZDlmNzdhMjU5N2ExLi4yYjNjYWQ0YmVkZGU5IDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvZHJt
L2RybV9icmlkZ2UuaAo+ICsrKyBiL2luY2x1ZGUvZHJtL2RybV9icmlkZ2UuaAo+IEBAIC01MDks
NyArNTA5LDggQEAgc3RydWN0IGRybV9icmlkZ2VfZnVuY3Mgewo+ICAJICovCj4gIAl2b2lkICgq
aHBkX25vdGlmeSkoc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSwKPiAgCQkJICAgc3RydWN0IGRy
bV9jb25uZWN0b3IgKmNvbm5lY3RvciwKPiAtCQkJICAgZW51bSBkcm1fY29ubmVjdG9yX3N0YXR1
cyBzdGF0dXMpOwo+ICsJCQkgICBlbnVtIGRybV9jb25uZWN0b3Jfc3RhdHVzIHN0YXR1cywKPiAr
CQkJICAgZW51bSBkcm1fY29ubmVjdG9yX2RwX2V2ZW50IGV2ZW50KTsKPiAgCj4gIAkvKioKPiAg
CSAqIEBocGRfZW5hYmxlOgoKW1NldmVyaXR5OiBMb3ddCkNvdWxkIHRoaXMgY2F1c2UgYSBidWls
ZCByZWdyZXNzaW9uIGJ5IG1pc3NpbmcgYW4gdXBkYXRlIGluCmRyaXZlcnMvZ3B1L2RybS9vbWFw
ZHJtL2Rzcy9oZG1pNS5jPwoKV2hpbGUgaGRtaTRfYnJpZGdlX2hwZF9ub3RpZnkoKSB3YXMgdXBk
YXRlZCBpbiB0aGlzIHBhdGNoLApoZG1pNV9icmlkZ2VfaHBkX25vdGlmeSgpIGluIGhkbWk1LmMg
c3RpbGwgcmV0YWlucyB0aGUgb2xkIDMtYXJndW1lbnQKc2lnbmF0dXJlLiBBc3NpZ25pbmcgdGhp
cyBpbmNvcnJlY3RseS10eXBlZCBmdW5jdGlvbiBwb2ludGVyIHRvCmhkbWk1X2JyaWRnZV9mdW5j
cy5ocGRfbm90aWZ5IHdpbGwgcmVzdWx0IGluIGFuIGluY29tcGF0aWJsZSBwb2ludGVyIHR5cGUK
Y29tcGlsZXIgZXJyb3Igd2hlbiBidWlsZGluZyB3aXRoIENPTkZJR19EUk1fT01BUCBlbmFibGVk
OgoKZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vZHNzL2hkbWk1LmM6CnN0YXRpYyB2b2lkIGhkbWk1
X2JyaWRnZV9ocGRfbm90aWZ5KHN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2UsCiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3Is
CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGVudW0gZHJtX2Nvbm5lY3Rvcl9z
dGF0dXMgc3RhdHVzKQp7Ci4uLgpzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9icmlkZ2VfZnVuY3Mg
aGRtaTVfYnJpZGdlX2Z1bmNzID0gewouLi4KICAgICAgICAuaHBkX25vdGlmeSA9IGhkbWk1X2Jy
aWRnZV9ocGRfbm90aWZ5LAouLi4KfTsKCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczov
L3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjA5MjAtaHBkLWlycS1ldmVudHMtdjUtMC1mZjFk
ZTAwOTBjNzJAb3NzLnF1YWxjb21tLmNvbT9wYXJ0PTUKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4
LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
