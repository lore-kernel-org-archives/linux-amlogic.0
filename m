Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66D45C43458
	for <linux-amlogic@archiver.kernel.org>; Thu,  2 Jul 2026 21:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SLRgiRY2G2fC0ljKoTIG+85vIhCpVYK/ULJViuA5Otg=; b=JCTHJ9zp8X2osG
	/0n3VQzotDYoOiNWSrMqcgULWz0Yh/QuS0N7h4mdt1QbJ9iEhvAPKgxu9xJ/ScfqpuWsQIsWYVq2T
	WDsJcYR7knVgC/4d1GLKPINbL5FLFYnnFAI2hre/KOtrY3uYqRgM6CkWPho0KV32LsxZJaZ5Vhub5
	9mQRktlWop8uamslnPifG4CvmvRlpZLKXjPAXDtnUJiOmXhPdmpupjIDBn+Wpb4XZHA79XI9JITP5
	AsxtLoLYyTt5EPOzp3AJirNmtNlAzMLzYQ93RHwR39AvXae9B6r6n0GATMPsSIKioRDe6O9/huHTP
	1aFkOayGgZalohCHAfJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfPBD-00000005YQc-0JWG;
	Thu, 02 Jul 2026 21:42:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfPBB-00000005YQI-0HPv
	for linux-amlogic@lists.infradead.org;
	Thu, 02 Jul 2026 21:42:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6717441A95;
	Thu,  2 Jul 2026 21:42:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1229B1F000E9;
	Thu,  2 Jul 2026 21:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783028560;
	bh=3YiYsCvOVtwcS3BXpWa1a3N7AbVJb85HpaTGBTOUd9U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=idEyqzY9x6OLf6cvI+iewUSqeqYBWam0ZP/cv7X2XkX1gfZKX85UZlSMnApOGocwW
	 PYqgHHnXLHiUpMNG4AAmqRI91tLuQQDn8PLMdSkavx3cHSR+lWgTeH7MPnbRQn76rA
	 xlUGiQ05sIYEWVb57ixDjHc1h58Z0G5p1GxcSEF+xaByhCqRd1QmLBhIrQ5i8mTr75
	 arnRJa2vSbFO5Rf1tBTaFQh+RY3MlA16N38Qk7QFe5RmYQzCi+Lze23GQrdLD55Wos
	 gRzSv1bp20uDnjDiSZC1yiK9oxmAxtLwABafbFsucVbUugoEdtJLac75reksuebkFf
	 wLjYBCBudO9kw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] ASoC: meson: aiu-formatter-i2s: remove pipeline
 reset from prepare
