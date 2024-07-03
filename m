Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B141C2BD09
	for <linux-amlogic@archiver.kernel.org>; Wed,  3 Jul 2024 09:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6E3gKJdXEhxQbwhsnlGxLvEGVuqE0CyB8I/2KBe8fj8=; b=EfGF3pb92gCiGn
	KA4sxxOceV0LGAhrOAtMzwjoIdutR7WoAU2wYAiZZb527S35P8jw9uOa4LbquxXntQH/NEwoanpLT
	Cv63kiLiyaYfmTGfTql/Z76wQEWkYm2CLWQqixkOgHGHqRUhd3j7rbuKMvpHZUCP0pd5LQS/N7Rn3
	uuelgFT7YeYAzFp1zO8HsHfSLcT+LIBXEAjPyPmTJ4q/eIOX2zWvFHv4tkTFhA1+kHbasKCesdTim
	0IaAvJHhpyetSX0r/SRbytOEmkS/2kiTR4tIcSiaEQb6qSb4g0bSWdJ2sjpyEUOqXerRE/HAZOjlM
	kfvtSTMEiNRmcoz5FUCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOweK-00000009cWm-2AdK;
	Wed, 03 Jul 2024 09:51:40 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOwdJ-00000009bvp-18Rh;
	Wed, 03 Jul 2024 09:50:38 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-58bac81f341so1721114a12.0;
        Wed, 03 Jul 2024 02:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720000235; x=1720605035; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q5sGY1MHMh4vP9RTlfTXcp30OvUGJ6Up0VGY07imbb4=;
        b=VKG4P0+E4x5O//EI2iYJVFnjjnMq4zoFOEyEs9PYOJHiYHBru4Tpc7s9lbFICvq5pt
         x0i9Ws3G6YiZ7P+fe2QK94SHtvIZd54PKrUEsamSflgCcR7uhbhCtkC75GnBxuiKoMoV
         G/WUUdyB7ellSfHOHpgmcD348FSfQFNMgv18Ug2X2FfRn9jN28U9Rba1KkEaGWJR4DFp
         EKJe6Su/w88h4PUz/FcKgpoeUa2DDBNA+Fouw/Zo2QgxY/LoSIfdj40Gmg8qvXuL/VqY
         lczLlII3xxPMi9NqPqFQxOxGptSSD/WIiOxs8oc2d8iE8rLlLC28HVgWj2OIbycHyXoQ
         cc/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720000235; x=1720605035;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q5sGY1MHMh4vP9RTlfTXcp30OvUGJ6Up0VGY07imbb4=;
        b=Pf8Tt5DYBBH3riFrXVMYPCtNiOlJoe5XyLJ2bUxmFVdU+1k2kjsHZu87VUYBe4aX67
         pPagBFPLPvDCfBf7BpftSJw3WbhYBoR5BtkJg0J1gPGkGFmYZ3Ta9P3sTIhXAJDiknsh
         WLJGRh9U5WRbaeWW334/eOG3ope+SSdX0yRdx3rZR2RUMJ8QMLyKRpBBcjjnRLqB6Ldh
         SLRUOKgDTYY4c1fSc5QuNcEyhElXskBaYZBusbDlnSfjE0pQQlD9R36el+Dc8h2xfT0c
         jCWovB2bufdOm4OQO9Hhrwh4+YOi6r1UaydhKUKodhZ6fGbE9lbhfSUQa1WSbiZAfovy
         NdPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUACPG2GcgNndcxKTwdB+pWvKUb8BSOZKuwsALoztz6tcg09vsoheiwZPfJq6Jmfu7k5MqKN+gqunQMpcANB1cu8Q5wJLWOrt6DCNBfqG+h+2B+R1s=
X-Gm-Message-State: AOJu0Yx35ffRNvAw01FKKmCvn0DLCH2DVBFtF7jI30hRgkSFvMHWaqiZ
	CCyWgcRJW1M065FbAijVhV6DaFSqkhpQp8phpiB2b1EIU+kA81NJ
X-Google-Smtp-Source: AGHT+IHJvWuVEjeg7jS3YGWzwBblEC1aBEjiRtx7Wx+1gkXGABMGiz68aiczGU0eMJw/KYhEPM88eA==
X-Received: by 2002:a05:6402:34c5:b0:57d:4cbc:cb59 with SMTP id 4fb4d7f45d1cf-5879f984a22mr7916813a12.25.1720000235436;
        Wed, 03 Jul 2024 02:50:35 -0700 (PDT)
Received: from [127.0.1.1] (91-118-163-37.static.upcbusiness.at. [91.118.163.37])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-58b4a97b1f3sm2082130a12.18.2024.07.03.02.50.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 02:50:34 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Wed, 03 Jul 2024 11:50:19 +0200
Subject: [PATCH 06/10] clk: meson: s4: pll: Constify struct regmap_config
MIME-Version: 1.0
Message-Id: <20240703-clk-const-regmap-v1-6-7d15a0671d6f@gmail.com>
References: <20240703-clk-const-regmap-v1-0-7d15a0671d6f@gmail.com>
In-Reply-To: <20240703-clk-const-regmap-v1-0-7d15a0671d6f@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Vladimir Zapolskiy <vz@mleia.com>, Bjorn Andersson <andersson@kernel.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Michal Simek <michal.simek@amd.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720000225; l=782;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=QjI2XZ6DpFgtcs0s52itimxDAtU+za0z6ETKz2I5xKg=;
 b=shXXui07Vv0SxzDWgmKblWiiO/F6QjUD3Gg2XbBPFxNeKr/3DO+TzrHVENvorbTe6ULfqDHDp
 pgzaktXTA0kAf2uTyPcMVNSPw+MBMfrFC59IJ9aaKMY+q4QO4+9Fx/x
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_025037_346475_3720962C 
X-CRM114-Status: GOOD (  11.50  )
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

`clkc_regmap_config` is not modified and can be declared as const to
 move its data to a read-only section.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/clk/meson/s4-pll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/meson/s4-pll.c b/drivers/clk/meson/s4-pll.c
index c2afade24f9f..27c10fc499be 100644
--- a/drivers/clk/meson/s4-pll.c
+++ b/drivers/clk/meson/s4-pll.c
@@ -799,7 +799,7 @@ static const struct reg_sequence s4_init_regs[] = {
 	{ .reg = ANACTRL_MPLL_CTRL0,	.def = 0x00000543 },
 };
 
-static struct regmap_config clkc_regmap_config = {
+static const struct regmap_config clkc_regmap_config = {
 	.reg_bits       = 32,
 	.val_bits       = 32,
 	.reg_stride     = 4,

-- 
2.40.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
