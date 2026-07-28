Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6F47C53219
	for <linux-amlogic@archiver.kernel.org>; Tue, 28 Jul 2026 15:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JyoOWfd7Y9l+3PbC2gJi8Z3mbk5nFaSg7WL443VpmZo=; b=AON5hXpoeYcon4
	g6nEIeQFNFPKFPk0778NOp2Itz1VWAU9dhmq4NemaF5WYFGrjhizX4QizyLYQ3QGwJW1twrm0tYI8
	5HJ5345X3D1Jk3UxwZ40bKbpicYCQJu+iSdO5f5XGwnrsx5I1zDi7ofBD7pM+8sSyKDrC2tGvpPLG
	L9EARR6zmecCOEd7KMBUoF7zSc/ljfHNd44eg7LImoifg0k3fcre9ZnzC66tepOBNowewmGyaaHLc
	0I/p54Lp5v2GWSA59vobEq7vPlmZTeXUvesRRY4eCgOj8wxInBGKOgM6go660FZwmB3FFnODSAyYV
	KOeFPxVvddIRNfxuEPIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wojij-00000005dk7-3wIc;
	Tue, 28 Jul 2026 15:27:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wojii-00000005djU-1QMP
	for linux-amlogic@lists.infradead.org;
	Tue, 28 Jul 2026 15:27:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 06D8040966;
	Tue, 28 Jul 2026 15:27:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8436E1F000E9;
	Tue, 28 Jul 2026 15:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785252471;
	bh=W8w/owoiNELu2CkqU6dxEn7OSV6A6lF/E01dxAwiJKM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hzxT5UHCThGccjTsbnhRJ3BEtA6x5sh1En2u95HNcHxh3m4M/BWyu27xdesxHEg+m
	 GBLrXfBHZhBD6Hn9u1mNEY0VFu4etzd/6dWEebh4Dp5SzmX3qPxbOpI4f50mx0a7dZ
	 j8c6D2lpN+un9V3exR6GMmuhLVj7ttRNLWCBeydfl4nOAM7EsoeiFQatSprnMUaDpi
	 qpVP8t1fRBuTqMjzcNPnM0B2CEC603Xk7/3rCeuPU3WGXJMJWB+WDHQ/+Bai+mQQ98
	 7A/vhSEtvUzVKQL51YaMjXZXYPUAXIKneNj0V4bIrMifmMBKaTe21POemB/8njIs5J
	 XnugZ2X5j+n/g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/3] arm64: dts: amlogic: add support for Orbbec Zora
 P1
To: "Alberto Robazza" <robazzalberto@gmail.com>
Cc: linux-amlogic@lists.infradead.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20260728151636.236393-4-robazzalberto@gmail.com>
References: <20260728151636.236393-1-robazzalberto@gmail.com>
 <20260728151636.236393-4-robazzalberto@gmail.com>
