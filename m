Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1447C02180
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 Jan 2025 19:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wftRrTOtViJm0MpxyPLSXkX+5oelelozbVdHLEo/mvo=; b=4TLMaD2oBnWAIt
	WNgotNT+TA7t0t9vtPEdVjLD0yp0ANPXcZK6sstgF05guVRN9RN60PiemWcTE8jRhVsPJN4HYEaBx
	FTbwVu5IezY3BJHdVfBYp00lsDtfNeCLIYxOnHJfl4fzx9mUESG7ELkPNQGVbVhp/1Q8WlDh8oXni
	9oTkLJ84Il72Xqdvd3Y9F01wGsjezTcDfgwhBgwUhHFcgYfjYqR9MCsFUmny+w4w74ZYfSX8R3N5u
	D5C9fU6/YLKchNA3tQUmlHTE5ryB8UMWUQcd7YIMJkliybwbHetAwC/9bGNok+7tdEt0CEaKtklpF
	PM4EKDq8vQyMpRhOESBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY9Dp-0000000Cv30-2Iob;
	Wed, 15 Jan 2025 19:38:37 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY9Dn-0000000Cv2c-3AFL
	for linux-amlogic@lists.infradead.org;
	Wed, 15 Jan 2025 19:38:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3F0D35C5AF6;
	Wed, 15 Jan 2025 19:37:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3389FC4CED1;
	Wed, 15 Jan 2025 19:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736969914;
	bh=CJClRZEfy8Pts8aXQUlUF+PP0Z0cuzM2vs65cM1w/6A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=m2eqR7b5oBJJTvdF+UQbMeEOkfD3q1gyOySBM0lc+6Kv6Atuk1ruPNyPPrn8ZXj12
	 0ffnHK4s2eXbFkME527nmS9kmlmv9TTfLharERoPmGr0G+rGUNp58Aq9UTB6i5HWV1
	 V64vYJJ52FUC+KiJT9GJDFwL3ea+Rtj+lCc9DgIb5IK9JZYATqxd+maeiLavMs4liF
	 IN37r06ME6YdgA25cf1MGzUfeqEil1YPWAplC8TsVmXJoYTzNPCbcIJyCX1tUxdKN6
	 vOLKj3y63KXfhN1St3hE+sYDqjM9IvI1+XExFJesmQw4fZHzfFVf1dKSj7YoLmSRWG
	 HggyGlfm/n1lw==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: s.nawrocki@samsung.com, lgirdwood@gmail.com, 
 linux-kernel@vger.kernel.org, jbrunet@baylibre.com, 
 ckeepax@opensource.cirrus.com
In-Reply-To: <20250114215617.336105-1-martin.blumenstingl@googlemail.com>
References: <20250114215617.336105-1-martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v3 0/2] ASoC: prepare streams on codec-to-codec links
Message-Id: <173696991294.258685.10820885833141683786.b4-ty@kernel.org>
Date: Wed, 15 Jan 2025 19:38:32 +0000
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-1b0d6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_113835_842901_DD9EA56C 
X-CRM114-Status: GOOD (  12.67  )
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

On Tue, 14 Jan 2025 22:56:15 +0100, Martin Blumenstingl wrote:
> the DRM subsystem has recently gained a HDMI audio codec framework [0].
> This is already queued for Linux 6.14.
> 
> I want to implement a HDMI controller driver for the Amlogic
> Meson8/8b/8m2 SoCs using the DRM HDMI audio codec framework. Internally
> the DRM HDMI audio codec framework relies on hdmi-codec's .prepare
> callback to be called. This unfortunately is not happening on Amlogic
> Meson8/8b/8m2 platforms [1].
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: soc-dai: add snd_soc_dai_prepare() and use it internally
      commit: d4e91adfc261de1454538ee6437e6014a2d1fca1
[2/2] ASoC: dapm: add support for preparing streams
      commit: e436d43551764bd6ca22a1ab1e80e98939b8aec7

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
