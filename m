Return-Path: <SRS0=PGU9=CY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 544A1C433E2
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Sep 2020 23:51:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C48E420756
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Sep 2020 23:51:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pOY7ubhl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C48E420756
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8VhPH49xjSxUzqfUurqhCEh3/Mn8HxdtpJ3X2adId2c=; b=pOY7ubhl1/spyCzlLMC7Umh0AR
	bbjnoiN3qVqYdsYSRRQzSdimR7biHNcm2ivKwQiQ6LJT6m7sJxmiImKOPcBWDmwCrZZew10EH7kLZ
	RMoffRY99weYTTqpYiaBrMn8IEZuTskRLB6Gyf5DiV0VKb33PJ+TkxJVVQNu9BjFt3VCJScRbrrAc
	PegCnm8yrQeL+a3yISpvWKMxvWrwg9fWoCfVZo4mLmFUuqNIwBe49U3M6jRuAIIOQIFA3qO4SnPp2
	Zx/GM2VAGpRHMKzk5uviwQhdHEso6IrBbxGmPmS5j76XsT0SEQ05HFdLHxo7Jr75lx1tzM3O/b6f/
	C4Mt88mw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIKjM-000425-85; Tue, 15 Sep 2020 23:51:24 +0000
Received: from foss.arm.com ([217.140.110.172])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIKjI-0003zy-MQ; Tue, 15 Sep 2020 23:51:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 34136101E;
 Tue, 15 Sep 2020 16:51:14 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com
 [10.1.196.37])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 936513F68F;
 Tue, 15 Sep 2020 16:51:12 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: will@kernel.org, robh@kernel.org, tomeu.vizoso@collabora.com,
 steven.price@arm.com, alyssa.rosenzweig@collabora.com,
 khilman@baylibre.com, narmstrong@baylibre.com, jbrunet@baylibre.com
Subject: [PATCH 0/3] drm: panfrost: Coherency support
Date: Wed, 16 Sep 2020 00:51:04 +0100
Message-Id: <cover.1600213517.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.28.0.dirty
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200915_195120_813098_401D92B3 
X-CRM114-Status: GOOD (  10.76  )
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
Cc: linux-amlogic@lists.infradead.org, iommu@lists.linux-foundation.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi all,

I polished up my original proof-of-concept a little while back, but now
that I've got my hands on my Juno again I've been able to actually test
it to my satisfaction, so here are proper patches!

It probably makes sense for patches #1 and #2 to stay together and both
go via drm-misc, provided Will's OK with that.

Robin.


Robin Murphy (3):
  iommu/io-pgtable-arm: Support coherency for Mali LPAE
  drm/panfrost: Support cache-coherent integrations
  arm64: dts: meson: Describe G12b GPU as coherent

 arch/arm64/boot/dts/amlogic/meson-g12b.dtsi | 4 ++++
 drivers/gpu/drm/panfrost/panfrost_device.h  | 1 +
 drivers/gpu/drm/panfrost/panfrost_drv.c     | 2 ++
 drivers/gpu/drm/panfrost/panfrost_gem.c     | 2 ++
 drivers/gpu/drm/panfrost/panfrost_mmu.c     | 1 +
 drivers/iommu/io-pgtable-arm.c              | 5 ++++-
 6 files changed, 14 insertions(+), 1 deletion(-)

-- 
2.28.0.dirty


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
