Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BB11C982D6
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Sep 2026 14:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FkDJ+cgoEvUQlkj5KipgWUBFeKaP/7EuhuVjnSPnrI0=; b=LIiZc951aq0QsU
	Ps8XlNspKr9yF9aJVd0eqDuoJX5pO1NWM5dKcTERcI3VuLI986uhxb0YWh+XT7suOQKgDg7mBQaX/
	X3LI4j024JK6RWJ17eglfb/ebvUJuM03oeLzFyHp8SL0iGQotbls5DTe/xVAn0Dpesp4HBUQlJzD+
	A5jtkj9e2cuiwN4JStFwAQxNGSPrj6pe2TVc9/qYMsWVoK2B7QsU0VcPxvm94ESjFMsDU283YIipx
	qEHYE4O2xsJEvCsUjBiSz1Yfa/V432MdmPTctHuP0/XBfykLV4hGru54ZiH+FCReZhCDQZpkdEO83
	0LnfBVIwfySAuneulTUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7DMr-0000000Ba0o-3ERH;
	Thu, 17 Sep 2026 14:45:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7DMq-0000000Ba0f-1sGy;
	Thu, 17 Sep 2026 14:45:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C7B1160211;
	Thu, 17 Sep 2026 14:45:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6AAB1F000FF;
	Thu, 17 Sep 2026 14:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789656339;
	bh=OVMVIJn5nMOZzweOgd1xg0Nt+XzwpkYXftf6T3uN2Vk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hObebb6Njl+aMQPvDaLBuCCz10f6UsKYlR6VnRmPSt9zIhITEsaEoakBRUGLOeg0h
	 aahh3Aw0pt34976yeOqXvdRCaTv7jAjzA91gG65xSs1QWy1czKhHLU2YSV+8hnoZlr
	 bx7jk39pQIsYRsg3DA1cY5asJXsXQLszE0QKEWLc+v9BsMoVm6e2ULcIR5/gsEcDvV
	 +4uafWI+yAm89CZUGw34CZb6ENpxTGFMslcxdlIkcOFlZbYqy1P7hdtL+JI50ktV+N
	 wFq9b3udFP4rqhchqDecNM6FkXwPeSkAPd1fsvyLn8+FRl2o9LF9RFsYn3w3w5kj5T
	 EykWa0yIU6WFQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: Expand flow lists to block lists
To: "Daniel Matyas" <matyasdaniel006@gmail.com>
Cc: vkoul@kernel.org, robh@kernel.org, mfd@lists.linux.dev, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, neil.armstrong@linaro.org, linux-pci@vger.kernel.org, linux-rtc@vger.kernel.org, linux-phy@lists.infradead.org, conor+dt@kernel.org, devicetree@vger.kernel.org, olteanv@gmail.com, linux-watchdog@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-amlogic@lists.infradead.org, lee@kernel.org
In-Reply-To: <20260917144134.459819-1-matyasdaniel006@gmail.com>
References: <20260917144134.459819-1-matyasdaniel006@gmail.com>
Date: Thu, 17 Sep 2026 14:45:38 +0000
Message-Id: <20260917144538.B6AAB1F000FF@smtp.kernel.org>
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

PiBSdW5uaW5nIGR0X2JpbmRpbmdzX2NoZWNrIHJldHVybmVkOgo+IFtlcnJvcl0gc3RyaW5nIHZh
bHVlIGlzIHJlZHVuZGFudGx5IHF1b3RlZCB3aXRoIGFueSBxdW90ZXMgKHF1b3RlZC1zdHJpbmdz
KQo+IAo+IFRoZSBmaWxlcyB1c2VkIHF1b3RhdGlvbiBtYXJrcyBpbiBmbG93IGxpc3RzIGJlY2F1
c2UgdGhlIHN0cmluZ3MgaGFkCj4gY29tbWFzIGFuZCB0aGVzZSBjb21tYXMgd2VyZSBpbnRlcnBy
ZXRlZCBhcyBzZXBhcmF0b3JzLiBDb252ZXJ0IGZsb3cKPiBzdHlsZSBsaXN0cyB0byBibG9jayBz
dHlsZSBsaXN0cywgc28gdGhhdCB0aGVyZSBpcyBubyBwcm9ibGVtcyB3aXRoIHRoZQo+IGNvbW1h
cy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgTWF0eWFzIDxtYXR5YXNkYW5pZWwwMDZAZ21h
aWwuY29tPgoKU2FzaGlrbyBoYXMgcmV2aWV3ZWQgdGhpcyBwYXRjaCBhbmQgZm91bmQgbm8gaXNz
dWVzLiBJdCBsb29rcyBncmVhdCEKCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nh
c2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjA5MTcxNDQxMzQuNDU5ODE5LTEtbWF0eWFzZGFuaWVs
MDA2QGdtYWlsLmNvbT9wYXJ0PTEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1hbWxvZ2ljCg==
