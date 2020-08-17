Return-Path: <SRS0=3lRj=B3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E5F9C433E4
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Aug 2020 19:36:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05FA32072E
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Aug 2020 19:36:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qXkDdfen";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="HGpqSDw3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 05FA32072E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IecKhkaab+eFM3Mt1qUlMqIh+kJwsrltFkhp8a7VEpM=; b=qXkDdfend2xCm4Jwn1ilcyY44
	Czjx6jKnI72STEZCUZntnOSBnOvJx7nLnUcKJR7ULy+bOY1ZOthQN3Grto1E8wa48AA8kdUTfOMsL
	gEKC9VoNqDHMlPFR3OB/xR1cF4NewAuEE9teIxcHveMvILumWohqinc5rFFM179j/UNo8uvIgC4b2
	M6m3+VU7R/NNXU3JJzTTz1OfiZ18cghBhwK0RrKyN3GkUomDkiyzMjLLZvJrRXOdrDYL0RgmduGA9
	2md7XLGDlwal92VqTADQPerjfbhsfP49aS2ge+U5ytT1oQg9ON94cH1wi65F8CgDQrKWy++snNF8r
	tuyqABi9A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k7kvQ-0000Az-I9; Mon, 17 Aug 2020 19:36:08 +0000
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7kvK-00009r-5E; Mon, 17 Aug 2020 19:36:02 +0000
Received: by mail-ej1-x644.google.com with SMTP id f24so19213172ejx.6;
 Mon, 17 Aug 2020 12:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VwFw5hgUmgRtXhrUbQX2TB/ljF4qHz9d6xiixFTiMJw=;
 b=HGpqSDw3fP6ZBWEE+ohC8/MRyRcWLSXgCc70YwJNS0CpNnz2GpL3DFcmbnaYoEvOyj
 W42olQhdk1YTsaeuOP74p9ElmBvSOEhCL/fYqkqiAtEkJOEk9cIJThg7cKitD0nMDXeA
 fYI92dRFyrOoLciA5IBfIeYblE9VwJg8/+s2eaOFRa7Qi+oumXELb/33P/Pidw7jmD8+
 /Ba9iTlQyEQasdL09wMhZsNNrOQkgG2zKR21DlTb+s7NDoaAIyRhiBllGjtTymZhvsLi
 IZPyvHuM8N5OpEUnZsmg5M+ZSCVzdFwBYI2d+nKpUf5Er16KfVCgMev6gPb4CaLcsga4
 znpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VwFw5hgUmgRtXhrUbQX2TB/ljF4qHz9d6xiixFTiMJw=;
 b=QwFmHoN8wYX6fqgOuRFJBMIuTWzJH2cXEBePyZD8eYdM2eeg+5lYAmHopmDLq3bQE4
 ha/QgDzudodIi5Yh/qi0j6Nws0OV2DFlH3Uyb4jvFasRZnmK1kKViVl63Psg70WXhbir
 WN/l8ui9lQSA/ItsiqH4x+DB/aBC5rWNb4K2FjucSjnN+Kf6hEthhDyhIbcVS9YwZsfI
 Ez49dRO96WkM0rAAVc6hMWK868fKHP+fZlSdaEP0UMC3/K3aqk46vlFWe7JeMwa8w4Hc
 wPsVOlPlrOzReNs+MYDRQnVYeGKYHmbWF2liRawfZtSNBBAQuYq9GY9gy9kO3BuMqOyQ
 Gxag==
X-Gm-Message-State: AOAM533fkS9aRnRPI7jexr2iEGhG0/KC84U+vJXHSjpbCvtMpMx3Pdc0
 o830QYnimlg155hocWRSCS8enVMI3mZmbqpGnjY=
X-Google-Smtp-Source: ABdhPJzBLq7BTUZu0gPhyPZr1iMVSNYxpytQ0oWV4Nv6K4s8WcQqs0XwbGPW54bVfRpJFoiUF59hC2YERdceZBH+2xs=
X-Received: by 2002:a17:906:cc47:: with SMTP id
 mm7mr15799313ejb.362.1597692960285; 
 Mon, 17 Aug 2020 12:36:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200817102122.434-1-linux.amoon@gmail.com>
 <20200817102122.434-2-linux.amoon@gmail.com>
In-Reply-To: <20200817102122.434-2-linux.amoon@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 17 Aug 2020 21:35:49 +0200
Message-ID: <CAFBinCCYgm83Vs+dq6G4+1wv7T=S0mzt=gtLaHDfgBrCeRkk5A@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] arm64: dts: meson-g12b-odroid-n2: Enable RTC
 controller node
To: Anand Moon <linux.amoon@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200817_153602_258342_084EAD81 
X-CRM114-Status: GOOD (  15.68  )
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Christian Hewitt <christianshewitt@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Anand,

thank you for updating this patch!

On Mon, Aug 17, 2020 at 12:21 PM Anand Moon <linux.amoon@gmail.com> wrote:
[...]
> changes v2
> --Fix the missing INT (GPIOA.BIT7) pinctrl.
should I also expect an interrupt property somewhere below?

> --Fix the missing rtcwakeup.
> --Drop the clock not required clock property by the PCF8563 driver.
> ---
>  .../arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
> index 34fffa6d859d..f08ae1b337ad 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
> @@ -477,6 +477,19 @@ hdmi_tx_tmds_out: endpoint {
>         };
>  };
>
> +&i2c3 {
> +       pinctrl-0 = <&i2c3_sda_a_pins>, <&i2c3_sck_a_pins>;
> +       pinctrl-1 = <&tdm_c_din3_a_pins>;
> +       pinctrl-names = "default";
why is there pinctrl-1 without any corresponding "pinctrl-names" entry?
also I'm surprised to see a TDM (audio) related pin function as part
of an I2C controller. if this is correct then I'd appreciate a bit
information (for example as part of the patch description) why that is


Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
