Return-Path: <SRS0=svws=A3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 857D3C433E5
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Jul 2020 08:09:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 54BB220657
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Jul 2020 08:09:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ekj+S8oU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="cZ5RxiL/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 54BB220657
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:In-reply-to:Subject:To:
	From:References:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=B3nFC4dhd2TgZq9w7y+Qxigw82DkMuG9oGbUpiGyyAg=; b=Ekj+S8oUDFwMZ7KSwmwc/W5ug
	RaIBoNMC4HVS+IOzZqfn5NQ/3axhvbC/HShMUqVthwQ5BaN7D8U9dCkuInJk1PI89ZZVe9HWHE9QA
	kmG+lUiG5E5y+9bI3auHLwrw6cbr8DB+IVfAmcV5NXqhEZkYKhbOF6RzFZsEDi3LHJKjYqJsK+NyP
	a8OqHaGVDE+AdjCzQqMaUG0lzlGtyfNlv8DKc9C8GdGyUpbGFILQtVD1BuTs+sobKCqSRB0eTSoMu
	yhTsDwuhxnpfH9lZYonTQPAy3V+bnO0zJvsguE9DD+B4tE/jThAQ7DgzjndM4mu7hRwcYoueKvID9
	u/OskVzXg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvywy-00030M-DP; Thu, 16 Jul 2020 08:09:04 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvywv-0002yo-Qy
 for linux-amlogic@lists.infradead.org; Thu, 16 Jul 2020 08:09:02 +0000
Received: by mail-wr1-x441.google.com with SMTP id r12so5952231wrj.13
 for <linux-amlogic@lists.infradead.org>; Thu, 16 Jul 2020 01:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=jhULUF+x2vcXvW/jUomFav+ORqgbARKcOMlyJFwZDX8=;
 b=cZ5RxiL/5ONw1GCcNgBN6c81UUACzDib8nIbXx00FfE+wnQUEVXGZ+VDqTDgwgLezp
 jocMVNFBi9M/eQgGk8MPQqWgaNCfFyTrXmd2eEaSdIqzd6TdjExKhF0Lp8y6Y2iOaft0
 1twosnPUNvSLKHtUkrzrC6Opb9n5c1rO7vrnT5IBqHJI/NHm1Z4H1vmUtGpVYyYn3QG2
 zCy8ZRkxuN0OfHLBMNbB3VRRTca9sEKtPGAkJMITE0DHic2otYjPWYHbAD4yPZRymMjt
 3lGZfl3vWrRxotDMt0FiToUw1i0MaatXChin+XfA4dmyGGS/XPhyVkT4gCRUY312/kqm
 qDyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=jhULUF+x2vcXvW/jUomFav+ORqgbARKcOMlyJFwZDX8=;
 b=TP0JOnHUnIVlz8ii9an0AWkn4iNIoYWPJoRhMf9zR6srckvMHtcA1wSsFQttV3nxyi
 zsRjeCvUFvrjXwQ8DXb03ooE3pqEvHS8E17oHmhH2i7tKM3vpmHugs6qq8NXJfq6C6mD
 oGjRdHzp/kTfZOvjssZnrcVwq6QO+EvIF25NB28JO5Zm89m5vTl7PvixBO8xdoje0CAA
 CaPpqO+L/Ekcjb1Wc4k65dHMnERRFgSNFMZqNuIIDT/mC/z7v9HY3fGBLy4r41igHupR
 63EpPb+OZwdXczwiM6hch7dJfI4bMfNjop0eyKISYqx6wh1O4tJV1duTUnjY1aumpDeC
 Rodw==
X-Gm-Message-State: AOAM531aFIZpfw4PRzDrTL58WrEqQWLsWLU7hYxMs/LZVzdbjUSmrBbF
 bclSdgxyVHf7wbRVYg2YkMUQ/w==
X-Google-Smtp-Source: ABdhPJyHFwArR0lFRh+NQ73ElhRk6hFXaCF8nj8MBazu7YOMsgCsc3bh+VSwR5PfXDHz7D1HxBvJng==
X-Received: by 2002:adf:cc85:: with SMTP id p5mr3765145wrj.273.1594886939056; 
 Thu, 16 Jul 2020 01:08:59 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id g82sm7023292wma.37.2020.07.16.01.08.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jul 2020 01:08:58 -0700 (PDT)
References: <20200715160209.652-1-linux.amoon@gmail.com>
 <20200715160209.652-2-linux.amoon@gmail.com>
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Anand Moon <linux.amoon@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Subject: Re: [PATCHv1 1/3] arm64: dts: meson-g12b-odroid-n2: Enable RTC
 controller node
In-reply-to: <20200715160209.652-2-linux.amoon@gmail.com>
Date: Thu, 16 Jul 2020 10:08:57 +0200
Message-ID: <1j1rlbg9uu.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200716_040902_030607_473770ED 
X-CRM114-Status: GOOD (  13.14  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Kevin Hilman <khilman@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Wed 15 Jul 2020 at 18:02, Anand Moon <linux.amoon@gmail.com> wrote:

> Enable RTC PCF8563 node on Odroid-N2 SBC, In order
> to support the RTC wakealarm feature for suspend and resume.
>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Kevin Hilman <khilman@baylibre.com>
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
> $ sudo hwclock -r && date
> 2020-07-15 13:11:53.862508+00:00
> Wed Jul 15 13:11:54 UTC 2020
>
> $ hwclock --show
> 2020-07-15 13:17:30.903300+00:00
>
> But RTC wake up is not working at my end.
> Any inputs are welcome.
>
> $ time rtcwake -s 30 -m mem
> rtcwake: /dev/rtc0 not enabled for wakeup events
>
> real    0m0.002s
> user    0m0.002s
> sys     0m0.000s
> ---
>  .../boot/dts/amlogic/meson-g12b-odroid-n2.dts      | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
> index 169ea283d4ee..a447cba4dd53 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
> @@ -391,6 +391,20 @@ hdmi_tx_tmds_out: endpoint {
>  	};
>  };
>  
> +&i2c3 {
> +	pinctrl-0 = <&i2c3_sda_a_pins>, <&i2c3_sck_a_pins>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +
> +	rtc: rtc@51 {
> +		reg = <0x51>;
> +		compatible = "nxp,pcf8563";
> +		#clock-cells = <0>;
> +		clock-frequency = <32768>;
> +		clock-output-names = "rtc_clkout";
> +	};

This rtc being on a connector, optional and not fitted by default,
should it really be enabled for all odroid-n2 ?

We tend not do that usually

> +};
> +
>  &ir {
>  	status = "okay";
>  	pinctrl-0 = <&remote_input_ao_pins>;


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
