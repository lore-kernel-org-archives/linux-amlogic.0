Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 875A7D6A221
	for <linux-amlogic@archiver.kernel.org>; Thu, 14 Nov 2024 20:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:References:
	In-Reply-To:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bbDAQHurTPD0pTTEQcKkrhpxRtXCcQuMRH+Vw4nn4hE=; b=uUwsErBMdGWgsw
	IBorvRvfrPTJFBrYHH74MTalkoLBujNdTniwSdGNc5cjAh6HdcA6dahdIV6JDmPMIP9EZZm9aEF1V
	ON0gGjLAh3/41pLeIJAmBclWSDQgWiXrSJ/4YE2+24feQSXYeQ7Ku9Pbokz+5pTLtSf7ti6wbP1SL
	tDjnzavjZNiGT2BU8TSWAth5TuBH2JLT/RKrOVdB7X3Erbqa54UpFg1CCYGx0/sQJADEL5YO0PjZN
	USLIeavhX2IGYKO3x2dfVYoirnOkyn2612e7vQwF1mfJeQy+pKcjufaKHlZXkH2ZMD9Mnp3UW7i2G
	e7Wxi9BBX1SedO2cz5Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBgWq-00000000lfD-15Jb;
	Thu, 14 Nov 2024 20:33:24 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBgWo-00000000lel-0QZ3;
	Thu, 14 Nov 2024 20:33:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 514005C5C4B;
	Thu, 14 Nov 2024 20:32:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F65BC4CECD;
	Thu, 14 Nov 2024 20:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731616401;
	bh=+CDkKWnuIWE7Qdr1ZvsvyfLP2c+eEHLfxf+YncF80ho=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=VelODjWB+adbMJUXY/GTYKQEnsvUt4j+gZlgfx5ZdX6f6VAEY4F7q7mnYzrk9Tify
	 vhrc2rdpYl3YrubN6lMMvikrWRWHLXVmNcnN3Re0kB5nu2/uc6w6rCBcwkGMBQaDxj
	 ZLV2MuJBEfS8rIcOs5XwpkGtr1JXzOmaUOP++YkzqES4yEDBk7H0lr43VpZ7WBrtAc
	 Dq+pnrl06ns4SoIaPaiNGsZGf/rKSxgZNug7uZCRefpH6emO6j8Sqm3K0yOOuF3cEt
	 N++Qgi98eoAat791ChTWEaM8fjqtV8erYyib8sqJE5u12Sgfub1ZjebZSRynRZly6g
	 FEERvrZt6yleA==
Message-ID: <9efa4e83bb57b9121a03f53755d1f9f3.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20241111102932.3209861-1-arnd@kernel.org>
References: <20241111102932.3209861-1-arnd@kernel.org>
Subject: Re: [PATCH] clk: amlogic: axg-audio: fix Kconfig dependency on RESET_MESON_AUX
From: Stephen Boyd <sboyd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Chuan Liu <chuan.liu@amlogic.com>, Xianwei Zhao <xianwei.zhao@amlogic.com>, linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
To: Arnd Bergmann <arnd@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 14 Nov 2024 12:33:19 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_123322_187752_895C28E2 
X-CRM114-Status: UNSURE (   6.43  )
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

Quoting Arnd Bergmann (2024-11-11 02:29:21)
> From: Arnd Bergmann <arnd@arndb.de>
> 
> As in most cases, using 'imply' is wrong here and does not prevent
> build failures since that code may not be visible to a built-in
> clk driver:
> 
> axg-audio.c:(.text+0x15c): undefined reference to `devm_meson_rst_aux_register'
> 
> Replace the incorrt 'imply' with the necessary 'depends on'.
> 
> Fixes: 664988eb47dd ("clk: amlogic: axg-audio: use the auxiliary reset driver")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

Applied to clk-next

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
