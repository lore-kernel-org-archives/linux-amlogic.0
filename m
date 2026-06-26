Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A745CCDE012
	for <linux-amlogic@archiver.kernel.org>; Fri, 26 Jun 2026 05:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xNC7WiaLji3vrhJwwVxaSHj65q094L3SkR5J4OkQ2UM=; b=gf26l0qpbR2isW
	q7+iWMjedwhI+a0y99XunrpQSEToXRpqutboyJ8KFT6h/7N60rA9hqtmJSNOzO6Wv1eYa+SiTZGUo
	8WF9DGz8UzbZepp7iwMs/LWjVVWFUJiPYA3dXp/a+yuvLXCrfAvETGLoY3Rc4ineaTATeNcRSsmtU
	x0urmSetvXlbuWHeCts0mWSf1QOGSQvEulJ6DK7RDwPqKmzFA85I4KOXlgnQauGQiZjyAtmqxoRct
	pWW1ipZooes66VQs6l0GcTCTTMBggkf2SZOeY0kMzL0lLH7bOGn2OhXrEbnZ0UlYt0J3Cp+SvkjHc
	QtX2UkdOlTf8F8bHLPSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wczHy-0000000AWr5-0A76;
	Fri, 26 Jun 2026 05:39:42 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wczHw-0000000AWqW-0uFk
	for linux-amlogic@lists.infradead.org;
	Fri, 26 Jun 2026 05:39:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6C14B60128;
	Fri, 26 Jun 2026 05:39:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 184D5C19425;
	Fri, 26 Jun 2026 05:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1782452378;
	bh=/BgmOAire621Z/jgVhyfIQNUbAABDn5uV30D8Z3Qf0U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=FzMQsLtBWQ/Ch0BV5BGSlZvl9VVgJOK4tcMpkX2WIfetymjuRnIWhaUk4pIJ2KmZi
	 DzYfYDSUvplCuOSqVFrxGR5PvfoHw1US8R936pN7ad1fzFg1GCUjmk5uqHZJ0BDM19
	 NyfZAro11PcHJCNZnIUadj4Ds2IWPQV71qwN0mfyo6K/Nzy6lqQjOXBvzs4ChSPU4y
	 KA/nnCR0g0Fbt2SVX89hBULIxoPgH3BRkqVtNuJSEhR41OHXNcPkdUPATsqNqaeXpA
	 IgYq7jtKP+nX808ZjYINEs4OMOkIRLPxnVRKBCOE8nagSFv3W+RIJHv0slI092oPdn
	 iIKBZswsa3JtQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 046F0CDE011;
	Fri, 26 Jun 2026 05:39:38 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Fri, 26 Jun 2026 05:39:33 +0000
Subject: [PATCH v9 1/3] dt-bindings: dma: Add Amlogic A9 SoC DMA
MIME-Version: 1.0
Message-Id: <20260626-amlogic-dma-v9-1-558d672c4a95@amlogic.com>
References: <20260626-amlogic-dma-v9-0-558d672c4a95@amlogic.com>
In-Reply-To: <20260626-amlogic-dma-v9-0-558d672c4a95@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782452375; l=2780;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=wQ86G1QdzFbWQ2wHf2Egs+gPp1C5gmZDaeMgB/r2pGQ=;
 b=ppgaT6gwT0uqOphL4VNgv8VIir4JAXEuCP8ve3JzmHX9ygvs5b+NO3nhUW+pFr7spMROVmGTo
 Sa9CtNzX40RDT+6QQ7w+VW+O1l2cLWJKwopzrelEDdGxVLHF0EhGTNX
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
OS1kbWEueWFtbCAgICB8IDY1ICsrKysrKysrKysrKysrKysrKysrKysKIGluY2x1ZGUvZHQtYmlu
ZGluZ3MvZG1hL2FtbG9naWMsYTktZG1hLmggICAgICAgICAgIHwgIDggKysrCiAyIGZpbGVzIGNo
YW5nZWQsIDczIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvZG1hL2FtbG9naWMsYTktZG1hLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvZG1hL2FtbG9naWMsYTktZG1hLnlhbWwKbmV3IGZpbGUgbW9kZSAx
MDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwLi5lZmQ3YjI2MDJjMzMKLS0tIC9kZXYvbnVsbAorKysg
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZG1hL2FtbG9naWMsYTktZG1hLnlh
bWwKQEAgLTAsMCArMSw2NSBAQAorIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1v
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
IDIKKworICBkbWEtY2hhbm5lbHM6CisgICAgbWF4aW11bTogNjQKKworcmVxdWlyZWQ6CisgIC0g
Y29tcGF0aWJsZQorICAtIHJlZworICAtIGludGVycnVwdHMKKyAgLSBjbG9ja3MKKyAgLSAnI2Rt
YS1jZWxscycKKyAgLSBkbWEtY2hhbm5lbHMKKworYWxsT2Y6CisgIC0gJHJlZjogZG1hLWNvbnRy
b2xsZXIueWFtbCMKKwordW5ldmFsdWF0ZWRQcm9wZXJ0aWVzOiBmYWxzZQorCitleGFtcGxlczoK
KyAgLSB8CisgICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL2Fy
bS1naWMuaD4KKyAgICBkbWEtY29udHJvbGxlckBmZTQwMDAwMHsKKyAgICAgICAgY29tcGF0aWJs
ZSA9ICJhbWxvZ2ljLGE5LWRtYSI7CisgICAgICAgIHJlZyA9IDwweGZlNDAwMDAwIDB4NDAwMD47
CisgICAgICAgIGludGVycnVwdHMgPSA8R0lDX1NQSSAzNSBJUlFfVFlQRV9FREdFX1JJU0lORz47
CisgICAgICAgIGNsb2NrcyA9IDwmY2xrYyA0NT47CisgICAgICAgICNkbWEtY2VsbHMgPSA8Mj47
CisgICAgICAgIGRtYS1jaGFubmVscyA9IDwyOD47CisgICAgfTsKZGlmZiAtLWdpdCBhL2luY2x1
ZGUvZHQtYmluZGluZ3MvZG1hL2FtbG9naWMsYTktZG1hLmggYi9pbmNsdWRlL2R0LWJpbmRpbmdz
L2RtYS9hbWxvZ2ljLGE5LWRtYS5oCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAw
MDAwMC4uYzU5YzJmZDRiOTU2Ci0tLSAvZGV2L251bGwKKysrIGIvaW5jbHVkZS9kdC1iaW5kaW5n
cy9kbWEvYW1sb2dpYyxhOS1kbWEuaApAQCAtMCwwICsxLDggQEAKKy8qIFNQRFgtTGljZW5zZS1J
ZGVudGlmaWVyOiAoR1BMLTIuMCBPUiBNSVQpICovCisKKyNpZm5kZWYgX19EVF9CSU5ESU5HU19E
TUFfQU1MT0dJQ19ETUFfSF9fCisjZGVmaW5lIF9fRFRfQklORElOR1NfRE1BX0FNTE9HSUNfRE1B
X0hfXworCisjZGVmaW5lIERNQV9UWAkJCTAKKyNkZWZpbmUgRE1BX1JYCQkJMQorI2VuZGlmIC8q
IF9fRFRfQklORElOR1NfRE1BX0FNTE9HSUNfRE1BX0hfXyAqLwoKLS0gCjIuNTIuMAoKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2lj
IG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
