Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9464CD8C8C
	for <linux-amlogic@archiver.kernel.org>; Sun,  7 Jun 2026 21:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ub4KzYB7NIXSeXWaSyrt3KAIgMwElyEjUjXh+nsK4FM=; b=FLi0EjpgaEiAsN
	Ld8BKMDi3o875ubZKYrue4TrxqAzuB5JFm8RNtIfa5g6YBoZpsoDbGp3XVbS36l8CzczKqmA9tch3
	uqvno6SLMBMHmAia7IgwkYsYPDsHjCbO7ZwWUaVnMGmGEi35Z9cH0bltsKtGpfz20oPWeph1/4Y+B
	2EILpcnpdLkIcWL7eDDLaWj9YCym+zZMhr48BWcsayV2jramcr81YCk/i14N9D/yAAfC0VST5jHH1
	9yjTvQPh2HWscyDgXl4A0syQkOMTNOCZPXzRJGYEheGfz64git1nPZ3Bq5O3QYDXPpkxFNZEZtkri
	OCx13ac5BWDinDx1qd8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWLM8-00000002X2n-1B0T;
	Sun, 07 Jun 2026 21:48:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWLM6-00000002X2Z-3Jzu
	for linux-amlogic@lists.infradead.org;
	Sun, 07 Jun 2026 21:48:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3FEEB60018;
	Sun,  7 Jun 2026 21:48:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B05091F00893;
	Sun,  7 Jun 2026 21:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780868910;
	bh=U8/nAEIUsIEuWNhzHG7THuc153jQDkJAzRdpq4tLzZM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kCkTKb1D/8B8+RSIzStZbrpXcdbecpV33zyZzGdOB90Bdp7QyfyKCLE8X63+liL42
	 cxYuLgXeVh2VydzTqidijq9JOD76nvMULXEu6u3FGSaMIYV2uzeu55c+3FZ8dbNme4
	 4G+XElSTMlTqh1aro4r4WmnhxccJ8rTSXbZGEOGkoygNRj8HPfKPF/fnR2y95nFaBc
	 J05GfWPDVX3UjKmWky6GiXyswbC89esphgTKrIiMqv+bvnu+s7aZymt5xbQxMwVOHz
	 srBVtiLCO4R6QjLcht9vvhfXT+O/h54JWgYqzK7CkCnG8PLsOxKgN+I3cc42LJVyXS
	 IFiwDAT7TS36Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 6/8] drm/msm: dp: handle the IRQ_HPD events reported
 by USB-C
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org, neil.armstrong@linaro.org
In-Reply-To: <20260608-hpd-irq-events-v4-6-30b62b335487@oss.qualcomm.com>
References: <20260608-hpd-irq-events-v4-6-30b62b335487@oss.qualcomm.com>
Date: Sun, 07 Jun 2026 21:48:29 +0000
Message-Id: <20260607214829.B05091F00893@smtp.kernel.org>
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
MiBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6CgpOZXcgaXNzdWVzOgotIFtIaWdoXSBJ
bml0aWFsIGNvbm5lY3Rpb24gYW5kIHJlcGx1ZyBldmVudHMgYXJlIGluY29ycmVjdGx5IGJ5cGFz
c2VkIGlmIGFjY29tcGFuaWVkIGJ5IGFuIElSUV9IUEQgc3RhdHVzLCBsZWF2aW5nIHRoZSBkaXNw
bGF5IGRpc2Nvbm5lY3RlZC4KClByZS1leGlzdGluZyBpc3N1ZXM6Ci0gW0hpZ2hdIGBtc21fZHBf
aXJxX2hwZF9oYW5kbGVgIG1vZGlmaWVzIHNoYXJlZCBzdGF0ZSB3aXRob3V0IGFjcXVpcmluZyBg
ZHAtPnBsdWdnZWRfbG9ja2AsIGxlYWRpbmcgdG8gdW5wcm90ZWN0ZWQgY29uY3VycmVudCBtb2Rp
ZmljYXRpb24gb2YgRFBDRCBhbmQgbGluayBzdGF0ZS4KLS0KCmNvbW1pdCA0OGE3ODM1OGFlOTgw
MjBmZjM5OTNhYWIzMjUwZGQ4YzMyY2M2ODM1CkF1dGhvcjogRG1pdHJ5IEJhcnlzaGtvdiA8ZG1p
dHJ5LmJhcnlzaGtvdkBvc3MucXVhbGNvbW0uY29tPgoKZHJtL21zbTogZHA6IGhhbmRsZSB0aGUg
SVJRX0hQRCBldmVudHMgcmVwb3J0ZWQgYnkgVVNCLUMKClRoaXMgcGF0Y2ggYWRkcyBzdXBwb3J0
IGZvciB0cmFja2luZyBhbmQgaGFuZGxpbmcgSVJRX0hQRCBldmVudHMKZGVsaXZlcmVkIG92ZXIg
b3V0LW9mLWJhbmQgZXZlbnRzIChzdWNoIGFzIFVTQi1DIEFsdE1vZGUgaGFuZGxlcnMpCmluIHRo
ZSBNU00gRGlzcGxheVBvcnQgZHJpdmVyLgoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L21zbS9kcC9kcF9kaXNwbGF5LmMgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2RwL2RwX2Rpc3BsYXku
Ywo+IGluZGV4IGMwZjZhOGZmOWI5OWQuLjc0M2Q4ZmE0MGRjNjggMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL21zbS9kcC9kcF9kaXNwbGF5LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
bXNtL2RwL2RwX2Rpc3BsYXkuYwo+IEBAIC0xNTMzLDExICsxNTMzLDEyIEBAIHZvaWQgbXNtX2Rw
X2JyaWRnZV9ocGRfbm90aWZ5KHN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2UsCj4gIAkJICAgbXNt
X2RwX2Rpc3BsYXktPmNvbm5lY3Rvcl90eXBlLCBocGRfbGlua19zdGF0dXMsIHN0YXR1cyk7Cj4g
IAo+ICAJaWYgKHN0YXR1cyA9PSBjb25uZWN0b3Jfc3RhdHVzX2Nvbm5lY3RlZCkgewo+IC0JCWlm
IChocGRfbGlua19zdGF0dXMgPT0gSVNSX0hQRF9SRVBMVUdfQ09VTlQpIHsKPiArCQlpZiAoaHBk
X2xpbmtfc3RhdHVzID09IElTUl9JUlFfSFBEX1BVTFNFX0NPVU5UIHx8Cj4gKwkJICAgIGV4dHJh
X3N0YXR1cyA9PSBEUk1fQ09OTkVDVE9SX0RQX0lSUV9IUEQpIHsKPiArCQkJbXNtX2RwX2lycV9o
cGRfaGFuZGxlKGRwKTsKCltTZXZlcml0eTogSGlnaF0KVGhpcyBpcyBhIHByZS1leGlzdGluZyBp
c3N1ZSwgYnV0IGRvZXMgbXNtX2RwX2lycV9ocGRfaGFuZGxlKCkgbmVlZCB0bwphY3F1aXJlIHRo
ZSBkcC0+cGx1Z2dlZF9sb2NrPwoKU2luY2UgbXNtX2RwX2lycV9ocGRfaGFuZGxlKCkgY2FuIGNh
bGwgbXNtX2RwX2Rpc3BsYXlfcHJvY2Vzc19ocGRfaGlnaCgpLAp3aGljaCByZWFkcyBmcm9tIERQ
Q0QgYW5kIG1vZGlmaWVzIHNoYXJlZCBkcml2ZXIgc3RhdGUgKGxpa2UKZHAtPmxpbmstPmx0dHBy
X2NvdW50LCBkcC0+cGFuZWwtPmRwY2QsIGFuZCBkcC0+YXVkaW9fc3VwcG9ydGVkKSwgaXQgc2Vl
bXMKbGlrZSBpdCBjb3VsZCByYWNlLiBPdGhlciBIUEQgaGFuZGxlcnMgbGlrZSBtc21fZHBfaHBk
X3BsdWdfaGFuZGxlKCkgdXNlCmd1YXJkKG11dGV4KSgmZHAtPnBsdWdnZWRfbG9jaykgdG8gc2Fm
ZWx5IHN5bmNocm9uaXplIGFjY2Vzcy4KCldpdGggb3V0LW9mLWJhbmQgZXZlbnRzIHByb2Nlc3Nl
ZCB2aWEgd29ya3F1ZXVlcywgY2FuIHRoaXMgZnVuY3Rpb24KcnVuIGNvbmN1cnJlbnRseSB3aXRo
IG90aGVyIEhQRCBoYW5kbGVycyBvciBtc21fZHBfYnJpZGdlX2RldGVjdCgpIGFuZApjb3JydXB0
IHRoZSBpbnRlcm5hbCByZXByZXNlbnRhdGlvbiBvZiB0aGUgaGFyZHdhcmUgY29uZmlndXJhdGlv
bj8KCltTZXZlcml0eTogSGlnaF0KSWYgYW4gb3V0LW9mLWJhbmQgaGFuZGxlciByZXBvcnRzIGFu
IGluaXRpYWwgY29ubmVjdGlvbiB3aXRoIGJvdGggaHBkX3N0YXRlPTEKYW5kIGhwZF9pcnE9MSBz
aW11bHRhbmVvdXNseSwgZG9lcyB0aGlzIG5ldyBvcmRlcmluZyBieXBhc3MgdGhlIHJlcXVpcmVk
IHBsdWcKc2VxdWVuY2U/CgpCeSBwbGFjaW5nIHRoZSBJUlFfSFBEIGNoZWNrIGF0IHRoZSB0b3Ag
b2YgdGhlIGlmL2Vsc2UgY2hhaW4sIGlmCmV4dHJhX3N0YXR1cyA9PSBEUk1fQ09OTkVDVE9SX0RQ
X0lSUV9IUEQsIHRoZSBjb2RlIHdpbGwgZXhlY3V0ZQptc21fZHBfaXJxX2hwZF9oYW5kbGUoKSBh
bmQgc2tpcCBtc21fZHBfaHBkX3BsdWdfaGFuZGxlKCkuCgpJZiBtc21fZHBfaHBkX3BsdWdfaGFu
ZGxlKCkgaXMgc2tpcHBlZCwgZHAtPnBsdWdnZWQgcmVtYWlucyBmYWxzZSwgUEhZCmluaXRpYWxp
emF0aW9uIChtc21fZHBfZGlzcGxheV9ob3N0X3BoeV9pbml0KSBuZXZlciBvY2N1cnMsIGFuZApt
c21fZHBfYXV4X2VuYWJsZV94ZmVycygpIGlzIG5ldmVyIGNhbGxlZC4gV29uJ3QgdGhlIHN1YnNl
cXVlbnQgQVVYIHJlYWRzCndpdGhpbiBtc21fZHBfaXJxX2hwZF9oYW5kbGUoKSBmYWlsIHdpdGgg
LUVOWElPLCBhYm9ydGluZyB0aGUgaW5pdGlhbGl6YXRpb24KYW5kIGxlYXZpbmcgdGhlIGRpc3Bs
YXkgZGlzY29ubmVjdGVkPwoKPiArCQl9IGVsc2UgaWYgKGhwZF9saW5rX3N0YXR1cyA9PSBJU1Jf
SFBEX1JFUExVR19DT1VOVCkgewo+ICAJCQltc21fZHBfaHBkX3VucGx1Z19oYW5kbGUoZHApOwo+
ICAJCQltc21fZHBfaHBkX3BsdWdfaGFuZGxlKGRwKTsKPiAtCQl9IGVsc2UgaWYgKGhwZF9saW5r
X3N0YXR1cyA9PSBJU1JfSVJRX0hQRF9QVUxTRV9DT1VOVCkgewo+IC0JCQltc21fZHBfaXJxX2hw
ZF9oYW5kbGUoZHApOwo+ICAJCX0gZWxzZSB7Cj4gIAkJCW1zbV9kcF9ocGRfcGx1Z19oYW5kbGUo
ZHApOwo+ICAJCX0KCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2
LyMvcGF0Y2hzZXQvMjAyNjA2MDgtaHBkLWlycS1ldmVudHMtdjQtMC0zMGI2MmIzMzU0ODdAb3Nz
LnF1YWxjb21tLmNvbT9wYXJ0PTYKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LWFtbG9naWMK
