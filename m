Return-Path: <SRS0=1A+6=D6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E890C388F9
	for <linux-amlogic@archiver.kernel.org>; Fri, 23 Oct 2020 09:42:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C7DF22192A
	for <linux-amlogic@archiver.kernel.org>; Fri, 23 Oct 2020 09:42:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cKrHkqgQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="oJb60Jlq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C7DF22192A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OB/8AppnrtoCT/KGBtH9N0x/HCXuiJHHlCu1jE5bsVo=; b=cKrHkqgQCKrBqJey/w1dSmcB27
	2BVCcl54Xdp6jSQtuk3PckJU11Rmu9mwQRcosWLuRZcTf7Q4QPQJ4xJBGj2nNnSokmnulWPjdANj5
	nTsMV7JtnEBGXiaalw2BzdUU3GVZAGmdYgLcOOE+UfM9UiDfbM0zXe6zLLzjylz78lOUMism62Bcu
	NrklwoUo2e9E44fmYE5KikyA8ZJnOo+gJhy1FLGEHbwDq2i1qaJOZghA+4cUk6MyvYoFOaS/7eOtb
	bPiHSmrDMEcjKd94UlBA8KwNYd8n53KjddDsLypHygDpciLI+FF16I/20eWR6oZ8Zu6cN5jzUnWFt
	whRigYsA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVta6-0005YE-2Y; Fri, 23 Oct 2020 09:41:54 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVta3-0005XL-1I
 for linux-amlogic@lists.infradead.org; Fri, 23 Oct 2020 09:41:52 +0000
Received: by mail-wr1-x443.google.com with SMTP id j7so1046758wrt.9
 for <linux-amlogic@lists.infradead.org>; Fri, 23 Oct 2020 02:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1v+BRYKpLF85NN75H+Cg4QVm6ILks7BYKSUstLByCSA=;
 b=oJb60JlqLfIPB3mYZlJZW1WfSN6XWa6RPumJBVEtsy/6axY6bbAq6u8xHFHg6HZNxJ
 3Ps6GFAictfqzt/K8+GFutVZJTgML8R/FAef3D6uUngWtyLssceUu24Eo1mp4Py/bW0O
 RXqnuVJyeev6/0nHYXm8UCn3d+y8FfyegBnOF3rWcJ4lLmBqD3jQ4JdDAhaK7ICYvVG3
 CUZeoN10Pl4j+22yT/iW81VkVWazCaMk4dU5pRMABr7SenEWUkvNp6+jvBH1baC458LH
 RUL7L0AQMTxK8UDxiYGedJoRZ75cZqWqjzR5iI4yFAa3zKmfhS1YtLi5gg7VVbaUjLLv
 Ut3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1v+BRYKpLF85NN75H+Cg4QVm6ILks7BYKSUstLByCSA=;
 b=ldnRxMTiFDUqr4IvKqo3cRHeV3TSU1VHkuSJ6SRzBwoKySCEy+OOJgr8r9DxYvsaws
 327h9h8/L1x1gg1/RGuuhCYSBzbVXbmXeP7oH7BO6vQ48W1No3r75ncJkDz3we2NY2yC
 v1zOelSDfB18c1VClYo6yhVi69hzgtzO8hycwNmkMjrSfQm/45pbIZP7o+tajjDMZL9/
 mNAPfDcxpmWo66h4aEU2mxYqovIDOarwUWG+Lpd03JE4ZJYmfbmOC9eFvEf+BLX+Nmdt
 y9XqaPm0Bl0aymDxDBJriKnmka8vibS3MlMlKFhR1SrZ4Rpt4eI03cz2ZyJPkV9aauZb
 pv5A==
X-Gm-Message-State: AOAM531uVc/mEMyyqNW3UOQjEmW+3ZHv0sBIwETmKSMdTa1q68i9nEpA
 ru43eoR0UGWQZBHJl/kiyPu/DQ==
X-Google-Smtp-Source: ABdhPJwDPdzCYwR9mXKv2Bg6I8v/LszFvMGCXhdz5/Gevez4gwbQglfp6HED2cYJ6awSzPcjAx1Vkg==
X-Received: by 2002:adf:97cb:: with SMTP id t11mr1801202wrb.292.1603446108704; 
 Fri, 23 Oct 2020 02:41:48 -0700 (PDT)
Received: from starbuck.lan (82-65-169-74.subs.proxad.net. [82.65.169.74])
 by smtp.googlemail.com with ESMTPSA id t5sm2543023wrb.21.2020.10.23.02.41.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2020 02:41:47 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH] arm64: dts: meson: odroid-n2 plus: fix vddcpu_a pwm
Date: Fri, 23 Oct 2020 11:41:39 +0200
Message-Id: <20201023094139.809379-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201023_054151_298382_395DF46A 
X-CRM114-Status: GOOD (  14.37  )
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
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On the odroid N2 plus, cpufreq is not available due to an error on the cpu
regulators. vddcpu a and b get the same PWM. The one provided to vddcpu A
is incorrect. Because vddcpu B PWM is busy the regulator cannot register:

> pwm-regulator regulator-vddcpu-b: Failed to get PWM: -16

Like on the odroid n2, use PWM A out of GPIOE_2 for vddcpu A to fix the
problem

Fixes: 98d24896ee11 ("arm64: dts: meson: add support for the ODROID-N2+")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2-plus.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2-plus.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2-plus.dts
index 5de2815ba99d..ce1198ad34e4 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2-plus.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2-plus.dts
@@ -19,7 +19,7 @@ &vddcpu_a {
 	regulator-min-microvolt = <680000>;
 	regulator-max-microvolt = <1040000>;
 
-	pwms = <&pwm_AO_cd 1 1500 0>;
+	pwms = <&pwm_ab 0 1500 0>;
 };
 
 &vddcpu_b {
-- 
2.25.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
