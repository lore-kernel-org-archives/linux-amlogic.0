Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41A0AC88E4D
	for <linux-amlogic@archiver.kernel.org>; Fri, 11 Sep 2026 16:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EUFkN3uYocgkytmX9a//ItX5Sn66i8//e75HMkf0kxA=; b=HYxGy/9dTmMZbz
	RkptBeN1OIln50AUpIitFUEuRkm/kj0KpY33P4Nkk90CX6xJHDqrDvsDWJcAv8swKR2nK8x7HFiJ6
	JUIhbVIUxLRLf9HqJO/qb5YOD4Km8JcoD2GRlxpPQhJAClCbcQEfHGO6wFsCyidHtXXOvUd/d0mtc
	YLybziH4aoHHFoOh8wLxpcgP/yKVFY4ib7PM/a2wqm0gW++vdNbmCtQ74o1snDBtQqxUnGwQwsbmh
	2vnEjLEPLdiFIgmSZV5OXm0M3u720/fGv2NxvfNM048xCZbobW24zUd8Qpq1BBHm9BPZ7B1SMOomi
	wtMrw7/mB1HwknwN2R5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x547k-0000000HDvs-0zMf;
	Fri, 11 Sep 2026 16:29:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x547i-0000000HDvX-3AW2
	for linux-amlogic@lists.infradead.org;
	Fri, 11 Sep 2026 16:29:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 25B3940711;
	Fri, 11 Sep 2026 16:29:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD28E1F000FF;
	Fri, 11 Sep 2026 16:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789144150;
	bh=5QQfCVr5sAbq3BQySpY68Q7+FGcwKUaHgftfuUIc+mQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=noGNArv94Zi7YUWh3EbR65wQokHZFHPNzIo3kekZ20AXWx6iPuo2PS4XpxOwft6Tp
	 4b+U2KerwKcJQTCF2DJC990LllIuzLGxt7k2VrKzdvrcVcnUcBw0R4WKKK8fA5QK/l
	 JXx+TDelzVc/UqDw/Ngozs0blZ6UqeiOX9o5n2F+ha1N1O4v4fda6t6pfADmYCpRsD
	 7U18A5N1l03VZqMpGOdtqjW06WSXUJSeuQfligp8St+0Z0ogz1aCy0oPSwVwIQEUgo
	 8eQPOSeoz20bau/aEf8OsNDbPuQs5hoRDBrSOT04c2AiKvrSWvK2Oj0LATTJlPCfF+
	 8+8DNfKLF7WOw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] PCI: dwc: Remove unused PCIE_ATU_UNR_* register
 definitions
To: "Hans Zhang" <18255117159@163.com>
Cc: linux-amlogic@lists.infradead.org, linux-pci@vger.kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20260911162537.469018-3-18255117159@163.com>
References: <20260911162537.469018-1-18255117159@163.com>
 <20260911162537.469018-3-18255117159@163.com>
Date: Fri, 11 Sep 2026 16:29:09 +0000
Message-Id: <20260911162909.BD28E1F000FF@smtp.kernel.org>
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

PiBUaGUgUENJRV9BVFVfVU5SXyogbWFjcm9zIGFyZSBub3QgdXNlZCBhbnl3aGVyZSBpbiB0aGUg
a2VybmVsLiAgVGhleQo+IHdlcmUgcHJlc3VtYWJseSBpbnRlbmRlZCBmb3IgdW5yb2xsZWQgaUFU
VSByZWdpc3RlciBhY2Nlc3MsIGJ1dCB0aGUKPiBkcml2ZXIgbm93IHVzZXMgdGhlIEFUVV8qIG1h
Y3JvcyBhbmQgY29tcHV0ZXMgdW5yb2xsZWQgb2Zmc2V0cyB2aWEKPiBBVFVfVU5ST0xMX0JBU0Uo
KS4KPiAKPiBSZW1vdmUgdGhlc2UgdW51c2VkIGRlZmluaXRpb25zLiBObyBmdW5jdGlvbmFsIGNo
YW5nZSBpbnRlbmRlZC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBIYW5zIFpoYW5nIDwxODI1NTExNzE1
OUAxNjMuY29tPgoKU2FzaGlrbyBoYXMgcmV2aWV3ZWQgdGhpcyBwYXRjaCBhbmQgZm91bmQgbm8g
aXNzdWVzLiBJdCBsb29rcyBncmVhdCEKCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczov
L3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjA5MTExNjI1MzcuNDY5MDE4LTEtMTgyNTUxMTcx
NTlAMTYzLmNvbT9wYXJ0PTIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1hbWxvZ2ljCg==
