Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3A7EC02185
	for <linux-amlogic@archiver.kernel.org>; Fri, 17 Jan 2025 16:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZSVfwwAwB4yzepOfGkvJxeGQHL1JTikK0zUlSipEFkY=; b=WOTmXQRb+qZ9ak
	+3wQ6nz0ElaNTwcOlfD4FSrGgWSn9bm5CV5Ky39vW3wIfz6xOZ9kIo30Ntw8fxPbij4MtEFlzqwI1
	6L4JTxMp5GdkZsq36veyQCOtdTb41n9E9Qc16Fz5tNdO6g+5fSiLDBx5HxM1bxjlLOOlEjrgOOR5j
	diPDuPldQ5BPy2lpTcQ90nF9G4UPtZz8bSOJHpKa3xGLv8XG16ghXjAG4gyoaWS9WIYNh0FNJVy/z
	S5v8ejQFu0PuSydaEjPk4DEIP1T7RbRnsUSCBAxUUmzhQ3PTsxP6GT7UFyy3uQ5pVrqmFevGtedmK
	Nbuqd7GuX1LTYKcQIdKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYomq-00000000ham-2hlx;
	Fri, 17 Jan 2025 16:01:32 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYokK-00000000h0h-0SjM
	for linux-amlogic@lists.infradead.org;
	Fri, 17 Jan 2025 15:58:58 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-38789e5b6a7so1286431f8f.1
        for <linux-amlogic@lists.infradead.org>; Fri, 17 Jan 2025 07:58:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1737129534; x=1737734334; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9g6Vyc9mOB7lyi/aQRjsa7BERTyMx1iof60RQwC2Xw0=;
        b=c5psHssT6jO8hXW/1Dd9exIemi1nnhagVftYR9PwtjKB1+aZFFyFgp/jdtH1B6miL+
         EarcCEkbGIfZkUguvKXGerMlFxSBW8oDaT1owvInokd+gwo1VJCT0q+rJ8T09hIXM4FV
         OmNMlcA/U347k6y02NPdFNO++WqDZofJrXkCW7DPyeBW5l12oqRyc7CFEafPXAK9l14w
         F2PXyWoZ6kMk2gdQb/iK5Mx79SsYygfLCmGWGLrJgOFp9vtqiicmQHGD5L7oCQihY83M
         o+8pIfS4PkYvAh7JzL2T8hyjGrbiJeYb8gUHkHsXkow55zsAZ+lrBcoHXIJqrFIgG8ZV
         7qTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737129534; x=1737734334;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9g6Vyc9mOB7lyi/aQRjsa7BERTyMx1iof60RQwC2Xw0=;
        b=bm6nBPLQz06AaRl4z560c+PdhRdR9gq4ghvmYEMTCx/SYRPJuBxubvZqxcgLsKtocO
         EoqQCcKtgEy1+vcj0+HBJTWQ7Hfsdn+pqbL/bwz23qPMUwg/d5TgT/kOLzp9S+4KtMVA
         68Gq5zu8WNZPxiz4piwa/tV/U9bEytjPrKvZTpif0C5a/I2mIhv1DYoJpfyw6uO+f5NV
         l8G6S3z0nB654QtxH3FscTGywy99Dlt4NFih6Aiw3WWCy0tUT/PNX51UFisFVwYNG0if
         9Y7yn6GqMm3VH4x2p/KO2/EbvdZCGR9lR+gx4ovhPdxbXMUVRB2XqvaOJ3tUlf5pp0/u
         0IMA==
X-Forwarded-Encrypted: i=1; AJvYcCUCS/SsNxML4E2Ozf7P83xNOJ9cdlgU0m3qDh9AowSTVbJyZz8AezA96FIm+bwfo5ZEMj8ZOokTN/DDen9t@lists.infradead.org
X-Gm-Message-State: AOJu0Yyj5HT45kfF/MUuQp2vVsN5aNudBD10Vjf4iY6DeCICRIPcRgxR
	0MPi6eq9bijXC5HWp6hosGdSg0lX81oF0azr+879mPoc+/CsoYFQVWPp/ijrAyw=
