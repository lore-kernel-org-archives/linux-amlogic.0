Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 557E7CD343B
	for <linux-amlogic@archiver.kernel.org>; Thu,  7 May 2026 14:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2/ojS0+9HHjiB0lRloTNL/N3CuiQ/+zxbwEpwT9r0Mc=; b=fSQqK7SbGpTvt9
	qdpAj6PqmVtIZ2r+by/yJivjUOIsUKLWSYjSiAI3djLwsHQS4MLZ9Hr3Zonnn/kyRoThafVdNl7hq
	mTmDpK9wSu9H28uIIrgDg0o63IMjtSEU6UugyOPZQ64aoY3E2Qik+XBSgn6bmw0+JAPQsEZnoPMXz
	sozuxBokiVVqRFqF95QKoJvo4Ul5h0+KITuIwUi/ZwZxahk17dw6YA7MefWhwGgcRYXv83HqfOOsX
	8lMiByDP83W5oogY0qdlUZbFbESSZ/9EP+Qa1bBXwfPW3L53XHYrNa32ch+hAJAVQv6GlJhOHVTY4
	PnzEM+cL8Iie6ekxgSOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKzvx-000000045W9-3WMN;
	Thu, 07 May 2026 14:42:37 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKzvx-000000045Vx-0yN3
	for linux-amlogic@lists.infradead.org;
	Thu, 07 May 2026 14:42:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E0DDB60181;
	Thu,  7 May 2026 14:42:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D9B7C2BCB2;
	Thu,  7 May 2026 14:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778164955;
	bh=KCX3N2x1ol+I49/DTQ1+oZRTrXDmnXU69S4wRqEshBY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Lgex9zLPFUXvGoh3Fd8qSnVoRYLjxpJmChkOW8Do9qhjrmdqCsIUSq7uFM6E/K0bF
	 UO1kyz/4EJS/Gar4wnYK5y0czE3T/hP1bj0zqIzLWYzKQ/ZNBkYme7ySdcXeYkOgu+
	 SrAskf1jAZ9vhNW4X7WdNoR9oHaTq74RJDw2jsyWhk6KVC4+flC+ZhOdSrCC98M7Em
	 6Nicsp7Z+mNM8cPig7puQptrJtSK4WoW6tmDCHvV9GylGCCj6DefWDDMwLHmMgGW6J
	 wijoKbSFe1X1FJenol0a1VnVx2ZNbE+JfpIs6DHaPnwfVNqmEEqeZZhjltlFqPVRLY
	 q7Crk+K48S8NA==
From: Mark Brown <broonie@kernel.org>
To: sunny.luo@amlogic.com, Stepan Ionichev <sozdayvek@gmail.com>
Cc: xianwei.zhao@amlogic.com, linux-amlogic@lists.infradead.org, 
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260506183513.482-1-sozdayvek@gmail.com>
References: <20260506183513.482-1-sozdayvek@gmail.com>
Subject: Re: [PATCH] spi: amlogic-spisg: drop misleading NULL check on
 exdesc
Message-Id: <177814235817.749715.9876596107513114221.b4-ty@b4>
Date: Thu, 07 May 2026 17:25:58 +0900
MIME-Version: 1.0
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1129; i=broonie@kernel.org;
 h=from:subject:message-id; bh=KCX3N2x1ol+I49/DTQ1+oZRTrXDmnXU69S4wRqEshBY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp/KTZvdxWwUlXuiOEDiIKk8B9yMKA4zhQvM3ak
 W4npfMS+oSJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCafyk2QAKCRAk1otyXVSH
 0FVfB/40AuY8Cg0XYUtbrUCfRo3oYFbHVIA6foa6QyeMJEKVRDSHgUOKBYHTjYvl0H5kzvLHqgJ
 AC3TVs7hQ0zTWSo3jOd0iLeGd2izDXyc7GgSUsZOb3G2m69YECBK5QIVPo7cgMmj9peq9cQR8nT
 psRPH/A1PH8oFIrf0+6eluvqIOKxQBWUwYGlbJMQVwmOUdka0OGKwpEveGwlOdobVS3G7SgIane
 wtqwQCmJdGySNpkxtNDFiaIKlhzWOWrMfGAXCgHn5s3TTf2lu3b4cD1DM4MMToskfOB5iCEAqdF
 lGN5KRuQ74qduuUbnjZn6Q5p8r3JPdHsKTq+QV0tMN9y2V/M
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

On Wed, 06 May 2026 23:35:12 +0500, Stepan Ionichev wrote:
> spi: amlogic-spisg: drop misleading NULL check on exdesc

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-7.2

Thanks!

[1/1] spi: amlogic-spisg: drop misleading NULL check on exdesc
      https://git.kernel.org/broonie/spi/c/54725e3049e1

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
