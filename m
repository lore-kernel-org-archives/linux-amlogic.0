Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BEC6C3ABBE
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 May 2025 11:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X97JRVFhomRNQU9khCF4+lRCSjLqbG/VSgYWp3aH1WM=; b=KHNFqJuG7+cSf+
	sh+Al3SJBNGbscDvukQuP2kk4tJfGl1FbtQ5hBQGI8UXoFtgui/hHv4dxjkYuVAkedZYJEwCPk1bM
	WSdtrDlmLtiU48LvvnTbYodztBp1+M93xMeva2VdSJyQXUiocIyOjma07NS+aTw0qqN0xP9Tg7e5J
	Zflfk4WYnQ7FuZE22suI93N0AiP4JN6T73O185E3rzB4v9aata986Ckrwe+WzTW1orSDeXjmlSszu
	aSm/nSDGyNZjwLF8ouTybI9Z37kRVNxRS1PgYN0w07ax78Gisvwt55IKz9AojApyFuft3GtL1w6/j
	L9y1qjMSmgk14Pkc6OIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCzWn-00000000V19-39p3;
	Thu, 08 May 2025 11:35:01 +0000
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCzWl-00000000V04-1DSW
	for linux-amlogic@lists.infradead.org;
	Thu, 08 May 2025 11:35:00 +0000
Received: by mail-yb1-xb35.google.com with SMTP id 3f1490d57ef6-e75668006b9so975666276.3
        for <linux-amlogic@lists.infradead.org>; Thu, 08 May 2025 04:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746704098; x=1747308898; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4I3mCeE7NaxK25rclKHFgvE1pFxuXrcbii3YouC46fI=;
        b=F5YINPNKnzxAi5kOkcWSROfIdIzmXLljApUJkQGWUbQWgeEsIG0AJ0/s6pqxQcP7Zo
         T+ST5hEaLOnr1I4Qrl34eGjbECAK5qbuh5ceDVLbsbXXgOflLiRs49GUAtL9cKVXUOh0
         0gP8QUzm6qGkuWHhvDQGQ5T+01+LjfkgcyDiNoPj2Ud/ZSVW6OgdN5F2KDQ8Ni30klNP
         SP8BqmgYqpF2KKqTZBAzCMxnyXTLDnWQhUTRkWQAM/9srqAElW2qs5/BkF4/1tc7uG1t
         eute6wJUM1uF9sL5TST/2K9o5bMT6PClunnN4BMwMQQHzfSGTCIpMR1oKNNm3IQvj57+
         5ecA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746704098; x=1747308898;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4I3mCeE7NaxK25rclKHFgvE1pFxuXrcbii3YouC46fI=;
        b=N09SWCYQ6iO5VsCIiTgb+T9KA4CsgdUzO/A4p1mG0dqse3iqPuYBJfbJ1j19Z29H4k
         8k9WSpC+Bw+7cVvL1fE6cKXswZd2Bd7welzOGStoHrhAN/YZfrp9jcX7cv4IpRUK+bIS
         TQ9Gk+43c8+qiqbvy8zmrBQm9dBHOWdvIiL8RBeEDaaRKPBBQOMxVNLy4HrbPDpjxW2J
         RiZchjwzn0Rx3xPcggWeMsNXR537GJwOeyiV8ZUvadb1BbYJ1A9aM8wqzo5xMWKSbKZD
         CJrPI8lYZVM5r03xHqlkvYZEIVt7Pvtr3AaRzll4Ncy29qzAdN+iMLJ6993J//mNsjTB
         NWIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXM6R9HpaR3WC0+EIPIN43YFqPSLcjni6kLZbLKAdmPHlEd35Kg6wz0mGIS1vfIJxDehgfMKY5VTjb8v4VU@lists.infradead.org
X-Gm-Message-State: AOJu0YxmtpUJvgcqxYeHvUd0cG4RWo0U7Y8r3XjQI1ZSzki2tHM65Z5i
	kuwHqundmhng2R+fOUaMeSoRMffsGBhM9S5BK54tWub5YRYofukWfhMPbdaYOAC8dIJtC56dJ0w
	7eW8GsXriYOH7xufUqtD3Ofg7nkdB9WO7N4sxbA==
