Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBCB3D25920
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 Jan 2026 03:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vHJD259gLJgO13Zv3yGiryPOpaBZf4jQf7Vx1hgmspE=; b=NJLK7acMJc0Sla
	FdcY8nhxPmo2Nh3djHJh+JfAknNSNnnoU7Z8CDV49Le8Z0qdIbxJbLkVx3BKKKywkXqfFtLXQR5v3
	Vql4Nw4/HfYZP3G0FzU081CVy60UWoX6eAf5C4TD5e4/ZxGxSQvaQzey+iuEcJDNd1uRCjH4FQY32
	OSASplmgCjt0ZEyCMp3zxMUdNSjfFnwg2ezvPs0VIqz5G6hseDTwtD7upV9KMSbXyjxiD4hJ+UERE
	JmU/k/OHND/GBycNHpHcNql4XsWq3u0TVIHrvQPwK78IvmcpKp1wcnpCvzESZRpjbbBnAmN3Tc616
	llrYpTOFvBfU+A4WVT9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkZkK-0000000DaxW-2HUm;
	Tue, 27 Jan 2026 03:28:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkZkG-0000000Dava-3CKg
	for linux-amlogic@lists.infradead.org;
	Tue, 27 Jan 2026 03:28:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 765A9443FA;
	Tue, 27 Jan 2026 03:27:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3F454C19425;
	Tue, 27 Jan 2026 03:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769484479;
	bh=f8HEaw0QD6eF59BNE/tiQtVcFqDiD/wpvJebxI1NjQY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=AJIQPTVfAgprZIJGXw6g+IjR9vQYkByNHCPNhhkaZKkQtnPL9ySdMBjD+6aKXGGlf
	 wYCeaeKHElhGEr7JN+tRYTui8zVTynwk9TFMYLhv1Hw4tOvDRqPKxivk5C7LSi9hH5
	 YevlHKhjDTgnwokkfru8ikx8HoXcroRwkfHV7MHHCFaRzu1PC4Bk50NkAx9MpOIFf1
	 Z2USENgCEZi9kXGWNff49NCzjZStdoE4luLmZBbiTOSdm4yso9UYGJSgaGWTcys6zb
	 qxyFHPwjP55sQ0kvDeS5ulK31tbNq+R8qf8XX3Vwl+y/7aVzaH/Xycs3z9uGKqtmMy
	 BG0JbTBTrP/Og==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 303E2D2592C;
	Tue, 27 Jan 2026 03:27:59 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Tue, 27 Jan 2026 03:27:52 +0000
