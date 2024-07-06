Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6639C2BD09
	for <linux-amlogic@archiver.kernel.org>; Sat,  6 Jul 2024 22:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xLpnh+kuVO/8SMOpwjUk4xeIMJLuxs3vKB5SE8S0Wt4=; b=Uu3nkruRGu+ueO
	L/wxwx3zyGp8kce+J5SbrMY9moDiGfCro6axXrrR+hxPtFNW6dwvRxoO+e2BlKYK+x+/HJHpOGD6j
	jmPGzAPIFLgRG7v75LdmSFrmbVnpgwlvF73trX3EokbXJxdpW6T0AHAnnrILCfjbUQtUxOsepOUNo
	5gY5Xa+n5Bn3+8elpL1gjKMr0bwYGvZiUXnbAY0UMtuH+VU/Pg01M7hBl5cCGuyZ0yRZLzN4zCTV2
	eeEzVEQYHEAMHPxv0lBj4bZ1nULg0dAQJbmBg8CBVPDCVMel4mM00ckbGYsWms8jtLGeFKXmOMPlA
	NGkfvrMPOI1vVt0/iZ5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQDTR-00000000tV0-1xlX;
	Sat, 06 Jul 2024 22:01:41 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQDTO-00000000tUT-1JLo;
	Sat, 06 Jul 2024 22:01:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1597162096;
	Sat,  6 Jul 2024 22:01:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84D1EC4AF10;
	Sat,  6 Jul 2024 22:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720303296;
	bh=Qwpc4/efpTqL70IGr9qUPpIjMx5Mgbkh4y5LCEEJGt0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bRlaiKQS45IlxvihYw/6qmTpqQTSOqxEoGMh2Cr7vlR7QTZ4OetSEYlWVNBURLgRb
	 7gMBFtupFoXogiImboTUhZfeylf8VEteXyzfg/aXrxYRzpdkXsl7SH6oPviNQpvIor
	 s2AQvC8DB1MV+tKdEKqfXf10MSkftXtsfg0x69XxJmgyTocq1N/ZjrQY3tahtYmWz8
	 yF+3wDPq5VmSu9YAStl7XTEU9fHI6YZl2pD0u2orf7Fom/3hd/m5Vh/hM7jsQc0kUG
	 op+1Uw+HWivnDyGqOy/MbBL9oSmPFIXmWFSkXgFd4elpn9IPd+bTm6FGelbYDmYRwj
	 0+iUIFzHafcWQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Michal Simek <michal.simek@amd.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: Re: (subset) [PATCH 00/10] clk: constify struct regmap_config
Date: Sat,  6 Jul 2024 17:01:19 -0500
Message-ID: <172030328802.28909.4573550234450892418.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240703-clk-const-regmap-v1-0-7d15a0671d6f@gmail.com>
References: <20240703-clk-const-regmap-v1-0-7d15a0671d6f@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240706_150138_421602_D408C1EF 
X-CRM114-Status: UNSURE (   6.21  )
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


On Wed, 03 Jul 2024 11:50:13 +0200, Javier Carrasco wrote:
> This series adds the const modifier to the remaining regmap_config
> structs within the clk subsystem that are effectively used as const
> (i.e., only read after their declaration), but kept ad writtable data.
> 
> 

Applied, thanks!

[08/10] clk: qcom: lpasscc-sc8280xp: Constify struct regmap_config
        commit: bd2d330ee608f16a0b93ea753b75c98a1898bdd0

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
