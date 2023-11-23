Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E70A4C624B4
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 Nov 2023 16:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wbXlX5aLEdwvJIQ2vny3XlY7PkWZrMM4Fbo8Az4gfRE=; b=tp1KV52golQ6f9
	rB3BMFNhuZfCgP4Goqtgk+F9DssatIQCe9pUCI2gXaMCuqwmfSjWhkuHP54z3IkW6Jvf5KB7wV8pf
	e5MQTj/zslrFVcfsnekNFT3DM4Zjo3b3eFOHhsx/TL/oNJl6ymITqkU9qZnhnEJa1L4BoeapAOgUX
	dKwDhizUwcxvRnsncgHUzb4YABbFX/0S501iPvybCWpMkiBSQf4FnvOf2nMVVlEBLyj88y4mZPpDw
	eNO2A3WyR2URgZcfURwADOtPL4M+3PI0MO4gKHYXs2LyUe+6Z7vw2NSS/4M5Rsr+numX4RiS+N/xE
	lMiQ53jepDVY9iMOc4hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6COq-005GwJ-1U;
	Thu, 23 Nov 2023 16:17:56 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6COi-005GtE-1Q
	for linux-amlogic@lists.infradead.org;
	Thu, 23 Nov 2023 16:17:49 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-40838915cecso6814585e9.2
        for <linux-amlogic@lists.infradead.org>; Thu, 23 Nov 2023 08:17:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700756266; x=1701361066; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n+r17lnAn408XDZCP50GEiVUXSzg8gJpg2O6vmcLUw8=;
        b=DXbLnw7zrgxdilGttIuesbp093KtYsbTGXQFI8NM7EqMuj1kJpv5rqVkWPDkuGncLP
         Q1L5tMWOMCHsNVDOvTkIecrsn3jtjGXjOaGMRKS6ZahpLvwGBMSHB3dlxXyHzafKUoQd
         zqd7BN5tdE0WknzbIxAhd9z2AfERyUikjY2mbq9sf3D3T21UWxsk2HE2VS0/hC6l/b1X
         yEj0vkxsZ7q2VxCvprU0utQ2hFeHZ7eTAy71INOeA0B5MoDymo8jyD8gPvJK5v8hoCvr
         O2h1fUiGzC19BB/YDNpvYVwLbwigQN0dDwpiZEG6aV5++77hT8K1j3RR5hSKYIDbZHR+
         GXPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700756266; x=1701361066;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n+r17lnAn408XDZCP50GEiVUXSzg8gJpg2O6vmcLUw8=;
        b=Px1ln2B2pRUPCpP94KHOOhJVep8ZPuKvsliMZJwLfOBbOL7WnPanstZznXAWFuHVLl
         sYcSDXZEGtAPyuXk3uNPknOsBz11xjkz/y8PzX/s+4xRvbmtehk6xYih1oKCU6/+zpZq
         PGl6W4so2jej9lsTFcjblxc6SJVZudY4iBQ8Rzn9WKBJBo1Dxq3jmp4awVLyS8dM1hOk
         9Y+HkoyitqPcX7mP5ZzNo7eJchxQSllFcJWmjzGV2siZvDd+7owZLdqtZ0keFA+yf47B
         NFQVgz46wSSHWzuln1k1ob7H0jE5kjA9O675AddTmNOWz6JAnAS1bpMud9O/wEK70xm4
         g/FQ==
X-Gm-Message-State: AOJu0Yx4MIZ4SBLbpd/IackfPiquQ6Z7do/W+/eyviWzdjb/s4pxK2VW
	mmbzXOa67mb3hnw5HWaByk9uIg==
X-Google-Smtp-Source: AGHT+IETz9wWM20n4EcOTVByPj1PCVyhgGlZT40Husp41oVXnYZX/66zd5tbmlbQ1MnFGe7B94ODEA==
X-Received: by 2002:a05:600c:5252:b0:40b:36e7:1edf with SMTP id fc18-20020a05600c525200b0040b36e71edfmr17894wmb.26.1700756266142;
        Thu, 23 Nov 2023 08:17:46 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id y3-20020adfee03000000b0032f7e832cabsm2052748wrn.90.2023.11.23.08.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 08:17:45 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 23 Nov 2023 17:17:42 +0100
Subject: [PATCH v2 2/2] pmdomain: amlogic: meson-ee-pwrc: add support for
 G12A ISP power domain
