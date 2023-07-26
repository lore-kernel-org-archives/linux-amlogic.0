Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58818C001DE
	for <linux-amlogic@archiver.kernel.org>; Wed, 26 Jul 2023 22:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kg1lZjERnjWoaG4hGVzT9JJnHAGFr2YA8mxdqz3z/JE=; b=2OwZsAymbAjfg5
	q19wYTJYB9oYAqonC9haC9EXzoaOOF91VyonnHmLEG6QVB3sdUiZqksvxJlKCISQCKKBD+O9rSpLH
	elsQAMtXe08vd+JUqVLyHjR9DTkPKC0yMG7n8/UFdECSh2h2tsIYSAQx6pwT7X67axlLDED/ZVIQ4
	LG0q/qlik/TTNNeRAvIYCrrQ6G9hhT/uOJGBPngDgzq+PdN1IuvkUN5kgrO4pjE0Medpzn0+3VoN+
	oH8eJteR7SUozg/nrZGDOR7LpZQnbgvgO2kqrdY/0WBk/VwmFPN6C8+yz+u5hq8eoQ2FhitUeoAyI
	uI7T0YqnIWEUQ8z/X+Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOnBF-00Bezm-04;
	Wed, 26 Jul 2023 22:40:29 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOnBB-00Beyu-0k
	for linux-amlogic@lists.infradead.org;
	Wed, 26 Jul 2023 22:40:27 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-686efb9ee3cso321887b3a.3
        for <linux-amlogic@lists.infradead.org>; Wed, 26 Jul 2023 15:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1690411224; x=1691016024;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=9caknxSMLJ8/I6yMwEAauRGM8KCY4LpGz9gaodd75Y4=;
        b=z9E4wYAl7Kbyd0MpW30QeQz71g8gC1KvQPuBLAlk4L7sx45+1e+yocHJ9W5oLLhO36
         FN3OSyDOAdoEOLn/6d4XHlejXbW0vSu1JFhGFBkeGHsvEAaP5K6+ELq7sLl6WQEkXIEU
         gpisYolH4vdNjHhmeUFwoGGH1GQQ+eaADPEpMiPf431fMk2khFcowQDrDoOHjEcIBkp9
         OaOrMnDy3//QThWP9jmzlrnkDA7Y7GAg4pDQ4aLZgy7vgw02IPrqYHwn1to1/dLhMjTi
         jfhodLf3dzMfCZ215I4dDfuhux2j7dpO5N/kAZQESLod08LD49TTNJCLNJ0clsEy/0Bl
         k2Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690411224; x=1691016024;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9caknxSMLJ8/I6yMwEAauRGM8KCY4LpGz9gaodd75Y4=;
        b=CnmqXMztrfKB+IEZmB8qXwQAuSy8KAWzi3plB0kkCSQVXFKzrYljdZ2jXLhopqtwoq
         oyOXDPSRwQV+sSvZjfvvU+BlRFKvDcFEqAfeoWxM4SAnAJaaXuYYySzKLwDd/VT3IjzB
         gnAcYN9eMOV0OqUlqHH6VBapNw3nR71Oi0faxVll57fEkCK7C09jFGityicILqV53ral
         bYLuAk7pscOl4eiISzc7CaUn4CXtury9oKScuP/7SZJsghgmxXnqZS20U7/MOvBta6m4
         37TD8/X8BiWsVzz3dDZax2v/46VH3Y9S/OODgQ7VTeHVHgswxzYxc29H7PmQyKdy8HSJ
         a7Fg==
X-Gm-Message-State: ABy/qLYQYq/IRbuj+0gjC3e/R8tepie1k8lyRDEUTpH+HpaiepilHLNk
	2zlEyBDFYvVER2IXW7oDdWf6qw==
X-Google-Smtp-Source: APBJJlELtzA6yQFjcOkGA+IAseqrN3tDU/89TVRlDOYX3rh6eyHu5Q+Cam0M5MOKnrjt0RfM4YUbDQ==
X-Received: by 2002:a17:90b:885:b0:268:4142:2ee1 with SMTP id bj5-20020a17090b088500b0026841422ee1mr3073258pjb.11.1690411224265;
        Wed, 26 Jul 2023 15:40:24 -0700 (PDT)
