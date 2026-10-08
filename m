Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80E15CA600B
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Oct 2026 14:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W8xc4DpewoQ2jJDxeEoFGRLWxUPYE96O4emIjuuuLD8=; b=F/Oer6bqNVyt07
	InTFZ52p8AuLSlgKtjtg7t0FiH0/tnneBIFaOx29vjpQpJhFZ8M7Y5ezITX0j630hnag6eu8BvwlC
	M1WadsJ9wLSl9p8ybQUgijLTKoFHt+UDY4cLsw1tUzkWyoWPDdXycGvz+lCxeaqZpj5fv0h/cbLG0
	xr1d0VQjmAqTgb30USvGE6904/+ZLBUKfGEeJtGZBYonRtToNiDJbCpdwjjn+dRRkG+/bjae7AmT4
	QIhWko1EKi+TuoRA52QzCnEiCX7VlWG6I0reUvhHJrcjabb0xpO6GnXgA/P3QmbHmi6XVPas6RBan
	U9Ihh2lTzCyQCAMstqiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEpFB-00000004YOj-0jKD;
	Thu, 08 Oct 2026 14:37:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEpF9-00000004YOH-3jUt
	for linux-amlogic@lists.infradead.org;
	Thu, 08 Oct 2026 14:37:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4135343E2C;
	Thu,  8 Oct 2026 14:37:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2FCF1F000FF;
	Thu,  8 Oct 2026 14:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791470231;
	bh=wmE4e7DX/iyXqZ/mx7KVXrMtFymYM+SQbgwbNKj+l5Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WgGkiYrF4hz0FokICtUH1HlAqlCZ0axptM2TdVnmPaNh+2mAyK93TMtb60RNs78Cr
	 Vz3S/cx+VGVmvE6REXc7g8vbqxlS9wEnaG9NQ+XZ0rSL6LPc0n2X9cYg2suSCx1a72
	 L557DCTvtjIs3skjg96ci7rfW1S8UXogVbceZVEfq5eu1WkSDmsCi0Ns/Sk0V+cE+E
	 gjoAuym9/HVzIR/BPvwQEZjwEGw7K/1XFZ90RI9LWXILriynYsMj2cfmsAQOFNuIW6
	 Xn9PG5Ibq2x4xoXga+9ADCxb2bTVhQ6OFOFfz4pc0ekRiY78ZWNiNF7swlFMVaDnY0
	 2V52Cq8cuGWNA==
Message-ID: <sashiko-outbox-164309@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] mmc: meson-gx: honour the busy timeout for R1b
 commands
To: "Igor Velkov" <iav@iav.lv>
Cc: linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org
In-Reply-To: <20261008-meson-gx-busy-timeout-v2-2-8bde1adfb5b4@iav.lv>
References: <20261008-meson-gx-busy-timeout-v2-0-8bde1adfb5b4@iav.lv>
 <20261008-meson-gx-busy-timeout-v2-2-8bde1adfb5b4@iav.lv>
