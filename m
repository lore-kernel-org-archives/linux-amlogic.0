Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49D2AC624D3
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Sep 2026 15:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jpChYp9OR8994lBlj8MCixGFM+27rXHRv9E70cL1XJE=; b=Md3FVm2qYDbwMc
	hPm/GnPfIYTU7bDgEE7AfOmfl0DVrR6c0WN9i+dIxpQypUDcp8qyji5VFIwXKn0wkPXcBOtxu8L13
	F7RTzlTFkPH2WzgSYP9nqaBwMl99e+bYxAnFYPfsjQpi5cro2J9yeoEth9fs05++ecIikXS+pXH43
	H8Vl7DQ4utSJt4SIvMZx8X2CHDQ2j3Wdzb8ECZUvyD9Ix7zGvS4jB5LNfqEGGNC/ZFXrT3upmVcpZ
	gRBnapVWpgtVVcAWHrb9eya+B2Nm+ihlcmhpOJhmvpCmSXO47gj1bEo1Q7U+m2KPhO1b2Jg09d+0C
	9ICX1zRGNprZNM7Pa4cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1QVX-0000000CWMc-2g9D;
	Tue, 01 Sep 2026 15:34:43 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1QVW-0000000CWLz-30jI
	for linux-amlogic@lists.infradead.org;
	Tue, 01 Sep 2026 15:34:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 099EC60261;
	Tue,  1 Sep 2026 15:34:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F2101F000E9;
	Tue,  1 Sep 2026 15:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788276881;
	bh=iJ+X2jSfLlD/ClAEOY3xrAUCGD2t34NBFIzm+jq0Nyo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IMu4k073jbHpChZuOafZlgvz3hmj6Qvfl+DMbHTIL5Wri3IiBh0eTb/5xno/k0QY9
	 SNxAOuQuJr28w5TyD2CTmd0UVjj6vGzEJad1fwGZHS19T0bEEoG2sij8ITgot6MebM
	 Qgx3bNVhGI6CKjcKURRdzSwsyuDjw758q0P7yT88nw8SU8a1GjjtvLknUNdY4mB6zD
	 5OjfUdR0c3KI6vm6b/sxY0xGT36VbPTln4cmpl41wOMYbCXOXyP0BZUmHfVZRGKCoN
	 L2qgqXYOQCm+SBC2OBabPhUmT7fk7Rw93oK+q7HfHA33VHHshMcXE84oa/lQEZc0rl
	 EA9Vm3mSdV7IQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 6/6] arm64: dts: amlogic: t7: khadas-vim4: Add i2c
 MCU fan node
To: "Ronald Claveau" <linux-kernel-dev@aliel.fr>
Cc: mfd@lists.linux.dev, linux-amlogic@lists.infradead.org, lee@kernel.org, neil.armstrong@linaro.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260901-add-mcu-fan-khadas-vim4-v10-6-aecdb9955a30@aliel.fr>
References: <20260901-add-mcu-fan-khadas-vim4-v10-0-aecdb9955a30@aliel.fr>
 <20260901-add-mcu-fan-khadas-vim4-v10-6-aecdb9955a30@aliel.fr>
Date: Tue, 01 Sep 2026 15:34:40 +0000
Message-Id: <20260901153441.3F2101F000E9@smtp.kernel.org>
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

PiBGcm9tOiBSb25hbGQgQ2xhdmVhdSA8bGludXgta2VybmVsLWRldkBhbGllbC5mcj4KPiAKPiBF
bmFibGUgYW5kIGNvbmZpZ3VyZSBpMmMgTUNVIG5vZGUgdG8gZ2V0IGZhbiB3b3JraW5nIG9uIEto
YWRhcyBWSU00Lgo+IAo+IFJldmlld2VkLWJ5OiBOZWlsIEFybXN0cm9uZyA8bmVpbC5hcm1zdHJv
bmdAbGluYXJvLm9yZz4KPiBSZXZpZXdlZC1ieTogTWFydGluIEJsdW1lbnN0aW5nbCA8bWFydGlu
LmJsdW1lbnN0aW5nbEBnb29nbGVtYWlsLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBSb25hbGQgQ2xh
dmVhdSA8bGludXgta2VybmVsLWRldkBhbGllbC5mcj4KClNhc2hpa28gaGFzIHJldmlld2VkIHRo
aXMgcGF0Y2ggYW5kIGZvdW5kIG5vIGlzc3Vlcy4gSXQgbG9va3MgZ3JlYXQhCgotLSAKU2FzaGlr
byBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwOTAxLWFk
ZC1tY3UtZmFuLWtoYWRhcy12aW00LXYxMC0wLWFlY2RiOTk1NWEzMEBhbGllbC5mcj9wYXJ0PTYK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1h
bWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
