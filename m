Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C449EC433FE
	for <linux-amlogic@archiver.kernel.org>; Sat, 22 Oct 2022 11:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PkcaKdEZpA8X4iAvujahAc+kbTFtlsQGd+d+03nbN4o=; b=RkbdeGHKJDb9KQ
	URAETJ0G7XYdiCxKfzJDTOnAvzYSW5pdKEKykoGNCOXSYmc6LJPD7kN8um/4iGBtBmXil3+LYiZB5
	rPuleajZVEGIF/ZNr/6BSFTBWzB+nbYKrLGj0MUE0X89N8q50c5TLscyF6VWDFvnvYZZRD1uXa/S/
	QJdTUcg4hMUTh+dzNRnvM2LWqY508nbXxGRwJctMFe02KwkSffPO2/NbDtx1HOSgK5PO/O/KRML3V
	amYsQpMr2rMlNdUMwgxVUyFs5wiE12B7bw+iPSHG6FMLFODECp8wz+jbvBZfHMTtlmIVfrfr7C7kc
	Q98ipZvnSjrhmkllTqMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omCfB-00COjp-QJ; Sat, 22 Oct 2022 11:27:37 +0000
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omCey-00COh9-VX; Sat, 22 Oct 2022 11:27:26 +0000
Received: by mail-il1-x12e.google.com with SMTP id g13so2987525ile.0;
        Sat, 22 Oct 2022 04:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HY5GO8di75U1CCASt41qiLyc6F6QvdKPrg08NoOHj/w=;
        b=UNFQHvpbqLns18T7KH5EwVBhZQGXV2kNOC3gM6qxcMbeiHBIf0NngUXUEdPXXg1H/o
         G1tZ6diuM3NyqXBkvNlA/14Afwu8CoEZTyOLe6s19s52fBs16eXMjwqo1QLUrqEic/7G
         VI7ciHJrusXudYvzVwEgMMJ5Qs0XaVlglYFC/kpN9MW6C9V9cYEXodlvHiDvkFpAwiif
         kNwqcDFUEbJCWyGRAUIHc+9fEkZapYNRiJs+t1g0BYKLRnkWcaL/JJswVy5kXmA5kiag
         J05uoj0zSAQOV+uVm1AsQXVDHYrdlk4CwWbibpqLwLa6bqzWqfl+WHFktRjkYhOAS2yL
         rwpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HY5GO8di75U1CCASt41qiLyc6F6QvdKPrg08NoOHj/w=;
        b=MbVczRoz7JYNvi2KkOYlEWd8uG4UToAuF3BjkQ8A7/n96RURLDeSyJXAofTK1cSivr
         ZRHU1qqFy+lW4qLlOXokrea5dLrAAUiDNG0mZsrKla+ygy9ttSZT0+fd/1S3w4BUngLV
         W17Sxx2tfGtFw3C/NcnzSHMsSFes7L2NxrH12Tdv32tgZMVGFhsXvxyimvU/KDX9MFWn
         v2Pg6v3xpmG8ZWai/LUfVYfCU6GX1fMIepVW+R3wDae6yOSPygppoFuKoq5LOCW5GTV+
         gjZLlVNw0AH0foxbeDQBfuBj9btuivdWvylZbruEo3ZHj6a5KoPaGSPxKosPO6p0WFg2
         KR5w==
X-Gm-Message-State: ACrzQf0amqvxVQ80XmKvSBYwiDqWmEufsYGkqsUyXaroLY8rBABTGtkM
	cYadYVRSid38mvWCEYLBXwx2anbUmERKABXdvE0=
X-Google-Smtp-Source: AMsMyM6e9lch0ampIcrmMSSo6HI4nFbDoCNZk74CpXEmGNLqAOT70PmJZTsxlDOknphx0BLulVXPQB1tvGcDuVdHicA=
X-Received: by 2002:a92:da4a:0:b0:2f8:fa94:9dae with SMTP id
 p10-20020a92da4a000000b002f8fa949daemr16162088ilq.80.1666438043011; Sat, 22
 Oct 2022 04:27:23 -0700 (PDT)