To: "Valerio Setti" <vsetti@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org
In-Reply-To: <20260702-fix-24-bit-i2s-playback-v2-1-9c008ff0b211@baylibre.com>
References: <20260702-fix-24-bit-i2s-playback-v2-1-9c008ff0b211@baylibre.com>
Date: Thu, 02 Jul 2026 21:42:39 +0000
Message-Id: <20260702214240.1229B1F000E9@smtp.kernel.org>
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
IFtNZWRpdW1dIFRoZSBmb3JtYXR0ZXIgaXMgY29uZmlndXJlZCBpbiB0aGUgQUxTQSBgLnRyaWdn
ZXJgIGNhbGxiYWNrIHJhdGhlciB0aGFuIGAucHJlcGFyZWAsIGNhdXNpbmcgaXQgdG8gYmUgdXBk
YXRlZCBhZnRlciB0aGUgRklGTyBoYXMgYWxyZWFkeSBiZWVuIGVuYWJsZWQgYW5kIGlzIGFjdGl2
ZWx5IHN0cmVhbWluZyBkYXRhLgotLQoKY29tbWl0IDhjNDg4ZThhODEzNGVmNDNiZTJkZjAzMDUx
OGY1MjFiMDE1YWE2MWMKQXV0aG9yOiBWYWxlcmlvIFNldHRpIDx2c2V0dGlAYmF5bGlicmUuY29t
PgoKQVNvQzogbWVzb246IGFpdS1mb3JtYXR0ZXItaTJzOiByZW1vdmUgcGlwZWxpbmUgcmVzZXQg
ZnJvbSBwcmVwYXJlCgpUaGlzIGNvbW1pdCByZW1vdmVzIGEgcGlwZWxpbmUgcmVzZXQgZnJvbSB0
aGUgQUlVIEkyUyBmb3JtYXR0ZXIgcHJlcGFyZQpjYWxsYmFjay4gVGhlIHJlc2V0IGlzIGFscmVh
ZHkgaGFuZGxlZCBieSB0aGUgREFJIGZyb250ZW5kIGR1cmluZyB0cmlnZ2VyLAphbmQgZHVwbGlj
YXRpbmcgaXQgaGVyZSBjb3JydXB0cyBwbGF5YmFjayBpbiAyNC1iaXQgbW9kZSBzaW5jZSB0aGUg
RklGTwpoYXMgYWxyZWFkeSBiZWVuIHN0YXJ0ZWQuCgo+IGRpZmYgLS1naXQgYS9zb3VuZC9zb2Mv
bWVzb24vYWl1LWZvcm1hdHRlci1pMnMuYyBiL3NvdW5kL3NvYy9tZXNvbi9haXUtZm9ybWF0dGVy
LWkycy5jCj4gaW5kZXggYjQ2MDQ3MzRmZTg4ZC4uY2I1NTRjMmU3Y2U0YSAxMDA2NDQKPiAtLS0g
YS9zb3VuZC9zb2MvbWVzb24vYWl1LWZvcm1hdHRlci1pMnMuYwo+ICsrKyBiL3NvdW5kL3NvYy9t
ZXNvbi9haXUtZm9ybWF0dGVyLWkycy5jCgpbIC4uLiBdCgo+IEBAIC01NSwxMSArNTQsMTEgQEAg
c3RhdGljIGludCBhaXVfZm9ybWF0dGVyX2kyc19wcmVwYXJlKHN0cnVjdCByZWdtYXAgKm1hcCwK
PiAgewo+ICAJLyogQWx3YXlzIG9wZXJhdGUgaW4gc3BsaXQgKGNsYXNzaWMgaW50ZXJsZWF2ZWQp
IG1vZGUgKi8KPiAgCXVuc2lnbmVkIGludCBkZXNjID0gMDsKPiAtCXVuc2lnbmVkIGludCB0bXA7
Cj4gIAo+IC0JLyogUmVzZXQgcmVxdWlyZWQgdG8gdXBkYXRlIHRoZSBwaXBlbGluZSAqLwo+IC0J
cmVnbWFwX3dyaXRlKG1hcCwgQUlVX1JTVF9TT0ZULCBBSVVfUlNUX1NPRlRfSTJTX0ZBU1QpOwo+
IC0JcmVnbWFwX3JlYWQobWFwLCBBSVVfSTJTX1NZTkMsICZ0bXApOwo+ICsJLyoKPiArCSAqIFBp
cGVsaW5lIHJlc2V0IGlzIGFscmVhZHkgaW1wbGVtZW50ZWQgaW4gYWl1X2ZpZm9faTJzX3RyaWdn
ZXIoKSBhdAo+ICsJICogdHJpZ2dlciB0aW1lLgo+ICsJICovCgpbU2V2ZXJpdHk6IE1lZGl1bV0K
VGhpcyBpcyBhIHByZS1leGlzdGluZyBpc3N1ZSwgYnV0IGRvZXMgdGhlIGZvcm1hdHRlciBjb25m
aWd1cmF0aW9uIGhhcHBlbiB0b28KbGF0ZSBpbiB0aGUgc2VxdWVuY2U/CgpUaGUgY29tbWl0IG5v
dGVzIHRoYXQgdGhlIGZyb250ZW5kIHN0YXJ0cyB0aGUgRklGTyBiZWZvcmUgdGhpcyBmb3JtYXR0
ZXIKZ2V0cyBjb25maWd1cmVkLiBMb29raW5nIGF0IHRoZSBjYWxsIGNoYWluLCBhaXVfZm9ybWF0
dGVyX2kyc19wcmVwYXJlKCkgaW4Kc291bmQvc29jL21lc29uL2FpdS1mb3JtYXR0ZXItaTJzLmMg
aXMgZXhlY3V0ZWQgZHVyaW5nIHRoZSBBTFNBIHRyaWdnZXIKcGhhc2UgaW5zdGVhZCBvZiB0aGUg
cHJlcGFyZSBwaGFzZToKCnNvdW5kL3NvYy9tZXNvbi9haXUtZW5jb2Rlci1pMnMuYzphaXVfZW5j
b2Rlcl9pMnNfdHJpZ2dlcigpCiAgICByZXQgPSBneF9zdHJlYW1fc3RhcnQodHMpOwoKc291bmQv
c29jL21lc29uL2d4LWZvcm1hdHRlci5jOmd4X2Zvcm1hdHRlcl9lbmFibGUoKQogICAgcmV0ID0g
Zm9ybWF0dGVyLT5kcnYtPm9wcy0+cHJlcGFyZShmb3JtYXR0ZXItPm1hcCwKICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgZm9ybWF0dGVyLT5kcnYtPnF1aXJrcywKICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZm9ybWF0dGVyLT5zdHJlYW0pOwoKTW9k
aWZ5aW5nIGhhcmR3YXJlIGRhdGEgcGF0aCBjb25maWd1cmF0aW9uIGxpa2UgYml0IHdpZHRoIGFu
ZCBjaGFubmVsIGNvdW50CndoaWxlIHRoZSBETUEgRklGTyBpcyBhbHJlYWR5IGZlZWRpbmcgZGF0
YSB0byBpdCBjYW4gY2F1c2UgYXVkaW8gZ2xpdGNoZXMsCmRyb3BwZWQgc2FtcGxlcywgb3IgY29y
cnVwdGlvbiBhdCB0aGUgc3RhcnQgb2YgcGxheWJhY2suCgpDb3VsZCB0aGUgZm9ybWF0dGVyIGNv
bmZpZ3VyYXRpb24gYmUgbW92ZWQgdG8gdGhlIGFjdHVhbCBBTFNBIHByZXBhcmUKY2FsbGJhY2sg
cmF0aGVyIHRoYW4gYmVpbmcgZGVmZXJyZWQgdG8gdGhlIHRyaWdnZXIgY2FsbGJhY2s/Cgo+ICAK
PiAgCXN3aXRjaCAodHMtPnBoeXNpY2FsX3dpZHRoKSB7Cj4gIAljYXNlIDE2OiAvKiBOb3RoaW5n
IHRvIGRvICovCgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8j
L3BhdGNoc2V0LzIwMjYwNzAyLWZpeC0yNC1iaXQtaTJzLXBsYXliYWNrLXYyLTEtOWMwMDhmZjBi
MjExQGJheWxpYnJlLmNvbT9wYXJ0PTEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LWFtbG9naWMK
