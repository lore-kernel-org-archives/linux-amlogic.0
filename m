Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9475DFA373E
	for <linux-amlogic@archiver.kernel.org>; Tue, 25 Oct 2022 18:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wAgcHLu0OikY7eFGHDIu73SNh0L9/N7C4TrYPqlzO3Q=; b=TVSq0YQ9Z7q4k5
	eYTAK1y7syBbmWuvS/gn0imGr0lX/52056pJ5+YtQFQUEKwHJEjEtcucW+DTLm0ZZgaikjJfdEItp
	0YEAImxMlF/8nvawQo3zwaPgyWyxKAnB65DU/cl85iXBYk7pmVewAT5Cztw0OJmlS/rbkfkFbSDP/
	sYdh2BLeyoodeF4P0S25JUWKvnqa7jo8GNoUXqj2fYhz4UXr6CRgk51BZ1AX7VfkFlFLxFrYp7xlY
	/jdH0/IXfN/2VZfrmnPcnB1SDyo3OBg0xR/3tt60hUBnFX3sYJN96dxdrgI5LANUjiHKwYerN+Wxn
	oIFD56jtEA+OhbhSzQ9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onOK2-006ZTn-Jh; Tue, 25 Oct 2022 18:06:42 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onOJr-006ZSR-Hv; Tue, 25 Oct 2022 18:06:33 +0000
Received: by mail-ej1-x636.google.com with SMTP id f27so4159436eje.1;
        Tue, 25 Oct 2022 11:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5vE3MZf2Ly6I21HYX2Enssb0FvxhWUpQUt/rjYLZA2c=;
        b=AIoycIk6UAxZOhKS4FkwFGdRh7jyHE0kEWC2WMRQaL1p/6dGWAxFrMa9ffs5MRa/bH
         7GAaU3+9jvLiHfNpkmPfiLX/idkC/AlesrGXrnqIKxyGIpXKUkf/mAZyQnw21GYaGym+
         I/OrK7p7hf7RnzTmqSZkBqpy0onqhqd3qrFVINLUSMIOlfunsb2fenm9FTi4aVTgJ+PL
         /a2uMVEl+/Y1r6wMwmQnDOe51BKKG3pu68z2F9BgiXi6GfCVZvI8AD4fG9D3bbVswqLx
         vcwqKxqmgfJwRHwaekhxJAbgsxni9RDM5CHOKwwXoHq6NerLI35xDNb8s5nTUN36kn6M
         sisw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5vE3MZf2Ly6I21HYX2Enssb0FvxhWUpQUt/rjYLZA2c=;
        b=WRLngUFOuPI5pRSmzbPcM03w9XQSAjcCTzfQ4IYOZ2TPNre7C7P/H60D511JGbU3Ty
         hltKHHxWFaAN/VSsUJX+x3I/9kweLmwEO+6UzemS/HzmjBzNkOd6Ad2EahIXHnJxVHIm
         kX+M95OeE87A9lC5DIGvf1AAmBC7dsbErJnI0aVJu6oyQZh5bVH7DA5tcCdi04eWmlpx
         jIi7nS2Y2pWIJ42fI65c4NV+aT+aOwXozpJgjj1gZ0g1rEikDLcr8nH/yzaKunJD9yWL
         tAFsK1+1BpJ0hAv72IEzMBPfsF+PSViynkodlk1QjKr73FrClpp101Ep/7tuMT4gXK5C
         FAjA==
X-Gm-Message-State: ACrzQf2q173bmT6quMfbMkmsSpBhFlaVTcg5EFUBJqtuakKKIzI7l6t3
	UYYrNnuXYoB+14NLXMWjNakjpEHdOWGrWbMMjmA=
X-Google-Smtp-Source: AMsMyM6POggN5PNl2ALYtzdpl/lqeMzGcPPZij8P5gVQpfSkcBzGMMo2TQ+tMAjHM4dwayRQGSBct5iqZcMbuNshgoc=
X-Received: by 2002:a17:906:8a6c:b0:7a8:2f09:d88d with SMTP id
 hy12-20020a1709068a6c00b007a82f09d88dmr10214197ejc.49.1666721185888; Tue, 25
 Oct 2022 11:06:25 -0700 (PDT)
MIME-Version: 1.0
References: <20221022084737.1028-1-linux.amoon@gmail.com> <CAFBinCBu_-0m9JeAr5kd-v7Z5LTi7w0WmmUYybW_kL4KJXXpOQ@mail.gmail.com>
 <CANAwSgRzdD0FWg+z6hTFs7KvpsD64bChX-k0dPXJfACXZH2zbQ@mail.gmail.com> <CAFBinCCNJiL-ZKRYesQAwys6bBMpYHJbUDK-Zi_VhGDVSvF7uQ@mail.gmail.com>
In-Reply-To: <CAFBinCCNJiL-ZKRYesQAwys6bBMpYHJbUDK-Zi_VhGDVSvF7uQ@mail.gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Tue, 25 Oct 2022 23:36:09 +0530
Message-ID: <CANAwSgTLTCA9=WvWXcR-40baauN3kAk2qx9k4FQOPCa1+_O0Yw@mail.gmail.com>
Subject: Re: [PATCHv3] arm64: dts: meson: Enable active coling using gpio-fan
 on Odroid N2/N2+
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Dan Johansen <strit@manjaro.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221025_110631_630729_6791A482 
X-CRM114-Status: GOOD (  26.16  )
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

