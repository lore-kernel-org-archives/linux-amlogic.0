Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2DF6C982E1
	for <linux-amlogic@archiver.kernel.org>; Sun, 20 Sep 2026 15:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i6WgmkYfrxnOnjYi7xsL9S+V17DxvBpsAokmHrTkn1U=; b=kgnVuslno6sKsh
	yvQ00ZRdHFGL1lsNq9FStVEcAkJ0gmHHybEYAk0VpZJbUK8zPk76xy/ncYTbreOrCmPPqqy4umgUp
	AW7Woyiw+b5N5NSncpxNyhf9jB1fMmwMMLK2+y6FoMRan5BO7ycdFDLA4v8Q3sc48+AYMCnSjbjer
	AeKgcByEm3SDhMuUzQgNR4/9muYWJu/8Ixndd3/8p3vuD7ROe6pNHS9Z/pOZiqW/jqmnEcgxtHYE6
	lHlXtordI9azIxt6roWJG7b/KfkluwEMODZfmt1SDtWyjGtE9IsLBNLeRcmJHK8Fv395s8BGt5/Fm
	1Y/P+jK1ArR6Mn8epb7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8JEu-000000002oP-3HyT;
	Sun, 20 Sep 2026 15:14:00 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8JEt-000000002o0-0uSO
	for linux-amlogic@lists.infradead.org;
	Sun, 20 Sep 2026 15:13:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 57CEF601DB;
	Sun, 20 Sep 2026 15:13:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9CB21F000FF;
	Sun, 20 Sep 2026 15:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789917238;
	bh=uskhW3QppAJj/1NNU0uiHhxLbJ4x1v2R7+YF0xtUvtg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FRXCrKeLMKGkj+arWmRQtuiFHeB3QY/j1SduJ/TVNI4W2RggCrvr0uEWX9dotct5Q
	 3umdAR8vVG+bimbJkxWItMf+LxqXP//1b9S8HX9ntgXMkTaWc1eOCb9jsOT9tGkh7r
	 3dJucHw2x+bWxrJl1uFKRdoqqJYok0UPM1rCAp6r9aojSRCHm2lFcy7i5bLtJFvU7o
	 5zHAQfWdyQjVacHPSp1XJ40e/l6nm4DnEBFj25RBFXuCSxIlzF/vRmElqN8nxlOa8H
	 s+xW3oUAzaUQQT/uooAtBSXuh22jLCwttheetYZGCIVCrh35J9ps5M72TOlH+Zh/92
	 6ZPKaN2ncjrGg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 6/8] drm/msm: dp: handle the IRQ_HPD events reported
 by USB-C
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-amlogic@lists.infradead.org, intel-xe@lists.freedesktop.org, neil.armstrong@linaro.org, dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
In-Reply-To: <20260920-hpd-irq-events-v5-6-ff1de0090c72@oss.qualcomm.com>
References: <20260920-hpd-irq-events-v5-0-ff1de0090c72@oss.qualcomm.com>
 <20260920-hpd-irq-events-v5-6-ff1de0090c72@oss.qualcomm.com>
