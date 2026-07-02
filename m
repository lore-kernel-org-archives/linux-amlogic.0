Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B30ADC43458
	for <linux-amlogic@archiver.kernel.org>; Thu,  2 Jul 2026 15:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rIqD6MsR+qqB7H6BkAmMoCN8V0FnW+6M8UNcCs1BTYs=; b=yEows8OKBrS5oA
	Qlfv+bmFYi57VWGeoNMwR/omu2Jsd8Vdd6ey7gyJ14U1MBGiAH8RM3eJfAJ7BpenMHYEe2NQizvsu
	kpaWo8lm6iNoJSdqwVvZ/nAZiUWJTag4HkaKlo0IeKTwMZ5oZKRCJln7Zr7TpidPQM+m4lbA9zymw
	98udFgOQkQD3bqI90K04nxxFax2Tod0WE1NiEFXRtQf1n3bkMN0q4BYg/hHVEMAMwcLtkojM2pX1a
	BtsLciYdMBWF9eDzl+Z2D+HxZX1Q1ymzVVGeI07JKFFUaics4/v4fVKeY3eWIn3AASpWN/ZlXhQJO
	GDxfqsH6xgV1OV6ragVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJkq-00000004t63-2Y3I;
	Thu, 02 Jul 2026 15:55:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJkp-00000004t5l-0qFP
	for linux-amlogic@lists.infradead.org;
	Thu, 02 Jul 2026 15:55:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F04C043F01;
	Thu,  2 Jul 2026 15:55:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61EB61F000E9;
	Thu,  2 Jul 2026 15:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783007706;
	bh=JeAFfreswiIRNdsHzJu8ZaO8Dqg3y5cjgk4NSRHdnHM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ERuoE0HOa1K337emAcjfr6fEMFzBveFxYblQj9JtkXhRhIEibmhjnkf+8zrYlRbST
	 mdl1qGH2jRHd/3SbHPPUliy8InrbI1zDE73gHjEYQZo+PpSHKAURqbhTwHG4xr83AK
	 vTIzktfRyiCd4VAb4dspDWCMerBUY7LulFAs1J6YAgnWeYt0BsY+KM/V5T4bp2bXDN
	 CpRtJj6HEKarL7z5862Jzz9zna1TD5H641Wn+ZVxvASACQceuUqJXNrqSqhCKnNoh+
	 JiJaI4pl3tMZeF+T02C37JR7iLB7ynCQcgfv4ABRqrwyKRl2RPxpTBkygCA3H8udAl
	 z6baFg0JuVgSQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 05/11] devfreq: Use sysfs_emit() for cpumask show
 callbacks
To: "Yury Norov" <ynorov@nvidia.com>
Cc: linux-pci@vger.kernel.org, linux-cxl@vger.kernel.org, Frank.Li@kernel.org, neil.armstrong@linaro.org, linux-perf-users@vger.kernel.org, linux-amlogic@lists.infradead.org, imx@lists.linux.dev
In-Reply-To: <20260702154725.185376-6-ynorov@nvidia.com>
References: <20260702154725.185376-1-ynorov@nvidia.com>
 <20260702154725.185376-6-ynorov@nvidia.com>
Date: Thu, 02 Jul 2026 15:55:05 +0000
Message-Id: <20260702155506.61EB61F000E9@smtp.kernel.org>
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

PiBUaGVzZSBjYWxsYmFja3MgYXJlIHN5c2ZzIHNob3cgcGF0aHMuIFVzZSBzeXNmc19lbWl0KCkg
YW5kCj4gY3B1bWFza19wcl9hcmdzKCkgdG8gZW1pdCB0aGUgbWFza3MuCj4gCj4gVGhpcyBwcmVw
YXJlcyBmb3IgcmVtb3ZpbmcgY3B1bWFwX3ByaW50X3RvX3BhZ2VidWYoKS4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBZdXJ5IE5vcm92IDx5bm9yb3ZAbnZpZGlhLmNvbT4KClNhc2hpa28gaGFzIHJldmll
d2VkIHRoaXMgcGF0Y2ggYW5kIGZvdW5kIG5vIGlzc3Vlcy4gSXQgbG9va3MgZ3JlYXQhCgotLSAK
U2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYw
NzAyMTU0NzI1LjE4NTM3Ni0xLXlub3JvdkBudmlkaWEuY29tP3BhcnQ9NQoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGlu
ZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
