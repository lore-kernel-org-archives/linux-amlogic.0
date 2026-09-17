Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FD08C982D0
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Sep 2026 21:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lFOGP/CDlk/+mgf7A3gFQdONtyZv8WWKM9qHtGu06jY=; b=Nj5KCMwjpVwYRf
	QfMmpfOyCQW0/5pvEZJ0pVOryF+ryl8FVnVlPVkbpE2bUNKj87hrsTir/Fpun6cnSuHatslHqCb9K
	9CSoItRjNJHoB7KDmjXxOM7Rk/faorj0wj6gEwVy41GLonnZ+6Zm838/f+sgOPDid5Txls6/xuEKm
	sDAV6kRvgL+Z01X84M00hgHiuvUOGqxpPRzkYFJiLoeRmcdblg+9ZprBWXEUs1KN+JxZ2xd5C0Fa1
	+DPrWWeZihfouq9uryKjH60S7Wgb+QhGIeZntqcHDxG0pVLMikJ+lvm3wGhREBAGUAx8qcHC/3hT5
	hhCNQkz/MFriOBEEdDVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7JWo-0000000CYJj-1uTc;
	Thu, 17 Sep 2026 21:20:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7JWm-0000000CYJR-3IQc
	for linux-amlogic@lists.infradead.org;
	Thu, 17 Sep 2026 21:20:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EE9EE600AA;
	Thu, 17 Sep 2026 21:20:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4ECE61F00893;
	Thu, 17 Sep 2026 21:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789680019;
	bh=eEuuZjeGZbBL70xFPAbqfMiUEkk4GDnAKkh1pNrgl7M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DR3N4bh4Fw97FLTH2VTk2ezveYhRp8C33yZH/AVfIc34hBBUjbaIq9fg1Xi0M/EUP
	 VWXpK9R1WC9wp/9xtrOr06v1jKANWdhQiulAtjSetqBjV4HS3fi+TD3TalwmYLmwAo
	 E3SmZPRksjg2U3H9I8jBJqgvjc1dPjyi6UMxFUv32MGeo9nUwQaE7Bo5cJrUY9ZmlY
	 8l+cnQ7UpyIYqmm586l12zktX7328uxRwLhuxT756RVLDiou2KtBhWetHlE36rRfsB
	 cZ9/27+/rALUYObPbj2rn6Ms6DCFy5OoeNqZsFW1WkT/QzQ6mHAzLISNprJ3v4XSqq
	 VEgC7XtGHIWlw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/6] ASoC: meson: aiu: add I2S Capture DAI
To: "Valerio Setti" <vsetti@baylibre.com>
Cc: robh@kernel.org, linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260917-audin-v2-4-38de4bc1de34@baylibre.com>
References: <20260917-audin-v2-0-38de4bc1de34@baylibre.com>
 <20260917-audin-v2-4-38de4bc1de34@baylibre.com>
