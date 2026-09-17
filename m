Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EEFFC982C1
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Sep 2026 08:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8Q7M2+F1moBZuf51qgO0ks//ao37/F4G/DoJerehH4U=; b=fBBIIQEOiXNUDt
	k0Xx0b7Eoxmwj29lTTU4FHRB15UrznBuJG4wEsYIdMPv5KuprdoXu1vb02OAVZxwdXGKbbl3LPqW7
	0M2fvJg3j8vm8zZTtue7LJcOmSnb3Z43cczGJBDpE23Ibu+WvphBkB3Ogp3M8V6Bk5SfR5/RSvAIY
	0IGSCTeIaHXS2sHm/f1X/EVfxOSnaXGqYM9CC9XU5roBSC7EgAOMGu95vXVtLDMmTj0eQIKfiP82k
	f7CivsieNXJvygZz7DI3klpK7YOnTMNV+Fa+PtRmXp6g/lWN0iz29wTHsgsrIAIPruq64SI6t8ARJ
	oCESUJnBWz751qrMix5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x778U-0000000Aqf7-0acO;
	Thu, 17 Sep 2026 08:06:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x778T-0000000Aqf1-385c
	for linux-amlogic@lists.infradead.org;
	Thu, 17 Sep 2026 08:06:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2919B414AC;
	Thu, 17 Sep 2026 08:06:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A4941F000FF;
	Thu, 17 Sep 2026 08:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789632385;
	bh=8Gz1O6bHK+/l82isF+y+AHNB5tc3EmVfPqm7/H+Yw3o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IF4neACBWwrNk+ePNZLETHyxTyuUnMkvG+G6qraDKU8w+91rG8M+ZXkfD4LVAFq/+
	 yWt2MG6oW0HHGHkhSiF9ZlmfqlT3iukHkYyzFeJz2w/a6JEgl2pn/rrAwU0KNAR5tA
	 V0yB2nnm7R/RtS0A0uT6WayAYA4/iUNR4LGH0TR9vj+uBhl//n+jMutVWMR/HO+vBB
	 TjQydHBxxkpFhnm22B0yWFGN2QwW3NkxnZ5EtoM4+q+/oepTkU3AMZ2woeApaLU3hb
	 EQh+pF7UsnjPczZIhBa8cjzNW6HBSO8l0MBeYZx4vYTxuqU9HQ0ZzGfHKalIp8wpNU
	 jp4kKrBwtbwPw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 1/6] mfd: khadas-mcu: Add per-variant configuration
 infrastructure and VIM4 support
To: "Ronald Claveau" <linux-kernel-dev@aliel.fr>
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, conor+dt@kernel.org, robh@kernel.org, lee@kernel.org, mfd@lists.linux.dev, neil.armstrong@linaro.org
In-Reply-To: <20260917-add-mcu-fan-khadas-vim4-v12-1-497cd543a148@aliel.fr>
References: <20260917-add-mcu-fan-khadas-vim4-v12-0-497cd543a148@aliel.fr>
 <20260917-add-mcu-fan-khadas-vim4-v12-1-497cd543a148@aliel.fr>
Date: Thu, 17 Sep 2026 08:06:24 +0000
Message-Id: <20260917080624.9A4941F000FF@smtp.kernel.org>
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

PiBGcm9tOiBSb25hbGQgQ2xhdmVhdSA8bGludXgta2VybmVsLWRldkBhbGllbC5mcj4KPiAKPiBT
b21lIHZhbHVlcyBjaGFuZ2UgcGVyIHZhcmlhbnQsIGFkZCB0aGUgc3RydWN0dXJlIHRvIG1hbmFn
ZSBpdC4KPiAKPiBBZGQgVklNNCBzcGVjaWZpYyByZWdpc3RlcnMgZG9uZSBmb3IgYSBzdWJzZXF1
ZW50IHBhdGNoLCB3aGljaCB3aWxsIHVzZSBhCj4gbmV3IGNvbXBhdGlibGUgZXNwZWNpYWxseSB0
byBnZXQgdGhlIHJpZ2h0IHJlZ21hcCBjb25maWcuCj4gCj4gQWRkIGFuIGVudW0ga2hhZGFzX21j
dV90eXBlIHVzZWQgYXMgdmFsdWUgdG8gbWF0Y2guCj4gCj4gQWxzbyBmaXggYSBrZXJuZWwtZG9j
IHdhcm5pbmcgZm9yIHRoZSBraGFkYXNfbWN1IHN0cnVjdC4KPiAKPiBSZXZpZXdlZC1ieTogTmVp
bCBBcm1zdHJvbmcgPG5laWwuYXJtc3Ryb25nQGxpbmFyby5vcmc+Cj4gU2lnbmVkLW9mZi1ieTog
Um9uYWxkIENsYXZlYXUgPGxpbnV4LWtlcm5lbC1kZXZAYWxpZWwuZnI+CgpTYXNoaWtvIGhhcyBy
ZXZpZXdlZCB0aGlzIHBhdGNoIGFuZCBmb3VuZCBubyBpc3N1ZXMuIEl0IGxvb2tzIGdyZWF0IQoK
LS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8y
MDI2MDkxNy1hZGQtbWN1LWZhbi1raGFkYXMtdmltNC12MTItMC00OTdjZDU0M2ExNDhAYWxpZWwu
ZnI/cGFydD0xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
YW1sb2dpYwo=
