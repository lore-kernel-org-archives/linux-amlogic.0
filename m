Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9EF4C624D3
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Sep 2026 12:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KgDjYYWNklJj5qzoFIesicOl16lrEigqpR6ubea+SXk=; b=hjCZ2XlOVtt30h
	vvSOT/+noUayYL7BGrxGJBk7uZ1pnZ99eMvjMtXKByoQMOHRGz+eZN3Y9OVnShZvpu11BNcJgXsjn
	4ej8+KajHMA0ZtEOElkKXOmBc40iJVxVQWknzhUCshH3KBGG9Qe8u2tMaXzdXGJKMPgqs9ppaVAy6
	XbIjvqvR8Za0I1VWt8cW+NFABx5zaplUrQHKbZfh7HPi6ul1X4IRng0Kddi+emaTpdy9tlrKkmqkZ
	apEFSbMDB8YfG7jRFbRwKClPyNp/KxPOw6M1LWCBGpFQEOG8PHMo929RtZnrJ0UpsWzdVqLNlLCUS
	ItGBwshDEIZGKNWHlgLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1kYO-0000000EjmW-41LG;
	Wed, 02 Sep 2026 12:59:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1kYN-0000000EjmJ-2ms2
	for linux-amlogic@lists.infradead.org;
	Wed, 02 Sep 2026 12:58:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 06B3942A39;
	Wed,  2 Sep 2026 12:58:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79B581F000E9;
	Wed,  2 Sep 2026 12:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788353938;
	bh=bE69FJQTzPLfXxv55ESIfZ0SRnSNE0EolT5V9XasIs0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CJAjhQQX5ZrhrgMT1QJ/vEVLzUqd2a1ZbZhoU7wSlYMvbNrw2CBhXA9Ipi09b3Jd4
	 S1DCyrX26cugkaZlgXq0o2pcObur2BSfm2RlWACR+szk+aCGFl0T++wRXXLui1S18g
	 J5U45opVhBeZKW0XSa5OrNjCBHhxDv2ObggctoccRkJmXCZ4a2KB+L056pQ0lbuoH/
	 xqmhsrYCmeOq5s95RCkTSeyaJlkQjOYLW1Ydg12RswYagyihvuzWWllI6kcLQeJ+C4
	 6UaFEKnsi2KSpfR+HgibFr0K9a0rJluW58PYOnd8sI6EBdavYgKZoU+OMq2LXqDTPE
	 Q932keCwOFa/w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 2/6] mfd: khadas-mcu: Use MFD_CELL_* macros for cell
 declarations
To: "Ronald Claveau" <linux-kernel-dev@aliel.fr>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, neil.armstrong@linaro.org, lee@kernel.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20260902-add-mcu-fan-khadas-vim4-v11-2-5f1610d83bf0@aliel.fr>
References: <20260902-add-mcu-fan-khadas-vim4-v11-0-5f1610d83bf0@aliel.fr>
 <20260902-add-mcu-fan-khadas-vim4-v11-2-5f1610d83bf0@aliel.fr>
Date: Wed, 02 Sep 2026 12:58:57 +0000
Message-Id: <20260902125858.79B581F000E9@smtp.kernel.org>
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

PiBGcm9tOiBSb25hbGQgQ2xhdmVhdSA8bGludXgta2VybmVsLWRldkBhbGllbC5mcj4KPiAKPiBD
b252ZXJ0IGtoYWRhc19tY3VfZmFuX2NlbGxzW10gYW5kIGtoYWRhc19tY3VfY2VsbHNbXSB0byB1
c2UgdGhlCj4gTUZEX0NFTExfTkFNRSgpIGhlbHBlciBtYWNybyBpbnN0ZWFkIG9mIG9wZW4tY29k
aW5nIHRoZSBzdHJ1Y3QKPiBtZmRfY2VsbCBpbml0aWFsaXNlcnMuIFdoaWxlIGF0IGl0LCBtYWtl
IGJvdGggYXJyYXlzIGNvbnN0IHNpbmNlCj4gdGhleSBhcmUgbmV2ZXIgbW9kaWZpZWQgYWZ0ZXIg
aW5pdGlhbGlzYXRpb24uCj4gCj4gVGhpcyBpcyBhIHB1cmUgY2xlYW51cCB3aXRoIG5vIGZ1bmN0
aW9uYWwgY2hhbmdlLCBkb25lIGluCj4gcHJlcGFyYXRpb24gZm9yIGEgc3Vic2VxdWVudCBwYXRj
aCB3aGljaCB3aWxsIG5lZWQgdG8gYXR0YWNoCj4gcGxhdGZvcm1fZGF0YSB0byB0aGUgZmFuIGNl
bGwuCj4gCj4gU2lnbmVkLW9mZi1ieTogUm9uYWxkIENsYXZlYXUgPGxpbnV4LWtlcm5lbC1kZXZA
YWxpZWwuZnI+CgpTYXNoaWtvIGhhcyByZXZpZXdlZCB0aGlzIHBhdGNoIGFuZCBmb3VuZCBubyBp
c3N1ZXMuIEl0IGxvb2tzIGdyZWF0IQoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8v
c2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MDkwMi1hZGQtbWN1LWZhbi1raGFkYXMtdmltNC12
MTEtMC01ZjE2MTBkODNiZjBAYWxpZWwuZnI/cGFydD0yCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGlu
dXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
