Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E609C43458
	for <linux-amlogic@archiver.kernel.org>; Thu,  2 Jul 2026 15:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uX6BohnNvF05Ic6V74k0hz1VMXJmnf3bexsp0GLcPj4=; b=245QhE6h4wd1xy
	OgoHdYt9IMdIHrOplj0KfgmnBhPQg1JClxESbaTJYQa4wjVDDBnlvb0xvTnOYAhqg/IWsG6zTcQ+9
	TV2mOkHxvf9WDCYuwGWnzhYtMz9CuceZSFmMMdNfZpCvC0/KEES4xEMWiY/7X3MRccr12Wey2Av8G
	MRz6Y9aLC3i2m/KUuEEdDu3Z/f1zc+/b7IxYeyJlFt/fjh0muPV3JJFpPgA2pdekjOvjmD0waIdMZ
	QAM2olcFxzL25qGYN/H1JcUPlMhZshDt8D+Gl1dCXHWI/KGbNIFLH3AzrPnIEzheFt6wrOz5Kh+lT
	1O2sVndA7rHaTi5b7egg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJlv-00000004tJd-0qOt;
	Thu, 02 Jul 2026 15:56:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJlt-00000004tJW-0y7l
	for linux-amlogic@lists.infradead.org;
	Thu, 02 Jul 2026 15:56:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F30694374D;
	Thu,  2 Jul 2026 15:56:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 658611F000E9;
	Thu,  2 Jul 2026 15:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783007770;
	bh=cIFnEIkKpjgp2EyaqZwVX9TRZDm6r8qWcsBcKP2yb+s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gEmMPFq2a7WvV/MOiUxFbnvBz6+8LmfxVtuPC0+FB/ImZW72Ntt+5IiHJDjEOdr19
	 Ysl0xfx3/AL3poqWG+VSlVfYavvsarPh1223cv0E6SVcO10yoSYI0dcNrP1z/2FMUM
	 1tMVUGOSXtjy4F1hkfqz10TSFF2jOFwKY/YKej0dEoEIz3H1LoHCj71xe8iONivSRK
	 1/cwAGWfJRnRosfObfudTf+a+6KaodLnVYvybGYaEBaBsec/NNK/uUePfmIb5jKBDu
	 fqMPTkYhY55/mVqYW8VrHk+Ktvc3YiFqyOYFqn0j/2H7/L0m7h8gOFfJ6nt3mZBeOB
	 CNnSgsLBBYkQQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 10/11] perf: Use sysfs_emit() for cpumask show
 callbacks
To: "Yury Norov" <ynorov@nvidia.com>
Cc: linux-cxl@vger.kernel.org, linux-pci@vger.kernel.org, Frank.Li@kernel.org, neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org, imx@lists.linux.dev, linux-perf-users@vger.kernel.org
In-Reply-To: <20260702154725.185376-11-ynorov@nvidia.com>
References: <20260702154725.185376-1-ynorov@nvidia.com>
 <20260702154725.185376-11-ynorov@nvidia.com>
Date: Thu, 02 Jul 2026 15:56:09 +0000
Message-Id: <20260702155610.658611F000E9@smtp.kernel.org>
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
YXJlcyBmb3IgcmVtb3ZpbmcgY3B1bWFwX3ByaW50X3RvX3BhZ2VidWYoKS4KPiAKPiBMaW5rOiBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvYWtBTkotQVQ3bkhwUk1xLUB5dXJ5Lwo+IFNpZ25l
ZC1vZmYtYnk6IFl1cnkgTm9yb3YgPHlub3JvdkBudmlkaWEuY29tPgoKU2FzaGlrbyBoYXMgcmV2
aWV3ZWQgdGhpcyBwYXRjaCBhbmQgZm91bmQgbm8gaXNzdWVzLiBJdCBsb29rcyBncmVhdCEKCi0t
IApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAy
NjA3MDIxNTQ3MjUuMTg1Mzc2LTEteW5vcm92QG52aWRpYS5jb20/cGFydD0xMAoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFp
bGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
