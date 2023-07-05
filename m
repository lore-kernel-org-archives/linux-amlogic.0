Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4851DEB64DD
	for <linux-amlogic@archiver.kernel.org>; Wed,  5 Jul 2023 07:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fh+Eli2Xcv2v/XHlXlzH8fmGByMOi6adAqg1DAIKvLI=; b=ZqKZkjXYM1SmvK
	gK4hXBPR0FsY2+1nGJ89EIP164fO6GkJ9OpwbeNGz0hYCCKRmxx0NnZGI/IvVXr0oj3zG9dFadiqY
	8BhCEznDNOEnAMGihHEqkQRAk4qPUTJ7gbbl2Gdqy5oMyuEuZprbvrf6Nohpc2nNm8Zr867PFLzJQ
	Ni5hV2OyhihGRiLF2ms2/YT6wtFnTyGJ+1uRgfMfFe6lxJ6QH/RhPDYylJMiotL98J6pPl5uB0gkU
	G2CFjnqc0YpLDvcqrXXtKSjGeP49LIlFzLuic8qKo3/L+JfseYi9ykhk/HqmfcZa2PfcAHEVMMAVu
	NcbQBs8W478fx7IWsHwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGx4e-00F4dp-1u;
	Wed, 05 Jul 2023 07:37:16 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGx4b-00F4c0-0K;
	Wed, 05 Jul 2023 07:37:14 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1688542624;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q6JVbObW4DqYx9q0QffEzB/qcd5stuGhTxLhBBsyTh8=;
	b=g/yvzSdekzdtRDmOBQTW8pBMh4BYil5lC2CEjb78knxVTm9JJJ00Tud+XhonSVw/SryXua
	BqitCmzLqgtyHAyuxipzOuDrcoqK/3Tokvy0lq6x6hEakmLH90vS95kjSQWtn9sw7C4M7h
	wLG7VEYKz63Bs1kiD6zD9b9ZDsh14CN2XEsv1xX+GYnzbP1mu4w5JaOGli9paymNDvi7Kf
	mZwxvn+AJANdMsGKnK/xfu1Yg88XbS30DP8yKDHiEQPerwC9f2m4z8EDLvljwR0X6Vj4SF
	VX3hE2k+UO3hBc1poMG3z7bLVDWos0U1cKjOW4DRWgP420lcoFpqVOQCNM0NaA==
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 021B4FF809;
	Wed,  5 Jul 2023 07:37:02 +0000 (UTC)
Date: Wed, 5 Jul 2023 09:37:02 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
Cc: Liang Yang <liang.yang@amlogic.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman
 <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>, <oxffffaa@gmail.com>,
 <kernel@sberdevices.ru>, <linux-mtd@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH v2 1/2] dt-bindings: nand: meson: support for 512B
 ECC step size
Message-ID: <20230705093702.6c0421d7@xps-13>
In-Reply-To: <20230705065434.297040-2-AVKrasnov@sberdevices.ru>
References: <20230705065434.297040-1-AVKrasnov@sberdevices.ru>
	<20230705065434.297040-2-AVKrasnov@sberdevices.ru>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_003713_406208_49164AC2 
X-CRM114-Status: GOOD (  20.00  )
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

