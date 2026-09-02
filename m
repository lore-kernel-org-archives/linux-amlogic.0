Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F24B5C624D3
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Sep 2026 13:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hj1+4eOi0T1rDqOo7M2uTRwYXM27Wpu/ophGJXmuIC0=; b=To6qkTmfX5IfRm
	ALwJGJtrvb3HuTluPJJ7t+8viwgGesZXMGKB7d6pYd/jCIjMyMi0K21ZcSIc00PMi50mgQ6r+IpkK
	9Jjq7vAHG87PA/igVCmrBULIeHH9ZSWA780QnXrDpJtyV5oLWgmjaaMgOCi0wzpxNexzLKocu1803
	rs8RcsnIePn97AwtoiDwrq0JRvM1O27fcYdVvVJX++vJurMqmY1pNyQfIJzDPndiNbwvUcxd0GmcY
	igf12qaQu4tQDS7Y+rybc/yUSJcfJnjJVC45mfKcIZm4DY+WDonGFGfuvP9fBgTz013yesUhynnNr
	KKHvwXqnOgF34e68zppw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1keN-0000000EkiC-256u;
	Wed, 02 Sep 2026 13:05:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1keM-0000000Eki0-2GnB
	for linux-amlogic@lists.infradead.org;
	Wed, 02 Sep 2026 13:05:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E7FD743BD4;
	Wed,  2 Sep 2026 13:05:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C5101F00A3F;
	Wed,  2 Sep 2026 13:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788354309;
	bh=XnZBeqh8wjBA1/H4GR0P0qnl2Yr1HAJOLP5tsxUluQ8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HtMxO0HVFs53aczgZ4/4fkqADCawKn7YReX2pp8d19/R0vae4XtIRkGnV932nRMxV
	 2nhSh2WArNny6TQeNBif2JJuuPTHzzDKhq3dTIA7Vg+mOJNXlof08Ok+1ira5iUHqE
	 5hXCebM2AAfMASoA45jKXx6D8cMc3FwZCupcG/uodjeOQQ4pBJ3vu2UDkI1yGpxth+
	 311cTnAHnl/7ePyHLUszATgrfSjC7xhZhvY/iUlb+W4XFblgainDkuZjuQ82PpT88t
	 ps7HLFgPONjPq4EIE8sF776b8o2LJ+fDu9iqBwGc211jxjiWZ+1sW7gwBH8wZJC6GL
	 u8YTeyy24us/A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 5/6] arm64: dts: amlogic: t7: Add i2c controller
 node
To: "Ronald Claveau" <linux-kernel-dev@aliel.fr>
Cc: conor+dt@kernel.org, mfd@lists.linux.dev, linux-amlogic@lists.infradead.org, lee@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20260902-add-mcu-fan-khadas-vim4-v11-5-5f1610d83bf0@aliel.fr>
References: <20260902-add-mcu-fan-khadas-vim4-v11-0-5f1610d83bf0@aliel.fr>
 <20260902-add-mcu-fan-khadas-vim4-v11-5-5f1610d83bf0@aliel.fr>
Date: Wed, 02 Sep 2026 13:05:08 +0000
Message-Id: <20260902130509.5C5101F00A3F@smtp.kernel.org>
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
MjYwOTAyLWFkZC1tY3UtZmFuLWtoYWRhcy12aW00LXYxMS0wLTVmMTYxMGQ4M2JmMEBhbGllbC5m
cj9wYXJ0PTUKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1h
bWxvZ2ljCg==