Hi Martin,

On Sat, 22 Oct 2022 at 17:22, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> Hi Anand,
>
> On Sat, Oct 22, 2022 at 1:27 PM Anand Moon <linux.amoon@gmail.com> wrote:
> [...]
> > > > @@ -1982,7 +1982,6 @@ pwm_ao_d_10_pins: pwm-ao-d-10 {
> > > >                                                 mux {
> > > >                                                         groups = "pwm_ao_d_10";
> > > >                                                         function = "pwm_ao_d";
> > > > -                                                       bias-disable;
> > > &pwm_ao_d_10_pins is not referenced anywhere so it seems that this
> > > change has no impact on controlling the fan on Odroid-N2(+).
> > > How did you test this change?
> > >
> > Ok I felt these changes affect the behavior of the pinctrl
> >
> >   * @PIN_CONFIG_BIAS_DISABLE: disable any pin bias on the pin, a
> >  *  transition from say pull-up to pull-down implies that you disable
> >  *  pull-up in the process, this setting disables all biasing.
> >
> > I mapped this is linked in pinctrl driver, pwm_ao_d_10_pins GPIOAO_10 see below
> Yes, I understand this part.
> My concern is: &pwm_ao_d_10_pins settings only become active when this
> node is actively referenced. You can even see it in your output
> below...
>
> [...]
> > pin 10 (GPIOAO_10): (MUX UNCLAIMED) aobus-banks:1958
> This shows that it's used as a GPIO. If the &pwm_ao_d_10_pins setting
> was used then it would show "function pwm_ao_d group pwm_ao_d_10"
> (similar to what GPIOE_1 shows in your output)
>
> If you want to know if a pull-up/down is enabled you can look at the output of:
> $ cat /sys/kernel/debug/pinctrl/ff800000.sys-ctrl\:pinctrl@14-pinctrl-meson/pinconf-pins
> (I'm sure this can also be retrieved from some userspace tools, but I
> don't know how)
>

I now switch using pwm-fan with the local changes I am able to link
pwm_ao_d_10_pins
but now the issue is fan keeps on spinning on boot-up and stays on.

I can manually turn on off by using
$ sudo gpioset gpiochip1 10=1   // fan on
$ sudo gpioset gpiochip1 10=0   // fan off

It is not controlled by the thermal tip as expected.
I feel some configuration is missing in pwm-meson driver.
Any input for me?

$ sudo cat /sys/kernel/debug/pinctrl/ff800000.sys-ctrl\:pinctrl@14-pinctrl-meson/pinmux-pins
[sudo] password for alarm:
Pinmux settings per pin
Format: pin (name): mux_owner gpio_owner hog?
pin 0 (GPIOAO_0): ff803000.serial (GPIO UNCLAIMED) function uart_ao_a
group uart_ao_a_tx
pin 1 (GPIOAO_1): ff803000.serial (GPIO UNCLAIMED) function uart_ao_a
group uart_ao_a_rx
pin 2 (GPIOAO_2): (MUX UNCLAIMED) aobus-banks:1950
pin 3 (GPIOAO_3): (MUX UNCLAIMED) (GPIO UNCLAIMED)
pin 4 (GPIOAO_4): (MUX UNCLAIMED) (GPIO UNCLAIMED)
pin 5 (GPIOAO_5): ff808000.ir (GPIO UNCLAIMED) function
remote_ao_input group remote_ao_input
pin 6 (GPIOAO_6): (MUX UNCLAIMED) (GPIO UNCLAIMED)
pin 7 (GPIOAO_7): (MUX UNCLAIMED) (GPIO UNCLAIMED)
pin 8 (GPIOAO_8): (MUX UNCLAIMED) aobus-banks:1956
pin 9 (GPIOAO_9): (MUX UNCLAIMED) aobus-banks:1957
pin 10 (GPIOAO_10): ff807000.pwm (GPIO UNCLAIMED) function pwm_ao_d
group pwm_ao_d_10
pin 11 (GPIOAO_11): (MUX UNCLAIMED) aobus-banks:1959
pin 12 (GPIOE_0): (MUX UNCLAIMED) (GPIO UNCLAIMED)
pin 13 (GPIOE_1): ff802000.pwm (GPIO UNCLAIMED) function pwm_ao_d
group pwm_ao_d_e
pin 14 (GPIOE_2): ffd1b000.pwm (GPIO UNCLAIMED) function pwm_a_e group pwm_a_e

$ sudo cat /sys/kernel/debug/pwm
platform/ffd1b000.pwm, 2 PWM devices
 pwm-0   (regulator-vddcpu-a  ): requested enabled period: 1250 ns
duty: 838 ns polarity: normal
 pwm-1   ((null)              ): period: 0 ns duty: 0 ns polarity: normal

platform/ff807000.pwm, 2 PWM devices
 pwm-0   (pwm-fan             ): requested period: 1250 ns duty: 0 ns
polarity: normal
 pwm-1   ((null)              ): period: 0 ns duty: 0 ns polarity: normal

platform/ff802000.pwm, 2 PWM devices
 pwm-0   ((null)              ): period: 0 ns duty: 0 ns polarity: normal
 pwm-1   (regulator-vddcpu-b  ): requested enabled period: 1250 ns
duty: 1213 ns polarity: normal

I could observe a change in duty when we have stress testing the CPU.

Thanks

-Anand

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
