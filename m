Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96652C77B7A
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Jun 2023 11:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4L0Dgs0+tbNPymE6nugz/R8trvtg9zYvXa9TPi6dA0g=; b=tozr4s63nzBKoT
	m3zAwRt3/DDkQakdXKMMYnXimrq77xjz3mYc1qlzIW+3UNGHVb1izARmTuCMLQJGGbdPlD929f/58
	HlbTWWrjGwbe0fwY7AIt7tXNgHxNL9apBWpETYVC6n3yOV/1gmCA1J5C84fzppDwr/3Ahjoy3s0eo
	6EkVNe5wMIQEJXkD6tRI5dzbxfA0Mejz0M7hvy3AU7g0ion9jUTxVYhNErFYbnrNRdQ2//fB26t4J
	aQ7oVPoh7ijrRP7WhmseyRQMuzI/AvPTvbdfFgxABP5GF+ImBHS/zpNJnE2KZ8a08MvJGoUCEcieZ
	/DrJUjHMICXgtxTbcNjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6rg4-005gsf-2R;
	Wed, 07 Jun 2023 11:50:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6rg3-005gsR-1S
	for linux-amlogic@bombadil.infradead.org;
	Wed, 07 Jun 2023 11:50:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=iQnjXf6n+PPSf2TGQIgc/Oatr1C9hNRqkqVyGgL0I84=; b=cFWYY5RDvNnHXHVDoHTxJ5js0f
	3czPEujKmoW1HS4rfmQkTlXxNXbz5V9iJtKYbHfCyhOtU8rXw5yyBiz/wGRRSsAsPxZEKF8eHPzFX
	9AG+Fdy7R2Xs0lL8EXL+hR0hULml6N0dr5B6FW/nNrcz3jE2LuH3RwSnrV7cUd9sEQNi7G73GkeYC
	iFzSUILYEQuqd7FTig53eoFbsF/4FwC6yss+UMVexvG1gSqjRtEx6pgk7CicK/Jtu6uN2qmE9g3vk
	j4vxxLCZoUc95x1WmykaIu8j+aawZWtjbbIbTUh6F7XK10Ous2Te6nZnAuiXKCX5Xh+RvRCqB7x1g
	Lpq20ehA==;
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6qqC-0057yL-0h
	for linux-amlogic@lists.infradead.org;
	Wed, 07 Jun 2023 10:56:43 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-3f6042d610fso70797495e9.1
        for <linux-amlogic@lists.infradead.org>; Wed, 07 Jun 2023 03:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686135394; x=1688727394;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iQnjXf6n+PPSf2TGQIgc/Oatr1C9hNRqkqVyGgL0I84=;
        b=WJfmJDzTP1/s8YeBsI1ZO6cn+0kZZcZTlHiP4g+Fr6zDi2b2M4C8LLyHYLKvSOx+JS
         tMIDq0jOUbF5U4PHnQPjLVcIGcoclSB18f5A95dFafu8Efk8curpv41riEISFGiofdt7
         3Alc71e2Fq+i67JfCAmngArykk4rmiLY6KCp0AweFaaSg5wIAVQZoXsKq7TDA70G5b5K
         baJCExWizsz8sRAoCigGFyoxUY2JcE2OPpjy6WmWdf2nDNmZvR1/9Y0dYNBKNH+cbegS
         EJti5oqo/DVhK/+nJh+mungcdQpnCi9hHRKrZqMDbI0ePd5iOQeb2SNa2AN5pV931UpP
         HniA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686135394; x=1688727394;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iQnjXf6n+PPSf2TGQIgc/Oatr1C9hNRqkqVyGgL0I84=;
        b=SBAR5cSg7wLKqZFtfSm6ijTdgc+CLnZCJiwUD4NTP+/F3WmLW07vqDSFqJH7dS9Tba
         XEd6rfYXdWHpxPhUYtkLv3mQQRO9Ye4rIeceSbfQoS/s/Z2u+XSeYXZ0kzi5C8Nh8cSn
         PneQP3o4Vn6em7t6FwQwV0HIUSRSeeaxH/GGNAHY5p9WgdOQxJ6fuNfcjYG0kpeMiHg/
         UT4EqjHQZC2Gnu0LA2Bei6jKP0osRdwx2FxhMc6fleFjnru+oFRtOuBWqguxisAxR/40
         auxBym3scy/1RJ/err2dQ1Hw/7kzf91srqUyWXoMRu+b938QGqOFQ2vrj87pgJ6RcNNv
         ywng==
X-Gm-Message-State: AC+VfDzjcE5PIx84bjU+RkxjyMpeDbXdXeOIsONzek7f6oXuik593KD2
	DQquHDbrsm78UQfj1xMCAHdptQ==
X-Google-Smtp-Source: ACHHUZ5cXwmo/MWfhNmypSHBzjwjn9NyullgQyxGvM4scW2aLrMKTD+jwMVb/dse1YAMp/lapkodtg==
X-Received: by 2002:a05:600c:da:b0:3f7:f446:927 with SMTP id u26-20020a05600c00da00b003f7f4460927mr537815wmm.37.1686135394708;
        Wed, 07 Jun 2023 03:56:34 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id i10-20020a05600c290a00b003f60faa4612sm1761879wmd.22.2023.06.07.03.56.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 03:56:34 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 07 Jun 2023 12:56:23 +0200
Subject: [PATCH 12/18] dt-bindings: clk: amlogic,a1-pll-clkc: expose all
 clock ids