X-Gm-Gg: ASbGnct8BiymGl5BKWYWRnsVBL09gL/qXrxHb3jSVhe0CwQo8QePRqXIuUOtIZgDwE+
	Py+Y3O3jQyfQKqQRdomRe8NOVbHCVXngxUmZXhNNl7rdunguOwMwwNFymsWe11bfDuQQyctoQQP
	RSr3ivJVGGyJnXpkZMRn+JMc1YKHUH6SmqR/I2OxHyxefbFzHxCTOg8BGQl0IOaTHky3o9swS/Q
	LaOlV584jy9Qi4FVLEy2r+b9/fPaQLrvksQauHrADkPnDMRK4+8+XwF1Y2jU/ob1NLOEgI=
X-Google-Smtp-Source: AGHT+IEFctnhDoaU9MlqplgOMTYAM82vSV45AUZja9u72PfPs4/igV3EGZ+h0AvIYK+a+WQ9znx4wQ==
X-Received: by 2002:a5d:5f8c:0:b0:385:ef2f:92ad with SMTP id ffacd0b85a97d-38bf564d5e7mr3579724f8f.10.1737129533948;
        Fri, 17 Jan 2025 07:58:53 -0800 (PST)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:b019:599d:2d51:f3c7])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-437c7528076sm99382195e9.25.2025.01.17.07.58.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 07:58:53 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH v2 0/4] clk: amlogic: drop clk_regmap tables
Date: Fri, 17 Jan 2025 16:58:29 +0100
Message-Id: <20250117-amlogic-clk-drop-clk-regmap-tables-v2-0-d1f77cb0773e@baylibre.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIACV+imcC/5WNTQ6CMBBGr0K6dgytFtSV9zAs+jPAxELJlBAJ4
 e5WbuDue9/ivU0kZMIkHsUmGBdKFMcM6lQI15uxQyCfWahSXaVSJZghxI4cuPAGz3E6BmM3mAl
 mYwMmkDfUrtW1uuhKZNHE2NLniLyazD2lOfJ6NBf5e//SLxJKuFfeV7p2trX+ac0ayDKeXRxEs
 +/7F+6SzzTXAAAA
X-Change-ID: 20241220-amlogic-clk-drop-clk-regmap-tables-18e5cf572356
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3163; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=5GBtK/Zufm73VK+pUpHd8niOXTdAdy+WcFTCquXSAPQ=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBnin44kKraKDYPejH2n7CpehSMnuaRgAfHt2jiF
 VRluJQV/haJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZ4p+OAAKCRDm/A8cN/La
 hUAmD/9ervITo4Mtbw0X+1dsHMEeAK0MuNr7/AUtzXrn+UneQnOMd2wUL5CBYI2AiUrAjlmwLX+
 sUibYfTZwQ3MAgJ/HfDaAE9j12xOvRRfUuZWZVtR8/OmgbKGp3N390VEInxxXQFW8lyoqGCi8a2
 Pg60h4jUq51hu3c169X6IHmEm1Q2ILokgQ7V40UJjAndaOckZALQXjBJGaD67T6rdLm0fK35+OA
 EmqPYYz1Ih27N3R3n7wEfxIW89oTWewHzc6ITqZQsVnvwyVUC7jHn8CsZyPtsH3Co4PFQ9wkYr2
 U0sLKsxHBQFzdzDFBz7AnIUO6hH4DZ9bWASttBcCmt9hW/xgwwSSkmj23v3SsuUU/vgsVI1A0vi
 e1i5ZYJpi6sm+Z8yUE15+SEYA5IKBE/RfNdwNYQPdOC/omsFWLbF2dR3hRDTV+x+2hwpAw5q3i4
 7kZk+b+RJbsbeSAxsXSEu8TzCPtdbu8FWfXOwoI8PbWWjTqxDYD7eyyuSVPbn5yvO7VvYiS0N1k
 ddJM2nCbBH3igOzA3CYEVH2y2i59ob/T+HAgUG5qoO9BDwBrLZb+7HM0RqB3GbDS4b2v1ilePoV
 JE6er0pTarMGAq+Pz1+mrnt8VNBuhOvFEqPDye+b0Hvw8WcGPfxvcVEX+YLRbbTpPCboPwXAgsL
 IeEf1U8GFpubr0w==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_075856_151110_16F1E916 
