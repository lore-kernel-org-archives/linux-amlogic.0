Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAF36D5C0CD
	for <linux-amlogic@archiver.kernel.org>; Tue, 16 Dec 2025 08:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yzpe1t9YTJIFw4BSRuH6I5W0FNPb5PamSS13slYdC00=; b=uBYRrXKiEEURfo
	UMiEWUI7UXjHFwNN1FDpmuklziP8EgbIqvsx8fB3ljy0Vw+wvQIvHdG5KNEipyUb4eHQv/0+Gh/Ps
	x9rWmrfZ9h3UXavtUNF5U9/+9IrMy5w/mbiGa7VNmquL5+jfKTjmYP+8gTZgd04wqCp93M/91G0DB
	jWCXGyvYW8TRfMmH3ez+L4UarijwP0wJBEyiclMh74bF6DZUFyh+cEOy+SGb1rdkdjGFfLKsipS1M
	EUA3XfiW1QdTY6XZ7F0hn1GMkbQJtw64Cc9R8mqY1X37JJb2CPPL4vFAwJEMFLTOa9BoBxFlzWq+T
	x7xj5IDnz68BvBiLjZyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVQ1j-00000004tKB-41pR;
	Tue, 16 Dec 2025 08:03:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVQ1i-00000004tJQ-23uW
	for linux-amlogic@lists.infradead.org;
	Tue, 16 Dec 2025 08:03:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4BB0E60189;
	Tue, 16 Dec 2025 08:03:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id ED877C19424;
	Tue, 16 Dec 2025 08:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765872201;
	bh=SWV/NfL3tLtgdR0M1+5VAcbUWkx942kwzpVWDE2itE0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=szghvzKLsJXowPIL3zohB0bKAioASP/yfFzcC89jI6asBK9WKb9ccFqt8vP017QQ1
	 sbMVNshut3lEw6TZqLnJMyWeHRO3rxZyikVpdo/Qy3e6ukaWO4ce5Ms3CZdTdXd3KV
	 KDbhjZP4wj5lrnChsVq8PXBODHl/d8ntgemBxacHWUq2IJDeFe07KZBMQz/keeAD8Y
	 CZxFKXweZi3Jsmsj8iPQdlC60vdtdm/FkQ8k3oGzYWHlaSnI2q4DVIV/8jK0SGOy0Z
	 xoObIDlyGe9Ct2yIKPrNBaxRWDqhJW6uZXlU+a3x8fO0a9qBJzf5xVxrBZMlLIsaTP
	 hO0w5WFvfLw6g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4960D5C0D0;
	Tue, 16 Dec 2025 08:03:20 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Tue, 16 Dec 2025 08:03:17 +0000
