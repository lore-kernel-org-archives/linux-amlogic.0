Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C17D606A329
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Nov 2026 11:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wiZaVr6b;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=beiGC7cT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=jHlk+6X0Kt1JSkC6oPDM8ZvDNeGASKqBOSLGSCfFAbE=; b=wiZaVr6b7b1GubvRMMFvNURFpD
	89i3IA7x1d09WlDdEX1wNjCHthFBQMXDKaze2+nqn/QeAcQfZq1SXrYWfJVnB2lm9nv7EK0n/uEFw
	Fitjv4mpNhnl6D7Y36aSdsZBlMkH/Wm2XajtYTMindzU42DlHdxS71fGrAAEgc/RW4GxJnxREypkp
	XSQbAFiSAeXp1+UPnUmIzcsX5qNEGU9kOvJQcNp97X+ktg7LrkYzw90qHdqkkp9p2vzbgmw6HrAcy
	ycWfNn1TP6tj/mKKrm4fDpxdRruulRaX8a4VMkactM1Tui8lWdc/2R5b1FlC9VtHVTjzbUWkhWV4d
	ekrngwkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOD82-00000002IL2-2zxJ;
	Tue, 03 Nov 2026 11:56:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOD81-00000002IKk-0jDe
	for linux-amlogic@lists.infradead.org;
	Tue, 03 Nov 2026 11:56:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 89C2F60008;
	Tue,  3 Nov 2026 11:56:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 259C11F000C1;
	Tue,  3 Nov 2026 11:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793706996;
	bh=jIxAGmi/bgc1YwjeYYPC92LW6SDaXY3wvvNSqHMVOzo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=beiGC7cTr4lU3Q7w6zlSeY0xJntwgWJsFPmvv061El7XYesdH4hNmWlXfgEBuaxR1
	 /3wy1vmHwS1+qakvR4rUETDJ6HlORLHb+V5yC+hrPAsQ8+do9pGo9kNLHSKgXsreP9
	 Es8OPmwoSlMXLGyXLwXjyR3YTz8lMdltfWBDdbgYsaUsPDH6caoxk6QMC061jKjohd
	 nYpUUOZsnvxNKqBqmPfAfZ/ivQC/XKPn7R/IKjgeCrHsHReigB+OsRPCQiVdDYdI4y
	 ejm8gMOF10K1g+GP5kbqkq77GCZtTju5UHIuQdVbZ4A/Ij7c7PUt6Tfc7U7t37K3Bw
	 A8DlBZfKO0QMg==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 59166253B042;
	Tue, 03 Nov 2026 11:56:34 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Sunny Luo <sunny.luo@amlogic.com>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, Myeonghun Pak <mhun512@gmail.com>
Cc: Li Youhong <liyouhong@kylinos.cn>, linux-spi@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Ijae Kim <ae878000@gmail.com>
In-Reply-To: <20260913043745.35022-1-mhun512@gmail.com>
References: <20260913043745.35022-1-mhun512@gmail.com>
Subject: Re: [PATCH] spi: amlogic-spisg: Balance runtime PM and clock
 cleanup
Message-Id: <179366146354.2186205.11571999677156537831.b4-ty@b4>
Date: Mon, 02 Nov 2026 23:17:43 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mailer: b4 0.17-dev
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, 13 Sep 2026 00:37:45 -0400, Myeonghun Pak wrote:
> spi: amlogic-spisg: Balance runtime PM and clock cleanup

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-7.5

Thanks!

[1/1] spi: amlogic-spisg: Balance runtime PM and clock cleanup
      https://git.kernel.org/broonie/spi/c/67e3d31893ab

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
