Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42BBFC43327
	for <linux-amlogic@archiver.kernel.org>; Thu,  2 Jul 2026 15:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MUUvasrjfzzaxMxL9heatiCF9zDuG3qZDzNgBSv3AXM=; b=2/CUtenbjTWiul
	jyipZ7AAOHbCkxt2PvtR5S3I++E006czum80UcdFfo9hMYrAcrU6MyPW/6NYET4psrbbPUBw4pQjt
	kQej5FaUdJtGpWvH9FmGvQegN4cujWuduHPCAgvYdtM8WESR/RxQN3lt1oc+QTU7xj+TQD6UvfDLh
	bsbChYJG7TrWD+RUO5HYbKzoeQ2ixOJ4Lks45HdxlFbtCFRqNE/opx59SrFFIHsoFmO9qlNq+tY6l
	CAPSEh36vgQGtw8kMEfV4o5XFnkKqLL7xoGkI2QG8EkB3ca5zHQ/BcOlxeMDMpxcLshyetqvDeYtD
	6GVdldLoacd7wuYt6/BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJlE-00000004tAi-3BIf;
	Thu, 02 Jul 2026 15:55:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJlD-00000004tAb-1qZC
	for linux-amlogic@lists.infradead.org;
	Thu, 02 Jul 2026 15:55:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2C9F643A91;
	Thu,  2 Jul 2026 15:55:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9257D1F000E9;
	Thu,  2 Jul 2026 15:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783007731;
	bh=M95W2kiexRbhvzko8M/qdaPrG9dB/Xndyu6bi7MzSdM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=A8qI9BXW5w24j8N6RwLFMN7Y3bD6QdwueuWdBgmqfS/KxaAW82u6BsNngAAFDX57m
	 +DHXvJ43tbjneb7p2R+C5Hnhi+7Bnv9yjty8Rtj1LTAZnLzsXjUOoM9Qv3XLjITDkr
	 Y/xDsdkTAFJiWPjQcU2xA9kAfySoCZu7/2XXyhp7XP5hdCC0QyJUZwmpPirSkXJZbQ
	 xm59s5/RN52ID6hoYoDiB13tmHCHrM5k3ELdq4nNfYb1SpyRObxm3GTNz3msNy5eKF
	 pX77MN4E+EVA3qm09LyfWEwYMiucT3m2hDPJ9JL5+8s3vEL4bSZhhKSUW13uEFVQF9
	 JViP9HrFJU3ZQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 09/11] PCI/sysfs: Use sysfs_emit() for cpumask show
 callbacks
To: "Yury Norov" <ynorov@nvidia.com>
Cc: imx@lists.linux.dev, linux-perf-users@vger.kernel.org, linux-cxl@vger.kernel.org, neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org, linux-pci@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260702154725.185376-10-ynorov@nvidia.com>
References: <20260702154725.185376-1-ynorov@nvidia.com>
 <20260702154725.185376-10-ynorov@nvidia.com>
Date: Thu, 02 Jul 2026 15:55:30 +0000
Message-Id: <20260702155530.9257D1F000E9@smtp.kernel.org>
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
MjYwNzAyMTU0NzI1LjE4NTM3Ni0xLXlub3JvdkBudmlkaWEuY29tP3BhcnQ9OQoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFp
bGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
