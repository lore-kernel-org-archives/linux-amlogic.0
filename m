Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22BC1C43458
	for <linux-amlogic@archiver.kernel.org>; Thu,  2 Jul 2026 11:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/Z8IpGnu29FMCMw8bpxIAp2e/292tYjfMgw7jvODv3c=; b=IvqqN7GhQpBbkZ
	46aZij3c4kx9W6sJU8AKUojZDNNao9JaomcmH3QaXZTFoAV0/ThMS8SFaPqZwEx9TKt1c5QMXBUZw
	jGkyr94/xbzwmhEOw0f78s3RitdjTnzhH1y95tPwmjAoPlz76NA0QwwTbYG5td5nlEn3RCyI3DmBT
	DJPKa8LIqLI6/h5qaKr3erAlL6/o/RtWaSSSW1PjZxzEJ0RbGo4QFNwlfuWibIhiH1cExTHvkP7+1
	gSwp6DBOlnSCQCm2vBRfNthMiKef6CuGW0z6IerXUX94+VcX54MPrHsSrxTStxx3oe0XlWCm3Gifk
	F+2fnWARA6+F4o1oG8kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfFJL-00000004HRU-1nWw;
	Thu, 02 Jul 2026 11:10:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfFJG-00000004HQp-0k6r
	for linux-amlogic@lists.infradead.org;
	Thu, 02 Jul 2026 11:10:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8360543DEA;
	Thu,  2 Jul 2026 11:10:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CCDC1F00A3A;
	Thu,  2 Jul 2026 11:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782990621;
	bh=unaNJphFbsualLsIV7yctkNtHxmnjo2JlcquSr2FnqI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fFENp+AIDh4vA7VdlSuD1lxryiw8Rv+7Sb9RfT2M8l4JLpmfdSi5dIDdqBITNt1Q3
	 J4Th1wCA9b3vZYKPXsEB+7LfLKQN3FoSlbenMVW61LajRt0O5TioljrqYbeR8fENPD
	 IDtxL0CcBkFzh+33V8TgHpajdeOul3zCiSPeGAeUMP2Xbppo4Hx41+uWccTg5lwRNv
	 hajqCwMnkc6MJTlX9NSD4Xv0X2WVjRN7f6GaB12ftGr3fl4CGjiBaWqSDEfgwftct3
	 6kVCrn7oAMzCPwP7HELk6un926M03Xt2nEqZNKKH5rBrrv1/8rcXnsdz7TNdMeiAFQ
	 /vJn4qE6K1SzA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] ASoC: meson: gx-formatter: prepare on attach
To: "Valerio Setti" <vsetti@baylibre.com>
Cc: neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20260702-fix-24-bit-i2s-playback-v1-1-bcd3a43fe32a@baylibre.com>
References: <20260702-fix-24-bit-i2s-playback-v1-0-bcd3a43fe32a@baylibre.com>
 <20260702-fix-24-bit-i2s-playback-v1-1-bcd3a43fe32a@baylibre.com>
