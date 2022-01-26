Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE6B8C2BA4C
	for <linux-amlogic@archiver.kernel.org>; Wed, 26 Jan 2022 17:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+FANLvCdp1n1ZlSQncavEHXtv1gAiBJcl0AxLBc4gSQ=; b=i4rLcW0g0yWZVI
	KH301TaGUvUCMiyTRQpN49+idQddkDKz76uW+7ArcW9uL9vXNSoU/a1IJDT3ylkFEgEBaweoJ/ulX
	zHqJH2493MxKSsz/IdWxG7EdCeo8AfvwJBSJ33b36RQAyTfplx7JnG0riyofdLGc6cshf2pstYtTl
	0gPGE4lzIjnk0oK31CuLDSoNBL4mWo1Ym/F7X13ayknj6Q1MFE9PgthkqTxRdNm01B/8+Iz9lrYHf
	xT6g1gBZTj8hYtlyucTP9HOCFJpQHXrQ8gUfenh5HI/jiivky3fnZ7jB/SD2b6IsTP/sKcByQLxsb
	mGcKsV5NcQM6e8Ek3waQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nClg0-00Cpv1-Ql; Wed, 26 Jan 2022 17:01:44 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCkLv-00CL4i-2h; Wed, 26 Jan 2022 15:36:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5417C61931;
 Wed, 26 Jan 2022 15:36:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65D3EC340EB;
 Wed, 26 Jan 2022 15:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643211414;
 bh=wWo760c3ezeEk09F3+obtM0z7sicJxM+6AeAwTTQAAE=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=Gl6FticAcyYgFSFBneq5eeEQEUJs3teNa8q8gz8tpexA77dZRw9TItqPGenVMzSkZ
 LR4d3lj44bOsdLKIWYjAp16hM98kk47gYa9RG9LEQt332oJf3kpCFur0nb1aum+pt3
 fCRG+AlQEKW/CnwvTHN8D9SWpIiDyA+Mjp2Hjp27JuDBnigGaEtWCAUVw9RVC56XWa
 nEdXXQeBNwKS5LvoSjyC0ogeoiWXg/Q8ooF/5KKxHdRsQkNxeAEbEJcrbr/4ZfSE9P
 Zrin/YdJhxz4gFjO6wum15o6CdkobA0IXGpPQBsLRXlgICh9YZ+oyB8vZmzURwKnH1
 xrkjXfmysyW4A==
From: Mark Brown <broonie@kernel.org>
To: linux-spi@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Miaoqian Lin <linmq006@gmail.com>, linux-kernel@vger.kernel.org,
 Kevin Hilman <khilman@baylibre.com>, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
In-Reply-To: <20220126110447.24549-1-linmq006@gmail.com>
References: <20220126110447.24549-1-linmq006@gmail.com>
Subject: Re: [PATCH] spi: meson-spicc: add IRQ check in meson_spicc_probe
Message-Id: <164321141213.490397.12590014811818910927.b4-ty@kernel.org>
Date: Wed, 26 Jan 2022 15:36:52 +0000
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220126_073655_217555_B491EA8B 
X-CRM114-Status: GOOD (  13.17  )
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

On Wed, 26 Jan 2022 11:04:47 +0000, Miaoqian Lin wrote:
> This check misses checking for  platform_get_irq()'s call and may passes
> the negative error codes to devm_request_irq(), which takes unsigned IRQ #,
> causing it to fail with -EINVAL, overriding an original error code.
> Stop calling devm_request_irq() with invalid IRQ #s.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-linus

Thanks!

[1/1] spi: meson-spicc: add IRQ check in meson_spicc_probe
      commit: e937440f7fc444a3e3f1fb75ea65292d6f433a44

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
