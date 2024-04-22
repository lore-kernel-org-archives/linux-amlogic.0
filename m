Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F03C6C07C79
	for <linux-amlogic@archiver.kernel.org>; Mon, 22 Apr 2024 17:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rmRUIZJZpWu/Iu1hEaAzfDTEb9U2BP8m86+wSjQR7OQ=; b=IMU2tIph4Ijaww
	jsHvYGgf6i6XWZsyq9WLhLXc1ZA9kOwxmIXnKwRVSufjmV1L5kN73Yv/BTrFCrC9HRwfjvsTSeltr
	ngzodQIuZ5vDNmeSm2bNVsIvjhDWSderxivqVnnhPAh74hTpebEuOfEUviILaOpihCegayUY9XB4r
	/C3hCuEexwY9DlD0D2FQY1PrIFJerfEwMLkFKzKcxzSMdEbWyz6KayJcyyJxiZNlzA/yfmT/FGAZy
	waQH/0N84VP0UuEdgq/QaNpbbWS+LB1Hv36k4+WrVtHN75eW+re3CE9wD8Y97l4gc38vxbyb4KfAP
	Xrb1k6wD08lcXHSv82bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryxJH-0000000EScr-4714;
	Mon, 22 Apr 2024 17:18:31 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryxJF-0000000ESbl-3JUj
	for linux-amlogic@lists.infradead.org;
	Mon, 22 Apr 2024 17:18:31 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-34a32ba1962so3302286f8f.2
        for <linux-amlogic@lists.infradead.org>; Mon, 22 Apr 2024 10:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713806307; x=1714411107; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5fWgmC+cKq5ILi/+wUPD9o03c3KoRbDPga2rnK4G2r8=;
        b=uyBM5ZGh9pwJnzi9yjyMvzuqTITrBDcXzIoyB0Bt6wQBBbBiKcL5eEqVjOAoUH1ygy
         SS5fTbi0GFiRWk2bXVpfvDxWhx8L7s+VGfnrz246qFQ49sdg0RUgjtuG7AFJ/eLEOSb/
         z2+dyAFJFsuiVjusAn1FQdsecqUcXVszRjDAQGWzvE5Yc4Qokh88C2qfUyLnp035aS5m
         761fo87VxwJqTjH6xOQH4vO1Hj5upIQCY8DHWLg6Kmyg2zHgZZP64YYzA/ba7BsPDXlk
         qj4ciTiLTUFQhRS2QBu8ohAvTL8FL6tZzsTkFzxXPwQBbpqHN22o1U1WIO6jvn4chJ1o
         P1jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713806307; x=1714411107;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5fWgmC+cKq5ILi/+wUPD9o03c3KoRbDPga2rnK4G2r8=;
        b=ursvtw6YouVUEEUJvXG/LphOzVMLyweilAaf+s3QOSEwMIXU+JAK9hJlOs8xwxlxp7
         SkZLrf3P0T3QoLQIBV6mHPQJXNtF46aEDwc1qLfdgcw0+YDqruh2f15+gUszzOAuFekC
         uB1OvqYqH4sQomOqhnXWrkskl5aeDsNLe+W7El3Fsfq4EKyaKNoEN/Iz9MEFyu9dOZRX
         3Owrv1UNDrel/ptDEGRNZe5/FW0SC3I5mm+ON6sZIK0SNmQ2/+h7ovaHVHEh+omRfl7T
         FVSHNCrs5j6yp6OSVSI+f/KQD3N2ybpfechnL0htUPFnQIMUY5SJ+WTeqABcp2Ykc9J2
         HCDg==
X-Gm-Message-State: AOJu0Ywzaqo+DmPSc7qd3N7ws9khQBrXTVCQDCJp4+qNqyK5PllkI6mR
	2qTcsxWEgzNQ0wq1mCLu7jwGxRlcCOEhLcyWCbJV6UFe8iFV2PFizZOU8MFPmEfnblSMRYKLvR6
	+gzRxEg==