Date: Thu, 08 Oct 2026 14:37:10 +0000
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0xvd10gbW1jOiBtZXNvbi1neDog
VUIgYW5kIHRydW5jYXRpb24gd2hlbiByb3VuZGluZyBodWdlIHRpbWVvdXQgYmVmb3JlIGNsYW1w
aW5nCi0tCgpjb21taXQgMjk4MjMxOTA3N2ZmOTc5MWMxYzU3NzIyZmVmMzBhYTViNzAyNjA3MQpB
dXRob3I6IElnb3IgVmVsa292IDxpYXZAaWF2Lmx2PgoKbW1jOiBtZXNvbi1neDogaG9ub3VyIHRo
ZSBidXN5IHRpbWVvdXQgZm9yIFIxYiBjb21tYW5kcwoKVGhpcyBjb21taXQgcHJvZ3JhbXMgdGhl
IENNRF9DRkcgdGltZW91dCBmaWVsZCB1c2luZyBjbWQtPmJ1c3lfdGltZW91dCBmb3IKUjFiIGNv
bW1hbmRzLiBJdCBhaW1zIHRvIHJlc29sdmUgYW4gaXNzdWUgd2hlcmUgdGhlIGNvbnRyb2xsZXIg
cHJlbWF0dXJlbHkKdGltZXMgb3V0IGR1cmluZyBsb25nIG9wZXJhdGlvbnMgbGlrZSBlcmFzZSBh
bmQgY2FjaGUgZmx1c2guIFRoZSBkcml2ZXIKY2FsY3VsYXRlcyB0aGUgdGltZW91dCBieSByb3Vu
ZGluZyB1cCB0byBhIHBvd2VyIG9mIHR3byBhbmQgY2xhbXBpbmcgaXQuCgo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL21tYy9ob3N0L21lc29uLWd4LW1tYy5jIGIvZHJpdmVycy9tbWMvaG9zdC9tZXNv
bi1neC1tbWMuYwo+IC0tLSBhL2RyaXZlcnMvbW1jL2hvc3QvbWVzb24tZ3gtbW1jLmMKPiArKysg
Yi9kcml2ZXJzL21tYy9ob3N0L21lc29uLWd4LW1tYy5jCgpbIC4uLiBdCgo+IEBAIC0yMTYsNiAr
MjE2LDIwIEBAIHN0YXRpYyB1bnNpZ25lZCBpbnQgbWVzb25fbW1jX2dldF90aW1lb3V0X21zZWNz
KHN0cnVjdCBtbWNfZGF0YSAqZGF0YSkKPiAgCXJldHVybiBtaW5fdCh1bnNpZ25lZCBpbnQsIHRp
bWVvdXQsIFNEX0VNTUNfQ01EX1RJTUVPVVRfTUFYKTsKPiAgfQo+ICAKPiArLyogRm9yIFIxYiB0
aGUgY29udHJvbGxlciB3YWl0cyBmb3IgYnVzeSB0byBiZSByZWxlYXNlZCB3aXRoaW4gdGhpcyB0
aW1lb3V0LiAqLwo+ICtzdGF0aWMgdW5zaWduZWQgaW50IG1lc29uX21tY19nZXRfY21kX3RpbWVv
dXRfbXNlY3Moc3RydWN0IG1tY19jb21tYW5kICpjbWQpCj4gK3sKPiArCXVuc2lnbmVkIGludCB0
aW1lb3V0ID0gY21kLT5idXN5X3RpbWVvdXQ7Cj4gKwo+ICsJaWYgKCF0aW1lb3V0KQo+ICsJCXJl
dHVybiBTRF9FTU1DX0NNRF9USU1FT1VUOwo+ICsKPiArCXRpbWVvdXQgPSByb3VuZHVwX3Bvd19v
Zl90d28odGltZW91dCk7Cj4gKwo+ICsJcmV0dXJuIGNsYW1wX3QodW5zaWduZWQgaW50LCB0aW1l
b3V0LCBTRF9FTU1DX0NNRF9USU1FT1VULAo+ICsJCSAgICAgICBTRF9FTU1DX0NNRF9USU1FT1VU
X01BWCk7Cj4gK30KCltTZXZlcml0eTogTG93XQpDb3VsZCBjbWQtPmJ1c3lfdGltZW91dCBob2xk
IGEgdmFsdWUgbGFyZ2UgZW5vdWdoIHRvIGNhdXNlIGFuIG92ZXJmbG93IGhlcmU/CgpTaW5jZSBj
bWQtPmJ1c3lfdGltZW91dCBpcyBhbiB1bnNpZ25lZCBpbnQgcmVwcmVzZW50aW5nIG1pbGxpc2Vj
b25kcywgaXQgY2FuCnBvdGVudGlhbGx5IGJlIGNvbnRyb2xsZWQgYnkgdXNlcnNwYWNlIHZpYSB0
aGUgTU1DX0lPQ19DTUQgaW9jdGwuIElmIGEgdXNlcgpwcm92aWRlcyBhIHRpbWVvdXQgZ3JlYXRl
ciB0aGFuIDB4ODAwMDAwMDAsIHBhc3NpbmcgaXQgdG8Kcm91bmR1cF9wb3dfb2ZfdHdvKCkgY2Fs
Y3VsYXRlcyAxVUwgPDwgMzIuCgpPbiAzMi1iaXQga2VybmVscywgc2hpZnRpbmcgYSAzMi1iaXQg
dW5zaWduZWQgbG9uZyBieSAzMiBiaXRzIGlzIHVuZGVmaW5lZApiZWhhdmlvci4gT24gNjQtYml0
IGtlcm5lbHMsIDFVTCA8PCAzMiBldmFsdWF0ZXMgdG8gMHgxMDAwMDAwMDAsIHdoaWNoIGlzCnRy
dW5jYXRlZCB0byAwIHdoZW4gYXNzaWduZWQgYmFjayB0byB0aGUgdW5zaWduZWQgaW50IHRpbWVv
dXQgdmFyaWFibGUuCgpUaGUgc3Vic2VxdWVudCBjbGFtcF90KCkgY2FsbCB3b3VsZCByZWNlaXZl
IDAgKG9yIGEgZ2FyYmFnZSB2YWx1ZSBvbiAzMi1iaXQKc3lzdGVtcykgYW5kIGluY29ycmVjdGx5
IHJldHVybiB0aGUgbWluaW11bSB0aW1lb3V0IGluc3RlYWQgb2YgdGhlIG1heGltdW0KdGltZW91
dC4gVGhpcyBtaWdodCBsZWFkIHRvIGEgcHJlbWF0dXJlIGhhcmR3YXJlIHRpbWVvdXQgb24gdmFs
aWQgbG9uZwpjb21tYW5kcy4KCldvdWxkIGl0IGJlIHNhZmVyIHRvIGNsYW1wIHRoZSB2YWx1ZSB0
byBTRF9FTU1DX0NNRF9USU1FT1VUX01BWCBiZWZvcmUKcm91bmRpbmcgaXQgdG8gYSBwb3dlciBv
ZiB0d28sIGVuc3VyaW5nIGl0IHN0YXlzIHdlbGwgd2l0aGluIGJvdW5kcz8KCi0tIApTYXNoaWtv
IEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjEwMDgtbWVz
b24tZ3gtYnVzeS10aW1lb3V0LXYyLTAtOGJkZTFhZGZiNWI0QGlhdi5sdj9wYXJ0PTIKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMg
bWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
