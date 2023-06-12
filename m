Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E6BDC7EE45
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Jun 2023 10:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aMI6fN6884Tx9wk8bD7mNItDaR6HWQDjNSC/J5rfnng=; b=a40pO1emxyOz4f
	itkLvWF6SEavoY8l6EDWzbs52rZTcZPXNFE68r2lW2OCK53WugICLXn9ZfTvHcg/R0PFz0Jv6tKfU
	b35fIZrNua1PljBFNH0PeOJqCFHY5Bgq7VNlvobbCob8HYawzda9YoKS8oD3jR+MEyIeg9wpo7b3n
	GwxEGd8VJZwpPZLCk5GwSOJ3CyTMWti28fjuiWaqcwcx0iVA70CUrto8DdE/z1SC5K+gIZyNfbo2n
	lHv2IQv4QL2FB3/qHtHyge+tSD2XrAgWDlNzP9DkmbVYnsQX7+ZJ1+NerkEhpU8wE8hNT7f3WAmOR
	MYoMxxvarpt0Xsl2w+8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8f6q-003dHT-2d;
	Mon, 12 Jun 2023 10:49:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8f6m-003dF5-2T
	for linux-amlogic@bombadil.infradead.org;
	Mon, 12 Jun 2023 10:49:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=cygOskfWXusdpGUAH4VtoxUGPB85ArQ0tIqjq+ZLZMY=; b=Y7obREcAVHC1ZA+Cljmf8ljo51
	UO9UTiC5fbH/9q41v1XNNk9KbsbfAPXyrPuaCmVrRcZIBVy/UES3aSO8eLOBbJcwPS43KRhKPB3SY
	dBXvbeWQZtDYhAYe8PYo/4kKUinwayP2GIDozMrabG6g6wiAt1/9L7cvC/fnXE9WP1NTN3GuMz2xj
	Q9IYswD6PMGGeJwrJFiOB6+ghf1vKVz7vzh/MdAiViURYeRorVF/466csVCPfgXHXh866yMQKp8bz
	RZIQe2fuI/IrrFV0JALLwfr5waY/6XxFYfEcB3pEzPEv9a0Ifc2LyNRI31XPVuL1uSqtYAH/rHM8m
	cDHfAaKw==;
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8eJ8-008lAE-0m
	for linux-amlogic@lists.infradead.org;
	Mon, 12 Jun 2023 09:58:00 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-4f122ff663eso4684808e87.2
        for <linux-amlogic@lists.infradead.org>; Mon, 12 Jun 2023 02:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686563872; x=1689155872;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cygOskfWXusdpGUAH4VtoxUGPB85ArQ0tIqjq+ZLZMY=;
        b=wiUoGsdWU47N/zsJmYKgM11VRIQxfUHl/wDow3WU+7YUHWCiFAb2fLY8mjy6ooRqsK
         puMI5rU80RYYcFz7iHpQuOmaj4n8BUO/vrn45OyZBYuIcE27lVOE+ivRdkACIEbmCBSr
         TSqQb9lNAbm6l2qAw6yhFwYY3x/EvoYgqlhvuMflxvk93w33Jtgz2Q9QBxxOehslrHeF
         NVpvKOnQR1DIzxa0IDYexOD4+bpScGr8s/t5eudKoUptjCz+2RZ+UWD0mQQpOi/9rIxO
         74lz6EJcKnXQnwFPXAyX8JPxicHkGqW6+CZDhW7HD3zu4MX/sJVG8ZI5agjBlEkxV+V9
         dx/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686563872; x=1689155872;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cygOskfWXusdpGUAH4VtoxUGPB85ArQ0tIqjq+ZLZMY=;
        b=PpgTS0vFIO48U6PF7QrQpwLoz22jTZ1/UAQZeiuMUt6dklT7vUtrO9Xg4JzYbE+uXZ
         l1K8LdjasMjDT84K/UOJFshoFo59NwKbAkQBkwxW31AInyAYYMDfcjY4k5jh79QvWz7h
         3JFA46YAmX5pv7tyJS34b41W+eeDENXhDa3eZH7BK+0eHWzWYsN1WJm6QamDLRtXhhlp
         gIqR1sVu7KpwNyIC0f114C6ZTeSMCFIdWlji4kN0O2a+rIVd+2oiWVvLlfBtQAKOjrZo
         p9fvuPSB1EoeJlWQjCDiPT5mkZ13YGwgU3Y1lqCa2MWskOY5FaIYtyd6geKPYWp5aNzH
         E1hg==
X-Gm-Message-State: AC+VfDxBrkHr/Z+1tyj//KFkPA76CIGzkpMYUiaZWRSuW1o6nsAaA8ET
	I1un4rQYXXj9OPxtv7hbS+c1Ow==