MIME-Version: 1.0
References: <20221022084737.1028-1-linux.amoon@gmail.com> <CAFBinCBu_-0m9JeAr5kd-v7Z5LTi7w0WmmUYybW_kL4KJXXpOQ@mail.gmail.com>
In-Reply-To: <CAFBinCBu_-0m9JeAr5kd-v7Z5LTi7w0WmmUYybW_kL4KJXXpOQ@mail.gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Sat, 22 Oct 2022 16:57:07 +0530
Message-ID: <CANAwSgRzdD0FWg+z6hTFs7KvpsD64bChX-k0dPXJfACXZH2zbQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20221022_042725_035403_FD2621B0 
X-CRM114-Status: GOOD (  17.35  )
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

Thanks for your review comments..

On Sat, 22 Oct 2022 at 15:47, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> Hi Anand,
>
> On Sat, Oct 22, 2022 at 10:48 AM Anand Moon <linux.amoon@gmail.com> wrote:
> >
> > Odroid N2/N2+ support active cooling via gpio-fan controller.
> > Add fan controls and tip point for cpu and ddr thermal sensor
> > on this boards. Drop bias-disable from set pwm_ao_d_10 the pin
> either use "on these boards" or "on this board"
>
> [...]
> > @@ -1982,7 +1982,6 @@ pwm_ao_d_10_pins: pwm-ao-d-10 {
> >                                                 mux {
> >                                                         groups = "pwm_ao_d_10";
> >                                                         function = "pwm_ao_d";
> > -                                                       bias-disable;
> &pwm_ao_d_10_pins is not referenced anywhere so it seems that this
> change has no impact on controlling the fan on Odroid-N2(+).
> How did you test this change?
>
Ok I felt these changes affect the behavior of the pinctrl

  * @PIN_CONFIG_BIAS_DISABLE: disable any pin bias on the pin, a
 *  transition from say pull-up to pull-down implies that you disable
 *  pull-up in the process, this setting disables all biasing.

I mapped this is linked in pinctrl driver, pwm_ao_d_10_pins GPIOAO_10 see below

[0] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/pinctrl/meson/pinctrl-meson-g12a.c?h=v6.1-rc1#n825

For testing, I tried to libgpio command to verify shown below, with
this patch applied.
$ gpioinfo
....
gpiochip1 - 15 lines:
        line   0:      unnamed       unused   input  active-high
        line   1:      unnamed       unused   input  active-high
        line   2:      unnamed     "enable"  output  active-high [used]
        line   3:      unnamed       unused   input  active-high
        line   4:      unnamed       unused  output  active-high
        line   5:      unnamed       unused   input  active-high
        line   6:      unnamed       unused   input  active-high
        line   7:      unnamed       unused   input  active-high
        line   8:      unnamed "regulator-tflash_vdd" output active-high [used]
        line   9:      unnamed      "TF_IO"  output  active-high [used]
        line  10:      unnamed   "gpio-fan"  output  active-high [used]
        line  11:      unnamed    "n2:blue"  output  active-high [used]
        line  12:      unnamed       unused   input  active-high
        line  13:      unnamed       unused   input  active-high
        line  14:      unnamed       unused   input  active-high

$ cat /sys/kernel/debug/pinctrl/ff800000.sys-ctrl\:pinctrl@14-pinctrl-meson/pinmux-pins
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
pin 10 (GPIOAO_10): (MUX UNCLAIMED) aobus-banks:1958
pin 11 (GPIOAO_11): (MUX UNCLAIMED) aobus-banks:1959
pin 12 (GPIOE_0): (MUX UNCLAIMED) (GPIO UNCLAIMED)
pin 13 (GPIOE_1): ff802000.pwm (GPIO UNCLAIMED) function pwm_ao_d
group pwm_ao_d_e
pin 14 (GPIOE_2): ffd1b000.pwm (GPIO UNCLAIMED) function pwm_a_e group pwm_a_e

$ sudo gpiomon  gpiochip1 10
gpiomon: error waiting for events: Device or resource busy

$ sudo gpioget  gpiochip1 10
gpioget: error reading GPIO values: Device or resource busy

If I am wrong I have previously sent it with a typo correction below.

[1] https://lore.kernel.org/all/20221021050906.1158-1-linux.amoon@gmail.com/

Thanks
-Anand
>
> Best regards,
> Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
