Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90CC2C742A7
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Mar 2023 14:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sc0tthXfEq9T6x/cRnSPFUt2AaGm7g98v9v7f+xzGYg=; b=LDMjUqtERTDXLU
	jd4bfalqxGvGI5AfkNicULtt/Fw8fkKSFYZkhXT/zcoqhM2VyKGELWGAeoiz7McXzfOkoThXfz44v
	uMHy+69KepL1CbmqeNhwKh/4OF/3FS20DGvKl2eVNvDKoK99sFMzIY16A5FtNi3GiQ5bdA0/vpVDb
	QprhPrLiYERO9w0Lly9SM8qebpnhKo/OBc65/OatSfgUp+oEOCGjSV8SZfzKNgJc9JnieQUJlXGgu
	SlFvxVH9o9xQuzQDCkN6yx/aXnC4iJD6gUUJfJ/wm+1Es2gUExO0031xESvFkQd8c3OIqh6VkpCh0
	vLZcwtsjUpaAPuvvJuUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paHNe-00AZpY-9H; Thu, 09 Mar 2023 14:36:30 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paHHF-00AX60-DR
	for linux-amlogic@lists.infradead.org; Thu, 09 Mar 2023 14:29:55 +0000
Received: by mail-pl1-x636.google.com with SMTP id p20so2118050plw.13
        for <linux-amlogic@lists.infradead.org>; Thu, 09 Mar 2023 06:29:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678372189;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Bl8Ig/SoPa8kDLYKK3prG31XNLf3b2Jf0y8Fe1Nszhg=;
        b=KXzftEo97Ncd8U2Nct5HSClvktPm38x7Z0DV+cVzUHNw73Oj/0EOiNr76CnEirvHAg
         imhztQaPQu2bRpkHVVaHEfkORonqTJNfWRgkRrynJ4zy5RImnqcQ5y/UmUrGvMb9lTWP
         smiHrjGyyIxXJrWJbhDdJkOMi0CULLVvBvyrObU+Fw10W8HzBZWyhqQfvUAk2EXtLsH3
         P0LxupICPgo+Neqj0aKO1cG1+hMKptFBMR3EpkTsVlyMzxe1JPlqrsyQsZeD8OZ15K/9
         g2Aap7dLX1/eVBP8YAR6kAn9NygmzGrV4aeSJXS4UQIgjf2plFmO5wYoHDX8SHwjdfdQ
         Leww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678372189;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bl8Ig/SoPa8kDLYKK3prG31XNLf3b2Jf0y8Fe1Nszhg=;
        b=ZwAgzbdcfIXXY7ma3xjG01oUfcTJ9WW4UlivhIczEIn3KdzNreD3dUK14RWKwN84QF
         n/sF3J05mQyHRFMFHYot1RKYVizQihr8fuhbZZRCWpB6dm+zdOh8w7zFc5hw4roVgJTW
         1pKkHMrLAkalaI/Q5LU1NFDX5AQNmw/gMN1COY+XPCkO5gMf5nz3b+LlAqAB5/1/oN3c
         3CHTLjwSzHNEZPGgcZXEfQzSLOhQOT8OsejtkSLKDvx/KdL6mnpVLSbK2S9rydp5fgm6
         Qz4nBBbQiLcxmvL+OWw1NX6r8bCGuD35bSzItaBAHPmwFFTpTrrxT4y2GBKFVsr+iUmR
         DAyA==
X-Gm-Message-State: AO0yUKVkvNWQ+a++KwFw47J1NfEj0mZ52nsN9LOKgumaHmDczYl5tPkU
	JzE2K0HIVgs7tjCJmYPEQIAT0ii7jg1vwpPraEBEXsfh5OKL1/+Q4EM=
X-Google-Smtp-Source: AK7set+glvYNvDZxTUBfPhpgrApdWUfFFkXJTzZ2wmNX+EGwaR3PkxDslYM/tT+6TY505jyjk6efgubWdeulOyxI/k0=
X-Received: by 2002:a17:90a:ab06:b0:230:80d7:2158 with SMTP id
 m6-20020a17090aab0600b0023080d72158mr8365554pjq.4.1678372189413; Thu, 09 Mar
 2023 06:29:49 -0800 (PST)
