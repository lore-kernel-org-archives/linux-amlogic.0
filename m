Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 900C2C5DF98
	for <linux-amlogic@archiver.kernel.org>; Sat, 22 Aug 2026 10:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D6WSR9WwuoQqcjPuRVTMNo2fsKgfz1xVvHTeWIs7i+Q=; b=VY4JEmwY/b5Qsw
	yVDcuo9W/0XjXcpXs91QIs2XSaJqq69Tf8l4MftB58QARdqaZMQfG0bneP7Ju04nHUF6n0zoZRvu7
	ktCkZzg37UM1R0qpK26mwD1U1yrEkbG9khIh1R5OcTbNpQMj94MN/QptYGpS05l/zvHXEc5nH5EW+
	eCmh4mu+8qPT4R8YOCS0RqSRE0+X6bRPfxNNI7XKwOY5wLBp4+s7M6FFENfMZHld8Fkz+KQ+J6n09
	epUULhfx3xJCLqnvE5cs2DJYzfr5wrInlV//GrVqYjxBIo3Otn8Bz7rqoJIkW91Y4SewqYo347trj
	b2GxCjo+hjOamKn10yBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxie0-0000000ESD6-1aK4;
	Sat, 22 Aug 2026 10:08:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxidy-0000000ESCm-3qtf
	for linux-amlogic@lists.infradead.org;
	Sat, 22 Aug 2026 10:08:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 554F6600AA;
	Sat, 22 Aug 2026 10:08:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB3BC1F00A3D;
	Sat, 22 Aug 2026 10:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787393286;
	bh=/d8P7I7vfJQ0XS9w54AjTC92hEX2uM5eQCtR99DuSq8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PJ+BzHCecay9FzxuMPe090CXACpMULnVL3vv+ccX4Zx/9UadHu0xjiMsAYUsUFcET
	 Y6meGcfEK8qbB1X0hNxFlcbQG0PM3C8lgqnWY6JNni70KqAAW4yKnIEwvdNW9Vxlib
	 lTqtEbyPfXXbvW1KATtUhDuJQxD+3ZePAZKpwOeRMrjHNZ533fPx1IcsjvqGF8qx0L
	 QNN+Fj/89xhHtdWLtQ4rVA4iQgFdcV/e/Cd1a83oFtnal5EAPec1+q7Wbn/tvscvxN
	 k1mX6VPFYCzdaeM/5RWB6SL/rUbxSedlMOo83gLDDAxg8gGE9S+iH98jAQr+ZUoM/B
	 E86as0rXgmgiw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next 3/3] net: phy: air_en8811h: Make sure
 clk_init_data is fully initialized
To: "Geert Uytterhoeven" <geert+renesas@glider.be>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, neil.armstrong@linaro.org
In-Reply-To: <ebafac1803ee032ebd544a6ec5a1608c5630d81a.1787240118.git.geert+renesas@glider.be>
References: <cover.1787240118.git.geert+renesas@glider.be>
 <ebafac1803ee032ebd544a6ec5a1608c5630d81a.1787240118.git.geert+renesas@glider.be>
