Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0604CC27C5F
	for <linux-amlogic@archiver.kernel.org>; Sat,  8 Jun 2024 17:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FNUwy5b/3HhgoOGwRFbcveb+aDhOzMNWOw4tym2Qp/Y=; b=z0UKFV4qhdq6J3
	RwZGrW5j8gRWEUAwVRIk3W0AiDeKgMxzMd5nd319iYIp8D4KP969Uresl4AVaDIZAb26mUbcEpz/v
	TdYniYeeK/UNRrXpoPHaJf37e6L6LkYo1sMO+H1fM7JvsBG5KzqHqetCxICSVztwz+fV7fbEu8aBT
	Yu/OsfhjqXhM6U2N3IEHTQgQYPI8J0+jiDBonwcYgbgveUOxFYw/P5P8s941WEizGer0uJP2uGTsD
	gnbrcHiP8p+QsSni67KQluO119VEfRHouZHSbmfhIINf8iGoYstmXONwCAU6UOEQCdb/5jWKXerAH
	XbMbc+xB9h6GBt3nGozA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFzvG-00000000Tay-00jL;
	Sat, 08 Jun 2024 17:32:10 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFzvC-00000000TZT-2MtY;
	Sat, 08 Jun 2024 17:32:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C5D51CE059C;
	Sat,  8 Jun 2024 17:31:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7239CC2BD11;
	Sat,  8 Jun 2024 17:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717867917;
	bh=9CoFCdmwD77xRwqsXokhReaCzROWC7hV5HtjLditw7k=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=BRaztyqoiS7201ErgyBZakfm8XQeSiDCyUypZsurgxGNSJfbysBkD4ylzq/yL3k7b
	 6c5QAreLpuBj2RVDXVZX/5Khq3uq0L5jj5Gl6n4grZfBR9enG1C8ABIN3RLaz+c/Aa
	 vmmllsBaBVpaFF3tYkfeHHTYLgSHuaKjo+Z0hYFQCRwPJCe6qBc6pYtygO/kbzA0RD
	 XRO34b3v28bDxWsdiskHYGBZAyDusQ87DroN50jQX8IelyyBib3jDxed50l+AX15S/
	 Q8LFfgLFVPUkfihMGTacRv2GMiWnMOJR+k3a2c50Aycvqv3MzXE8UV1Gzp0aWPeHQ3
	 m9H0ehzpVoGsQ==
Date: Sat, 8 Jun 2024 18:31:46 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Christian Hewitt <christianshewitt@gmail.com>
Cc: kernel test robot <lkp@intel.com>, Lars-Peter Clausen <lars@metafoo.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-iio@vger.kernel.org, devicetree <devicetree@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org, AML
 <linux-amlogic@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>,
 llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 2/2] iio: adc: meson: add support for the GXLX SoC
Message-ID: <20240608183146.2a71572f@jic23-huawei>
In-Reply-To: <1E90764E-5D50-496A-B4DC-3D3982392183@gmail.com>
References: <20240604055431.3313961-2-christianshewitt@gmail.com>
	<202406041751.elQWr6cj-lkp@intel.com>
	<1E90764E-5D50-496A-B4DC-3D3982392183@gmail.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.42; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240608_103206_788535_A599407D 
X-CRM114-Status: UNSURE (   9.39  )
X-CRM114-Notice: Please train this message.
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

T24gV2VkLCA1IEp1biAyMDI0IDA3OjE1OjU4ICswNDAwCkNocmlzdGlhbiBIZXdpdHQgPGNocmlz
dGlhbnNoZXdpdHRAZ21haWwuY29tPiB3cm90ZToKCj4gPiBPbiA0IEp1biAyMDI0LCBhdCAxOjEw
4oCvUE0sIGtlcm5lbCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29tPiB3cm90ZToKPiA+IAo+ID4g
a2VybmVsIHRlc3Qgcm9ib3Qgbm90aWNlZCB0aGUgZm9sbG93aW5nIGJ1aWxkIGVycm9yczogIAo+
IAo+IEFwb2xvZ2llcy4gQnVpbGQgZXJyb3JzIGFyZSBiZWNhdXNlIEkgd3JvbmdseSBpbWFnaW5l
ZCB0aGlzIGRlcGVuZGVudCBzZXJpZXMgZnJvbSBNYXJ0aW4gdG8gYmUgbWVyZ2VkOgo+IAo+IGh0
dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1hcm0ta2VybmVsL2NvdmVy
LzIwMjQwMzIzMjMxMzA5LjQxNTQyNS0xLW1hcnRpbi5ibHVtZW5zdGluZ2xAZ29vZ2xlbWFpbC5j
b20vCj4gCj4gVG8gYmUgY29udGludWVkIQpHaXZlbiB0aGF0IHdhcyBhIGNhc2Ugb2Ygbm90IGdv
aW5nIHRvIHJpZ2h0IG1haWxpbmcgbGlzdCwgaWYgeW91IHdhbnQKKGFuZCBNYXJ0aW4gZG9lc24n
dCBoYXZlIHRpbWUpIGl0IGlzIGZpbmUgdG8gcGljayB0aGF0IHVwIGFuZCBzZW5kIGl0CmEgc2lu
Z2xlIHNlcmllcyB3aXRoIHlvdXIgY2hhbmdlcy4KClRoYW5rcywKCkpvbmF0aGFuCgo+IAo+IENo
cmlzdGlhbgo+IAo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LWFtbG9naWMK