Received: from localhost ([75.172.135.98])
        by smtp.gmail.com with ESMTPSA id ep11-20020a17090ae64b00b00262eccfa29fsm1673297pjb.33.2023.07.26.15.40.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 15:40:23 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Xianwei Zhao
 <xianwei.zhao@amlogic.com>
Subject: Re: [PATCH V2 3/4] soc: c3: Add support for power domains controller
In-Reply-To: <20230707003710.2667989-4-xianwei.zhao@amlogic.com>
References: <20230707003710.2667989-1-xianwei.zhao@amlogic.com>
 <20230707003710.2667989-4-xianwei.zhao@amlogic.com>
Date: Wed, 26 Jul 2023 15:40:23 -0700
Message-ID: <7ha5vii9ew.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_154025_292753_0293E35D 
X-CRM114-Status: GOOD (  15.56  )
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

Xianwei Zhao <xianwei.zhao@amlogic.com> writes:

> Add support for C3 Power controller. C3 power control
> registers are in secure domain, and should be accessed by SMC.
>
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
> V1 -> V2: Fixed some formatting.
> ---
>  drivers/soc/amlogic/meson-secure-pwrc.c | 26 +++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>
> diff --git a/drivers/soc/amlogic/meson-secure-pwrc.c b/drivers/soc/amlogic/meson-secure-pwrc.c
> index c11d65a3e3d9..a1ffebf70de3 100644
> --- a/drivers/soc/amlogic/meson-secure-pwrc.c
> +++ b/drivers/soc/amlogic/meson-secure-pwrc.c
> @@ -11,6 +11,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/pm_domain.h>
>  #include <dt-bindings/power/meson-a1-power.h>
> +#include <dt-bindings/power/amlogic,c3-pwrc.h>
>  #include <dt-bindings/power/meson-s4-power.h>
>  #include <linux/arm-smccc.h>
>  #include <linux/firmware/meson/meson_sm.h>
> @@ -120,6 +121,22 @@ static struct meson_secure_pwrc_domain_desc a1_pwrc_domains[] = {
>  	SEC_PD(RSA,	0),
>  };
>  
> +static struct meson_secure_pwrc_domain_desc c3_pwrc_domains[] = {
> +	SEC_PD(C3_NNA,	0),
> +	SEC_PD(C3_AUDIO,	GENPD_FLAG_ALWAYS_ON),
> +	SEC_PD(C3_SDIOA,	GENPD_FLAG_ALWAYS_ON),
> +	SEC_PD(C3_EMMC,	GENPD_FLAG_ALWAYS_ON),
> +	SEC_PD(C3_USB_COMB, GENPD_FLAG_ALWAYS_ON),
> +	SEC_PD(C3_SDCARD,	GENPD_FLAG_ALWAYS_ON),
> +	SEC_PD(C3_ETH,	GENPD_FLAG_ALWAYS_ON),
> +	SEC_PD(C3_GE2D,	GENPD_FLAG_ALWAYS_ON),
> +	SEC_PD(C3_CVE,	GENPD_FLAG_ALWAYS_ON),
> +	SEC_PD(C3_GDC_WRAP,	GENPD_FLAG_ALWAYS_ON),
> +	SEC_PD(C3_ISP_TOP,		GENPD_FLAG_ALWAYS_ON),
> +	SEC_PD(C3_MIPI_ISP_WRAP, GENPD_FLAG_ALWAYS_ON),
> +	SEC_PD(C3_VCODEC,	0),
> +};

All of these domains being hard-coded to ALWAYS_ON looks suspicious, and
can also be an indicator that the drivers for these domains are not
(properly) using runtime PM, or not connected to the correct domains the DT.

Similar to the tables for s4 and a1 in this same file, please describe
the reason that each of these domains needs to be hard coded to be
always on.

Thanks,

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
