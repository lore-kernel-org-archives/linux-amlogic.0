Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F7A9C55174
	for <linux-amlogic@archiver.kernel.org>; Wed,  5 Aug 2026 08:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=InDzPafPvm8XHstvHEQ2cStVUCyuoninriJ+1OIqIG0=; b=d18zRMUKGhRaiR
	T9+cd3t0rR4hGmpmIasfXFpqW+RLUxOD+oz6TvOMH8a8EIyqzmVL6SlosRpR88APUH6jD3RbtPaGm
	VnNTxPHr+dPJUnB1oXRuI+GpY134r0Td88XcnSvQyIFqjhFpDm2CSxHZaBc0IPQwo+sEArFYyOq+o
	ba0alTz1MktJ/Yhpmu1dy6VModOjmm9cf04kvB0w1MrzuVGPxIKPZspc2Bv1hXP9+axFLJrIpOTam
	2ALjzXvnTPsMJduh88JXrdYoCOY1u5T1C2cZ/In1iKjLG3SDJjDUeWsLWtn6kzK16UNsEiivCrOxa
	4LqUfP6EABuTS+I4ur0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrWvD-00000003WbX-0Hpr;
	Wed, 05 Aug 2026 08:24:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrWvC-00000003WbR-17vo
	for linux-amlogic@lists.infradead.org;
	Wed, 05 Aug 2026 08:24:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 69702600AE;
	Wed,  5 Aug 2026 08:24:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 884591F000E9;
	Wed,  5 Aug 2026 08:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785918257;
	bh=wPXum4rRsqI3wrxTxVfvisoC2MnoQCPXd7IvHdeqxuA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mV/YHnqW2CslUh4q4vQcrTJiclkNqIBbaS0DrxEtru0deO9rw4t+U9VmOR07Q1bfc
	 ETezp7KMktsz+D7MmtAXYkYgoFMdj+POkcFY75FDRbKgOTKvj3/PH7s9uiphy6mj+0
	 yv7nW9MgiuZSfY6XgchSMLl18fecanusbRx4c5uTZZCvJQyZ1RcENGmLIGSdmTVQLU
	 X+SH4LHBv4T0Ztzb5J67RHfRNH1XMPsTQVR3ufQcRiTO2DfmaKkBUpmteLVQbzz3p8
	 KdytSoMDynYRqksxI2PhD7S+SwVgaYxXyH9mlMKgdDbCgCUNBFnlxOuDkNayveEzk1
	 qC8EbCaSMPPtQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 6/6] arm64: dts: amlogic: t7: khadas-vim4: Add i2c
 MCU fan node
To: "Ronald Claveau" <linux-kernel-dev@aliel.fr>
Cc: neil.armstrong@linaro.org, devicetree@vger.kernel.org, lee@kernel.org, linux-amlogic@lists.infradead.org, conor+dt@kernel.org, robh@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260805-add-mcu-fan-khadas-vim4-v9-6-75df78710b9e@aliel.fr>
References: <20260805-add-mcu-fan-khadas-vim4-v9-0-75df78710b9e@aliel.fr>
 <20260805-add-mcu-fan-khadas-vim4-v9-6-75df78710b9e@aliel.fr>