SGkgQXJzZW5peSwKCkFWS3Jhc25vdkBzYmVyZGV2aWNlcy5ydSB3cm90ZSBvbiBXZWQsIDUgSnVs
IDIwMjMgMDk6NTQ6MzMgKzAzMDA6Cgo+IE1lc29uIE5BTkQgc3VwcG9ydHMgYm90aCA1MTJCIGFu
ZCAxMDI0QiBFQ0Mgc3RlcCBzaXplLCBzbyByZXBsYWNlCj4gJ2NvbnN0JyBmb3Igb25seSAxMDI0
QiBzdGVwIHNpemUgd2l0aCBlbnVtIGZvciBib3RoIHNpemVzLgo+IAo+IFNpZ25lZC1vZmYtYnk6
IEFyc2VuaXkgS3Jhc25vdiA8QVZLcmFzbm92QHNiZXJkZXZpY2VzLnJ1Pgo+IC0tLQo+ICBEb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL2FtbG9naWMsbWVzb24tbmFuZC55YW1s
IHwgNCArKystCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24o
LSkKPiAKPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210
ZC9hbWxvZ2ljLG1lc29uLW5hbmQueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9tdGQvYW1sb2dpYyxtZXNvbi1uYW5kLnlhbWwKPiBpbmRleCAzYmVjOGFmOTFiYmIuLjgx
Y2E4ODI4NzMxYSAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvbXRkL2FtbG9naWMsbWVzb24tbmFuZC55YW1sCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL210ZC9hbWxvZ2ljLG1lc29uLW5hbmQueWFtbAo+IEBAIC00OSw3ICs0
OSw4IEBAIHBhdHRlcm5Qcm9wZXJ0aWVzOgo+ICAgICAgICAgIGNvbnN0OiBodwo+ICAKPiAgICAg
ICAgbmFuZC1lY2Mtc3RlcC1zaXplOgo+IC0gICAgICAgIGNvbnN0OiAxMDI0Cj4gKyAgICAgICAg
ZW51bTogWzUxMiwgMTAyNF0KPiArICAgICAgICBkZWZhdWx0OiAxMDI0CgpJIHdhcyBhY3R1YWxs
eSB3cm9uZyBpbiBteSBwcmV2aW91cyByZXZpZXcsIHRoZXJlIGlzIG5vIHN0cm9uZyBkZWZhdWx0
CmhlcmUgYXMgdGhlIGV4aXN0aW5nIGJpbmRpbmcgKGFuZCBjb2RlKSB0cnkgdG8gdXNlIHRoZSBj
bG9zZXN0CnBhcmFtZXRlcnMgcmVxdWlyZWQgYnkgdGhlIE5BTkQgY2hpcDogd2UgcGljayB0aGUg
Im9wdGltYWwiCmNvbmZpZ3VyYXRpb24uIFNvIGlmIHlvdSBkb24ndCBwcm92aWRlIGFueSB2YWx1
ZSBoZXJlLCB3ZSBleHBlY3QKdGhlIHN0cmVuZ3RoIGFuZCBzdGVwIHNpemUgYWR2ZXJ0aXplZCBi
eSB0aGUgY2hpcCB0byBiZSB1c2VkLiBUaGlzIGlzIGEKY29tbW9uIGRlZmF1bHQgaW4gdGhlIHJh
dyBOQU5EIHN1YnN5c3RlbS4KClBsZWFzZSBkcm9wIHRoZSBkZWZhdWx0IGxpbmUsIHJlLWludGVn
cmF0ZSB0aGUgbWlzc2luZyBSLWJ5IHRhZyBmcm9tClJvYiBhbmQgaW4gYSBzZXBhcmF0ZSBwYXRj
aCBwbGVhc2UgbWFyayBuYW5kLWVjYy1zdGVwLXNpemUgYW5kCm5hbmQtZWNjLXN0cmVuZ3RoIG1h
bmRhdG9yeSBpZiB0aGUgb3RoZXIgaXMgcHJvdmlkZS4gSU9XLCB3ZSBleHBlY3QKZWl0aGVyIGJv
dGgsIG9yIG5vbmUgb2YgdGhlbSwgYnV0IG5vdCBhIHNpbmdsZSBvbmUuCgo+ICAKPiAgICAgICAg
bmFuZC1lY2Mtc3RyZW5ndGg6Cj4gICAgICAgICAgZW51bTogWzgsIDE2LCAyNCwgMzAsIDQwLCA1
MCwgNjBdCj4gQEAgLTkzLDYgKzk0LDcgQEAgZXhhbXBsZXM6Cj4gICAgICAgIG5hbmRAMCB7Cj4g
ICAgICAgICAgcmVnID0gPDA+Owo+ICAgICAgICAgIG5hbmQtcmIgPSA8MD47Cj4gKyAgICAgICAg
bmFuZC1lY2Mtc3RlcC1zaXplID0gPDEwMjQ+OwoKU28gaW4gdGhlIGVuZCB0aGlzIGxpbmUgaXMg
d3JvbmcgYW5kIG9uY2UgeW91IGdldCB0aGUgZGVzY3JpcHRpb24gcmlnaHQKYXMgSSBtZW50aW9u
ZWQgaXQgYWJvdmUsIHRoaXMgd2lsbCBmYWlsIHRvIHBhc3MKYG1ha2UgRFRfU0NIRU1BX0ZJTEVT
PURvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvIGR0X2JpbmlkbmdfY2hlY2tg
ClBsZWFzZSBkcm9wIGl0IGZyb20gdGhlIGV4YW1wbGUsIGRvbid0IGFkZCB0aGUgc2Vjb25kIHBy
b3BlcnR5IGhlcmUsCml0J3MgYmVzdCB0byBzaG93IGEgY2xlYW4gZXhhbXBsZSB3aGVyZSBwZW9w
bGUgc3RvcCB0YW1wZXJpbmcgZm9yIG5vCnJlYXNvbiB3aXRoIHRoZSBvcHRpbWFsIHZhbHVlcy4K
Cj4gICAgICAgIH07Cj4gICAgICB9Owo+ICAKCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGlu
ZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
