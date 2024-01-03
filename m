Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8A8FC3DA6E
	for <linux-amlogic@archiver.kernel.org>; Wed,  3 Jan 2024 20:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sUCJT16vduZ6w6b5m94qVwPObKxXlA0dqgVbPzJPVrc=; b=nkSvTvxRuzBUeC
	2sYFaG/Uhi5e6FUhwLGlwW2Gq8EXD8FExY6c+Yt5ocWmrfbzqN1voSs2bRjZCRGILcx0lGWnhfZus
	ervACMglHNnYBQgHW7FZ2TMMmP4S6PIYN34qKY1Q4ixkrbaE6VEwTx1S97Btsip+M2c9fawVF7tSt
	Ry3SzpGhkNnqeYwl8+flN/vxChvZfGkWBQ/bcubaQxOtTrt/k4NY4q/mFeWajv1hNvHZGjHXaNZTU
	EqC6e+hUusYDZLy6QrBGRsaY8B4OMFmJ7ejWBHkYSSmC1K9nNqX+I1DOPxK2c9Q6GdqQZ+ajkbO8I
	+cnLCEvOkN0h6ol3AgXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rL7nQ-00C2hy-1R;
	Wed, 03 Jan 2024 20:25:00 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rL7nM-00C2go-2l;
	Wed, 03 Jan 2024 20:24:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 38AA4615BF;
	Wed,  3 Jan 2024 20:24:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8DDEC433C7;
	Wed,  3 Jan 2024 20:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704313495;
	bh=7vxiVQamR3pRKvlcOZeP+eFNosrKWWV5Djb3Z0x4Wa4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=UsfZ5GLY4QmiNBLcKHbUuoGVupm7p8Kps4Q30yw/O78ZuO1Rp+Nk0o4JmditS5dAC
	 EpZKGZLk3FPOk/mDj2JbHjPPdXTeD/EeT2GC9Kyyq2xFbrJD5jlz5c+gfXTsTTv1ge
	 L2Zpc5ldsfTj2lMupkyHNhu4tH0KGt8U+XGjyu0xqjZXomchIQ3PsMKHo1F91+EkPO
	 Ca8xH1Bg1TSSQlnum6PqcpK6Hy5gbbGd+qE+cwprYoDdTzDWwSArztU8rVJZ5AplRj
	 1YnPmqBKB6NGZKEHMuZIu6+lWG5uuhUOA/4l2BKL5JKLFpaKUZsXgrF206ZqZ9pO/U
	 MNllPsFqa+A2A==
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20240103-meson-enum-val-v1-0-424af7a8fb91@kernel.org>
References: <20240103-meson-enum-val-v1-0-424af7a8fb91@kernel.org>
Subject: Re: [PATCH 0/4] ASoC: meson: Fix issues with LibreTech Saphire
Message-Id: <170431349265.3159626.5476717975051420559.b4-ty@kernel.org>
Date: Wed, 03 Jan 2024 20:24:52 +0000
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-0438c
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240103_122456_937904_75D8B723 
X-CRM114-Status: GOOD (  10.99  )
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

On Wed, 03 Jan 2024 18:34:00 +0000, Mark Brown wrote:
> This fixes a few issues I identified when integrating a LibreTech
> Saphire (based on S905D3) into my CI.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: meson: g12a-toacodec: Validate written enum values
      commit: 3150b70e944ead909260285dfb5707d0bedcf87b
[2/4] ASoC: meson: g12a-tohdmitx: Validate written enum values
      commit: 1e001206804be3f3d21f4a1cf16e5d059d75643f
[3/4] ASoC: meson: g12a-toacodec: Fix event generation
      commit: 172c88244b5f2d3375403ebb504d407be0fded59
[4/4] ASoC: meson: g12a-tohdmitx: Fix event generation for S/PDIF mux
      commit: b036d8ef3120b996751495ce25994eea58032a98

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