Date: Tue, 28 Jul 2026 15:27:50 +0000
Message-Id: <20260728152751.8436E1F000E9@smtp.kernel.org>
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
MiBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIEhhcmR3YXJlIC8gUGlu
IE11bHRpcGxleGluZyBDb25mbGljdCBvbiBHUElPWF8xNgotIFtNZWRpdW1dIExvZ2ljIEVycm9y
IC8gRGV2aWNlIFRyZWUgT3ZlcnJpZGVzIChGYWlsZWQgTEVEIFJlbmFtZSkKLS0KCi0tLSBQYXRj
aCBbM106IFtQQVRDSCB2MyAzLzNdIGFybTY0OiBkdHM6IGFtbG9naWM6IGFkZCBzdXBwb3J0IGZv
ciBPcmJiZWMgWm9yYSBQMSAtLS0KY29tbWl0IGE4NmZlM2E5OTRmNzA4YTVkMmZjOWU3MmI0MzVm
ODllOTJmOGE0OTMKQXV0aG9yOiBBbGJlcnRvIFJvYmF6emEgPHJvYmF6emFsYmVydG9AZ21haWwu
Y29tPgoKYXJtNjQ6IGR0czogYW1sb2dpYzogYWRkIHN1cHBvcnQgZm9yIE9yYmJlYyBab3JhIFAx
CgpUaGUgT3JiYmVjIFpvcmEgUDEgaXMgYW4gQTMxMUQgKE1lc29uIEcxMkIpIGJvYXJkIHdpdGgg
Mi80IEdpQiBERFI0LAphbiBBbXBhayBBUDYyNTYgY29tYm8gbW9kdWxlIChCcm9hZGNvbSBCQ000
MzQ1NiBXaS1GaSBvdmVyIFNESU8gYW5kCkJDTTQzNDVDNSBCbHVldG9vdGggb3ZlciBVQVJUX0Ep
LgoKPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLWcxMmIt
em9yYS1wMS5kdHMgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tZzEyYi16b3Jh
LXAxLmR0cwo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAwMC4uZDAw
MzU4MmZkOWU5NQo+IC0tLSAvZGV2L251bGwKPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2Ft
bG9naWMvbWVzb24tZzEyYi16b3JhLXAxLmR0cwoKWyAuLi4gXQoKPiArCWxlZHMgewo+ICsJCS8q
IFN0YXR1cyBsZWQgb24gWm9yYSBpcyBhY3R1YWxseSBncmVlbiwgc2FtZSBwaW4gYXMgTjIsIGJ1
dCByZXZlcnNlZCBwb2xhcml0eSAqLwo+ICsJCWxlZC1ibHVlIHsKPiArCQkJZnVuY3Rpb24gPSBM
RURfRlVOQ1RJT05fU1RBVFVTOwo+ICsJCQljb2xvciA9IDxMRURfQ09MT1JfSURfR1JFRU4+Owo+
ICsJCQlncGlvcyA9IDwmZ3Bpb19hbyBHUElPQU9fMTEgR1BJT19BQ1RJVkVfTE9XPjsKPiArCQl9
OwoKW1NldmVyaXR5OiBNZWRpdW1dCldpbGwgdGhpcyBzdGlsbCByZXN1bHQgaW4gdGhlIExFRCBi
ZWluZyBuYW1lZCBuMjpibHVlIGluIHN5c2ZzPwoKU2luY2UgdGhpcyBub2RlIGluaGVyaXRzIGZy
b20gbWVzb24tZzEyYi1vZHJvaWQtbjIuZHRzaSwgaXQgbG9va3MgbGlrZSB0aGUKb3JpZ2luYWwg
bGFiZWwgcHJvcGVydHkgbWlnaHQgc3RpbGwgYmUgcHJlc2VudC4gQmVjYXVzZSBsZWRfY29tcG9z
ZV9uYW1lKCkKaW4gZHJpdmVycy9sZWRzL2xlZC1jb3JlLmMgcHJpb3JpdGl6ZXMgdGhlIGxhYmVs
IHByb3BlcnR5IG92ZXIgZnVuY3Rpb24gYW5kCmNvbG9yLCB0aGUgaW5oZXJpdGVkIGxhYmVsIG1h
eSBieXBhc3MgdGhlc2UgbmV3IHByb3BlcnRpZXMuCgpXb3VsZCB3ZSBuZWVkIHRvIGFkZCAvZGVs
ZXRlLXByb3BlcnR5LyBsYWJlbDsgaGVyZSB0byBlbnN1cmUgdGhlIG5ldyBjb2xvcgppcyBwcm9w
ZXJseSByZWZsZWN0ZWQgaW4gdGhlIHN5c2ZzIG5hbWU/CgpbIC4uLiBdCgo+ICsJc2Rpb19wd3Jz
ZXE6IHNkaW8tcHdyc2VxIHsKPiArCQljb21wYXRpYmxlID0gIm1tYy1wd3JzZXEtc2ltcGxlIjsK
PiArCQlyZXNldC1ncGlvcyA9IDwmZ3BpbyBHUElPWF8xNiBHUElPX0FDVElWRV9MT1c+Owo+ICsJ
CWNsb2NrcyA9IDwmd2lmaTMyaz47Cj4gKwkJY2xvY2stbmFtZXMgPSAiZXh0X2Nsb2NrIjsKPiAr
CX07CgpbIC4uLiBdCgo+ICsmcHdtX2VmIHsKPiArCXN0YXR1cyA9ICJva2F5IjsKPiArCXBpbmN0
cmwtMCA9IDwmcHdtX2VfcGlucz47Cj4gKwlwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOwo+ICt9
OwoKW1NldmVyaXR5OiBIaWdoXQpDYW4gdGhpcyBjYXVzZSBhIHBpbiBtdWx0aXBsZXhpbmcgY29u
ZmxpY3Q/CgpJdCBhcHBlYXJzIEdQSU9YXzE2IGlzIHJlcXVlc3RlZCBhcyBhIHN0YXRpYyBHUElP
IHJlc2V0IGxpbmUgZm9yCnNkaW9fcHdyc2VxIGFib3ZlLCBidXQgcHdtX2VmIGFsc28gcmVxdWVz
dHMgcHdtX2VfcGlucywgd2hpY2ggbWFwcyB0byB0aGUKZXhhY3Qgc2FtZSBHUElPWF8xNiBwaW4g
Zm9yIHRoZSAzMmtIeiBjbG9jayBvdXRwdXQuCgpDb3VsZCB0aGlzIGNhdXNlIHRoZSBwaW5jdHJs
IHN1YnN5c3RlbSB0byByZWplY3QgdGhlIHNlY29uZGFyeSByZXF1ZXN0IHdpdGgKLUVCVVNZIGR1
cmluZyBib290LCBvciBwb3RlbnRpYWxseSBmb3JjZSB0aGUgcGluIGludG8gY29uZmxpY3RpbmcK
ZWxlY3RyaWNhbCBzdGF0ZXM/CgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNo
aWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwNzI4MTUxNjM2LjIzNjM5My0xLXJvYmF6emFsYmVydG9A
Z21haWwuY29tP3BhcnQ9MwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtYW1sb2dpYwo=
