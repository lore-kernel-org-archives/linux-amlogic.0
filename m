Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BC7EC48BC3
	for <linux-amlogic@archiver.kernel.org>; Wed, 14 Feb 2024 13:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VzuUxlZJY6V6qMwpRXNxtGDU/lNbYt0i09o276EkXa0=; b=kbPXzxGZdcqcoc
	HBVdtsJQ23/TsnX9AGJ0iItuRjSjkfREKLfIF5hxul6L9vdwLvscz4qJRn2/at1hoh2TjARjxxWuo
	hBw7ZZWTueKu+Hoj4/WnsP9eIlwi00K/fvtuQawgQsHINA2/noeyEdtu5Qv9ML/qVmPT53UjBtkol
	MmzvZDLuaiLYIo+THtDv+8ZZqQDs6PUfBcXwLTq8Y3IGuha3vTJoYt3cpa1oHCt7jsY7PtekZSGiU
	P3MzJ5JcJDxvrkaIvZhH1KwBKa0YhHoCBjFO675fNfrdcF1uy5rdJhE7LycGhb5YqV3kuLOQqlOU7
	thaGA6bjYwspftUvDnNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raFDV-0000000Czrv-0Hf8;
	Wed, 14 Feb 2024 13:22:25 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raFDF-0000000CznM-2gll;
	Wed, 14 Feb 2024 13:22:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 75A9B61953;
	Wed, 14 Feb 2024 13:22:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF6E5C43390;
	Wed, 14 Feb 2024 13:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707916928;
	bh=3BhU0aZnn35CAZKdM6PG56ZetB26JCBoUcsKfsvxGTk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=sX/UcCP3s3y2QCF0191UjJyD2CJK84+XSRUiI1nfqhs8x6EgXD4u/hDmD6bigwF0/
	 j4AjeSgE3JEtXKxEFmPBtkU8LZVYahLjimx/yREgHv32imHWfpSwWWpju+eb1e06kd
	 0f5MrjyH0sPnMVLVopaWMcRaet7EWXbGXir6Vi4F1W+jyDvOUE7z4uF2BpAN9JxIUe
	 iux4t/Hw7uSnQzEdn2E37Z0Nf5bJUGDU0uyQb1vVPmQGo/5OW7xy2xejDh9ixeJnrI
	 U2CE6YqI+unaEX68jDwd/JNsVxnsOHKrkBbcsNSwIGwOkG0xbFae2+1zSCxzB0hXD9
	 b73jVOR6qSvnA==
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
In-Reply-To: <20240213215807.3326688-1-jbrunet@baylibre.com>
References: <20240213215807.3326688-1-jbrunet@baylibre.com>
Subject: Re: [PATCH v2 0/2] ASoC: meson: aiu: fix function pointer type
 mismatch
Message-Id: <170791692451.143237.6316282376548391909.b4-ty@kernel.org>
Date: Wed, 14 Feb 2024 13:22:04 +0000
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-a684c
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240214_052209_768424_02BC43EF 
X-CRM114-Status: GOOD (  12.25  )
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

On Tue, 13 Feb 2024 22:58:02 +0100, Jerome Brunet wrote:
> This patchset fixes 2 -Wcast-function-type-strict warning in amlogic
> audio drivers with clang 16.
> 
> Changes since v1: [0]
> * use devm_clk_get_enabled() instead of adding a dedicated helper in each
>   driver.
> * Split the patch, 1 per fixed commit to make it easier for stable.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: meson: aiu: fix function pointer type mismatch
      commit: 98ac85a00f31d2e9d5452b825a9ed0153d934043
[2/2] ASoC: meson: t9015: fix function pointer type mismatch
      commit: 5ad992c71b6a8e8a547954addc7af9fbde6ca10a

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
