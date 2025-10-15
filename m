Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93200CCD195
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 Oct 2025 18:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vwKOdL51UhJtuAaKeTYV3Hvzl7T7ZyAb378TkUx6DwY=; b=K4XshbBqaynbOr
	1A2awBjl8ItRspfia6AHbehPuDNHxw0vRY2z9P1bfciXGUIH9gxwxH8KpSk2vqNX9iFWNRxHb6Cx2
	rf4ZjgrJGYv/u7tD79CHC02SQJ/XGvjMCLzhj+G1K8d1ccWBj8moISSfSX0VD7jmwvQzTxHMH8ur+
	XEON8sMP1anH9Mm9jNcEOgNlB01Eh8u490jWndVIfGRsSs1e1J+8eZKqprRBXr63cwdw1bDJH+RDw
	0hSnh9C7hljFumAE0/LN59svSHBm1Mdef79ONx5afTrgX0XlCptaGn3fTXZaBdXzgONnUajLj7eQK
	K13Y9NJ14x+0ZqPEJkow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v96QY-00000002dWO-1tEu;
	Wed, 15 Oct 2025 18:40:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v96QW-00000002dWG-2phL
	for linux-amlogic@lists.infradead.org;
	Wed, 15 Oct 2025 18:40:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 17E086270E;
	Wed, 15 Oct 2025 18:40:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F4B3C4CEF8;
	Wed, 15 Oct 2025 18:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760553643;
	bh=H0LK3jf58lHqeQSZDBy/bGvSR2+1yiWmpq9cIX0g0yM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=MEchDQXsLQPsMXfoG1lbrsBUKoQBou/7BZs5sd9mxgkrzpATNpdaoLyp4mgTZ9DCE
	 ov8yw3FCsnCDYz6RsqM4nyqS9s0FnP/6lbn9Im/xet1blK/nnOyRBqlmLN31vEAxiH
	 sXg5lWfhp4YA7gxna4aj4tdLYKOca58rHxnsDqMKHCTWHFA1H76hc2CbrctceGWIYN
	 DaLoNsjlPzOJaRtXTq1j/pZKi6Xy0BY0/yPBmposyHTqfNwq0lKQO4O3cqRXKOVh71
	 jBaMVFC/T3MiT9RAoLpklEDe5wyE799oSecjZbBUamr2qs7BvYHZFi1V5K7iPFgl1O
	 GOGSH2O9SlhJQ==
From: Mark Brown <broonie@kernel.org>
To: Liang Yang <liang.yang@amlogic.com>, Feng Chen <feng.chen@amlogic.com>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, linux-spi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20251015-fix-spifc-a4-v1-1-08e0900e5b7e@amlogic.com>
References: <20251015-fix-spifc-a4-v1-1-08e0900e5b7e@amlogic.com>
Subject: Re: [PATCH] spi: amlogic: fix spifc build error
Message-Id: <176055364173.227902.13691115706455809982.b4-ty@kernel.org>
Date: Wed, 15 Oct 2025 19:40:41 +0100
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-2a268
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

On Wed, 15 Oct 2025 15:36:59 +0800, Xianwei Zhao wrote:
> There is an error building when
> Compiler version: gcc (GCC) 14.3.0
> Assembler version: GNU assembler (GNU Binutils) 2.44
> "
>  Error log:
>  WARNING: modpost: missing MODULE_DESCRIPTION() in arch/arm/probes/kprobes/test-kprobes.o
>  ERROR: modpost: "__ffsdi2" [drivers/spi/spi-amlogic-spifc-a4.ko] undefined!
> "
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: amlogic: fix spifc build error
      commit: 6b6e03106163458716c47df2baa9ad08ed4ddb0e

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
