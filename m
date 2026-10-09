Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F155CA6015
	for <linux-amlogic@archiver.kernel.org>; Fri,  9 Oct 2026 03:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L0kN5mDEWs1JNVbx3yPKFwgdaBvUwOoxcx2MfKsz0Po=; b=wmVEOyY7rc8hh+
	FW689SzlrHxejpzV5wic9KlJTROp+t+3xP0387QLMnip9t+53tbgI2XVGf1yuJfvmvNK6kUU8YvmN
	e36/PwX0qffT9AEUjKMlSn3QQQNSIoTxjMHDku9JokT8SDKM6JWNaJdSzTOunhfpxsiG1miR9x++s
	F/h+81ApaCA9EfWOnS/hCpbKTfMOmVEA1uzwUGVNTZDWxjH9nOZjBUcvWnHqzQU5qKmC9WffIzP2P
	ffGPXHtdRP/RsVSitBfCHUlSrsyuqgimg2F4KG+EWASF1XjmubXued1UXwa5G9nGsWN/lPsP8nzbk
	q1EWJQkCAY3vhjFSUScQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF1NR-00000005OWP-2oD7;
	Fri, 09 Oct 2026 03:34:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF1NP-00000005OVt-3dQE
	for linux-amlogic@lists.infradead.org;
	Fri, 09 Oct 2026 03:34:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5130B60DB0;
	Fri,  9 Oct 2026 03:34:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D06621F000FF;
	Fri,  9 Oct 2026 03:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791516871;
	bh=uLEBDTGSrOERnuwBKCOruRVL+fRG9kRlOZ7F9Hcdxlo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XCvQASzV9uLMnjIXf45ghnsvi147o/1NAhhkkcnl8kJzJeem1lzbDtTkQ2TmzXKW4
	 Ip6yKKf5IUjr1ikrR7GfbwiPdDlZA9rq08KTECtYlcBrJA5jcM4Y02wo943kz2miTH
	 y5XwNi7ckr3s8jk/9QrP4S9HUGesPaDMtCpJxf7kT0z1z9fahPbs9YrvpVfW8PEWx8
	 Uhp3RXpJBs3sCFwiq7MSu+bZ3Nbo4VX/Vu5Y1HNkwQl9MPyS6dzePdeCkc+WY7AhmP
	 0I3sb+zG7wcgPI5mScP6knEpfCOnqduhvQ3QyX2jCIoWESs8+eoWXHnKlAfkrPGqLE
	 kR2I5QzXiLsJQ==
Message-ID: <sashiko-outbox-164774@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 17/20] drm/msm/dp: Track VSC packets in bridge atomic
 state
To: "Xilin Wu" <sophon@radxa.com>
Cc: neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20261009-msm-dp-hdr10-v2-17-1835d4966da3@radxa.com>
References: <20261009-msm-dp-hdr10-v2-0-1835d4966da3@radxa.com>
 <20261009-msm-dp-hdr10-v2-17-1835d4966da3@radxa.com>
