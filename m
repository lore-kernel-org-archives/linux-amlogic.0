Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FF26CCF9E5
	for <linux-amlogic@archiver.kernel.org>; Sun, 26 Oct 2025 14:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1ead4cWw0lMYzxQ3MaZHaOSjJXTnT7/JvnHWDzei5Hs=; b=2SW7QdEhacuov/
	KJU9sggSA2PYHD1l4DUL1C1hXVJo5nMi5bruYytRmbKxsnJPzgn+J7WsmHXOs9jYQhR4Fg2T8Zxxj
	ZZ/+KeETYTsFXfzUPImooebpnM767GIBvLuLSWO1HeH+fISvd8FzuM931oFfs6aNDiHyJvUWoSaeR
	fQH/1663nz6/cjZo1Aj2e8ZODuh/BEqmefqd4G7cnqPkbTHZSweGB6YB/EdDynP2nAWam1IvOLjD9
	HBPYWdMDZ0d9xyy/XfW7Hc7ArdCO8d9BQtk9PPG9zWADJP5jitzjSwWdb3kJJKF2BUC8+VI37sqNU
	nFXQqbHLwGHXM8U5PnwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD24f-0000000CRr5-1Pow;
	Sun, 26 Oct 2025 14:50:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD24d-0000000CRqN-1dbv;
	Sun, 26 Oct 2025 14:50:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3D5D460414;
	Sun, 26 Oct 2025 14:50:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B94EFC4CEF1;
	Sun, 26 Oct 2025 14:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761490220;
	bh=jMTtq6Xo1XlrvYqcb4wROaYCZBEw5JdAq4ePIhysOLk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=G37DIfbyVj9pg2udsJc3AEnkoKA10XRbnPRlHhoFqW9GgI+TZklVde0cQBOzAShGW
	 rgWCpL5G2HsfPSk1rraanJh1i/f8jY3wz23PY3ASwFYgGaFFOglvn/zCUd+UNqPecG
	 hCE/1Pm223Q90HIdelf5OpwUugadxP4MwhTeDVJBy+WRo/UFnFUELMuB/WQmDpOJFO
	 7cyRHMgSxH6C+f6cEdylPoz/j6xRv/N4ZPtgn6CVWsoKTUPvgJ9Ij45k3UKjgY4wxt
	 skmdSKJJilfllhWtrmeY1r3BiZyEId3x8fpMMLF+dgdnLaoAF3nXcaYXsGw0R301gm
	 x0ApNbId5USnQ==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Valerio Setti <vsetti@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	neil.armstrong@linaro.org,
	khilman@baylibre.com,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH AUTOSEL 6.17-5.10] ASoC: meson: aiu-encoder-i2s: fix bit clock polarity
Date: Sun, 26 Oct 2025 10:48:49 -0400
Message-ID: <20251026144958.26750-11-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251026144958.26750-1-sashal@kernel.org>
References: <20251026144958.26750-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.17.5
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

