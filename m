Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A172C433FE
	for <linux-amlogic@archiver.kernel.org>; Wed, 26 Oct 2022 16:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qzt2hoMa3Mw4UlwCTXbruMn/6Ku8oxsN8+puMqGtHgU=; b=eFEl+AdFXsvs0m
	95zgowb3grHbN9dMgpD+vAffms7p7X2rujFX7ttqKC+Pf7hjcYcsr9dfQJ4OmahyKVY1pGUj/8gsM
	nOidSybjAoAvTExcadZp+9h/a90B3tOAvc+hrklMKwbqg6/co+PPrGh6Jmsgg/3sU3j1VvZI8NEGz
	+i/M3LnGpBTUWvCF2/HXas/xhCmDK3MOSrxW5r4B5BzxcnAytwQ0AGrRLU4ahWZg10VqPqH8gu4ik
	67EUwtDpFtq8+yCfmvyvmHdltWoK3WAOTUVSzB3q1IHzMeitzGLJwkzn6qBe41Tybs8du2Af/nwU7
	Gk/Gg+zlZ1HvcQ5lAH9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onisx-00A4p0-TM; Wed, 26 Oct 2022 16:04:07 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onis8-00A4Zp-4S; Wed, 26 Oct 2022 16:03:18 +0000
Received: by mail-ed1-x535.google.com with SMTP id a5so29186096edb.11;
        Wed, 26 Oct 2022 09:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yYLspxKBLe6VOgufkSWikbMUpY/L7ohCSbY/unPCwSU=;
        b=U39hpm+etoqyCUadd+PboIdqMPjpz1pCz1s5CR5l1KR0eRpssb1QbAoo4Pnc6xtU30
         CU0D35x+5ojQ80FW4MZu1QqkJPKvBeocaMo5u6d7Q3vZQYXhQ5+K6fHsLoEFX+//uXGg
         EB4I0SkUg+2G1EcNvnijCHwD0mhhdCRVQPs2gimO6czUcidqFy0hujocpn1subnbF9S8
         90PklyR94o2cylYKbV0/11J3yEdKukafDaKpg2EzADUkXPYQlxL8K4y2NArnD7aay8jn
         DqpZONm+8GlZKIPZ2aJQjyRG+VJqso+fv6l4rdKYzV0sJrPuvldDq8slvgAZshwcxXDF
         SmVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yYLspxKBLe6VOgufkSWikbMUpY/L7ohCSbY/unPCwSU=;
        b=0G3epbb+l3RiNihfg4pTIhhPyydKmXfRmAMjGwFaeWXQD24vyurNSkNfFID+XOIupk
         okDk5fe06gaIo273pTwBDId9sq91++GKmkKmOXF+ACZGHTXHaTTKJjvu7a4Yw+9EuQ6x
         EBOxhZMyOrgOa0o97ug3HEjEq8JDLxZuUnhJVT+IJDx3hrvch6aNLdNEnBc1ztxXcRc/
         lGz4nEO3FNjUkh/7o6h31QCy1p36VY1xVQ5YyoX0g6+zoTJFVHIUUyjIQmwk+88tBFAy
         51RRBHrrAH4NKHDnzjQSnIRB1mfx4GiUq3ZDHn/C2UipcyAAGhvDO7Lj2YOEpPlW4HJc
         ogTQ==
X-Gm-Message-State: ACrzQf3ufWQph3kC5Bz4hmyEWDsfWE9kLb5ujcce28nm5aN7l8wJJBoW
	/Ki4sFGoOaj8glpCGNRK8cNJi6DvRpiFkpUAxnHrJhrEXROhow==
X-Google-Smtp-Source: AMsMyM6IyjfRRhU335+2dHq3/bo4scng930I2w0IbnNfgmeQ25McW+aDtO5PPBeun56aU3c2Fepx8Rs3KU2pQ9ZGm08=
X-Received: by 2002:a05:6402:4029:b0:45b:d50c:b9b0 with SMTP id
 d41-20020a056402402900b0045bd50cb9b0mr41419087eda.126.1666800193309; Wed, 26
 Oct 2022 09:03:13 -0700 (PDT)
MIME-Version: 1.0
References: <20221022084737.1028-1-linux.amoon@gmail.com> <CAFBinCBu_-0m9JeAr5kd-v7Z5LTi7w0WmmUYybW_kL4KJXXpOQ@mail.gmail.com>
 <CANAwSgRzdD0FWg+z6hTFs7KvpsD64bChX-k0dPXJfACXZH2zbQ@mail.gmail.com>
 <CAFBinCCNJiL-ZKRYesQAwys6bBMpYHJbUDK-Zi_VhGDVSvF7uQ@mail.gmail.com>
 <CANAwSgTLTCA9=WvWXcR-40baauN3kAk2qx9k4FQOPCa1+_O0Yw@mail.gmail.com> <5d2ffeca-b41c-20b4-454b-703c39bbb29e@linaro.org>