MIME-Version: 1.0
References: <05977cbb-8a8f-0a67-b4bd-b265dbb83280@free.fr> <895a3812-e490-cc40-0f8e-a88e166e8f24@linaro.org>
 <c1a215cf-94be-871b-2a8a-3cc381588f83@free.fr> <13676dcc-944f-cf3d-8adf-ee3d4e8fa699@free.fr>
 <e5baf73b-3b9d-1011-2ed9-4b6fc7ee644f@free.fr>
In-Reply-To: <e5baf73b-3b9d-1011-2ed9-4b6fc7ee644f@free.fr>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 9 Mar 2023 15:29:12 +0100
Message-ID: <CAPDyKFoAT-jMkYb7=m--q_eEb2xxH-VPQy5vaHNvw4s=WiAeCg@mail.gmail.com>
Subject: Re: [RFC PATCH] brcmfmac: add 43751 SDIO ids and initialization
To: Marc Gonzalez <marc.w.gonzalez@free.fr>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Arend van Spriel <aspriel@gmail.com>, 
	Franky Lin <franky.lin@broadcom.com>, Hante Meuleman <hante.meuleman@broadcom.com>, 
	Kalle Valo <kvalo@kernel.org>, Eric Dumazet <edumazet@google.com>, 
	Pieter-Paul Giesberts <pieter-paul.giesberts@broadcom.com>, Alexander Prutskov <alep@cypress.com>, 
	Joseph chuang <jiac@cypress.com>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Angus Ainslie <angus@akkea.ca>, 
	linux-wireless@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_062953_562011_3D2C7478 
X-CRM114-Status: GOOD (  30.92  )
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

On Thu, 9 Mar 2023 at 13:13, Marc Gonzalez <marc.w.gonzalez@free.fr> wrote:
>
> On 09/03/2023 11:16, Marc Gonzalez wrote:
>
> > On 06/03/2023 11:24, Marc Gonzalez wrote:
> >
> >> # cat /sys/bus/sdio/devices/mmc2:0001:1/uevent
> >> OF_NAME=wifi
> >> OF_FULLNAME=/soc/sd@ffe03000/wifi@1
> >> OF_COMPATIBLE_0=brcm,bcm4329-fmac
> >> OF_COMPATIBLE_N=1
> >> SDIO_CLASS=00
> >> SDIO_ID=02D0:AAE7
> >> SDIO_REVISION=0.0
> >> MODALIAS=sdio:c00v02D0dAAE7
> >>
> >> NB: 0xaae7 = 43751
> >
> > I have run into another issue.
> >
> > The WiFi device (and the mmc2 bus it sits on) don't show up at all
> > in the kernel log *unless* I add lots of debug output, such as with
> > #define DEBUG in drivers/base/dd.c
> >
> > I think this points to some kind of race condition?
> >
> > Neil suggested that maybe the host probes the mmc2 bus "too soon",
> > when the WiFi device is still powering up, which makes the entire
> > probe fail.

Ideally, the WiFi device/driver should not need to be initialized to
allow the SDIO card to be detected properly. Looks like there is
something fishy going on.