Subject: [PATCH 1/3] dt-bindings: dma: Add Amlogic general DMA
MIME-Version: 1.0
Message-Id: <20251216-amlogic-dma-v1-1-e289e57e96a7@amlogic.com>
References: <20251216-amlogic-dma-v1-0-e289e57e96a7@amlogic.com>
In-Reply-To: <20251216-amlogic-dma-v1-0-e289e57e96a7@amlogic.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-amlogic@lists.infradead.org, dmaengine@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hardening@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765872198; l=2309;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=YtNRhQ7yOxGHI4OflJLoTQNj1t3FJEpqV/TcNs/qfSA=;
 b=XpNQNJ5Pk6DQgEgq8PAeCMnzEndlKbIEJtJ9zf+fGqwPN8DH/boK5LsAvSrASIYm4jjkWFm+d
 sQSF4mpzF76Af5+idnocEoqsSblm27jw0/CW4/tWBOsIciDiUmgfmBQ
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
bnRhdGlvbiBkZXNjcmliaW5nIHRoZSBBbWxvZ2ljIGdlbmVyYWwgRE1BLgoKU2lnbmVkLW9mZi1i
eTogWGlhbndlaSBaaGFvIDx4aWFud2VpLnpoYW9AYW1sb2dpYy5jb20+Ci0tLQogLi4uL2JpbmRp
bmdzL2RtYS9hbWxvZ2ljLGdlbmVyYWwtZG1hLnlhbWwgICAgICAgICAgfCA3MCArKysrKysrKysr
KysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNzAgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdp
dCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kbWEvYW1sb2dpYyxnZW5lcmFs
LWRtYS55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2RtYS9hbWxvZ2lj
LGdlbmVyYWwtZG1hLnlhbWwKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAw
Li44YjljZWM5YjhkYTAKLS0tIC9kZXYvbnVsbAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvZG1hL2FtbG9naWMsZ2VuZXJhbC1kbWEueWFtbApAQCAtMCwwICsxLDcwIEBA
CisjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkgT1IgQlNELTItQ2xhdXNl
CislWUFNTCAxLjIKKy0tLQorJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9kbWEv
YW1sb2dpYyxnZW5lcmFsLWRtYS55YW1sIworJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3Jn
L21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjCisKK3RpdGxlOiBBbWxvZ2ljIGdlbmVyYWwgRE1BIGNv
bnRyb2xsZXIKKworZGVzY3JpcHRpb246IHwKKyAgVGhpcyBpcyBhIGdlbmVyYWwtcHVycG9zZSBw
ZXJpcGhlcmFsIERNQSBjb250cm9sbGVyLiBJdCBjdXJyZW50bHkgc3VwcG9ydHMKKyAgbWFqb3Ig
cGVyaXBoZXJhbHMgaW5jbHVkaW5nIEkyQywgSTNDLCBQSU8sIGFuZCBDQU4tQlVTLiBUcmFuc21p
dCBhbmQgcmVjZWl2ZQorICBmb3IgdGhlIHNhbWUgcGVyaXBoZXJhbCB1c2UgdHdvIHNlcGFyYXRl
IGNoYW5uZWxzLCBjb250cm9sbGVkIGJ5IGRpZmZlcmVudAorICByZWdpc3RlciBzZXRzLiBJMkMg
YW5kIEkzQyB0cmFuc2ZlciBkYXRhIGluIDEtYnl0ZSB1bml0cywgd2hpbGUgUElPIGFuZAorICBD
QU4tQlVTIHRyYW5zZmVyIGRhdGEgaW4gNC1ieXRlIHVuaXRzLiBGcm9tIHRoZSBjb250cm9sbGVy
4oCZcyBwZXJzcGVjdGl2ZSwKKyAgdGhlcmUgaXMgbm8gc2lnbmlmaWNhbnQgZGlmZmVyZW5jZS4K
KworbWFpbnRhaW5lcnM6CisgIC0gWGlhbndlaSBaaGFvIDx4aWFud2VpLnpoYW9AYW1sb2dpYy5j
b20+CisKK3Byb3BlcnRpZXM6CisgIGNvbXBhdGlibGU6CisgICAgY29uc3Q6IGFtbG9naWMsZ2Vu
ZXJhbC1kbWEKKworICByZWc6CisgICAgbWF4SXRlbXM6IDEKKworICBpbnRlcnJ1cHRzOgorICAg
IG1heEl0ZW1zOiAxCisKKyAgY2xvY2tzOgorICAgIG1heEl0ZW1zOiAxCisKKyAgY2xvY2stbmFt
ZXM6CisgICAgY29uc3Q6IHN5cworCisgICcjZG1hLWNlbGxzJzoKKyAgICBjb25zdDogMgorCisg
IGRtYS1jaGFubmVsczoKKyAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9u
cy91aW50MzIKKyAgICBtYXhpbXVtOiA2NAorCityZXF1aXJlZDoKKyAgLSBjb21wYXRpYmxlCisg
IC0gcmVnCisgIC0gaW50ZXJydXB0cworICAtIGNsb2NrcworICAtICcjZG1hLWNlbGxzJworICAt
IGRtYS1jaGFubmVscworCithbGxPZjoKKyAgLSAkcmVmOiBkbWEtY29udHJvbGxlci55YW1sIwor
Cit1bmV2YWx1YXRlZFByb3BlcnRpZXM6IGZhbHNlCisKK2V4YW1wbGVzOgorICAtIHwKKyAgICAj
aW5jbHVkZSA8ZHQtYmluZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xsZXIvYXJtLWdpYy5oPgorICAg
IGFwYiB7CisgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDI+OworICAgICAgICAjc2l6ZS1jZWxs
cyA9IDwyPjsKKyAgICAgICAgZG1hLWNvbnRyb2xsZXJAZmU0MDAwMDB7CisgICAgICAgICAgICBj
b21wYXRpYmxlID0gImFtbG9naWMsZ2VuZXJhbC1kbWEiOworICAgICAgICAgICAgcmVnID0gPDB4
MCAweGZlNDAwMDAwIDB4MCAweDQwMDA+OworICAgICAgICAgICAgaW50ZXJydXB0cyA9IDxHSUNf
U1BJIDM1IElSUV9UWVBFX0VER0VfUklTSU5HPjsKKyAgICAgICAgICAgIGNsb2NrcyA9IDwmY2xr
YyA0NT47CisgICAgICAgICAgICAjZG1hLWNlbGxzID0gPDI+OworICAgICAgICAgICAgZG1hLWNo
YW5uZWxzID0gPDI4PjsKKyAgICAgICAgfTsKKyAgICB9OwoKLS0gCjIuNTIuMAoKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1h
aWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
