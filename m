Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A97CC982C1
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Sep 2026 08:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fg3zqdmFbiHKT3c4h30/ZAUdo5Q0XLiKrbCbNfS4TlQ=; b=4HkgMSBRtsAVHM
	p/TXnyEmnaUdI1eQK9pvQi4jPWEKRSGkbJPbvRVaAqmW9lItpww0KPkpmPPWkyczwy3Plv7US/Uai
	TpL3GMPT7TJinX/tRCBkC94QMYX6GpEO2YpIiDz7N3Oh4xpfijYydbqzF55hEwkgxwJQPPMuXAJzZ
	qRBEp/28Hf85YWz829YIO5IhVtrR4REAh5erwb4OqRIfiBFerMMJogj3G6KgqTm/DhVNoDwOtyH2/
	7XNlW5YWy33T7f0WI/Ad2kB/pEIApubvWTIEVZ2IwXaqQpSm7bMoBKQ9urTvWJaeUmQPvpWmW18nL
	E9YVnNPM4goVds6Hna2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x775F-0000000AqDf-23lZ;
	Thu, 17 Sep 2026 08:03:05 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x775E-0000000AqCk-0MIu
	for linux-amlogic@lists.infradead.org;
	Thu, 17 Sep 2026 08:03:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 40F9A600D4;
	Thu, 17 Sep 2026 08:03:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CE8B1F000FF;
	Thu, 17 Sep 2026 08:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789632183;
	bh=ZlFX6GelQIinsFXpTfI6KjNrtNTvj73kGqZgHZK3U3w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=X2LkboOwwYh5GahcClbDH57vrPTfotCR90jFKUL5rxBNZuxHtrQGCx3H7sLmVvYZh
	 tASnR57Ypl96IVWgWzpARo+aw7xKa6EqlBE0jMxNunGCCIcLSBXtAOTu89u55DrHJc
	 ys7aP71B4GgiXGIsL9tve706aBNcllGl1MpOXTGmiaRlVe+SQ0TKNAZ8XLyGiBCS6Q
	 G+peCueFqTSvqYEHbJHNtadFxeZffh8i5FJEttN858K/ZE8xot7aPF36SgcDhPvJ4V
	 +1EBERwvq8qkPpe7S+kTR36IkiY5+FUdjBBznfzhlAwQDkiEMA5yih2ukZQ0oyfN1T
	 rK+utb531tIog==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 5/6] arm64: dts: amlogic: t7: Add i2c controller
 node
To: "Ronald Claveau" <linux-kernel-dev@aliel.fr>
Cc: devicetree@vger.kernel.org, mfd@lists.linux.dev, robh@kernel.org, lee@kernel.org, neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org, conor+dt@kernel.org
In-Reply-To: <20260917-add-mcu-fan-khadas-vim4-v12-5-497cd543a148@aliel.fr>
References: <20260917-add-mcu-fan-khadas-vim4-v12-0-497cd543a148@aliel.fr>
 <20260917-add-mcu-fan-khadas-vim4-v12-5-497cd543a148@aliel.fr>
Date: Thu, 17 Sep 2026 08:03:01 +0000
Message-Id: <20260917080302.7CE8B1F000FF@smtp.kernel.org>
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

PiBGcm9tOiBSb25hbGQgQ2xhdmVhdSA8bGludXgta2VybmVsLWRldkBhbGllbC5mcj4KPiAKPiBB
ZGQgdGhlIFQ3IGkyYyBjb250cm9sbGVyIG5vZGUgdXNlZCBieSB0aGUgS2hhZGFzIFZJTTQKPiBm
b3IgTUNVIGNvbW11bmljYXRpb24uCj4gCj4gVXNlIGFtbG9naWMsbWVzb24tYXhnLWkyYyBhcyBm
YWxsYmFjayBjb21wYXRpYmxlLgo+IAo+IFJldmlld2VkLWJ5OiBOZWlsIEFybXN0cm9uZyA8bmVp
bC5hcm1zdHJvbmdAbGluYXJvLm9yZz4KPiBSZXZpZXdlZC1ieTogTWFydGluIEJsdW1lbnN0aW5n
bCA8bWFydGluLmJsdW1lbnN0aW5nbEBnb29nbGVtYWlsLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBS
b25hbGQgQ2xhdmVhdSA8bGludXgta2VybmVsLWRldkBhbGllbC5mcj4KClNhc2hpa28gaGFzIHJl
dmlld2VkIHRoaXMgcGF0Y2ggYW5kIGZvdW5kIG5vIGlzc3Vlcy4gSXQgbG9va3MgZ3JlYXQhCgot
LSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIw
MjYwOTE3LWFkZC1tY3UtZmFuLWtoYWRhcy12aW00LXYxMi0wLTQ5N2NkNTQzYTE0OEBhbGllbC5m
cj9wYXJ0PTUKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1h
bWxvZ2ljCg==
