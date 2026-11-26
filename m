Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E5E606A327
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Nov 2026 15:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hJpybAkf;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=aliel.fr header.i=@aliel.fr header.a=rsa-sha256 header.s=courrier-s1 header.b=RzUt/cFA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=/KlQ/Mo7/bhSUin6zGI8NKu01sZ935XoFFOape2ABzM=; b=hJpybAkfzNDHYHMNPvumKVxp8j
	rXUJv1xh/nmvSFyPR7SuxrGslAyacVxX09nqFCNDcaQim0i11XZ4SwgzOZXHByvFwZVIFarr9Ka8C
	b904nI6dk2XvoUKWSOI1YmTqzxqtc57ufbMM2sn3JOmbd3Y97G6q2G5e1hzUbVLZoO/d4mIkmz7Yc
	rkyF9HAtZAVxH9eks37uAe80tYI2YUVcdPOmwGklW+prxklCobbt1e1ZI/8Vj4IidaP15ZQmHeVFW
	iMqXf/KMI3Uimxi08brxYFYDNVWGgitO7Z4eJ1WrD/xhKzOKjE0w+fOLyQAPk7rE7RE5S0lR7NjJn
	2sGwIIDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWbej-0000000Dmaz-0rMW;
	Thu, 26 Nov 2026 15:45:05 +0000
