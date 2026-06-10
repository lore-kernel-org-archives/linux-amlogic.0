Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9E2ACD8CB2
	for <linux-amlogic@archiver.kernel.org>; Wed, 10 Jun 2026 08:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LeQryb0vIZ4uJ1ug6ztPCMOYEGxSPro6OgiaDNG/XIE=; b=epXxyQpJCBmJcA
	P3/2RsLaIrzgBDsL+GVho0aJd3HKfQlhetbkgzlUOD/NTjGrniffb81PHAn+54xl8CnqAPZ4aDWqS
	/UBA7TG7CPVx/BWm2k3ZhlBFGmxHpMY/stBa9BCzVwnv0ZWvSihquzc3EPH/PJhIpSDYqBkh7WRse
	w8Xd4SoJ2Tu7q00mQk670vI78fAbJLj4D91K6cCHTTRauU6rPRkszC8/mo8cjoc8BIZu508oaToJG
	iz8yYwx/kHoQu7z/Wr7GlL98tPggKAw6F5/51r7ckcLt4LNv5mX1QmHwx0PF9IkYBK/d4rzmvj3Ou
	45zHy9M/fpFa7iBM4EsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXEGE-000000074US-34FH;
	Wed, 10 Jun 2026 08:26:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXEGC-000000074U7-4A1g
	for linux-amlogic@lists.infradead.org;
	Wed, 10 Jun 2026 08:26:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AF81440B4F;
	Wed, 10 Jun 2026 08:26:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DCB61F00893;
	Wed, 10 Jun 2026 08:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781079964;
	bh=cRggMLT+rUlz6l8KsEwcxklGmlUb3uPE+MEnS/k5oYo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eeHa93M8l5JH8wkGLYq8w24sgZJYtC/pWVM74gY2B91VZjsx8RsoBPPJupGnpK2eU
	 f8hDNEWnVQEiD+pe6jN64D3bS+8wcbhot2pZTW4NmkjaY+I2f9HKi2MoavZ5h4DrFb
	 Suj4hoRW6dRZMmZAGHyK7KZu7R9v4l7Yt3/Xab+zwrqkmyJi4MXBVlkCJeu0DiKTxC
	 y63j/gGQmmPct3woJb8VcsbyO5sa9i195pKkD461h9+ewa9vwRpJ1J1w4PgJ0iShzj
	 4lL+OPoy9LV/boS5PECpBV7xJR+zj4O7KjCYSKS3CDJ/oSqhQ7qCrqpUbQQbkjvmrq
	 P7YMfAPDTqToQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] clk: amlogic: Add A9 peripherals clock
 controller driver
