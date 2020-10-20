Return-Path: <SRS0=scox=D3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13003C4363A
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Oct 2020 19:56:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3355021D7F
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Oct 2020 19:56:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cNxlqq8r";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="KQyqjQPq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3355021D7F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YDwVR1jVznH1BAQK/q1n3HisU+sRXSxgJENguuPIjOQ=; b=cNxlqq8rIDmaYwKyJs2EvGT78
	LHvln9cLF2rZX+VrxxBvc2pP1BE1FzadYwsPormnIw3r4RJEyNAbqqDWUQw7OxuwH4V1dJelt7Ssr
	oYpoIKovQUAwyxmrq3CaMdns3yG7srHviBUosVUaJN3qQ83TFUrjo8J0T/1hCo0vFzc7L6smmy/eY
	NSkt3D7J5oocfjSM+NcQdW2VcEQuO383eif0TmpxwEt2UvpWp76/BlWmzH3mI/35eDKXGWzbd5XLo
	0r9N3fgi178kFeIIOHYv9eYk1h8dij3ao+Lwvh3IweO08v38N1RRH9oqfC06JyrrOuNUh5GqRHdJu
	CsrnQiSVw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUxk7-0003tG-M5; Tue, 20 Oct 2020 19:56:23 +0000
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUxk5-0003st-EL; Tue, 20 Oct 2020 19:56:22 +0000
Received: by mail-ej1-x643.google.com with SMTP id h24so4537624ejg.9;
 Tue, 20 Oct 2020 12:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZPCD2L2GGGtokYRrJEQ8WyJT2DBdP9CGo3+6vgLzGxY=;
 b=KQyqjQPqAvwaitGu++IcBJtUo6rS+opE05+6q7Pouzhj7gwDvoDeYiEGSzhJWWazD+
 bpRlL7VVuqBBUMk3oXteJSog8TtzU6jwc4SL9i7P9Sw7gFLA2D+i5s6tKYqCFo1Nm+rv
 tFKoYiiXBSo9G+62PVmGDwmk4srn8HTu/1DRzJ8tYxX+A5aBZRciFsEd+V1uylfuYbSV
 UoS8sr3sl8L+2ppNkVMnzPRINoqpVV/+bHlKb3bfjtoHHXjQMn1CN55cP+R68Zbnpail
 8TDuSSz/VCS69t6rbq42l7p2ZX1/Zq8LhkJN5G9hVe305yp5rorpIdmKUJytsBXQSWQb
 sNBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZPCD2L2GGGtokYRrJEQ8WyJT2DBdP9CGo3+6vgLzGxY=;
 b=NWYlPHgr+SR/ojMYEZVaNPNn5brK6BxeJpX1HwG05uimfBgNa0zUz6r3b1ExzSkv+d
 kGX03HD6/gqXObIfTvUy7SQEnJbrRjYWsjx9gnGHM6Sme8bjxn1ai2MxmBFAwo1JmcYo
 IZOi8FarCuT3zi6a1FvVD26ZBf4xO2COV1UPm9l62uCQW2R4g0EtcVakBqfFe1fJ4Wv1
 QNjii5l0/JX8N7jFs6LM6k6s9wf2PkrQW/D7QwqTv1ouVExdR0mT8Y1RGo/WPOeTBUQm
 5xRWLqjCacSUyws1LNNIry5D3Uu7tEQWD4RAJfunZyR9c3gJZb/fuaPVDzw6c/f0spvC
 UhTA==
X-Gm-Message-State: AOAM53238ESjRYzY0SVmXQLLl/59v8PYdd+pkHTh/S4nQfWMJKo1E59w
 fCOgPSbFL8iVjwkBoHE+hQTOCdw8/kOlRYyHDSkgMS2M
