Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C45B1EB64DD
	for <linux-amlogic@archiver.kernel.org>; Tue, 11 Jul 2023 22:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DzZVjZcdkhEVaiJPsJo8UO4GLHIOYswCl0UP/TM6krE=; b=elUpCTBvz8zk91
	8fZB/QNunaS2euKpTqx7vslrIhhA0f1ddALVYFazI+jXNvw+nOKULiTkFVCIwUas1igEzd+2uTOrs
	6b6FYfMPv0lCwlc4CKHRq1yrch12Ygma+lnWl261+uQ1KEyi7vodzZfEYw8keKO0Z5LUcRZssiAPG
	O6HFWX1Ifn58rKQATgLOX/8CRFoeByBkJAZPxZPsWcx/SLnp4iOQJK7WeNXPQMCtIjTxXiRW84a8t
	arQKm64f5U6u8UtugkutFrVloIVoTN547w7+cubQjgqLOBOrAMn7s6Ewb+vWdGfMCL10Iw55nSl8q
	hvWZHXCRa+OAN8kKvUnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJLSv-00FxZn-2z;
	Tue, 11 Jul 2023 22:04:13 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJLSt-00FxYn-2q
	for linux-amlogic@lists.infradead.org;
	Tue, 11 Jul 2023 22:04:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 661E661633;
	Tue, 11 Jul 2023 22:04:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CE2AC433C7;
	Tue, 11 Jul 2023 22:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689113050;
	bh=HYgJlSRzlY/c6CJzQ2MT1NOTLLiTjwa8Xi9ku0nnMRQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=nvOOyXEWX21QB4FR6f1/NxCxHjXJciOzhHZpbErTSP8x0mran2olGaOoGYDt47Dwm
	 1dPdebP7ytuvvGvZJjyBVFCp9ZrqPD44T5/2mbGOgF63ZoN43u2Qj5xC196f8Hib3f
	 U55bE2UFM0/Wx4Inj0XKLItOJy1FvGUlvhTTU2u8iNTtQMubpgcwURSdEAYPr/HhIy
	 UZjAmNicxHjI5q72WUOOsZEBsj8r0gOfYDb2lf3IRuQ3Fo2NN40gDNj8MwGcj61ndx
	 X31wjh+0LhuzPRXvOntOF6Q6gl8a8sw3nMWbYq0JrYUGwPhivWagX5r1Lb4GjWxQdM
	 GxN9oh5oZIYXw==
From: Mark Brown <broonie@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Andy Shevchenko <andy.shevchenko@gmail.com>, 
 Martin Kurbanov <mmkurbanov@sberdevices.ru>
Cc: linux-spi@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@sberdevices.ru
In-Reply-To: <20230706110331.19794-1-mmkurbanov@sberdevices.ru>
References: <20230706110331.19794-1-mmkurbanov@sberdevices.ru>
Subject: Re: [PATCH v2 0/2] spi: amlogic-spifc-a1: fixes and improvements
 for amlogic-spifc-a1
Message-Id: <168911304916.642798.15717840786600920513.b4-ty@kernel.org>
Date: Tue, 11 Jul 2023 23:04:09 +0100
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-099c9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230711_150411_958974_ED53C15C 
X-CRM114-Status: GOOD (  12.36  )
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

On Thu, 06 Jul 2023 14:03:29 +0300, Martin Kurbanov wrote:
> This series adds support for max_speed_hz and implement adjust_op_size()
> callback.
> 
> Changes v2 since v1 at [1]:
>   - Make cosmetic changes as Andy suggested at [1]
> 
> Links:
>   [1] https://lore.kernel.org/all/20230703094518.53755-1-mmkurbanov@sberdevices.ru/
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/2] spi: amlogic-spifc-a1: implement adjust_op_size()
      commit: 9bee51722cdc1b32193d4ddf6ea6952d666d8f13
[2/2] spi: amlogic-spifc-a1: add support for max_speed_hz
      commit: 54b8422cc64d6236024ec7d72bc63ca3ca90b87f

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
