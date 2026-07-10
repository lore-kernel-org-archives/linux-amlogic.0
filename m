Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC272C43458
	for <linux-amlogic@archiver.kernel.org>; Fri, 10 Jul 2026 05:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bir9u8X6/1qNqzRDjVQJBkipJv9z3MAlkcrSq/jRnwg=; b=xi+GmNI4zbRCK5
	xSzujwQpAn7aU3Oqj68Rr67IMm+A9Z3ZzJxiwLEMy7tYIKFEST2N9j2Vsu0UQFg8ZFT+lIdz9+6kq
	++p+/SLG/LqZHMNmOAu+bJwScNbehYg6tGXxv4tRSksrkctYVRSDevFIvPm2vy4W+8GBm/gUWbbZX
	eIEeEp7REITQb0ZfNHzk6WMPshCWVGTqpMzJBL4GuwX4WWQsayuUk8nDfgEO9U9Ll320S0VYn1b8x
	O4Y5VjlqyCgRLoT+CsJOVH9FfkZIEWYbT/RvOdnfvgGOklVGWo+tUNFyXGgtlvi4ibQCMFtqX/P/W
	aBet6eCC6DLU/P7aOJng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi45u-00000004DWU-1Xhr;
	Fri, 10 Jul 2026 05:48:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi45s-00000004DVf-0Fbx
	for linux-amlogic@lists.infradead.org;
	Fri, 10 Jul 2026 05:48:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3B1376136D;
	Fri, 10 Jul 2026 05:48:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D60C6C2BCB9;
	Fri, 10 Jul 2026 05:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783662490;
	bh=1JoqAKvb1v+9+8D6Z6hKQDixrMHBsj2+KAE8y7K+VgE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ctlJNwmvNvv9r1QtlqTORG+j8U6kZyaFlau0TFmLeoQJmCSY9eRqjKAFzmNjkpHob
	 9vCD1jsqSQZ+G4rDlAo83r+PnaxqeGbq+DLzhGp3Uvid+ZVSW0m/V9vI+La05/ruSK
	 +6/B5z24c9eUUHvcwEKq94Xb8TfSev34QV0isDT6KMbutSAYqeSBrKkGhfgiZRqzaD
	 Ord4+0t3axSGLBRT4Kf0uKUdnq+K5ZmXdBcQQOTwha29p6r8QCX+YJAXQTymIeRjfd
	 UV5QeAPAShy9VvB+EngojToon1AkYdr+S/pD8w3K/10+ZrOAaI+t1Un+EsbKNsj1AZ
	 b+gJVqVJi1VnA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B96D9C44501;
	Fri, 10 Jul 2026 05:48:10 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Fri, 10 Jul 2026 05:48:06 +0000