Subject: [PATCH v2 1/3] dt-bindings: dma: Add Amlogic A9 SoC DMA
MIME-Version: 1.0
Message-Id: <20260127-amlogic-dma-v2-1-4525d327d74d@amlogic.com>
References: <20260127-amlogic-dma-v2-0-4525d327d74d@amlogic.com>
In-Reply-To: <20260127-amlogic-dma-v2-0-4525d327d74d@amlogic.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-amlogic@lists.infradead.org, dmaengine@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hardening@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769484476; l=2278;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=7HPvfvN45jNFSgm9177qR0z8f3j4ANyflLMHJjhl31g=;
 b=teIZPkCKsbKnjSPqMwDOU+m1E+yRZTodwq9Lu03mxvVdfe9KO/vnXUOSYamvg+SVVLniCAXo6
 X4dLvB/F9/pAw79x/8zoid5Sza37C+lQ5ytft549cxR0HgQ9SMcbU2z
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_192800_839754_345202B5 
X-CRM114-Status: GOOD (  10.56  )
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
bnRhdGlvbiBkZXNjcmliaW5nIHRoZSBBbWxvZ2ljIEE5IFNvQyBETUEuCgpTaWduZWQtb2ZmLWJ5
OiBYaWFud2VpIFpoYW8gPHhpYW53ZWkuemhhb0BhbWxvZ2ljLmNvbT4KLS0tCiAuLi4vZGV2aWNl
dHJlZS9iaW5kaW5ncy9kbWEvYW1sb2dpYyxhOS1kbWEueWFtbCAgICB8IDcwICsrKysrKysrKysr
KysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA3MCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0
IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2RtYS9hbWxvZ2ljLGE5LWRtYS55
YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2RtYS9hbWxvZ2ljLGE5LWRt
YS55YW1sCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwMC4uN2QwNDQxNTJm
ZDc2Ci0tLSAvZGV2L251bGwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2RtYS9hbWxvZ2ljLGE5LWRtYS55YW1sCkBAIC0wLDAgKzEsNzAgQEAKKyMgU1BEWC1MaWNlbnNl
LUlkZW50aWZpZXI6IEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UKKyVZQU1MIDEuMgorLS0t
CiskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL2RtYS9hbWxvZ2ljLGE5LWRtYS55
YW1sIworJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlh
bWwjCisKK3RpdGxlOiBBbWxvZ2ljIGdlbmVyYWwgRE1BIGNvbnRyb2xsZXIKKworZGVzY3JpcHRp
b246IHwKKyAgVGhpcyBpcyBhIGdlbmVyYWwtcHVycG9zZSBwZXJpcGhlcmFsIERNQSBjb250cm9s
bGVyLiBJdCBjdXJyZW50bHkgc3VwcG9ydHMKKyAgbWFqb3IgcGVyaXBoZXJhbHMgaW5jbHVkaW5n
IEkyQywgSTNDLCBQSU8sIGFuZCBDQU4tQlVTLiBUcmFuc21pdCBhbmQgcmVjZWl2ZQorICBmb3Ig
dGhlIHNhbWUgcGVyaXBoZXJhbCB1c2UgdHdvIHNlcGFyYXRlIGNoYW5uZWxzLCBjb250cm9sbGVk
IGJ5IGRpZmZlcmVudAorICByZWdpc3RlciBzZXRzLiBJMkMgYW5kIEkzQyB0cmFuc2ZlciBkYXRh
IGluIDEtYnl0ZSB1bml0cywgd2hpbGUgUElPIGFuZAorICBDQU4tQlVTIHRyYW5zZmVyIGRhdGEg
aW4gNC1ieXRlIHVuaXRzLiBGcm9tIHRoZSBjb250cm9sbGVy4oCZcyBwZXJzcGVjdGl2ZSwKKyAg
dGhlcmUgaXMgbm8gc2lnbmlmaWNhbnQgZGlmZmVyZW5jZS4KKworbWFpbnRhaW5lcnM6CisgIC0g
WGlhbndlaSBaaGFvIDx4aWFud2VpLnpoYW9AYW1sb2dpYy5jb20+CisKK3Byb3BlcnRpZXM6Cisg
IGNvbXBhdGlibGU6CisgICAgY29uc3Q6IGFtbG9naWMsYTktZG1hCisKKyAgcmVnOgorICAgIG1h
eEl0ZW1zOiAxCisKKyAgaW50ZXJydXB0czoKKyAgICBtYXhJdGVtczogMQorCisgIGNsb2NrczoK
KyAgICBtYXhJdGVtczogMQorCisgIGNsb2NrLW5hbWVzOgorICAgIGNvbnN0OiBzeXMKKworICAn
I2RtYS1jZWxscyc6CisgICAgY29uc3Q6IDIKKworICBkbWEtY2hhbm5lbHM6CisgICAgJHJlZjog
L3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDMyCisgICAgbWF4aW11bTogNjQK
KworcmVxdWlyZWQ6CisgIC0gY29tcGF0aWJsZQorICAtIHJlZworICAtIGludGVycnVwdHMKKyAg
LSBjbG9ja3MKKyAgLSAnI2RtYS1jZWxscycKKyAgLSBkbWEtY2hhbm5lbHMKKworYWxsT2Y6Cisg
IC0gJHJlZjogZG1hLWNvbnRyb2xsZXIueWFtbCMKKwordW5ldmFsdWF0ZWRQcm9wZXJ0aWVzOiBm
YWxzZQorCitleGFtcGxlczoKKyAgLSB8CisgICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2ludGVy
cnVwdC1jb250cm9sbGVyL2FybS1naWMuaD4KKyAgICBhcGIgeworICAgICAgICAjYWRkcmVzcy1j
ZWxscyA9IDwyPjsKKyAgICAgICAgI3NpemUtY2VsbHMgPSA8Mj47CisgICAgICAgIGRtYS1jb250
cm9sbGVyQGZlNDAwMDAweworICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJhbWxvZ2ljLGE5LWRt
YSI7CisgICAgICAgICAgICByZWcgPSA8MHgwIDB4ZmU0MDAwMDAgMHgwIDB4NDAwMD47CisgICAg
ICAgICAgICBpbnRlcnJ1cHRzID0gPEdJQ19TUEkgMzUgSVJRX1RZUEVfRURHRV9SSVNJTkc+Owor
ICAgICAgICAgICAgY2xvY2tzID0gPCZjbGtjIDQ1PjsKKyAgICAgICAgICAgICNkbWEtY2VsbHMg
PSA8Mj47CisgICAgICAgICAgICBkbWEtY2hhbm5lbHMgPSA8Mjg+OworICAgICAgICB9OworICAg
IH07CgotLSAKMi41Mi4wCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LWFtbG9naWMK
