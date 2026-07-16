Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C67AC44512
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Jul 2026 15:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dsZlBJKbm7hy+cCq1WIF8SocH4uoKcvP5AsvZz42nmw=; b=FARV2ZMFnhdkJN
	AyAQevMnCcpO34mj0fRt+K9VcqaugkEI2bANK0Mm6R5f9e9aYw5JbqXLAevb3q7bUIy0dkGf0T1dD
	UIO01/Vq/g4AXGrj6B5vxWTvTrbrWig+KXTUW6bOLw9RlZj2bWeuQ5k4RcdVWFgblZjEqjGEwot94
	lAkWbamCqPIKHmuEkwjvSiOLdzwCzrK8hvVTbsUT8LRsiNQVRlMn0mqKbZ3EV8mryBpSvJqUsTefh
	6+8dODAmidt3ImLqWVs+MBgMfoob9ewVhcBs9wKVwz9PUNRhr2WM29mIG5MfzsTkoDiOf1ox4LBIe
	GhVCTa5qIcJhdhBZsb/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkNwq-000000002W8-1pQr;
	Thu, 16 Jul 2026 15:24:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkNwq-000000002Ve-0YHY;
	Thu, 16 Jul 2026 15:24:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9992E434F1;
	Thu, 16 Jul 2026 15:24:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B3141F000E9;
	Thu, 16 Jul 2026 15:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784215467;
	bh=RHZlXDwmnmhNAHsXyKmT3KK/eNJCIlM0UHu2j00CWlo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MFGj1d40jZB6tW/rv23DOlwJ5g/uU/vVvaS1m2H0Zz2m854PSBpvTzTzUEsCLixjy
	 Gje41ODRwf+hr1UPkAill2j4M1f2GxHE34BrcWCnLgqIbK5ouoWBKRNphFgmZqxc3S
	 4SNTAT4rINmL4L6aBNTmMqJnFpUcQvpo9YLVOd3VqGilSpz83s++aPct0dEuTI9Bwq
	 phwYX+dTTO9tUv44z1SWA1eXsYnUrfh+lgSErFWtMj0fk/BxWpdIV59DRq7YhxR+9t
	 /Gn4CQqFAihfdLlw3ZGoXDUHL7WyhDH3j9bSa3SADRAlEmnF9szPbDxsYen/uQ7c5a
	 HVmKu8lK/qk+Q==
Date: Thu, 16 Jul 2026 16:24:20 +0100
From: Lee Jones <lee@kernel.org>
To: linux-kernel-dev@aliel.fr
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Beniamino Galvani <b.galvani@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v8 0/8] Add VIM4 MCU/FAN support
Message-ID: <20260716152420.GA1424265@google.com>
References: <20260702-add-mcu-fan-khadas-vim4-v8-0-244feee91a36@aliel.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260702-add-mcu-fan-khadas-vim4-v8-0-244feee91a36@aliel.fr>
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

T24gVGh1LCAwMiBKdWwgMjAyNiwgUm9uYWxkIENsYXZlYXUgdmlhIEI0IFJlbGF5IHdyb3RlOgoK
PiBUaGUgS2hhZGFzIFZJTTQgYm9hcmQgZmVhdHVyZXMgYSBkaWZmZXJlbnQgTUNVIHZhcmlhbnQg
Y29tcGFyZWQgdG8KPiBwcmV2aW91cyBWSU0gYm9hcmRzLgo+IFdoaWxlIGl0IHNoYXJlcyB0aGUg
c2FtZSBJMkMtYmFzZWQgY29tbXVuaWNhdGlvbiBtb2RlbCwKPiBpdCBkaWZmZXJzIGluIHNvbWUg
d2F5czoKPiAKPiAgIC0gQSBkaXN0aW5jdCByZWdpc3RlciBtYXAgd2l0aCBpdHMgb3duIHZvbGF0
aWxlL3dyaXRlYWJsZSByZWdpc3RlciBzZXQKPiAgIC0gQSBmYW4gY29udHJvbCB3aXRoIDDigJMx
MDAgbGV2ZWxzIGluc3RlYWQgb2YgdGhlIDDigJMzIGxldmVscyBwcmV2aW91c2x5Cj4gICAtIEEg
ZmFuIHBvd2VyIHN1cHBseSBnYXRlZCB0aHJvdWdoIGEgcmVndWxhdG9yCj4gCj4gVGhpcyBzZXJp
ZXMgYWRkcyBzdXBwb3J0IGZvciB0aGlzIG5ldyB2YXJpYW50IGJ5Ogo+IAo+ICAgMS4gUmVmYWN0
b3JpbmcgdGhlIGtoYWRhcy1tY3UgTUZEIGRyaXZlciB0byB1c2UgcGVyLXZhcmlhbnQgZGF0YQo+
ICAgICAgc3RydWN0dXJlcyAocmVnbWFwIGNvbmZpZywgY2VsbHMsIGZhbiBwbGF0Zm9ybSBkYXRh
KSwKPiAgICAgIGFuZCBhZGRpbmcgdGhlIGtoYWRhcyx2aW00LW1jdSBjb21wYXRpYmxlIHN0cmlu
Zy4KPiAKPiAgIDIuIEV4dGVuZGluZyB0aGUgZmFuIHRoZXJtYWwgZHJpdmVyIHRvIHJldHJpZXZl
IHRoZSBmYW4gcmVnaXN0ZXIKPiAgICAgIGFuZCBtYXhpbXVtIGxldmVsIGZyb20gcGxhdGZvcm1f
ZGF0YSwKPiAgICAgIGFuZCB0byBvcHRpb25hbGx5IG1hbmFnZSBhIHBvd2VyIHJlZ3VsYXRvciBm
b3IgdGhlIGZhbiBzdXBwbHkuCj4gCj4gICAzLiBBZGRpbmcgdGhlIGNvcnJlc3BvbmRpbmcgRFRT
IG5vZGUgZm9yIHRoZSBWSU00LCB3aXJpbmcgdGhlIE1DVSB0bwo+ICAgICAgdGhlIEkyQyBBT19B
IGJ1cyBhbmQgZXhwb3NpbmcgaXQgYXMgYSB0aGVybWFsIGNvb2xpbmcgZGV2aWNlLgo+IAo+IFNp
Z25lZC1vZmYtYnk6IFJvbmFsZCBDbGF2ZWF1IDxsaW51eC1rZXJuZWwtZGV2QGFsaWVsLmZyPgoK
VGhlIE1GRCBwYXJ0cyBsb29rIG9rYXkuCgpJIHRoaW5rIHRoZSBUaGVybWFsIGRyaXZlciBoYXMg
YSBkZXAgb24gdXMsIHJpZ2h0PwoKSWYgc28sIGxldCBtZSBrbm93IHdoZW4geW91IGhhdmUgdGhl
IEFja3MgYW5kIEknbGwgbWVyZ2UgaXQuCgotLSAKTGVlIEpvbmVzCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlz
dApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
