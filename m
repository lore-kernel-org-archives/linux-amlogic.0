Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 296F7606A31C
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Nov 2026 16:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rCQlFxZ7;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=aliel.fr header.i=@aliel.fr header.a=rsa-sha256 header.s=courrier-s1 header.b=nJj+NIgZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=yDBcK4BNrm7sUeiL/EElDIJn7RrRwPG8wYb+L7+PbR8=; b=rCQlFxZ7RYiuJfhWkTn3nfWpyw
	vLrs8k6BfypARJBrVlXzQ7x/jAd5FhjNa/yr5pladlGR1HdlJcR7eW/Q+NgAR6hi9y9w6IY4theEu
	Mhj+s/vvLYrGEMFLCfejyZgwz0y2Ea0n3H5E70qci9Q92EmpDALBGj3Y8tFIItxufaVmFGtZnmpoa
	T+dx9+DxjhtJiJBsxWi0uHYjLF8EMCCoLZAX9LmKZe5i4eQOVZiowRpa1DTFD3zhI31e3HKu6B5VI
	U5UCXunlxXvaS9lwWEnI8recAdB2S8ytqWFISt+4ckm7aExXbXVbY0R7i2bwf87/iw/Rk1WBhJHdZ
	VRkU61vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWcWn-0000000DwZD-3LHF;
	Thu, 26 Nov 2026 16:40:57 +0000
