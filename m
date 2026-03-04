Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54887EDEC14
	for <linux-amlogic@archiver.kernel.org>; Wed,  4 Mar 2026 06:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G4TDQ9ZyQlltybb7xnatk4RQvdxVHpnSdnyLJ07H1/Q=; b=49eyEBRJTMOg6a
	+iJnE8tKP2Dde79LCXsA7MMI07q5imiphtQiAlsfmMHgNpGGQuL+y4BJ1pX0xPGefVvHdYSFHhZse
	OXCMV1181+JSdDG85dGPegn13fHRauiWqbW8mFqWH/TCltOk43TM4m7bCIFkd0aIqfzTh4CflqDHo
	WYeww1acZ3G7/AgrD3GcNz/ZI1H4yWYEuuoNb4AnflYQ+2P9c1uN2AW5+EVXEfVHdsqLMv22uQ7TW
	HpYnEN8ik3Iqag8+fgX1SVtvobBo2lJ3dchkiWIvW9QLfqKDR1uL6toAB/9BR2wfNaAD1JJahTWFB
	/7ugLTIwhkqPC5zuD+ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxfUx-0000000GVuR-047I;
	Wed, 04 Mar 2026 06:14:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxfUv-0000000GVtL-2xgJ
	for linux-amlogic@lists.infradead.org;
	Wed, 04 Mar 2026 06:14:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CBC6D6132B;
	Wed,  4 Mar 2026 06:14:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 72CFAC2BC87;
	Wed,  4 Mar 2026 06:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772604856;
	bh=lmagtz9+OA/n7FkE5J4e5tGiKXmEpXx/wXUmbG4bvic=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Vnum6WvE08KNd+uLoTmqZcK/Thrg0B+03nS1TWzGt0pJ7QvV1auggUiHk2lnCj1ZH
	 TxaTw6MuXNJ08Prtqs24kpkD8M1ZySTc79pnKQvtkg2lDUvOuPpK42leggEMATEno8
	 RLsyynh8E0b0YSnNeICshM+Jc5Pl65HsVBkENLz9ZrbSa/5Z6+WGZn2uNXIQ4yaFt7
	 fOhst7gtJ+TI2ExH/zBjYZVjPvRPWy5SOeYbTyai77+hcTHbfkcc+vzwm9ptAHEXn6
	 Q2eXTEOHi7SP30sy+T5yg/GXk3WLho6QjqdtJS2rc4XwiSusVi+i6mBycXrpdxQbWo
	 mI80dk2GSzh9A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F993EDEC12;
	Wed,  4 Mar 2026 06:14:16 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Wed, 04 Mar 2026 06:14:12 +0000
Subject: [PATCH v5 1/3] dt-bindings: dma: Add Amlogic A9 SoC DMA
MIME-Version: 1.0
Message-Id: <20260304-amlogic-dma-v5-1-aa453d14fd43@amlogic.com>
References: <20260304-amlogic-dma-v5-0-aa453d14fd43@amlogic.com>
In-Reply-To: <20260304-amlogic-dma-v5-0-aa453d14fd43@amlogic.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-amlogic@lists.infradead.org, dmaengine@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hardening@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772604853; l=2707;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=tOW+mg+Op+k/ZgX4FkAdrJ1JecmytVhZ23wsn8r2TZM=;
 b=mWvgpgqvHp3o6DoHv4R46+QmnZA7osrhiKPLH45vypHg87VH7F/67t1VwEIhk651oC3wnI5oU
 LnKL7RT9POhBhhk7uhizOH7OzaNcd7BZq5G1t54lr6yppWBvK/tWqoy
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
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
Reply-To: xianwei.zhao@amlogic.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

