Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F2ADC43458
	for <linux-amlogic@archiver.kernel.org>; Thu,  2 Jul 2026 15:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CovLmIjl4hSZOiRAnwQitYvGLgv/KB/sGL8jAUEMRhw=; b=5EQXGdaCnQGKXA
	Kpz1bYTaMhBkoXo3JlFnaLBAMvWzEfLiam6KREQxrZZe9wMSsLbQeKxU1HbrhZg9mEcsbhvT6valg
	msxzCi2BWz69BBOVFY+ukP5rkOFvbqws8Qgllzgjg/Cq3PjE3PPJ1Ib3GOmOj9GSP1NMBgvlISv3U
	cMrnYgjSykvorx8kT4HbxHuMmln+4SS7bB+DOQ9kZobWJVz242soDTQhYWR9grkW2+2U/UPBB4bWk
	YJsuOOH+SNR6R8IhNVYDlqDvgv0eqWQDIpS5piOAZIh4VU2LVovMyF30s3TUFz1CL8K9CblxnxgRj
	XNR7ckDvvzRtkG/N9m4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJo9-00000004tXk-2ojr;
	Thu, 02 Jul 2026 15:58:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJo7-00000004tXe-3glh
	for linux-amlogic@lists.infradead.org;
	Thu, 02 Jul 2026 15:58:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6AB7143792;
	Thu,  2 Jul 2026 15:58:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE5FC1F000E9;
	Thu,  2 Jul 2026 15:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783007911;
	bh=G1e7Ebgdly0AWGcesK5Bmyv5pIn6QOiASaDaQwBAU1U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bR/lwDvCMp3HKrPYvzG3wWWcS0Ao87a6ufVCjIlWzZoWiesYqQqBkcaZTUNHFl4FM
	 C5mzQbFdPz0NI0Pszz5HprONm4IdtV1AhF1XSuRyDZfkErAoUarnGfBgWEEAvpR0M6
	 uzKBqylcwj9oCBD9jaWi6ZNNeRwfPSJxgcRNVffkY+lm/DOSs3jprD69Sra/Nv4NL1
	 x/wZDrU8/JrqoolTdd2O6p/yfWj6xM23iqzd0Rd+HuugWyLel6zZHyRnGA+t6Lnp0H
	 YE1sIoWJ3kJ3ydDh0XX5BxFR9fPqJyL7ZB4AUes/n56NxQrzIqXSyVbZW7KXRfigdg
	 1O8zlr6ifIJdw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 11/11] lib/bitmap-str: get rid of
 cpumap_print_to_pagebuf()
To: "Yury Norov" <ynorov@nvidia.com>
Cc: linux-cxl@vger.kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev, linux-perf-users@vger.kernel.org, linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org, linux-pci@vger.kernel.org
In-Reply-To: <20260702154725.185376-12-ynorov@nvidia.com>
References: <20260702154725.185376-1-ynorov@nvidia.com>
 <20260702154725.185376-12-ynorov@nvidia.com>
