Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2F0AC433EF
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Jan 2022 10:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5y3ldJsmW96KoE/8tqOVJW1yOT7ccY48g4mWLkqBNII=; b=me692plib+7L5i
	lH0ZKeLHqUwsZN8OkD2SvYYaA+mpBng9nPUUSGHBKMg80xg38k3Uj2oL5j6t5oQAheCFUaUpLlVjT
	O3LiUYT/Do6Pi7w3C5BGoIfgSPCS+1+6IeFPPyOvULcD8fmqNVKDE0kWkMwE/3rOeTdSF7MMbWMyJ
	XX+Pp7zAfKNqpNEzmOwz339FAWxQHbVtLKXY8XH8jUGdIdzwSqyl/qpkPT5F3DFmH2rj7D4dTCWBW
	aNWjDqMqW+RmyOubL9zjXutYg+0aKS7xPgrxOQy+2ZK9dd9c9Pa5QHA++LzGaPb1WZUkJ/1h2TKbq
	nnJwaaGuRWrKGiEktNrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7xKz-005Rqa-Pg; Thu, 13 Jan 2022 10:28:09 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7xKn-005Rnu-43
 for linux-amlogic@lists.infradead.org; Thu, 13 Jan 2022 10:27:59 +0000
Received: by mail-ed1-x52e.google.com with SMTP id c71so21302983edf.6
 for <linux-amlogic@lists.infradead.org>; Thu, 13 Jan 2022 02:27:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ew4uKUNam8kJO5439QWHJkc6LyiFyd+nrUpEzZPoFAU=;
 b=YMVg152aDvsUA5jMW9ANbVaRYdw9xsgt4shC2uDV2+B0kRcooMDvq+P4AmdjurudAv
 YBFZPL1XfVxd2THmP1uFUA0+wROIe+gq7gviKWRkKtcG13mAM3FBNvNnAF4xS74MWG96
 LLe338A4aFxeUPYY6isr+ggMZPYdAXFF1/GglXVFrBxr2I+I2MA5Q4lCigRUhkxUIqvQ
 8M083oLrQkI97tKDrK0xI0E/v8IIaMrCoiZP15jDBvZbOj5X6H7d1adG/KvNMwlBDBhw
 PL5IVR2xZs5t7eORUhnDYyT6cw2FjqG2amwUhuPYyErJRYgZNGL8mQ0K7Atn4i+MzO95
 Aafg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ew4uKUNam8kJO5439QWHJkc6LyiFyd+nrUpEzZPoFAU=;
 b=Bzsk215uFJmE88PMKROAc4ocijJXctkbDDVefeiYqJmWkrHEYJAeOnIivF8M36Wq4m
 pJD9LdRyjtu7yrjuPZtLeG4qZd5PZpKH99xdY32tVk0KzUOMA4RpFbQnJny1u7mlCsJo
 o/fLRRGv9DlokkLh8fzQcuSPBd5vlQiT5KzmH6baMzMo4It72dTNhK96yYn/huJzXz1P
 zR2xOjZUFwL4eayKUKh1Osy3JIqD94/24G0zQEKL+rVLgLqBK4mstT8NDtvC8aWLYJF9
 44j40OsR0ZbNDQ6zcPwZ+RWh03cPhbd4sV1IXSW5jozLty3phVMR4o+FRu4WWseND/Sy
 VDNQ==
X-Gm-Message-State: AOAM532IgA8QllA71eIdGGyUhBQ1aBTJ0024b+Id9gYzv2UtqE9ADhqB
 h3HnIcxhM8p7JTCKcn+ZqBG16w==
X-Google-Smtp-Source: ABdhPJyPWTZtV91PFW9Cdo+2mJExh4qrBWd9u1cf4eCMhGrOMHYRaDJhZ4hq9tQAqeerG5TmZKKfXA==
X-Received: by 2002:a05:6402:68b:: with SMTP id
 f11mr3590479edy.121.1642069674677; 
 Thu, 13 Jan 2022 02:27:54 -0800 (PST)
Received: from localhost (c-9b28e555.07-21-73746f28.bbcust.telenor.se.
 [85.229.40.155])
 by smtp.gmail.com with ESMTPSA id f13sm728072ejf.53.2022.01.13.02.27.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jan 2022 02:27:54 -0800 (PST)
From: Anders Roxell <anders.roxell@linaro.org>
To: robh+dt@kernel.org,
	narmstrong@baylibre.com,
	khilman@baylibre.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Anders Roxell <anders.roxell@linaro.org>
Subject: [PATCH] arm64: dts: amlogic: meson-s4-aq222: fix waring for leading 0s
Date: Thu, 13 Jan 2022 11:27:46 +0100
Message-Id: <20220113102746.598763-1-anders.roxell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220113_022757_187715_1E027524 
X-CRM114-Status: UNSURE (   9.98  )
X-CRM114-Notice: Please train this message.
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

When building allmodconfig the following waring shows up:

arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts:21.18-24.4: Warning (unit_address_format): /memory@00000000: unit name should not have leading 0s

Fixing the waring by dropping all the '0' except one.

Fixes: 1c1475389af0 ("arm64: dts: add support for S4 based Amlogic AQ222")
Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
---
 arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts b/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
index a942d7e06d6e..8ffbcb2b1ac5 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
@@ -18,7 +18,7 @@ aliases {
 		serial0 = &uart_B;
 	};
 
-	memory@00000000 {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x0 0x0 0x0 0x40000000>;
 	};
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
