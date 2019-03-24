Return-Path: <SRS0=t5ee=R3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09EC3C43381
	for <linux-amlogic@archiver.kernel.org>; Sun, 24 Mar 2019 15:12:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9905B222EC
	for <linux-amlogic@archiver.kernel.org>; Sun, 24 Mar 2019 15:12:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sT8uiH/S";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="hs3OUz0J"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9905B222EC
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=54jsh8b8o7PmBFht3FHhrvtbYio3PKyxxKYslfHhkiM=; b=sT8uiH/SwhgZyI
	1k5XyI2KFBEKdH4Xe7GVt2rPzoPy1+LYTEC4H+qYEgHEyivc0cCpx+IQapFNful3IsPNxuoNAXITB
	wWpGE8zZ6XC0gFxOkIoTHzqa4O8ImPBuAT1aWx+05mAfhfdBw+xr8hN9y8mvrIdNCYkFtVJBkcEhf
	5SyG6wpnA1OEIKlBGtCU7aCXJWgIIHqx2cGe7Jp0VrsnkjrI270UJjUthwaTeiMokRDw8CduAxmCK
	RGkOIAnm8dYn1kriRAx72XPo4bqwA+5poudgyjqWy+SAphkNGSBpGRuK7/FaEHDQyl6zeXzMYk3X+
	HPLDbWc1oUC1oYziMoIA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h84n4-0003Z3-Fw; Sun, 24 Mar 2019 15:12:02 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h84mj-00037i-2f; Sun, 24 Mar 2019 15:11:44 +0000
Received: by mail-wm1-x341.google.com with SMTP id z24so3173818wmi.5;
 Sun, 24 Mar 2019 08:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1iOOQJkzqOi5ynjs0xO8WYzOHUwCsH2EAzRs/Ax8GJE=;
 b=hs3OUz0JbxZxme1r8SwQL0kZwc6wySPZXX9gIRv7FU+yXvG2XCjdHfMktnUdqRcyI3
 w1Co1Y+luHghdARp5MuWen7kUR6+n3IySEG1lXnPrjBk5BNZoX3xBeh3o17WR1OhRoCP
 XshgrjbDjUejPMI8YQhFPUlgEFyzbFTxi8Z1KAwaWGrU1hS1fvU0VLiwUbhklWY7Zqov
 O7j272zDZtSLuOQ/JDkHC6/vOWXLAAQNM1QfjQBBCBW92I69YYpCqWsTRthXQ1Zt4C1u
 RKgPpywTHqMeal6CdAPEuw5sU3iB7ySblKZWqH4TgAdR+meV6bER4Edn+rxLho9FwrhJ
 SRyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1iOOQJkzqOi5ynjs0xO8WYzOHUwCsH2EAzRs/Ax8GJE=;
 b=l0/aD0zNs9nkEEq7uUgdpuxRTy04Htcfr4XpAAV40s4/VRpmD+Pdn8+5fbzT2uY9sp
 gy8RxKpmxrtYBWTnvIePpjZFrriHtjppXnWTSbWeo8taf+8EaxpHjMGrveATfzLlhLfv
 8iVeZx2TMWB79RtvUdb50dYMHIXUmxflZXcp5r4Sj7Qh11sFlWSdroT+gTAH3pQQLXMe
 dUD4/1MU4S7+Hbllbx2yCZb+mj+rNaUK5aT+JWxCJMPwcOzOoNMQLKGROQAv9eLKnFjC
 siz2fNh4tN1xnuP/ROBWrp3DVggjvo6uS3RSpa92WVcJ+FaThc2RiMsSE1B4naYv6fIX
 8WNg==
X-Gm-Message-State: APjAAAWGFJF/aB8ciMBVxoi2fBUZ5Sgygd3s5r8HhKWvsX94VJP48Kiv
 kYVlVV7bgWxquyF+QskaVHw=
X-Google-Smtp-Source: APXvYqywixNeYOzIbg+q68/qtFvRc6hmSkULAK2cS8wT1U0oQ6U1t3UZUj7/NyH/qQsskEZbNUp3sA==
X-Received: by 2002:a1c:ef1a:: with SMTP id n26mr9184065wmh.67.1553440293194; 
 Sun, 24 Mar 2019 08:11:33 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300DCD7399900428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:dc:d739:9900:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id 66sm13697730wmd.3.2019.03.24.08.11.31
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 24 Mar 2019 08:11:32 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: narmstrong@baylibre.com, jbrunet@baylibre.com,
 linux-amlogic@lists.infradead.org
Subject: [PATCH v2 0/4] clk: meson8b: add the VPU clock tree
Date: Sun, 24 Mar 2019 16:11:00 +0100
Message-Id: <20190324151104.18397-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190324_081141_115482_82E7FC23 
X-CRM114-Status: GOOD (  11.28  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This adds the VPU clock tree for Meson8, Meson8b and Meson8m2.
The VPU clock tree is slightly different on all three SoCs. The details
are explained in patch #4.

Meson8m2 requires the previously unsupported "gp_pll" PLL. This PLL only
exists on Meson8m2 - Meson8 and Meson8b don't have it.
A separate clk_hw_onecell_data is introduced for Meson8m2 (using the
compatible string which is already available) to account for this SoC
specific clock setup.

dependencies:
This series is meant to be applied on top of my other patch from [0]:
  dt-bindings: clock: meson8b: drop the "ABP" clock definition

changes since v1 at [1]:
- fixed typo in the subject of patch #2 (spotted by Neil)
- collected Reviewed-by tags from Neil (thank you!)


[0] https://patchwork.kernel.org/patch/10860387/
[1] https://patchwork.kernel.org/cover/10860401/


Martin Blumenstingl (4):
  dt-bindings: clock: meson8b: export the VPU clock
  clk: meson: meson8b: use a separate clock table for Meson8m2
  clk: meson: meson8b: add support for the GP_PLL clock on Meson8m2
  clk: meson: meson8b: add the VPU clock trees

 drivers/clk/meson/meson8b.c              | 422 ++++++++++++++++++++++-
 drivers/clk/meson/meson8b.h              |  12 +-
 include/dt-bindings/clock/meson8b-clkc.h |   1 +
 3 files changed, 433 insertions(+), 2 deletions(-)

-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
