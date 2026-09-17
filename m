Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EDD6C982D0
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Sep 2026 08:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XCnZcHOov+OXiFmfDgRolZ9MWS/HZ79SIERUlm/gwas=; b=siOTht1Ow8SOtG
	upOUpMi0+kizp6T51Rf64PKjQwzFyCP+Kxi/RuMlqVAwVIKxhZ1rQqiSuVOTvHQoh/9kT2Gre+RxH
	QEj6SKpyjB1vFbbPmDt2hLr+MyAGzDNoIyPfMmKSX/HqTWbO3Pyw8U+hLBl6qXbaMeeg5mcIXPsfK
	AFAsmMqnDOKLfnW+cLLDrdi8RlodHbZ1FcpDn9NiPSkZeox3kv2Mc+DTJucvUgW8jGy4dkg+ZoXXh
	QuLllFyxa8i8oMMBf+VPl3Y3By1kO65G7ThAZ6jtrxsfA6M9svqzFzJyd/HeRIRX7AOsMCcpoVpqK
	0RgTBuTwgsAa1pkBx4Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x77AD-0000000AqvF-2Nx6;
	Thu, 17 Sep 2026 08:08:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x77AC-0000000Aqv9-1ayx
	for linux-amlogic@lists.infradead.org;
	Thu, 17 Sep 2026 08:08:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 27D3541A8C;
	Thu, 17 Sep 2026 08:08:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EC981F000FF;
	Thu, 17 Sep 2026 08:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789632492;
	bh=wFl8cOBOThylEyLf927ohFdSpr+rudS5mT01A0J9STg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TVDcknN36SgLs8i01Y9CMgL+V45CMxPpl3+Nc4J4pVJr8fke63ta5N5H9MMKTKSTW
	 iimMlQwDp4vWOLMe/d2FO/3mlo7tTk2E1Ll4AlbsJbZOAAXnbhQA3hXs1L1AWel1tm
	 y/8sPcjnTRbPummVjEJ9rxT8WkM8QaGlPwtX0qjp80On9ON7R02Zn2S0VFGHgOxFkX
	 Lr6wxGvNEXtArhnUBKm5KupLW4ErigTxU5pa2GXO+vrFsDTolwwqO7BDuIhGHattwC
	 i8lNUuReUYxPLJCu6DnxVKtyEUJ0sDxBNrI779r8V0N3xyIEyXKM4sJnyUw475MLiT
	 vKlvHZ+aYb62A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 6/6] arm64: dts: amlogic: t7: khadas-vim4: Add i2c
 MCU fan node
To: "Ronald Claveau" <linux-kernel-dev@aliel.fr>
Cc: linux-amlogic@lists.infradead.org, robh@kernel.org, mfd@lists.linux.dev, lee@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20260917-add-mcu-fan-khadas-vim4-v12-6-497cd543a148@aliel.fr>
References: <20260917-add-mcu-fan-khadas-vim4-v12-0-497cd543a148@aliel.fr>
 <20260917-add-mcu-fan-khadas-vim4-v12-6-497cd543a148@aliel.fr>
Date: Thu, 17 Sep 2026 08:08:11 +0000
Message-Id: <20260917080811.8EC981F000FF@smtp.kernel.org>
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
byBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwOTE3LWFk
ZC1tY3UtZmFuLWtoYWRhcy12aW00LXYxMi0wLTQ5N2NkNTQzYTE0OEBhbGllbC5mcj9wYXJ0PTYK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1h
bWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
