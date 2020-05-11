Return-Path: <SRS0=qsgt=6Z=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAFC6C54E4B
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 May 2020 09:28:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A7D03206E6
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 May 2020 09:28:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ooE2yujv";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="pBaG7fHp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A7D03206E6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0J31UK5IYv3basdngmcrtFAOaf2rjXg6cjkZ2poozvE=; b=ooE2yujvH02chh
	ATSLP8zMMtljjqJMoyn/h/NM6+Qlm1Snk/OljYyvmcGI2PYo8lusDBEh2wdG7DQE0sOR2Z21dCXzl
	DSpL7hCubS+U69S7mQjTacxFAtrXfpH7px+CNTLTJlWwBK80CPd0mkBwIEg6QjJ4BG6YoBmJc7o23
	Q1E1HYLxLGw8Ni9PEm+sHGJsfSJNm8oERl71XMtrRCRyF8EuprFirUmy8r5XzO1dis50w6R0JOhQK
	Eyeaus3mBIUe/McD0BRDwx4mH3PpJ9nJXUjIMzHA+ZhdthU76LubRgfWgIDmWhCWgO5RjFIquc510
	vCXSWeoBnLoaVZFvTAcg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jY4k0-0007Xx-7C; Mon, 11 May 2020 09:28:52 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jY4jx-0007Xg-RP
 for linux-amlogic@lists.infradead.org; Mon, 11 May 2020 09:28:51 +0000
Received: by mail-wm1-x330.google.com with SMTP id h4so17267087wmb.4
 for <linux-amlogic@lists.infradead.org>; Mon, 11 May 2020 02:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=user-agent:from:to:cc:subject:date:message-id:mime-version;
 bh=Mh8BUB33BkRpM8aRwNinU38S2vUC6fEvoov1NKAowG0=;
 b=pBaG7fHpfSyn91qMTy91WjirPbPNwfVY7UW/JkojDMasPZx6lER9z3xS9q+97dUJn4
 Hiq1pnaisrwwq/nCdHLAV2r+67h4Dfhu0WIF+AUh1jrxG0VuvGhkLC1OIwE54J3d/W5h
 O+SG4LTHlZnkd+hR3f1DhxDwp0mVmuNjeK0JRv4A7taIUJUtgZ7XcRNBCayhX89WmzoV
 rMQCdGRgwLUqAK8mz34ilZzahJcHHj5KGY2kNpzS/eIP2UsulAe6LNi7JvP8XrM/y1XO
 As56NoE7r1gaV18Q+NX0jl/GEqN+pFPanX6a10CldokF1P5AzJK9HsNW0U2L4udCGPJu
 GEhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:user-agent:from:to:cc:subject:date:message-id
 :mime-version;
 bh=Mh8BUB33BkRpM8aRwNinU38S2vUC6fEvoov1NKAowG0=;
 b=F6njDlAuuAMXOokoG+ADKrtvkP+eL2zur8E77cY/KR+fHCUGXokzZaR5Lgtg+9t/j3
 BFrvaut73EGHzlTjuGGJmeBEBpWjfT9wxC1rz1VoIibwBK3WjN3CO2hrCOO13KtODLwZ
 3qGeABcTwjbWI8yM23hwTQfgUUf80LifYyDMTDLDfvxODjQSpxvLEUzZW3U/Pyr4fxfS
 RL5JR/9epIs+G5XKteyN4wW1WR84p1MGAFg/YV7paQvYuncPuWfyOk0q9oCbBmf1mHDw
 Z/Eb4s3eyddHcnI7p5x7IeNniI8y06zT5xFTcDGD8MgYEDqn3Y87H09tSnV2u4tZE6tn
 S+mw==
X-Gm-Message-State: AGi0PuYikRTnCXC7T76Lj3zBDiOL+aw6QI7f6H0jgiK0iDeZl+hmxjOy
 whBLBnior/iFhQtKPnXfJQ3Ncg==
X-Google-Smtp-Source: APiQypKERVZrItZkKv3SFAqMxzeC3pVuCzo0/ct6fZp7Ucz/892XCm/L0uc0xYtYm6t2UV3w6TMK6g==
X-Received: by 2002:a7b:c459:: with SMTP id l25mr29862222wmi.52.1589189327567; 
 Mon, 11 May 2020 02:28:47 -0700 (PDT)
Received: from localhost (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.gmail.com with ESMTPSA id f26sm25790278wmj.11.2020.05.11.02.28.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 02:28:47 -0700 (PDT)
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
Subject: [GIT PULL] clk: meson: updates for v5.8
Date: Mon, 11 May 2020 11:28:45 +0200
Message-ID: <1j3686g6r6.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200511_022849_886944_04AA5624 
X-CRM114-Status: UNSURE (   6.91  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Kevin Hilman <khilman@baylibre.com>, linux-clk@vger.kernel.org,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Stephen,

Here are the amlogic clock updates for v5.8.
Nothing fancy, please pull.

Cheers

The following changes since commit 8f3d9f354286745c751374f5f1fcafee6b3f3136:

  Linux 5.7-rc1 (2020-04-12 12:35:55 -0700)

are available in the Git repository at:

  git://github.com/BayLibre/clk-meson.git tags/clk-meson-v5.8-1

for you to fetch changes up to a29ae8600d50ece1856b062a39ed296b8b952259:

  clk: meson: meson8b: Don't rely on u-boot to init all GP_PLL registers (2020-05-02 01:53:32 +0200)

----------------------------------------------------------------
Amlogic clock updates for v5.8:

* Meson8b: Updates and fixup HDMI and video clocks
* Meson8b: Fixup reset polarity
* Meson gx and g12: fix GPU glitch free mux switch

----------------------------------------------------------------
Martin Blumenstingl (9):
      clk: meson8b: export the HDMI system clock
      clk: meson: meson8b: make the hdmi_sys clock tree mutable
      clk: meson: gxbb: Prepare the GPU clock tree to change at runtime
      clk: meson: g12a: Prepare the GPU clock tree to change at runtime
      clk: meson: meson8b: Fix the first parent of vid_pll_in_sel
      clk: meson: meson8b: Fix the polarity of the RESET_N lines
      clk: meson: meson8b: Fix the vclk_div{1, 2, 4, 6, 12}_en gate bits
      clk: meson: meson8b: Make the CCF use the glitch-free VPU mux
      clk: meson: meson8b: Don't rely on u-boot to init all GP_PLL registers

 drivers/clk/meson/g12a.c                 |  30 +++++---
 drivers/clk/meson/gxbb.c                 |  40 ++++++-----
 drivers/clk/meson/meson8b.c              | 120 ++++++++++++++++++++++---------
 drivers/clk/meson/meson8b.h              |   5 +-
 include/dt-bindings/clock/meson8b-clkc.h |   1 +
 5 files changed, 134 insertions(+), 62 deletions(-)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
