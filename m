Return-Path: <SRS0=YQie=ZM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92ECFC432C0
	for <linux-amlogic@archiver.kernel.org>; Wed, 20 Nov 2019 15:45:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65A4D20692
	for <linux-amlogic@archiver.kernel.org>; Wed, 20 Nov 2019 15:45:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AABVuR9W";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sx33veXR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 65A4D20692
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=N6tN/SMrd+HJnDjXH4o3KyprHAeMQkeosfF3Kj6Cf2s=; b=AAB
	VuR9WXEPWi0BRoEzrWcqVEMDIBcxoU+8Jj8rOFu7HMAjkObzU4uP91rCzKwzy+Y80YvucJYyFlvmX
	Sl+RLFE0Ke+AbTIa0qU5rScx5FALfg87d+IT3gqJJafyRSkUEgBqCR86v9bMZO9yMAVB7DKF8S+6l
	cB24nIUsEBFmAdCrPojhMcymCYjSivCQs0+1hMYU6B1RAycun5r6dHob1WW/CI66PdrSnifdMpBCQ
	TKru1CthLERx4ZUQefu0r58BN93o3HdcQwhEW3fwwWGQqcVQt7KLzS0oAHl7t3DtgwyLpHP0ApCKq
	ouEdCVyRFIPEWEhEHzrxTIpiZbqL7tw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iXSAd-0002oN-LF; Wed, 20 Nov 2019 15:45:31 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iXSAa-0002my-Pe
 for linux-amlogic@lists.infradead.org; Wed, 20 Nov 2019 15:45:30 +0000
Received: by mail-pl1-x642.google.com with SMTP id f9so103155plr.7
 for <linux-amlogic@lists.infradead.org>; Wed, 20 Nov 2019 07:45:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=p1oQ2/ApuLBZfJjzJxbReeEfweEJSenuiYCAOd26jOY=;
 b=sx33veXRT/WG71DXlr2LQUN/kHNNUnPt88phqsfsYVlAgZGxBvXbK0fqchczHwjND/
 1EGPyi7lDPIkCrm+8jV6C6faKYzD2LwCZtawDM48VNil5JrKDFYq/j92RN3POFavam4Q
 3M+Tutp1fhrWLVf5po3HELVk4FWWjzopaxpiuFaSbEUlC19y3zCMMjRiDRAIjNgB3Vs4
 BX5kbPUQ3ld73hsLb3GuVJmcROm71Vb4Y1uWFMHNmbnhMSz53nFcT9/CBimpRqCrj33I
 3/U1bD9M8Kdjx6Vb62TMyRxIX5ab6z88+AMp21kU32iV1Yznt8pQb9jqRWu7JaM6XwcU
 sQwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=p1oQ2/ApuLBZfJjzJxbReeEfweEJSenuiYCAOd26jOY=;
 b=YlgPu9WWsIMEAGBgk6UDuoz5DvW2M9CLUZwy52rtXCtkPgbI86ylu+8gvN8JHaX2yU
 4NPT7rqT/i2dL70BRs+UYFccFJ4rltgOah21DqvGM95LhKAzB2IPSXFkVrslJOg1IpJn
 BR+utY27vO6g7T7fqvNtFrGtXBaWZ91pKLzjvhgHx+uu2IZRGMuZnHvQqCj92OhJDp4+
 q5yyp8gHlq5c61bNEdofBqOFe7PSAXr6kOS34595hEIY4378pgObIyz6oH+R49pZgaa/
 yP0QLNakbEUCb2CCXlwSKAtNfwvDWU13bUK9f9uGob8hRjtHeT5vkjQQImEQCyXj0wSv
 PSxQ==
X-Gm-Message-State: APjAAAUgVAhQ+0inmHs7zjDYVgJrcRa2cc8/NwH1lo53oKzgR3jZcWlV
 35OpXd/hpRJWplyM9PT4OTiCTA==
X-Google-Smtp-Source: APXvYqxogLp6gc4NSWr1kl81LqhVaiFMVmTnBYfJTGwLUMofS4/vu9+JzshkluAWJdxeFvOnWyJZAQ==
X-Received: by 2002:a17:90a:bb82:: with SMTP id
 v2mr5064560pjr.62.1574264727478; 
 Wed, 20 Nov 2019 07:45:27 -0800 (PST)
Received: from localhost ([14.96.110.98])
 by smtp.gmail.com with ESMTPSA id q41sm7643756pja.20.2019.11.20.07.45.25
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 20 Nov 2019 07:45:26 -0800 (PST)
From: Amit Kucheria <amit.kucheria@linaro.org>
To: linux-kernel@vger.kernel.org, edubezval@gmail.com,
 Amit Daniel Kachhap <amit.kachhap@gmail.com>,
 Amit Kucheria <amit.kucheria@verdurent.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Guillaume La Roque <glaroque@baylibre.com>,
 Heiko Stuebner <heiko@sntech.de>, Javi Merino <javi.merino@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Jun Nie <jun.nie@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Viresh Kumar <viresh.kumar@linaro.org>, Zhang Rui <rui.zhang@intel.com>
Subject: [PATCH v2 00/11] thermal: clean up output of make W=1 
Date: Wed, 20 Nov 2019 21:15:09 +0530
Message-Id: <cover.1574242756.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191120_074528_851391_A19C6A11 
X-CRM114-Status: GOOD (  10.69  )
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
Cc: linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Cleanup output of make W=1 inside drivers/thermal. This should allow us to
focus on real issues that tend to get lost in the noise much better.

There is no functional change. This series was generate on top of
linux-next from 20191119.

Changes since v1:
- Add review tags
- Fixed up commit message for devfreq_cooling and samsung changes

Regards,
Amit


Amit Kucheria (11):
  thermal: of-thermal: Appease the kernel-doc deity
  thermal: cpu_cooling: Appease the kernel-doc deity
  thermal: step_wise: Appease the kernel-doc deity
  thermal: devfreq_cooling: Appease the kernel-doc deity
  thermal: max77620: Appease the kernel-doc deity
  thermal: mediatek: Appease the kernel-doc deity
  thermal: rockchip: Appease the kernel-doc deity
  thermal: samsung: Appease the kernel-doc deity
  thermal: tegra: Appease the kernel-doc deity
  thermal: amlogic: Appease the kernel-doc deity
  thermal: zx2967: Appease the kernel-doc deity

 drivers/thermal/amlogic_thermal.c    |  6 +++++-
 drivers/thermal/cpu_cooling.c        |  1 +
 drivers/thermal/devfreq_cooling.c    |  3 ++-
 drivers/thermal/fair_share.c         |  4 ++--
 drivers/thermal/gov_bang_bang.c      |  4 ++--
 drivers/thermal/max77620_thermal.c   |  2 +-
 drivers/thermal/mtk_thermal.c        | 12 ++++++------
 drivers/thermal/of-thermal.c         |  2 +-
 drivers/thermal/rockchip_thermal.c   | 22 ++++++++++++++++------
 drivers/thermal/samsung/exynos_tmu.c |  5 ++++-
 drivers/thermal/step_wise.c          |  4 ++--
 drivers/thermal/tegra/soctherm.c     | 15 +++++++++++++--
 drivers/thermal/user_space.c         |  4 ++--
 drivers/thermal/zx2967_thermal.c     |  1 +
 14 files changed, 58 insertions(+), 27 deletions(-)

-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
