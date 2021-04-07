Return-Path: <SRS0=M/XH=JE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F71DC433ED
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Apr 2021 20:27:12 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A7E7361246
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Apr 2021 20:27:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A7E7361246
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Y7H28wV8s4DtGFsXc8+pHx6vmbPYnvvS+Bs7akfLOts=; b=DMQvTmo+Vc+Gdy1ZuWQfQUa4Q
	ppO8ipAwEAIlijauo0XwP5WPxfKa/BIN7QFoBJyHFsSyS5Z/2rnYa6zOCGIwMqAMaHeQkWzZsGZXv
	2ZzpyZ4/fYcSQhbeX4vZRmfZ3KVcGNkUDN/Xhn9Txw79hqDASvAhhu7EhMAm6jhyjv7tnopkzBk+K
	o6kARvhZTVNvS9wj2uje4k51GbWRI7/EOl1z0r+azS6f/T12n8BHgL+WY46Ofswumz/vkYH37AmiS
	3B4WQVDUSeEAdREY2Hye2x7tZuV8zxFD/u9Jb7kKA8/GeUcqdtJ7EKmJXaI7gVufx3HycqVROVOPA
	UJUlowx6w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUElW-005woW-LF; Wed, 07 Apr 2021 20:27:06 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUElR-005wnc-2r
 for linux-amlogic@lists.infradead.org; Wed, 07 Apr 2021 20:27:03 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3F6D06121E;
 Wed,  7 Apr 2021 20:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617827219;
 bh=DbNJfOATZhRLaLqCciLxAQrVD95vTb6G/WEYWfPZ0HA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IcMrHIEZIDb57hiR7wzXGoNstuGeQ7K1XeYlonLjjOQ9tAcqOarhp8PaJrcPD7PyU
 JO0iUHQ2SxvjovsebRa4NZ54nkkcDrgEWQpkT7fuvlEB0RMEz3T1ZGL/fsOPVEmX4M
 BU7F7maOsVxovcxTBM9hs7VMhO5XyXnRElUxitF0sGNgJmbAS5jADWLlW/hSSDKkpb
 cS+hB3gKRQ36XJ0DyOE7Kz36bqmTFcqDCQPg7zihuBTDpP1V6oWeBkSOTLWz5d+eGe
 ESB6/9ej9vskMv76UXVw6ok0vvMqlhZDIZghnx8/SJyHVApZGE/aOqGV8sdlCmWigc
 Ct8vR5Q20Lvng==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>
Cc: Mark Brown <broonie@kernel.org>, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>,
 alsa-devel@alsa-project.org
Subject: Re: [PATCH] ASoC: meson: axg-fifo: add NO_PERIOD_WAKEUP support
Date: Wed,  7 Apr 2021 21:26:24 +0100
Message-Id: <161782703231.42756.2000858967744578792.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210407145914.311479-1-jbrunet@baylibre.com>
References: <20210407145914.311479-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210407_212701_568807_9EA309BA 
X-CRM114-Status: GOOD (  13.08  )
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

On Wed, 7 Apr 2021 16:59:14 +0200, Jerome Brunet wrote:
> On the AXG family, the fifo irq is not necessary for the HW to operate.
> It is just used to notify that a period has elapsed. If userpace does not
> care for these wakeups (such as pipewire), we are just wasting CPU cycles.
> 
> Add support for NO_PERIOD_WAKEUP and disable irq when they are no needed.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: meson: axg-fifo: add NO_PERIOD_WAKEUP support
      commit: 9be701ec3493d3348723a38f0c19702d710758ce

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
