Return-Path: <SRS0=j4YL=C7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B576C4363D
	for <linux-amlogic@archiver.kernel.org>; Tue, 22 Sep 2020 14:17:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB4932395B
	for <linux-amlogic@archiver.kernel.org>; Tue, 22 Sep 2020 14:17:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="n3tRVAtn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BB4932395B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QBEeq1AE6z+qtEXDg3tXSHQGzst4Pw6T5Us0ixeN2w0=; b=n3tRVAtnaZA6M4GW7FDT7EMjXX
	0FuuM8wFD7GjPsHqpWY3Hk78Ln/qG4fVgYeZ1kD/9l4Yf639V6nfRCY2zRMD+ahZiAYpAUEPyMjMq
	TD22Es49vFT/rN8uIN2NBZzkQb6RFfAlObivRniJjeN3icrgxD4NQGJ108tTEwK7y3BCWFZ87H+Vf
	vzoQOOI9SF32nm4NoC5gc/bnDLJ9Bg1/GHI5QE87GcYHRzMMhSaCG5VCNvRK/qhF1fq39qvts/Qck
	LQKrh+N9pBeBHQGLxd4NESm9aR0xhYBLfQfQpU444dVz/L4gDvxTjnkU0aOl6ZihzaVvXutgdsFzC
	003P+ltg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKj6L-0004H4-6O; Tue, 22 Sep 2020 14:17:01 +0000
Received: from foss.arm.com ([217.140.110.172])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKj6I-0004FU-42; Tue, 22 Sep 2020 14:16:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C7377101E;
 Tue, 22 Sep 2020 07:16:55 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com
 [10.1.196.37])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2F8BC3F718;
 Tue, 22 Sep 2020 07:16:54 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: will@kernel.org, robh@kernel.org, tomeu.vizoso@collabora.com,
 steven.price@arm.com, alyssa.rosenzweig@collabora.com,
 khilman@baylibre.com, narmstrong@baylibre.com, jbrunet@baylibre.com
Subject: [PATCH v2 0/3] drm: panfrost: Coherency support
Date: Tue, 22 Sep 2020 15:16:47 +0100
Message-Id: <cover.1600780574.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.28.0.dirty
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200922_101658_214765_BCCF37FD 
X-CRM114-Status: GOOD (  11.24  )
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

Here's a quick v2 with the tags so far picked up and some inline
commentary about the shareability domains for the pagetable code.

Robin.


Robin Murphy (3):
  iommu/io-pgtable-arm: Support coherency for Mali LPAE
  drm/panfrost: Support cache-coherent integrations
  arm64: dts: meson: Describe G12b GPU as coherent

 arch/arm64/boot/dts/amlogic/meson-g12b.dtsi |  4 ++++
 drivers/gpu/drm/panfrost/panfrost_device.h  |  1 +
 drivers/gpu/drm/panfrost/panfrost_drv.c     |  2 ++
 drivers/gpu/drm/panfrost/panfrost_gem.c     |  2 ++
 drivers/gpu/drm/panfrost/panfrost_mmu.c     |  1 +
 drivers/iommu/io-pgtable-arm.c              | 11 ++++++++++-
 6 files changed, 20 insertions(+), 1 deletion(-)

-- 
2.28.0.dirty


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
