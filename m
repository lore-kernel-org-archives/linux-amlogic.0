Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 783A2C43458
	for <linux-amlogic@archiver.kernel.org>; Thu,  2 Jul 2026 15:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uia61z7Yyp3WUmqaj+w/n6KeemDRb9BDW+RftSHkQnA=; b=thaDNMith1ma/P
	wt4R0+NBVWilCX+C/QnHHSaLOHVGEaQA1FYBGkAry7w0x+d/ivXlkOzLcbDY88M+rXJJ93+ar8rVO
	RfRr4bkpa/vFSS0ilc2vhd9Z8sMz91JgmZe3heQQaiyGpAYLanclgtyvHoj5+HSq7pMc5boR1PUQ/
	M7oLsMg5FGvEQnnY4t3GXSkseZ7mV7F9qRKEC8ZqoNZWq+XPafPGURS5xCwLD/xiUUMO8dgEWSI6l
	Bd5tG64R/+jj89Y1b3IEpfmzygnGYgFcUUbH8Ihx9x1tkHkE9wh0Bd3ZnqKYpKsh4gjV+Repaus8t
	grFsrVnYexbD+75ruMDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJk8-00000004sxs-1zUZ;
	Thu, 02 Jul 2026 15:54:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJk7-00000004sxX-1HtW
	for linux-amlogic@lists.infradead.org;
	Thu, 02 Jul 2026 15:54:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C0491601CA;
	Thu,  2 Jul 2026 15:54:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 055F21F000E9;
	Thu,  2 Jul 2026 15:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783007662;
	bh=UQN/ulBGEMPe0Pumu5fkewtDCPeEZj7oOJ2MNLZMVTA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MXjEJE51vOsOoaWIzpRk3pY9F2SzwkGi+m5FVl5rDTRVpctNcpMfPv7PNxj09TjRU
	 IV9ASpEvpXu4yM8cZQ8oEoC5c/RZ9z676tV+LeVqQ9SweLe1LJd3OQ1M5KY3QKOsym
	 K8Rl1rRip9eBv7d4xnvW6t0c+YruIOakefjgxx8gUPARdvNKHIhK00KIfca/m7sm1E
	 g2cyvTBz8BnRtWKMfCWB5Y9SZ/BBNVJSsYtZqbw+G5/8KUZMr/16Ju2rRtzWGHfGjt
	 /jcQV/2xqq2bahsC/zjZyuS0hPNoot2Nf3h7BsHJA2JVlZDyME4i2LgVQIOUmpEI1D
	 uqVVAYDYWMVFg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 01/11] arm: Use sysfs_emit() for cpumask show
 callbacks
To: "Yury Norov" <ynorov@nvidia.com>
Cc: neil.armstrong@linaro.org, linux-pci@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-cxl@vger.kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260702154725.185376-2-ynorov@nvidia.com>
References: <20260702154725.185376-1-ynorov@nvidia.com>
 <20260702154725.185376-2-ynorov@nvidia.com>
Date: Thu, 02 Jul 2026 15:54:21 +0000
Message-Id: <20260702155422.055F21F000E9@smtp.kernel.org>
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

PiBUaGVzZSBjYWxsYmFja3MgYXJlIHN5c2ZzIHNob3cgcGF0aHMuCj4gCj4gVXNlIHN5c2ZzX2Vt
aXQoKSBhbmQgY3B1bWFza19wcl9hcmdzKCkgdG8gZW1pdCB0aGUgbWFza3MuCj4gCj4gVGhpcyBw
cmVwYXJlcyBmb3IgcmVtb3ZpbmcgY3B1bWFwX3ByaW50X3RvX3BhZ2VidWYoKS4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBZdXJ5IE5vcm92IDx5bm9yb3ZAbnZpZGlhLmNvbT4KClNhc2hpa28gaGFzIHJl
dmlld2VkIHRoaXMgcGF0Y2ggYW5kIGZvdW5kIG5vIGlzc3Vlcy4gSXQgbG9va3MgZ3JlYXQhCgot
LSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIw
MjYwNzAyMTU0NzI1LjE4NTM3Ni0xLXlub3JvdkBudmlkaWEuY29tP3BhcnQ9MQoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFp
bGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
