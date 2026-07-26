Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8FB6C531C9
	for <linux-amlogic@archiver.kernel.org>; Sun, 26 Jul 2026 18:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JdwRMksaHS4Rc0zIgaUbxBm18NPzSaXv7aZQFtwYL3g=; b=lIfnqa1akUNzFs
	h4NUYmFE1Jj/TO9+tq7O2H2NMvRRAui9ACZqrYsIAWEZfcNwinKaj3lo0iPkQ11aHvjGAfzqu99KF
	Ephp+nw2YX2V+tdKGe/qEPz583/CMUk2YGeKNyf9pc1kWU5dJFuo2oUr+SNbVOQyGMt5WfrPqXEOs
	jTrmL7nBI9F2TMQQHOIx0Md0vbkVPeL0HIftbFATuUYRU3wo6fKGSHMQJf1UXMW4Kq1uYjCuY0DVp
	9nJvcaQj+HSQ5w4uIkRVmuo6X3aI8ousHbLx/i28LOnCCtT9KLdOQYK02Jq9b8Y8wVcPWoMV4LCT5
	GjaNck4zKVM0JiQYb6zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo3bN-00000001Ul9-01TU;
	Sun, 26 Jul 2026 18:29:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo3bL-00000001Ul1-0eHF
	for linux-amlogic@lists.infradead.org;
	Sun, 26 Jul 2026 18:29:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 88C394033E;
	Sun, 26 Jul 2026 18:29:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C3911F000E9;
	Sun, 26 Jul 2026 18:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785090566;
	bh=l7897oFI/T/BGh2oKyI/gu+emz9tY2bJBzeD7LFTcP4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hDrU2XCeNQ80vyf/hQxzTFyD1QVrhIp6yaBtfwtBngB3h7Hsld8s+cCOsrk6+4fwt
	 EceNaM2hGAdJsz/ztvD+EPzOYAWTP2CItB+Cu9IsoJaH0RGkNTVQiaVQW4/rhWHGTJ
	 IV8NpZuP21eY9w8cyEmPTIdtyM9qkfE5W+KflQaYfC/lkWXhfJGRql+XWqXGokIh+e
	 HtZIwWanfAPEUWhk9zPnNP1ezXlZHnxj/ZJuQMlxPPTJ7xxUEyU/3r0tvlUxQ+7FW/
	 +n/Wjdl8xqdyuss0xaVGFbwRngaPe8k03OKJtkSExx5S9FNqx5vp0zgjIZVUwkzjWB
	 irt7Qb0tanpIw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: amlogic: add support for Orbbec Zora P1
To: "Alberto Robazza" <robazzalberto@gmail.com>
Cc: linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260726182158.249449-4-robazzalberto@gmail.com>
References: <20260726182158.249449-1-robazzalberto@gmail.com>
 <20260726182158.249449-4-robazzalberto@gmail.com>
