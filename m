Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F7E2C48260
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Feb 2024 14:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fgGCKB8C+5qit0QuUIQcr4l9a0zkWWC2qS8q4dwWfgs=; b=PoOSGmt4EcMLLa
	FH/Au7K94q8PbCm6+10MC0Z7kdtdQSD1ONWQPXY/LiLAb+CcL7i6nn6o9KvQZBWVtM/SDC8QzllSb
	3CkKVRNMFri6rkKcIKEYt1dp9Oxbzote8ew39yKa4CZvP70IcbI5b6LPGq+ZA8w/TVW8UmnrNQSEI
	DDnTHfiTsuI5JjI6rS6Xw0HtPSQlpsxMFrczEMfaIrwb1Qunjlt4HeSaV3UqZ79KWiaJyEuUNFyT/
	H298SJRaBI1XpI+uR2pSxV6EJ9/rb6z1Q75VmasklwK8WellI/eA73z3g7voJTEvMVW/Jmf1OzyAO
	6rZOJDVvpn3JTWS1Jumw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZtn2-00000009Vzy-0oCn;
	Tue, 13 Feb 2024 14:29:40 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZtmL-00000009VrC-03pT
	for linux-amlogic@lists.infradead.org;
	Tue, 13 Feb 2024 14:29:00 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-40fd72f7125so35533925e9.1
        for <linux-amlogic@lists.infradead.org>; Tue, 13 Feb 2024 06:28:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1707834527; x=1708439327; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/P5OEV1VZDQ2Y6WiXRGS4Q89qwUlbC22uYjuCjHTuIU=;
        b=MlT+TO0yO1npUwzYjjol4K/pPvNrNld9fU2ydfS4qNoMnjiEiiW3isAJL2WIHsd7BY
         6g7PeDGXkeweQCEoONjihJXySlRZn4l93Fxm0KAUxXMr8yjD+B0Vuo5KH0FyHxxEwlqf
         g/FtZ7g/9yQ/qGl5R8Af0aXEszCx1RBBxyroAIw3E0Ojl1cVSE5TuvrV0E/V7iDei6TR
         y2Yt8WE/R5xFWiqehQ+Hi8glpiU8h9wuC9t7IkdJ+w6yjfIts5sjo8nXs+V3Sn7srLxU
         8cq9L88oK0uKtbV5BGVigmQC78LomgebpvER7MVONCU/B5uD33j0HZEKB/bDhRdHeFSG
         YbTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707834527; x=1708439327;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/P5OEV1VZDQ2Y6WiXRGS4Q89qwUlbC22uYjuCjHTuIU=;
        b=xUfR0w9/tLidFBFvCdv/IRo7kLYtHjhNhvyl6NLhOikVRIdEE+XR+NPcwukXOQIu0O
         kTcrBkWhGTTIiDlYZRLbN56b6J0d2ow+MV5+I4RcQ0zM9iWI3oycDxwTs4go/4wP8t2O
         ntO41wU/sM31OSgyS9tG/J8DYX0rx8T1tJEzysWNd52tgPSwS2rQNwmwlFWMrV4Kh3AX
         bCgfZ3fSjkly8zwR2WrhKToDVYSivFORrHdgHzLSL4fY9MPwdsOXdlGAyanLoU+2EFGB
         M5jbVTMBG7BWWUJ8qzJT3hziwzeLNJtRclKEx4IRyv8gfIW3t9po0/KTaaAN5IIS/9Kv
         sRcQ==
X-Forwarded-Encrypted: i=1; AJvYcCWcotAH8yQJeD1plknTWqImntUGv4Ex6OPwphmHTkVVsmZLlJSkf9Vab8+hGLDMEfWayirFuyoCWx4rhTVyl7qrx/m5rFNbDGVcjLPFxcRufSw=
X-Gm-Message-State: AOJu0Yz54y2tba0dtzo8NGJ0dBzPNVHMqRj4zviFaQmbdbOVyyRccPXX
	0W13JnszMzxuueTiRgef17h4m0C/DBc2t70YAw1i+1XwIKPNu6IEKNCF6lwmwzg=