In-Reply-To: <5d2ffeca-b41c-20b4-454b-703c39bbb29e@linaro.org>
From: Anand Moon <linux.amoon@gmail.com>
Date: Wed, 26 Oct 2022 21:32:56 +0530
Message-ID: <CANAwSgR1CN=Gho6NGMoM1bH92KyeGqoAphmT6NqtnL=+3Zg_jQ@mail.gmail.com>
Subject: Re: [PATCHv3] arm64: dts: meson: Enable active coling using gpio-fan
 on Odroid N2/N2+
To: neil.armstrong@linaro.org
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Dan Johansen <strit@manjaro.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221026_090316_225476_7C3C8BA2 
X-CRM114-Status: GOOD (  41.90  )
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

Hi Neil,

On Wed, 26 Oct 2022 at 13:32, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> Hi,
>
> On 25/10/2022 20:06, Anand Moon wrote:
> > Hi Martin,
> >
> > On Sat, 22 Oct 2022 at 17:22, Martin Blumenstingl
> > <martin.blumenstingl@googlemail.com> wrote:
> >>
> >> Hi Anand,
> >>
> >> On Sat, Oct 22, 2022 at 1:27 PM Anand Moon <linux.amoon@gmail.com> wrote:
> >> [...]
> >>>>> @@ -1982,7 +1982,6 @@ pwm_ao_d_10_pins: pwm-ao-d-10 {
> >>>>>                                                  mux {
> >>>>>                                                          groups = "pwm_ao_d_10";
> >>>>>                                                          function = "pwm_ao_d";
> >>>>> -                                                       bias-disable;
> >>>> &pwm_ao_d_10_pins is not referenced anywhere so it seems that this
> >>>> change has no impact on controlling the fan on Odroid-N2(+).
> >>>> How did you test this change?
> >>>>
> >>> Ok I felt these changes affect the behavior of the pinctrl
> >>>
> >>>    * @PIN_CONFIG_BIAS_DISABLE: disable any pin bias on the pin, a
> >>>   *  transition from say pull-up to pull-down implies that you disable
> >>>   *  pull-up in the process, this setting disables all biasing.
> >>>
> >>> I mapped this is linked in pinctrl driver, pwm_ao_d_10_pins GPIOAO_10 see below
> >> Yes, I understand this part.
> >> My concern is: &pwm_ao_d_10_pins settings only become active when this
> >> node is actively referenced. You can even see it in your output
> >> below...
> >>
> >> [...]
> >>> pin 10 (GPIOAO_10): (MUX UNCLAIMED) aobus-banks:1958
> >> This shows that it's used as a GPIO. If the &pwm_ao_d_10_pins setting
> >> was used then it would show "function pwm_ao_d group pwm_ao_d_10"
> >> (similar to what GPIOE_1 shows in your output)
> >>
> >> If you want to know if a pull-up/down is enabled you can look at the output of:
> >> $ cat /sys/kernel/debug/pinctrl/ff800000.sys-ctrl\:pinctrl@14-pinctrl-meson/pinconf-pins
> >> (I'm sure this can also be retrieved from some userspace tools, but I
> >> don't know how)
> >>
> >
> > I now switch using pwm-fan with the local changes I am able to link
> > pwm_ao_d_10_pins
> > but now the issue is fan keeps on spinning on boot-up and stays on.
> >
> > I can manually turn on off by using
> > $ sudo gpioset gpiochip1 10=1   // fan on
> > $ sudo gpioset gpiochip1 10=0   // fan off
>
> By doing that actually override the PWM function of the pin and set it as a GPIO.

Yes, I just want to test if this pin is working.
>
> >
> > It is not controlled by the thermal tip as expected.
> > I feel some configuration is missing in pwm-meson driver.
> > Any input for me?
> >
> > $ sudo cat /sys/kernel/debug/pinctrl/ff800000.sys-ctrl\:pinctrl@14-pinctrl-meson/pinmux-pins
> > [sudo] password for alarm:
> > Pinmux settings per pin
> > Format: pin (name): mux_owner gpio_owner hog?
> > pin 0 (GPIOAO_0): ff803000.serial (GPIO UNCLAIMED) function uart_ao_a
> > group uart_ao_a_tx
> > pin 1 (GPIOAO_1): ff803000.serial (GPIO UNCLAIMED) function uart_ao_a
> > group uart_ao_a_rx
> > pin 2 (GPIOAO_2): (MUX UNCLAIMED) aobus-banks:1950
> > pin 3 (GPIOAO_3): (MUX UNCLAIMED) (GPIO UNCLAIMED)
> > pin 4 (GPIOAO_4): (MUX UNCLAIMED) (GPIO UNCLAIMED)
> > pin 5 (GPIOAO_5): ff808000.ir (GPIO UNCLAIMED) function
> > remote_ao_input group remote_ao_input
> > pin 6 (GPIOAO_6): (MUX UNCLAIMED) (GPIO UNCLAIMED)
> > pin 7 (GPIOAO_7): (MUX UNCLAIMED) (GPIO UNCLAIMED)
> > pin 8 (GPIOAO_8): (MUX UNCLAIMED) aobus-banks:1956
> > pin 9 (GPIOAO_9): (MUX UNCLAIMED) aobus-banks:1957
> > pin 10 (GPIOAO_10): ff807000.pwm (GPIO UNCLAIMED) function pwm_ao_d
> > group pwm_ao_d_10
> > pin 11 (GPIOAO_11): (MUX UNCLAIMED) aobus-banks:1959
> > pin 12 (GPIOE_0): (MUX UNCLAIMED) (GPIO UNCLAIMED)
> > pin 13 (GPIOE_1): ff802000.pwm (GPIO UNCLAIMED) function pwm_ao_d
> > group pwm_ao_d_e
> > pin 14 (GPIOE_2): ffd1b000.pwm (GPIO UNCLAIMED) function pwm_a_e group pwm_a_e
> >
> > $ sudo cat /sys/kernel/debug/pwm
> > platform/ffd1b000.pwm, 2 PWM devices
> >   pwm-0   (regulator-vddcpu-a  ): requested enabled period: 1250 ns
> > duty: 838 ns polarity: normal
> >   pwm-1   ((null)              ): period: 0 ns duty: 0 ns polarity: normal
> >
> > platform/ff807000.pwm, 2 PWM devices
> >   pwm-0   (pwm-fan             ): requested period: 1250 ns duty: 0 ns
> > polarity: normal
> >   pwm-1   ((null)              ): period: 0 ns duty: 0 ns polarity: normal
>
> This should be on the pwm-1, hence the "pwm_AO_cd" name, "c" and "d" and the
> names of the outputs.
>
> So you need to use 1 as first PWM phandle argument instead of 0.
>
> >
> > platform/ff802000.pwm, 2 PWM devices
> >   pwm-0   ((null)              ): period: 0 ns duty: 0 ns polarity: normal
> >   pwm-1   (regulator-vddcpu-b  ): requested enabled period: 1250 ns
> > duty: 1213 ns polarity: normal
> >
> > I could observe a change in duty when we have stress testing the CPU.
>
> Can you share the complete change you did here ?
>

When I try to use pwm_AO_cd,,
Either one of the PWM binds will fail to get the following error.

 &pwm_AO_cd {
-       pinctrl-0 = <&pwm_ao_d_e_pins>;
+       pinctrl-0 = <&pwm_ao_d_e_pins>, <&pwm_ao_d_10_pins>;
        pinctrl-names = "default";
        clocks = <&xtal>;
        clock-names = "clkin1";

[    3.941700] pwm-regulator regulator-vddcpu-b: error -EBUSY: Failed to get PWM
[    3.943198] pwm-regulator: probe of regulator-vddcpu-b failed with error -16

[    3.956356] pwm-fan pwm-fan: error -EBUSY: Could not get PWM
[    3.956396] pwm-fan: probe of pwm-fan failed with error -16

Below are my changes with  pwm_AO_ab
---------------------------------------------------------------------------------------------
alarm@odroid-n2:~/linux-amlogic-5.y-devel$ git diff
arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
index fd3fa82e4c33..d038ba1e2453 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
@@ -39,6 +39,14 @@ emmc_pwrseq: emmc-pwrseq {
                reset-gpios = <&gpio BOOT_12 GPIO_ACTIVE_LOW>;
        };

+       fan: pwm-fan {
+               compatible = "pwm-fan";
+               pwms = <&pwm_AO_ab 1 1250 0>;
+               fan-supply = <&vcc_5v>;
+               #cooling-cells = <2>;
+               cooling-levels = <0 100 170 230>;
+       };
+
        leds {
                compatible = "gpio-leds";

@@ -410,6 +418,40 @@ &cpu103 {
        clock-latency = <50000>;
 };

+&cpu_thermal {
+       trips {
+               cpu_active: cpu-active {
+                       temperature = <55000>; /* millicelsius */
+                       hysteresis = <2000>; /* millicelsius */
+                       type = "active";
+               };
+       };
+
+       cooling-maps {
+               map {
+                       trip = <&cpu_active>;
+                       cooling-device = <&fan THERMAL_NO_LIMIT
THERMAL_NO_LIMIT>;
+               };
+       };
+};
+
+&ddr_thermal {
+       trips {
+               ddr_active: ddr-active {
+                       temperature = <55000>; /* millicelsius */
+                       hysteresis = <2000>; /* millicelsius */
+                       type = "active";
+               };
+       };
+
+       cooling-maps {
+               map {
+                       trip = <&ddr_active>;
+                       cooling-device = <&fan THERMAL_NO_LIMIT
THERMAL_NO_LIMIT>;
+               };
+       };
+};
+
 &ext_mdio {
        external_phy: ethernet-phy@0 {
                /* Realtek RTL8211F (0x001cc916) */
@@ -547,6 +589,14 @@ &pwm_ab {
        status = "okay";
 };

+&pwm_AO_ab {
+       pinctrl-0 = <&pwm_ao_d_10_pins>;
+       pinctrl-names = "default";
+       clocks = <&xtal>;
+       clock-names = "clkin1";
+       status = "okay";
+};
+
 &pwm_AO_cd {
        pinctrl-0 = <&pwm_ao_d_e_pins>;
        pinctrl-names = "default";
-------------------------------------------------------------------------------------------
> >
> > Thanks
> >
> > -Anand
>
> Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
