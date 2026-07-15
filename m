Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A855AC44508
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 Jul 2026 18:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y1atujk5/Fu0WcVFy9y7r2j9300ftSarJcy/FNzv2eA=; b=xylk+taaD1fIO7
	8a7LlwWWXeBKhX81ESX1k5pji+aJn3lZYtKLDSl5l2JMp3YtA1mPC3F5lvHnh9Yx86Q5y7i2vqw9f
	2uXyP/4XUf23wJqAEI9jOR3YiT9ERF+ene5jEeQiERlZsRRT0ZxPwQTzNhQwDK3xw8rYRdDQiAbMK
	5F/PkcssDdf0Dh8z7t8X39Lkz7ycyDwMYu/V1tgTO5TINGj9+T8GCoC+hz/kH2AkDgKOG0q2Nwxz6
	OohgSPFyeJGusyITQNWRPb1DUCm83Uw9yEb5hCkorWRpNKsZRzaDnJerQXZ2Q4GjvuR4g0m7zvdx/
	xuPwhHbawsSg9LBhxA/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk40S-0000000FddP-0t8n;
	Wed, 15 Jul 2026 18:06:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk40F-0000000FdPh-1RcU
	for linux-amlogic@lists.infradead.org;
	Wed, 15 Jul 2026 18:06:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B7B144396C;
	Wed, 15 Jul 2026 18:06:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E0011F00A3A;
	Wed, 15 Jul 2026 18:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784138798;
	bh=RyLal9196BZ0JxNLdnbSmDvpEiX9jdOjAkyfP2izTK0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=W/iTq+b2qwbKPOA29pPHoCFaN5Vb4droj6txZ/QuW86q3sjXP18k8FRB6raCwtZva
	 dyZ3coK8rWjNlRbJBnBalJLROqJVFMkf0ZPLhCohC4+Yn84KXeobHBQmt1hVEG/lsp
	 D9SgOupyKKCdxmWXP4SGUMQitBXWNCYReNMNM6Knepen10/S6aqs3iPq0gofYEStGZ
	 lScUrnGtvHDYWid10kipgBwCZ4a3qMe8wjAjhSrqOkMcl+PXb3eDgOSubC30cRBC+q
	 f0SrMO+T8UMURISnuM50PAH0UdK8dJtk4e8cDCz1Ly51qHtHFEOK+woXVq2wMYO3Ys
	 VYdN+xQZuwUaQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 6/8] firmware: meson_sm: make reg_write callback take
 const void *
To: "Link Mauve" <linkmauve@linkmauve.fr>
Cc: lee@kernel.org, "Alexandre Belloni" <alexandre.belloni@bootlin.com>, neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org, mfd@lists.linux.dev, imx@lists.linux.dev, ojeda@kernel.org, Frank.Li@kernel.org, linux-sunxi@lists.linux.dev, linux-rtc@vger.kernel.org
In-Reply-To: <20260715175229.24672-7-linkmauve@linkmauve.fr>
References: <20260715175229.24672-1-linkmauve@linkmauve.fr>
 <20260715175229.24672-7-linkmauve@linkmauve.fr>