X-Google-Smtp-Source: AGHT+IGiC793LinMHbSN0tqOwAmEoL553oU7/A6JdVsIKr0NUqRw6b4JfedsvFaXrsTmYf3tExqs3A==
X-Received: by 2002:a5d:6049:0:b0:33b:830c:4747 with SMTP id j9-20020a5d6049000000b0033b830c4747mr4011709wrt.30.1707834527328;
        Tue, 13 Feb 2024 06:28:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXquBLIVBSe9TCBJGJYv2su4y13BafAYhwiX0ElOknAk6XMiKuZMqZpHY/sqIlHyFuQkPvSj03zBEvur9j88JaXMgQ9THxZYuC5RSujIuZBWhZbKIiLg3h6nk4DEgt2wcNOfWXzIamNTygjXtGFE7gxeuKEx+R1MNhm5+R8wsZpmRWscM+awpuwYtaYKLuMLHMagF0zXI2t7386evdi4s6AgCL+lT/aBCVJiwS/7tprLpJlWK59xPN/L7yhi7BuHSVOA+5bL+593PDYrttx5yVi1vpAh7cwbHAkxLS0iTLGlDspuk0dfeYzwA84OVRbOF0Q7jBGIFaU1mI6vMYq5vdJlwJr1ActrIFIPInnbcCWQQhMmV270rvyP/zQpekscueZ0lTROJwdFu93vyfJp/9w7T9kZXscuLUseKLoR9w4m8BHoJpJiZdwQoXXtJcGE16KBDuhR8N/T4G8QiQY2yA+eQjnilujsne457Mzk7zcEwST2R8UkRTUJtS6l09c9g==
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:509b:4241:48a3:e3e0])
        by smtp.googlemail.com with ESMTPSA id bs25-20020a056000071900b0033b45bdb2a1sm9880114wrb.4.2024.02.13.06.28.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 06:28:46 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v2] nvmem: meson-efuse: fix function pointer type mismatch
Date: Tue, 13 Feb 2024 15:28:28 +0100
Message-ID: <20240213142831.3069049-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_062857_413051_4A1FF010 
X-CRM114-Status: GOOD (  11.93  )
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

clang-16 warns about casting functions to incompatible types, as is done
here to call clk_disable_unprepare:

drivers/nvmem/meson-efuse.c:78:12: error: cast from 'void (*)(struct clk *)' to 'void (*)(void *)' converts to incompatible function type [-Werror,-Wcast-function-type-strict]
   78 |                                        (void(*)(void *))clk_disable_unprepare,

The pattern of getting, enabling and setting a disable callback for a
clock can be replaced with devm_clk_get_enabled(), which also fixes
this warning.

Fixes: 611fbca1c861 ("nvmem: meson-efuse: add peripheral clock")
Reported-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/nvmem/meson-efuse.c | 25 +++----------------------
 1 file changed, 3 insertions(+), 22 deletions(-)

diff --git a/drivers/nvmem/meson-efuse.c b/drivers/nvmem/meson-efuse.c
index b922df99f9bc..33678d0af2c2 100644
--- a/drivers/nvmem/meson-efuse.c
+++ b/drivers/nvmem/meson-efuse.c
@@ -47,7 +47,6 @@ static int meson_efuse_probe(struct platform_device *pdev)
 	struct nvmem_config *econfig;
 	struct clk *clk;
 	unsigned int size;
-	int ret;
 
 	sm_np = of_parse_phandle(pdev->dev.of_node, "secure-monitor", 0);
 	if (!sm_np) {
@@ -60,27 +59,9 @@ static int meson_efuse_probe(struct platform_device *pdev)
 	if (!fw)
 		return -EPROBE_DEFER;
 
-	clk = devm_clk_get(dev, NULL);
-	if (IS_ERR(clk)) {
-		ret = PTR_ERR(clk);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "failed to get efuse gate");
-		return ret;
-	}
-
-	ret = clk_prepare_enable(clk);
-	if (ret) {
-		dev_err(dev, "failed to enable gate");
-		return ret;
-	}
-
-	ret = devm_add_action_or_reset(dev,
-				       (void(*)(void *))clk_disable_unprepare,
-				       clk);
-	if (ret) {
-		dev_err(dev, "failed to add disable callback");
-		return ret;
-	}
+	clk = devm_clk_get_enabled(dev, NULL);
+	if (IS_ERR(clk))
+		return dev_err_probe(dev, PTR_ERR(clk), "failed to get efuse gate");
 
 	if (meson_sm_call(fw, SM_EFUSE_USER_MAX, &size, 0, 0, 0, 0, 0) < 0) {
 		dev_err(dev, "failed to get max user");
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
