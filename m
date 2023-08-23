Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B7CAEE49A0
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Aug 2023 08:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hvzQk8WqgIWroR52G0uPXrTv3CS4+M213DRlxnqd6E4=; b=3aZ2DPB6Y214Lg
	tfiAJjmQtOwSUAAcdX/tU1jHeTEhsBxuC28jPNAWxVKzYGwMiKx5s7tnhfZQkHKJKdFeuLN/0g0TA
	JDDOF2MAGvR52P9Hv7lbOs9ey2pzyg9YqBzIoJzR3R3NdAfJaO2k/RnNJ9T2napzHihE4Ls+Haj/C
	/y1Zz5HvW/E7OYGAYU1Fk8jljSk7xD3I8+xQ/YjiDYmuFswczpdg6Ihr2fXl3hHi5p4Xv/y9d5Bz+
	SOMiECV13zf5HVk0O7cu1ukdAjgZwP9TPZ7do3gCMGH5ap+YbaXa3WngTw5rnSRwJmY7nbwi5P6TU
	qoQw37raPDljE4Dyuuqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYjeh-0000uw-1W;
	Wed, 23 Aug 2023 08:55:59 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYjee-0000tP-0x
	for linux-amlogic@lists.infradead.org;
	Wed, 23 Aug 2023 08:55:57 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-99c3d3c3db9so712240866b.3
        for <linux-amlogic@lists.infradead.org>; Wed, 23 Aug 2023 01:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692780952; x=1693385752;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AYGyGHMZwBxdZ1RQTk/EEbCraB4/0nD5+ya3KFYbydA=;
        b=zrywOA/hGJM0tQr04pvblm2mnQ/OoscDLbdDxFolm46XWpN9mcZ2c58rQ5jm+GBSdl
         Pvopgy4l7Ut/PUxHQH05+kbrdIYFeOIGOOTnmp/R8cK0ufiZl2vaAFadbIoPz1LJ9gT0
         yhsVNikPAaObvRiMLhwzU0leI8UY+VHhpds33hpSJ4fSz0BHAO+RXyn1hk98GizB7psq
         AX6aHIMnbjs3S7hfqb+ruPgsK/t2nn0ONjoU7WS3z/p6+h1KHSnd+sYDTrn2hJglswP3
         uwfLxLjDMFSTcHPDTI9fYKG6LL/qHF+v8CcOPtWUgiGsS7qUikI8+QAM4nm3i5FgDTEc
         QL6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692780952; x=1693385752;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AYGyGHMZwBxdZ1RQTk/EEbCraB4/0nD5+ya3KFYbydA=;
        b=jaHJI9aePsk0hA9udLh+ra7CdUfWRVfWj34+3HmgUWUESFZMnHqoE9ElIoImRYAahA
         LS7er5SzonvImIq0wDMD1xhwIhbI9dXVHbDkf280p2tO6VrNheyP9XeB9GJSL5OcCQWE
         eDBo/pKvnjhAXbw1HscD/G0LAcqetVadrsvRnzw0eiWxSFXsSwFzryCy2OOGYi+PEmpE
         qw5v1dW0+dK/NJMC0h9LDVrOy/92ATB9p3TvXlCCE8HFOUpfU61WHdHnGlWdEGF0/s/+
         tFI2rqIYlDFKNr8FTGG53+9p6KbE4GEwYt+72uTjDyxGw5i9jFPtiPuIqu/GVX+uLY0W
         FXpA==
X-Gm-Message-State: AOJu0Yzbz/ZLyaxKANzVWrZYYLH6Bc5zTkOidZ9IynTrhb7p51UQnetO
	NOk+JzhhZDmmFf/vDq135fspiw==
X-Google-Smtp-Source: AGHT+IEvHUcT/doZpFo+FtdyhmCu2TD96+TXGBsn4uRWu6N2tGNhvyrNls0sicSwD5Dbeg8MvBxR3w==
X-Received: by 2002:a17:906:2250:b0:99b:ed18:7a10 with SMTP id 16-20020a170906225000b0099bed187a10mr9473272ejr.36.1692780952060;
        Wed, 23 Aug 2023 01:55:52 -0700 (PDT)
Received: from krzk-bin.. ([77.252.47.198])
        by smtp.gmail.com with ESMTPSA id j26-20020a170906255a00b009a1e0349c4csm566862ejb.23.2023.08.23.01.55.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 01:55:51 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] pinctrl: use capital "OR" for multiple licenses in SPDX