Date: Thu, 02 Jul 2026 15:58:30 +0000
Message-Id: <20260702155830.EE5FC1F000E9@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0xvd10gVGhlIGZ1bmN0aW9uIGBj
cHVtYXBfcHJpbnRfdG9fcGFnZWJ1ZigpYCBpcyBkZWxldGVkIGJ1dCBzdGlsbCBjYWxsZWQgaW4g
YGRyaXZlcnMvZmlybXdhcmUvcHNjaS9wc2NpX2NoZWNrZXIuY2AsIGNhdXNpbmcgYSBidWlsZCBm
YWlsdXJlIGZvciBBUk0gY29uZmlndXJhdGlvbnMuCi0tCgpjb21taXQgOTA1ZDIzZmFhMjZjM2Rj
YWNjYjg4ZWRhM2I4NjI2MjU4MTQ3YzQ5NQpBdXRob3I6IFl1cnkgTm9yb3YgPHlub3JvdkBudmlk
aWEuY29tPgoKbGliL2JpdG1hcC1zdHI6IGdldCByaWQgb2YgY3B1bWFwX3ByaW50X3RvX3BhZ2Vi
dWYoKQoKVGhpcyBjb21taXQgcmVtb3ZlcyBjcHVtYXBfcHJpbnRfdG9fcGFnZWJ1ZigpLCBzdGF0
aW5nIHRoYXQgYWxsIHVzZXJzIG9mIHRoZQpmdW5jdGlvbiBoYXZlIGJlZW4gc3dpdGNoZWQgdG8g
YWx0ZXJuYXRpdmVzLgoKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9jcHVtYXNrLmggYi9p
bmNsdWRlL2xpbnV4L2NwdW1hc2suaAo+IC0tLSBhL2luY2x1ZGUvbGludXgvY3B1bWFzay5oCj4g
KysrIGIvaW5jbHVkZS9saW51eC9jcHVtYXNrLmgKClsgLi4uIF0KCj4gQEAgLTEzMTUsMjQgKzEz
MTQsNiBAQCBzdGF0aWMgX19hbHdheXNfaW5saW5lIGJvb2wgY3B1X2R5aW5nKHVuc2lnbmVkIGlu
dCBjcHUpCj4gIH0KPiAgI2VuZGlmIC8qIE5SX0NQVVMgPiBCSVRTX1BFUl9MT05HICovCj4gIAo+
IC0vKioKPiAtICogY3B1bWFwX3ByaW50X3RvX3BhZ2VidWYgIC0gY29waWVzIHRoZSBjcHVtYXNr
IGludG8gdGhlIGJ1ZmZlciBlaXRoZXIKPiAtICoJYXMgY29tbWEtc2VwYXJhdGVkIGxpc3Qgb2Yg
Y3B1cyBvciBoZXggdmFsdWVzIG9mIGNwdW1hc2sKPiAtICogQGxpc3Q6IGluZGljYXRlcyB3aGV0
aGVyIHRoZSBjcHVtYXAgbXVzdCBiZSBsaXN0Cj4gLSAqIEBtYXNrOiB0aGUgY3B1bWFzayB0byBj
b3B5Cj4gLSAqIEBidWY6IHRoZSBidWZmZXIgdG8gY29weSBpbnRvCj4gLSAqCj4gLSAqIFJldHVy
bjogdGhlIGxlbmd0aCBvZiB0aGUgKG51bGwtdGVybWluYXRlZCkgQGJ1ZiBzdHJpbmcsIHplcm8g
aWYKPiAtICogbm90aGluZyBpcyBjb3BpZWQuCj4gLSAqLwo+IC1zdGF0aWMgX19hbHdheXNfaW5s
aW5lIHNzaXplX3QKPiAtY3B1bWFwX3ByaW50X3RvX3BhZ2VidWYoYm9vbCBsaXN0LCBjaGFyICpi
dWYsIGNvbnN0IHN0cnVjdCBjcHVtYXNrICptYXNrKQo+IC17CgpbU2V2ZXJpdHk6IExvd10KV2ls
bCB0aGlzIHJlbW92YWwgY2F1c2UgYSBidWlsZCBicmVhayBmb3IgQVJNIGNvbmZpZ3VyYXRpb25z
PwoKSXQgYXBwZWFycyB0aGVyZSBpcyBzdGlsbCBhdCBsZWFzdCBvbmUgcmVtYWluaW5nIGNhbGxl
ciBvZiB0aGlzIGZ1bmN0aW9uCnRoYXQgd2FzIG5vdCBtaWdyYXRlZCBpbiBkcml2ZXJzL2Zpcm13
YXJlL3BzY2kvcHNjaV9jaGVja2VyLmM6Cgpkcml2ZXJzL2Zpcm13YXJlL3BzY2kvcHNjaV9jaGVj
a2VyLmM6aG90cGx1Z190ZXN0cygpIHsKICAgIC4uLgogICAgICAgIHNzaXplX3QgbGVuID0gY3B1
bWFwX3ByaW50X3RvX3BhZ2VidWYodHJ1ZSwgcGFnZV9idWYsCiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBjcHVfZ3JvdXBzW2ldKTsKICAgIC4uLgp9CgpEb2Vz
IHRoaXMgcmVtYWluaW5nIGNhbGxzaXRlIG5lZWQgdG8gYmUgdXBkYXRlZCB0byBhbiBhbHRlcm5h
dGl2ZSBiZWZvcmUKZHJvcHBpbmcgdGhlIGZ1bmN0aW9uPwoKPiAtCS8qIE9wZW5jb2RlIG9mZnNl
dF9pbl9wYWdlKGJ1ZikgdG8gbm90IGluY2x1ZGUgbGludXgvbW0uaCAqLwo+IC0JcmV0dXJuIHNj
bnByaW50ZihidWYsIFBBR0VfU0laRSAtICgodW5zaWduZWQgbG9uZylidWYgJiB+UEFHRV9NQVNL
KSwKPiAtCQkJIGxpc3QgPyAiJSpwYmxcbiIgOiAiJSpwYlxuIiwgY3B1bWFza19wcl9hcmdzKG1h
c2spKTsKPiAtfQoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYv
Iy9wYXRjaHNldC8yMDI2MDcwMjE1NDcyNS4xODUzNzYtMS15bm9yb3ZAbnZpZGlhLmNvbT9wYXJ0
PTExCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2lj
Cg==