X-Gm-Gg: ASbGncu+PyfAx/Q/PPzLTpZAG4RUueRSz6eJJwY6cOURJUU8jIFXK0pu74m0ZU5v8JS
	8OGHAQow4KPiqgXtWAgtVdJeGRhZiguLvGpBxR2sNoP8ANKz1PwdeANMld2SPHTvUt41GBTQ7eo
	7odvntsAe0noQNPEKhe3uHQ9pQxoFuf1noaQ==
X-Google-Smtp-Source: AGHT+IFISwEmEaUPEIGkAw+pjWlFVBT86sEjNE/qTVOISvnuF8D1u+N13cESKrEtVLIEhG9cDQKZ22WKp9cDBmU869o=
X-Received: by 2002:a05:6902:230f:b0:e73:1ff1:ca2f with SMTP id
 3f1490d57ef6-e78ef6f7c55mr3350492276.32.1746704097920; Thu, 08 May 2025
 04:34:57 -0700 (PDT)
MIME-Version: 1.0
References: <edc560afe2a8763c93341d161daeb8b33ba606c6.1746199917.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <edc560afe2a8763c93341d161daeb8b33ba606c6.1746199917.git.christophe.jaillet@wanadoo.fr>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 8 May 2025 13:34:22 +0200
X-Gm-Features: ATxdqUFTyHds9ofNJKemjngwN8NRV53Nc2rYed1UjoRSW5B2VKN5wXgtKbJ3AXY
Message-ID: <CAPDyKFpQPj8ky-QkOTgb0KQFoj+cP0EPE-uFu_MQozPC2vosOQ@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: amlogic: Constify some structures
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_043459_339130_CCED580E 
X-CRM114-Status: GOOD (  19.61  )
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

On Fri, 2 May 2025 at 17:32, Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> Most structures in this driver are not modified.
>
> Constifying these structures moves some data to a read-only section, so
> increase overall security, especially when the structure holds some
> function pointers. (This is the case for see meson_ee_pwrc_domain_desc)
>
> On a x86_64, with allmodconfig, as an example:
> Before:
> ======
>    text    data     bss     dec     hex filename
>    8924    3832       0   12756    31d4 drivers/pmdomain/amlogic/meson-ee-pwrc.o
>
> After:
> =====
>    text    data     bss     dec     hex filename
>   12396     336       0   12732    31bc drivers/pmdomain/amlogic/meson-ee-pwrc.o
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied for next, thanks!

Kind regards
Uffe

