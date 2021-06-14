Return-Path: <SRS0=Jm29=LI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85025C2B9F4
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Jun 2021 19:54:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5678D611CA
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Jun 2021 19:54:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5678D611CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rzZI+BMWy0EYyhDDDx04lEf9oA8Cyr9A93ryth3+1C0=; b=H23Nf1U7FVPYvz
	YaSR6sjxlP5R5VAnYVgtN/nu6a9lLE8hlkxUKsdWYzqncbttBTKLUdcTEMIwSJbh9m9L/GkPudIZn
	k0HWxtKAGw0NmBiRJIAatdfPuDEIzu5dnjnsl7FpSEo3YgVAb9IMK8uP9AwDGotyvktsADZuMwqhl
	h8/K2pqS2gV8C7zi62LmYcT+39hWSjCg87Gi7IZYK6ApH7WRf8yyETpcfFiLMkWp8VeStsOdS9ZSO
	KgzxOi+mg6TWNvXcf7XJwduopvBPbuUo5mck69bt6x49DtklVASJXgN8/Hmleb2lx688sbOPWwuTT
	hwbhRdyytTj3vAJ+60hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lssfQ-00FxSX-PP; Mon, 14 Jun 2021 19:54:40 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lssf7-00FxKj-Qq; Mon, 14 Jun 2021 19:54:25 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id E94BE61166;
 Mon, 14 Jun 2021 19:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623700461;
 bh=9H59Xz02Kl+iv21yoouobtliOku9p+EcM8ROFyfhWTc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ehs1koXhYhnQJhJJvR8usrB0j9ZwqwOc5uAZo9Mub/OJw/4PHL81MgxHaC259emy6
 JBxLmqjtsgBKEcHvUX7ND1/ZAxCsBqZyKWyGSR7u/3e6+G6UnZRYqe5SnmvXI54gDG
 iUWPEb8u7jCPokEeD7nnqSyOfIx5N1ouawX3GPJ7zBSu8BKARk6J55rlvFSr40tVnc
 vaLuLUnOPQPDnKF4SX3CHx3cxG8pfX/iPR2nWTA66FayfFCjNI+KFclffsJ9yx4hLD
 i3tJx44lwpIL2VKANf+tB3Cbj+bQnzpJetKFB0KilYPnBWSHB1EXwe2qIAsVqzBsMU
 Tc8nbAv62GZoQ==
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-spi@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, zpershuai <zpershuai@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Cc: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 1/2] spi: meson-spicc: fix memory leak in
 meson_spicc_probe
Date: Mon, 14 Jun 2021 20:53:32 +0100
Message-Id: <162370043178.40904.2317762864895103950.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1623562156-21995-1-git-send-email-zpershuai@gmail.com>
References: <1623562156-21995-1-git-send-email-zpershuai@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210614_125421_911378_2C1ABD01 
X-CRM114-Status: UNSURE (   9.53  )
X-CRM114-Notice: Please train this message.
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

On Sun, 13 Jun 2021 13:29:16 +0800, zpershuai wrote:
> when meson_spicc_clk_init returns failed, it should goto the
> out_clk label.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/2] spi: meson-spicc: fix memory leak in meson_spicc_probe
      commit: b2d501c13470409ee7613855b17e5e5ec4111e1c

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