X-Google-Smtp-Source: AGHT+IE4x4r3L8ahx/2rD1lKZZqMztrneV/8IjQ6Ck6/f6K0Cf0g5tGKk+eOJckqxS6wN1WNIlXM+Q==
X-Received: by 2002:a5d:5586:0:b0:34a:e73a:51be with SMTP id i6-20020a5d5586000000b0034ae73a51bemr3385127wrv.31.1713806307048;
        Mon, 22 Apr 2024 10:18:27 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id d1-20020adfef81000000b0034a7a95c8cfsm8655132wro.9.2024.04.22.10.18.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Apr 2024 10:18:26 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 22 Apr 2024 19:18:25 +0200
Subject: [PATCH] arm64: defconfig: enable Khadas TS050 panel as module
MIME-Version: 1.0
Message-Id: <20240422-amlogic-v6-9-upstream-deconfig-dsi-v1-1-01511908477c@linaro.org>
X-B4-Tracking: v=1; b=H4sIAOCbJmYC/x3NTQqDMBBA4avIrB3QNNjqVcRFfibpQE0kY6Ug3
 r3B5bd57wShwiQwNScUOlg4p4q+bcC9TYqE7KtBdUp3Wik06ydHdngMOOJ3k72QWdGTyylwRC+
 M+kW9dc+H1cFDDW2FAv/uybxc1x/5GsRVdAAAAA==
To: linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 khilman@baylibre.com, jbrunet@baylibre.com, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=935;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=ylVPuLqcS1WJMgp9a8XuASTt4JhCVhE3OAvfInu5e0g=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBmJpvhtHJRYeJBd1fbJE5+8INMdIKqwRLZNT1E137M
 scLJBhqJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZiab4QAKCRB33NvayMhJ0a+wD/
 47b6efjdEaUF1ykivJFo1MeNg9w10zCSwsLnUmi48eiBkiv7gKY0+1Qj3HLbeq0BKe+cJ3YRZdV1pK
 PFbZQUhXm0gdHsxKzo5fcV7Du6zgcsA0mZ4gbRGK5Tc3iPr4K8QMWDCQO8aguYo9JrblofwBESSMeD
 +0Zret1WVqk9DmQbqDYQyeRmZUjRzT+rEOQ+j4sQJ9u6cw4gLxzk+TujsdUVgEmzCq7zcRCEfrIGc2
 wawJEyzCqqK/b3GKNTOblLX/385tRpophcbQx7Apto6oRPoMbslImDW6xOw6URnnlAnKBf3xI+z4F9
 HvgfWBuyEYBHVnGbT9DE9xI2zaPB34qeMjhcch2kkfSsIRBEAGp3oAj27xghdRc2heOLGekNj2A+gp
 RR3sZEu+ET6os8pCicVUJMJ9DQaF4l3zNSJfnTsY6Wt+Z0UUmfoRG0L0sUiIf1c3FE+Nv0zcW/Dk0a
 8JpQp4IHVBu19WQSNRtu12nXZFW0hBkgnu54kfhPNonUC+I7uhd/XMWXZxpeEhB705xSbc82E3vl/i
 T0hyqA4UxVj34tmfpaQnTM71PdV4dCKgPNPlOg4AarhhBqey1xuwsekHvDfuV1GbvKfoDrF0FlGqyc
 UyULF3B8yqF0z51z2pcnCpFF6Fi6PDaaiSfJ18aY46e3049V66afI5toPMwQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_101829_882628_654BCEA0 
X-CRM114-Status: UNSURE (   7.70  )
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

Enable the Khadas TS050 panel driver as module since it's
required to use the TS050 panel on the Khadas VIM3 and VIM3L
boards.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 2c30d617e180..76c687ae8b89 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -865,6 +865,7 @@ CONFIG_DRM_PANEL_LVDS=m
 CONFIG_DRM_PANEL_SIMPLE=m
 CONFIG_DRM_PANEL_EDP=m
 CONFIG_DRM_PANEL_ILITEK_ILI9882T=m
+CONFIG_DRM_PANEL_KHADAS_TS050=m
 CONFIG_DRM_PANEL_MANTIX_MLAF057WE51=m
 CONFIG_DRM_PANEL_RAYDIUM_RM67191=m
 CONFIG_DRM_PANEL_SITRONIX_ST7703=m

---
base-commit: 4cece764965020c22cff7665b18a012006359095
change-id: 20240422-amlogic-v6-9-upstream-deconfig-dsi-48e1bc73b4fd

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
