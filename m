Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 953D1C43458
	for <linux-amlogic@archiver.kernel.org>; Thu,  2 Jul 2026 15:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hX37PvfxKh4a+7LCqmM9IJMCJwFU9Ypp1rfZrqyK1b0=; b=MJxuMrtbJdv+QH
	1ZqklI7nf4uXAwWRmLS8Ks3F/v7Qo0AmPFiVaNQMyhkEMPQ2miA0zK25SSsqkGl1ag9WR6B5kY/58
	FKekR1PJVoZGwjTMpdV4DGehn5hBELP4BKuO90Twcpw5RdVBhKL12LfqeQRQ+xAEfU94M2UtrZoCo
	P4AhWthTaZ0ekl0QOa0UjI9ljeZ4HL3PiS1edDYpyjhoW/2ocHgKGRK/tMplz5/WkcKh1yxvEjSfH
	GhJ9E4W+9AzGgq+QoCU1a5mZfnjQbQrS5W1nnHMV7VxxEVomWTS9UCc0w0ItMIkn77nDVohZ6fv9A
	eKQ8stZSirtbCo/W6gvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJia-00000004saX-1Uvj;
	Thu, 02 Jul 2026 15:52:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJiZ-00000004saF-0zHu
	for linux-amlogic@lists.infradead.org;
	Thu, 02 Jul 2026 15:52:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B1E1D401BB;
	Thu,  2 Jul 2026 15:52:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 248051F000E9;
	Thu,  2 Jul 2026 15:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783007566;
	bh=Pq04jR7r5xIm4PQlrwNdhdQS36HbHfIAAI9OOBmdFtQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=N37lXu9xu6CZ1LUGdjWK/6bD+pRuDTv+8tv8+SFyraXT0xAfogP2KYOJOv9vtFsmh
	 l22rlUYILQe4i3sGdtRPfER8NiCC+7NiMDIoTGAhAU9DVzmGQ/U4QNJAR+mfCDVvgC
	 ZDCZ3ez67Rdz04FQaZ/brNmr6AjSbnR4a/ffWbubO431NHhEfklcofJMLeQuw+kqYw
	 CNyFIJMJOZ86A6U0joxCRyUsKkGQvavxA6+1mtxc7fJFXmh1ApBb4eo1WL1DWwJLg7
	 YxMmiW6RfFBOIUJqSHIj1FweyhBIOGXJGw+rDAjyUDuwAcZbYdAkaXEZAXgqlZgvLZ
	 fNKWiOdsKRn5w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 07/11] hwtracing: hisi_ptt: Use sysfs_emit() for
 cpumask show
To: "Yury Norov" <ynorov@nvidia.com>
Cc: linux-perf-users@vger.kernel.org, imx@lists.linux.dev, neil.armstrong@linaro.org, linux-cxl@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-pci@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260702154725.185376-8-ynorov@nvidia.com>
References: <20260702154725.185376-1-ynorov@nvidia.com>
 <20260702154725.185376-8-ynorov@nvidia.com>
Date: Thu, 02 Jul 2026 15:52:45 +0000
Message-Id: <20260702155246.248051F000E9@smtp.kernel.org>
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

PiBjcHVtYXNrX3Nob3coKSBpcyBhIHN5c2ZzIHNob3cgY2FsbGJhY2suIFVzZSBzeXNmc19lbWl0
KCkgYW5kCj4gY3B1bWFza19wcl9hcmdzKCkgdG8gZW1pdCB0aGUgbWFzay4KPiAKPiBUaGlzIHBy
ZXBhcmVzIGZvciByZW1vdmluZyBjcHVtYXBfcHJpbnRfdG9fcGFnZWJ1ZigpLgo+IAo+IFNpZ25l
ZC1vZmYtYnk6IFl1cnkgTm9yb3YgPHlub3JvdkBudmlkaWEuY29tPgoKU2FzaGlrbyBoYXMgcmV2
aWV3ZWQgdGhpcyBwYXRjaCBhbmQgZm91bmQgbm8gaXNzdWVzLiBJdCBsb29rcyBncmVhdCEKCi0t
IApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAy
NjA3MDIxNTQ3MjUuMTg1Mzc2LTEteW5vcm92QG52aWRpYS5jb20/cGFydD03CgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWls
aW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
