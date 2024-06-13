Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8EFFC27C4F
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Jun 2024 08:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u1NYNbbNW1kD8A5fUmOijl1PFK7+tRHi7JhORkeG4ro=; b=nx8aZ1VYdXtl/W
	7voEBUwHNSsO3zA6kSi2Wzp5Q8IbA8eTWnkK1uiK+hW1jThlaBX2orXkvO9BEbj8e6engBVP+1KA/
	BBTwvedhfh2dWrdSSzAjDbQDgk1hphHoGJrg18ervVAX/wETz1rx7rZE4LQS0XtGlprMWXlUv2DwB
	NBrU9g+/T7sSItgkc7MZdr6Iv0kjmh7rz9UjzMdBZ+djqyVypav6jru8722+W4wSlZ+I+Iqq/n36I
	z6PMvKpvzoeghIVkCrHYp3GuZWRW7BCGEiBlQ/nhbS6NRWZsDCH8bsLxPKKrUKcKepl/J6xf6zR2g
	CnE05DnICGoP6XsslrJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHg2d-0000000Fl15-0s1u;
	Thu, 13 Jun 2024 08:42:43 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHg2a-0000000Fkzp-3DLx;
	Thu, 13 Jun 2024 08:42:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id A0D3CCE2027;
	Thu, 13 Jun 2024 08:42:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6A7BC4AF1A;
	Thu, 13 Jun 2024 08:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718268157;
	bh=oi5/9POK1vEMCK0p3ow/Sp1STduZ+j0IpQ4ogJhDSuE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=O5EmflpYmfNeZF0mhO8ZHCRMrTMseABNxdFZVc6x0PPZlvXSWwEQJ3Y4GylcKUGNi
	 JatpxUFH62QeacYlRQXMLn7C3wbIr4OhDqXswGqQYp5AlpehNO8TjWlro1ePs26Nrl
	 VGNXL8yWNSRhAjsojS83PXOP214FItOhLtm/NozVjwdRQtm4dnI3/7JItP10Y9kePl
	 KTMS5FMuYJ59PWisKx3ud8SP0o0LW7i+xm3JSQVEIaV7O5KcUOoIwCH9pBE1noSyXb
	 UA/D85hiABWwgWhIj+hJxudbTE16pLJDzfsVBeYxgCQBS6bJPE1K2BrF9mMek2Lloc
	 FlmR/6f2QSzIQ==
From: Mark Brown <broonie@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sunny Luo <sunny.luo@amlogic.com>
In-Reply-To: <20240612-spi_lbc-v1-1-d52e8c8011bd@amlogic.com>
References: <20240612-spi_lbc-v1-1-d52e8c8011bd@amlogic.com>
Subject: Re: [PATCH] spi: meson-spicc: add spicc loopback mode
Message-Id: <171826815548.249668.9109171570822609949.b4-ty@kernel.org>
Date: Thu, 13 Jun 2024 09:42:35 +0100
MIME-Version: 1.0
X-Mailer: b4 0.14-dev-4c370
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240613_014241_020316_D68737FC 
X-CRM114-Status: UNSURE (   8.22  )
X-CRM114-Notice: Please train this message.
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

On Wed, 12 Jun 2024 17:44:50 +0800, Xianwei Zhao wrote:
> Add spicc loopback mode for debugging convenience.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: meson-spicc: add spicc loopback mode
      commit: 313d2c9d1252185721cad4f8c57099840d6c9958

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
