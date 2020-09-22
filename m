Return-Path: <SRS0=j4YL=C7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AA65C4363D
	for <linux-amlogic@archiver.kernel.org>; Tue, 22 Sep 2020 16:26:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B175023A1B
	for <linux-amlogic@archiver.kernel.org>; Tue, 22 Sep 2020 16:26:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0kf+TkQa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B175023A1B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kC+tWPFRm0Cv3nThLi3/up68PHlqPXHZd77skIYKKF0=; b=0kf+TkQa34hp9Jb2I24vK1FWP
	ZRzDH1Ao6lKFSTREBe1qgFUbUBrpBgBdYUNwtRfoyz/hmZj7NSb41kLP0cduWYrJ9vSYUTRkbIQml
	5kSXfcsxgl3+HzCMtRAzs9q+7fl/4wPkJmuzlJG1dmpjBNTVEN6xIxTGnncUpcTogy+DldOW3RKjq
	uDZj08fPtWoEPJDvt8UMwtrC8vzLFGixljaTcytDOduP8Sdf6Y1BvKyYn4L+B5CT0vO8J+PWiOiQA
	xI72usJJsPIu8YTIH3JKFVOr0cnD6FA11RnNjD9n6JyUjm2pY30/idWX4K0wIWOGvTGUpuDc6dD2q
	kOFBY55yQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKl7H-0003FB-QK; Tue, 22 Sep 2020 16:26:07 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKl7E-0003EP-3d; Tue, 22 Sep 2020 16:26:06 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: alyssa) with ESMTPSA id 88251299052
Date: Tue, 22 Sep 2020 12:25:57 -0400
From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH v2 0/3] drm: panfrost: Coherency support
Message-ID: <20200922162557.GA2406@kevin>
References: <cover.1600780574.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1600780574.git.robin.murphy@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200922_122604_261514_2E88ED38 
X-CRM114-Status: GOOD (  12.07  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: robh@kernel.org, tomeu.vizoso@collabora.com, narmstrong@baylibre.com,
 khilman@baylibre.com, dri-devel@lists.freedesktop.org, steven.price@arm.com,
 iommu@lists.linux-foundation.org, linux-amlogic@lists.infradead.org,
 will@kernel.org, linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Series is:

	Acked-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>

On Tue, Sep 22, 2020 at 03:16:47PM +0100, Robin Murphy wrote:
> Hi all,
> 
> Here's a quick v2 with the tags so far picked up and some inline
> commentary about the shareability domains for the pagetable code.
> 
> Robin.
> 
> 
> Robin Murphy (3):
>   iommu/io-pgtable-arm: Support coherency for Mali LPAE
>   drm/panfrost: Support cache-coherent integrations
>   arm64: dts: meson: Describe G12b GPU as coherent
> 
>  arch/arm64/boot/dts/amlogic/meson-g12b.dtsi |  4 ++++
>  drivers/gpu/drm/panfrost/panfrost_device.h  |  1 +
>  drivers/gpu/drm/panfrost/panfrost_drv.c     |  2 ++
>  drivers/gpu/drm/panfrost/panfrost_gem.c     |  2 ++
>  drivers/gpu/drm/panfrost/panfrost_mmu.c     |  1 +
>  drivers/iommu/io-pgtable-arm.c              | 11 ++++++++++-
>  6 files changed, 20 insertions(+), 1 deletion(-)
> 
> -- 
> 2.28.0.dirty
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