Date: Thu, 02 Jul 2026 11:10:20 +0000
Message-Id: <20260702111021.2CCDC1F00A3A@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIE1vdmluZyBmb3JtYXR0
ZXIgcHJlcGFyZSBsb2dpYyB0byB0aGUgREFQTSBQUkVfUE1VIGV2ZW50IGJyZWFrcyBoYXJkd2Fy
ZSByZWNvbmZpZ3VyYXRpb24gZm9yIGJhY2stdG8tYmFjayBwbGF5YmFja3Mgb3IgcmFwaWQgcmVz
dGFydHMuCi0tCgpjb21taXQgMGJlOGM2NDdkMjE4OGUwMmM4NTE5ZDRkMTE3YmM5Y2IxYmRiNzQ2
YwpBdXRob3I6IFZhbGVyaW8gU2V0dGkgPHZzZXR0aUBiYXlsaWJyZS5jb20+CgpBU29DOiBtZXNv
bjogZ3gtZm9ybWF0dGVyOiBwcmVwYXJlIG9uIGF0dGFjaAoKVGhpcyBjb21taXQgc3BsaXRzIHRo
ZSBwcmVwYXJlIGFuZCBlbmFibGUgb3BlcmF0aW9ucyBmb3IgdGhlIGZvcm1hdHRlcgpkcml2ZXIu
IEl0IG1vdmVzIHRoZSBwcmVwYXJlIG9wZXJhdGlvbiB0byBoYXBwZW4gd2hlbiB0aGUgd2lkZ2V0
IGlzIHBvd2VyZWQKdXAgcmF0aGVyIHRoYW4gYXQgdHJpZ2dlciB0aW1lLCBhaW1pbmcgdG8gcmVz
b2x2ZSAyNC1iaXQgSTJTIHBsYXliYWNrCmNvcnJ1cHRpb24gY2F1c2VkIGJ5IHBpcGVsaW5lIHJl
c2V0IG9yZGVyaW5nIGNvbmZsaWN0cy4KCj4gZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy9tZXNvbi9n
eC1mb3JtYXR0ZXIuYyBiL3NvdW5kL3NvYy9tZXNvbi9neC1mb3JtYXR0ZXIuYwo+IGluZGV4IDMx
MWU2M2FmZmIyMzkuLmM3MzMzZjYyNGIxNTUgMTAwNjQ0Cj4gLS0tIGEvc291bmQvc29jL21lc29u
L2d4LWZvcm1hdHRlci5jCj4gKysrIGIvc291bmQvc29jL21lc29uL2d4LWZvcm1hdHRlci5jCgpb
IC4uLiBdCgo+IC1zdGF0aWMgaW50IGd4X2Zvcm1hdHRlcl9lbmFibGUoc3RydWN0IGd4X2Zvcm1h
dHRlciAqZm9ybWF0dGVyKQo+ICtzdGF0aWMgaW50IGd4X2Zvcm1hdHRlcl9wcmVwYXJlKHN0cnVj
dCBneF9mb3JtYXR0ZXIgKmZvcm1hdHRlcikKPiAgewo+ICAJaW50IHJldDsKPiAgCj4gLQkvKiBE
byBub3RoaW5nIGlmIHRoZSBmb3JtYXR0ZXIgaXMgYWxyZWFkeSBlbmFibGVkICovCj4gLQlpZiAo
Zm9ybWF0dGVyLT5lbmFibGVkKQo+ICsJaWYgKGZvcm1hdHRlci0+cHJlcGFyZWQpCj4gIAkJcmV0
dXJuIDA7CgpbU2V2ZXJpdHk6IEhpZ2hdCldpbGwgdGhpcyBwcmV2ZW50IGhhcmR3YXJlIHJlY29u
ZmlndXJhdGlvbiBmb3IgYmFjay10by1iYWNrIHBsYXliYWNrcz8KCkJlY2F1c2UgdGhlIEFMU0Eg
Y29yZSB1dGlsaXplcyBwbWRvd25fdGltZSAoZGVsYXllZCBwb3dlciBkb3duKSwgdGhlIERBUE0K
d2lkZ2V0IHJlbWFpbnMgaW4gdGhlIHBvd2VyZWQtb24gc3RhdGUgZm9yIGEgc2hvcnQgdGltZSBh
ZnRlciBwbGF5YmFjawpzdG9wcy4KCklmIGEgbmV3IHN0cmVhbSB3aXRoIGRpZmZlcmVudCBwYXJh
bWV0ZXJzIChlLmcuLCBjaGFuZ2luZyBmcm9tIDE2LWJpdCB0bwoyNC1iaXQpIHN0YXJ0cyByYXBp
ZGx5IGJlZm9yZSB0aGUgcG93ZXItZG93biBvY2N1cnMsIGRhcG1fcG93ZXJfd2lkZ2V0cygpCndp
bGwgbm90IGRldGVjdCBhIHBvd2VyIHN0YXRlIGNoYW5nZSBhbmQgd2lsbCBub3QgZW1pdCBhIG5l
dwpTTkRfU09DX0RBUE1fUFJFX1BNVSBldmVudC4KClNpbmNlIHRoZSB3aWRnZXQgd2Fzbid0IHBv
d2VyZWQgZG93biwgZ3hfZm9ybWF0dGVyX2RldGFjaCgpIGhhc24ndCBjbGVhcmVkCmZvcm1hdHRl
ci0+cHJlcGFyZWQuIFRoaXMgY2hlY2sgd2lsbCByZXR1cm4gZWFybHkgYW5kIHNraXAgdXBkYXRp
bmcgdGhlCmhhcmR3YXJlIGZvciB0aGUgbmV3IHNhbXBsZSBmb3JtYXQsIGNhdXNpbmcgdGhlIG5l
dyBzdHJlYW0gdG8gcGxheSB0aHJvdWdoCmluY29ycmVjdGx5IGNvbmZpZ3VyZWQgaGFyZHdhcmUu
Cgo+ICAKPiAgCS8qIFNldHVwIHRoZSBzdHJlYW0gcGFyYW1ldGVyIGluIHRoZSBmb3JtYXR0ZXIg
Ki8KPiAgCWlmIChmb3JtYXR0ZXItPmRydi0+b3BzLT5wcmVwYXJlKSB7Cj4gIAkJcmV0ID0gZm9y
bWF0dGVyLT5kcnYtPm9wcy0+cHJlcGFyZShmb3JtYXR0ZXItPm1hcCwKPiAtCQkJCQkgICBmb3Jt
YXR0ZXItPmRydi0+cXVpcmtzLAo+IC0JCQkJCSAgIGZvcm1hdHRlci0+c3RyZWFtKTsKPiArCQkJ
CQkJICAgZm9ybWF0dGVyLT5kcnYtPnF1aXJrcywKPiArCQkJCQkJICAgZm9ybWF0dGVyLT5zdHJl
YW0pOwo+ICAJCWlmIChyZXQpCj4gIAkJCXJldHVybiByZXQ7Cj4gIAl9CgpbIC4uLiBdCgo+IEBA
IC02Myw2ICs3NCwxMiBAQCBzdGF0aWMgaW50IGd4X2Zvcm1hdHRlcl9hdHRhY2goc3RydWN0IGd4
X2Zvcm1hdHRlciAqZm9ybWF0dGVyKQo+ICAKPiAgCW11dGV4X2xvY2soJnRzLT5sb2NrKTsKPiAg
Cj4gKwlyZXQgPSBneF9mb3JtYXR0ZXJfcHJlcGFyZShmb3JtYXR0ZXIpOwo+ICsJaWYgKHJldCkg
ewo+ICsJCXByX2VycigiZmFpbGVkIHRvIHByZXBhcmUgdGhlIGZvcm1hdHRlclxuIik7Cj4gKwkJ
Z290byBvdXQ7Cj4gKwl9Cj4gKwo+ICAJLyogQ2F0Y2ggdXAgaWYgdGhlIHN0cmVhbSBpcyBhbHJl
YWR5IHJ1bm5pbmcgd2hlbiB3ZSBhdHRhY2ggKi8KPiAgCWlmICh0cy0+cmVhZHkpIHsKPiAgCQly
ZXQgPSBneF9mb3JtYXR0ZXJfZW5hYmxlKGZvcm1hdHRlcik7CgpbIC4uLiBdCgotLSAKU2FzaGlr
byBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwNzAyLWZp
eC0yNC1iaXQtaTJzLXBsYXliYWNrLXYxLTAtYmNkM2E0M2ZlMzJhQGJheWxpYnJlLmNvbT9wYXJ0
PTEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
