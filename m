Return-Path: <SRS0=I2aL=H7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AACA4C433E0
	for <linux-amlogic@archiver.kernel.org>; Mon,  1 Mar 2021 23:36:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4496B61481
	for <linux-amlogic@archiver.kernel.org>; Mon,  1 Mar 2021 23:36:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4496B61481
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c/kSHruLKajNR6P71I/oQ221tqwLN2yUwuoNLoBWJ6c=; b=ygBlSmBTardzP8pOj+yqnE3LkX
	LBKSYzuYWXoekUTztgVuuHbGi/5KiCay7+M1IO+QAyUurG38nZBH9JzPcoPEURlizsIXy6Dg9Sq9Y
	aaWOJQ703LKNCjcNbrLoHkAKx/SgxfRLG6uIaMzjIU3yxdUkSkwLxGUOBU+Rv2/8qsFI/fJ30G1Uv
	EVn1DbQCDTOXHcS9UzVCBppLW+fh92XhIcDVQ9rrFSyqbZGhCNlCQsngmdJ6sVs8EaGHepKQdXOcF
	0W65zFjMzTzxc7FAOGqXgCe4vmqCkJX34hknuXUJiEaozw4NIkR18Udq3NEUHgVmOtVf39IfXqAJa
	f10jSBmg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lGs59-0004xK-CC; Mon, 01 Mar 2021 23:36:07 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lGs56-0004wV-NJ; Mon, 01 Mar 2021 23:36:06 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5BE5060240;
 Mon,  1 Mar 2021 23:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614641763;
 bh=X3zQMo928GW1qVxc5UjuLGk4bT1FV3lRMqtNQ5gZEHQ=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=s1P7a/mjPGC7cZDiw1TfVmHhV0R72JCZggtix7XvoqHKtV3+2Fwj7gNdwveotxJSo
 Ns08mHLd6d4I0ATAfU5c7q+CHXFWUg8Mp1eFs6Y5mQrIPuxn3goxofVqAziZQTkcZF
 HOTb8a6fnL61+In1rc16SLanz4mCK4shbNUmoGBPnWObU8K5exmkrDivVHtT6g1YBI
 aNfRNtO77UHIwhR/FeqXzrJ5i9smW5lMqmZ/+5LSrpX0LfjT/hNvF/nMEQzBvXAj7a
 CA+FMKRSYJuJyWVDppqtP1eWAxmJrTuUAHCqXzKUsH3TGbk5/2IzgbknebgTdJ85lX
 vohvxTS4hHU/Q==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-amlogic@lists.infradead.org,
 Liam Girdwood <lgirdwood@gmail.com>, Kevin Hilman <khilman@baylibre.com>,
 Banajit Goswami <bgoswami@codeaurora.org>, Jaroslav Kysela <perex@perex.cz>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Takashi Iwai <tiwai@suse.com>, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>, alsa-devel@alsa-project.org
In-Reply-To: <20210221153024.453583-1-krzk@kernel.org>
References: <20210221153024.453583-1-krzk@kernel.org>
Subject: Re: [PATCH] ASoC: constify of_phandle_args in snd_soc_get_dai_name()
Message-Id: <161464168095.31144.11030304529781910068.b4-ty@kernel.org>
Date: Mon, 01 Mar 2021 23:34:40 +0000
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210301_183604_916513_D67D3D4A 
X-CRM114-Status: GOOD (  12.14  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sun, 21 Feb 2021 16:30:24 +0100, Krzysztof Kozlowski wrote:
> The pointer to of_phandle_args passed to snd_soc_get_dai_name() and
> of_xlate_dai_name() implementations is not modified.  Since it is being
> used only to translate passed OF node to a DAI name, it should not be
> modified, so mark it as const for correctness and safer code.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: constify of_phandle_args in snd_soc_get_dai_name()
      commit: 54928c5c63c83afd5a1c2a91802a9c37e9a4ff88

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