Date: Sat, 22 Aug 2026 10:08:05 +0000
Message-Id: <20260822100805.BB3BC1F00A3D@smtp.kernel.org>
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
IFtIaWdoXSBUaGUgUEhZIGRyaXZlciBjYWxscyB0aGUgZ2xvYmFsIGBjbGtfc2F2ZV9jb250ZXh0
KClgIGFuZCBgY2xrX3Jlc3RvcmVfY29udGV4dCgpYCBBUElzIGluIGl0cyBzdXNwZW5kIGFuZCBy
ZXN1bWUgcGF0aHMsIGZvcmNlZnVsbHkgc2F2aW5nIGFuZCByZXN0b3JpbmcgYWxsIGNsb2NrcyBp
biB0aGUgZW50aXJlIHN5c3RlbS4KLS0KCi0tLSBQYXRjaCBbM106IFtQQVRDSCBuZXQtbmV4dCAz
LzNdIG5ldDogcGh5OiBhaXJfZW44ODExaDogTWFrZSBzdXJlIGNsa19pbml0X2RhdGEgaXMgZnVs
bHkgaW5pdGlhbGl6ZWQgLS0tCmNvbW1pdCA2ODFhMzM3ODZlZjcyNGQxMGRjN2NlNGY3MjZlOGVj
ODk0OTY3ZWE0CkF1dGhvcjogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRl
ci5iZT4KCm5ldDogcGh5OiBhaXJfZW44ODExaDogTWFrZSBzdXJlIGNsa19pbml0X2RhdGEgaXMg
ZnVsbHkgaW5pdGlhbGl6ZWQKClRoZSBjbGtfaW5pdF9kYXRhIHN0cnVjdHVyZSBjb250YWlucyBz
ZXZlcmFsIG11dHVhbGx5LWV4Y2x1c2l2ZSBtZW1iZXJzCmZvciBkaWZmZXJlbnQgbWV0aG9kcyB0
byBzcGVjaWZ5IHRoZSBwb3NzaWJsZSBwYXJlbnRzIG9mIGEgY2xvY2ssCnByb21wdGluZyBkcml2
ZXJzIHRvIGluaXRpYWxpemUgb25seSB0aGUgbWVtYmVycyB0aGV5IG5lZWQuIEhvd2V2ZXIsCm5v
dCBpbml0aWFsaXppbmcgYWxsIG1lbWJlcnMgbWF5IGNhdXNlIHN1YnRsZSBpc3N1ZXMuIFRoaXMg
Y29tbWl0IG1ha2VzCnN1cmUgYWxsIG1lbWJlcnMgYXJlIGZ1bGx5IGluaXRpYWxpemVkLgoKPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvcGh5L2Fpcl9lbjg4MTFoLmMgYi9kcml2ZXJzL25ldC9w
aHkvYWlyX2VuODgxMWguYwo+IGluZGV4IGVkZDQ5YzE5M2U0NzYuLmQxYWI4NzQ0Mjg4YmIgMTAw
NjQ0Cj4gLS0tIGEvZHJpdmVycy9uZXQvcGh5L2Fpcl9lbjg4MTFoLmMKPiArKysgYi9kcml2ZXJz
L25ldC9waHkvYWlyX2VuODgxMWguYwoKWyAuLi4gXQoKPiBAQCAtMTAzMSw3ICsxMDMxLDcgQEAg
c3RhdGljIGNvbnN0IHN0cnVjdCBjbGtfb3BzIGVuODgxMWhfY2xrX29wcyA9IHsKPiAgCj4gIHN0
YXRpYyBpbnQgZW44ODExaF9jbGtfcHJvdmlkZXJfc2V0dXAoc3RydWN0IGRldmljZSAqZGV2LCBz
dHJ1Y3QgY2xrX2h3ICpodykKPiAgewo+IC0Jc3RydWN0IGNsa19pbml0X2RhdGEgaW5pdDsKPiAr
CXN0cnVjdCBjbGtfaW5pdF9kYXRhIGluaXQgPSB7fTsKPiAgCWludCByZXQ7Cj4gIAo+ICAJaWYg
KCFJU19FTkFCTEVEKENPTkZJR19DT01NT05fQ0xLKSkKCltTZXZlcml0eTogSGlnaF0KVGhpcyBp
c24ndCBhIGJ1ZyBpbnRyb2R1Y2VkIGJ5IHRoaXMgcGF0Y2gsIGJ1dCB3aGlsZSByZXZpZXdpbmcg
dGhpcyBkcml2ZXIncyAKY2xvY2sgaGFuZGxpbmcgSSBub3RpY2VkIGEgcG90ZW50aWFsIHBvd2Vy
IG1hbmFnZW1lbnQgaXNzdWUgZnVydGhlciBkb3duIGluIAp0aGUgZmlsZS4KCkluIGRyaXZlcnMv
bmV0L3BoeS9haXJfZW44ODExaC5jOgoKc3RhdGljIGludCBlbjg4MTFoX3Jlc3VtZShzdHJ1Y3Qg
cGh5X2RldmljZSAqcGh5ZGV2KQp7CgljbGtfcmVzdG9yZV9jb250ZXh0KCk7CgoJcmV0dXJuIGdl
bnBoeV9yZXN1bWUocGh5ZGV2KTsKfQoKc3RhdGljIGludCBlbjg4MTFoX3N1c3BlbmQoc3RydWN0
IHBoeV9kZXZpY2UgKnBoeWRldikKewoJY2xrX3NhdmVfY29udGV4dCgpOwoKCXJldHVybiBnZW5w
aHlfc3VzcGVuZChwaHlkZXYpOwp9CgpJcyBpdCBzYWZlIGZvciB0aGUgUEhZIGRyaXZlciB0byBj
YWxsIHRoZSBnbG9iYWwgY2xrX3NhdmVfY29udGV4dCgpIGFuZCAKY2xrX3Jlc3RvcmVfY29udGV4
dCgpIEFQSXMgZHVyaW5nIGl0cyBzdXNwZW5kIGFuZCByZXN1bWUgaGFuZGxlcnM/CgpUaGVzZSBB
UElzIGFyZSBpbnRlbmRlZCBmb3IgY29yZSBQTSBvcGVyYXRpb25zIGFuZCBpdGVyYXRlIG92ZXIg
dGhlIGVudGlyZSAKc3lzdGVtJ3MgY2xvY2sgdHJlZSB0byBzYXZlIG9yIHJlc3RvcmUgc3RhdGUg
Zm9yIGFsbCBjbG9ja3Mgc3lzdGVtLXdpZGUuCgpDb3VsZCByZXN0b3JpbmcgYWxsIGNsb2NrcyBn
bG9iYWxseSB3aGVuZXZlciB0aGlzIHNpbmdsZSBsZWFmIFBIWSByZXN1bWVzCmZvcmNlZnVsbHkg
cmVzZXQgb3IgZGlzcnVwdCB0aGUgY2xvY2tzIG9mIGNvbXBsZXRlbHkgdW5yZWxhdGVkIGRldmlj
ZXMsCnBvdGVudGlhbGx5IGNhdXNpbmcgc3lzdGVtIGxvY2t1cHMgb3IgY3Jhc2hlcz8KCi0tIApT
YXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvY292ZXIu
MTc4NzI0MDExOC5naXQuZ2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU/cGFydD0zCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxp
bmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
