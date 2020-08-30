Return-Path: <SRS0=MBsY=CI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1957C433E2
	for <linux-amlogic@archiver.kernel.org>; Sun, 30 Aug 2020 14:04:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 69105206FA
	for <linux-amlogic@archiver.kernel.org>; Sun, 30 Aug 2020 14:04:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tHhjnSFd";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="p0ZYmxxO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 69105206FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zqwrooe6CrIsMWEZGq4gHFUpcYBTvrSfcOqkuXm9bz0=; b=tHhjnSFdOgc2fAXploTY47bqy
	ZbB1yyvzEi31Kv8XQgqDtc6fLpOgP7mGc5AC8AIbXkPBcS+DZTO72yHKF+e4dW8K4G5PIGCCqSCFs
	lnRI/L4lJsKMjZi3rjRAqFHEnLcm7z1aWYwDghLIst5Hzo2VqPXTxTVvpWsYJEYH37fxRnHfDPls1
	fJr8hGKTYFpEmsvJsis5LFpNuRz/QrA/BvwZjEamDp8gRey9akzaSD3Wy1J17YSl+77luKNPh1sjd
	IHImG1Z2SIKDbHQpXAxQhbQjqCD9RkScQA5RJXv521XkKcrfDdt3H0XWs4+9WUWHP89DHukUmaTXt
	VI/eGGdTQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kCNwo-0001Mm-Jm; Sun, 30 Aug 2020 14:04:42 +0000
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kCNwi-0001La-Hq; Sun, 30 Aug 2020 14:04:37 +0000
Received: by mail-ej1-x643.google.com with SMTP id d11so5034270ejt.13;
 Sun, 30 Aug 2020 07:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=izMbgQfEUi4HL4B+upohBntCKcFRXHLkyQlubMj8LG8=;
 b=p0ZYmxxOJHsfHd9Q2GDtq6MQ7xqTDKUo/vPf5POGGiXKf090Udjkk15rpHRabtP6++
 SyDvkw+xi0u8sHt+pP9fuDNUDejViWNLt8LLh7A3uEAsVCi/2Z12pbZzJJs6zrQsLQol
 vgis1TpqDt1mwgk6QPohinqqssokoCNxabicXMB3GfuiRZSuYQFnShP8Bk3OQ4DwN+id
 gk5Io3bxBV3+Wlf/M9A1mAqhj/vFVtE329K+GxyLYFiyKLuy3Q1NG0QlwtBgirMZcTNR
 PIY8j92twehblQgyCbQGSfkmNbQl6s3vDhIGA+6FVljK3G6JjMrDIgLBV1tohakSjuaX
 n+XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=izMbgQfEUi4HL4B+upohBntCKcFRXHLkyQlubMj8LG8=;
 b=UdENSQsDZTIgmAKUlGc6gL5DONvUw20ECSmrlR6kV8ReMmGtr4J4Dh5XJ2v2vJ6E87
 4mCuf8866Pah3oVleKvvIzJEV2kpAzNGOA92KkUg8EoJc8CnPTU6H+sqH682sZeeQR2a
 qfCXrjUYaBRMJ09KUmPiwUDy5SSRnUoLqIF1ZBUejxYAcjL7BgcbUMEVO6ZIM9ad36TS
 cuAAXjXXUh4mN0o86Sfhon35IV+l4TjzLHQm3GwiP8eIKRn4YF1754A0l9y9EB/dfJr6
 3KE/TIxLec73hQ8r+OEEdru2wbajFpAGtjMiqvHrA8eCYziUr3GgPwqTTmwqjtZq928Y
 5WVA==
X-Gm-Message-State: AOAM532kA4B5qvwODLVZDNLSE5UOm+775GPqKsELmBJyZU7MYm8oWmzn
 2dGqdIRXVYBB4sjJpozAOwfVl0cqJl3IgRpdjzc=
