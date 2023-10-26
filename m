Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 148C6C25B67
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Oct 2023 14:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4YaW94rosu4yxTWCiYoOV437o4/czAm2KrbHRLVMwuc=; b=c3sqAo7vHvT0Y1
	DpsiFN+jpuEeeBDqIlNn1gT0Zp3i7RnSWeoGzjtGtmQhTFLpao6qsgjHaKEpYO7u6Hw9q6QsrE2zO
	bJVWIRMxsBf6KhYJ4jTL4EfbnyQ+TLdv5LIXmx92+/zTo7WkyAYZyEFqdUxXKdlLpklisYMYQTQAo
	xWaSAjb2oirVBeOsdlTyPARwh1R1kLaxnCXSt2S36iJUtYITc2cQ/HEwuf9AFnJnyD3T5qzfd8wa4
	LghLd5bY5BerbRsUfyPhNPfHG1d9Vk/0SBeThmNe1n33Qym4Cbq0tyoO7N0kVEe5VgeVk4pLJzBok
	RM2x8/c2thdFkIeXJF3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qw1Tt-00EiFX-1l;
	Thu, 26 Oct 2023 14:37:05 +0000
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qw1Tr-00EiE7-2O
	for linux-amlogic@lists.infradead.org;
	Thu, 26 Oct 2023 14:37:05 +0000
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-1e10ba12fd3so620700fac.1
        for <linux-amlogic@lists.infradead.org>; Thu, 26 Oct 2023 07:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698331020; x=1698935820; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0qleFEJdG0zueinUIrhZg05/V5NAw4EtMg/L1WU73us=;
        b=zX0nlNp1SSveu5Nwvh0qT9jF9wHfMJ2wO0+yYwqd7TZizXO44TF/4RWZzOOKwyVZCc
         EhV9Qyypd1SuPfb8Bw1DxpTuDxFDFrvkr/yX2KIzYvxOfJUMmzS53Jy01GjhjDzjQjpU
         sVrMKPEWLuRN8iqFVU219GgW3e5AJBtx/WMrLtcaDGUVvO7fd9W0SkUeUV6JYFJQ83Tu
         Dsi1k5p7CGo+vwIgr10wSnwn0l0vXntpODa0CDsL4ma/FGkaDow/pVY0BsemsShdHURk
         iw7IWf2KjowJY8ArQr0fcYVuXi62n/qcCmASJSxyRACchHsAEXMhY2fq+HhuQ84gUSGc
         yQCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698331020; x=1698935820;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0qleFEJdG0zueinUIrhZg05/V5NAw4EtMg/L1WU73us=;
        b=qXqwkEFpWUoKQ/DGrsVVqshLyhvpRpFUbuWKIX/BSHLQv0HsN/c9tH5NTuEhKllcnr
         4pbTqof15yQIBq0zPCVGbi8ZdKt0ldVIF8tVCIjMRDDGXxa8SmtU14wGPGjrhpCQGGF5
         XcnLx8eHHgHcbv6jHbt1w4dqw7UuW7y6SDPJ+Osk9gopggxduxQNN+ozWy9vnASSWmte
         ffUW0a4x0WlefHF4wQJLHUG+yTwiDeODsVTgrjno1icY7N3LaOkT3dVn6Qx7GPVblwoI
         8DDnolkpLrW9OvzEK+mSBpP/ggqofjAT3+k10igK8KlUsNseoNfCa5gPugCT4mbyeblQ
         GalA==
X-Gm-Message-State: AOJu0YyMbWLNxh2RA/hwsMD8jFCpg0AI7leoYGl286QM0l2sM+sNvaIx
	mwK5SRZGraRJesmNDPP8upMTwR54wzoTd6Bc+WFXgw==
X-Google-Smtp-Source: AGHT+IFzO5fLLLCSGUIZrhR1xwkvkiqrpeK/PDBIT4lzxm4y31BDe65GR+q2L7o3FGE3xTEAsLhmmntURr0yQsFbULI=
X-Received: by 2002:a05:6870:c49:b0:1ea:385:518b with SMTP id
 lf9-20020a0568700c4900b001ea0385518bmr21485497oab.3.1698331020473; Thu, 26
 Oct 2023 07:37:00 -0700 (PDT)
MIME-Version: 1.0
References: <20231016080205.41982-1-tomeu@tomeuvizoso.net> <20231016080205.41982-2-tomeu@tomeuvizoso.net>
In-Reply-To: <20231016080205.41982-2-tomeu@tomeuvizoso.net>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 26 Oct 2023 16:36:24 +0200
Message-ID: <CAPDyKFqEP50MBE0_t5tAfsrdx8EOy5MGQWqfX0a_8FA-3cJe8A@mail.gmail.com>
Subject: Re: [PATCH 2/2] pmdomain: amlogic: Fix mask for the second NNA mem PD domain
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: linux-kernel@vger.kernel.org, Da Xue <da@libre.computer>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-pm@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231026_073703_779104_FC19C616 
X-CRM114-Status: GOOD (  16.11  )
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

On Mon, 16 Oct 2023 at 10:02, Tomeu Vizoso <tomeu@tomeuvizoso.net> wrote:
>
> Without this change, the NPU hangs when the 8th NN core is used.
>
> It matches what the out-of-tree driver does.
>
> Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>

The change looks good to me, but I have been awaiting an ack from some
of the platform/soc maintainers before applying.

That said, it looks like we need a fixes/stable tag too. Is there a
certain commit this fixes?

Kind regards
Uffe

> ---
>  drivers/pmdomain/amlogic/meson-ee-pwrc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pmdomain/amlogic/meson-ee-pwrc.c b/drivers/pmdomain/amlogic/meson-ee-pwrc.c
> index cfb796d40d9d..0dd71cd814c5 100644
> --- a/drivers/pmdomain/amlogic/meson-ee-pwrc.c
> +++ b/drivers/pmdomain/amlogic/meson-ee-pwrc.c
> @@ -228,7 +228,7 @@ static struct meson_ee_pwrc_mem_domain sm1_pwrc_mem_audio[] = {
>
>  static struct meson_ee_pwrc_mem_domain g12a_pwrc_mem_nna[] = {
>         { G12A_HHI_NANOQ_MEM_PD_REG0, GENMASK(31, 0) },
> -       { G12A_HHI_NANOQ_MEM_PD_REG1, GENMASK(23, 0) },
> +       { G12A_HHI_NANOQ_MEM_PD_REG1, GENMASK(31, 0) },
>  };
>
>  #define VPU_PD(__name, __top_pd, __mem, __is_pwr_off, __resets, __clks)        \
> --
> 2.41.0
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