Received: from courrier.aliel.fr ([2a01:4f9:c011:1c83::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWcWj-0000000DwY9-1kMW;
	Thu, 26 Nov 2026 16:40:56 +0000
Message-ID: <c31cbdf7-87ca-46bf-ad89-cb4c8b5dfe55@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1795711248;
	bh=wA6+NWNs2Pzeunxgi7qRF97OZsO9dKoJhUUzdBBn10s=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=nJj+NIgZX8FjurIbJnvn704fI1Ag9bw1pNgQEwogjT4rkDWjON5w6WPe4X3747V9Y
	 xfU3ptTlMU1VSCBsHjmzmaSodmVyQHiMbDD7K923DneifPJ61ATyZX7sw+FSTMip4G
	 zMz6cilJzCvbtD34XhkhAyP6Vnk1CnQT8P0Co1k4=
Date: Thu, 26 Nov 2026 17:40:46 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: linux-kernel-dev@aliel.fr
Subject: Re: [PATCH v4 00/11] phy/drm: amlogic: Extract Meson HDMI TX PHY into
 a dedicated driver
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Vinod Koul <vkoul@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Ulf Hansson <ulfh@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org
References: <20261123-meson-drm-create-hdmitx-phy-v4-0-3fb94f5534ca@aliel.fr>
 <CAFBinCD822UPQrrd_8ZbVRUVCVJ-3pGN69vbZBxUE+0yeMcysg@mail.gmail.com>
 <6e408f48-17ca-4927-ae09-c4153e294371@linaro.org>
Content-Language: en-US
In-Reply-To: <6e408f48-17ca-4927-ae09-c4153e294371@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_084053_911395_9BC6C36D 
X-CRM114-Status: GOOD (  15.89  )
X-Spam-Score: -1.1 (-)
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

T24gMTEvMjUvMjYgMDk6MTQsIE5laWwgQXJtc3Ryb25nIHdyb3RlOgo+IE9uIDExLzI0LzI2IDIz
OjA1LCBNYXJ0aW4gQmx1bWVuc3RpbmdsIHdyb3RlOgo+PiBIaSBSb25hbGQsIEhpIE5laWwsCj4+
Cj4+IGZpcnN0IG9mIGFsbDogdGhhbmtzIFJvbmFsZCBmb3IgcGlja2luZyB0aGlzIHVwIQo+PiBJ
IGxpa2UgdGhlIG92ZXJhbGwgYXBwcm9hY2guIEJlZm9yZSBJIGRpdmUgZGVlcCBpbnRvIHRoaXMg
c2VyaWVzIEkKPj4gd2lsbCBmaW5pc2ggdGhlIGNvZGUtcmV2aWV3IG9mIFZhbGVyaW8ncyBBVURJ
TiBzZXJpZXMuCj4+Cj4+IFR3byBxdWljayBub3RlcyBiZWxvdy4KPj4KPj4gT24gTW9uLCBOb3Yg
MjMsIDIwMjYgYXQgODozOOKAr1BNIFJvbmFsZCBDbGF2ZWF1IHZpYSBCNCBSZWxheQo+PiA8ZGV2
bnVsbCtsaW51eC1rZXJuZWwtZGV2LmFsaWVsLmZyQGtlcm5lbC5vcmc+IHdyb3RlOgo+PiBbLi4u
XQo+Pj4gT3ZlcnZpZXcgb2YgdGhlIHNlcmllczoKPj4+IC0gUGF0Y2hlcyAxLTM6IEZpeCBjb21w
YXRpYmxlIG1hdGNoaW5nIGluIG1lc29uLWd4LWhoaS1zeXNjdHJsIGJpbmRpbmdzLAo+Pj4gwqDC
oCBhZGQgdGhlIG5ldyBhbWxvZ2ljLG1lc29uLWhkbWktdHgtcGh5IERUIHNjaGVtYSwgYW5kIGFs
bG93IHRoZQo+Pj4gwqDCoCAiaGRtaS1waHkiIGNoaWxkIG5vZGUgdW5kZXIgdGhlIEhISSBzeXNj
b24uCj4+IEl0J3MgYmVlbiBhIGxvbmcgdGltZSwgYnV0IEkgdGhpbmsgd2UndmUgYmVlbiBhc2tl
ZCBieSB0aGUgZGV2aWNldHJlZQo+PiBtYWludGFpbmVycyB0byBoYXZlIHJlZyBwcm9wZXJ0aWVz
IGZvciB0aGUgbm9kZXMgd2l0aGluICZoaGkKPj4gQnV0IEkgY2FuJ3QgZmluZCB0aGUgbWVzc2Fn
ZSBhdCB0aGUgbW9tZW50Lgo+IAo+IFRoZSBoaGkgc3lzY29uIG5vZGVzIGRvZXNuJ3QgaGF2ZSAj
W2FkZHJlc3N8c2l6ZV0tY2VsbHMgYW5kIHNvIGZhciBpdAo+IHdhc24ndCByZXF1aXJlZCwgbGV0
J3Mgd2FpdCBmb3IgYSByZXZpZXcgZnJvbSBEVCBtYWludGFpbmVycywgSSdtIGZpbmUKPiB3aXRo
IHRoZSBjdXJyZW50IGRlc2lnbgo+IAoKSSBmb3VuZCBhbiBvbGQgZGlzY3Vzc2lvbiB0byBkcm9w
IGEgcmVnIFswXS4KTXkgdW5kZXJzdGFuZGluZyBpcyB3ZSBkb24ndCBuZWVkIGEgcmVnIGhlcmUu
CgpbMF0gaHR0cHM6Ly9sa21sLml1LmVkdS8yMzExLjEvMDU2MTIuaHRtbAoKPj4KPj4+IC0gUGF0
Y2ggNDogQWRkIHRoZSBuZXcgTWVzb24gSERNSSBUWCBQSFkgZHJpdmVyIGltcGxlbWVudGluZyB0
aGUgSERNSQo+Pj4gwqDCoCBQSFkgY29uZmlndXJhdGlvbiBvcHMsIGFsb25nIHdpdGggdGhlIHRl
bXBvcmFyeSBsZWdhY3kgY3JlYXRpb24KPj4+IMKgwqAgaGVscGVyLgo+PiBBdCBxdWljayBnbGFu
Y2UgeW91ciBQSFkgYXBwcm9hY2ggd291bGQgYWxzbyBmaXQgcGh5LW1lc29uOC1oZG1pLXR4LmMK
Pj4gVGhlcmUgc2VlbSB0byBiZSBtaW5vciBkaWZmZXJlbmNlczoKPj4gLSB0d28gYWRkaXRpb25h
bCBlbmFibGUgYml0cyBpbiBISElfSERNSV9QSFlfQ05UTDEgb24gR1hCQiBhbmQgbmV3ZXI6Cj4+
IEhETUlfRklGT19FTkFCTEU9QklUKDIpIGFuZMKgIEhETUlfRklGT19XUl9FTkFMQkU9QklUKDMp
Cj4+IC0gbmV3ZXIgU29DcyBzZWVtIHRvIGhhdmUgSEhJX0hETUlfUEhZX0NOVEwzLi41Cj4+Cj4+
IE1lc29uOC84Yi84bTIgSERNSSBzdXBwb3J0IGlzIG5vdCB1cHN0cmVhbSB5ZXQuIFRoYXQncyB3
aHkgdGhvc2UgU29DJ3MKPj4gd29uJ3QgbmVlZCB0aGUgYmFja3dhcmRzIGNvbXBhdGliaWxpdHkg
Y29kZS4gU28gaWYgeW91IG5lZWQgdG8gdHdlYWsKPj4gdGhlIGRyaXZlcjogZmVlbCBmcmVlLCB0
aGVyZSdzIG5vdCBtdWNoIHlvdSBjYW4gYnJlYWshCj4+CgpZZXMgSSBkaWQgbm90IHdhbnQgdG8g
YnJlYWsgdGhlIE1lc29uOCBkcml2ZXIuIEkgd2lsbCBzZW5kIGEgcHJvcG9zYWwgdG8KaW50ZWdy
YXRlIHRoZSBvdGhlciBTT0NzIGludG8gaXQsIGFuZCBtYWtlIGl0IGdlbmVyaWMuCgo+Pgo+PiBC
ZXN0IHJlZ2FyZHMsCj4+IE1hcnRpbgo+IAo+IFRoYW5rcywKPiBOZWlsCgoKLS0gCkJlc3QgcmVn
YXJkcywKUm9uYWxkCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1hbWxvZ2ljCg==