> >
> > This patch appears to solve the symptom:
> >
> > diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
> > index 6e5ea0213b477..999b3843c0d0b 100644
> > --- a/drivers/mmc/host/meson-gx-mmc.c
> > +++ b/drivers/mmc/host/meson-gx-mmc.c
> > @@ -1400,7 +1400,7 @@ static struct platform_driver meson_mmc_driver = {
> >       .remove         = meson_mmc_remove,
> >       .driver         = {
> >               .name = DRIVER_NAME,
> > -             .probe_type = PROBE_PREFER_ASYNCHRONOUS,
> > +             .probe_type = PROBE_FORCE_SYNCHRONOUS,
> >               .of_match_table = meson_mmc_of_match,
> >       },
> >  };
> >
> > But this might just be delaying the probe enough for the device
> > to become ready?
>
> FWIW, the relevant device tree nodes are:
>
> /* decompiled DTS */
>
>                 sd@ffe03000 {
>                         compatible = "amlogic,meson-axg-mmc";
>                         reg = <0x0 0xffe03000 0x0 0x800>;
>                         interrupts = <0x0 0xbd 0x4>;
>                         status = "okay";
>                         clocks = <0x2 0x21 0x2 0x3c 0x2 0x2>;
>                         clock-names = "core", "clkin0", "clkin1";
>                         resets = <0x5 0x2c>;
>                         amlogic,dram-access-quirk;
>                         pinctrl-0 = <0x2c>;
>                         pinctrl-1 = <0x2d>;
>                         pinctrl-names = "default", "clk-gate";
>                         #address-cells = <0x1>;
>                         #size-cells = <0x0>;
>                         bus-width = <0x4>;
>                         cap-sd-highspeed;
>                         sd-uhs-sdr50;
>                         max-frequency = <0x5f5e100>;
>                         non-removable;
>                         disable-wp;
>                         keep-power-in-suspend;
>                         mmc-pwrseq = <0x2e>;
>                         vmmc-supply = <0x2b>;
>                         vqmmc-supply = <0x21>;
>
>                         wifi@1 {
>                                 reg = <0x1>;
>                                 compatible = "brcm,bcm4329-fmac";
>                         };
>                 };
>
>
> /* original DTS */
>
>                 sd_emmc_a: sd@ffe03000 {
>                         compatible = "amlogic,meson-axg-mmc";
>                         reg = <0x0 0xffe03000 0x0 0x800>;
>                         interrupts = <GIC_SPI 189 IRQ_TYPE_LEVEL_HIGH>;
>                         status = "disabled";
>                         clocks = <&clkc CLKID_SD_EMMC_A>,
>                                  <&clkc CLKID_SD_EMMC_A_CLK0>,
>                                  <&clkc CLKID_FCLK_DIV2>;
>                         clock-names = "core", "clkin0", "clkin1";
>                         resets = <&reset RESET_SD_EMMC_A>;
>                 };
>
> &sd_emmc_a {
>         status = "okay";
>         pinctrl-0 = <&sdio_pins>;
>         pinctrl-1 = <&sdio_clk_gate_pins>;
>         pinctrl-names = "default", "clk-gate";
>         #address-cells = <1>;
>         #size-cells = <0>;
>
>         bus-width = <4>;
>         cap-sd-highspeed;
>         sd-uhs-sdr50;
>         max-frequency = <100000000>;
>
>         non-removable;
>         disable-wp;
>
>         /* WiFi firmware requires power to be kept while in suspend */
>         keep-power-in-suspend;
>
>         mmc-pwrseq = <&sdio_pwrseq>;

This one is particularly interesting. Can you share the content of the
sdio_pwrseq node too?

>
>         vmmc-supply = <&vddao_3v3>;
>         vqmmc-supply = <&vddio_ao1v8>;
>
>         brcmf: wifi@1 {
>                 reg = <1>;
>                 compatible = "brcm,bcm4329-fmac";
>         };
> };
>
> With an asynchronous probe, meson_mmc_probe() always succeeds,
> yet the WiFi card is not detected later on, even if I sleep
> 1-2 seconds in meson_mmc_probe().
>
> [    0.879756] YO: meson_mmc_probe: ffe03000.sd
> [    0.914320] YO: meson_mmc_probe: ffe03000.sd ALL OK
> [    1.199170] YO: meson_mmc_probe: ffe07000.mmc
> [    1.232734] YO: meson_mmc_probe: ffe07000.mmc ALL OK

To narrow down the problem, I would start by preventing the WiFi
driver from being insmoded. To make sure it doesn't affect the SDIO
card detection process.

The point is, the SDIO card should be detected properly, no matter
whether there is a corresponding SDIO func driver (WiFi driver)
available for it. For a detected SDIO/eMMC/SD card, mmc_add_card()
prints a message about the card in the log during initialization. It
could look like the below print, for example:

"mmc2: new ultra high speed SDR104 SDIO card at address 0001".

>
> Confused again...
>
> Regards
>

Kind regards
Uffe

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
