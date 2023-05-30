Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D6CAC7EE23
	for <linux-amlogic@archiver.kernel.org>; Tue, 30 May 2023 08:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gt6srIVHJfcmwSaRXFtW+Xnh4+o/6POR5NQ/J3JHiw8=; b=sah4/K0Fbl7opp
	A635qxCfN5TyrOOHOZCDHX8EvIV8YlAB4uvntETtKpcXBmXtdc21Tzm9fPtyHlwEG66wOD79qqFYY
	HP9cJpNN8J88T90BYovLXYKEhLmVVkmQKG7K5mqnP/8vXj0jxLSmysstqyRPcwhnjX3p0O5LI+maQ
	hB9wQCqG90QRgHYG1cplCGsj7Z/O/k2wSE21h+vX5IYrIu4TX+7JzYaoALlLnlx6yzqkuBqkb0ox8
	mdtU7B4zJMVcsxauClzwxnpMNED6ygk7OwJnqG3ybepklVXjhqlNS/DFJUB19L2uoUTn8bw94bU//
	z28+hpkdnDatHjZc3Vpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3uyp-00D0P8-1z;
	Tue, 30 May 2023 08:45:23 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3tvu-00Cl21-0l
	for linux-amlogic@lists.infradead.org;
	Tue, 30 May 2023 07:38:19 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-30ae61354fbso1549434f8f.3
        for <linux-amlogic@lists.infradead.org>; Tue, 30 May 2023 00:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685432297; x=1688024297;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XHQhsBTFDkuQhoxNpEokv/0r+NXaRqu/3vue/LdQVcI=;
        b=NSOr/9NzVuIrWpU6M3oICUcM65vj2wa4VFC/pcBxdk8yg4wjDOTQUDdkQ10UFhmPzq
         NJa0zm2sk03VGltrRT1+CShBUhnQ/AOjVzFhMMWfn9gKcv585Ws9KZberZYvwh45snpA
         04nJNegcoOGvx49C6xQ84Er0YKRpYuepLFLi99cuEcYYd7U2nxAOfQki+zGqTd74kICZ
         ++NDlHLm0jvvGKrfpqPycT7zc5vZftiQ4ZJ5BO2diBjF+HHw6Iha7ZH6FqFas5z2rxgi
         S8oAvmLzGOsABsiTiqB8NbzlYfNV3c9MmIH1/9hPvf3tPV2zSWVhTp3xsFd967HsyhJH
         gh3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685432297; x=1688024297;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XHQhsBTFDkuQhoxNpEokv/0r+NXaRqu/3vue/LdQVcI=;
        b=KgXFsYuMRvKE/z0ScDmNJKLW2Xb+1vlh9/j24ZJfSysROgsstJCrjqsX0StWMFgfR5
         qBT2XSXaaco6gdQ07lPn0kRgcEiap8Ph8zMr+cdL8GKwsBXn0hMpGpybl4Yq/gSTHUM+
         b2iphV0PvKNiACeCIdhjnShBV+I22kh6hMSYjn/gGxXsth1X98dwVvF7dP0G2u9MwBLA
         CAkl2xmKx/SVQNB4lP09Xd7o0UYY9OhEtf8YjzRsqH27IxAEqbVcN4W+s9EFTpmyXGFI
         BtB+yBoVqSVs1ejzEhjeYgoq3wnNZpJg/JzAV6OgeavaVzjLB2mPD1P2i9NppcroeFqr
         YiwQ==
X-Gm-Message-State: AC+VfDxVfarJOQ83fYVybHp7/0UtwNobL0k6dRh1b7SWbXxeo6Vg5Wr0
	jUe2E6+MQ+J2XtKxtZtSl5GYgw==
X-Google-Smtp-Source: ACHHUZ6D/mVI8auwcawNxpq0Xwa8T4pYrpgGAj/BIL5QadBoX48IUg3ysPom8OfSEaTzDh2KrP2T4g==
X-Received: by 2002:a5d:4f86:0:b0:30a:e977:de3d with SMTP id d6-20020a5d4f86000000b0030ae977de3dmr890345wru.28.1685432297110;
        Tue, 30 May 2023 00:38:17 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id m4-20020a5d4a04000000b003079c402762sm2312013wrq.19.2023.05.30.00.38.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 00:38:16 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 30 May 2023 09:38:04 +0200