MIME-Version: 1.0
Message-Id: <20231123-topic-amlogic-upstream-isp-pmdomain-v2-2-61f2fcf709e5@linaro.org>
References: <20231123-topic-amlogic-upstream-isp-pmdomain-v2-0-61f2fcf709e5@linaro.org>
In-Reply-To: <20231123-topic-amlogic-upstream-isp-pmdomain-v2-0-61f2fcf709e5@linaro.org>
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: Daniel Scally <dan.scally@ideasonboard.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2024;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=fh+alAeyQd+6EQRoyWWcZlg2EgCfV/yy1gc39wpItH8=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlX3smSfL7PHAK5roBnpOcsvqwWyGp7LGN11oKwPVT
 UQBlg+yJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZV97JgAKCRB33NvayMhJ0Z9dD/
 42G8H2F1iQB1WalKUFK9EdFqjVyCmcLo/V0CzI3JvjfkodlcUDzbUl1Yd99otNMs8D0HfxPJGFY9V7
 S5a35LlTmQcJGzduSmNwx19r86Il1n5jYAaNKGh0ADjUTNw5H5UxFdRNyiPApbLAkaFcV7xp/48zT5
 qelZ+95Oe3Z2AO/FLGhGqdXNsnk/xh6v771/opSxU1tI6lF1G3q2lt2Of3tMFUdR1nlOVe6y+myG/s
 kt4vQSN80oNtzmufuEYR6dkjISqaYUMe1S0tLyKCs65dR/tWJQSqxYOiB6zbGS08QHBqrK5CndugW7
 vtG95szlgUb0BCiLenHWs+WwWEnw7uVZvgOklmDy4Em93txmKrI9vSzbV813kCYnrU5eur/Sa11Aoj
 m+u+me8TFAy8WwXUUs5Cmj82EJjMDgjPaUo6KfeVj2AZKC8I6WaQPKMNLhrpzBmwJsAa5XZ+NMmk7w
 3tTVzvDhLW00ODmk66gjl+nKqk0+XaAbTSHOXll8GsY0hFe8Is435BP148EFL5p4SO0V+5xXFyAsno
 4wH0n0hT7rNDi0h7DhXGK1USBha363nImOMlJaB9wwSHM+HDGpE/rEYrzwzdRYlv60HMMl3DPXiMx9
 ZNSUbihiMeaBe6NA+1gbpXF8hVJ7wGdQYAF7PqJwJOvFSG+PyUCRv3zRDEog==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231123_081748_493112_2D50FC5A 
X-CRM114-Status: GOOD (  10.61  )
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

Add entries for the ISP power domain found in the Amlogic G12B SoC

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/pmdomain/amlogic/meson-ee-pwrc.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/pmdomain/amlogic/meson-ee-pwrc.c b/drivers/pmdomain/amlogic/meson-ee-pwrc.c
index 0dd71cd814c5..fcec6eb610e4 100644
--- a/drivers/pmdomain/amlogic/meson-ee-pwrc.c
+++ b/drivers/pmdomain/amlogic/meson-ee-pwrc.c
@@ -47,6 +47,8 @@
 
 #define G12A_HHI_NANOQ_MEM_PD_REG0	(0x43 << 2)
 #define G12A_HHI_NANOQ_MEM_PD_REG1	(0x44 << 2)
+#define G12A_HHI_ISP_MEM_PD_REG0	(0x45 << 2)
+#define G12A_HHI_ISP_MEM_PD_REG1	(0x46 << 2)
 
 struct meson_ee_pwrc;
 struct meson_ee_pwrc_domain;
@@ -115,6 +117,13 @@ static struct meson_ee_pwrc_top_domain g12a_pwrc_nna = {
 	.iso_mask = BIT(16) | BIT(17),
 };
 
+static struct meson_ee_pwrc_top_domain g12a_pwrc_isp = {
+	.sleep_reg = GX_AO_RTI_GEN_PWR_SLEEP0,
+	.sleep_mask = BIT(18) | BIT(19),
+	.iso_reg = GX_AO_RTI_GEN_PWR_ISO0,
+	.iso_mask = BIT(18) | BIT(19),
+};
+
 /* Memory PD Domains */
 
 #define VPU_MEMPD(__reg)					\
@@ -231,6 +240,11 @@ static struct meson_ee_pwrc_mem_domain g12a_pwrc_mem_nna[] = {
 	{ G12A_HHI_NANOQ_MEM_PD_REG1, GENMASK(31, 0) },
 };
 
+static struct meson_ee_pwrc_mem_domain g12a_pwrc_mem_isp[] = {
+	{ G12A_HHI_ISP_MEM_PD_REG0, GENMASK(31, 0) },
+	{ G12A_HHI_ISP_MEM_PD_REG1, GENMASK(31, 0) },
+};
+
 #define VPU_PD(__name, __top_pd, __mem, __is_pwr_off, __resets, __clks)	\
 	{								\
 		.name = __name,						\
@@ -269,6 +283,8 @@ static struct meson_ee_pwrc_domain_desc g12a_pwrc_domains[] = {
 	[PWRC_G12A_ETH_ID] = MEM_PD("ETH", meson_pwrc_mem_eth),
 	[PWRC_G12A_NNA_ID] = TOP_PD("NNA", &g12a_pwrc_nna, g12a_pwrc_mem_nna,
 				    pwrc_ee_is_powered_off),
+	[PWRC_G12A_ISP_ID] = TOP_PD("ISP", &g12a_pwrc_isp, g12a_pwrc_mem_isp,
+				    pwrc_ee_is_powered_off),
 };
 
 static struct meson_ee_pwrc_domain_desc gxbb_pwrc_domains[] = {

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
