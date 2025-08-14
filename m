Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71873CA0EDC
	for <linux-amlogic@archiver.kernel.org>; Thu, 14 Aug 2025 20:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=O6M0/ESWvffaBXrm8j2dbwNrSKHBDshngyy33LHQIwc=; b=zADaAZTsGsLurh
	F6KeKXLh7XMZ0IeAYCqU+l18+u2APyEYoDZt1H2ZqpTcpYCXC8OX4hjmswutmUG+TbKKe/KEq1Jfp
	Dxj2C4uotfu1onxBs/6e+F5E0taa07f/Kh19wPhpuA6RfMUyvr5tNjkSfioJnrob2s9sEreQwLWEC
	KYmyjFqRhQrKsgLlMo8VQRqCFivvmoBDKQHqnfUoj+lU9g87GGPIFHdmIZ8aXCWA2w6LGxoPE9jsy
	pe2czr6jgTaaPT3Cev0DuMdOUihu9Tn9NTASmZvw8i0UkPNJaweLo/8Lf0BxzO+6HsfMNT2gPn9OC
	b3sreKOyO0UYddZWOnGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umeGu-00000000TrK-0z6w;
	Thu, 14 Aug 2025 20:10:00 +0000
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umeGs-00000000TqH-0oGD
	for linux-amlogic@lists.infradead.org;
	Thu, 14 Aug 2025 20:09:59 +0000
Received: by mail-qv1-xf34.google.com with SMTP id 6a1803df08f44-70a9f5d4d97so14580806d6.3
        for <linux-amlogic@lists.infradead.org>; Thu, 14 Aug 2025 13:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=libre.computer; s=google; t=1755202197; x=1755806997; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7OonhXd2J8nBVykMZsnyPIpsB/2woXa2NsCt/BWEBOM=;
        b=KD5Bm99mJz55bds7g8oldhS6Fy5oQF5E+KrnjbkPjNiJ4d5VOZiq4pdY/o4XCUXM6z
         ZIwbYEpfUKXmI+3Q5LuuqGD5LgrC6Puyeu12tb0KtoDk4K0NwsqXbjB2Lg04W75qP21J
         FWTdBSxJ2anzgKEncJJMrefUA7qHQkjG6fLKjGwJdCc8bvAbA/qGveUUwJXSrOdbJKdW
         aJ11D1Oe4zFCHqayvAlaXDHntTzgqWdAatdWLE0s8+h16MmisaU0/qLLxgPsOQoe26P/
         1D4kiz93hcfUUOrwpN1xvgEJCLYFcJeMBrneGHoTJBSbfP1TtMd1z6Y4k9QevkGBwWrC
         rQ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755202197; x=1755806997;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7OonhXd2J8nBVykMZsnyPIpsB/2woXa2NsCt/BWEBOM=;
        b=Nkmflu8pMHK+skFQ7/TnG4kU+B0t5A14dLumGmFiGToX33awSPDG4zuUb7/BqdkPNA
         uPBXB26EUO8sz5fx3bjwGFznANkNxp+OQAwCExP29W2gXIMxi9IHxgyXsQK13Qw4A0Be
         kbIC3LdUvxm36YTZze6p17+M+tDu0lkoSS+RpCkGe/Bfcyx8r9PRkQhOjPP6IKZbTybY
         1P3gHHMeZywTRMnHrcTFZKWgi6TDJRMF0w57VfwyyS2rMMgJj7r+5BDUGCTRBIMOXJZu
         yAGBUzRyzc6ZsZ9nrxk4MV/Yc3gJ0p5Y+ETh+UHRlljaw9cuc8oKPEqvtDwDCyQ3dU//
         TnBA==
