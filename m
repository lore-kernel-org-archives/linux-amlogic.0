Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4B6EC27C75
	for <linux-amlogic@archiver.kernel.org>; Wed, 12 Jun 2024 08:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mrVBGNfqfVtitLjDX0pGkzLpXzWscjV4NSKualLC9aM=; b=m3YdAXD9O/K96R
	S3UtgX8snTdxNxyDd/v0GIkqhv1C2DZwAvy7QLZEUuJGTXHMIHCM1GdmkaZ8RpWmsPm5QkKDwgEKU
	GDkKHcF9fnrf6w7/bXUutl54D4KWK7GpX5IIeI2QNMk5A36bEAWQJfe5yFFlkgfrf8EbashXNtIgO
	8Y4W6mXVa3rGsF1CphNNGyXjO+K3HYAywyWsIZo7Q+IaBqsmyOr6O2NKIhaeqDn379dEn2bYRY4sz
	podv8Yet04YiQq3J5jWKf37h1E2Bo1d4/LUktsRsE3Nvq+IONB7WaA2otW4z4DFENXGwkXBnOxJzU
	Q3VrIqWq8DAiCY4zApgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHJ5t-0000000Bdj0-2uu1;
	Wed, 12 Jun 2024 08:12:33 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHJ5q-0000000Bdhn-3rEH;
	Wed, 12 Jun 2024 08:12:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718179949;
	bh=rLJunDbeQeAUOd1JejIPRVqX35zvCbzWB9CqhTOod/w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=q0RWbMR9uA0R0gEmNo/Y42AKdEY0c8S2LtxkiNObYUUoOkwdu26EjDos8f9ExotJ1
	 pv7VbPZZDqiBgjCuO3kHA3+PdUXqj1G1N0dIGS2D5UyRZgvm0AyOsUIwLLbX6s7xjx
	 7vusY0GZrdJdkzFMks1JOJ83fMKjFYUwCiZ4VWPOiWs1r2S3tu/gyN6itwc7U9ksDK
	 Pm+02wXMtSckWKMOUuD/K1ZquWNrilL7dr7UzW2Nbl3ldSAshzuzyJknCp4TiNfZVW
	 clvAMte8TGX23djR8BpQ9hpyiAALcGMkdHtywsbf6SpRT4To25jen3L0Gvepm5aKXo
	 8zRzswiHzBYgQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id EC54D37820A9;
	Wed, 12 Jun 2024 08:12:27 +0000 (UTC)
Message-ID: <ea604d75-e571-4d63-a7e2-aa1393588c75@collabora.com>
Date: Wed, 12 Jun 2024 10:12:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: add missing MODULE_DESCRIPTION() macros
To: neil.armstrong@linaro.org, Jeff Johnson <quic_jjohnson@quicinc.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Linus Walleij <linusw@kernel.org>,
 Imre Kaloz <kaloz@openwrt.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
References: <20240611-md-drivers-soc-v1-1-8f0fc9fff234@quicinc.com>
 <a314c676-3dbd-46f8-826a-2e59367d30ce@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <a314c676-3dbd-46f8-826a-2e59367d30ce@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_011231_111308_2A1A354C 