To: "Jian Hu via B4 Relay" <devnull+jian.hu.amlogic.com@kernel.org>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20260610-a9_peripherals-v3-2-d07a78085f71@amlogic.com>
References: <20260610-a9_peripherals-v3-2-d07a78085f71@amlogic.com>
Date: Wed, 10 Jun 2026 08:26:03 +0000
Message-Id: <20260610082604.4DCB61F00893@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gVGhlIG5ld2x5IGFk
ZGVkIEtjb25maWcgc3ltYm9sIGBDT01NT05fQ0xLX0E5X1BFUklQSEVSQUxTYCBpbXBsaWVzIGEg
bm9uLWV4aXN0ZW50IGNvbmZpZyBzeW1ib2wgYENPTU1PTl9DTEtfQTlfUExMYC4KLS0KCmNvbW1p
dCAwMWM5NDhkNjVkN2ZkZDBkOTAwMTNhYjM2ZGZlMjM2YmQ2MzUzNDdjCkF1dGhvcjogSmlhbiBI
dSA8amlhbi5odUBhbWxvZ2ljLmNvbT4KCmNsazogYW1sb2dpYzogQWRkIEE5IHBlcmlwaGVyYWxz
IGNsb2NrIGNvbnRyb2xsZXIgZHJpdmVyCgpUaGlzIGNvbW1pdCBhZGRzIHRoZSBwZXJpcGhlcmFs
cyBjbG9jayBjb250cm9sbGVyIGRyaXZlciBmb3IgdGhlIEFtbG9naWMgQTkgClNvQyBmYW1pbHku
IEl0IGludHJvZHVjZXMgdGhlIENPTU1PTl9DTEtfQTlfUEVSSVBIRVJBTFMgS2NvbmZpZyBzeW1i
b2wgYW5kIAp0aGUgY29ycmVzcG9uZGluZyBkcml2ZXIgc291cmNlLgoKPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9jbGsvbWVzb24vS2NvbmZpZyBiL2RyaXZlcnMvY2xrL21lc29uL0tjb25maWcKPiAt
LS0gYS9kcml2ZXJzL2Nsay9tZXNvbi9LY29uZmlnCj4gKysrIGIvZHJpdmVycy9jbGsvbWVzb24v
S2NvbmZpZwo+IEBAIC0xMzIsNiArMTMyLDIxIEBAIGNvbmZpZyBDT01NT05fQ0xLX0ExX1BFUklQ
SEVSQUxTCj4gIAkgIGRldmljZSwgQTEgU29DIEZhbWlseS4gU2F5IFkgaWYgeW91IHdhbnQgQTEg
UGVyaXBoZXJhbHMgY2xvY2sKPiAgCSAgY29udHJvbGxlciB0byB3b3JrLgo+ICAKPiArY29uZmln
IENPTU1PTl9DTEtfQTlfUEVSSVBIRVJBTFMKPiArCXRyaXN0YXRlICJBbWxvZ2ljIEE5IFNvQyBw
ZXJpcGhlcmFscyBjbG9jayBjb250cm9sbGVyIHN1cHBvcnQiCj4gKwlkZXBlbmRzIG9uIEFSTTY0
IHx8IENPTVBJTEVfVEVTVAo+ICsJZGVmYXVsdCBBUkNIX01FU09OCj4gKwlzZWxlY3QgQ09NTU9O
X0NMS19NRVNPTl9SRUdNQVAKPiArCXNlbGVjdCBDT01NT05fQ0xLX01FU09OX0NMS0NfVVRJTFMK
PiArCXNlbGVjdCBDT01NT05fQ0xLX01FU09OX0RVQUxESVYKPiArCXNlbGVjdCBDT01NT05fQ0xL
X01FU09OX1ZJRF9QTExfRElWCj4gKwlpbXBseSBDT01NT05fQ0xLX1NDTUkKPiArCWltcGx5IENP
TU1PTl9DTEtfQTlfUExMCgpbU2V2ZXJpdHk6IE1lZGl1bV0KRG9lcyB0aGUgQ09NTU9OX0NMS19B
OV9QTEwgY29uZmlnIHN5bWJvbCBleGlzdD8gCgpMb29raW5nIHRocm91Z2ggdGhlIEtjb25maWcg
ZmlsZXMsIHRoZXJlIGRvZXNuJ3QgYXBwZWFyIHRvIGJlIGEgZGVmaW5pdGlvbiAKZm9yIENPTU1P
Tl9DTEtfQTlfUExMIGFueXdoZXJlIGluIHRoZSB0cmVlLiBXaGlsZSBhbiB1bnJlc29sdmVkIGlt
cGx5IGRvZXNuJ3QKY2F1c2UgYSBoYXJkIGJ1aWxkIGZhaWx1cmUgbGlrZSBzZWxlY3Qgb3IgZGVw
ZW5kcyBvbiwgaXQgaGFzIG5vIGVmZmVjdCBhbmQKbWlnaHQgaW5kaWNhdGUgYSBtaXNzaW5nIFBM
TCBkcml2ZXIgaW4gdGhpcyBwYXRjaCBzZXJpZXMgb3IgYSB0eXBvIGluIHRoZSAKc3ltYm9sIG5h
bWUuCgo+ICsJaGVscAo+ICsJICBTdXBwb3J0IGZvciB0aGUgcGVyaXBoZXJhbHMgY2xvY2sgY29u
dHJvbGxlciBvbiBBbWxvZ2ljIEEzMTFZMyBiYXNlZAo+ICsJICBkZXZpY2UsIEFLQSBBOS4gUGVy
aXBoZXJhbHMgYXJlIHJlcXVpcmVkIGJ5IG1vc3QgcGVyaXBoZXJhbCB0byBvcGVyYXRlLgo+ICsJ
ICBTYXkgWSBpZiB5b3Ugd2FudCBBOSBwZXJpcGhlcmFscyBjbG9jayBjb250cm9sbGVyIHRvIHdv
cmsuCgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNo
c2V0LzIwMjYwNjEwLWE5X3BlcmlwaGVyYWxzLXYzLTAtZDA3YTc4MDg1ZjcxQGFtbG9naWMuY29t
P3BhcnQ9MgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1s
b2dpYwo=