Date: Wed, 23 Aug 2023 10:55:46 +0200
Message-Id: <20230823085546.116494-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_015556_333373_CD48B438 
X-CRM114-Status: GOOD (  11.16  )
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

Documentation/process/license-rules.rst and checkpatch expect the SPDX
identifier syntax for multiple licenses to use capital "OR".  Correct it
to keep consistent format and avoid copy-paste issues.

Correct also the placement of SPDX identifier in pinctrl-meson-axg
files:

  WARNING: Misplaced SPDX-License-Identifier tag - use line 1 instead

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pinctrl/meson/pinctrl-meson-axg-pmx.c | 3 +--
 drivers/pinctrl/meson/pinctrl-meson-axg-pmx.h | 2 +-
 drivers/pinctrl/meson/pinctrl-meson-axg.c     | 3 +--
 drivers/pinctrl/meson/pinctrl-meson-g12a.c    | 2 +-
 drivers/pinctrl/pinctrl-mlxbf3.c              | 2 +-
 5 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/meson/pinctrl-meson-axg-pmx.c b/drivers/pinctrl/meson/pinctrl-meson-axg-pmx.c
index 80c43683c789..ae3f8d0da05f 100644
--- a/drivers/pinctrl/meson/pinctrl-meson-axg-pmx.c
+++ b/drivers/pinctrl/meson/pinctrl-meson-axg-pmx.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
 /*
  * Second generation of pinmux driver for Amlogic Meson-AXG SoC.
  *
@@ -6,8 +7,6 @@
  *
  * Copyright (c) 2017 Amlogic, Inc. All rights reserved.
  * Author: Xingyu Chen <xingyu.chen@amlogic.com>
- *
- * SPDX-License-Identifier: (GPL-2.0+ or MIT)
  */
 
 /*
diff --git a/drivers/pinctrl/meson/pinctrl-meson-axg-pmx.h b/drivers/pinctrl/meson/pinctrl-meson-axg-pmx.h
index aa79d7ecee00..67147ebaef1b 100644
--- a/drivers/pinctrl/meson/pinctrl-meson-axg-pmx.h
+++ b/drivers/pinctrl/meson/pinctrl-meson-axg-pmx.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: (GPL-2.0+ or MIT) */
+/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
 /*
  * Copyright (c) 2017 Baylibre SAS.
  * Author:  Jerome Brunet  <jbrunet@baylibre.com>
diff --git a/drivers/pinctrl/meson/pinctrl-meson-axg.c b/drivers/pinctrl/meson/pinctrl-meson-axg.c
index d249a035c2b9..6667c9d0238f 100644
--- a/drivers/pinctrl/meson/pinctrl-meson-axg.c
+++ b/drivers/pinctrl/meson/pinctrl-meson-axg.c
@@ -1,10 +1,9 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
 /*
  * Pin controller and GPIO driver for Amlogic Meson AXG SoC.
  *
  * Copyright (c) 2017 Amlogic, Inc. All rights reserved.
  * Author: Xingyu Chen <xingyu.chen@amlogic.com>
- *
- * SPDX-License-Identifier: (GPL-2.0+ or MIT)
  */
 
 #include <dt-bindings/gpio/meson-axg-gpio.h>
diff --git a/drivers/pinctrl/meson/pinctrl-meson-g12a.c b/drivers/pinctrl/meson/pinctrl-meson-g12a.c
index 3cd86d6a0a60..2c17891ba6a9 100644
--- a/drivers/pinctrl/meson/pinctrl-meson-g12a.c
+++ b/drivers/pinctrl/meson/pinctrl-meson-g12a.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: (GPL-2.0+ or MIT)
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
 /*
  * Pin controller and GPIO driver for Amlogic Meson G12A SoC.
  *
diff --git a/drivers/pinctrl/pinctrl-mlxbf3.c b/drivers/pinctrl/pinctrl-mlxbf3.c
index d9944e6a0af9..903606b64d2f 100644
--- a/drivers/pinctrl/pinctrl-mlxbf3.c
+++ b/drivers/pinctrl/pinctrl-mlxbf3.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0-only or BSD-3-Clause
+// SPDX-License-Identifier: GPL-2.0-only OR BSD-3-Clause
 /* Copyright (C) 2022 NVIDIA CORPORATION & AFFILIATES */
 
 #include <linux/bitfield.h>
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
