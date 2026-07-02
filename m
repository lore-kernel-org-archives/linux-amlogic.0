Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEFE7C43458
	for <linux-amlogic@archiver.kernel.org>; Thu,  2 Jul 2026 15:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=82J+YyFdP0yWzC2ixUoW4daZj/XWTpJssXSgmFdz4dI=; b=TXGVVNKRaQDOtj
	8Aq4yPdzyPlHziw5aKwFIWgxgm48q8g9Pxz1b2iveWQL8qVPJvxnpSkBARHcItBiNcYEmsXADSRrI
	bf4R4FItM5bdPzv9qAwQ4Np58XFQkP+VpVCQqN/rXM/fNZKJvqUSAViSR6pydWLZB3eZdkU+tXWXg
	gKHxFp40Ht36cNgopUOnVnhTVo2XOWqt4U6XUtcbvZqLj4g7F2++0htFvoBVGB9e/kKOM6tGOQyeP
	9ue1HEOYS+xgdDKF5wS8IR/CbygSv8Hrp7RPIAT7yhIK1riSi5DuaN/8vZ3Czkx1E8+0A6iYADWX5
	cyUWM69RJN/u4dAk7SjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJlR-00000004tD3-0LZQ;
	Thu, 02 Jul 2026 15:55:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJlP-00000004tCj-14TX
	for linux-amlogic@lists.infradead.org;
	Thu, 02 Jul 2026 15:55:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A6695601CA;
	Thu,  2 Jul 2026 15:55:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1E2D1F000E9;
	Thu,  2 Jul 2026 15:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783007742;
	bh=DWoKT7O7ljVzZo/n+aaxT2AQQ6rco2vqA4cQgNNvj8k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=b+SvHaSVpcaunmxU0pCjo1bEoyOWaxHGtqjSTtUupBDjLquzOJk9w/MTzXjswO3Tk
	 dK6d58ZMsNKcNTvSFgLoU4ktepH/JSuYZD6mVGMAz4H3N3Hjta8h93tZScDXfxtzYd
	 F2NCuRLHMc6J6ioiM3vdJIzqQnApstUQlnQQxDDfz+RfLApvYn9Ou1t6ri57anRX5Q
	 CMeTFUye05bFlXihAgpYrKqI+f9L7WiqOwofvCsIqT10O+rhLCPOv4iAVDzTZtqVYe
	 b32vUHGr9SjNqzJyM/5w92t1D9YWNXm/drDbcNEz5ECuDELiUfXLtBkPWnzHG57Tb4
	 HOz758E4dndoQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 08/11] RDMA/hfi1: Use sysfs_emit() for cpumask show
 helper
To: "Yury Norov" <ynorov@nvidia.com>
Cc: Frank.Li@kernel.org, linux-cxl@vger.kernel.org, linux-perf-users@vger.kernel.org, imx@lists.linux.dev, linux-pci@vger.kernel.org, linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org
In-Reply-To: <20260702154725.185376-9-ynorov@nvidia.com>
References: <20260702154725.185376-1-ynorov@nvidia.com>
 <20260702154725.185376-9-ynorov@nvidia.com>
Date: Thu, 02 Jul 2026 15:55:41 +0000
Message-Id: <20260702155541.E1E2D1F000E9@smtp.kernel.org>
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

PiBzZG1hX2dldF9jcHVfdG9fc2RlX21hcCgpIGlzIHVzZWQgYnkgYSBzeXNmcyBzaG93IGNhbGxi
YWNrLgo+IAo+IFVzZSBzeXNmc19lbWl0KCkgYW5kIGNwdW1hc2tfcHJfYXJncygpIHRvIGVtaXQg
dGhlIG1hc2suCj4gCj4gVGhpcyBwcmVwYXJlcyBmb3IgcmVtb3ZpbmcgY3B1bWFwX3ByaW50X3Rv
X3BhZ2VidWYoKS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBZdXJ5IE5vcm92IDx5bm9yb3ZAbnZpZGlh
LmNvbT4KClNhc2hpa28gaGFzIHJldmlld2VkIHRoaXMgcGF0Y2ggYW5kIGZvdW5kIG5vIGlzc3Vl
cy4gSXQgbG9va3MgZ3JlYXQhCgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNo
aWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwNzAyMTU0NzI1LjE4NTM3Ni0xLXlub3JvdkBudmlkaWEu
Y29tP3BhcnQ9OAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LWFtbG9naWMK
