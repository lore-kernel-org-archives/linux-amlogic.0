Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77561C00140
	for <linux-amlogic@archiver.kernel.org>; Fri, 12 Aug 2022 18:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m8zIPC3TClAp+3Ch0pwdresGYoTVqmFgpeQVziQ1Wkw=; b=W9fdEoYkQ0s9AB
	L1G0l3pudDNNiaV65Vf8zRMWs3iDqLOgOcC7viqCl4KVWSGDXQBuyCdpeeqKRRsTYkL4eCHF9aSiw
	Ry/j+ul2EN21J/5zzGUc11v3ivmItOxwDgNtdU4mZbUYIi+QAOBqnFQvt8ylzkS2v1bjpTnOYB9uL
	iHZblMdBIp249Q3ffIbelhQ7MVSK3t4bgxLacOESk5SpJGVmkBy4Tuw423NrtxflcE8HclJ/v8zHK
	F1B+GZMCCGaHkvQa5F740g2upKTg16Tm7fMEV+F3IhlMLd+Uw2SmhoX7DgjPCG1lj/LUNVzlahglS
	wy8MEka3ju4hloi9O4uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMYxG-00Bpe7-8H; Fri, 12 Aug 2022 18:00:18 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMYxD-00BpbI-Fb; Fri, 12 Aug 2022 18:00:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id ED1D4B824AB;
	Fri, 12 Aug 2022 18:00:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88A00C433D6;
	Fri, 12 Aug 2022 18:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660327209;
	bh=qlpox5oTG4mGqf0Z5CixjCw+6OtL2a4Mfnk09AY4MdQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=DjM7h2Ej+Y3LMuAZVTKSAZfTFyxK5YcunEXcMSR1Aiqe9vM9v6zHd3RHQY16bqhiL
	 tgTIIujsgIWrd9Ml9S++a0ucfaOPkuq2JyuoHF949zbd0OFsegJUCz9gSPbV3DeXLe
	 ZrPYIPF2+pvvrmyWep/LrQgwJ1aD82WLyAx2ZRDBtXxNMXy73+tVur9Zu6ZyToeOxX
	 dyBZUbIjoI3Im8H30B7Pg7qbAAz3PSYnULV5xSe7keieyDs9dS26qQjQDpZ4gr3Gqj
	 rZUMcEImmxmiF4aXHV+k0AtNbk2JXuTa6QH10p1qNZUf4XaW8nnW04qy8pVleOSbfw
	 O6NIMnS+fzMcA==
From: Mark Brown <broonie@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: linux-kernel@vger.kernel.org, Da Xue <da@libre.computer>, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-spi@vger.kernel.org
In-Reply-To: <20220811134445.678446-1-narmstrong@baylibre.com>
References: <20220811134445.678446-1-narmstrong@baylibre.com>
Subject: Re: [PATCH] spi: meson-spicc: add local pow2 clock ops to preserve rate between messages
Message-Id: <166032720712.92213.8055426385524956373.b4-ty@kernel.org>
Date: Fri, 12 Aug 2022 19:00:07 +0100
MIME-Version: 1.0
X-Mailer: b4 0.10.0-dev-fe10a
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220812_110015_695057_F9082FE9 
X-CRM114-Status: GOOD (  14.86  )
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

On Thu, 11 Aug 2022 15:44:45 +0200, Neil Armstrong wrote:
> At the end of a message, the HW gets a reset in meson_spicc_unprepare_transfer(),
> this resets the SPICC_CONREG register and notably the value set by the
> Common Clock Framework.
> 
> This is problematic because:
> - the register value CCF can be different from the corresponding CCF cached rate
> - CCF is allowed to change the clock rate whenever the HW state
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: meson-spicc: add local pow2 clock ops to preserve rate between messages
      commit: 09992025dacd258c823f50e82db09d7ef06cdac4

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