Date: Thu, 17 Sep 2026 21:20:18 +0000
Message-Id: <20260917212019.4ECE61F00893@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIEFTb0M6IG1lc29uOiBw
ZXJtYW5lbnQgY2xvY2sgZGl2aWRlciBsZWFrIGluIGFpdV9lbmNvZGVyX2kyc19od19mcmVlKCkK
LS0KCmNvbW1pdCA3MDc2YzdmMDQ0MDAzYzg5ZDI3NmI4OGUxNWUyN2RkMDUzM2M0ZDkyCkF1dGhv
cjogVmFsZXJpbyBTZXR0aSA8dnNldHRpQGJheWxpYnJlLmNvbT4KCkFTb0M6IG1lc29uOiBhaXU6
IGFkZCBJMlMgQ2FwdHVyZSBEQUkKClRoaXMgY29tbWl0IGFkZHMgYSBjYXB0dXJlIHN0cmVhbSB0
byB0aGUgQ1BVX0kyU19FTkNPREVSLCBlbmFibGluZyBpdCB0bwpoYW5kbGUgYm90aCBwbGF5YmFj
ayBhbmQgY2FwdHVyZSBzdHJlYW1zIGNvbmN1cnJlbnRseS4gSXQgYWxzbyBmb3JtYXRzCmFuZCBi
dWZmZXJzIHRoZSBjYXB0dXJlZCBkYXRhIHVzaW5nIGV4aXN0aW5nIGNvbXBvbmVudHMuCgo+IGRp
ZmYgLS1naXQgYS9zb3VuZC9zb2MvbWVzb24vYWl1LmMgYi9zb3VuZC9zb2MvbWVzb24vYWl1LmMK
PiBpbmRleCA1MzVmYmY3YzE2Mzk0Li4xNGQwZTIwYTRiZDY2IDEwMDY0NAo+IC0tLSBhL3NvdW5k
L3NvYy9tZXNvbi9haXUuYwo+ICsrKyBiL3NvdW5kL3NvYy9tZXNvbi9haXUuYwo+IEBAIC0xNTMs
NiArMTUzLDEzIEBAIHN0YXRpYyBzdHJ1Y3Qgc25kX3NvY19kYWlfZHJpdmVyIGFpdV9jcHVfZGFp
X2RydltdID0gewo+ICAJCQkucmF0ZXMgPSBTTkRSVl9QQ01fUkFURV84MDAwXzE5MjAwMCwKPiAg
CQkJLmZvcm1hdHMgPSBBSVVfRk9STUFUUywKPiAgCQl9LAo+ICsJCS5jYXB0dXJlID0gewo+ICsJ
CQkuc3RyZWFtX25hbWUgPSAiSTJTIEVuY29kZXIgQ2FwdHVyZSIsCj4gKwkJCS5jaGFubmVsc19t
aW4gPSAyLAo+ICsJCQkuY2hhbm5lbHNfbWF4ID0gMiwKPiArCQkJLnJhdGVzID0gU05EUlZfUENN
X1JBVEVfODAwMF8xOTIwMDAsCj4gKwkJCS5mb3JtYXRzID0gU05EUlZfUENNX0ZNVEJJVF9TMTZf
TEUsCj4gKwkJfSwKCltTZXZlcml0eTogSGlnaF0KRG9lcyBhZGRpbmcgdGhpcyBjYXB0dXJlIHN0
cmVhbSBpbnRyb2R1Y2UgYSBwZXJtYW5lbnQgY2xvY2sgZGl2aWRlciBsZWFrIHdoZW4KaHdfZnJl
ZSBpcyBleHBsaWNpdGx5IGNhbGxlZD8KCk5vdyB0aGF0IGJvdGggcGxheWJhY2sgYW5kIGNhcHR1
cmUgc3RyZWFtcyBjYW4gYmUgYWN0aXZlIHNpbXVsdGFuZW91c2x5LApzbmRfc29jX2RhaV9hY3Rp
dmUoZGFpKSBjYW4gZXZhbHVhdGUgdG8gMi4KCkluIHNvdW5kL3NvYy9tZXNvbi9haXUtZW5jb2Rl
ci1pMnMuYzphaXVfZW5jb2Rlcl9pMnNfaHdfZnJlZSgpOgoKICAgIGlmIChzbmRfc29jX2RhaV9h
Y3RpdmUoZGFpKSA8PSAxKQogICAgICAgIGFpdV9lbmNvZGVyX2kyc19kaXZpZGVyX2VuYWJsZShj
b21wb25lbnQsIDApOwoKSWYgYSB1c2VyIG9wZW5zIGJvdGggc3RyZWFtcyBzbyBzbmRfc29jX2Rh
aV9hY3RpdmUoZGFpKSBldmFsdWF0ZXMgdG8gMiwgYW5kCmV4cGxpY2l0bHkgY2FsbHMgU05EUlZf
UENNX0lPQ1RMX0hXX0ZSRUUgYmVmb3JlIGNsb3NpbmcgdGhlbSwKc25kX3NvY19kYWlfYWN0aXZl
KGRhaSkgcmVtYWlucyAyLiBUaGlzIHNraXBzIGRpc2FibGluZyB0aGUgY2xvY2sgZGl2aWRlci4K
CldoZW4gdGhlIHN0cmVhbXMgYXJlIHN1YnNlcXVlbnRseSBjbG9zZWQsIHRoZSBBTFNBIGNvcmUg
c2tpcHMgaW52b2tpbmcgaHdfZnJlZQphZ2FpbiBiZWNhdXNlIHRoZSBzdGF0ZSB3YXMgYWxyZWFk
eSBjaGFuZ2VkIHRvIFNORFJWX1BDTV9TVEFURV9PUEVOLiBUaGlzCndvdWxkIGxlYXZlIHRoZSBj
bG9jayBkaXZpZGVyIHBlcm1hbmVudGx5IGVuYWJsZWQsIHBvdGVudGlhbGx5IGRyYWluaW5nIGJh
dHRlcnkKb3IgYmxvY2tpbmcgc3lzdGVtIHN1c3BlbmQuCgo+ICAJCS5vcHMgPSAmYWl1X2VuY29k
ZXJfaTJzX2RhaV9vcHMsCj4gIAkJLnN5bW1ldHJpY19yYXRlID0gMSwKPiAgCX0sCgotLSAKU2Fz
aGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwOTE3
LWF1ZGluLXYyLTAtMzhkZTRiYzFkZTM0QGJheWxpYnJlLmNvbT9wYXJ0PTQKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGlu
ZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
