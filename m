Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43E361061B24
	for <linux-amlogic@archiver.kernel.org>; Mon, 30 Mar 2026 22:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FpzP9IbaEs2YTHvE8+K7j5tr/fLZbjhXqifrarRXR40=; b=p7ez+qJ6dEzNuB
	hi2u3twPWDuZ3RPoBAs+FM0GDTX9wc7u2jzoFoPgO6rpWhZMCNKpGPpRGKfMN3Atlq4xtAOYevz8G
	I5SjXE5Rt6O/iuAtG4qSjqlFhUwOfTYSGXVE3MINw3t3LofGPzIeyiwi0CnNXA/3SRvj6iqJlZ+7b
	3UnQStnPrXDgagr5nLXRF/stGDh2S/9YvDenG2wHh/TkbWPSNJXrMrJL94t7x2YdSebXARUF66Urg
	1UWWGZdH5tPobpAIrq04e89PgHfLrrxBu987VO4z9vSE9m2+FaIWtFwkVyUW+ThGcjrhN7BjkQd4/
	yU3c6YrG4TFU+l3YCTXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7LJI-0000000Bz3F-10hx;
	Mon, 30 Mar 2026 22:42:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7LJH-0000000Bz38-1VuE
	for linux-amlogic@lists.infradead.org;
	Mon, 30 Mar 2026 22:42:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5C1D160121;
	Mon, 30 Mar 2026 22:42:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1684C4CEF7;
	Mon, 30 Mar 2026 22:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774910534;
	bh=MiUdjd1ElIy6O+EmAN5j9TphnhlN1KKDDIGXOr0wtvo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=hk9jcoi0C5zFsVz3zow84mFzcKyBLWJ7Hl+PD++Y+8aBg/i1hEPnwl70BERuT3GjE
	 sfUA/QRrW1OmGtjP1MinUn6LFZef8u+dou/UNmn1LuyK3qaBuoMS/grxPSTGwtqcOP
	 dZ16pYk7+YRPockoQ0dzWLY8NJBJQwJen5k7O94OVMx1qjbsZom9c/4nWouOOgcpdZ
	 JN3OOvjuYgKVFwqTMTCzcpijOIpKlBpVXdGZOrWTDQaWZnWvTXrgxjVmIyJbh84GWt
	 JD49jvX8GhK/fXrAsxOq2MZoao2Y1Y+Siz22/ahMV9KatvxGU7J0aI5VvrOE6U2Unv
	 oNcW6N/6GQNZg==
From: Mark Brown <broonie@kernel.org>
To: Liang Yang <liang.yang@amlogic.com>, Feng Chen <feng.chen@amlogic.com>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, Felix Gu <ustc.gu@gmail.com>
Cc: linux-amlogic@lists.infradead.org, linux-spi@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260322-spifc-a4-v1-1-2dc5ebcbe0a9@gmail.com>
References: <20260322-spifc-a4-v1-1-2dc5ebcbe0a9@gmail.com>
Subject: Re: [PATCH] spi: amlogic: spifc-a4: unregister ECC engine on probe
 failure and remove() callback
Message-Id: <177489325833.222960.6647008477014034465.b4-ty@b4>
Date: Mon, 30 Mar 2026 18:54:18 +0100
MIME-Version: 1.0
X-Mailer: b4 0.16-dev-3ac6c
X-Developer-Signature: v=1; a=openpgp-sha256; l=1178; i=broonie@kernel.org;
 h=from:subject:message-id; bh=MiUdjd1ElIy6O+EmAN5j9TphnhlN1KKDDIGXOr0wtvo=;
 b=owGbwMvMwMWocq27KDak/QLjabUkhsxTf5wZ5kwzcFLmv2a9Rmp5TKJbhcKC5sL/jhOO/La4x
 5Zp67uuk9GYhYGRi0FWTJFl7bOMVenhElvnP5r/CmYQKxPYFC5OAZhIkS77f6dmfZ23HC1h554G
 1v1Ps/0qcdN64hYR4+Zn5wRNNex/KzVwP1/pJ9dw327S9Sd1fXXn1E+53zrpv6gx2+7l1WV/OxJ
 X6ZiffKN6pJ3dqtuxY7m5Z/PlP/ujjxrsEZvyy1v822TRhdYnRbnyOK1v1/qyGyk+vWJu7M8fd7
 uicPX5XC77xcfPs+23yjl+/GDWId+ZUgdne0YbPFbnM2s1T5pgVt5iHdvzR9Jj9Qr5Pgf76sWG1
 pOlQucrRbPPtzoqzDSLfQe/tLHrP83pSdLntp684p8dtjtc0uAtl41c4AFP3iUyM84Kf/ZLeenn
 O22K6d1VthsfqpyyWvPWj+PA+03OTMufNkh9/bfOlOsEAA==
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

On Sun, 22 Mar 2026 22:28:45 +0800, Felix Gu wrote:
> spi: amlogic: spifc-a4: unregister ECC engine on probe failure and remove() callback

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-7.0

Thanks!

[1/1] spi: amlogic: spifc-a4: unregister ECC engine on probe failure and remove() callback
      https://git.kernel.org/broonie/spi/c/b0dc7e7c5657

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
