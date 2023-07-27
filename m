Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99CDFC04A6A
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Jul 2023 12:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e/yQ7eiIzgMhjmHrhW28fFGhu/59FjHS7W/dr7gfOvc=; b=HlLrvAMGrFut2u
	YmRxYioTt1TfLagiz0ixZRkZkw0EcpCfntheBUIXMpJcLW8Fn2mc4g97AnU+xTsBtqF4DBW0DvuAj
	xCbaHwKqOtZLvvf1/kBSjzE94U6R1xBjqajgV6YujL9TMEt7NDTQEdjP4devdcCc0MH3hGfTupD3L
	0mu+oyNnafeDVwDnDVWnALcVuKL6H36V/KiosUt4onn+vSYqaH3N7DNBnIwVjwIaOZPHTcK718A7E
	jLaH2ylIUvFCOWdaYhLDZsza2FfDLYAJtF69sEAJK68FTE1Nm0sXf9b9jL0jcx7e3w0v/pzNEQd8t
	A07x3jQPik1uD4kDqG9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qP01o-00Dsbn-2q;
	Thu, 27 Jul 2023 12:23:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qP01L-00DsEx-2M;
	Thu, 27 Jul 2023 12:23:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3741961E63;
	Thu, 27 Jul 2023 12:23:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E578C433C9;
	Thu, 27 Jul 2023 12:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690460586;
	bh=RY/e8xBfCt//GjUHvzWss+4Dt9ss+FsUcym4Dt+dFXQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LXxxKpJ/MCkYdBdsV56K63jQh1TAR5lGGGyi3gWHHeAOquDRYOBlltWasLMX2232z
	 jjGRJKHmzf6h6+9fcK8QTmGOrUXsjhdqmdAp7dGaNfjlUzDHbRtnudKAOyTEgq9pIJ
	 LCp+G6qNXPPqNJPFVkbpQ4QARJbng9SkYH+DQcoFLmLpicMCA+QJNS8t14Gdq3pBjm
	 l5vCrDCFY5JgLFRUs3bbCWUKVGSTfBUWf1XaZsQ42YsHsgSXBJj/7RlqlnNHo+C8cQ
	 HHajxhS4RbKfyzsMvJThGrtiUpdGYzwTA39pkoe8/a0g/9/QmW8Ke+k/VbujPLeiST
	 jxjaXv+IyiyYA==
From: Will Deacon <will@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	NXP Linux Team <linux-imx@nxp.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Frank Li <Frank.li@nxp.com>,
	Jiucheng Xu <jiucheng.xu@amlogic.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Rob Herring <robh@kernel.org>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] drivers/perf: Explicitly include correct DT includes
Date: Thu, 27 Jul 2023 13:22:35 +0100
Message-Id: <169045934424.3249306.10595971010404706881.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230714174832.4061752-1-robh@kernel.org>
References: <20230714174832.4061752-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_052307_818072_EDE725E6 
X-CRM114-Status: GOOD (  10.28  )
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

On Fri, 14 Jul 2023 11:48:31 -0600, Rob Herring wrote:
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it as merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
> 
> [...]

Applied to will (for-next/perf), thanks!

[1/1] drivers/perf: Explicitly include correct DT includes
      https://git.kernel.org/will/c/918dc87b746e

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
