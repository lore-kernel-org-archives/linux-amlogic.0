Return-Path: <SRS0=ZPw0=6B=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D8B3C38A2B
	for <linux-amlogic@archiver.kernel.org>; Fri, 17 Apr 2020 18:41:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 15DC520780
	for <linux-amlogic@archiver.kernel.org>; Fri, 17 Apr 2020 18:41:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FVy6Tco/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="LXPAvTOD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 15DC520780
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YVq4K7LYsvBWTlaZxKwLzqyMkzBgKE6kj/LxNHqGcYY=; b=FVy6Tco/TUTVXj
	1lxZYFdOomDy+o38VNe8xqaP4Sa2846r8HJ0JHC7u1xzpWshhA6DDtKus5rdzfEXbxxwVFFpGzV6E
	3h8R6VRgCINbowfTUKx/F9YCtUS5O1Af4LL+ApdGG+6ePa2oIkdbX5KP9xgGaLeYgIjzcJoriyxOW
	Z54nuMPCsKML+lJBO6K/PwwYXgGUV0fZbPKJPJ1Z+Ua+GPnuOw4EJ/2EqCGy99EKufM+/dKD4yNfQ
	CkTqF3CKTw2IuONxYst3yWhVYEaUtpj/9CGwHPXR4MkA+dNi/jm7tk4i5+IEMUWQKWHAmCQjAQCHI
	j1j1qe5O18/M2MSkGrpQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jPVvs-0006w9-M6; Fri, 17 Apr 2020 18:41:44 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jPVvo-0006ug-4p; Fri, 17 Apr 2020 18:41:42 +0000
Received: by mail-wr1-x444.google.com with SMTP id k11so4200800wrp.5;
 Fri, 17 Apr 2020 11:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2fCasJ2C+JC/HUKeTPHMgTsMvggIkNTYgPJZjR55RsU=;
 b=LXPAvTODuV1mrN7GJOFr+aeOYLH/I4yhHZmBHhlvtFZi3pHvCGkvG371ONKh08DYBs
 0EQYOXKOXY6VDC87dCc0DQkR6gdnRcWmQ6XzatNBI9cibBQEWj8xf1hoAjfjqP2oTccI
 OtNXrfTchRt7BQmA6d15v0lzSaUxgkdEV0JUgEYnoMLlqSFqhZyDaY0sGVR9+RHKZiKK
 jXaIAbiV9NnrssX/9tq9BtOzZulYgXZoFTeTP57WOSNgeAZPHyXpKX4bhpUa8lplaueX
 SnirzxJglgw3QODNUjEkIplsRTLIE4VSx/R3SSid24vAn+i/CnAZo5l3ETMRXla5SLwe
 YkNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2fCasJ2C+JC/HUKeTPHMgTsMvggIkNTYgPJZjR55RsU=;
 b=dmLkjvi8CtGQ4N2W9ubxxNUZeSF52QMCKYWfJJyYGjt73LnGkzDI+Ha1qpD0TcDSiK
 xART/1mOxYT22m0ZSZ4gEKiCb8EP2JZ8xjxjcUNsXwyYlt1rAfNdozGlP3upSHLPgSud
 W42SlUwLxA4vU+/3YeQKdYTZfX1W3KewD1FjfmY96dtTSoukfm6k3jKZ4wohoBMOk0mE
 1bW7onSHdLBMCnj2LV5KAX1qRwC+ln79zAymtPIU3WlzqPQXDrrJs48kj/4tB94yXEIT
 3zqOI3N7c3RQ2BHXUAcdQPpw+4UuoPE1vx8g5ypQO3+buv4GlS5fGAm3GtsxpOnwOxcq
 Yquw==
X-Gm-Message-State: AGi0Pub3pX7OdJTo6gjpIMMv3XVctYJ2c40ZpyS0EDAx5/xTbfwO4FTO
 aS8IPW787WiQPUbuKdgfBy85AnARaLc=
X-Google-Smtp-Source: APiQypIIGUhAdLJvQZMeRku+d4KFp8njsgQOIbIzXEqczaUyWySh9fX7lU1ILP8NotRqPUayjCIXeg==
X-Received: by 2002:a5d:51c6:: with SMTP id n6mr5298149wrv.314.1587148898835; 
 Fri, 17 Apr 2020 11:41:38 -0700 (PDT)
Received: from localhost.localdomain
 (p200300F137142E00428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:3714:2e00:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id c17sm33237391wrp.28.2020.04.17.11.41.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2020 11:41:38 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: jbrunet@baylibre.com, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org
Subject: [PATCH v2 0/4] clk: meson8b: updates for video clocks / resets
Date: Fri, 17 Apr 2020 20:41:23 +0200
Message-Id: <20200417184127.1319871-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200417_114140_182674_37F0E3A5 
X-CRM114-Status: GOOD (  11.37  )
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
Cc: narmstrong@baylibre.com, sboyd@kernel.org, mturquette@baylibre.com,
 linux-kernel@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This is the first batch of fixes and updates for the Meson8/8b/8m2
clock controller driver.

The first patch fixes the video clock hierarchy. Special thanks to
Neil for providing a lot of details about the video clock tree!

The second and third came up while testing video output on my EC-100
(Endless Mini). This board is special because u-boot does not enable
the video outputs like most other u-boot versions do. However, this
is very useful for development because it shows (the hard way ;))
where the existing code is buggy.

The last patch is a small improvement for the VPU clock so we
utilize the glitch-free mux (on SoCs which support it) and avoid
problems by changing the "live" clock tree at runtime (with the mali
clock this resulted in system hangs/freezes).

In my opinion all of these patches - including the fixes - can go to
"next" because the relevant clock trees are still read-only.


Changes since v1 at [0]:
- updated the description in patch #1 to clarify that (it seems that)
  there is no fixed pre-multiplier for the HDMI PLL (like on GXL for
  example). Spotted by Jerome - thanks!
- simplified the logic for the active_low resets in patch #2 by
  shortening the if ... else. Thanks to Jerome for the suggestion.


[0] https://patchwork.kernel.org/cover/11489079/


Martin Blumenstingl (4):
  clk: meson: meson8b: Fix the first parent of vid_pll_in_sel
  clk: meson: meson8b: Fix the polarity of the RESET_N lines
  clk: meson: meson8b: Fix the vclk_div{1,2,4,6,12}_en gate bits
  clk: meson: meson8b: Make the CCF use the glitch-free VPU mux

 drivers/clk/meson/meson8b.c | 105 +++++++++++++++++++++++++-----------
 1 file changed, 73 insertions(+), 32 deletions(-)

-- 
2.26.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
