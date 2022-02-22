Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD7ECC433EF
	for <linux-amlogic@archiver.kernel.org>; Tue, 22 Feb 2022 15:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nfyBKjmRUw2WE5/dpcLgEGWJ9aNJoPp/DYilC58TElE=; b=3EwaLqEZ4cRwXO
	vAZmmCVuasbP/HjCR8AdQLjkgToGn0Hro9+AKi7McOLCJCNixjSV3iSP6f4aK5Xfcy7mkjIeLA9Sm
	Tg+mdSdMX9iern75ZPsYWCL7TfC3vaW2IbKSYkyGTnlm5ruaH8gFLWpG13/ebdI58b8gE671OqgFP
	y5nCb2G85wGkZonDfVn74Gs40xIzjJ0wNd+oECzNiQqLufAhE1UKbSAEiLT9ErxSgqcMUT2HYKPtQ
	4+jpkWH00bFoPGmx71fdActm8FA8oQjZ3xEAA+tiABFM5Yc+ZIXzj2AItt6MMRj2uCsKkwfiE7ije
	MDpiGPjaC/FRyosq7Gyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMX9c-00AFq7-NR; Tue, 22 Feb 2022 15:32:40 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMX9Z-00AFoN-JS; Tue, 22 Feb 2022 15:32:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 96532B81899;
 Tue, 22 Feb 2022 15:32:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75D9FC340E8;
 Tue, 22 Feb 2022 15:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645543954;
 bh=hNjIs26nygIYkkw5YihHsHJO97I8jy1Fkq9aRi9BXMc=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=OKUlzNGT1ez5dEEObkbQ+T4fvVprSKPIsRedW+JR5FxBdF+7sTDDKD/xtsUa7TnAi
 5JJObC7FCd7w2QlibThqYValUG2BKDsPXC/ZJu4nATcsnImANIUMsQT+rhQl/T2o4h
 qpU3zISDQnCdAjUOAO3bfZhtSR8l6tcZDNbkWLfVzcEU6TgpJwRh9CqYVLpFvrXjgD
 uDLFf13LRvicb42BA+eLPnSrV8lwDfkaFTS1d+s9C2vC8fJnHenS8kTXSdmTNzBRVq
 gtERfWivqhsJEo/cA6Gf35A1A0ApwQY673FaO3aLkeehniJpEmqYhty38RKExDI+p6
 8dr8M/rqOprmQ==
From: Mark Brown <broonie@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>, Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jerome Brunet <jbrunet@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Andreas Färber <afaerber@suse.de>, Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, Miguel Ojeda <ojeda@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>
Cc: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
In-Reply-To: <4172e59f-b9d5-d87d-9dbd-a6f683a2173c@gmail.com>
References: <4172e59f-b9d5-d87d-9dbd-a6f683a2173c@gmail.com>
Subject: Re: (subset) [PATCH 0/6] auxdisplay: Add support for the Titanmec
 TM1628 7 segment display controller
Message-Id: <164554395117.3556326.875396781569369503.b4-ty@kernel.org>
Date: Tue, 22 Feb 2022 15:32:31 +0000
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_073237_886070_F664C69D 
X-CRM114-Status: GOOD (  18.27  )
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

