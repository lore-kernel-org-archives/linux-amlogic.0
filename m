Return-Path: <SRS0=97z3=VA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A60D4C0650E
	for <linux-amlogic@archiver.kernel.org>; Wed,  3 Jul 2019 14:17:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B25821881
	for <linux-amlogic@archiver.kernel.org>; Wed,  3 Jul 2019 14:17:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MFlWgSfx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Q0TBA8sK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B25821881
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nHAdf4ephf35maqCwc5jq3zto/J7q6tKoAzne7+Ce6o=; b=MFlWgSfxifpvYq
	M/RBVABz+/MnJVmeHK5pQiuYSn83x47E/yZH3oHFFl0QX2tSo3s7GnP26Vjxt4SEDMM17DtMMXEd3
	UcqNaX5KNYBWwDwGKNzKVATpELYyHtgWECNrP+UkpY3zs/F/qscHdygwM4sx7+J4Ir7R65yi5qhC0
	00MoguFaCWnMiXGmIhJMNGzquWtzEPwEa2g3FthV5mjBtG0H/gs5gH01Hb3Tzp76HsP4j6eTuJDek
	hfiItnjQ2KpnVeeWxRuNdJMh2o6pnk6I+0Di7KwoqUHw9wDpbmPv0yJYA+Es0eNEeweyjG1vSawQe
	GkJmeEneR0cLtYDsTxWA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hig4T-0005J2-6f; Wed, 03 Jul 2019 14:17:17 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hig4P-0005HO-M6
 for linux-amlogic@lists.infradead.org; Wed, 03 Jul 2019 14:17:15 +0000
Received: by mail-wm1-x341.google.com with SMTP id s15so2599280wmj.3
 for <linux-amlogic@lists.infradead.org>; Wed, 03 Jul 2019 07:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=ks0bNwYapiN81vVxECStRbRSKzS0XfjKhzZiJiwEzwY=;
 b=Q0TBA8sKjhi4NK59C7tFimG/AiuJj8NjmNS77iU+k2Qmfdlh5Dc/rYAbcd/fDqSnHD
 /tbji06th9Xzvmi6KQ0uXit+8krhr5CAYIpig2H0xEGI/LCLsktoZD3PYI6Rn/QrD1qM
 vbLjZExZoQKayF3xaOkXoR9FF0/sx79SNWx9MGV3qQwP/4bgQ9YKmScXh2ZUf9m/vYCp
 huQ4lLrwpG3T5OrkuEDapgp3jUknzjOiRfKo+KCjpTWTDed2O9fYTFZEDa5/fZz+rHzD
 xRLlKBOUC1tD63wpfzRqC4OVCVX6I3q7Q37ZfKRvMIJ+fzmou0ZnLyEUXul4j+0JhFgW
 xtQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=ks0bNwYapiN81vVxECStRbRSKzS0XfjKhzZiJiwEzwY=;
 b=ReQ8rrUQYAwdHUFsmEAd14f446ls2gSXrL8jpspTseOs+A9/hvZSSK8C82G+oRLckr
 /4CjHWypWAgrHiCtof9G8V3QThzyGH2MGlvQCI7md+hLChJOpWlWdQV9Lwrnr7MXlyNR
 NdXs4bXmQBS2DIGvu2Ynr0nqG6TiUAa7irzWnnwBXM+UO2h4XaBhTeyIcL1kuYhzsugM
 /I9jp+IrV6oRAXv6CqGzeNcivR76YTWluqw7pNMrkOLLZFOmeZUCD53BmppR+uEAFQUc
 qBdWadLS7ZWD1fRJc+V1+YSolW3BD0TooBNRjWRlUO51/m2KEqGi3kcN2d13qxkZGSLU
 exOg==
X-Gm-Message-State: APjAAAVrT22Hv+bqR2707wZ4CL/JKWlz1TQlHed740ypBtaeHjp2zmg7
 rLUsq2xR+FCrIYvSI43wDvAmjA==
X-Google-Smtp-Source: APXvYqxmeARZ+dzcLmNlaBGXg9WvX8W+EC2+HrDQkCGX+smg1Bl3ozbQengqGYQ1JBWeO/R5WhX85A==
X-Received: by 2002:a05:600c:21d4:: with SMTP id
 x20mr7439597wmj.61.1562163431645; 
 Wed, 03 Jul 2019 07:17:11 -0700 (PDT)
Received: from localhost (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id x83sm2813879wmb.42.2019.07.03.07.17.10
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 03 Jul 2019 07:17:11 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, khilman@baylibre.com
Subject: Re: [RFC/RFT v3 04/14] clk: meson: eeclk: add setup callback
In-Reply-To: <20190701091258.3870-5-narmstrong@baylibre.com>
References: <20190701091258.3870-1-narmstrong@baylibre.com>
 <20190701091258.3870-5-narmstrong@baylibre.com>
Date: Wed, 03 Jul 2019 16:17:10 +0200
Message-ID: <1jh8836w49.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190703_071713_745806_D6690658 
X-CRM114-Status: GOOD (  14.16  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 martin.blumenstingl@googlemail.com, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon 01 Jul 2019 at 11:12, Neil Armstrong <narmstrong@baylibre.com> wrote:

> Add a setup() callback in the eeclk structure, to call an optional
> call() function at end of eeclk probe to setup clocks.
>
> It's used for the G12A clock controller to setup the CPU clock
> notifiers.

I'd prefer if you implement the probe function in the related controller
have this probe function call meson_eeclkc_probe() for the common part

In your case, I suppose it means implementing the g12a controller probe
to deal with the notifiers

>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  drivers/clk/meson/meson-eeclk.c | 6 ++++++
>  drivers/clk/meson/meson-eeclk.h | 1 +
>  2 files changed, 7 insertions(+)
>
> diff --git a/drivers/clk/meson/meson-eeclk.c b/drivers/clk/meson/meson-eeclk.c
> index 6ba2094be257..81fd2abcd173 100644
> --- a/drivers/clk/meson/meson-eeclk.c
> +++ b/drivers/clk/meson/meson-eeclk.c
> @@ -61,6 +61,12 @@ int meson_eeclkc_probe(struct platform_device *pdev)
>  		}
>  	}
>  
> +	if (data->setup) {
> +		ret = data->setup(pdev);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
>  					   data->hw_onecell_data);
>  }
> diff --git a/drivers/clk/meson/meson-eeclk.h b/drivers/clk/meson/meson-eeclk.h
> index 9ab5d6fa7ccb..7fdf424f71a6 100644
> --- a/drivers/clk/meson/meson-eeclk.h
> +++ b/drivers/clk/meson/meson-eeclk.h
> @@ -20,6 +20,7 @@ struct meson_eeclkc_data {
>  	const struct reg_sequence	*init_regs;
>  	unsigned int			init_count;
>  	struct clk_hw_onecell_data	*hw_onecell_data;
> +	int				(*setup)(struct platform_device *pdev);
>  };
>  
>  int meson_eeclkc_probe(struct platform_device *pdev);
> -- 
> 2.21.0

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
