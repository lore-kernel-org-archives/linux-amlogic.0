Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E2FAF53D7E
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Mar 2026 17:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8//27lQTjUXqRwZl7bR6EaRKykcg/9HpqczNX4wAGLI=; b=q34bW/LeggIOtW
	GUrkdLOCnUhHUP39ni7vTrnnVS0dYZYxhXspqTfoawf3cPu62kw1kezMo2wP08dV+FudBpshYOHOu
	TXP7XNl0yCXsi1ARxfTDNNvOq+t8lDOckE+QH9Os8iESVnXJXPfiwnIKPbRYR5hybBK9xG/PtPucc
	8FCTilqnjQgx7JJq73YxAVNnZE1AkN8WW4UfbSG/bIUqqzIPlcrMgHU0JJyiW0ssrnl0xMpEDneRJ
	4ZVVQlgdJSDp1U0IkZNorjR2+RLHOM4p62VlCdhM2IAC+rmWXwHUq8HxH4iEsQFKqTKG8rJAB2/oN
	G+Go1gjQhFIYTmrF8hLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2C7f-00000004cNu-1xDI;
	Mon, 16 Mar 2026 17:52:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2C7d-00000004cMy-0D6z
	for linux-amlogic@lists.infradead.org;
	Mon, 16 Mar 2026 17:52:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BF76D44289;
	Mon, 16 Mar 2026 17:52:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5536AC19421;
	Mon, 16 Mar 2026 17:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773683576;
	bh=QK9n0w9Nsd82E8ZRQPvx4wNiypPjvrWgPongLIvYxw8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=hWdcq7Gk0UpZSd2FAQ+mpJVmd/1+N20oRMgYfrvW5NO0DDtCuPdw+GdkpSIfKwd0U
	 w4SM6KpZFB5ObAXtkSTmphSQTJ9Nwjv890HFx7fI6bGdTWUjs3bSrshHQS9FrTBNAj
	 k+lb2HrnYG0wALwHZuj884GvCcpSarhqzDsSLMgMwlWQS4koAqqL3Tu5Khi3uY94bV
	 6ODEjm3jtIyjmxHqW//8Kkk6bUyDQKYtR23PZ2edrOV1yNyXSMnpKHFcV16NNk000q
	 6FmJ51deW7Qq9BQEYkQ6cWWE6IqUnYoD8GVs/U3HSuvjVGxtBSg/m2QvXgaQEC86Wh
	 uB6Xj/02I/fLA==
From: Mark Brown <broonie@kernel.org>
To: Liang Yang <liang.yang@amlogic.com>, Feng Chen <feng.chen@amlogic.com>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, Felix Gu <ustc.gu@gmail.com>
Cc: linux-amlogic@lists.infradead.org, linux-spi@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260308-spifc-a4-1-v1-1-77e286c26832@gmail.com>
References: <20260308-spifc-a4-1-v1-1-77e286c26832@gmail.com>
Subject: Re: [PATCH] spi: amlogic: spifc-a4: Remove redundant clock cleanup
Message-Id: <177368357508.147197.6859003613320300575.b4-ty@kernel.org>
Date: Mon, 16 Mar 2026 17:52:55 +0000
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-c239c
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_105257_112585_BBA91000 
X-CRM114-Status: GOOD (  10.68  )
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

On Sun, 08 Mar 2026 21:34:55 +0800, Felix Gu wrote:
> The driver uses devm_clk_get_enabled() which enables the clock and
> registers a callback to automatically disable it when the device
> is unbound.
> 
> Remove the redundant aml_sfc_disable_clk() call in the error paths
> and remove callback.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: amlogic: spifc-a4: Remove redundant clock cleanup
      https://git.kernel.org/broonie/misc/c/a00da54d06f4

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
