Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FD1DC28B30
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Mar 2025 11:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:
	Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0IDbW9lP0AyO3HIfOMuOo33zEhknbXhr0rTbSj+sZPw=; b=U19U3Affsqn5t/
	gh+oGBrqJu7dZ8mMWtj5v+84Si3ZYxOoHs3/HbQDKtY+lRcXjXT8w4lsqJjLCgRLuDMKIJngkkXYs
	i3zY5PYkeo6ZKY7awz6ELpkNHPBxdKfmHJvcK685Sb5zIYNyBMjPQjbDj2O3xmMgNtBAHPTt6Gifc
	jNMx6mMJ99ohC52bUg4Ku0vO+OASZKQq9EdlZfOBDnBLD+ac9pmAdmRZAJTUrlaElylGqt/GjmVzH
	FTmUAMjhMjHKbqajNCHe2UEHOCUjxWqEpcB32E5IAB7VO0jwMZWiL8VnsQ2h6iWpsxvVR6day/hDa
	RTP14BBdZg5/VoVSntSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvDiw-0000000BuDx-3Wry;
	Thu, 20 Mar 2025 11:06:06 +0000
Received: from out-188.mta0.migadu.com ([2001:41d0:1004:224b::bc])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvDhM-0000000Bu3i-214Q
	for linux-amlogic@lists.infradead.org;
	Thu, 20 Mar 2025 11:04:29 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1742468646;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GvO6U5e3ou7cohuaaLtiVKLu/0FNfSOPql7f4CQNZ20=;
	b=Y/wumE1iWwGTzwcOYHCaxujevsLP2sVF0WD0JCoz2y6HfR5rRs0AGGm47M+kkVy047HPVX
	WugwszOrVFVU9ySFiHnHRQz1EZsIz5gNxS63sDEH6qyenzgbEQj6WuCqqacEKHM26sRpSo
	RmcAb8zo+DJtS3dtY0/S0h4g6jayJlpU7mt/fU1/vpj8EWA+M1UvFXy4oW91TwJtWH/bdi
	s080GE/cSXSw2J9UENTHlmLfLtDKOYBLVF4acbnbuL/PGcHrSabeMDBK4V+rDhBIGIBqGW
	VWcRzLT/7q7secuqVx0Whe2UUvZVQSmGK5rGspeTCAKiE7lX3EiWgChPDnhINA==
Date: Thu, 20 Mar 2025 11:03:38 +0000
Message-Id: <D8L1KOJC0NJD.3QJBLQ0Z1FI62@postmarketos.org>
Subject: Re: [PATCH v5 2/2] arm64: dts: amlogic: add support for
 xiaomi-aquaman/Mi TV Stick
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Ferass El Hafidi" <funderscore@postmarketos.org>
To: "Martin Blumenstingl" <martin.blumenstingl@googlemail.com>
References: <20250319190150.31529-2-funderscore@postmarketos.org>
 <20250319190150.31529-4-funderscore@postmarketos.org>
 <CAFBinCArRO-F59tOv9m27f+DV+qhy69OGUunGOAbDdfOdd5_Xg@mail.gmail.com>
In-Reply-To: <CAFBinCArRO-F59tOv9m27f+DV+qhy69OGUunGOAbDdfOdd5_Xg@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_040428_655862_FCAC861B 
X-CRM114-Status: GOOD (  16.13  )
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Artur Weber <aweber.kernel@gmail.com>, Rob
 Herring <robh@kernel.org>, Karl Chan <exxxxkc@getgoogleoff.me>, Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, linux-amlogic@lists.infradead.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gV2VkIE1hciAxOSwgMjAyNSBhdCAxMDozNiBQTSBVVEMsIE1hcnRpbiBCbHVtZW5zdGluZ2wg
