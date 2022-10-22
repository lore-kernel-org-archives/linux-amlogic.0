Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D92BFC433FE
	for <linux-amlogic@archiver.kernel.org>; Sat, 22 Oct 2022 11:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pU2Bum76+sRoH3bZE3IuYtOMhNeenyppHFrL9J852z0=; b=I6G8EA9qeDX+9f
	IWitUm4ed0pPYk/jkZF+hyIGjWU3anutbE+m6zRVAcF77BlSvjpJ/oPQWTPaI+9KU239BENVZPb3W
	OjSMiBCAoELemqmFHy4dswkKj2k8iks4mi1mQjKhtWlbncb/PjBseEZezHKaIe2cl8odgaSgaeIoK
	XsHfLK55BNfDAL0S15XUpiAEfVFDvrelT9XAkospTi3Fu2xKWYKwITB64x85d1gLB8xZDOx4excKz
	Fx79BJdAiFEB4cYkXNukYHtWVnGbnglCfRyCZKI9mMGOOpgILcBKC15R5ib1W150uXK9qxy3m68Oy
	HChRVA3f8iIBUJ8rxlow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omD3j-00CT7a-OC; Sat, 22 Oct 2022 11:52:59 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omD3Y-00CT3s-Jx; Sat, 22 Oct 2022 11:52:49 +0000
Received: by mail-ed1-x52a.google.com with SMTP id q19so14973991edd.10;
        Sat, 22 Oct 2022 04:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jrvz3xnxmWMFBldQvzy2ZgmI4h77t/gPKZnFb0toqjg=;
        b=IkNUMBBK3F7G2PHSg4UUbh50Ru31YT5iLaRe+eXiX/kgyEVFRWM+EOsx8fOhmmHZYB
         mpbIbh4q3vvwnGYurdPN4A+6370j/lx2BQ8nIWwsFsKx7Y9z3Heey5CL1lY0jPs9BmQs
         phlDwix2DMjgdaGZx7K06usQjnaAJXxond0AzlVST6lU+BhY3YDU08cxFgsQ/dUXc2c7
         LdYPI7IFyVT/b62MgoKyx+X6xWA8M1MoAde1RLXhSz1IYm4Xjv5RErUgw3uEISZC4QYx
         hjKz433tB6OeY3mXTLp49KN3S9Tg+E2Z2NqOFJVPn3sVHkt0h8isq2wF9OnV5ADNL+8a
         l+Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jrvz3xnxmWMFBldQvzy2ZgmI4h77t/gPKZnFb0toqjg=;
        b=Wd0srDuOuyuiIiHZ0Q+kZm3lOnAUStXbVkoft1HGhtJ4j3cKdFUfLAlGBbNIcFeFCV
         J5zTNY09HL1NOnWMgA39p8mpyYpFTWrjT/C6Sf945GYDiz8/OBUyntFR0aH3DS8pXyKV
         bktuJ4BldfiGqvSxlPRnv7DOvlvEr/Z+/QUqSZc0lE5ifBXqmBAqWBQi+98GRl+KoGEJ
         mjYJFEU1f+8WxophRyAo0yN1w7odOmQIhwY32g+us57c9x7cQbkT6nLOxLPDjBd/U8nh
         xVIV9HfDx4alMNWcxDHzda8OtFSuyQuRdhwratCOQ849f1zmJCCFdzbE8w2eVSBsJV+t
         AmeA==
X-Gm-Message-State: ACrzQf3u+MSTeQg2WkVugpQ/5Rxvk9S4W5v0/8tMJWwf9wg3h7yN5EV2
	4f8QElOMrKwdhdYg52WUXm4QVvidNVf8cCp8yyY=
X-Google-Smtp-Source: AMsMyM6muR/RwsipWgBLxIPXio2nN5ILA/phMy0wSCb+hRGOvh2zvm54UfTCsw2MojaPvDmu/D2VNn3FDSPF1kaXgew=
X-Received: by 2002:a17:907:7f92:b0:78d:ed9c:d86f with SMTP id
 qk18-20020a1709077f9200b0078ded9cd86fmr19695128ejc.251.1666439563373; Sat, 22
 Oct 2022 04:52:43 -0700 (PDT)
MIME-Version: 1.0
References: <20221022084737.1028-1-linux.amoon@gmail.com> <CAFBinCBu_-0m9JeAr5kd-v7Z5LTi7w0WmmUYybW_kL4KJXXpOQ@mail.gmail.com>
 <CANAwSgRzdD0FWg+z6hTFs7KvpsD64bChX-k0dPXJfACXZH2zbQ@mail.gmail.com>
In-Reply-To: <CANAwSgRzdD0FWg+z6hTFs7KvpsD64bChX-k0dPXJfACXZH2zbQ@mail.gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 22 Oct 2022 13:52:32 +0200
Message-ID: <CAFBinCCNJiL-ZKRYesQAwys6bBMpYHJbUDK-Zi_VhGDVSvF7uQ@mail.gmail.com>
Subject: Re: [PATCHv3] arm64: dts: meson: Enable active coling using gpio-fan
 on Odroid N2/N2+
To: Anand Moon <linux.amoon@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Dan Johansen <strit@manjaro.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221022_045248_696204_FCDEBEEB 
X-CRM114-Status: GOOD (  17.16  )
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

Hi Anand,

On Sat, Oct 22, 2022 at 1:27 PM Anand Moon <linux.amoon@gmail.com> wrote:
[...]
> > > @@ -1982,7 +1982,6 @@ pwm_ao_d_10_pins: pwm-ao-d-10 {
> > >                                                 mux {
> > >                                                         groups = "pwm_ao_d_10";
> > >                                                         function = "pwm_ao_d";
> > > -                                                       bias-disable;
> > &pwm_ao_d_10_pins is not referenced anywhere so it seems that this
> > change has no impact on controlling the fan on Odroid-N2(+).
> > How did you test this change?
> >
> Ok I felt these changes affect the behavior of the pinctrl
>
>   * @PIN_CONFIG_BIAS_DISABLE: disable any pin bias on the pin, a
>  *  transition from say pull-up to pull-down implies that you disable
>  *  pull-up in the process, this setting disables all biasing.
>
> I mapped this is linked in pinctrl driver, pwm_ao_d_10_pins GPIOAO_10 see below
Yes, I understand this part.
My concern is: &pwm_ao_d_10_pins settings only become active when this
node is actively referenced. You can even see it in your output
below...

[...]
> pin 10 (GPIOAO_10): (MUX UNCLAIMED) aobus-banks:1958
This shows that it's used as a GPIO. If the &pwm_ao_d_10_pins setting
was used then it would show "function pwm_ao_d group pwm_ao_d_10"
(similar to what GPIOE_1 shows in your output)

If you want to know if a pull-up/down is enabled you can look at the output of:
$ cat /sys/kernel/debug/pinctrl/ff800000.sys-ctrl\:pinctrl@14-pinctrl-meson/pinconf-pins
(I'm sure this can also be retrieved from some userspace tools, but I
don't know how)


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