RnJvbTogWGlhbndlaSBaaGFvIDx4aWFud2VpLnpoYW9AYW1sb2dpYy5jb20+CgpBZGQgZG9jdW1l
bnRhdGlvbiBkZXNjcmliaW5nIHRoZSBBbWxvZ2ljIEE5IFNvQyBETUEuIEFuZCBhZGQKdGhlIHBy
b3BlcnRpZXMgc3BlY2lmaWMgdmFsdWVzIGRlZmluZXMgaW50byBhIG5ldyBpbmNsdWRlIGZpbGUu
CgpTaWduZWQtb2ZmLWJ5OiBYaWFud2VpIFpoYW8gPHhpYW53ZWkuemhhb0BhbWxvZ2ljLmNvbT4K
LS0tCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9kbWEvYW1sb2dpYyxhOS1kbWEueWFtbCAgICB8
IDY1ICsrKysrKysrKysrKysrKysrKysrKysKIGluY2x1ZGUvZHQtYmluZGluZ3MvZG1hL2FtbG9n
aWMsYTktZG1hLmggICAgICAgICAgIHwgIDggKysrCiAyIGZpbGVzIGNoYW5nZWQsIDczIGluc2Vy
dGlvbnMoKykKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
ZG1hL2FtbG9naWMsYTktZG1hLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvZG1hL2FtbG9naWMsYTktZG1hLnlhbWwKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAw
MDAwMDAwMDAwLi5lZmQ3YjI2MDJjMzMKLS0tIC9kZXYvbnVsbAorKysgYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvZG1hL2FtbG9naWMsYTktZG1hLnlhbWwKQEAgLTAsMCArMSw2
NSBAQAorIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNs
YXVzZQorJVlBTUwgMS4yCistLS0KKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMv
ZG1hL2FtbG9naWMsYTktZG1hLnlhbWwjCiskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcv
bWV0YS1zY2hlbWFzL2NvcmUueWFtbCMKKwordGl0bGU6IEFtbG9naWMgZ2VuZXJhbCBETUEgY29u
dHJvbGxlcgorCitkZXNjcmlwdGlvbjoKKyAgVGhpcyBpcyBhIGdlbmVyYWwtcHVycG9zZSBwZXJp
cGhlcmFsIERNQSBjb250cm9sbGVyLiBJdCBjdXJyZW50bHkgc3VwcG9ydHMKKyAgbWFqb3IgcGVy
aXBoZXJhbHMgaW5jbHVkaW5nIEkyQywgSTNDLCBQSU8sIGFuZCBDQU4tQlVTLiBUcmFuc21pdCBh
bmQgcmVjZWl2ZQorICBmb3IgdGhlIHNhbWUgcGVyaXBoZXJhbCB1c2UgdHdvIHNlcGFyYXRlIGNo
YW5uZWxzLCBjb250cm9sbGVkIGJ5IGRpZmZlcmVudAorICByZWdpc3RlciBzZXRzLiBJMkMgYW5k
IEkzQyB0cmFuc2ZlciBkYXRhIGluIDEtYnl0ZSB1bml0cywgd2hpbGUgUElPIGFuZAorICBDQU4t
QlVTIHRyYW5zZmVyIGRhdGEgaW4gNC1ieXRlIHVuaXRzLiBGcm9tIHRoZSBjb250cm9sbGVy4oCZ
cyBwZXJzcGVjdGl2ZSwKKyAgdGhlcmUgaXMgbm8gc2lnbmlmaWNhbnQgZGlmZmVyZW5jZS4KKwor
bWFpbnRhaW5lcnM6CisgIC0gWGlhbndlaSBaaGFvIDx4aWFud2VpLnpoYW9AYW1sb2dpYy5jb20+
CisKK3Byb3BlcnRpZXM6CisgIGNvbXBhdGlibGU6CisgICAgY29uc3Q6IGFtbG9naWMsYTktZG1h
CisKKyAgcmVnOgorICAgIG1heEl0ZW1zOiAxCisKKyAgaW50ZXJydXB0czoKKyAgICBtYXhJdGVt
czogMQorCisgIGNsb2NrczoKKyAgICBtYXhJdGVtczogMQorCisgIGNsb2NrLW5hbWVzOgorICAg
IGNvbnN0OiBzeXMKKworICAnI2RtYS1jZWxscyc6CisgICAgY29uc3Q6IDIKKworICBkbWEtY2hh
bm5lbHM6CisgICAgbWF4aW11bTogNjQKKworcmVxdWlyZWQ6CisgIC0gY29tcGF0aWJsZQorICAt
IHJlZworICAtIGludGVycnVwdHMKKyAgLSBjbG9ja3MKKyAgLSAnI2RtYS1jZWxscycKKyAgLSBk
bWEtY2hhbm5lbHMKKworYWxsT2Y6CisgIC0gJHJlZjogZG1hLWNvbnRyb2xsZXIueWFtbCMKKwor
dW5ldmFsdWF0ZWRQcm9wZXJ0aWVzOiBmYWxzZQorCitleGFtcGxlczoKKyAgLSB8CisgICAgI2lu
Y2x1ZGUgPGR0LWJpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL2FybS1naWMuaD4KKyAgICBk
bWEtY29udHJvbGxlckBmZTQwMDAwMHsKKyAgICAgICAgY29tcGF0aWJsZSA9ICJhbWxvZ2ljLGE5
LWRtYSI7CisgICAgICAgIHJlZyA9IDwweGZlNDAwMDAwIDB4NDAwMD47CisgICAgICAgIGludGVy
cnVwdHMgPSA8R0lDX1NQSSAzNSBJUlFfVFlQRV9FREdFX1JJU0lORz47CisgICAgICAgIGNsb2Nr
cyA9IDwmY2xrYyA0NT47CisgICAgICAgICNkbWEtY2VsbHMgPSA8Mj47CisgICAgICAgIGRtYS1j
aGFubmVscyA9IDwyOD47CisgICAgfTsKZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHQtYmluZGluZ3Mv
ZG1hL2FtbG9naWMsYTktZG1hLmggYi9pbmNsdWRlL2R0LWJpbmRpbmdzL2RtYS9hbWxvZ2ljLGE5
LWRtYS5oCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwMC4uYzU5YzJmZDRi
OTU2Ci0tLSAvZGV2L251bGwKKysrIGIvaW5jbHVkZS9kdC1iaW5kaW5ncy9kbWEvYW1sb2dpYyxh
OS1kbWEuaApAQCAtMCwwICsxLDggQEAKKy8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BM
LTIuMCBPUiBNSVQpICovCisKKyNpZm5kZWYgX19EVF9CSU5ESU5HU19ETUFfQU1MT0dJQ19ETUFf
SF9fCisjZGVmaW5lIF9fRFRfQklORElOR1NfRE1BX0FNTE9HSUNfRE1BX0hfXworCisjZGVmaW5l
IERNQV9UWAkJCTAKKyNkZWZpbmUgRE1BX1JYCQkJMQorI2VuZGlmIC8qIF9fRFRfQklORElOR1Nf
RE1BX0FNTE9HSUNfRE1BX0hfXyAqLwoKLS0gCjIuNTIuMAoKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdAps
aW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
