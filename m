Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1724FC624D3
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Sep 2026 13:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z+5ge1MGWv3vuoEAYiBLPd4q5BY1XpyyKAS+/cB+Ag4=; b=oJb/PuaBcX5uaF
	GZ8i99DkZ2Ew+sINmV6s7UZ1YL+P6YCQwLK1ZCjlwiTXbd7QKvd+Vg7alYTb1KO5O7CYzomu60s1N
	2s+dQmRMC1W+muXmLRLzZd5lh4Gc0gnN9a8V8Dx7EbPx5KMBXqKwvN253x//LLKzRjRV4kHFTx2CA
	FaEmyEPlRgbj8UFvtu6etcvzTrY/BgrUnWBz30mIatTAqm2oA4Bn+w/B+Zio460SISpgk1NwAL0w1
	Sv+33oLrcUiR0hyTlwF4YVxjZmJ+3qcHwVWXcfktiweNjNeiLGUpSxZBDstYVVYtpQLUMFywWGyBX
	zJVbCXxiPlRAvJzN9P9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1ke7-0000000Ekeg-1YOz;
	Wed, 02 Sep 2026 13:04:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1ke6-0000000EkeW-2tMa
	for linux-amlogic@lists.infradead.org;
	Wed, 02 Sep 2026 13:04:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 10F4F600C8;
	Wed,  2 Sep 2026 13:04:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5704E1F000E9;
	Wed,  2 Sep 2026 13:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788354293;
	bh=SfiFjKW4NB3xsqpfNjhxbxc1u0zZPGW9rR9kjwTvRSE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Kcfi1KmPcU00yB9ww6OXK71EZVC2a5xPYVSLcAbNaV0X/uCAQV5xGLNtPSaF7d/pP
	 WZ1eiD898oERubrgSaFADY68tuJ4yfPL3mT2lLjKgrOyRIeU8wA3ZNYNsBC09BvNiC
	 3p5MOKZUdVjmGJMS4yusV8jld0YJ0OhcGER3XiuxudQlLpd+nHnKopcfNEbGtMc0M0
	 ITgK2V265UZNnwyE36STB2XUEAANVuKzYKpMJR1pJ6VbVWZ8iov9vdxtG9bmoAzuXT
	 Kq5TwgPkYHElWEX4pWMYaB19utPsirBx6+Z4q7CXKBqfqB56DBiX9qdC1BmaF6zEEt
	 UhCQXsMuAOArg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 3/6] mfd: khadas-mcu: Add support for VIM4 MCU
 variant
To: "Ronald Claveau" <linux-kernel-dev@aliel.fr>
Cc: robh@kernel.org, neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org, mfd@lists.linux.dev, conor+dt@kernel.org, devicetree@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260902-add-mcu-fan-khadas-vim4-v11-3-5f1610d83bf0@aliel.fr>
References: <20260902-add-mcu-fan-khadas-vim4-v11-0-5f1610d83bf0@aliel.fr>
 <20260902-add-mcu-fan-khadas-vim4-v11-3-5f1610d83bf0@aliel.fr>
Date: Wed, 02 Sep 2026 13:04:52 +0000
Message-Id: <20260902130453.5704E1F000E9@smtp.kernel.org>
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

PiBGcm9tOiBSb25hbGQgQ2xhdmVhdSA8bGludXgta2VybmVsLWRldkBhbGllbC5mcj4KPiAKPiBS
ZWZhY3RvciBwcm9iZSgpIHRvIHVzZSBwZXItdmFyaWFudCB2YWx1ZXMKPiBpbnN0ZWFkIG9mIGhh
cmRjb2RlZCBnbG9iYWxzLgo+IAo+IEFkZCBkZWRpY2F0ZWQgcmVnbWFwIGNvbmZpZ3VyYXRpb24g
Zm9yIHRoZSBWSU00IE1DVSwKPiB3aXRoIGl0cyBvd24gdm9sYXRpbGUvd3JpdGVhYmxlIHJlZ2lz
dGVycy4KPiAKPiBJbnRyb2R1Y2Ugc3RydWN0IGtoYWRhc19tY3VfZmFuX3BkYXRhIHRvIHBhc3Mg
dGhlIGZhbgo+IGNvbnRyb2wgcmVnaXN0ZXIgYW5kIGR1dHktY3ljbGUgbGV2ZWxzIHBlciB2YXJp
YW50Lgo+IFZJTTQgdXNlcyBhIGRpZmZlcmVudCByZWdpc3RlciBhbmQgbGV2ZWwgc2V0ICgwLTEw
MCkKPiAgZGVjbGFyZWQgYXMgYSBsaXN0ICgwLCAzMCwgNDAsIDU1LCA3NSwgMTAwKSBjb21wYXJl
ZAo+ICB0byBwcmV2aW91cyBib2FyZHMgKDAtMykuCj4gCj4gQWRkIGEgbmV3IGNvbXBhdGlibGUg
c3RyaW5nICJraGFkYXMsdmltNC1tY3UiLgo+IAo+IFJldmlld2VkLWJ5OiBOZWlsIEFybXN0cm9u
ZyA8bmVpbC5hcm1zdHJvbmdAbGluYXJvLm9yZz4KPiBTaWduZWQtb2ZmLWJ5OiBSb25hbGQgQ2xh
dmVhdSA8bGludXgta2VybmVsLWRldkBhbGllbC5mcj4KClNhc2hpa28gaGFzIHJldmlld2VkIHRo
aXMgcGF0Y2ggYW5kIGZvdW5kIG5vIGlzc3Vlcy4gSXQgbG9va3MgZ3JlYXQhCgotLSAKU2FzaGlr
byBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwOTAyLWFk
ZC1tY3UtZmFuLWtoYWRhcy12aW00LXYxMS0wLTVmMTYxMGQ4M2JmMEBhbGllbC5mcj9wYXJ0PTMK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1h
bWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
