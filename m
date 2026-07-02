Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB8B3C43458
	for <linux-amlogic@archiver.kernel.org>; Thu,  2 Jul 2026 15:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PaFS4Gd11ArK0KSDLEw7dHgj+hOI5YEKnvqy/9n8w2o=; b=CoKl3UFof/iiUu
	CFN/mxuNEtOHbLZu3l6holdhhgGYRrMEesFQCZDxTbTTc+DYqfykehj1kq3vF5djc3/UQW7zSq1L5
	t3B4AHyHxdjVj4hWZoC3SwlZ8eZYjpDyqLsW0QRmChdoP+6Q3WxSNCP3AHJv7bBx3UK6f03q7GXDk
	TPYBjJ2h2MTXGokU18NQQN4JehJZ0kNiTKpoVVLOX4fma3cn5k3IKZIZ71mezGCLiteeK4pXLuESF
	U1O28xh/MD02P60oktIOdBjegFZJvvwlYdMFc0ERuNiHwn/ryDnYgVvBCJb3W8VinHNtVxJ22GT3H
	CsFHayGjXO20RrCQlu0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJlX-00000004tEt-0Zyn;
	Thu, 02 Jul 2026 15:55:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJlV-00000004tEV-1c99
	for linux-amlogic@lists.infradead.org;
	Thu, 02 Jul 2026 15:55:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1BBC441755;
	Thu,  2 Jul 2026 15:55:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D0031F000E9;
	Thu,  2 Jul 2026 15:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783007749;
	bh=rGKs0kNQQus8sqFUJW5xPwT87wIxN8QBvYV8RDo1rr4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lVJfKr0hKpsOssfD+kIo6uVAt+olqCnVnebRBOF9wt0fZNUkU2W6PZV/qAhWuYMor
	 sXxA9zJt/JdUZ9CDbtVie/8TTS+x+G+a3G2soV+D+OQt7UJ39zye+95YnQwnkPHFEh
	 YNVNZ+4yIsDg2GO0W1KmDU/6tmHY94QHqFRKxkJWBat1XNJWILHMM0PuoXI3ojRCie
	 wm61YPzvrNl128kqfV/nh0ipD5NpfWAepJ7mFYYLEkdm4FtGk2wwFtwrcm2Lmc5dFh
	 iDhiDAEN6RxUg6QMJoMaonbSl3Vh1zPIdBQ6qdr0jcuOFSQlxZwUNdTvbFUTok3NIy
	 zFw8Vav7yZAuA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 02/11] powerpc: Use sysfs_emit() for cpumask show
 callbacks
To: "Yury Norov" <ynorov@nvidia.com>
Cc: neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org, linux-cxl@vger.kernel.org, imx@lists.linux.dev, linux-pci@vger.kernel.org, Frank.Li@kernel.org, linux-perf-users@vger.kernel.org
In-Reply-To: <20260702154725.185376-3-ynorov@nvidia.com>
References: <20260702154725.185376-1-ynorov@nvidia.com>
 <20260702154725.185376-3-ynorov@nvidia.com>
Date: Thu, 02 Jul 2026 15:55:47 +0000
Message-Id: <20260702155548.4D0031F000E9@smtp.kernel.org>
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
MjYwNzAyMTU0NzI1LjE4NTM3Ni0xLXlub3JvdkBudmlkaWEuY29tP3BhcnQ9MgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFp
bGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
