Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6038C43458
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 Jul 2026 08:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=37FPUstl5x87ibAsPHCbvBEp1R9I4eV9ThlWKblSW+o=; b=0CpbkG1WyucMBH
	zympUeRvhUDnCAgCCqQmvjk+VyH7V4+po6v/z1DDtJVEUxZ89ciiovAYBxdHsca/gIhnmxjcj/pa0
	PV5+gHpP4vABr4xAZP0dPDVfSjr4Cm5t/TKXpRzSGYdSPlFQLk3oq3xbz1EqQWyPPA/E8YpgF+KNJ
	k1e2fMmgEkN09NYMvRSHTgJSYiefm92qWMULp/wv2fbRiwPrgUP427jVux2FfXcBkcYunc4lheKEO
	UclBZ1f/Q15zGphZwP1zAnTm+P+utFRETctt6WqYNC0oOLEpS4JktNxPGrGDzka6gc3cD8mx16wCZ
	kj/xPvgVXZxKQIYfVLFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjYMj-0000000BHZ6-0x0I;
	Tue, 14 Jul 2026 08:19:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjYMh-0000000BHYp-3Szu
	for linux-amlogic@lists.infradead.org;
	Tue, 14 Jul 2026 08:19:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DD4C160120;
	Tue, 14 Jul 2026 08:19:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E0B91F000E9;
	Tue, 14 Jul 2026 08:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784017182;
	bh=CCPHq1HHM2IxWF7xzjbQGlm+A8GOHNH5HyfKyBhULhI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ia9rbKyC4kUKevmkwKQT+0tqRgIv8nc61JorVx/5cQLw5UdS51IrjGVgVJCEcdN71
	 Bwgwqho+h+UrO3tIunUXrJw+AETR1HeEHIIsu8ozW9PCS98jobGD/DZ/b/PC70UAD9
	 raD+xcKc6PKzWruMr+KzTQlapQF7xLHNXQo8TOeC5kCmqJ6HzJk3Opzh5dMjlHBl1w
	 OVFI6TdKh0aQi1ZQNpwpxPCLKlF4uupXeaKfBu+3Wd7iBOvgdi/Zjv9RQAtY1gv0wP
	 ns0+s53hIZ6h/5SRaA9Ty70Hv3V2k1BCx6bsQ8kGgPRQeRXkWam+9klH/cy6zVVbPa
	 jf9LrQShNxYeg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 1/3] dt-bindings: dma: Add Amlogic A9 SoC DMA
To: "Xianwei Zhao" <xianwei.zhao@amlogic.com>
Cc: neil.armstrong@linaro.org, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, vkoul@kernel.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20260714-amlogic-dma-v11-1-de79c2394282@amlogic.com>
References: <20260714-amlogic-dma-v11-0-de79c2394282@amlogic.com>
 <20260714-amlogic-dma-v11-1-de79c2394282@amlogic.com>
