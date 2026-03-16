Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DB1AF30297
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Mar 2026 01:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G92Hy3mf0hCTFoqOmEI01X9YFMMv3DFxYg+LY71lbw8=; b=ViiV+vvjRi5hzF
	wwnW5kuSkeUZoCfWcJ7kha6F12lCJmRD8rR6foiTxvxY2bcOpCu+vT8IjC4DRPEpyzZPEt7hImEGC
	YL2cWJGvO6ZTRIfrfOggeIyeNJWAdejW+MTuck8NGpDwSqMqsWTgfMqBfYJHqqwMcds8b7UMjGjQh
	ZU4My0XPA8080seu877xD3au1HhyJehgaduSd4rN8BxNCvoTI+2fNbenO/Fqzji1bEcBVT19fF6L8
	9TPj23ynyBzrSD7Boc40+SyWX1fKFvaYA0K3npfPWhMwIC6Rh9vI6FK2a2meqP8zoT2U3LyP4g2Y6
	BC2rZyWOqC1JBoDXL6sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1wux-0000000370v-46jY;
	Mon, 16 Mar 2026 01:38:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1wuX-000000036e9-0ASO
	for linux-amlogic@lists.infradead.org;
	Mon, 16 Mar 2026 01:38:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 316DF600CB;
	Mon, 16 Mar 2026 01:38:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A189C19425;
	Mon, 16 Mar 2026 01:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773625103;
	bh=d/9LTutW2/sfbxpaiA7+GoIDQgSxqq4jU+iCqYYTkk8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ICv2+T1UU+THq3X8u997+aTGt4J6+WNH6l0bMFk0TrnmdEoo8cLrq/ldPkKYwiKzA
	 1VEKlzVQJ4pzGHsuvZAbVc6VH8wz/CfkHtwGYkfoQMZDjrXiQAQ5SiihcRpacX4mfU
	 tZvya1idwUCBjVe/FNnIDYEFV9Esl1dlAgivgEAOa52iUSBB+IkN6V2+Qqm5YEfhp/
	 NOkwgv7RYBlVCGjJdiR9aw+O3orEufmRpRFW8EwkahELdbHMJG3KvWY1bAR9UWJdkl
	 /pjT4YT4bJQaOSENcU5a6hybQ7N+RAHyyQDhaWeQ93QB/ujW2x7wmWfPymRRL/FfjO
	 eGeFFTmHcBh7A==
From: Mark Brown <broonie@kernel.org>
To: Sunny Luo <sunny.luo@amlogic.com>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, Felix Gu <ustc.gu@gmail.com>
Cc: linux-amlogic@lists.infradead.org, linux-spi@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260308-spisg-1-v1-1-4e209faf228d@gmail.com>
References: <20260308-spisg-1-v1-1-4e209faf228d@gmail.com>
Subject: Re: [PATCH] spi: amlogic-spisg: Use IS_ERR() instead of
 IS_ERR_OR_NULL()
Message-Id: <177362379342.208027.8833588835159295792.b4-ty@kernel.org>
Date: Mon, 16 Mar 2026 01:16:33 +0000
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-5154a
X-Developer-Signature: v=1; a=openpgp-sha256; l=1130; i=broonie@kernel.org;
 h=from:subject:message-id; bh=d/9LTutW2/sfbxpaiA7+GoIDQgSxqq4jU+iCqYYTkk8=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpt18NV87NGk4vInJUniwWubl2ofuZqX3p87FdJ
 8auBKVRhgWJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCabdfDQAKCRAk1otyXVSH
 0KwHB/wMmqc29o88Kcu690SET5mIfjY+xqLFm9ieRGtC2mhTLlkoGDqWGFp2ZNYPOwe7UYme6xs
 6Z6nRBP927eEZd60pajKacR4Tk+aCYUv7aiUbVOhZUKql2GA0SFuXjjcy/m0MjfQKY07GyL8ZY3
 pgNbQ9K57MBd6409tTZP8uMGXoRsaWCtUIJSWyJ5nM50T6C59I8QK6uot4VgpzWHP7yPwQWLnos
 qlZ12zF9gherDqq5ojDrRinOiV2eHBt1ihK4f2BkAFxuIPHiieo8ysRRUpjv3IKFUSzo6SsVdYX
 aIUnjXSwOA4zo69ANca9lHEnu+JWPmCfbVTI/DGcH+6WeBqM
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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

On Sun, 08 Mar 2026 14:59:50 +0800, Felix Gu wrote:
> spi: amlogic-spisg: Use IS_ERR() instead of IS_ERR_OR_NULL()

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-7.1

Thanks!

[1/1] spi: amlogic-spisg: Use IS_ERR() instead of IS_ERR_OR_NULL()
      https://git.kernel.org/broonie/spi/c/8abf84f76a54

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
