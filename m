Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E216EF36E0
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Mar 2026 06:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xNC7WiaLji3vrhJwwVxaSHj65q094L3SkR5J4OkQ2UM=; b=f8JJRuJspsKr++
	yiz2CJSjWUQHppmdnVxtW45S96mvUQzsia4VlDPNlFzcIRZd46Q3UcXlSZeQwj/LYL0PFAILO3Ohn
	hT4wZIJTE+T1IyO3CKm/wdQxSRDz/uAKK9yIdAA+t0Ii2cosbLytrY7p/1X3s9vCXN9FYlTvcaXVP
	gl4AC98czAfO9b/6cF8htk12H/CQ+/vgg8HfDDx7NiyTBjK1wGLQ/vuf0aeO47PyfjT0M+nbsSge4
	QhWm2EyrI5vpPbcOUvbWkIYtY4ozk79dnLpz6gewyFsv2yYWko9S4Ek86KVKH7vK4mKJ8NGiYOQ/4
	ee7DsJRtOJVSHR7heiTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzUBi-00000006jna-3cuX;
	Mon, 09 Mar 2026 06:33:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzUBh-00000006jmV-1t7U
	for linux-amlogic@lists.infradead.org;
	Mon, 09 Mar 2026 06:33:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9731960121;
	Mon,  9 Mar 2026 06:33:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3B9E9C2BC87;
	Mon,  9 Mar 2026 06:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773038036;
	bh=/BgmOAire621Z/jgVhyfIQNUbAABDn5uV30D8Z3Qf0U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=hxBKXCJ0044o7edqd59yvlVlAGABGiCSafCPl5m2rMnam+7Fhz80/su1NCvrnv1fm
	 5BG8YCoOs7+JY7iZyEidZLrN+78yle1pDtLHvzz7tJHcR5FsShBVnuZjdN8ZTLc6IM
	 21KYTiMBRMFbNC8ODFJxRf1xDn4bqogs4cmpt9+8US1oqR36b6hHVagc9hDWoLtX6d
	 xUQHlJzZCeb7jxDs1nDS4MTm8ZiTxFQYA3+b9D+JuWMkm1avsZbllHX3qF7hqsvRlg
	 YqASM0AHY3COO+RmJhfbk0fbzE/dcJwGYXadEQbZUOYyT6bFZ5FMI/viq3cj51KIBC
	 /Gn20qNhd5LaQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A733EF36E5;
	Mon,  9 Mar 2026 06:33:56 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Mon, 09 Mar 2026 06:33:52 +0000
Subject: [PATCH v6 1/3] dt-bindings: dma: Add Amlogic A9 SoC DMA
MIME-Version: 1.0
Message-Id: <20260309-amlogic-dma-v6-1-63349d23bd4b@amlogic.com>
References: <20260309-amlogic-dma-v6-0-63349d23bd4b@amlogic.com>
In-Reply-To: <20260309-amlogic-dma-v6-0-63349d23bd4b@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773038034; l=2780;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=wQ86G1QdzFbWQ2wHf2Egs+gPp1C5gmZDaeMgB/r2pGQ=;
 b=b4nco4Zn2Cp3BNLHTiA+DpTfzRvtpdI7CpkJgXmGTaLa2PolaMM47E+LqbQuJpEnbayjc2ngG
 +1icMSiJ8x2A3r0sUjR0LlfozqydbxcJ3f00YDlRGVYB8rya5wqhLew
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