T24gU2F0LCAxOSBGZWIgMjAyMiAxNDoxMzoxMiArMDEwMCwgSGVpbmVyIEthbGx3ZWl0IHdyb3Rl
Ogo+IFRoaXMgc2VyaWVzIGFkZHMgc3VwcG9ydCBmb3IgdGhlIFRpdGFubWVjIFRNMTYyOCA3IHNl
Z21lbnQgZGlzcGxheQo+IGNvbnRyb2xsZXIuIEl0J3MgYmFzZWQgb24gcHJldmlvdXMgUkZDIHdv
cmsgZnJvbSBBbmRyZWFzIEbDpHJiZXIuCj4gVGhlIFJGQyB2ZXJzaW9uIHBsYWNlZCB0aGUgZHJp
dmVyIGluIHRoZSBMRUQgc3Vic3lzdGVtLCBidXQgdGhpcyB3YXMKPiBOQUsnZWQgYnkgdGhlIExF
RCBtYWludGFpbmVyLiBUaGVyZWZvcmUgSSBtb3ZlZCB0aGUgZHJpdmVyIHRvCj4gL2RyaXZlcnMv
YXV4ZGlzcGxheSB3aGF0IHNlZW1zIG1vc3QgcmVhc29uYWJsZSB0byBtZS4KPiAKPiBUbyBiZSBk
ZWNpZGVkIGlzIHRocm91Z2ggd2hpY2ggdHJlZSB0aGlzIHNlcmllcyBzaG91bGQgZ28uCj4gSSdk
IHRoaW5rIFNQSSB3b3VsZCBiZSBtb3N0IHN1aXRlZCwgYnV0IHRoYXQncyBhIGRlY2lzaW9uIEkK
PiBsZWF2ZSB1cCB0byB0aGUgcmVzcGVjdGl2ZSBtYWludGFpbmVycy4KPiAKPiBbLi4uXQoKQXBw
bGllZCB0bwoKICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9n
aXQvYnJvb25pZS9zcGkuZ2l0IGZvci1uZXh0CgpUaGFua3MhCgpbMS82XSBzcGk6IGdwaW86IElt
cGxlbWVudCBMU0IgRmlyc3QgYml0YmFuZyBzdXBwb3J0CiAgICAgIGNvbW1pdDogMTg0N2UzMDQ2
YzUyOGJkODViZDUxZTI4NjBmNDEzOWJkOTA1MmQ2YwoKQWxsIGJlaW5nIHdlbGwgdGhpcyBtZWFu
cyB0aGF0IGl0IHdpbGwgYmUgaW50ZWdyYXRlZCBpbnRvIHRoZSBsaW51eC1uZXh0CnRyZWUgKHVz
dWFsbHkgc29tZXRpbWUgaW4gdGhlIG5leHQgMjQgaG91cnMpIGFuZCBzZW50IHRvIExpbnVzIGR1
cmluZwp0aGUgbmV4dCBtZXJnZSB3aW5kb3cgKG9yIHNvb25lciBpZiBpdCBpcyBhIGJ1ZyBmaXgp
LCBob3dldmVyIGlmCnByb2JsZW1zIGFyZSBkaXNjb3ZlcmVkIHRoZW4gdGhlIHBhdGNoIG1heSBi
ZSBkcm9wcGVkIG9yIHJldmVydGVkLgoKWW91IG1heSBnZXQgZnVydGhlciBlLW1haWxzIHJlc3Vs
dGluZyBmcm9tIGF1dG9tYXRlZCBvciBtYW51YWwgdGVzdGluZwphbmQgcmV2aWV3IG9mIHRoZSB0
cmVlLCBwbGVhc2UgZW5nYWdlIHdpdGggcGVvcGxlIHJlcG9ydGluZyBwcm9ibGVtcyBhbmQKc2Vu
ZCBmb2xsb3d1cCBwYXRjaGVzIGFkZHJlc3NpbmcgYW55IGlzc3VlcyB0aGF0IGFyZSByZXBvcnRl
ZCBpZiBuZWVkZWQuCgpJZiBhbnkgdXBkYXRlcyBhcmUgcmVxdWlyZWQgb3IgeW91IGFyZSBzdWJt
aXR0aW5nIGZ1cnRoZXIgY2hhbmdlcyB0aGV5CnNob3VsZCBiZSBzZW50IGFzIGluY3JlbWVudGFs
IHVwZGF0ZXMgYWdhaW5zdCBjdXJyZW50IGdpdCwgZXhpc3RpbmcKcGF0Y2hlcyB3aWxsIG5vdCBi
ZSByZXBsYWNlZC4KClBsZWFzZSBhZGQgYW55IHJlbGV2YW50IGxpc3RzIGFuZCBtYWludGFpbmVy
cyB0byB0aGUgQ0NzIHdoZW4gcmVwbHlpbmcKdG8gdGhpcyBtYWlsLgoKVGhhbmtzLApNYXJrCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxv
Z2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
