Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92085C87FCA
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Jul 2025 18:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aquTJy3HEnMm/7eTERWHCySpuR7uHu+245dqxw0Z3KI=; b=mUTbSP+DiN/FL3
	2jN0JO4vbRNV1kse43ThuoTePkRV3tqlbLVgvdk+jJobSCRMpc2I9ZQTTvUEz9YJt7Ej9M+IiFq7+
	uurQzk12aGk/oMuRGpBmi5xlB3cn/1aaCIwJCA4EoHffWqEzh7FTvgJVYR6j8nLWRouhZ8WuRLBWA
	S//6323CHUlDZ0eyW+3TpwUaUlwN36HBiJr0zMtcYfZ+08gArI2rWU3ZxkE9zfkMVAm7t6ShYuRjB
	P5qp8DAKzk2xr4KdetYCv2N0symTPbjEPgwkJXlABFFLUnyOIU8mZaaAuwrZy4eI/FHIKYa4uQHT8
	yvBTanpoHFkS+oGWBvPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udvhr-00000000RkA-1WcU;
	Mon, 21 Jul 2025 18:57:47 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uduXX-00000000Lll-3ZYA
	for linux-amlogic@lists.infradead.org;
	Mon, 21 Jul 2025 17:43:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D95D85C5B5E;
	Mon, 21 Jul 2025 17:43:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79CA5C4CEED;
	Mon, 21 Jul 2025 17:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753119782;
	bh=XoJjYqS6/hSyXdRtMUnU0RZZfulFb6pXKIkPWE6tVOE=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=d19clrLfqVrlIKLaehbiYisqF1sSFoxxSb+XWsfdacSGi8mReu0kqAsXHt0fHA6eF
	 CelOUs3JD2kdhElZBtPH+BZOeGmvfyV1arj2ZDplvsysJHEbSXMXv8raGlaLU2SIXA
	 xsH1H0g9bA2HqVZVye9/AyoVvESQ6B4V4WzXDu3Z81b++QrRus0XoNdrVMLBDckUoN
	 TDbjJsHYRLM/FRSJYFTk9ydpQqrbx8yWTWBo2+jOU4hbqLYbjwcMldkeoUcVLngs6b
	 mbC3F1tPfRMOzgpS7xYZJX2uhcbkXHy+3Xe6SuVxVwzNYTSxRxEvv9pqvJApplnZpH
	 T9xZbE00CiyTQ==
MIME-Version: 1.0
In-Reply-To: <1j7c09pf23.fsf@starbuckisacylon.baylibre.com>
References: <1j7c09pf23.fsf@starbuckisacylon.baylibre.com>
Subject: Re: [GIT PULL] clk: meson: amlogic updates for v6.17
From: Stephen Boyd <sboyd@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, linux-clk <linux-clk@vger.kernel.org>, linux-amlogic <linux-amlogic@lists.infradead.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Date: Mon, 21 Jul 2025 10:43:01 -0700
Message-ID: <175311978158.4111.6766617410857124161@lazor>
User-Agent: alot/0.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_104303_931484_B0D047AF 
X-CRM114-Status: GOOD (  12.77  )
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

Quoting Jerome Brunet (2025-07-15 09:57:40)
> 
> Hi Stephen,
> 
> Here are the Amlogic clock updates for v6.17. This one is a bit larger
> than usual. It depends on the changes in your clk-hw-device branch and
> is based on it.
> 
> There is the conclusion of a long standing topic around reset drivers in
> clock, this time using the generic helper to create the auxiliary
> device.
> 
> There is also the beginning of clean up of the amlogic controllers with
> more coming in future releases.
> 
> Nothing is overly complicated in there but it makes quite a large diff
> since it touches all existing controllers.
> 
> Please pull.
> Cheers
> 
> Jerome
> 
> The following changes since commit ac32d031f508e46c19ab38d6ba8b53fc28df9945:
> 
>   clk: tests: add clk_hw_get_dev() and clk_hw_get_of_node() tests (2025-06-20 00:15:39 -0700)
> 
> are available in the Git repository at:
> 
>   https://github.com/BayLibre/clk-meson.git tags/clk-meson-v6.17-1
> 
> for you to fetch changes up to 8a65268500b00ecee5402ef9f80618ff73f30707:
> 
>   clk: amlogic: s4: remove unused data (2025-07-02 15:38:19 +0200)
> 
> ----------------------------------------------------------------

Thanks. Pulled into to clk-next

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