Date: Wed, 05 Aug 2026 08:24:15 +0000
Message-Id: <20260805082416.884591F000E9@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIFRoZSBraGFkYXMtbWN1
LWZhbiBkcml2ZXIgbGVha3MgcmVndWxhdG9yIHJlZmVyZW5jZXMgYW5kIGVuYWJsZSBjb3VudHMg
ZHVlIHRvIGJpbmRpbmcgZGV2cmVzIHRvIHRoZSBwYXJlbnQgZGV2aWNlIGFuZCBtaXNzaW5nIGNs
ZWFudXAgcGF0aHMuCi0tCgotLS0gUGF0Y2ggWzZdOiBbUEFUQ0ggdjkgNi82XSBhcm02NDogZHRz
OiBhbWxvZ2ljOiB0Nzoga2hhZGFzLXZpbTQ6IEFkZCBpMmMgTUNVIGZhbiBub2RlIC0tLQpjb21t
aXQgNjlhYTA3NjgxMDdmOWZhMmQwYzNmOWMwYjlhNzYxY2IxM2YzODkwYgpBdXRob3I6IFJvbmFs
ZCBDbGF2ZWF1IDxsaW51eC1rZXJuZWwtZGV2QGFsaWVsLmZyPgoKYXJtNjQ6IGR0czogYW1sb2dp
YzogdDc6IGtoYWRhcy12aW00OiBBZGQgaTJjIE1DVSBmYW4gbm9kZQogICAgCkVuYWJsZSBhbmQg
Y29uZmlndXJlIGkyYyBNQ1Ugbm9kZSB0byBnZXQgZmFuIHdvcmtpbmcgb24gS2hhZGFzIFZJTTQu
CiAgICAKUmV2aWV3ZWQtYnk6IE5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8u
b3JnPgpSZXZpZXdlZC1ieTogTWFydGluIEJsdW1lbnN0aW5nbCA8bWFydGluLmJsdW1lbnN0aW5n
bEBnb29nbGVtYWlsLmNvbT4KU2lnbmVkLW9mZi1ieTogUm9uYWxkIENsYXZlYXUgPGxpbnV4LWtl
cm5lbC1kZXZAYWxpZWwuZnI+Cgo+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2Ft
bG9naWMvYW1sb2dpYy10Ny1hMzExZDIta2hhZGFzLXZpbTQuZHRzIGIvYXJjaC9hcm02NC9ib290
L2R0cy9hbWxvZ2ljL2FtbG9naWMtdDctYTMxMWQyLWtoYWRhcy12aW00LmR0cwo+IGluZGV4IGM0
MTUyNWEzNGI3MjEuLjdkOTVhYWRjZjZhNjYgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9hcm02NC9ib290
L2R0cy9hbWxvZ2ljL2FtbG9naWMtdDctYTMxMWQyLWtoYWRhcy12aW00LmR0cwo+ICsrKyBiL2Fy
Y2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9hbWxvZ2ljLXQ3LWEzMTFkMi1raGFkYXMtdmltNC5k
dHMKPiBAQCAtMTY3LDYgKzE2NywxOSBAQCB4dGFsOiB4dGFsLWNsayB7Cj4gIAl9Owo+ICB9Owo+
ICAKPiArJmkyY19tX2FvX2Egewo+ICsJc3RhdHVzID0gIm9rYXkiOwo+ICsJcGluY3RybC0wID0g
PCZpMmMwX2FvX2RfcGlucz47Cj4gKwlwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOwo+ICsKPiAr
CWtoYWRhc19tY3U6IHN5c3RlbS1jb250cm9sbGVyQDE4IHsKPiArCQljb21wYXRpYmxlID0gImto
YWRhcyx2aW00LW1jdSI7Cj4gKwkJcmVnID0gPDB4MTg+Owo+ICsJCWZhbi1zdXBwbHkgPSA8JnZj
YzV2PjsKCltTZXZlcml0eTogSGlnaF0KRG9lcyBlbmFibGluZyB0aGlzIGZhbiBub2RlIGV4cG9z
ZSBhIHJlZ3VsYXRvciBsZWFrIGluIHRoZSBraGFkYXMtbWN1LWZhbgpkcml2ZXI/CgpXaGVuIHRo
ZSBkcml2ZXIgcHJvYmVzLCBpdCBhcHBlYXJzIHRvIGF0dGFjaCB0aGUgcmVndWxhdG9yIHJlc291
cmNlCmxpZmVjeWNsZSB0byB0aGUgcGFyZW50IGRldmljZSByYXRoZXIgdGhhbiB0aGUgY2hpbGQ6
Cgpkcml2ZXJzL3RoZXJtYWwva2hhZGFzX21jdV9mYW4uYzpraGFkYXNfbWN1X2Zhbl9wcm9iZSgp
IHsKICAgIC4uLgogICAgY3R4LT5wb3dlciA9IGRldm1fcmVndWxhdG9yX2dldChkZXYtPnBhcmVu
dCwgImZhbiIpOwogICAgLi4uCn0KCklmIGRldm1fdGhlcm1hbF9vZl9jaGlsZF9jb29saW5nX2Rl
dmljZV9yZWdpc3RlcigpIGZhaWxzLCB0aGUgcHJvYmUKZnVuY3Rpb24gcmV0dXJucyB3aXRob3V0
IGNhbGxpbmcgcmVndWxhdG9yX2Rpc2FibGUoKToKCmRyaXZlcnMvdGhlcm1hbC9raGFkYXNfbWN1
X2Zhbi5jOmtoYWRhc19tY3VfZmFuX3Byb2JlKCkgewogICAgLi4uCiAgICByZXR1cm4gcmV0Owp9
CgpGdXJ0aGVybW9yZSwgdGhlIGRyaXZlciBzdHJ1Y3QgbGFja3MgYSAucmVtb3ZlIGNhbGxiYWNr
IGVudGlyZWx5OgoKZHJpdmVycy90aGVybWFsL2toYWRhc19tY3VfZmFuLmM6CnN0YXRpYyBzdHJ1
Y3QgcGxhdGZvcm1fZHJpdmVyIGtoYWRhc19tY3VfZmFuX2RyaXZlciA9IHsKICAgIC5wcm9iZSAg
ICAgID0ga2hhZGFzX21jdV9mYW5fcHJvYmUsCiAgICAuc2h1dGRvd24gICA9IGtoYWRhc19tY3Vf
ZmFuX3NodXRkb3duLAogICAgLmRyaXZlciA9IHsKICAgICAgICAubmFtZSAgICAgICA9ICJraGFk
YXMtbWN1LWZhbi1jdHJsIiwKICAgICAgICAucG0gICAgICAgICA9ICZraGFkYXNfbWN1X2Zhbl9w
bSwKICAgIH0sCiAgICAuaWRfdGFibGUgICA9IGtoYWRhc19tY3VfZmFuX2lkX3RhYmxlLAp9OwoK
U2luY2UgZGV2cmVzIGlzIGF0dGFjaGVkIHRvIGRldi0+cGFyZW50LCB0aGUgZHJpdmVyIGNvcmUg
d2lsbCBub3QKYXV0b21hdGljYWxseSBjbGVhbiB1cCB0aGUgcmVndWxhdG9yIHdoZW4gdGhlIGNo
aWxkIGRldmljZSBwcm9iZSBmYWlscyBvcgp3aGVuIHRoZSBjaGlsZCBkcml2ZXIgaXMgdW5ib3Vu
ZC4gCgpXaWxsIHRoaXMgY2F1c2UgYSBtb25vdG9uaWNhbGx5IGluY3JlYXNpbmcgZW5hYmxlIGNv
dW50IGFuZCBtZW1vcnkgbGVhawpvbiB0aGUgcGFyZW50IGRldmljZSBkdXJpbmcgdW5iaW5kL3Jl
YmluZCBjeWNsZXM/Cgo+ICsJCSNjb29saW5nLWNlbGxzID0gPDI+Owo+ICsJfTsKPiArfTsKClsg
Li4uIF0KCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0
Y2hzZXQvMjAyNjA4MDUtYWRkLW1jdS1mYW4ta2hhZGFzLXZpbTQtdjktMC03NWRmNzg3MTBiOWVA
YWxpZWwuZnI/cGFydD02CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1hbWxvZ2ljCg==