X-Google-Smtp-Source: ACHHUZ7YJy6tu64K5FLHKVS3lhMDWbGs93kRlOXDyiti2Ma8AlEo3Y2ZfLIxRyzYFy9oFz6bPMdE0A==
X-Received: by 2002:ac2:464d:0:b0:4f4:c972:981f with SMTP id s13-20020ac2464d000000b004f4c972981fmr4263806lfo.54.1686563872398;
        Mon, 12 Jun 2023 02:57:52 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id f25-20020a7bcd19000000b003f7ff520a14sm10829525wmj.22.2023.06.12.02.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 02:57:52 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 12 Jun 2023 11:57:35 +0200
Subject: [PATCH v2 18/19] clk: meson: meson8b: move bindings include to
 main driver
MIME-Version: 1.0
Message-Id: <20230607-topic-amlogic-upstream-clkid-public-migration-v2-18-38172d17c27a@linaro.org>
References: <20230607-topic-amlogic-upstream-clkid-public-migration-v2-0-38172d17c27a@linaro.org>
In-Reply-To: <20230607-topic-amlogic-upstream-clkid-public-migration-v2-0-38172d17c27a@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1355;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=F+2Srg/4sQPMMfVWsDuv7F9eteW1x3up035F2/YQpfY=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBkhuwMMKtWPmeip81lFra9k4LHq4SHD3LGAt3P6j/j
 jdneYnqJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZIbsDAAKCRB33NvayMhJ0RZEEA
 CcMf271vDPYofqAE6DHXz9RcQGziswp5v8xT6Mn99BRK/QQMOupQGM83aLXYCVC6ytBxzru/RlmkXc
 TOJO/H0UvdEcR8Scu/lq5WnMKwnZm2K0hem9noz1xeaVbz/JKhAr3wTYaV29FskgXXAJFH64gSPC95
 sEip7dRQmFM8ZKQVPqyaJfuIeeJzWozkkBc4XaQj9W50/V6vi1IpsoVlDqxW3qArXCQmUSynyjUWoA
 po8xRZfUB93zbWFNg/sRuaY8Bf66jVt3GH58AAmtco/i/T1Rj07N9E8u3ofq+jq5vtRRvE7cy9yJgq
 aWPWjV/F3Faa3GSuWOEmoc4A/6NdhZyPJNhrBR6cZGPTYdv/DZW4VOp/xdbBcMBuC1V2OBA2qpurnc
 EwMH9fv15V4iJnvBXHPrFJ5mzOVNLgCp4CGpK1EK1bODBQs1igv7A0QxPLEj2MtvTvGY7prfPY90mh
 SRogtVHXhoW188QV/Z2AXsE3QVorpULU+cbvONLbYRMoIeZDBJHyJ+O+5fuKnhNo5IGKhCTKOPSmWs
 bHtKh/KnTr3cBettR6+ekGP1uuxiJLHfFHMJldc50Zt0IxjRi3ouAu8BVezlqjZ6frFsR/OPgj2PLG
 QIGCV2jW63nnMUXK1c3CSoTRZDWBQfh4ZUoe/yK+kt2MB/yonwZtet5G5sWg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230612_105756_593200_6BED4623 
X-CRM114-Status: GOOD (  11.62  )
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

Now the clock ids are no more defined in private headers,
cleanup and include the dt-bindings headers from the main
driver file.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/clk/meson/meson8b.c | 3 +++
 drivers/clk/meson/meson8b.h | 7 -------
 2 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
index cea246daea39..b7417ac262d3 100644
--- a/drivers/clk/meson/meson8b.c
+++ b/drivers/clk/meson/meson8b.c
@@ -22,6 +22,9 @@
 #include "clk-pll.h"
 #include "clk-mpll.h"
 
+#include <dt-bindings/clock/meson8b-clkc.h>
+#include <dt-bindings/reset/amlogic,meson8b-clkc-reset.h>
+
 static DEFINE_SPINLOCK(meson_clk_lock);
 
 struct meson8b_clk_reset {
diff --git a/drivers/clk/meson/meson8b.h b/drivers/clk/meson/meson8b.h
index 2a9c4fe29ca2..a5b6e67eeefb 100644
--- a/drivers/clk/meson/meson8b.h
+++ b/drivers/clk/meson/meson8b.h
@@ -77,11 +77,4 @@
 #define HHI_MPLL_CNTL9			0x2A0 /* 0xa8 offset in data sheet */
 #define HHI_MPLL_CNTL10			0x2A4 /* 0xa9 offset in data sheet */
 
-/*
- * include the CLKID and RESETID that have
- * been made part of the stable DT binding
- */
-#include <dt-bindings/clock/meson8b-clkc.h>
-#include <dt-bindings/reset/amlogic,meson8b-clkc-reset.h>
-
 #endif /* __MESON8B_H */

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
