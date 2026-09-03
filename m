Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7004EC624D4
	for <linux-amlogic@archiver.kernel.org>; Thu,  3 Sep 2026 07:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EK3+C59qJRVmmUD3JFx/Z6hyJVYQsSuyO7oyPypwrGs=; b=BVcT/RbV0TdRdP
	7GUf8G18jyvB4PLCTvKk85OqyKFQtiGG2tt2hSHFReF0hYD1iGvlkB1JsU1QCEwN7NPN6fBXy1Tfk
	+4OPLTg2jWY/PKZOxum70ca4USJyOQRfVCfXuhkCqWOH1DSErzKmGHs1gLcmHv702hbXg+U+K2shB
	w++ibjCBXTtTi7tMkvL/MhUogVptU0LqI4HqPtPQU6EhYP/1/HcF8+vsS3yK0VZCpnYVNuX+1PuLA
	ZpOhr1VUbkmxbPt9GfFEq2RPLy+2rnqCBqxlTRlQkUmLfH//qEv/bgRZhKN4HTQ1d06t0aHsXHnFk
	N65gpl9YKUqzWeFDoCjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x221s-0000000GcBP-2Jao;
	Thu, 03 Sep 2026 07:38:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x221q-0000000GcAM-44Ut
	for linux-amlogic@lists.infradead.org;
	Thu, 03 Sep 2026 07:38:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2503660267;
	Thu,  3 Sep 2026 07:38:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C0EC1C2BCB8;
	Thu,  3 Sep 2026 07:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788421113;
	bh=HjPvIcv6mjvoHee2qbgEDrRu5g63yWG6e0WdNC6RalI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=nceSxOq/QoQdUr7Z2Z6FR3kOTS6K4qSvvdDp97zOokApqpALC1YtJbiMfFeWQmgPl
	 fEb4m1H5kLyd3R1s28ksYPxUN0lgmSHHvhKNTlGNGOb2R+SSKhnZFqmyaHM0Ai/N8g
	 qqFOrF9QalwYE+3RRjWcrSfo5QN2S1R28uxo6T/AKeNl30YUC2s6fuKa/rdOQr+G4z
	 25co915K5kf6vvvMtsU6QqXsDJz73PZyynwDxSOAS4Jx20rvjUrBobGDotfcyDrJpS
	 TEdNwHZRQ48EG4niAWM0Ncm1M4RGVI2vrCgqr+t+J8RpgaNfzCDlsZBl56uPOTGi6x
	 V+XMK0xTnbBPA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F154C624A4;
	Thu,  3 Sep 2026 07:38:33 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Thu, 03 Sep 2026 07:38:28 +0000
Subject: [PATCH v12 1/3] dt-bindings: dma: Add Amlogic A9 SoC DMA
MIME-Version: 1.0
Message-Id: <20260903-amlogic-dma-v12-1-f769bc344056@amlogic.com>
References: <20260903-amlogic-dma-v12-0-f769bc344056@amlogic.com>
In-Reply-To: <20260903-amlogic-dma-v12-0-f769bc344056@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788421111; l=2958;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=cKXRfn5UIkIE+VJAQBEmrP1PxVr2HXEVLluheUBFB6M=;
 b=qt5qMdoUGiRul8XXXy22i1WJFHMJoNkUhAkAuUHAx63iLtZ+ll5g/flx2wApiurns8C6dOIzP
 b3GJGM7RmYHCFUIYmDBk3BH7VWLxShxH8UIHVOS/xpI82FzfImCE/Hf
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
MDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwLi4zZTFhNGZiYTMwNDcKLS0tIC9kZXYvbnVsbAorKysg
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
bm5lbCB0eXBlKEFNTE9HSUNfQTlfRE1BX1RYIG9yIEFNTE9HSUNfQTlfRE1BX1JYKS4KKyAgICAg
IFRoZSBzZWNvbmQgY2VsbCBpcyB0aGUgRE1BIGNoYW5uZWwgaW5kZXguCisKKyAgZG1hLWNoYW5u
ZWxzOgorICAgIG1heGltdW06IDY0CisKK3JlcXVpcmVkOgorICAtIGNvbXBhdGlibGUKKyAgLSBy
ZWcKKyAgLSBpbnRlcnJ1cHRzCisgIC0gY2xvY2tzCisgIC0gJyNkbWEtY2VsbHMnCisgIC0gZG1h
LWNoYW5uZWxzCisKK2FsbE9mOgorICAtICRyZWY6IGRtYS1jb250cm9sbGVyLnlhbWwjCisKK3Vu
ZXZhbHVhdGVkUHJvcGVydGllczogZmFsc2UKKworZXhhbXBsZXM6CisgIC0gfAorICAgICNpbmNs
dWRlIDxkdC1iaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9hcm0tZ2ljLmg+CisgICAgZG1h
LWNvbnRyb2xsZXJAZmU0MDAwMDAgeworICAgICAgICBjb21wYXRpYmxlID0gImFtbG9naWMsYTkt
ZG1hIjsKKyAgICAgICAgcmVnID0gPDB4ZmU0MDAwMDAgMHg0MDAwPjsKKyAgICAgICAgaW50ZXJy
dXB0cyA9IDxHSUNfU1BJIDM1IElSUV9UWVBFX0VER0VfUklTSU5HPjsKKyAgICAgICAgY2xvY2tz
ID0gPCZjbGtjIDQ1PjsKKyAgICAgICAgI2RtYS1jZWxscyA9IDwyPjsKKyAgICAgICAgZG1hLWNo
YW5uZWxzID0gPDI4PjsKKyAgICB9OwpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kdC1iaW5kaW5ncy9k
bWEvYW1sb2dpYyxhOS1kbWEuaCBiL2luY2x1ZGUvZHQtYmluZGluZ3MvZG1hL2FtbG9naWMsYTkt
ZG1hLmgKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwLi5lYTdjOTAwNjM1
NzIKLS0tIC9kZXYvbnVsbAorKysgYi9pbmNsdWRlL2R0LWJpbmRpbmdzL2RtYS9hbWxvZ2ljLGE5
LWRtYS5oCkBAIC0wLDAgKzEsOCBAQAorLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwt
Mi4wIE9SIE1JVCkgKi8KKworI2lmbmRlZiBfX0RUX0JJTkRJTkdTX0RNQV9BTUxPR0lDX0RNQV9I
X18KKyNkZWZpbmUgX19EVF9CSU5ESU5HU19ETUFfQU1MT0dJQ19ETUFfSF9fCisKKyNkZWZpbmUg
QU1MT0dJQ19BOV9ETUFfVFgJCTAKKyNkZWZpbmUgQU1MT0dJQ19BOV9ETUFfUlgJCTEKKyNlbmRp
ZiAvKiBfX0RUX0JJTkRJTkdTX0RNQV9BTUxPR0lDX0RNQV9IX18gKi8KCi0tIAoyLjUyLjAKCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1s
b2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
