Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B755E9A02C
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 Feb 2026 19:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KMIiYCZIM/jKHULBHGo83d1gCGwmpAZSDClJ07dxuW0=; b=v2ngEM3xI0nFo8
	zSs14F8U3A6X+D2uxuyHX3Jfhkkfec4NYSr55r19S0yIQfxn7XIO3BLgTIm4HSOzy7fXU7+7gmoSO
	94jlDX+uZLp8y1NwsFtGR+lc9HBMsmauQjWVWLByIBp4K5ilyMP34r6Iazxvd9zFapeQRjl8REpp0
	S9rSfKH8wqxB3AhZwPUooVrVKcT8jkfbNzDWeE227IK0zUF5LuWmRaYv3rmGFTs54QpNqPsbF5KMe
	jF1jF+4K7Btw9gwxrSLZFUut6/y+5KI62zEbgAN44yMGskYlDlZsK2/p9lsqSlf0q/BifCDMuJiRP
	/fM5DcMWJv8pQklqNpkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsnMe-0000000AJrH-2Ye0;
	Wed, 18 Feb 2026 19:37:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsnMc-0000000AJqw-2D5S
	for linux-amlogic@lists.infradead.org;
	Wed, 18 Feb 2026 19:37:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AC1A6600AE;
	Wed, 18 Feb 2026 19:37:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 036B0C116D0;
	Wed, 18 Feb 2026 19:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771443453;
	bh=QSiqkbhCSpolIkwNN+rC3vaMUgZzv7ANdP1o/sqB688=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZOkcS/ErtAIjMD3HRMBI7YVgjiLKsh2sPQVPvL/D4zPQ5ZRVgaBxhD4Ch7Iw1gIiu
	 J9PY+wv38ObXbCKmiN9W4BjTkiOAo+hRJx6TnGOOU4OQkJ2LJYEVO2pjl+mCti25/E
	 w9Kjs4e6dqd0/n19qO9MwqHlnpnfWMKgloNzMfz6rnC7XR4+cijeaZwBFnmCGzE5GH
	 Zm9Fhw2nIu3cC3mpdXGT6iliz7KPKlUQm2pUl5ZSVtVZ0RREyJDAKhCGpEKBejosUt
	 I44ELY2gGbxbmq34KB6sP9CUc5WUdbamfCmJesc19M3oNKrkOT4To2UTwBeql/bZY1
	 18Vo2OrPJnBcA==
Message-ID: <fc25180a-859a-45da-b3f8-7ccb2e4d73cf@kernel.org>
Date: Wed, 18 Feb 2026 20:37:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] dt-bindings: clk: meson: Add Amlogic T7 fix pll
 support
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Ronald Claveau <linux-kernel-dev@aliel.fr>,
 linux-amlogic@lists.infradead.org,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260218101709.35450-1-linux-kernel-dev@aliel.fr>
 <20260218105611.36216-1-linux-kernel-dev@aliel.fr>
 <594f4fcc-ad88-4969-b9e5-98061fd5b73c@kernel.org>
 <1j8qcp6ed1.fsf@starbuckisacylon.baylibre.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <1j8qcp6ed1.fsf@starbuckisacylon.baylibre.com>
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

T24gMTgvMDIvMjAyNiAyMDoyOCwgSmVyb21lIEJydW5ldCB3cm90ZToKPiBPbiBtZXIuIDE4IGbD
qXZyLiAyMDI2IGF0IDIwOjE3LCBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+
IHdyb3RlOgo+IAo+PiBPbiAxOC8wMi8yMDI2IDExOjU2LCBSb25hbGQgQ2xhdmVhdSB3cm90ZToK
Pj4+IEFkZCBQTEwgZm9yIHRoZSBjbG9jayBjb250cm9sbGVyIG9mIHRoZSBBbWxvZ2ljIFQ3IFNv
QyBmYW1pbHkuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogUm9uYWxkIENsYXZlYXUgPGxpbnV4LWtl
cm5lbC1kZXZAYWxpZWwuZnI+Cj4+PiAtLS0KPj4+ICBpbmNsdWRlL2R0LWJpbmRpbmdzL2Nsb2Nr
L2FtbG9naWMsdDctcGxsLWNsa2MuaCB8IDE2ICsrKysrKysrKysrKysrKysKPj4+ICAxIGZpbGUg
Y2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKQo+Pgo+PiBTbyB5b3UgaWdub3JlZCBteSBjb21tZW50
cz8KPj4KPj4gQW5kIHRoYXQncyB2Miwgbm90IHYxLiBZb3Ugc2VudCB2MSBhbmQgR09UIHRoZSBj
b21tZW50cy4KPiAKPiBJIHRoaW5rIHRoaXMgd2FzIHN0aWxsIHYxIGFuZCBpZiB5b3UgbG9vayBh
dCB0aW1lc3RhbXBzLCBQYXRjaCAxIHdhcyBzZW50CgpObwoKPiBiZWZvcmUgeW91ciBmaXJzdCBy
ZXBseSwgdGhlbiB0aGVyZSBpcyBsb3Qgb2YgdGltZSBiZXR3ZWVuIHRoZSBkaWZmZXJlbnQKPiBw
YXRjaGVzIC0gcHJvYmFibHkgZG9uZSBtYW51YWxseSAgLi4uIGF0IHBhdGNoIDYgKHRoZSBvbmUg
eW91J3ZlCj4gY29tbWVudGVkIGZpc3QpIHdhcyBzZW50IHR3aWNlLgoKMS4gdjE6Cmh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2FsbC8yMDI2MDIxODEwMTcyOC4zNTQ5Ny0xLWxpbnV4LWtlcm5lbC1k
ZXZAYWxpZWwuZnIvCldlZCwgMTggRmViIDIwMjYgMTE6MTc6MjYgKzAxMDAKCjIuIE15IHJlcGx5
IDUgbWludXRlcyBsYXRlcjoKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsL2E4NDhmYTQzLTZh
NDYtNGZkNi04NmE0LTk2YWFmODJlMmEwMkBrZXJuZWwub3JnLwpXZWQsIDE4IEZlYiAyMDI2IDEx
OjIxOjEzICswMTAwCQoKMy4gVGhpcyBwYXRjaCBzZW5kIGhhbGYgYW4gaG91ciBsYXRlcjoKaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjYwMjE4MTA1NjExLjM2MjE2LTEtbGludXgta2Vy
bmVsLWRldkBhbGllbC5mci8KV2VkLCAxOCBGZWIgMjAyNiAqMTE6NTY6MDkqICswMTAwCQoKYWZ0
ZXIgSSBhbHJlYWR5IHByb3ZpZGVkIGZlZWRiYWNrIGFib3V0IHdyb25nIHRocmVhZGluZy4KCgpC
ZXN0IHJlZ2FyZHMsCktyenlzenRvZgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0Bs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtYW1sb2dpYwo=
