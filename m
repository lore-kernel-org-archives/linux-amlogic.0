Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00FECC44515
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Jul 2026 15:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=deygNkA9aI4pJhk7yYLrKlBwidpSZq37RxJ8UYAVUcE=; b=WosM/3myafKqO/
	bUYw7a3VPQpRSEQ3cz19o5eJ4r4XK2X596STSiKIhX1l7Z/jNU4ol6X2xMae93/Dv87tcW9p3clJt
	LXJA6/wk84FJiYMzct2oZApxeG9UqXK6pwyrrfgoQ/1nV0EA4TuIYYzqJTv31TXZuhPT7BQ8bxgJ4
	3VI0JriG93zKS6HlicTJkZBDU8F/dIDVnZsqoDhSVQSncA84jPCfQrQHX9WcUUBBqYEXbZ0q+8nAA
	WzCV8s7QzQJomlrEMrqOrePx4Xk/P8B3+rc7YwezbBCovOdBj3zmDhHhShYgetYL1ln0mBPRkzZ1n
	WJpqg88Rnf1hg8rAz6Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlpiG-000000079LJ-1kmI;
	Mon, 20 Jul 2026 15:15:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlpiF-000000079Kv-23fu
	for linux-amlogic@lists.infradead.org;
	Mon, 20 Jul 2026 15:15:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E3EF060103;
	Mon, 20 Jul 2026 15:15:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41A771F00A3A;
	Mon, 20 Jul 2026 15:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784560522;
	bh=LmmogiEufKhvOJytSyIQ3GRxByxn/QocdEFTi8HuwOQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KjPjJnv56gh/l1/GiWw/gRoU+WmWj89hGbhKMXL0WS3zzEEkKBAmE/Kzh9Qlzwt6Z
	 DWTyNQyQ5IagNHTZQ7Ebapg/LXrbCMH//x6CMtx2K2zeMAS+vAJK6WeJCDjeWCV1iO
	 u/617YOjQzGixGEfmoHCT9WgtKac7Xu4aqIir3Dtt2pIn816AE0tdX9HnO8UqjvFD3
	 ulKFRhV1WMxU1kWEsz+A9p53XWLZStP4Gfg/yXOiqcM4G7ZxPOUmYX2FL3OBOKTR0d
	 7u3AIKb4on3b9WzGMLB1KDqqva84PCfSBPJcaheC+uCxWWrqxBF84l+GbIUj1MXOtt
	 8i7CJ+BchPhXA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 07/16] PCI: dwc: eswin: Use cached PCIe capability
 offset
To: "Hans Zhang" <18255117159@163.com>
Cc: imx@lists.linux.dev, linux-pci@vger.kernel.org, neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org, Frank.Li@kernel.org
In-Reply-To: <20260720150619.24733-8-18255117159@163.com>
References: <20260720150619.24733-1-18255117159@163.com>
 <20260720150619.24733-8-18255117159@163.com>
Date: Mon, 20 Jul 2026 15:15:21 +0000
Message-Id: <20260720151522.41A771F00A3A@smtp.kernel.org>
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

PiBUaGlzIGZ1bmN0aW9uIGlzIGNhbGxlZCBhZnRlciBkd19wY2llX2hvc3RfaW5pdCgpIGhhcyBh
bHJlYWR5IGNhY2hlZCB0aGUKPiBvZmZzZXQgKGR3X3BjaWVfbGlua191cCgpIGlzIGNhbGxlZCBh
ZnRlciAuaW5pdCBhbmQgYWZ0ZXIgY2FjaGluZykuCj4gVGhlcmVmb3JlLCB3ZSBjYW4gZGlyZWN0
bHkgdXNlIHBjaS0+cGNpZV9jYXAuCj4gCj4gU2lnbmVkLW9mZi1ieTogSGFucyBaaGFuZyA8MTgy
NTUxMTcxNTlAMTYzLmNvbT4KClNhc2hpa28gaGFzIHJldmlld2VkIHRoaXMgcGF0Y2ggYW5kIGZv
dW5kIG5vIGlzc3Vlcy4gSXQgbG9va3MgZ3JlYXQhCgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcg
aHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwNzIwMTUwNjE5LjI0NzMzLTEtMTgy
NTUxMTcxNTlAMTYzLmNvbT9wYXJ0PTcKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2lj
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1hbWxvZ2ljCg==