Subject: [PATCH v10 1/3] dt-bindings: dma: Add Amlogic A9 SoC DMA
MIME-Version: 1.0
Message-Id: <20260710-amlogic-dma-v10-1-ff4deae837e7@amlogic.com>
References: <20260710-amlogic-dma-v10-0-ff4deae837e7@amlogic.com>
In-Reply-To: <20260710-amlogic-dma-v10-0-ff4deae837e7@amlogic.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Frank Li <Frank.Li@kernel.org>
Cc: linux-amlogic@lists.infradead.org, dmaengine@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hardening@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783662489; l=2916;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=o/Qp8oCw+N9EVwbF9aeiSMMFq+aTHa2sv+r3V4aaRw0=;
 b=zrZZRmVKEy/MjDnqfT2EA7rFq4NoqlZ0g6xhIyuzqgnPNRn2bW6SXur71D52QG5sLmxOxghd5
 AYLwX8FeD04ABsufQ1u1ZgCTdE7Vip18LP2UC5G0E0tNLzO9GR+Stki
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
CgpSZXZpZXdlZC1ieTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBv
c3MucXVhbGNvbW0uY29tPgpTaWduZWQtb2ZmLWJ5OiBYaWFud2VpIFpoYW8gPHhpYW53ZWkuemhh
b0BhbWxvZ2ljLmNvbT4KLS0tCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9kbWEvYW1sb2dpYyxh
OS1kbWEueWFtbCAgICB8IDY4ICsrKysrKysrKysrKysrKysrKysrKysKIGluY2x1ZGUvZHQtYmlu
ZGluZ3MvZG1hL2FtbG9naWMsYTktZG1hLmggICAgICAgICAgIHwgIDggKysrCiAyIGZpbGVzIGNo
YW5nZWQsIDc2IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvZG1hL2FtbG9naWMsYTktZG1hLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvZG1hL2FtbG9naWMsYTktZG1hLnlhbWwKbmV3IGZpbGUgbW9kZSAx
MDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwLi42Y2VkZDVmZGZlZmQKLS0tIC9kZXYvbnVsbAorKysg
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZG1hL2FtbG9naWMsYTktZG1hLnlh
bWwKQEAgLTAsMCArMSw2OCBAQAorIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1v
bmx5IE9SIEJTRC0yLUNsYXVzZQorJVlBTUwgMS4yCistLS0KKyRpZDogaHR0cDovL2RldmljZXRy
ZWUub3JnL3NjaGVtYXMvZG1hL2FtbG9naWMsYTktZG1hLnlhbWwjCiskc2NoZW1hOiBodHRwOi8v
ZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMKKwordGl0bGU6IEFtbG9naWMg
Z2VuZXJhbCBETUEgY29udHJvbGxlcgorCitkZXNjcmlwdGlvbjoKKyAgVGhpcyBpcyBhIGdlbmVy
YWwtcHVycG9zZSBwZXJpcGhlcmFsIERNQSBjb250cm9sbGVyLiBJdCBjdXJyZW50bHkgc3VwcG9y
dHMKKyAgbWFqb3IgcGVyaXBoZXJhbHMgaW5jbHVkaW5nIEkyQywgSTNDLCBQSU8sIGFuZCBDQU4t
QlVTLiBUcmFuc21pdCBhbmQgcmVjZWl2ZQorICBmb3IgdGhlIHNhbWUgcGVyaXBoZXJhbCB1c2Ug
dHdvIHNlcGFyYXRlIGNoYW5uZWxzLCBjb250cm9sbGVkIGJ5IGRpZmZlcmVudAorICByZWdpc3Rl
ciBzZXRzLiBJMkMgYW5kIEkzQyB0cmFuc2ZlciBkYXRhIGluIDEtYnl0ZSB1bml0cywgd2hpbGUg
UElPIGFuZAorICBDQU4tQlVTIHRyYW5zZmVyIGRhdGEgaW4gNC1ieXRlIHVuaXRzLiBGcm9tIHRo
ZSBjb250cm9sbGVy4oCZcyBwZXJzcGVjdGl2ZSwKKyAgdGhlcmUgaXMgbm8gc2lnbmlmaWNhbnQg
ZGlmZmVyZW5jZS4KKworbWFpbnRhaW5lcnM6CisgIC0gWGlhbndlaSBaaGFvIDx4aWFud2VpLnpo
YW9AYW1sb2dpYy5jb20+CisKK3Byb3BlcnRpZXM6CisgIGNvbXBhdGlibGU6CisgICAgY29uc3Q6
IGFtbG9naWMsYTktZG1hCisKKyAgcmVnOgorICAgIG1heEl0ZW1zOiAxCisKKyAgaW50ZXJydXB0
czoKKyAgICBtYXhJdGVtczogMQorCisgIGNsb2NrczoKKyAgICBtYXhJdGVtczogMQorCisgIGNs
b2NrLW5hbWVzOgorICAgIGNvbnN0OiBzeXMKKworICAnI2RtYS1jZWxscyc6CisgICAgY29uc3Q6
IDIKKyAgICBkZXNjcmlwdGlvbjoKKyAgICAgIFRoZSBmaXJzdCBjZWxsIGlzIHRoZSBETUEgY2hh
bm5lbCB0eXBlKERNQV9UWCBvciBETUFfUlgpLgorICAgICAgVGhlIHNlY29uZCBjZWxsIGlzIHRo
ZSBETUEgY2hhbm5lbCBpbmRleC4KKworICBkbWEtY2hhbm5lbHM6CisgICAgbWF4aW11bTogNjQK
KworcmVxdWlyZWQ6CisgIC0gY29tcGF0aWJsZQorICAtIHJlZworICAtIGludGVycnVwdHMKKyAg
LSBjbG9ja3MKKyAgLSAnI2RtYS1jZWxscycKKyAgLSBkbWEtY2hhbm5lbHMKKworYWxsT2Y6Cisg
IC0gJHJlZjogZG1hLWNvbnRyb2xsZXIueWFtbCMKKwordW5ldmFsdWF0ZWRQcm9wZXJ0aWVzOiBm
YWxzZQorCitleGFtcGxlczoKKyAgLSB8CisgICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2ludGVy
cnVwdC1jb250cm9sbGVyL2FybS1naWMuaD4KKyAgICBkbWEtY29udHJvbGxlckBmZTQwMDAwMCB7
CisgICAgICAgIGNvbXBhdGlibGUgPSAiYW1sb2dpYyxhOS1kbWEiOworICAgICAgICByZWcgPSA8
MHhmZTQwMDAwMCAweDQwMDA+OworICAgICAgICBpbnRlcnJ1cHRzID0gPEdJQ19TUEkgMzUgSVJR
X1RZUEVfRURHRV9SSVNJTkc+OworICAgICAgICBjbG9ja3MgPSA8JmNsa2MgNDU+OworICAgICAg
ICAjZG1hLWNlbGxzID0gPDI+OworICAgICAgICBkbWEtY2hhbm5lbHMgPSA8Mjg+OworICAgIH07
CmRpZmYgLS1naXQgYS9pbmNsdWRlL2R0LWJpbmRpbmdzL2RtYS9hbWxvZ2ljLGE5LWRtYS5oIGIv
aW5jbHVkZS9kdC1iaW5kaW5ncy9kbWEvYW1sb2dpYyxhOS1kbWEuaApuZXcgZmlsZSBtb2RlIDEw
MDY0NAppbmRleCAwMDAwMDAwMDAwMDAuLmM1OWMyZmQ0Yjk1NgotLS0gL2Rldi9udWxsCisrKyBi
L2luY2x1ZGUvZHQtYmluZGluZ3MvZG1hL2FtbG9naWMsYTktZG1hLmgKQEAgLTAsMCArMSw4IEBA
CisvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAgT1IgTUlUKSAqLworCisjaWZu
ZGVmIF9fRFRfQklORElOR1NfRE1BX0FNTE9HSUNfRE1BX0hfXworI2RlZmluZSBfX0RUX0JJTkRJ
TkdTX0RNQV9BTUxPR0lDX0RNQV9IX18KKworI2RlZmluZSBETUFfVFgJCQkwCisjZGVmaW5lIERN
QV9SWAkJCTEKKyNlbmRpZiAvKiBfX0RUX0JJTkRJTkdTX0RNQV9BTUxPR0lDX0RNQV9IX18gKi8K
Ci0tIAoyLjUyLjAKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtYW1sb2dpYwo=
