Return-Path: <SRS0=kXzT=7W=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7665DC433E1
	for <linux-amlogic@archiver.kernel.org>; Tue,  9 Jun 2020 12:55:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46BD820801
	for <linux-amlogic@archiver.kernel.org>; Tue,  9 Jun 2020 12:55:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bzIUhAG3";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="dNl6PiKG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 46BD820801
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Subject:References
	:In-Reply-To:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yQzyHh3qGXCjOQg9fYXbMoos1GVnF7+OP8RgCzKzbJ8=; b=bzIUhAG3jExdk0
	Gh27ydUcRUGERCF8gYPUrX+0N2mcUPxlncYlQAcivbzmXdI6Iq4ddEEoC8nuFE/QOHGLn8ve2tOW+
	wWpXkRxFc2ybaX53K6EY7/kU8gYznM5VeYCBC4K82xG/CiBee2w2CP2n4KOdx+sts6mnhybe1gLNF
	AOuvGATR/z50zTDKx6RUJgxpnGiVABUh3tsTkd9CQkYzCuCYKiAY5w4s0HrDXG3V7/1XQetZDpyTV
	7DVNDvQJ0NcIIyskozm+YCI4GdcrhM4ABluiqHln1HJ4eg2ARfOmXhDH96T9+irPgb0I2v1XE+xhy
	RhllwUuYXfEix7opX7ng==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jidmE-0005mx-LF; Tue, 09 Jun 2020 12:54:50 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jidmB-0005mI-Sn
 for linux-amlogic@lists.infradead.org; Tue, 09 Jun 2020 12:54:49 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EAC30206A4;
 Tue,  9 Jun 2020 12:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591707283;
 bh=s6DjVd5S/9BMaBHFd1sXcmmcw3hwmnb2raoYKakwRWc=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=dNl6PiKGvSYn9EtRbIRN37OwxVFkRJ6JigXpcIGgtBn7yFIifpMp+FpXxNWy81CP0
 q/TXS0BDniJk36Hp8ST9U0GWXZkSZUuyb3UreVw0rbKlh8iRijWZ4iAza/1s8Ryruk
 cIEQ4UReD6Qw6TSMUeS7Gr/2vEIR1iZUR3KQ+I40=
Date: Tue, 09 Jun 2020 13:54:41 +0100
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 khilman@baylibre.com, trivial@kernel.org, tiwai@suse.com,
 linux-amlogic@lists.infradead.org, lgirdwood@gmail.com, jbrunet@baylibre.com,
 perex@perex.cz, Pavel Machek <pavel@ucw.cz>
In-Reply-To: <20200606153103.GA17905@amd>
References: <20200606153103.GA17905@amd>
Subject: Re: [PATCH] soc/meson: add missing free_irq() in error path
Message-Id: <159170728116.39758.7078171173608119495.b4-ty@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200609_055447_952144_0AD530CC 
X-CRM114-Status: GOOD (  12.26  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sat, 6 Jun 2020 17:31:03 +0200, Pavel Machek wrote:
> free_irq() is missing in case of error, fix that.
> 
> Signed-off-by: Pavel Machek (CIP) <pavel@denx.de>
> 
> diff --git a/sound/soc/meson/axg-fifo.c b/sound/soc/meson/axg-fifo.c
> index 2e9b56b29d31..b2e867113226 100644
> --- a/sound/soc/meson/axg-fifo.c
> +++ b/sound/soc/meson/axg-fifo.c
> @@ -249,7 +249,7 @@ int axg_fifo_pcm_open(struct snd_soc_component *component,
>  	/* Enable pclk to access registers and clock the fifo ip */
>  	ret = clk_prepare_enable(fifo->pclk);
>  	if (ret)
> -		return ret;
> +		goto free_irq;
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: meson: add missing free_irq() in error path
      commit: 3b8a299a58b2afce464ae11324b59dcf0f1d10a7

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
