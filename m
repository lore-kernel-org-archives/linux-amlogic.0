Return-Path: <SRS0=P5SD=A4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00792C433DF
	for <linux-amlogic@archiver.kernel.org>; Fri, 17 Jul 2020 17:54:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C46A52064C
	for <linux-amlogic@archiver.kernel.org>; Fri, 17 Jul 2020 17:54:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YwrnrFkw";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="wBy+4nmu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C46A52064C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dOReh5qDmPgx1V8APhyrgPhQVQwIC3gdZ+3w1vC+wvY=; b=YwrnrFkw+MawwP1Uce9Z3K4xhP
	geo9Q25WM86yB/44/hywphun8ipGAzlXMETXyxz6bZX+2fi8bOKXZAe6VSSAJx70ub9dzdHwjmUJ5
	89q/brjhEJlIsgr1E1DJX5aJD5cgmxL7Y0ZPkdQIX1j+oLKZnXrHQhQ6Aun8i+FLDcvb5C1MT7PmY
	njAfsT++f6ezHeKi1g9YeoKFX3TQxblHySWpFQNMzqPuJXkKxW4KocBFfw1358i1aRJ/MWCnzXPOK
	t4CkpfgStrnQi6gkZPx/io3wtRO8d3OK7jsbQ+wkDO5usc0FyL5C/k4N3PtYgxOEKJQbE8lUGLs3g
	NwtBmMRw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jwUZC-0008SR-6b; Fri, 17 Jul 2020 17:54:38 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jwUZA-0008RJ-2z
 for linux-amlogic@lists.infradead.org; Fri, 17 Jul 2020 17:54:37 +0000
Received: by mail-pf1-x441.google.com with SMTP id u185so5777777pfu.1
 for <linux-amlogic@lists.infradead.org>; Fri, 17 Jul 2020 10:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=N3HEKEPcjwkPO+0ExL0KpbXRuBBvTMB7IfyH5dxYkjE=;
 b=wBy+4nmuGLj9vVsCaDABi2CMKhxvYbM64grFm+5muphhSj1cE750JrXjMz6M30rGFP
 U4GqLSC4lNkJd7QxMXOH9ajuZs0lmGTDNed/ap4gyM4VzVGhealZsbMlAv8IgL/8CC3S
 pBo2FoKXS0VwIXF+M+vRxMfoYI6ZFpgIRRyNKYm9LUhJVcHiWyU+Lr9dV4xLziX2s1VO
 yfW7Ho38uAkaKfRYKPR24jfzPk8vJX3xUBSgbVAyCWI+5zUsUJurt1xul50EgkJ/OsHW
 THgMh3L2g2LJMcrcGHzBALfJJ2e5AiQXw2VK5a0JtE5gAARLuLShHZbaTIAP1AD/3A+g
 vxCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version;
 bh=N3HEKEPcjwkPO+0ExL0KpbXRuBBvTMB7IfyH5dxYkjE=;
 b=GGXVRpam9T0EKtwblszk/JPIN7zTX5KCtFdntuJfoTjK0v9VOP4/W6jCft007XGTYC
 CT2I36KaszzPK8EdFrVFti9jpkPC6DRpeMI77toriNxPc3sPlMaQWbSCwYp3lMl5P1L8
 7QSwGQ9HNpLzlYHlGKZkKIE/mw2NDhyA/cc/HskVzqPmPlUxD8/1DXVpv94yliZvr6n6
 LYY3xKKdxjcpsGgMnxAnUgq6EhSbrmF1sqBgBbIuGrAKrR59t4/ez0ExXTcVF+BZd7Wa
 kR9RJFe+eFw3NZwANIcwAvo3rWkBBN0r2NTdM+46ZJjifKMm3LS+cXpPJqlgUC0bt8Ug
 gBZw==
X-Gm-Message-State: AOAM533vH2qLedu0t+EObR9S5zM2l2mHs3hcno1UM8K9Cal2EW0aX0Om
 Q4rm1Dj9PBPcoenNbYGanfhSJA==
X-Google-Smtp-Source: ABdhPJwBxYdqGDWf3a4i4bxLsJyilIFsUaMg3XGj4DC5GbvSXAluaYtFpjCtt3XmeYV98mqOk4XzPA==
X-Received: by 2002:a63:7c51:: with SMTP id l17mr9492872pgn.303.1595008474078; 
 Fri, 17 Jul 2020 10:54:34 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id i13sm3459765pjd.33.2020.07.17.10.54.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jul 2020 10:54:33 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Subject: [GIT PULL] arm64: dts: amlogic updates for v5.9
Date: Fri, 17 Jul 2020 10:54:33 -0700
Message-ID: <7h8sfif2na.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200717_135436_509366_3A881800 
X-CRM114-Status: UNSURE (   5.99  )
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
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The following changes since commit b3a9e3b9622ae10064826dccb4f7a52bd88c7407:

  Linux 5.8-rc1 (2020-06-14 12:45:04 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git tags/amlogic-dt64

for you to fetch changes up to 32b5f4b63487a24712c3bfa1d6a8eb9257beb8bd:

  arm64: dts: amlogic: Add the Ethernet "timing-adjustment" clock (2020-07-13 11:57:46 -0700)

----------------------------------------------------------------
arm64: dts: amlogic updates for v5.9
- meson-gx: Switch to the meson-ee-pwrc bindings
- add Khadas MCU nodes

----------------------------------------------------------------
Martin Blumenstingl (2):
      arm64: dts: meson-gx: Switch to the meson-ee-pwrc bindings
      arm64: dts: amlogic: Add the Ethernet "timing-adjustment" clock

Neil Armstrong (1):
      arm64: dts: meson-khadas-vim3: add Khadas MCU nodes

 arch/arm64/boot/dts/amlogic/meson-axg.dtsi         |  6 ++++--
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi  |  6 ++++--
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi          | 18 +++++++++-------
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi        | 12 +++++++----
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi         | 12 +++++++----
 arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi | 23 +++++++++++++++++++++
 6 files changed, 57 insertions(+), 20 deletions(-)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