X-Google-Smtp-Source: ABdhPJz60cc6Eu/ea3CES5e/4h0O82BakquR4RA7pyDNYs8Pbcdv+oMR4aU2gv5UAPivxnq+qHhEkX0DNO7qNfP7l4M=
X-Received: by 2002:a17:907:7094:: with SMTP id
 yj20mr7631941ejb.471.1598796275391; 
 Sun, 30 Aug 2020 07:04:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200820121323.564-1-linux.amoon@gmail.com>
 <20200820121323.564-2-linux.amoon@gmail.com>
 <7hlfi9xgch.fsf@baylibre.com>
 <CANAwSgTZ23jFPAO46vRg1Dx_Bzi=4Bg6KHE0ozLQGky4p_fgKQ@mail.gmail.com>
 <CANAwSgQLnqDnuQvLv4cvaeTPeBW=H_g5F2aaNue_hb4nKLdovg@mail.gmail.com>
 <f7e6ce5f-02b0-065b-ffcf-2826159f926a@baylibre.com>
 <1j7dto3ylq.fsf@starbuckisacylon.baylibre.com>
 <CANAwSgQ1Miu73hfdK+cgL3howpekn2xj_5qwGasQZwtQpSGj5Q@mail.gmail.com>
 <1j4koq4x38.fsf@starbuckisacylon.baylibre.com>
 <CANAwSgTWnHXRFRUrbdCph+eBxL2PNXe6Q4aTXxEU32i7dGS=dw@mail.gmail.com>
 <CANAwSgQV7_4VdGRMgJDMjPFvOS3Nabkqbf2ucE5vqo6zrhxPDw@mail.gmail.com>
 <CAFBinCCEJJT_kfJ4qfTEz0R7Mo3ciCGDSw_MJYi_5PyNJA6x5w@mail.gmail.com>
 <CANAwSgRV8y3Cc72CtppfJMPFKDSfpddzAKLeBGExn8G4OBVJ6g@mail.gmail.com>
In-Reply-To: <CANAwSgRV8y3Cc72CtppfJMPFKDSfpddzAKLeBGExn8G4OBVJ6g@mail.gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 30 Aug 2020 16:04:24 +0200
Message-ID: <CAFBinCCpM=ea=zzormJ_m5RcsMtE6hUkq5-UkYpNpXK8fbXdAQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] arm64: dts: meson-g12b-odroid-n2: Enable RTC
 controller node
To: Anand Moon <linux.amoon@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200830_100436_640220_10545FA1 
X-CRM114-Status: GOOD (  15.65  )
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
Cc: devicetree <devicetree@vger.kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Christian Hewitt <christianshewitt@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Anand,

On Sun, Aug 30, 2020 at 3:12 PM Anand Moon <linux.amoon@gmail.com> wrote:
[...]
> +       /* Make sure the rtc irq pin is properly configured as input */
> +       rtc_irq_pins: rtc-pin-irq {
> +               mux {
> +                       groups = "GPIOAO_7";
> +                       function = "gpio_periphs";
check meson_g12a_aobus_functions in drivers/pinctrl/meson/pinctrl-meson-g12a.c
GPIOAO_7 doesn't support "gpio_periphs", instead I think it should be
"gpio_aobus"

I'm surprised that you don't seem to be getting errors from the pin
controller driver about this.
On the other hand you have not attached the full kernel log, so maybe
it's in there but hidden somewhere

> +                       bias-disable;
shouldn't there be output-disable or input-enable here?

> +               };
> +       };
> +
>         hdmi-connector {
>                 compatible = "hdmi-connector";
>                 type = "a";
> @@ -481,7 +490,8 @@ hdmi_tx_tmds_out: endpoint {
>
>  &i2c3 {
>         pinctrl-0 = <&i2c3_sda_a_pins>, <&i2c3_sck_a_pins>;
> -       pinctrl-names = "default";
> +       pinctrl-1 = <&rtc_irq_pins>;
> +       pinctrl-names = "default", "gpio_periphs";
I am not expecting this to work because it means that the I2C driver
would have to manage the "gpio_periphs" pin state (but there's no
pinctrl_* call in drivers/i2c/busses/i2c-meson.c)
instead I would try:
&i2c3 {
  pinctrl-0 = <&i2c3_sda_a_pins>, <&i2c3_sck_a_pins>, <&rtc_irq_pins>;
  pinctrl-names = "default";

  ...
};

or even:
rtc0: rtc@51 {
  pinctrl-0 = <&rtc_irq_pins>;
  pinctrl-names = "default";

  ...
};


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