RnJvbTogVmFsZXJpbyBTZXR0aSA8dnNldHRpQGJheWxpYnJlLmNvbT4KClsgVXBzdHJlYW0gY29t
bWl0IDRjNGVkNWUwNzNhOTIzZmIzMzIzMDIyZTExMzFjYjUxYWQ4ZGY3YTAgXQoKQWNjb3JkaW5n
IHRvIEkyUyBzcGVjcyBhdWRpbyBkYXRhIGlzIHNhbXBsZWQgb24gdGhlIHJpc2luZyBlZGdlIG9m
IHRoZQpjbG9jayBhbmQgaXQgY2FuIGNoYW5nZSBvbiB0aGUgZmFsbGluZyBvbmUuIFdoZW4gb3Bl
cmF0aW5nIGluIG5vcm1hbCBtb2RlCnRoaXMgU29DIGJlaGF2ZXMgdGhlIG9wcG9zaXRlIHNvIGEg
Y2xvY2sgcG9sYXJpdHkgaW52ZXJzaW9uIGlzIHJlcXVpcmVkCmluIHRoaXMgY2FzZS4KClRoaXMg
d2FzIHRlc3RlZCBvbiBhbiBPZHJvaWRDMiAoQW1sb2dpYyBTOTA1IFNvQykgYm9hcmQuCgpTaWdu
ZWQtb2ZmLWJ5OiBWYWxlcmlvIFNldHRpIDx2c2V0dGlAYmF5bGlicmUuY29tPgpSZXZpZXdlZC1i
eTogSmVyb21lIEJydW5ldCA8amJydW5ldEBiYXlsaWJyZS5jb20+ClRlc3RlZC1ieTogSmVyb21l
IEJydW5ldCA8amJydW5ldEBiYXlsaWJyZS5jb20+Ckxpbms6IGh0dHBzOi8vcGF0Y2gubXNnaWQu
bGluay8yMDI1MTAwNy1maXgtaTJzLXBvbGFyaXR5LXYxLTEtODY3MDRkOWNkYTEwQGJheWxpYnJl
LmNvbQpTaWduZWQtb2ZmLWJ5OiBNYXJrIEJyb3duIDxicm9vbmllQGtlcm5lbC5vcmc+ClNpZ25l
ZC1vZmYtYnk6IFNhc2hhIExldmluIDxzYXNoYWxAa2VybmVsLm9yZz4KLS0tCgpMTE0gR2VuZXJh
dGVkIGV4cGxhbmF0aW9ucywgbWF5IGJlIGNvbXBsZXRlbHkgYm9ndXM6CgpZRVMg4oCTIHRoaXMg
Y2hhbmdlIGZpeGVzIGEgbG9uZy1zdGFuZGluZyBmdW5jdGlvbmFsIGJ1ZyB3aXRoIHRoZSBNZXNv
bgpBSVUgScKyUyBlbmNvZGVyIGFuZCBpcyBsb3cgcmlzayB0byBiYWNrcG9ydC4KLSBUaGUgdXBk
YXRlZCBgYWl1X2VuY29kZXJfaTJzX3NldF9mbXQoKWAgbm93IGludmVydHMgdGhlIGJpdCBjbG9j
awogIHdoZW5ldmVyIHRoZSBEQUkgZm9ybWF0IHJlcXVlc3RzIHRoZSBub3JtYWwgKG5vbi1pbnZl
cnRlZCkgcG9sYXJpdHkKICAoYFNORF9TT0NfREFJRk1UX05CXypgKSwgbWF0Y2hpbmcgdGhlIGhh
cmR3YXJlIHF1aXJrIGRlc2NyaWJlZCBpbiB0aGUKICBuZXcgY29tbWVudCAoYHNvdW5kL3NvYy9t
ZXNvbi9haXUtZW5jb2Rlci1pMnMuYzoyMzktMjQ1YCkuIFdpdGhvdXQKICB0aGlzIGludmVyc2lv
biwgdGhlIENQVS1zaWRlIG1hc3RlciBkcml2ZXMgQkNMSyBzbyB0aGF0IGRhdGEgdG9nZ2xlcwog
IG9uIHRoZSByaXNpbmcgZWRnZSwgd2hpY2ggbWFrZXMgYWxsIG1haW5saW5lIERUIHVzZXJzIChl
LmcuIE9kcm9pZCBDMikKICBzYW1wbGUgb24gdGhlIHdyb25nIGVkZ2UgYW5kIHlpZWxkcyBhdWRp
YmxlIGNvcnJ1cHRpb24uCi0gRnJhbWVzIChgTFJDTEtgKSBhcmUgc3RpbGwgaGFuZGxlZCBleGFj
dGx5IGFzIGJlZm9yZSwgYW5kIHRoZSBmaXggb25seQogIGZsaXBzIHdoaWNoIGBpbnZgIGNvbWJp
bmF0aW9ucyBzZXQgYEFJVV9DTEtfQ1RSTF9BT0NMS19JTlZFUlRgLCBzbwogIGBJQl8qYCBmb3Jt
YXRzIGNvbnRpbnVlIHRvIHdvcmsgYXMgdGhleSBhbHJlYWR5IG1hdGNoZWQgdGhlIFNvQ+KAmXMK
ICDigJxpbnZlcnRlZOKAnSBkZWZhdWx0LgotIFRoZSBjaGFuZ2UgaXMgdGlnaHRseSBzY29wZWQg
dG8gb25lIGhlbHBlciBpbiB0aGUgTWVzb24gQUlVIGVuY29kZXIKICBkcml2ZXIsIGxlYXZlcyBy
ZWdpc3RlciBwcm9ncmFtbWluZyBhbmQgY2xvY2sgc2VxdWVuY2luZyB1bnRvdWNoZWQsCiAgYW5k
IGhhcyBiZWVuIHZhbGlkYXRlZCBvbiByZWFsIGhhcmR3YXJlIHBlciB0aGUgY29tbWl0IGxvZy4K
LSBNYWlubGluZSBkZXZpY2UgdHJlZXMgZm9yIHRoaXMgREFJIGFsbCByZWx5IG9uIHRoZSBkZWZh
dWx0IGBOQl9ORmAKICBmb3JtYXQsIHNvIHRoZSBidWcgaXMgdXNlci12aXNpYmxlIHRvZGF5OyB0
aGVyZSBhcmUgbm8gZGVwZW5kZW5jeSBvcgogIEFQSSBjb25jZXJucyBibG9ja2luZyBzdGFibGUg
YmFja3BvcnRpbmcuCgpTdWdnZXN0ZWQgZm9sbG93LXVwOiAxKSBSdW4gYSBxdWljayBwbGF5YmFj
ayBzYW5pdHkgdGVzdCBvbiBhbiBPZHJvaWQgQzIKKG9yIGFueSBNZXNvbiBHWCBib2FyZCB1c2lu
ZyB0aGUgQUlVIGVuY29kZXIpIGFmdGVyIGJhY2twb3J0aW5nIHRvCmNvbmZpcm0gYXVkaW8gYmVj
b21lcyBjbGVhbi4KCiBzb3VuZC9zb2MvbWVzb24vYWl1LWVuY29kZXItaTJzLmMgfCA5ICsrKysr
Ky0tLQogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9zb3VuZC9zb2MvbWVzb24vYWl1LWVuY29kZXItaTJzLmMgYi9zb3VuZC9zb2Mv
bWVzb24vYWl1LWVuY29kZXItaTJzLmMKaW5kZXggYTBkZDkxNGM4ZWQxMy4uM2I0MDYxNTA4YzE4
MCAxMDA2NDQKLS0tIGEvc291bmQvc29jL21lc29uL2FpdS1lbmNvZGVyLWkycy5jCisrKyBiL3Nv
dW5kL3NvYy9tZXNvbi9haXUtZW5jb2Rlci1pMnMuYwpAQCAtMjM2LDggKzIzNiwxMiBAQCBzdGF0
aWMgaW50IGFpdV9lbmNvZGVyX2kyc19zZXRfZm10KHN0cnVjdCBzbmRfc29jX2RhaSAqZGFpLCB1
bnNpZ25lZCBpbnQgZm10KQogCSAgICBpbnYgPT0gU05EX1NPQ19EQUlGTVRfSUJfSUYpCiAJCXZh
bCB8PSBBSVVfQ0xLX0NUUkxfTFJDTEtfSU5WRVJUOwogCi0JaWYgKGludiA9PSBTTkRfU09DX0RB
SUZNVF9JQl9ORiB8fAotCSAgICBpbnYgPT0gU05EX1NPQ19EQUlGTVRfSUJfSUYpCisJLyoKKwkg
KiBUaGUgU29DIGNoYW5nZXMgZGF0YSBvbiB0aGUgcmlzaW5nIGVkZ2Ugb2YgdGhlIGJpdGNsb2Nr
CisJICogc28gYW4gaW52ZXJzaW9uIG9mIHRoZSBiaXRjbG9jayBpcyByZXF1aXJlZCBpbiBub3Jt
YWwgbW9kZQorCSAqLworCWlmIChpbnYgPT0gU05EX1NPQ19EQUlGTVRfTkJfTkYgfHwKKwkgICAg
aW52ID09IFNORF9TT0NfREFJRk1UX05CX0lGKQogCQl2YWwgfD0gQUlVX0NMS19DVFJMX0FPQ0xL
X0lOVkVSVDsKIAogCS8qIFNpZ25hbCBza2V3ICovCkBAIC0zMjgsNCArMzMyLDMgQEAgY29uc3Qg
c3RydWN0IHNuZF9zb2NfZGFpX29wcyBhaXVfZW5jb2Rlcl9pMnNfZGFpX29wcyA9IHsKIAkuc3Rh
cnR1cAk9IGFpdV9lbmNvZGVyX2kyc19zdGFydHVwLAogCS5zaHV0ZG93bgk9IGFpdV9lbmNvZGVy
X2kyc19zaHV0ZG93biwKIH07Ci0KLS0gCjIuNTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4
LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
