Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAF1CC44520
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Jul 2026 15:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vsHhuCPixEo55nb3rAvyLoJPYHlfyn56G8H7q9tyHq4=; b=oupwg5tAvMUBkY
	t+nXE5e62kTvjGjmWJpfxRw9z2Bl0DNV3n6gZbJoZoQaLJdqIo15DFLsatfvmEd+yKneAt/kMUUnS
	dW9RZw2z0C9owHLIzrs5hA9t6oV5qnB8ZFh/XIHmdu6YKUq/mydVQwdanbCH7BXtMDA91A0opta2k
	8oGwWWMRJyHHzd9Aewg6ZNiZDaBquyimUZYQlL7UOu28eOAr0WzUcpBRViCSAekjenbICGNkPLtk4
	l/X+XxvXkLGtwW9HJ1E7jCzqxTJhobAnMVKKLDFXIoFobI/XsThKwHbjUdZ0Sy/cGPJlvvHKmvl2W
	fbs1xdSoxy9JeYfx6/Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlpkL-000000079kr-3hvT;
	Mon, 20 Jul 2026 15:17:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlpkK-000000079kI-1ySi
	for linux-amlogic@lists.infradead.org;
	Mon, 20 Jul 2026 15:17:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 009C140E4A;
	Mon, 20 Jul 2026 15:17:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FAB91F000E9;
	Mon, 20 Jul 2026 15:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784560651;
	bh=kQKeHQW5Hf9Oh+OLiAkewPX/VETX7xVtIz2zGnWEnr4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LUIvap2xjB22A3fiIQSiYDrXZ4w7iffoc845FjQ6iph3LceewYmde3Hhh34us3iPp
	 4DUTGKnwOkrXBXUM0poE2p5dF7PC2ISL9koeKovkRVZVDo8vnbQ8WV3aQ5d5tWjXlg
	 004GeVU3M3Ksnd0KX1010+vYhgsTtT+9JI3RWfr6Gv4QB3t5jEXCLqP+9Wy1SwNaHv
	 hxcDj9O22XwszEc1Gw11KPD11y9p3yu8jHSm3x4dd2KL9JnvnhP1K0Xi89RH4IZVcX
	 a4R74z7rui469MbSIIEGZjQ1jqRcZPQSQ+eo+6h7fxPl3UMpcCyDmy2IEJqo4kkZ0p
	 bmUNqVaXP3SIA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 05/16] PCI: dwc: meson: Use cached PCIe capability
 offset
To: "Hans Zhang" <18255117159@163.com>
Cc: linux-pci@vger.kernel.org, neil.armstrong@linaro.org, Frank.Li@kernel.org, linux-amlogic@lists.infradead.org, imx@lists.linux.dev
In-Reply-To: <20260720150619.24733-6-18255117159@163.com>
References: <20260720150619.24733-1-18255117159@163.com>
 <20260720150619.24733-6-18255117159@163.com>
Date: Mon, 20 Jul 2026 15:17:31 +0000
Message-Id: <20260720151731.7FAB91F000E9@smtp.kernel.org>
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

PiBkd19wY2llX2hvc3RfaW5pdCgpIGNhbGxzIHBwLT5vcHMtPmluaXQgKG1lc29uX3BjaWVfaG9z
dF9pbml0KSBiZWZvcmUKPiBjYWNoaW5nIHRoZSBvZmZzZXQuIFRoZXJlZm9yZSwgaW5zaWRlIC5p
bml0IHdlIG11c3QgY2FsbAo+IGR3X3BjaWVfZ2V0X3BjaWVfY2FwKCkgdG8gb2J0YWluIHRoZSBv
ZmZzZXQgKHRoZSBoZWxwZXIgd2lsbCBwZXJmb3JtIHRoZQo+IERCSSByZWFkIGFuZCBjYWNoZSB0
aGUgcmVzdWx0KS4gVGhpcyBpcyBzYWZlIGJlY2F1c2UgdGhlIGhhcmR3YXJlIGlzCj4gYWxyZWFk
eSBlbmFibGVkIGJ5IHRoZSBkcml2ZXIncyBvd24gaW5pdGlhbGl6YXRpb24uCj4gCj4gU2lnbmVk
LW9mZi1ieTogSGFucyBaaGFuZyA8MTgyNTUxMTcxNTlAMTYzLmNvbT4KClNhc2hpa28gaGFzIHJl
dmlld2VkIHRoaXMgcGF0Y2ggYW5kIGZvdW5kIG5vIGlzc3Vlcy4gSXQgbG9va3MgZ3JlYXQhCgot
LSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIw
MjYwNzIwMTUwNjE5LjI0NzMzLTEtMTgyNTUxMTcxNTlAMTYzLmNvbT9wYXJ0PTUKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1h
aWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
