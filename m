Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAFCEC87FCE
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Jul 2025 22:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rsM6lsoJ/xXcTX7iH4YUxeau519OW+yXxe7nlTZQZ5g=; b=4TtQuyBNggtRkp
	Xgq85R4ogZfCudCfbUHBOubj9YTJmGBmkqefhSFnHGjrawVHKLug2FWFYcWfiPsXG4o1cEfZCal3U
	+E9DMV66JfjXnXoJL0uDmoXRsXekp1iV0DEP8A52IHqxF2nHnvEO/mB1+ALMfWmOrKc3Xk9GrkRE/
	c9p9vBOjFBd3T+Sb2+erfF2P6FJW1SgJspY/K8gSutsuw7ha0RnSU4ymy70USdd32Mx1NXDoq1o9Q
	3VgCpED7eZB68NQZRkVfhzCJHGWIAOHw2HLMlaiixLg6xeRCRH3Sh203DwJ46U0B11voYLPcUazuT
	GhaM6Z32e+uYyA3uCJXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufQgh-0000000Alkx-3Und;
	Fri, 25 Jul 2025 22:14:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufQgf-0000000AlkZ-3YsR
	for linux-amlogic@lists.infradead.org;
	Fri, 25 Jul 2025 22:14:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3559344325;
	Fri, 25 Jul 2025 22:14:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A263C4CEE7;
	Fri, 25 Jul 2025 22:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753481685;
	bh=b8rCfE53wlLuFLBYoVNkRFSwCOM0EuDoIabJG6094zo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=QWLQJ0dyHnW7hOQ4uPERUoDPK/7gpsZUKYA0Zirz+7TTj4L6addhl4RuwgwpF9LyS
	 /DwOdUmNd89MyOdK5CrCumKrOjjh6UEWnP4nC+Hh7blGBFFBsMH6PHnAQwl6UWhZOZ
	 QNPJmHB9OZGNlBI35O0luYIG9Zwt17aQGLV0D6Wnt7CBNt4F0ep1xKIqZCSFZfSXDB
	 kjjl92pX5hItQOhFdg7/t9OnH8p9bBd9S46SzKamlN+wVwTunudiGtYF4oGiu2ZfDv
	 elu2IlRZUv1K7z2emdPNansWBEzOZEEZimX7hUoIBnCUDi9Dsgq14i0s/c0zXfas8o
	 13hsS8DkLMBsQ==
From: Mark Brown <broonie@kernel.org>
To: Sunny Luo <sunny.luo@amlogic.com>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, linux-amlogic@lists.infradead.org, 
 linux-spi@vger.kernel.org, Colin Ian King <colin.i.king@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250725171701.839927-1-colin.i.king@gmail.com>
References: <20250725171701.839927-1-colin.i.king@gmail.com>
Subject: Re: [PATCH][next] spi: SPISG: Fix less than zero comparison on a
 u32 variable
Message-Id: <175348168282.1556893.3635657379454630854.b4-ty@kernel.org>
Date: Fri, 25 Jul 2025 23:14:42 +0100
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-a9b2a
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_151445_918782_3A55C3E8 
X-CRM114-Status: GOOD (  10.14  )
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

On Fri, 25 Jul 2025 18:17:01 +0100, Colin Ian King wrote:
> The check for ns < 0 is always false because variable ns is a u32 which
> is not a signed type. Fix this by making ns a s32 type.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: SPISG: Fix less than zero comparison on a u32 variable
      commit: 2d442a0c781403702de27ccfbc4bb233721585f5

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