X-CRM114-Status: GOOD (  11.78  )
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

This patchset removes the needs for clk_regmap tables in each clock
controller driver. Those were used to populate regmap with in the regmap
based clocks.

This saves memory and ease maintenance a bit.

This is the 1st step in a series of rework of Amlogic clocks, to clean-up,
increase code re-use and ease future maintenance.

Changes in v2:
- Add clk_hw_get_of_node and kunit tests for the new helpers
- Split patch adding the .init() and the dropping the table
- Drop devres based solution and something temporary but simple
  while a more generic solution to hook controller init is discussed.
- Link to v1: https://lore.kernel.org/r/20241220-amlogic-clk-drop-clk-regmap-tables-v1-0-96dd657cbfbd@baylibre.com

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
Jerome Brunet (4):
      clk: add a clk_hw helpers to get the clock device or device_node
      clk: amlogic: get regmap with clk_regmap_init
      clk: amlogic: drop clk_regmap tables
      clk: amlogic: s4: remove unused data

 drivers/clk/Makefile                    |   1 +
 drivers/clk/clk.c                       |  33 +++
 drivers/clk/clk_test.c                  | 116 +++++++--
 drivers/clk/kunit_clk_dummy_device.dtso |  10 +
 drivers/clk/meson/Kconfig               |   1 +
 drivers/clk/meson/a1-peripherals.c      | 163 +-----------
 drivers/clk/meson/a1-pll.c              |  16 +-
 drivers/clk/meson/axg-aoclk.c           |  22 --
 drivers/clk/meson/axg-audio.c           | 433 --------------------------------
 drivers/clk/meson/axg.c                 | 131 ----------
 drivers/clk/meson/c3-peripherals.c      | 210 +---------------
 drivers/clk/meson/c3-pll.c              |  32 +--
 drivers/clk/meson/clk-cpu-dyndiv.c      |   1 +
 drivers/clk/meson/clk-dualdiv.c         |   2 +
 drivers/clk/meson/clk-mpll.c            |   6 +
 drivers/clk/meson/clk-phase.c           |  11 +
 drivers/clk/meson/clk-pll.c             |   7 +
 drivers/clk/meson/clk-regmap.c          |  49 ++++
 drivers/clk/meson/clk-regmap.h          |   4 +
 drivers/clk/meson/g12a-aoclk.c          |  34 ---
 drivers/clk/meson/g12a.c                | 261 -------------------
 drivers/clk/meson/gxbb-aoclk.c          |  19 --
 drivers/clk/meson/gxbb.c                | 393 -----------------------------
 drivers/clk/meson/meson-aoclk.c         |   5 +-
 drivers/clk/meson/meson-aoclk.h         |   2 -
 drivers/clk/meson/meson-eeclk.c         |   4 -
 drivers/clk/meson/meson-eeclk.h         |   2 -
 drivers/clk/meson/meson8-ddr.c          |   9 -
 drivers/clk/meson/meson8b.c             | 200 ---------------
 drivers/clk/meson/s4-peripherals.c      | 341 -------------------------
 drivers/clk/meson/s4-pll.c              |  31 ---
 drivers/clk/meson/sclk-div.c            |   5 +
 drivers/clk/meson/vclk.c                |   2 +
 drivers/clk/meson/vid-pll-div.c         |   1 +
 include/linux/clk-provider.h            |   2 +
 35 files changed, 239 insertions(+), 2320 deletions(-)
---
base-commit: 1909d0d351ed98fdb9f5cbe377213ba0154bf2e0
change-id: 20241220-amlogic-clk-drop-clk-regmap-tables-18e5cf572356

Best regards,
-- 
Jerome


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
