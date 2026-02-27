Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3C8BFD5307
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Feb 2026 07:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gcz6evP+z8/ilT373tVaQXhJtH/4Bs3rM+dLWGy2JnM=; b=Yjb9iN6bH6dqU7
	zrwptXtyN8f6C/vAVp4ce+v7QKpyT7NZCek0sHa0/lWt40n4iRhTrNE0DxhDv42BO5QhxSo7I2II3
	6sZfQ9Q9iNJyc4kYcBorgWw8GTflQ12DRaaYdIINPbT8QMggI98VNuL4M8ggQ5ZANcWNzY0cyOt8m
	dzHxa2fwR8kq8YxNLp3eXHP6uOBJxF1aGcAvuqxN4wel2SV30udPeiNtgsHSLK+Gd0DvsKWfYycJZ
	/U+T992JgZDW4rePwpfHBb0qjfyk+/JBrPyUTt5oWWEXbkn9wq4GZE+qHUyz0lWSI4AxTyFG7srNa
	o6c9pqcDuX+9eGPcYgPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvs9k-00000007rvd-1gql;
	Fri, 27 Feb 2026 07:21:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvs9i-00000007rrn-15vU
	for linux-amlogic@lists.infradead.org;
	Fri, 27 Feb 2026 07:20:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6E869600CB;
	Fri, 27 Feb 2026 07:20:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 03E36C19422;
	Fri, 27 Feb 2026 07:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772176857;
	bh=T7mCD06lDU5DfC9aZgE7urBavQIEpNqLFoT5bM3tG1U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=n4nQoMsc8cTql05xLqUbXNHUlUQDCi+d1bqD1Pmm1CSbCZSIwDKAfW+3jrBa+Qz3r
	 8NMr/+n/AeolLOT16C+Zoip5IWdDfTgNYHT1I4RBJxzckRuhoW9Xwtc0QuOY6CwbeJ
	 RVH3Y0k9cb5sZJwz5RKPJhWQwx4Awd6FCTsQ+rBzT5XWOqlGSCthosmNWcb1kwGDKp
	 Z4Ghyt3/ni5FKsu30l9y8fEOffyedQaovVnpx61H5BD2raYc9sG4VWqOmF3l0oAr+3
	 7QsAe2PfzgENRpKIH7TGVZfz5SPXst8VoWrMmWr3AKefEgXqWBvGbyNt1sjtJfJ4tT
	 p70Qal3iUf2Ew==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7DB2FD5304;
	Fri, 27 Feb 2026 07:20:56 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Fri, 27 Feb 2026 07:20:53 +0000
Subject: [PATCH v4 1/3] dt-bindings: dma: Add Amlogic A9 SoC DMA
MIME-Version: 1.0
Message-Id: <20260227-amlogic-dma-v4-1-f25e4614e9b7@amlogic.com>
References: <20260227-amlogic-dma-v4-0-f25e4614e9b7@amlogic.com>
In-Reply-To: <20260227-amlogic-dma-v4-0-f25e4614e9b7@amlogic.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-amlogic@lists.infradead.org, dmaengine@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hardening@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772176854; l=2714;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=kAPLFHoe2A7SVw2vXJTjrGauMsdYZiEvifE22xpjjBo=;
 b=yX2kd6NWfUScjoGpltvYYUcwtCcpiMw2C1VdfpjjA01frK3bCd9gn8zxl94ebazsSzxovYqDI
 O7D27TXGZDQD/gvIuHYER7G5LbLL77iE/qQ/bWuiZPfh81uQIjPKaa4
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
aWMtZG1hLmggICAgICAgICAgICAgIHwgIDggKysrCiAyIGZpbGVzIGNoYW5nZWQsIDczIGluc2Vy
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
ZG1hL2FtbG9naWMtZG1hLmggYi9pbmNsdWRlL2R0LWJpbmRpbmdzL2RtYS9hbWxvZ2ljLWRtYS5o
Cm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwMC4uMDI1ZWNjNDJlMzk1Ci0t
LSAvZGV2L251bGwKKysrIGIvaW5jbHVkZS9kdC1iaW5kaW5ncy9kbWEvYW1sb2dpYy1kbWEuaApA
QCAtMCwwICsxLDggQEAKKy8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMCBPUiBN
SVQpICovCisKKyNpZm5kZWYgX19EVF9CSU5ESU5HU19ETUFfQU1MT0dJQ19ETUFfSF9fCisjZGVm
aW5lIF9fRFRfQklORElOR1NfRE1BX0FNTE9HSUNfRE1BX0hfXworCisjZGVmaW5lIEFNTF9ETUFf
VFlQRV9UWAkJMAorI2RlZmluZSBBTUxfRE1BX1RZUEVfUlgJCTEKKyNlbmRpZiAvKiBfX0RUX0JJ
TkRJTkdTX0RNQV9BTUxPR0lDX0RNQV9IX18gKi8KCi0tIAoyLjUyLjAKCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5n
IGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