X-Google-Smtp-Source: ABdhPJyF2xTdN/vXwzw15t+8+pT7j1fVl/iUQ62ICrAFMCc5Ct3a3EhBQ6sLOWE1AkabvkfJE0fZw1SlBF2seeqH4jA=
X-Received: by 2002:a17:906:fcae:: with SMTP id
 qw14mr5042241ejb.537.1603223780296; 
 Tue, 20 Oct 2020 12:56:20 -0700 (PDT)
MIME-Version: 1.0
References: <20201019230914.26300-1-khilman@baylibre.com>
In-Reply-To: <20201019230914.26300-1-khilman@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 20 Oct 2020 21:56:09 +0200
Message-ID: <CAFBinCAXVFjm-aDJ3KFvqcn2Hht2tGOy_O99wggo530xv6McpQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl/meson: enable building as modules
To: Kevin Hilman <khilman@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201020_155621_769745_75AC87BF 
X-CRM114-Status: GOOD (  16.83  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Kevin,

On Tue, Oct 20, 2020 at 1:09 AM Kevin Hilman <khilman@baylibre.com> wrote:
[...]
> The default is still built-in, this only adds the option of building
> as module.
(as of today) the majority of the SoC specific pin controller drivers
use bool instead of tristate
my understanding is that tristate can be "dangerous" because if you
compile a driver as module then your kernel may not boot (I haven't
tried, but in that case the reset controller driver probably has to be
added to the initramfs).
is there something that we need to do about this? my thoughts: these
options default to "y" so it shouldn't be a problem unless someone
tinkers with their kernel configuration

[...]
> diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
> index 20683cd072bb..b467ab49539a 100644
> --- a/drivers/pinctrl/meson/pinctrl-meson.c
> +++ b/drivers/pinctrl/meson/pinctrl-meson.c
> @@ -152,6 +152,7 @@ int meson_pmx_get_funcs_count(struct pinctrl_dev *pcdev)
>
>         return pc->data->num_funcs;
>  }
> +EXPORT_SYMBOL_GPL(meson_pmx_get_funcs_count);
>
>  const char *meson_pmx_get_func_name(struct pinctrl_dev *pcdev,
>                                     unsigned selector)
> @@ -160,6 +161,7 @@ const char *meson_pmx_get_func_name(struct pinctrl_dev *pcdev,
>
>         return pc->data->funcs[selector].name;
>  }
> +EXPORT_SYMBOL_GPL(meson_pmx_get_func_name);
>
>  int meson_pmx_get_groups(struct pinctrl_dev *pcdev, unsigned selector,
>                          const char * const **groups,
> @@ -172,6 +174,7 @@ int meson_pmx_get_groups(struct pinctrl_dev *pcdev, unsigned selector,
>
>         return 0;
>  }
> +EXPORT_SYMBOL_GPL(meson_pmx_get_groups);
>
>  static int meson_pinconf_set_gpio_bit(struct meson_pinctrl *pc,
>                                       unsigned int pin,
> @@ -723,6 +726,7 @@ int meson8_aobus_parse_dt_extra(struct meson_pinctrl *pc)
>
>         return 0;
>  }
> +EXPORT_SYMBOL_GPL(meson8_aobus_parse_dt_extra);
>
>  int meson_a1_parse_dt_extra(struct meson_pinctrl *pc)
>  {
> @@ -732,6 +736,7 @@ int meson_a1_parse_dt_extra(struct meson_pinctrl *pc)
>
>         return 0;
>  }
> +EXPORT_SYMBOL_GPL(meson_a1_parse_dt_extra);
>
>  int meson_pinctrl_probe(struct platform_device *pdev)
>  {
> @@ -766,3 +771,7 @@ int meson_pinctrl_probe(struct platform_device *pdev)
>
>         return meson_gpiolib_register(pc);
>  }
> +EXPORT_SYMBOL_GPL(meson_pinctrl_probe);
> +
> +MODULE_LICENSE("GPL v2");
> +
please remove this blank line at EOF because there is already one in
the existing file (with this one there's now two of them)


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
