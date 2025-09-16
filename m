Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3442CAC598
	for <linux-amlogic@archiver.kernel.org>; Tue, 16 Sep 2025 13:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ywi3d5NPbXUVapDIwnZoyqzdhowP/LNezpFEtgmjK/0=; b=z6yWb1AW8MA/vR
	ubEFq/uzpfjiNXSAi9rkZn3t/MGTZBkhPUkKFXE+FjA59cLSttWUjqeaweaSJUuBv7dFFtQa5YvIu
	vpakn64Yk4Z8pA6h/Zpdupo5U3IYjZcH43SfN0l8COnjX1n1KDdn3ZYvMHadnENhmk7olsP+nLrKv
	r1Kw0zNCuFe8SENXo1u3V4euKVWNgqvWevnH0wCBhp8L7PCYmk96BrMHIYbzoJH1Q6xZTeh2z8YQd
	ECdryAyWWMVOgYWoMelWz+vFV+zfeiXawq+22BW6so1iRx3qTqoX24ddK70NScOsCu93dcTqedolJ
	NMEtNJeLPvVm5L+3jhQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyVYq-00000007u10-1Q6L;
	Tue, 16 Sep 2025 13:17:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyVYo-00000007u0o-3rsR
	for linux-amlogic@lists.infradead.org;
	Tue, 16 Sep 2025 13:17:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5DBDF6013B;
	Tue, 16 Sep 2025 13:17:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BB14C4CEF0;
	Tue, 16 Sep 2025 13:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758028650;
	bh=3t8ZsnXaWXeJN2lg5VW6FMHXGeclZ+Rixxfa9OmBFFE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=YBSaukzjv01zvCYkxPcJBGQq6SRcosbJBGyOTjLSFxR7AqCJyuX7eEUl0Nf9yD5TZ
	 woPRfu9dNVdrt8hUGmWk6JUzIjrCEKbMF6Lu3ypmVkboe+wf6GM/viuEMoEi1+HMgD
	 yiXTo+BPZRRHeMQabwUHBWDTW50xGtN8/MAkBj+nEgmENbS+GV4257HLVcvtrInp0k
	 ZZZQs5W2cwxd7C0HsxnwFFzT09toh9nAwpOOPCTs7kgH6L54hFHP5igwhOjxfeimVF
	 Q1pB7BKjLsB+PxHou65oqrmQxx7WwQXUWjtegWxBv9Qgh4XgO6z8vryT1zCffx+rli
	 oRkpGo/2bDyiA==
From: Mark Brown <broonie@kernel.org>
To: Liang Yang <liang.yang@amlogic.com>, Feng Chen <feng.chen@amlogic.com>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, linux-amlogic@lists.infradead.org, 
 linux-spi@vger.kernel.org, Colin Ian King <colin.i.king@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250913201612.1338217-1-colin.i.king@gmail.com>
References: <20250913201612.1338217-1-colin.i.king@gmail.com>
Subject: Re: [PATCH][next] spi: amlogic: Fix error checking on regmap_write
 call
Message-Id: <175802864838.134241.18442416794301154547.b4-ty@kernel.org>
Date: Tue, 16 Sep 2025 14:17:28 +0100
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-56183
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

On Sat, 13 Sep 2025 21:16:11 +0100, Colin Ian King wrote:
> Currently a call to regmap_write is not being error checked because the
> return checke is being performed on the variable ret and this variable
> is not assigned the return value from the regmap_write call. Fix this
> by adding in the missing assignment.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: amlogic: Fix error checking on regmap_write call
      commit: 18dda9eb9e11b2aeec73cbe2a56ab2f862841ba4

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