X-CRM114-Status: GOOD (  11.51  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SWwgMTIvMDYvMjQgMDk6NTgsIE5laWwgQXJtc3Ryb25nIGhhIHNjcml0dG86Cj4gT24gMTIvMDYv
MjAyNCAwNzo1MCwgSmVmZiBKb2huc29uIHdyb3RlOgo+PiBXaXRoIEFSQ0g9eDg2LCBtYWtlIGFs
bG1vZGNvbmZpZyAmJiBtYWtlIFc9MSBDPTEgcmVwb3J0czoKPj4gV0FSTklORzogbW9kcG9zdDog
bWlzc2luZyBNT0RVTEVfREVTQ1JJUFRJT04oKSBpbiBkcml2ZXJzL3NvYy9pbXgvc29jLWlteDht
Lm8KPj4gV0FSTklORzogbW9kcG9zdDogbWlzc2luZyBNT0RVTEVfREVTQ1JJUFRJT04oKSBpbiBk
cml2ZXJzL3NvYy9peHA0eHgvaXhwNHh4LXFtZ3Iubwo+PiBXQVJOSU5HOiBtb2Rwb3N0OiBtaXNz
aW5nIE1PRFVMRV9ERVNDUklQVElPTigpIGluIGRyaXZlcnMvc29jL2l4cDR4eC9peHA0eHgtbnBl
Lm8KPj4gV0FSTklORzogbW9kcG9zdDogbWlzc2luZyBNT0RVTEVfREVTQ1JJUFRJT04oKSBpbiAK
Pj4gZHJpdmVycy9zb2MvbWVkaWF0ZWsvbXRrLWNtZHEtaGVscGVyLm8KPj4gV0FSTklORzogbW9k
cG9zdDogbWlzc2luZyBNT0RVTEVfREVTQ1JJUFRJT04oKSBpbiAKPj4gZHJpdmVycy9zb2MvYW1s
b2dpYy9tZXNvbi1jbGstbWVhc3VyZS5vCj4+Cj4+IEFkZCB0aGUgbWlzc2luZyBpbnZvY2F0aW9u
cyBvZiB0aGUgTU9EVUxFX0RFU0NSSVBUSU9OKCkgbWFjcm8uCj4+Cj4+IFNpZ25lZC1vZmYtYnk6
IEplZmYgSm9obnNvbiA8cXVpY19qam9obnNvbkBxdWljaW5jLmNvbT4KPj4gLS0tCj4+IFRoaXMg
aXMgdGhlIGxhc3Qgb2YgdGhlIGlzc3VlcyB0aGF0IEkgc2VlIGluIHRoZSBzb2MgZGlyZWN0b3J5
Cj4+IC0tLQo+PiDCoCBkcml2ZXJzL3NvYy9hbWxvZ2ljL21lc29uLWNsay1tZWFzdXJlLmMgfCAx
ICsKPiAKPiBSZXZpZXdlZC1ieTogTmVpbCBBcm1zdHJvbmcgPG5laWwuYXJtc3Ryb25nQGxpbmFy
by5vcmc+ICMgZm9yIAo+IGFtbG9naWMvbWVzb24tY2xrLW1lYXN1cmUuYwo+IAo+PiDCoCBkcml2
ZXJzL3NvYy9pbXgvc29jLWlteDhtLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAxICsKPj4g
wqAgZHJpdmVycy9zb2MvaXhwNHh4L2l4cDR4eC1ucGUuY8KgwqDCoMKgwqDCoMKgwqAgfCAxICsK
Pj4gwqAgZHJpdmVycy9zb2MvaXhwNHh4L2l4cDR4eC1xbWdyLmPCoMKgwqDCoMKgwqDCoCB8IDEg
Kwo+PiDCoCBkcml2ZXJzL3NvYy9tZWRpYXRlay9tdGstY21kcS1oZWxwZXIuY8KgIHwgMSArCj4+
IMKgIDUgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCj4+CgpNZWRpYVRlazoKUmV2aWV3
ZWQtYnk6IEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vIDxhbmdlbG9naW9hY2NoaW5vLmRlbHJl
Z25vQGNvbGxhYm9yYS5jb20+CgouLi5idXQgSSdtIG5vdCBzdXJlIGhvdyB3ZSBzaG91bGQgYXBw
bHkgdGhpcz8gOi0pCgpFaXRoZXIgQXJuZCB0YWtlcyBpdCBkaXJlY3RseSwgb3IgeW91IHNwbGl0
IGl0IHBlci1zb2MuLi4gYW5kIEkgZG9uJ3QgaGF2ZSBhbnkKcHJlZmVyZW5jZSBhbnl3YXkuCgoo
UC5TLjogQWRkZWQgQXJuZCB0byB0aGUgbG9vcCkKCkNoZWVycywKQW5nZWxvCgo+PiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9zb2MvbWVkaWF0ZWsvbXRrLWNtZHEtaGVscGVyLmMgCj4+IGIvZHJpdmVy
cy9zb2MvbWVkaWF0ZWsvbXRrLWNtZHEtaGVscGVyLmMKPj4gaW5kZXggMDQ2NTIyNjY0ZGMxLi5k
ZDcwZDRkMmJlZDcgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvc29jL21lZGlhdGVrL210ay1jbWRx
LWhlbHBlci5jCj4+ICsrKyBiL2RyaXZlcnMvc29jL21lZGlhdGVrL210ay1jbWRxLWhlbHBlci5j
Cj4+IEBAIC01MjYsNCArNTI2LDUgQEAgaW50IGNtZHFfcGt0X2ZpbmFsaXplKHN0cnVjdCBjbWRx
X3BrdCAqcGt0KQo+PiDCoCB9Cj4+IMKgIEVYUE9SVF9TWU1CT0woY21kcV9wa3RfZmluYWxpemUp
Owo+PiArTU9EVUxFX0RFU0NSSVBUSU9OKCJNZWRpYVRlayBDb21tYW5kIFF1ZXVlIChDTURRKSBk
cml2ZXIiKTsKPj4gwqAgTU9EVUxFX0xJQ0VOU0UoIkdQTCB2MiIpOwo+Pgo+PiAtLS0KPj4gYmFz
ZS1jb21taXQ6IDgzYTdlZWZlZGM5YjU2ZmU3YmZlZmYxM2I2YzczNTY2ODhmZmE2NzAKPj4gY2hh
bmdlLWlkOiAyMDI0MDYxMS1tZC1kcml2ZXJzLXNvYy0xNzgwYjE5Mzk2MjcKPj4KPiAKCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dp
YyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