Received: from courrier.aliel.fr ([2a01:4f9:c011:1c83::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWbef-0000000DmZK-3JfG;
	Thu, 26 Nov 2026 15:45:03 +0000
Message-ID: <57d28bc3-04f1-4a86-ba9a-aa851e42610b@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1795707894;
	bh=04dcLTbLWG5N5d7t79/Zb1pDQ+FtO2giwNZpa42wm9Q=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=RzUt/cFA0YHKfXN4T41/CPi6x2ah6O7gE/XstF5FnOYX1T84uet60DKZtR7E5seTg
	 HFpwgcyCVQTGtMh6z22U0zua9LkkjUIJ3vhk/Gx0Gt1ftqGeS5OSG5K3LAMkWfBwby
	 PhIGC35qaKLr/agm8X0j+s2MbCFx7wG8pYDtL6cA=
Date: Thu, 26 Nov 2026 16:43:03 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: linux-kernel-dev@aliel.fr
Subject: Re: [PATCH v4 06/11] pmdomain: amlogic: meson-ee-pwrc: power up
 memories for boot-enabled domains
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Vinod Koul <vkoul@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Ulf Hansson <ulfh@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org
References: <20261123-meson-drm-create-hdmitx-phy-v4-0-3fb94f5534ca@aliel.fr>
 <20261123-meson-drm-create-hdmitx-phy-v4-6-3fb94f5534ca@aliel.fr>
 <CAPx+jO_K+sEwm4CCBUdYz0FzJuYNhKizy4VDpQ=Ystm1aPxbZg@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAPx+jO_K+sEwm4CCBUdYz0FzJuYNhKizy4VDpQ=Ystm1aPxbZg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_074502_281681_B4C11143 
X-CRM114-Status: GOOD (  14.07  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gMTEvMjYvMjYgMTM6MDQsIFVsZiBIYW5zc29uIHdyb3RlOgo+IE9uIE1vbiwgTm92IDIzLCAy
MDI2IGF0IDg6MzjigK9QTSBSb25hbGQgQ2xhdmVhdSB2aWEgQjQgUmVsYXkKPiA8ZGV2bnVsbCts
aW51eC1rZXJuZWwtZGV2LmFsaWVsLmZyQGtlcm5lbC5vcmc+IHdyb3RlOgo+Pgo+PiBGcm9tOiBS
b25hbGQgQ2xhdmVhdSA8bGludXgta2VybmVsLWRldkBhbGllbC5mcj4KPj4KPj4gV2hlbiBhIHBv
d2VyIGRvbWFpbiBpcyBmb3VuZCBhbHJlYWR5IHBvd2VyZWQgb24gYXQgcHJvYmUgdGltZSAodHlw
aWNhbGx5Cj4+IHRoZSBWUFUgZG9tYWluIGxlZnQgZW5hYmxlZCBieSB0aGUgYm9vdGxvYWRlciks
IHRoZSBkcml2ZXIgcmVnaXN0ZXJzIHRoZQo+PiBnZW5wZCBpbiB0aGUgT04gc3RhdGUgd2l0aCBH
RU5QRF9GTEFHX0FMV0FZU19PTiBhbmQgbmV2ZXIgY2FsbHMKPj4gbWVzb25fZWVfcHdyY19vbigp
LiBBcyBhIHJlc3VsdCwgdGhlIG1lbW9yeSBwb3dlci1kb3duIGJpdHMgb2YgdGhlIGRvbWFpbgo+
PiBhcmUgbm90IHRvdWNoZWQuCj4+Cj4+IHB3cmNfZWVfaXNfcG93ZXJlZF9vZmYoKSBvbmx5IGNo
ZWNrcyB0aGUgdG9wLWxldmVsIHNsZWVwIGJpdCwgc28gYQo+PiBib290bG9hZGVyIHRoYXQgZW5h
YmxlZCB0aGUgVlBVIHdpdGhvdXQgd2FraW5nIGV2ZXJ5IG1lbW9yeSBibG9jawo+PiBsZWF2ZXMg
dGhvc2UgbWVtb3JpZXMgcG93ZXJlZCBkb3duLCBhbmQgbm90aGluZyBpbiB0aGUgZ2VucGQgZnJh
bWV3b3JrCj4+IHdpbGwgd2FrZSB0aGVtIHNpbmNlIHBtX3J1bnRpbWVfcmVzdW1lX2FuZF9nZXQo
KSBpcyBhIG5vLW9wIGZvciBhbgo+PiBhbHdheXMtb24gZG9tYWluLgo+Pgo+PiBUaGlzIGlzIGEg
cHJlcGFyYXRvcnkgY2hhbmdlOiBhIGZvbGxvd2luZyBwYXRjaCBkcm9wcyB0aGUgZXhwbGljaXQK
Pj4gSEhJX01FTV9QRF9SRUcwIHdyaXRlIGZyb20gdGhlIG1lc29uX2R3X2hkbWkgZHJpdmVyLCB3
aGljaCByZWxpZXMgb24gdGhlCj4+IHBvd2VyIGRvbWFpbiB0byBwb3dlciB0aGUgSERNSVRYIG1l
bW9yeS4KPiAKPiBBIHF1ZXN0aW9uLCBpcyB0aGUgdGFyZ2V0IHRvIGRyb3AgdGhlIEdFTlBEX0ZM
QUdfQUxXQVlTX09OIGJpdCBmb3IKPiB0aGVzZSBQTSBkb21haW5zLCBvbmNlIHRoZSBjb25zdW1l
ciBkcml2ZXJzIGhhdmUgcmVjZWl2ZWQgcHJvcGVyCj4gc3VwcG9ydCBmb3IgcnVudGltZSBQTT8K
PiAKCkluZGVlZCwgdGhhdCB3b3VsZCBiZSB0aGUgbmF0dXJhbCBmb2xsb3ctdXAgdG8gbWUuCgo+
IEluIGFueSBjYXNlLCB0aGlzIGxvb2tzIGdvb2QgdG8gbWUhIERvIHlvdSB3YW50IG1lIHRvIGFw
cGx5IHRoaXMgdmlhCj4gbXkgcG1kb21haW4gdHJlZT8KPiAKClllcyBwbGVhc2UsIHRoYXQgaXMg
ZmluZSB0byBtZS4KCj4gS2luZCByZWdhcmRzCj4gVWZmZQo+IAoKCi0tIApCZXN0IHJlZ2FyZHMs
ClJvbmFsZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1s
b2dpYwo=
