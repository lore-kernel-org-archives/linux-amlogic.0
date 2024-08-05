Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50BB2C3DA4A
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Aug 2024 11:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bwk1BtsW9Y9NSabQNGCqZPRarSCktJNmv9MZHqz+Um0=; b=S9SvMw2TRsAIvL
	KCedIYfVxCRInvxaKtbEg0BdbaScpTQWgG2TnbSRni81rQBSprWZhFP1S1Rr0NPSQREL+/Ux7SSdf
	zJ+IaM5GFY/77FQ7F8xB94AO7CwXgeKRipxWarIGvMRjkAlO/NOETQMrSWxVTBLPoTWRJebKnQz6R
	a1ZqRedoixCOR/nApiR0XIAFVbcHw2JFhMQoxDEkrpuz2wUnpUSICszmR6p2/xiyoTNrFLtzTkab7
	w/NBgHuwTKioE1SqQiMsA3hfFUNqJx8tonYZ1C/sZhYN51vVGR02QmJ0cOpJ43lUIf/V6c+zVJYq5
	3PNG1Jrmha3FotEQ22Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1saw0D-0000000Fh0q-43X0;
	Mon, 05 Aug 2024 11:35:49 +0000
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1savzk-0000000Fgsj-3dtw
	for linux-amlogic@lists.infradead.org;
	Mon, 05 Aug 2024 11:35:22 +0000
Received: by mail-yb1-xb34.google.com with SMTP id 3f1490d57ef6-e0b167da277so8198034276.3
        for <linux-amlogic@lists.infradead.org>; Mon, 05 Aug 2024 04:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722857719; x=1723462519; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SU4NGcxkgVdAvpk9gDmnqR+MSNmGoHmIUs/Ywakm0fo=;
        b=SJ63Ds6ja2O3CuORgXcbZMihtDxDiRUb+kXb5Wt25oDRTPJyiqhVUhJ0zP64AIRspF
         q/KcvIiehiNfmtNpYr8QzAsD6FYrUV3udMaaxCIDtoYhX+i9hXCGog785632XN/Rh03r
         k+gYvFqLe3cZ+uUC/5376GsLa/YTg+V1C5OaRm67SmW1cb2AfSMdIyRfTTlHxFDKZT1y
         eCjhq4vF2p/HdaILqFKSs+XUUIKh4Ovdf9z7CF4fNaK8c4bFSqHvvXi523Pbd+LLaK4r
         xRwyjTd7Jq/ZvECv3U+1oMRTF482yrmrm8ljA8CBL6brdKyG7RaOXfwuJTYd9geonOkn
         j/1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722857719; x=1723462519;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SU4NGcxkgVdAvpk9gDmnqR+MSNmGoHmIUs/Ywakm0fo=;
        b=NW993ejlVbx5eGLJzUCAfUWSR5wC0bM0WVfzk+ud6UWioFayyqwsy3bQ8/OBN/HRIP
         5Eqe4CsgRp7XpsnB0amFcKCLRU2Mn5mn+2SU04dqEW8G3hPLj7CFCE82pvO48rYi+2KU
         L/S7Dmk9osKwu14sD2zd1xuUlNQaew5hTqx3CnHoowdHqrovkkqkHgZY39+SRp40QCiW
         LmSIUDnYP8tuWigLYIS6//x8adC6TwYWnL6ZgNO9HdL93Q0H4qnDlihmMK3CvWWBP/3d
         6L3VagXTD4iI1hzjH/xFJyM/6cFOx/SyctvvHstcvBCVSGtQyEeUNBqkSAuSKu62UKmD
         bBwg==
X-Forwarded-Encrypted: i=1; AJvYcCVM4nPCAYmbb7crM5/0W5y56Lg47ku4UUhtw2KltJAUyb9DdsbPcrmQgpHiTqKpTqdHalyPv7Ru3Zl+hUeQgH+aWp17gKbqWjCVu4BjhArYvNI=
X-Gm-Message-State: AOJu0Yw5K9B1ksLzIpKyqs0gA10YPH0ylLYldhOVaGkkdEWpWaBQs3XO
	kXjTCeSRs0KTeZ8bwsnOkwasmwdtWQmUtOzRJhFpYI1fq+uP3SD2IxG6wXMO1aCAGy7KmYv56aY
	BW3xpowem8VHAMki4IIUd8hxNt8XFPVJ6jcv0Hg==