Date: Wed, 15 Jul 2026 18:06:37 +0000
Message-Id: <20260715180638.0E0011F00A3A@smtp.kernel.org>
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
IFtIaWdoXSBDb25jdXJyZW50IGNhbGxzIHRvIGBtZXNvbl9zbV9jYWxsX3dyaXRlYCBvciBgbWVz
b25fc21fY2FsbF9yZWFkYCB3aWxsIGNvcnJ1cHQgdGhlIHNoYXJlZCBJT01FTSBidWZmZXIuCi0t
CgotLS0gUGF0Y2ggWzZdOiBbUEFUQ0ggNi84XSBmaXJtd2FyZTogbWVzb25fc206IG1ha2UgcmVn
X3dyaXRlIGNhbGxiYWNrIHRha2UgY29uc3Qgdm9pZCAqIC0tLQpjb21taXQgMDU5MDNmYzIyM2Jl
YzViMDRmNDk3YzhiNGJmNjZjNGM2ZDkwZWJmZQpBdXRob3I6IExpbmsgTWF1dmUgPGxpbmttYXV2
ZUBsaW5rbWF1dmUuZnI+CgpmaXJtd2FyZTogbWVzb25fc206IG1ha2UgcmVnX3dyaXRlIGNhbGxi
YWNrIHRha2UgY29uc3Qgdm9pZCAqCgpUaGlzIGNvbW1pdCB1cGRhdGVzIHRoZSBtZXNvbl9zbV9j
YWxsX3dyaXRlIGNhbGxiYWNrIGFuZCBpdHMgaGVhZGVyCmRlY2xhcmF0aW9uIHRvIHRha2UgYSBj
b25zdCB2b2lkICogYnVmZmVyLiBUaGlzIGFsaWducyB3aXRoIGEgcHJldmlvdXMKY2hhbmdlIHRv
IHRoZSBudm1lbV9jb25maWcgQVBJIHRoYXQgc3dpdGNoZWQgZnJvbSBhIG11dGFibGUgdG8gYW4K
aW1tdXRhYmxlIGRhdGEgcG9pbnRlci4KCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZmlybXdhcmUv
bWVzb24vbWVzb25fc20uYyBiL2RyaXZlcnMvZmlybXdhcmUvbWVzb24vbWVzb25fc20uYwo+IGlu
ZGV4IGFiOTc1MWE1OWI1NTIuLjVkNGRhMmUzYzNhOTQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9m
aXJtd2FyZS9tZXNvbi9tZXNvbl9zbS5jCj4gKysrIGIvZHJpdmVycy9maXJtd2FyZS9tZXNvbi9t
ZXNvbl9zbS5jCj4gQEAgLTE5Niw3ICsxOTYsNyBAQCBFWFBPUlRfU1lNQk9MKG1lc29uX3NtX2Nh
bGxfcmVhZCk7Cj4gICAqCj4gICAqIFJldHVybjoJc2l6ZSBvZiBzZW50IGRhdGEgb24gc3VjY2Vz
cywgYSBuZWdhdGl2ZSB2YWx1ZSBvbiBlcnJvcgo+ICAgKi8KPiAtaW50IG1lc29uX3NtX2NhbGxf
d3JpdGUoc3RydWN0IG1lc29uX3NtX2Zpcm13YXJlICpmdywgdm9pZCAqYnVmZmVyLAo+ICtpbnQg
bWVzb25fc21fY2FsbF93cml0ZShzdHJ1Y3QgbWVzb25fc21fZmlybXdhcmUgKmZ3LCBjb25zdCB2
b2lkICpidWZmZXIsCj4gIAkJCXVuc2lnbmVkIGludCBzaXplLCB1bnNpZ25lZCBpbnQgY21kX2lu
ZGV4LCB1MzIgYXJnMCwKPiAgCQkJdTMyIGFyZzEsIHUzMiBhcmcyLCB1MzIgYXJnMywgdTMyIGFy
ZzQpCj4gIHsKClsgLi4uIF0KCj4gIAltZW1jcHkoZnctPnNtX3NobWVtX2luX2Jhc2UsIGJ1ZmZl
ciwgc2l6ZSk7Cj4gIAo+ICAJaWYgKG1lc29uX3NtX2NhbGwoZncsIGNtZF9pbmRleCwgJndyaXR0
ZW4sIGFyZzAsIGFyZzEsIGFyZzIsIGFyZzMsIGFyZzQpIDwgMCkKPiAgCQlyZXR1cm4gLUVJTlZB
TDsKCltTZXZlcml0eTogSGlnaF0KVGhpcyBpc24ndCBhIGJ1ZyBpbnRyb2R1Y2VkIGJ5IHRoaXMg
cGF0Y2gsIGJ1dCBkb2VzIHRoaXMgZnVuY3Rpb24gbmVlZApsb2NraW5nIHRvIHByb3RlY3QgdGhl
IHNoYXJlZCBJT01FTSBidWZmZXI/CgpJdCBhcHBlYXJzIHRoYXQgY29uY3VycmVudCBjYWxscyB0
byBtZXNvbl9zbV9jYWxsX3dyaXRlKCkgb3IKbWVzb25fc21fY2FsbF9yZWFkKCkgY291bGQgY29y
cnVwdCB0aGUgc2hhcmVkIHNtX3NobWVtX2luX2Jhc2UgYW5kCnNtX3NobWVtX291dF9iYXNlIGJ1
ZmZlcnMuIElmIG11bHRpcGxlIHRocmVhZHMgY29uY3VycmVudGx5IHdyaXRlIG9yIHJlYWQKdGhl
IG52bWVtIHN5c2ZzIGZpbGVzLCB0aGV5IG1pZ2h0IG92ZXJ3cml0ZSBlYWNoIG90aGVyJ3MgcGF5
bG9hZHMgYmVmb3JlCnRoZSBTTUMgZXhlY3V0ZXMsIHNlbmRpbmcgY29ycnVwdGVkIGRhdGEgdG8g
dGhlIFNlY3VyZSBNb25pdG9yLgoKQSBzaW1pbGFyIHBhdHRlcm4gZXhpc3RzIGluIG1lc29uX3Nt
X2NhbGxfcmVhZCgpOgoKCWlmIChidWZmZXIpCgkJbWVtY3B5KGJ1ZmZlciwgZnctPnNtX3NobWVt
X291dF9iYXNlLCBzaXplKTsKCkFyZSB0aGVyZSBleHRlcm5hbCBsb2NrcyB0aGF0IGd1YXJhbnRl
ZSBzZXJpYWxpemVkIGFjY2VzcyB0byB0aGVzZSBmdW5jdGlvbnMsCm9yIHNob3VsZCB3ZSBiZSBz
eW5jaHJvbml6aW5nIHRoZXNlIHNoYXJlZCBtZW1vcnkgb3BlcmF0aW9ucz8KCi0tIApTYXNoaWtv
IEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjA3MTUxNzUy
MjkuMjQ2NzItMS1saW5rbWF1dmVAbGlua21hdXZlLmZyP3BhcnQ9NgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxp
c3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
