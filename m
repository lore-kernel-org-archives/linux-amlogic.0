Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECEFEC433EF
	for <linux-amlogic@archiver.kernel.org>; Sat, 15 Jan 2022 15:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bfhL1pFuiMxccd1NKhgxJuzRGhWSC/zPAMo6gBIGSb0=; b=0tMMcwVRn0lISi
	SjFxVYQxtLmyy4DDRJwjHg21VUAUG7fK4m+qlifgO7I3kcyZ9Z2MTxz8oOZ7e1gdHpJ/lg81Rv9q+
	rOJqI/bEANgXYBznTMaP/Lf/6FrPLoLYnQK6byjT4mSbOhn0vp1wIc00q7GDsH9louM6VeYW5I5Io
	MehXei50AkK+kcaSAHpQsoOmxZefY4nC2ZXjQkVJ8JcyfrCSLWjYiZIfaVKOjYUvQcmKvDbk3L7/K
	9JUIo6zKxTN7/AkHUmXu3smI+lQs/+6h2Cf2WhXxk3+hw2gAq9SUhl6hAxHzx2pSYxLeZbY8syAFH
	d+vcMoyiiWbz7P4LiHaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8klT-00BCsu-8Y; Sat, 15 Jan 2022 15:14:47 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8klP-00BCsX-BL
 for linux-amlogic@lists.infradead.org; Sat, 15 Jan 2022 15:14:45 +0000
Received: by mail-wm1-x32e.google.com with SMTP id
 q9-20020a7bce89000000b00349e697f2fbso12882504wmj.0
 for <linux-amlogic@lists.infradead.org>; Sat, 15 Jan 2022 07:14:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version;
 bh=oQapXi5PzBJKM1NBMeogDPHhLlUsvU7UBCouDsr/qX8=;
 b=G7cEzfisDpAO7oFb8xC67I8Gq9+zwh8GiJ7Vjtqv2rhTMTFIgc+yBLlJUUrnXTwAPv
 42gCLrd/sk8pnu1OOsIw6g/zdZEStGXVKTu3bZfVehmvzIO+/T5tr+TaNvWOJ0hA2X/Z
 Oj9OXIRLHeB99zPmt7S12oR5FqYIqVVuo7s8zQyuTyIdK2n2Rc3Z4x6AOHMt6zTR3sDB
 b9yvkAyNcGdbyuC8dtUwF1nnWDhllCBFy3WO/pTqboNE8MjEpd8kZmOC9WvvUCa7amMF
 27RhAtjVNkxsub6IRyf8jRR17kLPBZnMC/v4leQOwljPnKdS4ba9Jiy20MI3TZEgGS0t
 f5Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version;
 bh=oQapXi5PzBJKM1NBMeogDPHhLlUsvU7UBCouDsr/qX8=;
 b=VVvxskrWEa7/tXsAzUlbZy7A/2Z6i80hCrSOFev2MelO3u+crvbRGtLTWyCaoOchkU
 5lvGgdoUCJAjd24rxK1hVc0mO7stIWuF0PjuWeR7DgMGtgX2WNhputJZTdmf7rqwwjQN
 ZR1OyN30+tIwqo9yyZiPuSDDrvUkvlmmtv6/S1kDNDKJmlimjeHDyppT3nVQApWpNBSm
 UtdtT7SoXEmyTPwEJr2gACwTVSxVqOBElPb28B6oXRuzJA6OJF8oYfXILesRj92tzDu3
 3pv55WO6e1yPdJYnqIhToMywtdVg4VkSiawkPdVS81/hwxzP9+dsRES1T78g7VW2/ZxE
 mU6Q==
X-Gm-Message-State: AOAM533I7rm3JdBdhDzfVUstgUUTQIVnxQ6VseC2ofbFHZLdO4HQAcqC
 e2w2/VkOiv+U8IWf0+svpgYVvQ==
X-Google-Smtp-Source: ABdhPJxFc+TOdI3rmNguFA4s0R71joTvnMOnY/0pm/AtD6QgdjftDSnqTPsn8CVxGMaIAb5Ogx0gIA==
X-Received: by 2002:a05:6000:1545:: with SMTP id
 5mr10639823wry.552.1642259681085; 
 Sat, 15 Jan 2022 07:14:41 -0800 (PST)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
 by smtp.gmail.com with ESMTPSA id p2sm2148600wrs.36.2022.01.15.07.14.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Jan 2022 07:14:40 -0800 (PST)