X-Google-Smtp-Source: AGHT+IFWJRsmSzDOhCHSAk2SJRevAEr0CSNuiL18UfBKyU0tQ0PcfVXvim6uM/tmOXOGoWWbs0HYdEntsBKenr3Ldt8=
X-Received: by 2002:a05:6902:154e:b0:e02:b720:3b2b with SMTP id
 3f1490d57ef6-e0bde301ab2mr14842669276.14.1722857719558; Mon, 05 Aug 2024
 04:35:19 -0700 (PDT)
MIME-Version: 1.0
References: <20240730130227.712894-1-jbrunet@baylibre.com>
In-Reply-To: <20240730130227.712894-1-jbrunet@baylibre.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 5 Aug 2024 13:34:43 +0200
Message-ID: <CAPDyKFqbF-0d=EGdsKR2_R_-3VowLeYXGrSuzTGeN-bvwSgwGg@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: amlogic: remove obsolete vpu domain driver
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240805_043520_943802_989B3051 
X-CRM114-Status: GOOD (  23.59  )
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

On Tue, 30 Jul 2024 at 15:02, Jerome Brunet <jbrunet@baylibre.com> wrote:
>
> meson-gx-pwrc-vpu has been superseded by meson-ee-pwrc since
> commit 53773f2dfd9c ("soc: amlogic: meson-ee-pwrc: add support for the Meson GX SoCs"),
> so v5.8.
>
> This driver is obsolete and no longer used or tested.
> There is no reason to keep it around so remove it.
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/pmdomain/amlogic/Kconfig             |  11 -
>  drivers/pmdomain/amlogic/Makefile            |   1 -
>  drivers/pmdomain/amlogic/meson-gx-pwrc-vpu.c | 380 -------------------
>  3 files changed, 392 deletions(-)
>  delete mode 100644 drivers/pmdomain/amlogic/meson-gx-pwrc-vpu.c
>
> diff --git a/drivers/pmdomain/amlogic/Kconfig b/drivers/pmdomain/amlogic/Kconfig
> index 2108729909b5..e72b664174af 100644
> --- a/drivers/pmdomain/amlogic/Kconfig
> +++ b/drivers/pmdomain/amlogic/Kconfig
> @@ -1,17 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  menu "Amlogic PM Domains"
>
> -config MESON_GX_PM_DOMAINS
> -       tristate "Amlogic Meson GX Power Domains driver"
> -       depends on ARCH_MESON || COMPILE_TEST
> -       depends on PM && OF
> -       default ARCH_MESON
> -       select PM_GENERIC_DOMAINS
> -       select PM_GENERIC_DOMAINS_OF
> -       help
> -         Say yes to expose Amlogic Meson GX Power Domains as
> -         Generic Power Domains.
> -
>  config MESON_EE_PM_DOMAINS
>         tristate "Amlogic Meson Everything-Else Power Domains driver"
>         depends on ARCH_MESON || COMPILE_TEST
> diff --git a/drivers/pmdomain/amlogic/Makefile b/drivers/pmdomain/amlogic/Makefile
> index 3d58abd574f9..99f195f09957 100644
> --- a/drivers/pmdomain/amlogic/Makefile
> +++ b/drivers/pmdomain/amlogic/Makefile
> @@ -1,4 +1,3 @@
>  # SPDX-License-Identifier: GPL-2.0-only
> -obj-$(CONFIG_MESON_GX_PM_DOMAINS) += meson-gx-pwrc-vpu.o
>  obj-$(CONFIG_MESON_EE_PM_DOMAINS) += meson-ee-pwrc.o
>  obj-$(CONFIG_MESON_SECURE_PM_DOMAINS) += meson-secure-pwrc.o
> diff --git a/drivers/pmdomain/amlogic/meson-gx-pwrc-vpu.c b/drivers/pmdomain/amlogic/meson-gx-pwrc-vpu.c
> deleted file mode 100644
> index 6028e91664a4..000000000000
> --- a/drivers/pmdomain/amlogic/meson-gx-pwrc-vpu.c
> +++ /dev/null
> @@ -1,380 +0,0 @@
> -/*
> - * Copyright (c) 2017 BayLibre, SAS
> - * Author: Neil Armstrong <narmstrong@baylibre.com>
> - *
> - * SPDX-License-Identifier: GPL-2.0+
> - */
> -
> -#include <linux/platform_device.h>
> -#include <linux/pm_domain.h>
> -#include <linux/bitfield.h>
> -#include <linux/regmap.h>
> -#include <linux/mfd/syscon.h>
> -#include <linux/of.h>
> -#include <linux/reset.h>
> -#include <linux/clk.h>
> -#include <linux/module.h>
> -
> -/* AO Offsets */
> -
> -#define AO_RTI_GEN_PWR_SLEEP0          (0x3a << 2)
> -
> -#define GEN_PWR_VPU_HDMI               BIT(8)
> -#define GEN_PWR_VPU_HDMI_ISO           BIT(9)
> -
> -/* HHI Offsets */
> -
> -#define HHI_MEM_PD_REG0                        (0x40 << 2)
> -#define HHI_VPU_MEM_PD_REG0            (0x41 << 2)
> -#define HHI_VPU_MEM_PD_REG1            (0x42 << 2)
> -#define HHI_VPU_MEM_PD_REG2            (0x4d << 2)
> -
> -struct meson_gx_pwrc_vpu {
> -       struct generic_pm_domain genpd;
> -       struct regmap *regmap_ao;
> -       struct regmap *regmap_hhi;
> -       struct reset_control *rstc;
> -       struct clk *vpu_clk;
> -       struct clk *vapb_clk;
> -};
> -
> -static inline
> -struct meson_gx_pwrc_vpu *genpd_to_pd(struct generic_pm_domain *d)
> -{
> -       return container_of(d, struct meson_gx_pwrc_vpu, genpd);
> -}
> -
> -static int meson_gx_pwrc_vpu_power_off(struct generic_pm_domain *genpd)
> -{
> -       struct meson_gx_pwrc_vpu *pd = genpd_to_pd(genpd);
> -       int i;
> -
> -       regmap_update_bits(pd->regmap_ao, AO_RTI_GEN_PWR_SLEEP0,
> -                          GEN_PWR_VPU_HDMI_ISO, GEN_PWR_VPU_HDMI_ISO);
> -       udelay(20);
> -
> -       /* Power Down Memories */
> -       for (i = 0; i < 32; i += 2) {
> -               regmap_update_bits(pd->regmap_hhi, HHI_VPU_MEM_PD_REG0,
> -                                  0x3 << i, 0x3 << i);
> -               udelay(5);
> -       }
> -       for (i = 0; i < 32; i += 2) {
> -               regmap_update_bits(pd->regmap_hhi, HHI_VPU_MEM_PD_REG1,
> -                                  0x3 << i, 0x3 << i);
> -               udelay(5);
> -       }
> -       for (i = 8; i < 16; i++) {
> -               regmap_update_bits(pd->regmap_hhi, HHI_MEM_PD_REG0,
> -                                  BIT(i), BIT(i));
> -               udelay(5);
> -       }
> -       udelay(20);
> -
> -       regmap_update_bits(pd->regmap_ao, AO_RTI_GEN_PWR_SLEEP0,
> -                          GEN_PWR_VPU_HDMI, GEN_PWR_VPU_HDMI);
> -
> -       msleep(20);
> -
> -       clk_disable_unprepare(pd->vpu_clk);
> -       clk_disable_unprepare(pd->vapb_clk);
> -
> -       return 0;
> -}
> -
> -static int meson_g12a_pwrc_vpu_power_off(struct generic_pm_domain *genpd)
> -{
> -       struct meson_gx_pwrc_vpu *pd = genpd_to_pd(genpd);
> -       int i;
> -
> -       regmap_update_bits(pd->regmap_ao, AO_RTI_GEN_PWR_SLEEP0,
> -                          GEN_PWR_VPU_HDMI_ISO, GEN_PWR_VPU_HDMI_ISO);
> -       udelay(20);
> -
> -       /* Power Down Memories */
> -       for (i = 0; i < 32; i += 2) {
> -               regmap_update_bits(pd->regmap_hhi, HHI_VPU_MEM_PD_REG0,
> -                                  0x3 << i, 0x3 << i);
> -               udelay(5);
> -       }
> -       for (i = 0; i < 32; i += 2) {
> -               regmap_update_bits(pd->regmap_hhi, HHI_VPU_MEM_PD_REG1,
> -                                  0x3 << i, 0x3 << i);
> -               udelay(5);
> -       }
> -       for (i = 0; i < 32; i += 2) {
> -               regmap_update_bits(pd->regmap_hhi, HHI_VPU_MEM_PD_REG2,
> -                                  0x3 << i, 0x3 << i);
> -               udelay(5);
> -       }
> -       for (i = 8; i < 16; i++) {
> -               regmap_update_bits(pd->regmap_hhi, HHI_MEM_PD_REG0,
> -                                  BIT(i), BIT(i));
> -               udelay(5);
> -       }
> -       udelay(20);
> -
> -       regmap_update_bits(pd->regmap_ao, AO_RTI_GEN_PWR_SLEEP0,
> -                          GEN_PWR_VPU_HDMI, GEN_PWR_VPU_HDMI);
> -
> -       msleep(20);
> -
> -       clk_disable_unprepare(pd->vpu_clk);
> -       clk_disable_unprepare(pd->vapb_clk);
> -
> -       return 0;
> -}
> -
> -static int meson_gx_pwrc_vpu_setup_clk(struct meson_gx_pwrc_vpu *pd)
> -{
> -       int ret;
> -
> -       ret = clk_prepare_enable(pd->vpu_clk);
> -       if (ret)
> -               return ret;
> -
> -       ret = clk_prepare_enable(pd->vapb_clk);
> -       if (ret)
> -               clk_disable_unprepare(pd->vpu_clk);
> -
> -       return ret;
> -}
> -
> -static int meson_gx_pwrc_vpu_power_on(struct generic_pm_domain *genpd)
> -{
> -       struct meson_gx_pwrc_vpu *pd = genpd_to_pd(genpd);
> -       int ret;
> -       int i;
> -
> -       regmap_update_bits(pd->regmap_ao, AO_RTI_GEN_PWR_SLEEP0,
> -                          GEN_PWR_VPU_HDMI, 0);
> -       udelay(20);
> -
> -       /* Power Up Memories */
> -       for (i = 0; i < 32; i += 2) {
> -               regmap_update_bits(pd->regmap_hhi, HHI_VPU_MEM_PD_REG0,
> -                                  0x3 << i, 0);
> -               udelay(5);
> -       }
> -
> -       for (i = 0; i < 32; i += 2) {
> -               regmap_update_bits(pd->regmap_hhi, HHI_VPU_MEM_PD_REG1,
> -                                  0x3 << i, 0);
> -               udelay(5);
> -       }
> -
> -       for (i = 8; i < 16; i++) {
> -               regmap_update_bits(pd->regmap_hhi, HHI_MEM_PD_REG0,
> -                                  BIT(i), 0);
> -               udelay(5);
> -       }
> -       udelay(20);
> -
> -       ret = reset_control_assert(pd->rstc);
> -       if (ret)
> -               return ret;
> -
> -       regmap_update_bits(pd->regmap_ao, AO_RTI_GEN_PWR_SLEEP0,
> -                          GEN_PWR_VPU_HDMI_ISO, 0);
> -
> -       ret = reset_control_deassert(pd->rstc);
> -       if (ret)
> -               return ret;
> -
> -       ret = meson_gx_pwrc_vpu_setup_clk(pd);
> -       if (ret)
> -               return ret;
> -
> -       return 0;
> -}
> -
> -static int meson_g12a_pwrc_vpu_power_on(struct generic_pm_domain *genpd)
> -{
> -       struct meson_gx_pwrc_vpu *pd = genpd_to_pd(genpd);
> -       int ret;
> -       int i;
> -
> -       regmap_update_bits(pd->regmap_ao, AO_RTI_GEN_PWR_SLEEP0,
> -                          GEN_PWR_VPU_HDMI, 0);
> -       udelay(20);
> -
> -       /* Power Up Memories */
> -       for (i = 0; i < 32; i += 2) {
> -               regmap_update_bits(pd->regmap_hhi, HHI_VPU_MEM_PD_REG0,
> -                                  0x3 << i, 0);
> -               udelay(5);
> -       }
> -
> -       for (i = 0; i < 32; i += 2) {
> -               regmap_update_bits(pd->regmap_hhi, HHI_VPU_MEM_PD_REG1,
> -                                  0x3 << i, 0);
> -               udelay(5);
> -       }
> -
> -       for (i = 0; i < 32; i += 2) {
> -               regmap_update_bits(pd->regmap_hhi, HHI_VPU_MEM_PD_REG2,
> -                                  0x3 << i, 0);
> -               udelay(5);
> -       }
> -
> -       for (i = 8; i < 16; i++) {
> -               regmap_update_bits(pd->regmap_hhi, HHI_MEM_PD_REG0,
> -                                  BIT(i), 0);
> -               udelay(5);
> -       }
> -       udelay(20);
> -
> -       ret = reset_control_assert(pd->rstc);
> -       if (ret)
> -               return ret;
> -
> -       regmap_update_bits(pd->regmap_ao, AO_RTI_GEN_PWR_SLEEP0,
> -                          GEN_PWR_VPU_HDMI_ISO, 0);
> -
> -       ret = reset_control_deassert(pd->rstc);
> -       if (ret)
> -               return ret;
> -
> -       ret = meson_gx_pwrc_vpu_setup_clk(pd);
> -       if (ret)
> -               return ret;
> -
> -       return 0;
> -}
> -
> -static bool meson_gx_pwrc_vpu_get_power(struct meson_gx_pwrc_vpu *pd)
> -{
> -       u32 reg;
> -
> -       regmap_read(pd->regmap_ao, AO_RTI_GEN_PWR_SLEEP0, &reg);
> -
> -       return (reg & GEN_PWR_VPU_HDMI);
> -}
> -
> -static struct meson_gx_pwrc_vpu vpu_hdmi_pd = {
> -       .genpd = {
> -               .name = "vpu_hdmi",
> -               .power_off = meson_gx_pwrc_vpu_power_off,
> -               .power_on = meson_gx_pwrc_vpu_power_on,
> -       },
> -};
> -
> -static struct meson_gx_pwrc_vpu vpu_hdmi_pd_g12a = {
> -       .genpd = {
> -               .name = "vpu_hdmi",
> -               .power_off = meson_g12a_pwrc_vpu_power_off,
> -               .power_on = meson_g12a_pwrc_vpu_power_on,
> -       },
> -};
> -
> -static int meson_gx_pwrc_vpu_probe(struct platform_device *pdev)
> -{
> -       const struct meson_gx_pwrc_vpu *vpu_pd_match;
> -       struct regmap *regmap_ao, *regmap_hhi;
> -       struct meson_gx_pwrc_vpu *vpu_pd;
> -       struct device_node *parent_np;
> -       struct reset_control *rstc;
> -       struct clk *vpu_clk;
> -       struct clk *vapb_clk;
> -       bool powered_off;
> -       int ret;
> -
> -       vpu_pd_match = of_device_get_match_data(&pdev->dev);
> -       if (!vpu_pd_match) {
> -               dev_err(&pdev->dev, "failed to get match data\n");
> -               return -ENODEV;
> -       }
> -
> -       vpu_pd = devm_kzalloc(&pdev->dev, sizeof(*vpu_pd), GFP_KERNEL);
> -       if (!vpu_pd)
> -               return -ENOMEM;
> -
> -       memcpy(vpu_pd, vpu_pd_match, sizeof(*vpu_pd));
> -
> -       parent_np = of_get_parent(pdev->dev.of_node);
> -       regmap_ao = syscon_node_to_regmap(parent_np);
> -       of_node_put(parent_np);
> -       if (IS_ERR(regmap_ao)) {
> -               dev_err(&pdev->dev, "failed to get regmap\n");
> -               return PTR_ERR(regmap_ao);
> -       }
> -
> -       regmap_hhi = syscon_regmap_lookup_by_phandle(pdev->dev.of_node,
> -                                                    "amlogic,hhi-sysctrl");
> -       if (IS_ERR(regmap_hhi)) {
> -               dev_err(&pdev->dev, "failed to get HHI regmap\n");
> -               return PTR_ERR(regmap_hhi);
> -       }
> -
> -       rstc = devm_reset_control_array_get_exclusive(&pdev->dev);
> -       if (IS_ERR(rstc))
> -               return dev_err_probe(&pdev->dev, PTR_ERR(rstc),
> -                                    "failed to get reset lines\n");
> -
> -       vpu_clk = devm_clk_get(&pdev->dev, "vpu");
> -       if (IS_ERR(vpu_clk)) {
> -               dev_err(&pdev->dev, "vpu clock request failed\n");
> -               return PTR_ERR(vpu_clk);
> -       }
> -
> -       vapb_clk = devm_clk_get(&pdev->dev, "vapb");
> -       if (IS_ERR(vapb_clk)) {
> -               dev_err(&pdev->dev, "vapb clock request failed\n");
> -               return PTR_ERR(vapb_clk);
> -       }
> -
> -       vpu_pd->regmap_ao = regmap_ao;
> -       vpu_pd->regmap_hhi = regmap_hhi;
> -       vpu_pd->rstc = rstc;
> -       vpu_pd->vpu_clk = vpu_clk;
> -       vpu_pd->vapb_clk = vapb_clk;
> -
> -       platform_set_drvdata(pdev, vpu_pd);
> -
> -       powered_off = meson_gx_pwrc_vpu_get_power(vpu_pd);
> -
> -       /* If already powered, sync the clock states */
> -       if (!powered_off) {
> -               ret = meson_gx_pwrc_vpu_setup_clk(vpu_pd);
> -               if (ret)
> -                       return ret;
> -       }
> -
> -       vpu_pd->genpd.flags = GENPD_FLAG_ALWAYS_ON;
> -       pm_genpd_init(&vpu_pd->genpd, NULL, powered_off);
> -
> -       return of_genpd_add_provider_simple(pdev->dev.of_node,
> -                                           &vpu_pd->genpd);
> -}
> -
> -static void meson_gx_pwrc_vpu_shutdown(struct platform_device *pdev)
> -{
> -       struct meson_gx_pwrc_vpu *vpu_pd = platform_get_drvdata(pdev);
> -       bool powered_off;
> -
> -       powered_off = meson_gx_pwrc_vpu_get_power(vpu_pd);
> -       if (!powered_off)
> -               vpu_pd->genpd.power_off(&vpu_pd->genpd);
> -}
> -
> -static const struct of_device_id meson_gx_pwrc_vpu_match_table[] = {
> -       { .compatible = "amlogic,meson-gx-pwrc-vpu", .data = &vpu_hdmi_pd },
> -       {
> -         .compatible = "amlogic,meson-g12a-pwrc-vpu",
> -         .data = &vpu_hdmi_pd_g12a
> -       },
> -       { /* sentinel */ }
> -};
> -MODULE_DEVICE_TABLE(of, meson_gx_pwrc_vpu_match_table);
> -
> -static struct platform_driver meson_gx_pwrc_vpu_driver = {
> -       .probe  = meson_gx_pwrc_vpu_probe,
> -       .shutdown = meson_gx_pwrc_vpu_shutdown,
> -       .driver = {
> -               .name           = "meson_gx_pwrc_vpu",
> -               .of_match_table = meson_gx_pwrc_vpu_match_table,
> -       },
> -};
> -module_platform_driver(meson_gx_pwrc_vpu_driver);
> -MODULE_DESCRIPTION("Amlogic Meson GX Power Domains driver");
> -MODULE_LICENSE("GPL v2");
> --
> 2.43.0
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
