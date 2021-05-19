Return-Path: <SRS0=e9JL=KO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40F76C433B4
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 May 2021 16:11:29 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B8EE611BF
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 May 2021 16:11:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0B8EE611BF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LKQ7w4ap5SegtMAmVNOWELlIMqepxuDSXAHp3isF2d4=; b=qEj1dOTfLMKTRjtVcxVZAijbV
	ReoU8+6a/iEaPl5pxngb1oYdb/9kB5W/3cBcYF+s5BcYx5rRrzGnVs68MBhoWVzrXnF/x7aPkKnER
	jDfXnuuvZEUlez2vAdrNPnGM7cfPoxAvsUPaxlWXRApxju6sDUBwWqLGFE1X2WGtQssXmjRqpfLlH
	KmKmQaHMCYoKWKG5U6y+H8btFZ9480TyuElJ2uQgisSqBmbZLgVeMz4z4WglWexOP+w2h+BL3kYyC
	N5lWcqgSb2Q/FHzZfCUXNKNFB/90vZb6u9zZmsvRQLi5g+trGLi+1urvhQ4aoGU3rGekxw5kyh+de
	JBgswj4dw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ljOn4-004TV0-Lc; Wed, 19 May 2021 16:11:22 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljOn1-004TUh-Fl; Wed, 19 May 2021 16:11:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=PAMFeSJXWfmc0uPlq6BqhKTHboy1O0eGLhSNeleqt0Y=; b=b2431FdEEBHG9WdqhFMYwo1Veg
 oM+oG61voGqchYuTsS35WRTCZJuGFwKU0MIp+4ZxwxCYc4hEku4S8UvRFe5UBGX7r9E2BGyZ6wox6
 v6GVRCBH1p1Lm6WClQcEG1t07de95D3x0zEKZz2OquCjXT57CR8Bg+6lVM/A9W0571C8Qxi45kxP2
 fE+Pjh4M5YGVnnplar5ywN1L6WjQXS9kzBmpT4JrOmBjQyKlLmFYl+JGBABLVGczIWrLi4sM6OeQ7
 n35gAMX+X+QUnGj+WIXhqKoOJ97ACatnVuJ37m/aHkY9nJoNsaQA8s6GYQm4E4iqCY3TtV048DOEp
 TUeC2q2g==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljOmy-00Fc7i-Sb; Wed, 19 May 2021 16:11:18 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 00E0B6135A;
 Wed, 19 May 2021 16:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621440676;
 bh=5Z2EkaMzIYpeGUT62HgHaddi7bvGhthOk/v+yW7+/10=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YRfTV5p+1y7+MAObTjKCrRdDlIj8YnB+EyixBLNMaj16Ts9vXv0oxE8p1RIiZeRbR
 EZ3lHTfTgKeLGv0XVPprXAX3MY0MJrZoChe3TY9xBc5kumfP5bzZOXA/RbGh8eCyxk
 fiUwyer3vv2zCGWoxw4eimVy/VSfkOeXjgCLHWUI3HM1SNrfjALdEk3ZuhdneOlErD
 5y2lsorCZKYbNpwMQB8YVqWSBIKbCb1LKltrLS28ioAF2IW3ZN2Uz+/vWyqG21R7T0
 92rICEXxlJQEbsJSH5juE9Eco+dBfLAnIHX1jjsXAUq9OLFPIMrSh8BRu2fd8iZg3X
 TCZuhMIbY6dbw==
From: Mark Brown <broonie@kernel.org>
To: jbrunet@baylibre.com,
	Neil Armstrong <narmstrong@baylibre.com>
Cc: Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org,
 alsa-devel@alsa-project.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: meson: g12a-toacodec: add support for SM1 TOACODEC
Date: Wed, 19 May 2021 17:10:15 +0100
Message-Id: <162144027316.37060.16685114129646097481.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210429170147.3615883-1-narmstrong@baylibre.com>
References: <20210429170147.3615883-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210519_091116_961559_0E65C0D7 
X-CRM114-Status: GOOD (  12.54  )
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

On Thu, 29 Apr 2021 19:01:47 +0200, Neil Armstrong wrote:
> This adds support for the TOACODEC found in Amlogic SM1 SoCs.
> 
> The bits are shifted for more selection of clock sources, so this only
> maps the same support for G12A to the SM1 bits.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: meson: g12a-toacodec: add support for SM1 TOACODEC
      commit: 7487238c5f530b418745ce134d1b0a7fba3a0d8d

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