Date: Sun, 20 Sep 2026 15:13:57 +0000
Message-Id: <20260920151357.A9CB21F000FF@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIGRybS9tc20vZHA6IG1p
c3NpbmcgZGlzcGxheSBpbml0aWFsaXphdGlvbiBvbiBjb2FsZXNjZWQgcGx1ZyBhbmQgSVJRX0hQ
RCBldmVudHMKLS0KCmNvbW1pdCBkZTk2OWYzMDE2MDA4ZmNiNTVlMGIzODBjYjhlMGM3MzNjNzE5
NTQzCkF1dGhvcjogRG1pdHJ5IEJhcnlzaGtvdiA8ZG1pdHJ5LmJhcnlzaGtvdkBvc3MucXVhbGNv
bW0uY29tPgoKZHJtL21zbTogZHA6IGhhbmRsZSB0aGUgSVJRX0hQRCBldmVudHMgcmVwb3J0ZWQg
YnkgVVNCLUMKClRoaXMgY29tbWl0IGFsbG93cyB0aGUgTVNNIERpc3BsYXlQb3J0IGRyaXZlciB0
byBoYW5kbGUgSVJRX0hQRCBldmVudHMKZGVsaXZlcmVkIG92ZXIgT09CIGV2ZW50cyAobGlrZSBV
U0ItQyBBbHRNb2RlKS4KCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZHAvZHBf
ZGlzcGxheS5jIGIvZHJpdmVycy9ncHUvZHJtL21zbS9kcC9kcF9kaXNwbGF5LmMKPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vbXNtL2RwL2RwX2Rpc3BsYXkuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9tc20vZHAvZHBfZGlzcGxheS5jCj4gQEAgLTE1NTksMTEgKzE1NTksMTIgQEAgdm9pZCBtc21f
ZHBfYnJpZGdlX2hwZF9ub3RpZnkoc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSwKWyAuLi4gXQo+
ICAJaWYgKHN0YXR1cyA9PSBjb25uZWN0b3Jfc3RhdHVzX2Nvbm5lY3RlZCkgewo+IC0JCWlmICho
cGRfbGlua19zdGF0dXMgPT0gSVNSX0hQRF9SRVBMVUdfQ09VTlQpIHsKPiArCQlpZiAoaHBkX2xp
bmtfc3RhdHVzID09IElTUl9JUlFfSFBEX1BVTFNFX0NPVU5UIHx8Cj4gKwkJICAgIGV2ZW50ID09
IERSTV9DT05ORUNUT1JfRFBfSVJRX0hQRCkgewo+ICsJCQltc21fZHBfaXJxX2hwZF9oYW5kbGUo
ZHApOwo+ICsJCX0gZWxzZSBpZiAoaHBkX2xpbmtfc3RhdHVzID09IElTUl9IUERfUkVQTFVHX0NP
VU5UKSB7Cj4gIAkJCW1zbV9kcF9ocGRfdW5wbHVnX2hhbmRsZShkcCk7Cj4gIAkJCW1zbV9kcF9o
cGRfcGx1Z19oYW5kbGUoZHApOwo+IC0JCX0gZWxzZSBpZiAoaHBkX2xpbmtfc3RhdHVzID09IElT
Ul9JUlFfSFBEX1BVTFNFX0NPVU5UKSB7Cj4gLQkJCW1zbV9kcF9pcnFfaHBkX2hhbmRsZShkcCk7
Cj4gIAkJfSBlbHNlIHsKPiAgCQkJbXNtX2RwX2hwZF9wbHVnX2hhbmRsZShkcCk7Cj4gIAkJfQoK
W1NldmVyaXR5OiBIaWdoXQpEb2VzIHRoaXMgY29kZSBoYW5kbGUgY29hbGVzY2VkIGNvbm5lY3Rp
b24gYW5kIElSUV9IUEQgZXZlbnRzIGNvcnJlY3RseT8KCklmIHRoZSBVU0IgVHlwZS1DIEFsdE1v
ZGUgZHJpdmVyIGNvYWxlc2NlcyBhbiBpbml0aWFsIGNvbm5lY3Rpb24gYW5kIGEgcGVuZGluZwpJ
UlFfSFBEIGV2ZW50IGludG8gYSBzaW5nbGUgbm90aWZpY2F0aW9uLCBtc21fZHBfYnJpZGdlX2hw
ZF9ub3RpZnkoKSByZWNlaXZlcwpib3RoIHN0YXR1cyA9PSBjb25uZWN0b3Jfc3RhdHVzX2Nvbm5l
Y3RlZCBhbmQgZXZlbnQgPT0KRFJNX0NPTk5FQ1RPUl9EUF9JUlFfSFBELgoKVGhlIG11dHVhbCBl
eGNsdXNpb24gYmxvY2sgaW4gZHJpdmVycy9ncHUvZHJtL21zbS9kcC9kcF9kaXNwbGF5LmMgcHJp
b3JpdGl6ZXMKZXZlbnQgPT0gRFJNX0NPTk5FQ1RPUl9EUF9JUlFfSFBELCBicmFuY2hpbmcgdG8g
bXNtX2RwX2lycV9ocGRfaGFuZGxlKCkgYW5kCmVudGlyZWx5IHNraXBwaW5nIG1zbV9kcF9ocGRf
cGx1Z19oYW5kbGUoKS4KCkJlY2F1c2UgbXNtX2RwX2hwZF9wbHVnX2hhbmRsZSgpIGlzIHNraXBw
ZWQsIGRwLT5wbHVnZ2VkIHJlbWFpbnMgZmFsc2UsCnRoZSBEUCBQSFkgaXMgbm90IGluaXRpYWxp
emVkLCBhbmQgQVVYIHRyYW5zZmVycyByZW1haW4gZGlzYWJsZWQuIFRoZQpzdWJzZXF1ZW50IG1z
bV9kcF9pcnFfaHBkX2hhbmRsZSgpIHRoZW4gYXR0ZW1wdHMgYW4gQVVYIHJlYWQgd2hpY2ggaW1t
ZWRpYXRlbHkKZmFpbHMgd2l0aCAtRU5YSU8sIGFiYW5kb25pbmcgdGhlIGluaXRpYWxpemF0aW9u
IGFuZCBsZWF2aW5nIHRoZSBkaXNwbGF5CmJsYW5rLgoKSXMgaXQgcG9zc2libGUgdG8gZW5zdXJl
IG1zbV9kcF9ocGRfcGx1Z19oYW5kbGUoKSBpcyBzdGlsbCBjYWxsZWQgd2hlbiBhIG5ldwpjb25u
ZWN0aW9uIG9jY3VycyBhbG9uZ3NpZGUgYW4gSVJRX0hQRCBldmVudD8KCi0tIApTYXNoaWtvIEFJ
IHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjA5MjAtaHBkLWly
cS1ldmVudHMtdjUtMC1mZjFkZTAwOTBjNzJAb3NzLnF1YWxjb21tLmNvbT9wYXJ0PTYKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMg
bWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