Date: Tue, 14 Jul 2026 08:19:41 +0000
Message-Id: <20260714081942.2E0B91F000E9@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0xvd10gVGhlIG1hY3JvcyBETUFf
VFggYW5kIERNQV9SWCBpbiB0aGUgZ2xvYmFsIERUIGJpbmRpbmcgaGVhZGVyIGxhY2sgYW4gQW1s
b2dpYy9Tb0Mgc3BlY2lmaWMgcHJlZml4LCBsZWFkaW5nIHRvIG5hbWVzcGFjZSBwb2xsdXRpb24g
YW5kIHBvdGVudGlhbCBidWlsZCBjb25mbGljdHMuCi0tCgotLS0gUGF0Y2ggWzFdOiBbUEFUQ0gg
djExIDEvM10gZHQtYmluZGluZ3M6IGRtYTogQWRkIEFtbG9naWMgQTkgU29DIERNQSAtLS0KY29t
bWl0IDA5M2YzNjhlYWE2NzQxODAwODQyMWQ0M2Q3MjRjZTJlOTg2NTEwMzkKQXV0aG9yOiBYaWFu
d2VpIFpoYW8gPHhpYW53ZWkuemhhb0BhbWxvZ2ljLmNvbT4KZHQtYmluZGluZ3M6IGRtYTogQWRk
IEFtbG9naWMgQTkgU29DIERNQQoKVGhpcyBjb21taXQgYWRkcyBkZXZpY2UgdHJlZSBiaW5kaW5n
IGRvY3VtZW50YXRpb24gZm9yIHRoZSBBbWxvZ2ljIEE5IFNvQwpnZW5lcmFsLXB1cnBvc2UgRE1B
IGNvbnRyb2xsZXIuIEl0IGludHJvZHVjZXMgdGhlIFlBTUwgc2NoZW1hIGFuZCBhIGhlYWRlcgpm
aWxlIGRlZmluaW5nIHRoZSBjaGFubmVsIHR5cGUgbWFjcm9zLgoKPiBkaWZmIC0tZ2l0IGEvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2RtYS9hbWxvZ2ljLGE5LWRtYS55YW1sIGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2RtYS9hbWxvZ2ljLGE5LWRtYS55YW1s
Cj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2RtYS9hbWxvZ2ljLGE5LWRtYS55YW1sClsgLi4uIF0K
PiArICAnI2RtYS1jZWxscyc6Cj4gKyAgICBjb25zdDogMgo+ICsgICAgZGVzY3JpcHRpb246Cj4g
KyAgICAgIFRoZSBmaXJzdCBjZWxsIGlzIHRoZSBETUEgY2hhbm5lbCB0eXBlKERNQV9UWCBvciBE
TUFfUlgpLgo+ICsgICAgICBUaGUgc2Vjb25kIGNlbGwgaXMgdGhlIERNQSBjaGFubmVsIGluZGV4
LgpbIC4uLiBdCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHQtYmluZGluZ3MvZG1hL2FtbG9naWMs
YTktZG1hLmggYi9pbmNsdWRlL2R0LWJpbmRpbmdzL2RtYS9hbWxvZ2ljLGE5LWRtYS5oCj4gbmV3
IGZpbGUgbW9kZSAxMDA2NDQKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvaW5jbHVkZS9kdC1iaW5k
aW5ncy9kbWEvYW1sb2dpYyxhOS1kbWEuaAo+IEBAIC0wLDAgKzEsOCBAQAo+ICsvKiBTUERYLUxp
Y2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAgT1IgTUlUKSAqLwo+ICsKPiArI2lmbmRlZiBfX0RU
X0JJTkRJTkdTX0RNQV9BTUxPR0lDX0RNQV9IX18KPiArI2RlZmluZSBfX0RUX0JJTkRJTkdTX0RN
QV9BTUxPR0lDX0RNQV9IX18KPiArCj4gKyNkZWZpbmUgRE1BX1RYCQkJMAo+ICsjZGVmaW5lIERN
QV9SWAkJCTEKCltTZXZlcml0eTogTG93XQpBcmUgdGhlc2UgbWFjcm8gbmFtZXMgdG9vIGdlbmVy
aWMgZm9yIGEgZ2xvYmFsIGR0LWJpbmRpbmdzIGhlYWRlcj8KClNpbmNlIGhlYWRlcnMgaW4gaW5j
bHVkZS9kdC1iaW5kaW5ncy8gYXJlIGdsb2JhbGx5IHZpc2libGUgYW5kIGZyZXF1ZW50bHkKaW5j
bHVkZWQgYnkgQyBkcml2ZXJzLCB1bnByZWZpeGVkIG5hbWVzIGxpa2UgRE1BX1RYIGFuZCBETUFf
UlggY291bGQgbGVhZAp0byBuYW1lc3BhY2UgcG9sbHV0aW9uIGFuZCBtYWNybyByZWRlZmluaXRp
b24gYnVpbGQgZmFpbHVyZXMgaWYgYSBkcml2ZXIKaW5jbHVkZXMgdGhpcyBhbG9uZ3NpZGUgb3Ro
ZXIgaGVhZGVycyB0aGF0IHVzZSB0aGUgc2FtZSBjb21tb24gbmFtZXMuCgpXb3VsZCBpdCBiZSBz
YWZlciB0byBhZGQgYSB2ZW5kb3Igb3IgU29DIHByZWZpeCwgc3VjaCBhcyBBTUxPR0lDX0E5X0RN
QV9UWD8KCj4gKyNlbmRpZiAvKiBfX0RUX0JJTkRJTkdTX0RNQV9BTUxPR0lDX0RNQV9IX18gKi8K
Ci0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQv
MjAyNjA3MTQtYW1sb2dpYy1kbWEtdjExLTAtZGU3OWMyMzk0MjgyQGFtbG9naWMuY29tP3BhcnQ9
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
YW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
