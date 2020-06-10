Return-Path: <SRS0=LORm=7X=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABBE8C433DF
	for <linux-amlogic@archiver.kernel.org>; Wed, 10 Jun 2020 11:04:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 80DD5206F7
	for <linux-amlogic@archiver.kernel.org>; Wed, 10 Jun 2020 11:04:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cuI5rJW2";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Stx5Mtk7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 80DD5206F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Subject:
	References:In-Reply-To:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2sHvijZABluDTKdsCGn3GdbcOTdTbAhXRoAx6aE88sc=; b=cuI5rJW2t6M2Ys
	7YR8+wkg/Dghq/QXGjsGjvbZVyPIIuYYtkI9Ut1X6mRlPiKmIk3Pyd6bco3DaryYIBE2I1CrCXXXn
	6iEQcvUCi3yAe0RSV1tRRZ541GBxF420SQTm/YelS9HGZikwvEFnebxalXF2FY6zBhF1R5Nk0P5Xw
	jPdFzNs9jfOlkxdmT2v/0BUhVgNYzzt2CB7gmVZaAINSATaGiw+uvF6T2KbfriVexYD3F5UvAvku5
	mbzjq4lJPx75UZjJMKWCIxVlGK+SLWTBBaDi9XUu6WVWG2OQlXT/upjZrgr+4pnjFH/m3GU30UuMG
	IVoJfV9X6kw/GeWo9XzA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jiyWm-000588-Op; Wed, 10 Jun 2020 11:04:16 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jiyWj-00057d-9o; Wed, 10 Jun 2020 11:04:14 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 64BAE206F7;
 Wed, 10 Jun 2020 11:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591787052;
 bh=EwtPHLWn+DTApDYb5Wc2b44Mud8TrcUb4fGhHcUssCc=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=Stx5Mtk7wXj/6v9y+VYR0hIeysL7z0Xm0ksuymP6/KNReeyO/IyDflz4JyCXnCNmA
 MNvXMTbqyLORwrk10rPcOxic1lbg5IagY/hnybzjtAJ8RQE+TlLBiwrxEkazpuGsM+
 +rgpGghPHNRyMyn6ID9NaGOwUFBBYz+9qwT1JzfQ=
Date: Wed, 10 Jun 2020 12:04:10 +0100
From: Mark Brown <broonie@kernel.org>
To: Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Alexander Stein <alexander.stein@mailbox.org>
In-Reply-To: <20200609165527.55183-1-alexander.stein@mailbox.org>
References: <20200609165527.55183-1-alexander.stein@mailbox.org>
Subject: Re: [PATCH 1/1] spi: dt-bindings: amlogic,
 meson-gx-spicc: Fix schema for meson-g12a
Message-Id: <159178705075.52654.15102712059659144852.b4-ty@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200610_040413_355955_711BCEAD 
X-CRM114-Status: UNSURE (   8.03  )
X-CRM114-Notice: Please train this message.
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
Cc: devicetree@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, 9 Jun 2020 18:55:27 +0200, Alexander Stein wrote:
> 


Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: dt-bindings: amlogic, meson-gx-spicc: Fix schema for meson-g12a
      commit: a575357b6435c6dd988b8194c59eec83f6e5d5af

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