Date: Sun, 26 Jul 2026 18:29:25 +0000
Message-Id: <20260726182926.0C3911F000E9@smtp.kernel.org>
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
MiBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIEhhcmR3YXJlIHBpbiBt
dWx0aXBsZXhpbmcgY29uZmxpY3Qgb24gR1BJT1hfMTYgYmV0d2VlbiB0aGUgU0RJTyBwb3dlciBz
ZXF1ZW5jZSByZXNldCBhbmQgdGhlIDMya0h6IFBXTSBjbG9jay4KLSBbTG93XSBUaGUgbmV3IERU
QiBlbnRyeSBpbiB0aGUgTWFrZWZpbGUgaXMgaW5zZXJ0ZWQgb3V0IG9mIGFscGhhYmV0aWNhbCBv
cmRlci4KLS0KCi0tLSBQYXRjaCBbM106IFtQQVRDSCAzLzNdIGFybTY0OiBkdHM6IGFtbG9naWM6
IGFkZCBzdXBwb3J0IGZvciBPcmJiZWMgWm9yYSBQMSAtLS0KY29tbWl0IGI3Yjg4ZDRiZTk5MTZj
NTA3OWE4NmMwNGFlMjM3ZDFkYjRkMzliOWIKQXV0aG9yOiBBbGJlcnRvIFJvYmF6emEgPHJvYmF6
emEuYWxiZXJ0b0Bwcm90b24ubWU+Cgphcm02NDogZHRzOiBhbWxvZ2ljOiBhZGQgc3VwcG9ydCBm
b3IgT3JiYmVjIFpvcmEgUDEKClRoaXMgcGF0Y2ggYWRkcyBkZXZpY2UgdHJlZSBzdXBwb3J0IGZv
ciB0aGUgT3JiYmVjIFpvcmEgUDEgYm9hcmQsIGFuIEEzMTFECihNZXNvbiBHMTJCKSBiYXNlZCBi
b2FyZC4gSXQgYnVpbGRzIHVwb24gdGhlIE9EUk9JRC1OMiBkZXZpY2UgdHJlZSwgYWRkaW5nCnNw
ZWNpZmljIGNvbmZpZ3VyYXRpb25zIGZvciB0aGUgQVA2MjU2IFdpLUZpL0JsdWV0b290aCBtb2R1
bGUgYW5kIG1vZGlmeWluZwp0aGUgTEVEIHNldHRpbmdzLgoKPiBkaWZmIC0tZ2l0IGEvYXJjaC9h
cm02NC9ib290L2R0cy9hbWxvZ2ljL01ha2VmaWxlIGIvYXJjaC9hcm02NC9ib290L2R0cy9hbWxv
Z2ljL01ha2VmaWxlCj4gaW5kZXggNTdiYzQ0MGZhNTVjYy4uOTVlOTA3MWUwODg1YyAxMDA2NDQK
PiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvTWFrZWZpbGUKPiArKysgYi9hcmNo
L2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvTWFrZWZpbGUKPiBAQCAtMzYsNiArMzYsNyBAQCBkdGIt
JChDT05GSUdfQVJDSF9NRVNPTikgKz0gbWVzb24tZzEyYi1vZHJvaWQtZ28tdWx0cmEuZHRiCj4g
IGR0Yi0kKENPTkZJR19BUkNIX01FU09OKSArPSBtZXNvbi1nMTJiLW9kcm9pZC1uMi1wbHVzLmR0
Ygo+ICBkdGItJChDT05GSUdfQVJDSF9NRVNPTikgKz0gbWVzb24tZzEyYi1vZHJvaWQtbjIuZHRi
Cj4gIGR0Yi0kKENPTkZJR19BUkNIX01FU09OKSArPSBtZXNvbi1nMTJiLW9kcm9pZC1uMmwuZHRi
Cj4gK2R0Yi0kKENPTkZJR19BUkNIX01FU09OKSArPSBtZXNvbi1nMTJiLXpvcmEtcDEuZHRiCj4g
IGR0Yi0kKENPTkZJR19BUkNIX01FU09OKSArPSBtZXNvbi1nMTJiLXJhZHhhLXplcm8yLmR0YgoK
W1NldmVyaXR5OiBMb3ddCklzIHRoaXMgaW5zZXJ0ZWQgb3V0IG9mIGFscGhhYmV0aWNhbCBvcmRl
cj8gVGhlIGxpc3QgYXBwZWFycyB0byBiZSBzb3J0ZWQKYWxwaGFiZXRpY2FsbHksIHNvIHNob3Vs
ZCAibWVzb24tZzEyYi16b3JhLXAxLmR0YiIgYmUgcGxhY2VkIGF0IHRoZSBlbmQgb2YKdGhlIG1l
c29uLWcxMmIgYmxvY2s/Cgo+ICBkdGItJChDT05GSUdfQVJDSF9NRVNPTikgKz0gbWVzb24tZzEy
Yi1zOTIyeC1iYW5hbmFwaS1tMnMuZHRiCj4gIGR0Yi0kKENPTkZJR19BUkNIX01FU09OKSArPSBt
ZXNvbi1nMTJiLXM5MjJ4LWtoYWRhcy12aW0zLmR0YgoKWyAuLi4gXQoKPiBkaWZmIC0tZ2l0IGEv
YXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLWcxMmItem9yYS1wMS5kdHMgYi9hcmNo
L2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tZzEyYi16b3JhLXAxLmR0cwo+IG5ldyBmaWxl
IG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAwMC4uZmUyMGQzOWE4MjA3Mgo+IC0tLSAv
ZGV2L251bGwKPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tZzEyYi16
b3JhLXAxLmR0cwo+IEBAIC0wLDAgKzEsMTAzIEBACgpbIC4uLiBdCgo+ICsJc2Rpb19wd3JzZXE6
IHNkaW8tcHdyc2VxIHsKPiArCQljb21wYXRpYmxlID0gIm1tYy1wd3JzZXEtc2ltcGxlIjsKPiAr
CQlyZXNldC1ncGlvcyA9IDwmZ3BpbyBHUElPWF8xNiBHUElPX0FDVElWRV9MT1c+Owo+ICsJCWNs
b2NrcyA9IDwmd2lmaTMyaz47Cj4gKwkJY2xvY2stbmFtZXMgPSAiZXh0X2Nsb2NrIjsKPiArCX07
CgpbIC4uLiBdCgo+ICsmcHdtX2VmIHsKPiArCXN0YXR1cyA9ICJva2F5IjsKPiArCXBpbmN0cmwt
MCA9IDwmcHdtX2VfcGlucz47CgpbU2V2ZXJpdHk6IEhpZ2hdCldpbGwgdGhpcyBjYXVzZSBhIHBp
biBtdWx0aXBsZXhpbmcgY29uZmxpY3Q/CgpUaGUgc2Rpb19wd3JzZXEgbm9kZSByZXF1ZXN0cyBH
UElPWF8xNiBhcyBhIHN0YW5kYXJkIEdQSU8gZm9yIHJlc2V0LWdwaW9zLApidXQgdGhlIHB3bV9l
ZiBub2RlIGNsYWltcyBwd21fZV9waW5zLCB3aGljaCBzdHJpY3RseSBtdWx0aXBsZXhlcyB0aGUg
ZXhhY3QKc2FtZSBHUElPWF8xNiBwaW4gZm9yIGhhcmR3YXJlIFBXTS4gCgpXaGVuIHRoZSBzZWNv
bmQgZHJpdmVyIGF0dGVtcHRzIHRvIHJlcXVlc3QgdGhlIHBpbiBkdXJpbmcgYm9vdCwgd29uJ3Qg
aXQKcmVjZWl2ZSBhIC1FQlVTWSBlcnJvciBhbmQgZmFpbCB0byBwcm9iZSwgYnJlYWtpbmcgdGhl
IFdpLUZpIGZ1bmN0aW9uYWxpdHk/Cgo+ICsJcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsKPiAr
fTsKCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hz
ZXQvMjAyNjA3MjYxODIxNTguMjQ5NDQ5LTEtcm9iYXp6YWxiZXJ0b0BnbWFpbC5jb20/cGFydD0z
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1h
bWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