References: <20220115093557.30498-1-alexander.stein@mailbox.org>
User-agent: mu4e 1.6.10; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Alexander Stein <alexander.stein@mailbox.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, Kevin
 Hilman <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 1/2] arm64: dts: meson-axg: add missing reset-names
 property
Date: Sat, 15 Jan 2022 16:04:10 +0100
In-reply-to: <20220115093557.30498-1-alexander.stein@mailbox.org>
Message-ID: <1jilulav4u.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220115_071443_483947_A856AE3D 
X-CRM114-Status: GOOD (  14.35  )
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


On Sat 15 Jan 2022 at 10:35, Alexander Stein <alexander.stein@mailbox.org> wrote:

> Bindings amlogic,axg-fifo.txt mandates that reset-names is a required
> property. Add it.

Binginds *mandates* ?? the bindings you are adding mandates that, not the
previous doc, nor the driver.

Modifying drivers and DT to accomodate made-up bindings requirement is
disturbing.

The bindings should not require that because the driver does not, as it
stands. The driver requires the arb reset to be provided, not the name.
Please fix the bindings.

>
> Signed-off-by: Alexander Stein <alexander.stein@mailbox.org>
> ---
> This is essentially a preparation for YAML conversion to fix the
> warnings.
>
>  arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
> index 3f5254eeb47b..b14175e2f1d6 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
> @@ -1333,6 +1333,7 @@ toddr_a: audio-controller@100 {
>  				interrupts = <GIC_SPI 84 IRQ_TYPE_EDGE_RISING>;
>  				clocks = <&clkc_audio AUD_CLKID_TODDR_A>;
>  				resets = <&arb AXG_ARB_TODDR_A>;
> +				reset-names = "arb";
>  				amlogic,fifo-depth = <512>;
>  				status = "disabled";
>  			};
> @@ -1345,6 +1346,7 @@ toddr_b: audio-controller@140 {
>  				interrupts = <GIC_SPI 85 IRQ_TYPE_EDGE_RISING>;
>  				clocks = <&clkc_audio AUD_CLKID_TODDR_B>;
>  				resets = <&arb AXG_ARB_TODDR_B>;
> +				reset-names = "arb";
>  				amlogic,fifo-depth = <256>;
>  				status = "disabled";
>  			};
> @@ -1357,6 +1359,7 @@ toddr_c: audio-controller@180 {
>  				interrupts = <GIC_SPI 86 IRQ_TYPE_EDGE_RISING>;
>  				clocks = <&clkc_audio AUD_CLKID_TODDR_C>;
>  				resets = <&arb AXG_ARB_TODDR_C>;
> +				reset-names = "arb";
>  				amlogic,fifo-depth = <256>;
>  				status = "disabled";
>  			};
> @@ -1369,6 +1372,7 @@ frddr_a: audio-controller@1c0 {
>  				interrupts = <GIC_SPI 88 IRQ_TYPE_EDGE_RISING>;
>  				clocks = <&clkc_audio AUD_CLKID_FRDDR_A>;
>  				resets = <&arb AXG_ARB_FRDDR_A>;
> +				reset-names = "arb";
>  				amlogic,fifo-depth = <512>;
>  				status = "disabled";
>  			};
> @@ -1381,6 +1385,7 @@ frddr_b: audio-controller@200 {
>  				interrupts = <GIC_SPI 89 IRQ_TYPE_EDGE_RISING>;
>  				clocks = <&clkc_audio AUD_CLKID_FRDDR_B>;
>  				resets = <&arb AXG_ARB_FRDDR_B>;
> +				reset-names = "arb";
>  				amlogic,fifo-depth = <256>;
>  				status = "disabled";
>  			};
> @@ -1393,6 +1398,7 @@ frddr_c: audio-controller@240 {
>  				interrupts = <GIC_SPI 90 IRQ_TYPE_EDGE_RISING>;
>  				clocks = <&clkc_audio AUD_CLKID_FRDDR_C>;
>  				resets = <&arb AXG_ARB_FRDDR_C>;
> +				reset-names = "arb";
>  				amlogic,fifo-depth = <256>;
>  				status = "disabled";
>  			};


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
