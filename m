Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0B95C624D5
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Sep 2026 15:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jwh2fkmJYRg2msZi+6OvDi8nXGV57K4SUUY999tdAkA=; b=2J22srOVhARwJ5
	/9VVf7t1rnhCPGY8njw3g0mlSyJVwSKDLmAdlEMWmwpdtGjNmwNt436Y9stCyhiGiyKbrOSaO6zWs
	xBzdm0IVC4ixFL6u6ugIumilayHWim6v6uqzaLuJPkZ2RLv0an8DUizgF7XmBIduXZDaM6GuO5x5Q
	+KxTwG1xjgkBWEdGNZz0Li/2YwAvuUtIsNCAe9h0dWA/Q67HYmAFS3lSsfuoSVJiM/4/Hnj+GbtSD
	D1YOmZ2VDnW01KNBVDi10E1hPAayP2LXi2mkxcdQxwhU3UUXaLZu6TdC6W8O+9eif5gPK8LcJPUF9
	fj1D6Nan8kgqEurtvsSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1QUo-0000000CW4M-1uGy;
	Tue, 01 Sep 2026 15:33:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1QUn-0000000CW3L-187R
	for linux-amlogic@lists.infradead.org;
	Tue, 01 Sep 2026 15:33:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7E11E6022D;
	Tue,  1 Sep 2026 15:33:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD8B01F000E9;
	Tue,  1 Sep 2026 15:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788276835;
	bh=JXKGohViUF6CBZb6/o/ALtWvXJOIGt3FsEZFS1VSQ+k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=izxxYCdQQ+gRei94a6oDoDurf6AH3Fs4wNT0uFAJ8v4P3oi+ik3HUDmFUVS8III24
	 zSff/m/B2LLN4VmzdGnL/jwdYinmXtcNbY/7XK9SbZjZMARr2C2uJrHGR74aVZ95rf
	 hp0n4Y8O3jnCSW4xcZ7x+N+N+7K9H1CPmnw7JUDVFTp9/Zlx1md9ZpMmwjOuU1SRlV
	 kx6ajE+XIA52dOfMTgtixbveO9E3GbCBKBTWfrrYzKl8KXs+bvbbuiHxZ73eNOIzjo
	 d0+wsgk/0NjrrGqTnlSAuy1MrYfP4d5vkLckKy9a7BzNim5zImO/8H//rbvRipJ+5V
	 wLbbrLKLHqhnA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 3/6] mfd: khadas-mcu: Add support for VIM4 MCU
 variant
To: "Ronald Claveau" <linux-kernel-dev@aliel.fr>
Cc: linux-amlogic@lists.infradead.org, lee@kernel.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org, mfd@lists.linux.dev
In-Reply-To: <20260901-add-mcu-fan-khadas-vim4-v10-3-aecdb9955a30@aliel.fr>
References: <20260901-add-mcu-fan-khadas-vim4-v10-0-aecdb9955a30@aliel.fr>
 <20260901-add-mcu-fan-khadas-vim4-v10-3-aecdb9955a30@aliel.fr>
Date: Tue, 01 Sep 2026 15:33:54 +0000
Message-Id: <20260901153354.BD8B01F000E9@smtp.kernel.org>
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
byBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwOTAxLWFk
ZC1tY3UtZmFuLWtoYWRhcy12aW00LXYxMC0wLWFlY2RiOTk1NWEzMEBhbGllbC5mcj9wYXJ0PTMK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1h
bWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