> ---
> Compile tested-only.
> ---
>  drivers/pmdomain/amlogic/meson-ee-pwrc.c | 78 ++++++++++++------------
>  1 file changed, 39 insertions(+), 39 deletions(-)
>
> diff --git a/drivers/pmdomain/amlogic/meson-ee-pwrc.c b/drivers/pmdomain/amlogic/meson-ee-pwrc.c
> index fbb2b4103930..55c8c9f66a1b 100644
> --- a/drivers/pmdomain/amlogic/meson-ee-pwrc.c
> +++ b/drivers/pmdomain/amlogic/meson-ee-pwrc.c
> @@ -69,27 +69,27 @@ struct meson_ee_pwrc_domain_desc {
>         char *name;
>         unsigned int reset_names_count;
>         unsigned int clk_names_count;
> -       struct meson_ee_pwrc_top_domain *top_pd;
> +       const struct meson_ee_pwrc_top_domain *top_pd;
>         unsigned int mem_pd_count;
> -       struct meson_ee_pwrc_mem_domain *mem_pd;
> +       const struct meson_ee_pwrc_mem_domain *mem_pd;
>         bool (*is_powered_off)(struct meson_ee_pwrc_domain *pwrc_domain);
>  };
>
>  struct meson_ee_pwrc_domain_data {
>         unsigned int count;
> -       struct meson_ee_pwrc_domain_desc *domains;
> +       const struct meson_ee_pwrc_domain_desc *domains;
>  };
>
>  /* TOP Power Domains */
>
> -static struct meson_ee_pwrc_top_domain gx_pwrc_vpu = {
> +static const struct meson_ee_pwrc_top_domain gx_pwrc_vpu = {
>         .sleep_reg = GX_AO_RTI_GEN_PWR_SLEEP0,
>         .sleep_mask = BIT(8),
>         .iso_reg = GX_AO_RTI_GEN_PWR_SLEEP0,
>         .iso_mask = BIT(9),
>  };
>
> -static struct meson_ee_pwrc_top_domain meson8_pwrc_vpu = {
> +static const struct meson_ee_pwrc_top_domain meson8_pwrc_vpu = {
>         .sleep_reg = MESON8_AO_RTI_GEN_PWR_SLEEP0,
>         .sleep_mask = BIT(8),
>         .iso_reg = MESON8_AO_RTI_GEN_PWR_SLEEP0,
> @@ -104,20 +104,20 @@ static struct meson_ee_pwrc_top_domain meson8_pwrc_vpu = {
>                 .iso_mask = BIT(__bit),                         \
>         }
>
> -static struct meson_ee_pwrc_top_domain sm1_pwrc_vpu = SM1_EE_PD(8);
> -static struct meson_ee_pwrc_top_domain sm1_pwrc_nna = SM1_EE_PD(16);
> -static struct meson_ee_pwrc_top_domain sm1_pwrc_usb = SM1_EE_PD(17);
> -static struct meson_ee_pwrc_top_domain sm1_pwrc_pci = SM1_EE_PD(18);
> -static struct meson_ee_pwrc_top_domain sm1_pwrc_ge2d = SM1_EE_PD(19);
> +static const struct meson_ee_pwrc_top_domain sm1_pwrc_vpu = SM1_EE_PD(8);
> +static const struct meson_ee_pwrc_top_domain sm1_pwrc_nna = SM1_EE_PD(16);
> +static const struct meson_ee_pwrc_top_domain sm1_pwrc_usb = SM1_EE_PD(17);
> +static const struct meson_ee_pwrc_top_domain sm1_pwrc_pci = SM1_EE_PD(18);
> +static const struct meson_ee_pwrc_top_domain sm1_pwrc_ge2d = SM1_EE_PD(19);
>
> -static struct meson_ee_pwrc_top_domain g12a_pwrc_nna = {
> +static const struct meson_ee_pwrc_top_domain g12a_pwrc_nna = {
>         .sleep_reg = GX_AO_RTI_GEN_PWR_SLEEP0,
>         .sleep_mask = BIT(16) | BIT(17),
>         .iso_reg = GX_AO_RTI_GEN_PWR_ISO0,
>         .iso_mask = BIT(16) | BIT(17),
>  };
>
> -static struct meson_ee_pwrc_top_domain g12a_pwrc_isp = {
> +static const struct meson_ee_pwrc_top_domain g12a_pwrc_isp = {
>         .sleep_reg = GX_AO_RTI_GEN_PWR_SLEEP0,
>         .sleep_mask = BIT(18) | BIT(19),
>         .iso_reg = GX_AO_RTI_GEN_PWR_ISO0,
> @@ -154,39 +154,39 @@ static struct meson_ee_pwrc_top_domain g12a_pwrc_isp = {
>         { __reg, BIT(14) },                                     \
>         { __reg, BIT(15) }
>
> -static struct meson_ee_pwrc_mem_domain axg_pwrc_mem_vpu[] = {
> +static const struct meson_ee_pwrc_mem_domain axg_pwrc_mem_vpu[] = {
>         VPU_MEMPD(HHI_VPU_MEM_PD_REG0),
>         VPU_HHI_MEMPD(HHI_MEM_PD_REG0),
>  };
>
> -static struct meson_ee_pwrc_mem_domain g12a_pwrc_mem_vpu[] = {
> +static const struct meson_ee_pwrc_mem_domain g12a_pwrc_mem_vpu[] = {
>         VPU_MEMPD(HHI_VPU_MEM_PD_REG0),
>         VPU_MEMPD(HHI_VPU_MEM_PD_REG1),
>         VPU_MEMPD(HHI_VPU_MEM_PD_REG2),
>         VPU_HHI_MEMPD(HHI_MEM_PD_REG0),
>  };
>
> -static struct meson_ee_pwrc_mem_domain gxbb_pwrc_mem_vpu[] = {
> +static const struct meson_ee_pwrc_mem_domain gxbb_pwrc_mem_vpu[] = {
>         VPU_MEMPD(HHI_VPU_MEM_PD_REG0),
>         VPU_MEMPD(HHI_VPU_MEM_PD_REG1),
>         VPU_HHI_MEMPD(HHI_MEM_PD_REG0),
>  };
>
> -static struct meson_ee_pwrc_mem_domain meson_pwrc_mem_eth[] = {
> +static const struct meson_ee_pwrc_mem_domain meson_pwrc_mem_eth[] = {
>         { HHI_MEM_PD_REG0, GENMASK(3, 2) },
>  };
>
> -static struct meson_ee_pwrc_mem_domain meson8_pwrc_audio_dsp_mem[] = {
> +static const struct meson_ee_pwrc_mem_domain meson8_pwrc_audio_dsp_mem[] = {
>         { HHI_MEM_PD_REG0, GENMASK(1, 0) },
>  };
>
> -static struct meson_ee_pwrc_mem_domain meson8_pwrc_mem_vpu[] = {
> +static const struct meson_ee_pwrc_mem_domain meson8_pwrc_mem_vpu[] = {
>         VPU_MEMPD(HHI_VPU_MEM_PD_REG0),
>         VPU_MEMPD(HHI_VPU_MEM_PD_REG1),
>         VPU_HHI_MEMPD(HHI_MEM_PD_REG0),
>  };
>
> -static struct meson_ee_pwrc_mem_domain sm1_pwrc_mem_vpu[] = {
> +static const struct meson_ee_pwrc_mem_domain sm1_pwrc_mem_vpu[] = {
>         VPU_MEMPD(HHI_VPU_MEM_PD_REG0),
>         VPU_MEMPD(HHI_VPU_MEM_PD_REG1),
>         VPU_MEMPD(HHI_VPU_MEM_PD_REG2),
> @@ -198,28 +198,28 @@ static struct meson_ee_pwrc_mem_domain sm1_pwrc_mem_vpu[] = {
>         VPU_HHI_MEMPD(HHI_MEM_PD_REG0),
>  };
>
> -static struct meson_ee_pwrc_mem_domain sm1_pwrc_mem_nna[] = {
> +static const struct meson_ee_pwrc_mem_domain sm1_pwrc_mem_nna[] = {
>         { HHI_NANOQ_MEM_PD_REG0, 0xff },
>         { HHI_NANOQ_MEM_PD_REG1, 0xff },
>  };
>
> -static struct meson_ee_pwrc_mem_domain sm1_pwrc_mem_usb[] = {
> +static const struct meson_ee_pwrc_mem_domain sm1_pwrc_mem_usb[] = {
>         { HHI_MEM_PD_REG0, GENMASK(31, 30) },
>  };
>
> -static struct meson_ee_pwrc_mem_domain sm1_pwrc_mem_pcie[] = {
> +static const struct meson_ee_pwrc_mem_domain sm1_pwrc_mem_pcie[] = {
>         { HHI_MEM_PD_REG0, GENMASK(29, 26) },
>  };
>
> -static struct meson_ee_pwrc_mem_domain sm1_pwrc_mem_ge2d[] = {
> +static const struct meson_ee_pwrc_mem_domain sm1_pwrc_mem_ge2d[] = {
>         { HHI_MEM_PD_REG0, GENMASK(25, 18) },
>  };
>
> -static struct meson_ee_pwrc_mem_domain axg_pwrc_mem_audio[] = {
> +static const struct meson_ee_pwrc_mem_domain axg_pwrc_mem_audio[] = {
>         { HHI_MEM_PD_REG0, GENMASK(5, 4) },
>  };
>
> -static struct meson_ee_pwrc_mem_domain sm1_pwrc_mem_audio[] = {
> +static const struct meson_ee_pwrc_mem_domain sm1_pwrc_mem_audio[] = {
>         { HHI_MEM_PD_REG0, GENMASK(5, 4) },
>         { HHI_AUDIO_MEM_PD_REG0, GENMASK(1, 0) },
>         { HHI_AUDIO_MEM_PD_REG0, GENMASK(3, 2) },
> @@ -235,12 +235,12 @@ static struct meson_ee_pwrc_mem_domain sm1_pwrc_mem_audio[] = {
>         { HHI_AUDIO_MEM_PD_REG0, GENMASK(27, 26) },
>  };
>
> -static struct meson_ee_pwrc_mem_domain g12a_pwrc_mem_nna[] = {
> +static const struct meson_ee_pwrc_mem_domain g12a_pwrc_mem_nna[] = {
>         { G12A_HHI_NANOQ_MEM_PD_REG0, GENMASK(31, 0) },
>         { G12A_HHI_NANOQ_MEM_PD_REG1, GENMASK(31, 0) },
>  };
>
> -static struct meson_ee_pwrc_mem_domain g12a_pwrc_mem_isp[] = {
> +static const struct meson_ee_pwrc_mem_domain g12a_pwrc_mem_isp[] = {
>         { G12A_HHI_ISP_MEM_PD_REG0, GENMASK(31, 0) },
>         { G12A_HHI_ISP_MEM_PD_REG1, GENMASK(31, 0) },
>  };
> @@ -270,14 +270,14 @@ static struct meson_ee_pwrc_mem_domain g12a_pwrc_mem_isp[] = {
>
>  static bool pwrc_ee_is_powered_off(struct meson_ee_pwrc_domain *pwrc_domain);
>
> -static struct meson_ee_pwrc_domain_desc axg_pwrc_domains[] = {
> +static const struct meson_ee_pwrc_domain_desc axg_pwrc_domains[] = {
>         [PWRC_AXG_VPU_ID]  = VPU_PD("VPU", &gx_pwrc_vpu, axg_pwrc_mem_vpu,
>                                      pwrc_ee_is_powered_off, 5, 2),
>         [PWRC_AXG_ETHERNET_MEM_ID] = MEM_PD("ETH", meson_pwrc_mem_eth),
>         [PWRC_AXG_AUDIO_ID] = MEM_PD("AUDIO", axg_pwrc_mem_audio),
>  };
>
> -static struct meson_ee_pwrc_domain_desc g12a_pwrc_domains[] = {
> +static const struct meson_ee_pwrc_domain_desc g12a_pwrc_domains[] = {
>         [PWRC_G12A_VPU_ID]  = VPU_PD("VPU", &gx_pwrc_vpu, g12a_pwrc_mem_vpu,
>                                      pwrc_ee_is_powered_off, 11, 2),
>         [PWRC_G12A_ETH_ID] = MEM_PD("ETH", meson_pwrc_mem_eth),
> @@ -287,13 +287,13 @@ static struct meson_ee_pwrc_domain_desc g12a_pwrc_domains[] = {
>                                     pwrc_ee_is_powered_off),
>  };
>
> -static struct meson_ee_pwrc_domain_desc gxbb_pwrc_domains[] = {
> +static const struct meson_ee_pwrc_domain_desc gxbb_pwrc_domains[] = {
>         [PWRC_GXBB_VPU_ID]  = VPU_PD("VPU", &gx_pwrc_vpu, gxbb_pwrc_mem_vpu,
>                                      pwrc_ee_is_powered_off, 12, 2),
>         [PWRC_GXBB_ETHERNET_MEM_ID] = MEM_PD("ETH", meson_pwrc_mem_eth),
>  };
>
> -static struct meson_ee_pwrc_domain_desc meson8_pwrc_domains[] = {
> +static const struct meson_ee_pwrc_domain_desc meson8_pwrc_domains[] = {
>         [PWRC_MESON8_VPU_ID]  = VPU_PD("VPU", &meson8_pwrc_vpu,
>                                        meson8_pwrc_mem_vpu,
>                                        pwrc_ee_is_powered_off, 0, 1),
> @@ -303,7 +303,7 @@ static struct meson_ee_pwrc_domain_desc meson8_pwrc_domains[] = {
>                                                 meson8_pwrc_audio_dsp_mem),
>  };
>
> -static struct meson_ee_pwrc_domain_desc meson8b_pwrc_domains[] = {
> +static const struct meson_ee_pwrc_domain_desc meson8b_pwrc_domains[] = {
>         [PWRC_MESON8_VPU_ID]  = VPU_PD("VPU", &meson8_pwrc_vpu,
>                                        meson8_pwrc_mem_vpu,
>                                        pwrc_ee_is_powered_off, 11, 1),
> @@ -313,7 +313,7 @@ static struct meson_ee_pwrc_domain_desc meson8b_pwrc_domains[] = {
>                                                 meson8_pwrc_audio_dsp_mem),
>  };
>
> -static struct meson_ee_pwrc_domain_desc sm1_pwrc_domains[] = {
> +static const struct meson_ee_pwrc_domain_desc sm1_pwrc_domains[] = {
>         [PWRC_SM1_VPU_ID]  = VPU_PD("VPU", &sm1_pwrc_vpu, sm1_pwrc_mem_vpu,
>                                     pwrc_ee_is_powered_off, 11, 2),
>         [PWRC_SM1_NNA_ID]  = TOP_PD("NNA", &sm1_pwrc_nna, sm1_pwrc_mem_nna,
> @@ -576,32 +576,32 @@ static void meson_ee_pwrc_shutdown(struct platform_device *pdev)
>         }
>  }
>
> -static struct meson_ee_pwrc_domain_data meson_ee_g12a_pwrc_data = {
> +static const struct meson_ee_pwrc_domain_data meson_ee_g12a_pwrc_data = {
>         .count = ARRAY_SIZE(g12a_pwrc_domains),
>         .domains = g12a_pwrc_domains,
>  };
>
> -static struct meson_ee_pwrc_domain_data meson_ee_axg_pwrc_data = {
> +static const struct meson_ee_pwrc_domain_data meson_ee_axg_pwrc_data = {
>         .count = ARRAY_SIZE(axg_pwrc_domains),
>         .domains = axg_pwrc_domains,
>  };
>
> -static struct meson_ee_pwrc_domain_data meson_ee_gxbb_pwrc_data = {
> +static const struct meson_ee_pwrc_domain_data meson_ee_gxbb_pwrc_data = {
>         .count = ARRAY_SIZE(gxbb_pwrc_domains),
>         .domains = gxbb_pwrc_domains,
>  };
>
> -static struct meson_ee_pwrc_domain_data meson_ee_m8_pwrc_data = {
> +static const struct meson_ee_pwrc_domain_data meson_ee_m8_pwrc_data = {
>         .count = ARRAY_SIZE(meson8_pwrc_domains),
>         .domains = meson8_pwrc_domains,
>  };
>
> -static struct meson_ee_pwrc_domain_data meson_ee_m8b_pwrc_data = {
> +static const struct meson_ee_pwrc_domain_data meson_ee_m8b_pwrc_data = {
>         .count = ARRAY_SIZE(meson8b_pwrc_domains),
>         .domains = meson8b_pwrc_domains,
>  };
>
> -static struct meson_ee_pwrc_domain_data meson_ee_sm1_pwrc_data = {
> +static const struct meson_ee_pwrc_domain_data meson_ee_sm1_pwrc_data = {
>         .count = ARRAY_SIZE(sm1_pwrc_domains),
>         .domains = sm1_pwrc_domains,
>  };
> --
> 2.49.0
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