MIME-Version: 1.0
Message-Id: <20230607-topic-amlogic-upstream-clkid-public-migration-v1-12-9676afa6b22c@linaro.org>
References: <20230607-topic-amlogic-upstream-clkid-public-migration-v1-0-9676afa6b22c@linaro.org>
In-Reply-To: <20230607-topic-amlogic-upstream-clkid-public-migration-v1-0-9676afa6b22c@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2423;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=gAuzOf3W8TAOyXHYRakDqce4wcc2Qi6BuxU2eHHrAzM=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBkgGJTmt/qkyDAbM3CpeCJiJ/KvV7WI5GoKcib9fF5
 1rR1fmSJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZIBiUwAKCRB33NvayMhJ0d3gD/
 wMTpGb5jYDYphrziFGF+VTrlmX9gs8hgVj6hhc3B0hCLCfl1ii5VVcR12dHiwOKooraws72ETnC7Cb
 gUuIF4j688cOQzkGrvvDKup4fDhW9zeon1luucR3iTOPecW99SANg73knW+QYNG+fPxofwXOkU2qBv
 iTJeauWpv/OQ0N0ik+G8akarLcqaxCfx7pOeL3dxw7FBIQlwVOeoMpeMQ61LCyS+vAMDL5BUk1/V1L
 UIIp0W/kWeGP9vMD52Cm8wUG5lBCzZzoWB37obmNGa1seebAwhpdR0sqKw7j+Liw0LsUUtnverCiqQ
 I5Nwojl+X9yF8pW2Nl699DKZa698qwseydNpUxOi3gBwkHvdc6bShEw3Xob+CBgtKWoI2vCTobB2dr
 dNAF+K7zxb/Tz9OC02CHFTPCOLDJ9UWJ/KrDLv24dQAn+pFuZijXLxiKeujFMQb533oz/K4tWZCuMJ
 AUZLCFKHsooLRRsGp+hpPXN1VNGO6SQv0SbOaD+hQtasQgmip/FhAxgQMevqjEronv5CoK0+9ewL0U
 tmgZVE9DKO6QKntdpGl1spuVrUkGvcdRqRRvb16kMkqpBg1ud0t48VVAslIQGgs3iqdtsOtxVfMoJF
 sGzpAy0yyvqIa7HARcbhZU5Nkwh6W/TCm4+Zq/uGw1EtW09MRbqTkphp8hzQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_115638_798338_CCD0D732 
X-CRM114-Status: GOOD (  13.38  )
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

Due to a policy change in clock ID bindings handling, expose
all the "private" clock IDs to the public clock dt-bindings
to move out of the previous maintenance scheme.

This refers to a discussion at [1] & [2] with Krzysztof about
the issue with the current maintenance.

It was decided to move every A1 pll ID to the public clock
dt-bindings headers to be merged in a single tree so we
can safely add new clocks without having merge issues.

[1] https://lore.kernel.org/all/c088e01c-0714-82be-8347-6140daf56640@linaro.org/
[2] https://lore.kernel.org/all/2fabe721-7434-43e7-bae5-088a42ba128d@app.fastmail.com/

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/clk/meson/a1-pll.h                      | 15 ---------------
 include/dt-bindings/clock/amlogic,a1-pll-clkc.h |  5 +++++
 2 files changed, 5 insertions(+), 15 deletions(-)

diff --git a/drivers/clk/meson/a1-pll.h b/drivers/clk/meson/a1-pll.h
index 82570759e6a2..0add1c7ea9f5 100644
--- a/drivers/clk/meson/a1-pll.h
+++ b/drivers/clk/meson/a1-pll.h
@@ -28,19 +28,4 @@
 /* include the CLKIDs that have been made part of the DT binding */
 #include <dt-bindings/clock/amlogic,a1-pll-clkc.h>
 
-/*
- * CLKID index values for internal clocks
- *
- * These indices are entirely contrived and do not map onto the hardware.
- * It has now been decided to expose everything by default in the DT header:
- * include/dt-bindings/clock/a1-pll-clkc.h. Only the clocks ids we don't want
- * to expose, such as the internal muxes and dividers of composite clocks,
- * will remain defined here.
- */
-#define CLKID_FIXED_PLL_DCO	0
-#define CLKID_FCLK_DIV2_DIV	2
-#define CLKID_FCLK_DIV3_DIV	3
-#define CLKID_FCLK_DIV5_DIV	4
-#define CLKID_FCLK_DIV7_DIV	5
-
 #endif /* __A1_PLL_H */
diff --git a/include/dt-bindings/clock/amlogic,a1-pll-clkc.h b/include/dt-bindings/clock/amlogic,a1-pll-clkc.h
index 01fb8164ac29..2b660c0f2c9f 100644
--- a/include/dt-bindings/clock/amlogic,a1-pll-clkc.h
+++ b/include/dt-bindings/clock/amlogic,a1-pll-clkc.h
@@ -10,7 +10,12 @@
 #ifndef __A1_PLL_CLKC_H
 #define __A1_PLL_CLKC_H
 
+#define CLKID_FIXED_PLL_DCO	0
 #define CLKID_FIXED_PLL		1
+#define CLKID_FCLK_DIV2_DIV	2
+#define CLKID_FCLK_DIV3_DIV	3
+#define CLKID_FCLK_DIV5_DIV	4
+#define CLKID_FCLK_DIV7_DIV	5
 #define CLKID_FCLK_DIV2		6
 #define CLKID_FCLK_DIV3		7
 #define CLKID_FCLK_DIV5		8

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