d3JvdGU6Cj4gSGVsbG8sCj4KPiB0aGFua3MgZm9yIHlvdXIgY29udHJpYnV0aW9uIGFuZCBzb3Jy
eSBmb3IgdGhlIGxhdGUgcmVwbHkhCj4KPiBPbiBXZWQsIE1hciAxOSwgMjAyNSBhdCA4OjAy4oCv
UE0gRmVyYXNzIEVsIEhhZmlkaQo+IDxmdW5kZXJzY29yZUBwb3N0bWFya2V0b3Mub3JnPiB3cm90
ZToKPiBbLi4uXQo+ID4gKyAgICAgICBhdTI6IGFuYWxvZy1hbXBsaWZpZXIgewo+ID4gKyAgICAg
ICAgICAgICAgIGNvbXBhdGlibGUgPSAic2ltcGxlLWF1ZGlvLWFtcGxpZmllciI7Cj4gPiArICAg
ICAgICAgICAgICAgc291bmQtbmFtZS1wcmVmaXggPSAiQVUyIjsKPiA+ICsgICAgICAgICAgICAg
ICBWQ0Mtc3VwcGx5ID0gPCZ2Y2NfNXY+Owo+ID4gKyAgICAgICAgICAgICAgIGVuYWJsZS1ncGlv
cyA9IDwmZ3BpbyBHUElPSF81IEdQSU9fQUNUSVZFX0hJR0g+Owo+ID4gKyAgICAgICB9Owo+IEkg
Y291bGRuJ3QgZmluZCBhbnkgcGljdHVyZXMgb25saW5lIHRoYXQgc2hvdyBhbiBhbmFsb2cgYXVk
aW8gb3V0cHV0Cj4gKHR5cGljYWxseSBhIDMuNW1tIHNvY2tldCkuCj4gQ2FuIHlvdSBjb25maXJt
IHRoYXQgdGhpcyBpcyByZWFsbHkgcHJlc2VudD8KPgo+IFsuLi5dCj4gPiArICAgICAgIHNvdW5k
IHsKPiA+ICsgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gImFtbG9naWMsZ3gtc291bmQtY2Fy
ZCI7Cj4gPiArICAgICAgICAgICAgICAgbW9kZWwgPSAiWElBT01JLUFRVUFNQU4iOwo+ID4gKyAg
ICAgICAgICAgICAgIGF1ZGlvLWF1eC1kZXZzID0gPCZhdTI+Owo+ID4gKyAgICAgICAgICAgICAg
IGF1ZGlvLXdpZGdldHMgPSAiTGluZSIsICJMaW5lb3V0IjsKPiA+ICsgICAgICAgICAgICAgICBh
dWRpby1yb3V0aW5nID0gIkFVMiBJTkwiLCAiQUNPREVDIExPTE4iLAo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAiQVUyIElOUiIsICJBQ09ERUMgTE9STiIsCj4gPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICJMaW5lb3V0IiwgIkFVMiBPVVRMIiwKPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIkxpbmVvdXQiLCAiQVUyIE9VVFIiOwo+IElmIHRo
ZXJlJ3Mgbm8gYW5hbG9nIGF1ZGlvIGluL291dCB0aGVuIHRoaXMgc2VjdGlvbiBjYW4gYmUgY2xl
YW5lZCB1cAo+IGFzIHdlbGwgLSB0b2dldGhlciB3aXRoIHRoZSByZWZlcmVuY2VzIHRvIGFjb2Rl
YyBpbiB0aGUgZGFpLWxpbmtzCj4gYmVsb3cuCgpPb3BzLCBjb21wbGV0ZWx5IG92ZXJsb29rZWQg
dGhvc2UuICBXaWxsIGZpeCBpbiB2Ni4gIFRoZXJlIGluZGVlZCBpcyBubyAKYW5hbG9nIGF1ZGlv
IG91dHB1dC4KCj4KPiBbLi4uXQo+ID4gKy8qIFdpcmVsZXNzIFNESU8gTW9kdWxlIChBbWxvZ2lj
IFcxNTVTMSAvIFJlYWx0ZWsgUlRMODgyMUNTKSAqLwo+ID4gKyZzZF9lbW1jX2Igewo+IHF1ZXN0
aW9uIHRvIE5laWw6IHNpbmNlIHdlIGtub3cgdGhhdCB0aGVyZSdzIHR3byBib2FyZCB2YXJpYW50
cyBvdXQKPiB0aGVyZSAod2l0aCBkaWZmZXJlbnQgd2lmaSBjaGlwc2V0cykgLSBhcmUgZHQgb3Zl
cmxheXMgZG93biB0aGUgcm9hZAo+IGVub3VnaCAodG8gZW5hYmxlIEJsdWV0b290aCAvIHdpZmkg
LSBkZXBlbmRpbmcgb24gdGhlIGNoaXBzZXQgb3IgYm9hcmQKPiByZXZpc2lvbikgb3IgZG8gd2Ug
bmVlZCB0byBzcGxpdCB0aGUgd2hvbGUgLmR0cz8KPgoKU28gZmFyIFcxNTVTMSBhbmQgUlRMODgy
MUNTIGFyZSB0aGUgKmtub3duKiBjaGlwc2V0cyB1c2VkLCBidXQgdGhlcmUgbWF5IApiZSBvdGhl
cnMuICBSaWdodCBub3cgaXQncyBub3QgbXkgbWFpbiBjb25jZXJuLCBhcyBXMTU1UzEgaXMgbm90
CnN1cHBvcnRlZCBpbiBNYWlubGluZSwgYXMgZmFyIGFzIEkga25vdywgYW5kIEkgY2FuJ3QgdGVz
dCBSVEw4ODIxQ1MKYmVjYXVzZSBteSB2YXJpYW50IHNlZW1zIHRvIGhhdmUgdGhlIGZvcm1lci4K
Cj4KPiBCZXN0IHJlZ2FyZHMsCj4gTWFydGluCgpSZWdhcmRzLgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QK
bGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
