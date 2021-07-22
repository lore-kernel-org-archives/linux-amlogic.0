Return-Path: <SRS0=ZIL+=MO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F8EEC6377D
	for <linux-amlogic@archiver.kernel.org>; Thu, 22 Jul 2021 17:10:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2DF366128D
	for <linux-amlogic@archiver.kernel.org>; Thu, 22 Jul 2021 17:10:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2DF366128D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qG+vmCXS7VPb37JehCkKic+2/nujywG6nAbwAHrWHs0=; b=1rKNZr69VHJE9b
	mOY5ZqaNgxtK8bFSa2niNZr7V0hRXx9tal+/J14YJl12BU8Nfm/wlVpQw5G2motPfXDRp92PltJYc
	wd+w/wlsMK7e/1zuD7k2GezmUDGikGQmwYFD9svc373ajj+htUHymKfUi0Lol1IGTfdPBj8FXp0UP
	bR/XNZTslkfUB/9GA0h7vhkRb5WZnPoHpMUgcEPH3//kEF5LCQxQvRyArKATmLI8xsTa1WKKge6Fj
	REnjK2IWzXLvGl+OrMxRP1FLOgbVv2u3rrApNPs4BjYHtXmPamjP2LlTx6+S3MHl5UUzTjpuijfcA
	FblRvYtpZ3+HWnUW+Tpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6cDK-002Han-2S; Thu, 22 Jul 2021 17:10:26 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6cDD-002HZd-Vo; Thu, 22 Jul 2021 17:10:21 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1AADA61183;
 Thu, 22 Jul 2021 17:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626973819;
 bh=6tXsqxQclTT6KIHVXllKY41+MDNoERgynR2skjDE3sY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bFfHL+A8EXu7CYstSQ+1IjYoikwZaKgrPiwMvO91klckkR1wPj3SEexReAnIpYE7w
 SG5j7JiQ3veVXAqajXljEB0aT27fGq2Jw2t90a0aMwEHvYYL8WO4t7nNuzrr9R5Bec
 zqKqPCeL+0sj94ieU8iXm3iqK8G7rBqtxLc20Llp/C4KAF3mlg5dg8Ubyh8BjXvQ0w
 Pg7FBVyqjfQQzi1d0xjcL4Zvg2JEXTZn3BLwk1kBMxdYn+ynNrXnuMUFWB36IOxWHh
 FMvktb/YdWSeu2FNYkuXn4z35oz+m/c6F8qPSBtTstDvgS7fWZ6GD+C2H6yrNtjxgA
 X862uJ2jIDUPQ==
From: Mark Brown <broonie@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Dongliang Mu <mudongliangabcd@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org
Subject: Re: [PATCH] spi: meson-spicc: fix memory leak in meson_spicc_remove
Date: Thu, 22 Jul 2021 18:09:58 +0100
Message-Id: <162697114030.3066.15287754008678432008.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210720100116.1438974-1-mudongliangabcd@gmail.com>
References: <20210720100116.1438974-1-mudongliangabcd@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210722_101020_092105_2499C2D2 
X-CRM114-Status: GOOD (  11.10  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, 20 Jul 2021 18:01:16 +0800, Dongliang Mu wrote:
> In meson_spicc_probe, the error handling code needs to clean up master
> by calling spi_master_put, but the remove function does not have this
> function call. This will lead to memory leak of spicc->master.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: meson-spicc: fix memory leak in meson_spicc_remove
      commit: 8311ee2164c5cd1b63a601ea366f540eae89f10e

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
