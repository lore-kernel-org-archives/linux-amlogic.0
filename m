Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C2CAC79FB7
	for <linux-amlogic@archiver.kernel.org>; Wed,  9 Sep 2026 15:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XMJ7pFX1RQEyuMyuFCipFVcv+/r9os/1EJNfXOp5RgU=; b=RqubJrAHMFMiEz
	DIYHY0BZO9pUPJ0Pj4t3/71gt358TtV0xN3xEwhMJ4V1ZINMFsI5ptU6fuMuK0tnypNPlXGUB6MHl
	DUgQ9dl1gZpgJyXThlshyssFtPS4TTWA8XhPPGk0dhtAy6pa/GBFokVWET6f95PvCIxH06mMrImM7
	8916GnX3hh1JkvnMqO5W4xVuA/pNjoga7kM08Rhh0z0mTOCuR1Yg6t2gvGsgUF4moDiv/4A2fWvvT
	v0YRaNIOpoh/HkIJFKDDxv+V6FIZvbOvol2BHS/Oai/k3aQLSq9KzSI0TglAY/u2UD5AXFYVSOlat
	gB35IXIMPX1k+zaAIxIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4KcO-0000000CEY3-1Dfn;
	Wed, 09 Sep 2026 15:53:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4KcN-0000000CEXl-1Mfw
	for linux-amlogic@lists.infradead.org;
	Wed, 09 Sep 2026 15:53:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CAF9A43D55;
	Wed,  9 Sep 2026 15:53:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8956C1F00A3A;
	Wed,  9 Sep 2026 15:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788969226;
	bh=5kdBOTMmU5DfSYZP8j6aAUyrVhoCyluz+UsdILKsiG8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=g0kExflE4cDskFAtzSYSAvtEjc57MjJRrxghfBADwQOYEJxtnpJXXsjSSqqlUymzS
	 Glr0THm5T/LQuQvVkPx06QIaXpjZTmkay8Vtji414m6gOzakDovuLk5gmsQO7MjhZw
	 H020EgY95cOqY9AO3S4s3UiBuZ3fJPEMWnUrXGS0dJZdmB18nVIZG+Gq5UtwJclLNr
	 k2BSyiDolCBlFtZuqwoXXfuVgbtQXVku6hByFOEOsat3CMbOUncQ9xKfCIBPdtYoIV
	 CpUp1Od67jVtQ3Co8yMPApplmy+Jc1wwp5zSE9vWOXkoD/j643JY6Hfm7hYyx38ao1
	 3voh7CrazPc/Q==
From: Mark Brown <broonie@kernel.org>
To: sunny.luo@amlogic.com, xianwei.zhao@amlogic.com, 
 Li Youhong <dayou5941@163.com>
Cc: linux-amlogic@lists.infradead.org, linux-spi@vger.kernel.org, 
 Li Youhong <liyouhong@kylinos.cn>
In-Reply-To: <20260831094553.2247003-1-dayou5941@163.com>
References: <20260831094553.2247003-1-dayou5941@163.com>
Subject: Re: [PATCH] spi: amlogic-spisg: check clk_prepare_enable() return
 value
Message-Id: <178896045987.87467.11120635075116589342.b4-ty@b4>
Date: Wed, 09 Sep 2026 14:27:39 +0100
MIME-Version: 1.0
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1130; i=broonie@kernel.org;
 h=from:subject:message-id; bh=0ks4/8O+dv2VXA7aK1fFkmIoucROu9n6J7HpMlSjmNk=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqoYEHZkIrejUJDn83W7ET5BGkOofXAWW+Qgs+P
 w6vcX3bDxiJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaqGBBwAKCRAk1otyXVSH
 0Dx5B/9MNcQRfLJJ2QgfCdNMg2rd6KPW/lyBGzSsQ/KaIVcyhNWEz2RiXCzEOBFA/phpHdEekeD
 VkJTFdh9Ry6RJgMTlViRSOTBKV2SvgqJCJvA0lYI63h7Tl0tSTV5cpnv8nABa2wfIODWCT3kM7r
 v1bgzRgXGgnNLbCZGmmiswV7k13OhpQLWo3A9F3hYPOdqLQJQhiVfHFZx7/PAVmKdg6yncYFSIe
 v2B1hSL1mjRbd7t6P8JTxPhdxJRx09R8lNo2xCN0jzMITqqfc4J4FI6QmpFImy/X2TMJUETll/X
 7KopJb7bQcBR0MwAAhAI4/XV5Lk1RphDRrSAyyhUwCluYPLq
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

On Mon, 31 Aug 2026 17:45:53 +0800, Li Youhong wrote:
> spi: amlogic-spisg: check clk_prepare_enable() return value

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-7.4

Thanks!

[1/1] spi: amlogic-spisg: check clk_prepare_enable() return value
      https://git.kernel.org/broonie/spi/c/c595dcbce20f

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
