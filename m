Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08C06C369AB
	for <linux-amlogic@archiver.kernel.org>; Sun, 27 Apr 2025 06:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3u72tbZjkB/MuOrqFtG/kML5pexXpLJ9D5O6E2noTy4=; b=hE15Ol83vcPIeI
	4Pt+ggGdRrcXwFOGh1b6Vp7Y1R+HaCnUP8LWvVhsHwXw+RQehcGp6nCu7H1TOMVJJWizDmpta3T1Q
	XRKeNc9QziLNWjAciltHALYjqJ5ZEv3E2UG+MbxVeHL7b0qdr6r103HluA6OETlb2znF0egZ7VDzp
	4rE7FtnmY8TT17HU1t0f3eRNyxHADI9mvtoJzqpyusR6BS5OyCtVJJ+wYhRmP7DE4qHYuCayGm8JK
	cjslUf/HaHKZnXuP1pNZIX2Zh1BNlqr6jGPq6E8ej0xc/VDJynZbl8ZHRnI1VSxhBMTwMJZYnlHUl
	gA8cRm7L1WKBIt06Y89Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8vPP-00000002yOP-1qIB;
	Sun, 27 Apr 2025 06:22:35 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8vPM-00000002yNn-3F0q;
	Sun, 27 Apr 2025 06:22:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5B6785C53A1;
	Sun, 27 Apr 2025 06:20:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AF02C4CEE3;
	Sun, 27 Apr 2025 06:22:31 +0000 (UTC)
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id B822D5F71D;
	Sun, 27 Apr 2025 14:22:28 +0800 (CST)
From: Chen-Yu Tsai <wens@csie.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 =?utf-8?q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev
In-Reply-To: <20250404-kconfig-defaults-clk-v1-0-4d2df5603332@linaro.org>
References: <20250404-kconfig-defaults-clk-v1-0-4d2df5603332@linaro.org>
Subject: Re: (subset) [PATCH 0/5] clk: Do not enable by default during
 compile testing
Message-Id: <174573494872.940990.8317443409308272836.b4-ty@csie.org>
Date: Sun, 27 Apr 2025 14:22:28 +0800
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250426_232232_860356_CFDB1ECA 
X-CRM114-Status: UNSURE (   6.24  )
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

On Fri, 04 Apr 2025 13:56:56 +0200, Krzysztof Kozlowski wrote:
> Enabling the compile test should not cause automatic enabling of all
> drivers.
> 
> No dependencies, can be picked by individual maintainers.
> 
> Best regards,
> Krzysztof
> 
> [...]

Applied to clk-for-6.16 in git@github.com:linux-sunxi/linux-sunxi.git, thanks!

[4/5] clk: sunxi-ng: Do not enable by default during compile testing
      commit: 115bd1f1ec2b6b7f925752a85dd43e9909757f9a
[5/5] clk: sunxi: Do not enable by default during compile testing
      commit: f06a610cb17468a3098be1e401c4b29623b99d0a

Best regards,
-- 
Chen-Yu Tsai <wens@csie.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