X-Forwarded-Encrypted: i=1; AJvYcCXcjk9fgN5Gd95CXhKkPs+fphC3tf0+w5eZ9sPMxBvQCRpd+McsmyAw72E5xGkYJKX29s4yTd0M6Saeep+t@lists.infradead.org
X-Gm-Message-State: AOJu0YxPFfx5KNnfi0p6T52WddvYNMpzruI0mUhZ3VsRncKTopXYiWJO
	XRGn7hsTgC1mqiwMQ8wkIKI/Cszb4vwjsKoeWh1hbSH+9hDJnts+xGthzuQEIpy2UQ==
X-Gm-Gg: ASbGncs7vKuU4hhI1VyVtPxeImV/kwcGNj+mJ+vCZC8jqaxNvb0TiBbzXqU7BOgDTiD
	ZUsZ/qW8jG1bt1W6bjPpRAsQOok/3Iw79Mx1GYd9RH3lijd0BsPCai6d//se/jYNoTtNjnf7ZYY
	WKWsEiIUrBhvJzPKuY08Ia6ISH4kRfjcI/Kwlgja0j8bqyFlb1kJUyyXrEvB0PiI1SKkZqwUBVF
	KlHbHTyqjLXNUKd3p8Wn+VUM+8xy7hQxmPa/IzHiI3jXE7Yh73lHQnMCRQGjQZibkxZFE0ZtaKM
	rLblzTDGcPp9Z/UN3PV8RBB6ksTeqxry9z/vpH2HPEgjswGHCFsEPV+I6WnHmRgOPcV80fKt8rE
	5HQnW77i80ur1tclKWVlHm0fD78s=
X-Google-Smtp-Source: AGHT+IF9yvU2GiDOI9/uRKPRYD6OuBCxZE7IqB303/rhDfSaT/Vz79QLGfLeMmb2anmChCdl3JacAQ==
X-Received: by 2002:a05:6214:1c8d:b0:707:4daf:641 with SMTP id 6a1803df08f44-70af5b2d44fmr73346196d6.39.1755202196510;
        Thu, 14 Aug 2025 13:09:56 -0700 (PDT)
Received: from localhost ([172.56.29.94])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-70adc1cd94csm17651476d6.14.2025.08.14.13.09.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 13:09:56 -0700 (PDT)
From: Da Xue <da@libre.computer>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Da Xue <da@libre.computer>,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: meson-g12a: fix bit range for fixed sys and hifi pll
Date: Thu, 14 Aug 2025 16:09:53 -0400
Message-ID: <20250814200953.1969944-1-da@libre.computer>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_130958_513796_9466CBD5 
X-CRM114-Status: GOOD (  10.71  )
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

The bit range 17:0 does not match the datasheet for A311D / S905D3.
Change the bit range to 19:0 for FIX and HIFI PLLs to match datasheet.

There's no frac for sys pll so add that as well.

Signed-off-by: Da Xue <da@libre.computer>
---
 drivers/clk/meson/g12a.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index 66f0e817e416..f78cca619ca5 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -157,7 +157,7 @@ static struct clk_regmap g12a_fixed_pll_dco = {
 		.frac = {
 			.reg_off = HHI_FIX_PLL_CNTL1,
 			.shift   = 0,
-			.width   = 17,
+			.width   = 19,
 		},
 		.l = {
 			.reg_off = HHI_FIX_PLL_CNTL0,
@@ -223,6 +223,11 @@ static struct clk_regmap g12a_sys_pll_dco = {
 			.shift   = 10,
 			.width   = 5,
 		},
+		.frac = {
+			.reg_off = HHI_SYS_PLL_CNTL1,
+			.shift   = 0,
+			.width   = 19,
+		},
 		.l = {
 			.reg_off = HHI_SYS_PLL_CNTL0,
 			.shift   = 31,
@@ -1901,7 +1906,7 @@ static struct clk_regmap g12a_hifi_pll_dco = {
 		.frac = {
 			.reg_off = HHI_HIFI_PLL_CNTL1,
 			.shift   = 0,
-			.width   = 17,
+			.width   = 19,
 		},
 		.l = {
 			.reg_off = HHI_HIFI_PLL_CNTL0,
-- 
2.47.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