Date: Fri, 09 Oct 2026 03:34:30 +0000
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gZHJtL21zbS9kcDog
cGVyc2lzdGVudCBwZXJpcGhlcmFsIGZsdXNoIGFmdGVyIGRpc2FibGluZyBWU0MgU0RQIChzdGF0
ZSBzdGlja2luZXNzKQotLQoKY29tbWl0IGI1ZTkwODNlNWQwNTUyNDQxNDlhNGUwNjYwMjU0NTIy
NzYyZmZjMGUKQXV0aG9yOiBYaWxpbiBXdSA8c29waG9uQHJhZHhhLmNvbT4KCmRybS9tc20vZHA6
IFRyYWNrIFZTQyBwYWNrZXRzIGluIGJyaWRnZSBhdG9taWMgc3RhdGUKClRoaXMgY29tbWl0IG1v
dmVzIFlVVjQyMCBWU0MgY29uc3RydWN0aW9uIHRvIHRoZSBhdG9taWMgY2hlY2sgcGhhc2UgYW5k
CnJldGFpbnMgdGhlIHBhY2tlZCBwYWNrZXQgaW4gdGhlIHByaXZhdGUgYnJpZGdlIHN0YXRlLiBJ
dCBhbHNvIHByb2dyYW1zCnRoZSBwYWNrZXQgdW5jaGFuZ2VkIGZvciBub3JtYWwgc3RyZWFtcyB3
aGlsZSBkZXJpdmluZyB0aGUgcGVyaXBoZXJhbApmbHVzaCBmcm9tIGJvdGggdGhlIG9sZCBhbmQg
bmV3IHN0YXRlcy4KCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZHAvZHBfZGlz
cGxheS5jIGIvZHJpdmVycy9ncHUvZHJtL21zbS9kcC9kcF9kaXNwbGF5LmMKPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vbXNtL2RwL2RwX2Rpc3BsYXkuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9t
c20vZHAvZHBfZGlzcGxheS5jCj4gQEAgLTY3OSw3ICs2ODEsOCBAQCBzdGF0aWMgaW50IG1zbV9k
cF9pbml0X3N1Yl9tb2R1bGVzKHN0cnVjdCBtc21fZHBfZGlzcGxheV9wcml2YXRlICpkcCkKPiAg
c3RhdGljIGludCBtc21fZHBfZGlzcGxheV9zZXRfbW9kZShzdHJ1Y3QgbXNtX2RwICptc21fZHBf
ZGlzcGxheSwKPiAgCQkJCSAgIGNvbnN0IHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICphZGp1c3Rl
ZF9tb2RlLAo+ICAJCQkJICAgc3RydWN0IG1zbV9kcF9wYW5lbCAqbXNtX2RwX3BhbmVsLAo+IC0J
CQkJICAgY29uc3Qgc3RydWN0IG1zbV9kcF9icmlkZ2Vfc3RhdGUgKnN0YXRlKQo+ICsJCQkJICAg
Y29uc3Qgc3RydWN0IG1zbV9kcF9icmlkZ2Vfc3RhdGUgKnN0YXRlLAo+ICsJCQkJICAgY29uc3Qg
c3RydWN0IG1zbV9kcF9icmlkZ2Vfc3RhdGUgKm9sZF9zdGF0ZSkKPiAgewo+ICAJc3RydWN0IG1z
bV9kcF9kaXNwbGF5X3ByaXZhdGUgKmRwOwo+ICAJdTMyIGJwcDsKPiBAQCAtNjkxLDggKzY5NCw3
IEBAIHN0YXRpYyBpbnQgbXNtX2RwX2Rpc3BsYXlfc2V0X21vZGUoc3RydWN0IG1zbV9kcCAqbXNt
X2RwX2Rpc3BsYXksCj4gIAllbHNlCj4gIAkJYnBwID0gc3RhdGUtPmJwcDsKPiAgCj4gLQltc21f
ZHBfcGFuZWwtPnNkcF9uZWVkc19mbHVzaCA9IG1zbV9kcF9wYW5lbC0+bXNtX2RwX21vZGUub3V0
X2ZtdF9pc195dXZfNDIwIHx8Cj4gLQkJZHJtX21vZGVfaXNfNDIwX29ubHkoJm1zbV9kcF9wYW5l
bC0+Y29ubmVjdG9yLT5kaXNwbGF5X2luZm8sIGFkanVzdGVkX21vZGUpOwo+ICsJZHAtPnNkcF9u
ZWVkc19mbHVzaCA9IG9sZF9zdGF0ZS0+dnNjX2VuYWJsZWQgfHwgc3RhdGUtPnZzY19lbmFibGVk
OwoKW1NldmVyaXR5OiBNZWRpdW1dCldoZW4gdHJhbnNpdGlvbmluZyBmcm9tIGEgbW9kZSB3aXRo
IFZTQyBTRFAgZW5hYmxlZCAoZS5nLiwgWVVWNDIwKSB0byBhIG1vZGUKd2l0aG91dCBpdCAoUkdC
KSwgdGhlIGRpc3BsYXkgY29udHJvbGxlciByZXF1aXJlcyBhIHBlcmlwaGVyYWwgZmx1c2ggdG8g
YXBwbHkKdGhlIGRpc2FibGVkIFNEUCBjb25maWd1cmF0aW9uLiBIZXJlLCB0aGUgZXhwcmVzc2lv
biBjb3JyZWN0bHkgZXZhbHVhdGVzIHRvCnRydWUgZm9yIHRoYXQgdHJhbnNpdGlvbiBmcmFtZS4K
Ckhvd2V2ZXIsIHNpbmNlIG1zbV9kcF9kaXNwbGF5X3NldF9tb2RlKCkgaXMgb25seSBleGVjdXRl
ZCBkdXJpbmcKYXRvbWljX3ByZV9lbmFibGUgKG9uIG1vZGVzZXRzKSwgZG9lcyB0aGlzIGNvZGUg
bGVhdmUgdGhlIGZsdXNoIGZsYWcKcGVyc2lzdGVudGx5IGVuYWJsZWQ/CgpCZWNhdXNlIHRoZXJl
IGlzIG5vIG1lY2hhbmlzbSBoZXJlIHRvIGNsZWFyIGRwLT5zZHBfbmVlZHNfZmx1c2ggYWZ0ZXIg
dGhlCnRyYW5zaXRpb24gZnJhbWUgY29tcGxldGVzLCBpdCBhcHBlYXJzIHRoZSBmbGFnIHdpbGwg
c3RheSB0cnVlIGZvciBhbGwKc3Vic2VxdWVudCBub24tbW9kZXNldCBwYWdlIGZsaXBzLgoKWyAu
Li4gXQoKPiBAQCAtMTU2Myw3ICsxNTc4LDcgQEAgYm9vbCBtc21fZHBfbmVlZHNfcGVyaXBoX2Zs
dXNoKGNvbnN0IHN0cnVjdCBtc21fZHAgKm1zbV9kcF9kaXNwbGF5LAo+ICAJc3RydWN0IG1zbV9k
cF9kaXNwbGF5X3ByaXZhdGUgKmRwID0gY29udGFpbmVyX29mKG1zbV9kcF9kaXNwbGF5LAo+ICAJ
CQkJCXN0cnVjdCBtc21fZHBfZGlzcGxheV9wcml2YXRlLCBtc21fZHBfZGlzcGxheSk7Cj4gIAo+
IC0JcmV0dXJuIGRwLT5wYW5lbC0+c2RwX25lZWRzX2ZsdXNoOwo+ICsJcmV0dXJuIGRwLT5zZHBf
bmVlZHNfZmx1c2g7CgpbU2V2ZXJpdHk6IE1lZGl1bV0KVGhlIERQVSBlbmNvZGVyIHF1ZXJpZXMg
bXNtX2RwX25lZWRzX3BlcmlwaF9mbHVzaCgpIG9uIGV2ZXJ5IGZyYW1lIGtpY2tvZmYuCgpJZiB0
aGUgdmFsdWUgcmVtYWlucyBzdHVjayBhdCB0cnVlIGFmdGVyIGEgdHJhbnNpdGlvbiBhd2F5IGZy
b20gYSBWU0MgU0RQCm1vZGUsIGRvZXMgdGhpcyBjYXVzZSB0aGUgaGFyZHdhcmUgdG8gcGVyZm9y
bSB1bm5lY2Vzc2FyeSBwZXJpcGhlcmFsIGZsdXNoZXMKb24gZXZlcnkgVlNZTkMgZHVyaW5nIHRo
ZSBlbnRpcmUgZHVyYXRpb24gb2YgdGhlIG5ldyBtb2RlPwoKQ291bGQgd2UgcHJvdmlkZSBhIHdh
eSB0byBjbGVhciB0aGUgZmx1c2ggZmxhZyBvbmNlIHRoZSB0cmFuc2l0aW9uIGZyYW1lIGhhcwpi
ZWVuIHN1Y2Nlc3NmdWxseSBraWNrZWQgb2ZmPwoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0
dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MTAwOS1tc20tZHAtaGRyMTAtdjItMC0x
ODM1ZDQ5NjZkYTNAcmFkeGEuY29tP3BhcnQ9MTcKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFt
bG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