Subject: [PATCH v5 03/17] dt-bindings: clk: g12a-clkc: add VCLK2_SEL and
 CTS_ENCL clock ids
MIME-Version: 1.0
Message-Id: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v5-3-56eb7a4d5b8e@linaro.org>
References: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v5-0-56eb7a4d5b8e@linaro.org>
In-Reply-To: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v5-0-56eb7a4d5b8e@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Sam Ravnborg <sam@ravnborg.org>
Cc: "Lukas F. Hartmann" <lukas@mntre.com>, 
 Nicolas Belin <nbelin@baylibre.com>, linux-amlogic@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-phy@lists.infradead.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=950;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=KbKcybkRo8Mj5Fjr+ajJFo4x0AGSd+2AQZgecUYttyQ=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBkdafe+1xMsg6o2539TRqhiYXrKqUICj4jB9MBjpMp
 SAripaKJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZHWn3gAKCRB33NvayMhJ0SocEA
 CVAPoxbACS10ENLyJwe5NXAcDDtbSY50/qd5b4dHarLbYdYx+nKJuL20lukVeblk0hTeMLb1Re82Cy
 YLIfoRF1KIcy/UtGwtNXjO1LP5b24dkydr16RZLaQaZoTPcW5o9TK0RguGOtunUkhwWAh9NRmFj4mv
 LK1ZH05YFPMP2OklXlNnUq1d4LHNapDo4IgItrbKyJOtIYODWLelfGKbhAtOAa6s2PCkHApOt8crWG
 7Wvk2pFohYNDnfJu5BlpMZyKFLDvhudotjT5qW8zjnpcTbceygYgwifx033UE4PG8WVhvWqEo/x60c
 ulseD7mSf1ilVWdtpCWyiqeSly6RwjZ7ORt4ChDyGzpc3ND0sGpkeFfhbJ7FOtrj6+W8s037mZEDYj
 nqFf1WlPv3jcD1OEvUGCPQVL0X1ceF3igcHHxOv9yG5vLCr8BR9EJGoH9QKeqFwwwf01lkAjUO088R
 YXQPYj4TvAlL/tKLQgalcD9oTc2i3AcJssz0hQSuIK14T3fIQB3UcLfF0X+obpMwTI2x1gKWkw+oBM
 cKxXDEBaDBG4y2AKPRRpBQkCnwanZXHE3p8muwUF2O4qayp7lRb5FdhjsksiNOEmegMHHBSCfgRudl
 999d78OkvkQ237+UYgvkfs7UrJm02EKhWXVtK58gcVwPDpnz9gH4s8Tom+7Q==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_003818_276019_ED3AACF1 
X-CRM114-Status: UNSURE (   8.58  )
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

Add new CLK ids for the VCLK2_SEL, CTS_ENCL and CTS_ENCL_SEL clocks
on G12A compatible SoCs.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 include/dt-bindings/clock/g12a-clkc.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/dt-bindings/clock/g12a-clkc.h b/include/dt-bindings/clock/g12a-clkc.h
index a93b58c5e18e..80421d7982dd 100644
--- a/include/dt-bindings/clock/g12a-clkc.h
+++ b/include/dt-bindings/clock/g12a-clkc.h
@@ -108,6 +108,7 @@
 #define CLKID_VAPB				124
 #define CLKID_HDMI_PLL				128
 #define CLKID_VID_PLL				129
+#define CLKID_VCLK2_SEL				133
 #define CLKID_VCLK				138
 #define CLKID_VCLK2				139
 #define CLKID_VCLK_DIV1				148
@@ -149,5 +150,7 @@
 #define CLKID_NNA_CORE_CLK			267
 #define CLKID_MIPI_DSI_PXCLK_SEL		269
 #define CLKID_MIPI_DSI_PXCLK			270
+#define CLKID_CTS_ENCL				271
+#define CLKID_CTS_ENCL_SEL			272
 
 #endif /* __G12A_CLKC_H */

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
