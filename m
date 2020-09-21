Return-Path: <SRS0=01f4=C6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A54E2C4363A
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Sep 2020 17:57:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 407E120BED
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Sep 2020 17:57:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WxpoCeJ8";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="b3e4bLWq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 407E120BED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FTj6WapVibp2EqeHAnLVl7TB1k2Zk85QTrg5aaFYFdg=; b=WxpoCeJ8xssrJTtKg0FyBWBdv
	N0xLtSyJQXuDYIQgmpzmeInE41i+UesL4u43oVIxmYAYHUiJMOMicKYE8IZcAubCNAWyo3M/WvUnY
	D77+5m92LFIVnSVQwZITffpVnYctOgAHIkQSsXtZM1hs6fQoargVy4GI972xAa87u6hqdwzGBFfgo
	Ln4Jk0+u4MGP6pFKFn4DE00/IxFWfuz7fHqqvMx8pPzZ2FkL4T4j0XTSRjMSQdF7bdEL+pCa1Ntkp
	YYYoifPAA47raC5fgaa3s550RpkLpXHn3CsMnCmtO/ikQPecHH2EUZgZrKY3zhAytg30GB9IHqccV
	jAIY31GXw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKQ47-0005oo-MB; Mon, 21 Sep 2020 17:57:27 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKQ45-0005oH-GT; Mon, 21 Sep 2020 17:57:26 +0000
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 35E5B20BED;
 Mon, 21 Sep 2020 17:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600711044;
 bh=MViJLr32Rfq7YAhifD5/NIE9W+70lqX9C47Hh7THkOA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=b3e4bLWq5uf1a8R/Zqrvx5GkxrmWFkVBJ7bYxNE+krlPNWfqlQf3S3tTvNN0+xB28
 CxpT0M0IBlW+szKcCIPx5TFtZcwgWVBp8MOHvIS4TTWK1EOcQWjVDDWz/daGwhF3q9
 l5v3MQq16B/JXdNNa/Qs+ZKHN5sUIxuisx9oOSbM=
Date: Mon, 21 Sep 2020 18:57:19 +0100
From: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH 1/3] iommu/io-pgtable-arm: Support coherency for Mali LPAE
Message-ID: <20200921175717.GF3141@willie-the-truck>
References: <cover.1600213517.git.robin.murphy@arm.com>
 <d2a3ddb17b3270e268e2f1adf7682ea938823941.1600213517.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d2a3ddb17b3270e268e2f1adf7682ea938823941.1600213517.git.robin.murphy@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200921_135725_622219_3AB093DB 
X-CRM114-Status: GOOD (  13.28  )
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
 iommu@lists.linux-foundation.org, alyssa.rosenzweig@collabora.com,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, Sep 16, 2020 at 12:51:05AM +0100, Robin Murphy wrote:
> Midgard GPUs have ACE-Lite master interfaces which allows systems to
> integrate them in an I/O-coherent manner. It seems that from the GPU's
> viewpoint, the rest of the system is its outer shareable domain, and so
> even when snoop signals are wired up, they are only emitted for outer
> shareable accesses. As such, setting the TTBR_SHARE_OUTER bit does
> indeed get coherent pagetable walks working nicely for the coherent
> T620 in the Arm Juno SoC.

I can't help but think some of this commentary deserves to be in the code
as well.

Do you know if this sort of thing is done for other SoCs too, or is this
just a Juno quirk?

Will

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
