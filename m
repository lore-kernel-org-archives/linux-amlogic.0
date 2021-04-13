Return-Path: <SRS0=PL4p=JK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BC60C433B4
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Apr 2021 15:09:34 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 33D3F613BB
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Apr 2021 15:09:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 33D3F613BB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CJ4plmarUbyhz/V1XcaQ6Q5n9PwGXTlYCpQqOAy/vCs=; b=FqEz+j8r6O2u8+sUKYpk2A1hN
	TvylFRLBGAg3gOg0HUEB1C0QDKvQnR5xvbsVC7BoJwOrvnLcyjCCfhl05+/wQCLnbkxe/fcfyNd18
	0iXhqyUNisdlLH0TsNrV3EkQG0tVmrfFHbLan79CMIdtcQdx8lmAuS24BaQaZq2eJyTNSmv/xuK03
	zudJRJuz8wQYICtQ55ahNRQ/BcikpdYOsj42mCCctaS53LpUjw1LuJG+eEYlx5pzLrb3LLpwo2jEu
	vGn4E1J+NgpRLwIj5PVTZ0/6wdQSncenCyokuYTC5qXfiz7Vq426x5Tb59xfml7v+j7tkDTy5H+db
	xS5mYRd2A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWKfL-009bDt-E0; Tue, 13 Apr 2021 15:09:23 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWKfI-009bDP-VP
 for linux-amlogic@desiato.infradead.org; Tue, 13 Apr 2021 15:09:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=h2OVYRhlCOopd4hPv/0bokPcCGXgzj0St+To5KUe2hQ=; b=OSC7uyROwEP6+zQ+bABxGrxM4A
 wiUmioiPzpsIc8DL/UKIg7vy2w/lUcjjXAoHrR9KMrKyf7ldUBAWXrSjFWt6B1A76G+J8CdZpq3ij
 pqHMdYKc9I70BdgogsYlC31NYPrVQvQBfY2y7zNog5OPDmkxlrp8/Q/47J8VPVhbc5xL7/2LR5TlP
 hgljOwOao4Z9Pi5qVJRD3ecP9x55gnMt9TJoBQwFa1mF2V2ViuNAyBuVq30+umtVjlIP6o6HAePm4
 FbIBxVk0pFOi4/j8Vi5L9sU8V/wYYiSimjHaKX0JWZbiA8K0K+LWn8vSnWstqARNACJbiQMnZijTm
 c2M1FFhg==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWKfG-007874-Cq
 for linux-amlogic@lists.infradead.org; Tue, 13 Apr 2021 15:09:19 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 507C2613AB;
 Tue, 13 Apr 2021 15:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618326557;
 bh=n62q5EPfx7TlonQCJXka/eBID5Q419/EP3vdvBqEKPE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=a/E6qyJwBMk/HjcwnpLd5MB32RbCMYkv/JEHib6DELW+NG8rEg1ZThPOwx80jvw6t
 drmBxMFRdq1ULdWxLagnVgGc/VQbBBBf39kuDAC8qqdIvx0lzxVnoOUSwgo+NwdN5/
 SZ/7xTbo9LRX0DcVHt8/qGH2GxCEk7OeSmfSA+W1r7eer30/jAiqk1KsuSDxH9SJrl
 U9GXIcBEVD8SJ6D8to1ijr1L7uOCYY6jfFh9sAu23cZp4vRwoYVwQNEVNHoML+0br3
 eKJAcBF2bBlilDcxRakYUKC5RCYoC0LGOzfpp3fRNsK8bw1enI9lHi5HdhU4vbLmdB
 ZUC1yomeaVdlA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>
Cc: Mark Brown <broonie@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 Christian Hewitt <christianshewitt@gmail.com>, alsa-devel@alsa-project.org
Subject: Re: [PATCH] ASoC: meson: axg-frddr: fix fifo depth on g12 and sm1
Date: Tue, 13 Apr 2021 16:08:52 +0100
Message-Id: <161832446009.49152.6444814116918123903.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210412132256.89920-1-jbrunet@baylibre.com>
References: <20210412132256.89920-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210413_080918_473963_F1E743D8 
X-CRM114-Status: GOOD (  12.42  )
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

On Mon, 12 Apr 2021 15:22:56 +0200, Jerome Brunet wrote:
> Previous fifo depth patch was only tested on axg, not g12 or sm1.
> Of course, while adding hw_params dai callback for the axg, I forgot to do
> the same for g12 and sm1, leaving the depth unset and breaking playback on
> these SoCs.
> 
> Add hw_params callback to the g12 dai_ops to fix the problem.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: meson: axg-frddr: fix fifo depth on g12 and sm1
      commit: 858066864a6383d1eecd2fa96a0b8e69935632f8

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
