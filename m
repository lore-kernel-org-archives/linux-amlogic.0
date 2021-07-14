Return-Path: <SRS0=cPU3=MG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 933B0C07E9A
	for <linux-amlogic@archiver.kernel.org>; Wed, 14 Jul 2021 12:00:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5045E61289
	for <linux-amlogic@archiver.kernel.org>; Wed, 14 Jul 2021 12:00:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5045E61289
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cfL5E+NHCSf4rQFe8MndimrZq2crPh/uEUhpd8gOkDs=; b=4a4Q61Vl/txrqQ
	NJSsvx6A1FG7RfdAfu4rablmyoT8+P1dOhkTHAo5bm4/sDNEiUBeRWMt+v3f0CtbEP0AvKGwQntW7
	JlLWoWTfiFMSl0kxhL2sAV9ZDGjssUgwPro1TDfwaTWhwHuLjI6YYImN+77fDOjcsPSLCfji4o7G7
	3HIn1i4GDSlQFD6dAUlnqwzVRLx7lv8pkA93v3xP19Z4TKOBEPnQdJuH+2uHjborBImqOumHKTGJG
	QyZ/OYSw4u8PJxLDknhaDuP5b2DyFvR58+FFigH50Pwi8fCzBDZ163/3tcKRwqILjIy/PHoXMq1Oz
	KwIX7amm4OUiMW9IOa8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3dYl-00DSEp-Pd; Wed, 14 Jul 2021 12:00:15 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3dYY-00DSCl-Fv; Wed, 14 Jul 2021 12:00:04 +0000
Received: by mail-ed1-x52c.google.com with SMTP id w14so2723449edc.8;
 Wed, 14 Jul 2021 04:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Z0cDWtp8wPpCy1HKqHuogY/nbZSdniTCmZHReAXhoNA=;
 b=dXUy5lj0SMVzJY5op0FRJTFtGVB7qlIDPoGTosuzjSXjuOZQZyDWrQppqHdtIa9oCc
 gZ+32QwyJWQrqfO9HTDFbFrCFoxWOogzIPzMkgoyi7NZ3cFv2toGljTO/nivdT5dAcsO
 qUIzxcB92+eEMiAcnTT8elX27tVKKHCWIk8eftHJ2I4o4JuXi0iVBzvq7lnzEj8avlNU
 BW+2yOrHbbnKM5v3fiE/zIrf8hxH9dXfpgbAtXAdKSE9oJ8435PUuxeYzqgCLyVBJR+b
 QPM3IwauxOMQurN1MCuPWlrcarCinNFz1L+DoS7W/Muihzgy1FpPECf0o5+6qq9wTdqp
 rWCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Z0cDWtp8wPpCy1HKqHuogY/nbZSdniTCmZHReAXhoNA=;
 b=nPLh9WwmCx7r/NuR9LoSE8eNGLyv5+wfN5oTccYEKXAXZHBJ/paqhg1y4ySXVJepD5
 lRdLCz0SDJGM6B2ZSwVteBVj6vG0vfZAuveYebdFHku/cb5G9TEBAMUEwiWqpKuxJSgg
 PCqaX7o6TmGH9nT6FuSwUROiOQ/oSZLSOxrb4BsANLYzTWQG77avbFG2oA5imlYVqCl7
 z0QV1UdHKQn2fJzZnpQo2K/mIdOH/SzTV5U5F58paZYafsbcKWc9tDkSHD2nvIxTqKO/
 jMZLneBnv6TzOrS2aVTOl2GT2iCdbISUOoRI8XZr7uAQtxbcb5FpfT1p0DcTWLFVsGn1
 KL8w==
X-Gm-Message-State: AOAM531IZLfek9/vRy/tWqtQZZB0V9EFfWd6DoMaRGqDM+VlEbjFfh5+
 pZORXK4IUF9GL+a5kKdgbCqNSPSYIGHZQKyKSFA=
X-Google-Smtp-Source: ABdhPJwS7UFi2W6hLFTIEQEzaq/exAYe0eKJt0jr2IuJpIenlH26hpBLQKuymW6mj8XmgYMepEks/7ig7OEItGBjoRU=
X-Received: by 2002:a05:6402:3507:: with SMTP id
 b7mr13329061edd.254.1626263996724; 
 Wed, 14 Jul 2021 04:59:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210713055227.1142-1-linux.amoon@gmail.com>
 <20210713055227.1142-2-linux.amoon@gmail.com>
 <CAFBinCD3ahpNQhP_jWZ3-4nXx8OqZOAANCpTN3BrsULRbYZHVw@mail.gmail.com>
 <CANAwSgTh02qg=cMT8tpHcEfAs5yW2vHQ7tPOkvuKXos_fOmh8A@mail.gmail.com>
 <CAFBinCC-kD-MW+bwqCZH5AjYDhxWa_pN2WEnHuiZpx=RhUdROQ@mail.gmail.com>
In-Reply-To: <CAFBinCC-kD-MW+bwqCZH5AjYDhxWa_pN2WEnHuiZpx=RhUdROQ@mail.gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Wed, 14 Jul 2021 17:29:44 +0530
Message-ID: <CANAwSgTf4sjoufrZuK-EjE=+yA8zSoVbqhEyNhJJFBLUCOVZmQ@mail.gmail.com>
Subject: Re: [PATCHv1 1/3] ARM: dts: meson8b: odroidc1: Add usb phy power node
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-phy@lists.infradead.org, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-amlogic@lists.infradead.org, 
 Linux Kernel <linux-kernel@vger.kernel.org>,
 Matt Corallo <oc2udbzfd@mattcorallo.com>, 
 Rob Herring <robh+dt@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, 
 Emiliano Ingrassia <ingrassia@epigenesys.com>,
 devicetree <devicetree@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210714_050002_586965_E30392F9 
X-CRM114-Status: GOOD (  37.41  )
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

On Wed, 14 Jul 2021 at 02:05, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> Hi Anand,
>
> On Tue, Jul 13, 2021 at 8:45 PM Anand Moon <linux.amoon@gmail.com> wrote:
> >
> > Hi Martin,
> >
> > Thanks for reviewing the changes,
> >
> > On Tue, 13 Jul 2021 at 20:35, Martin Blumenstingl
> > <martin.blumenstingl@googlemail.com> wrote:
> > >
> > > Hi Anand,
> > >
> > > On Tue, Jul 13, 2021 at 7:53 AM Anand Moon <linux.amoon@gmail.com> wrote:
> > > >
> > > > Add missing usb phy power node for phy mode fix below warning.
> > > >
> > > > [    1.253149] phy phy-c1108820.phy.0: Looking up phy-supply from device tree
> > > > [    1.253166] phy phy-c1108820.phy.0: Looking up phy-supply property
> > > >                 in node /soc/cbus@c1100000/phy@8820 failed
> > > I did some testing on my own Odroid-C1+ and this patch is not doing
> > > anything for me.
> > > more information below.
> > Some device node for USB will have
> The mistake I made before is considering USB VBUS as PHY power supply.
> I believe the USB PHY is actually powered by the AVDD18_USB_ADC and
> USB33_VDDIOH signals. See the S905 datasheet [0], page 25
> These are 1.8V and 3.3V signals while you are adding a 5V regulator.
>
OK, thanks.
> [...]
> > > > +               /*
> > > > +                * signal name from schematics: USB_POWER
> > > > +                */
> > > Just a few lines below you're saying that the name from the schematics is PWREN
> > > If this patch is getting another round then please clarify the actual
> > > signal name, or name both signals if the schematics is actually using
> > > both names.
> > >
> > As per the schematics.
> > PWREN ---> GPIOAO.BIT5      gpio pin control
> > USB_POWER ---> P5V0          power source regulator.
> ah, thanks for clarifying this
> my suggestion is to put that exact paragraph into the comment to avoid confusion
>
> [...]
> > > Can you please give this a try on your Odroid-C1 as well?
> > > The conclusion from my own testing is that GPIOAO_5 doesn't seem to be
> > > related to USB1 (host-only) because if it was then inverting the
> > > polarity (from active high to active low) should result in a change.
> > >
> >
> > Ok I have modified as per above but not changes in gpio polarity
> > from active high to active low. see below.
> >
> > # Odroid C1
> > [alarm@archl-c1e ~]$ sudo cat /sys/kernel/debug/gpio | grep USB
> >  gpio-1953 (USB_HUB_RST_N       |usb-hub-reset       ) out hi
> >  gpio-1954 (USB_OTG_PWREN       |regulator-usbp_pwr_e) out hi
> >
> > # Odroid C2
> > [alarm@archl-c2lm ~]$  sudo cat /sys/kernel/debug/gpio | grep usb
> >  gpio-501 (USB HUB nRESET      |usb-hub-reset       ) out hi
> >  gpio-502 (USB OTG Power En    |regulator-usb-pwrs  ) out hi
> that's strange, my result is different
>
>   gpio = <&gpio_ao GPIOAO_5 GPIO_ACTIVE_HIGH>;
>   enable-active-high;
> gives me:
>   # grep USB_OTG_PWREN /sys/kernel/debug/gpio
>   gpio-418 (USB_OTG_PWREN       |regulator-usb-pwr-en) out hi
>
>   gpio = <&gpio_ao GPIOAO_5 GPIO_ACTIVE_LOW>;
> gives me:
>   # grep USB_OTG_PWREN /sys/kernel/debug/gpio
>   gpio-418 (USB_OTG_PWREN       |regulator-usb-pwr-en) out lo ACTIVE LOW
This gpio pin number dose not match the gpio pin on Odroid c1+, see below.
>
> Did you remove the "enable-active-high;" in your "active low" test?
No
> GPIO polarity for regulators is managed with that flag, not just with
> GPIO_ACTIVE_{HIGH,LOW}

It's just with changes the following, below
+++ b/arch/arm/boot/dts/meson8b-odroidc1.dts
@@ -47,7 +47,7 @@ usb_pwr_en: regulator-usb-pwr-en {
                /*
                 * signal name from schematics: PWREN
                 */
-               gpio = <&gpio_ao GPIOAO_5 GPIO_ACTIVE_HIGH>;
+               gpio = <&gpio_ao GPIOAO_5 GPIO_ACTIVE_LOW>;
                enable-active-high;
        };

[alarm@archl-c1e ~]$ sudo grep USB_OTG_PWREN /sys/kernel/debug/gpio
 gpio-1954 (USB_OTG_PWREN       |regulator-usb-pwr-en) out hi

[alarm@archl-c1e ~]$ sudo cat /sys/kernel/debug/gpio
gpiochip1: GPIOs 1949-1964, parent: platform/c8100084.pinctrl, aobus-banks:
 gpio-1949 (UART TX             )
 gpio-1950 (UART RX             )
 gpio-1951 (                    )
 gpio-1952 (TF_3V3N_1V8_EN      |TF_IO               ) out lo
 gpio-1953 (USB_HUB_RST_N       |usb-hub-reset       ) out hi
 gpio-1954 (USB_OTG_PWREN       |regulator-usb-pwr-en) out hi
 gpio-1955 (J7 Header Pin 2     )
 gpio-1956 (IR_IN               )
 gpio-1957 (J7 Header Pin 4     )
 gpio-1958 (J7 Header Pin 6     )
 gpio-1959 (J7 Header Pin 5     )
 gpio-1960 (J7 Header Pin 7     )
 gpio-1961 (HDMI_CEC            )
 gpio-1962 (SYS_LED             |c1:blue:alive       ) out hi ACTIVE LOW
 gpio-1963 (                    )
 gpio-1964 (                    )

gpiochip0: GPIOs 1965-2047, parent: platform/c1109880.pinctrl, cbus-banks:
 gpio-1965 (J2 Header Pin 35    )
 gpio-1966 (J2 Header Pin 36    )
 gpio-1967 (J2 Header Pin 32    )
 gpio-1968 (J2 Header Pin 31    )
 gpio-1969 (J2 Header Pin 29    )
 gpio-1970 (J2 Header Pin 18    )
 gpio-1971 (J2 Header Pin 22    )
 gpio-1972 (J2 Header Pin 16    )
 gpio-1973 (J2 Header Pin 23    )
 gpio-1974 (J2 Header Pin 21    )
 gpio-1975 (J2 Header Pin 19    )
 gpio-1976 (J2 Header Pin 33    )
 gpio-1977 (J2 Header Pin 8     )
 gpio-1978 (J2 Header Pin 10    )
 gpio-1979 (J2 Header Pin 15    )
 gpio-1980 (J2 Header Pin 13    )
 gpio-1981 (J2 Header Pin 24    )
 gpio-1982 (J2 Header Pin 26    )
 gpio-1983 (Revision (upper)    )
 gpio-1984 (Revision (lower)    )
 gpio-1985 (J2 Header Pin 7     )
 gpio-1986 (                    )
 gpio-1987 (J2 Header Pin 12    )
 gpio-1988 (J2 Header Pin 11    )
 gpio-1989 (                    )
 gpio-1990 (                    )
 gpio-1991 (                    )
 gpio-1992 (TFLASH_VDD_EN       |regulator-tflash_vdd) out lo
 gpio-1993 (                    )
 gpio-1994 (                    )
 gpio-1995 (VCCK_PWM (PWM_C)    )
 gpio-1996 (I2CA_SDA            )
 gpio-1997 (I2CA_SCL            )
 gpio-1998 (I2CB_SDA            )
 gpio-1999 (I2CB_SCL            )
 gpio-2000 (VDDEE_PWM (PWM_D)   )
 gpio-2001 (                    )
 gpio-2002 (HDMI_HPD            )
 gpio-2003 (HDMI_I2C_SDA        )
 gpio-2004 (HDMI_I2C_SCL        )
 gpio-2005 (ETH_PHY_INTR        )
 gpio-2006 (ETH_PHY_NRST        |PHY reset           ) out hi ACTIVE LOW
 gpio-2007 (ETH_TXD1            )
 gpio-2008 (ETH_TXD0            )
 gpio-2009 (ETH_TXD3            )
 gpio-2010 (ETH_TXD2            )
 gpio-2011 (ETH_RGMII_TX_CLK    )
 gpio-2012 (SD_DATA1 (SDB_D1)   )
 gpio-2013 (SD_DATA0 (SDB_D0)   )
 gpio-2014 (SD_CLK              )
 gpio-2015 (SD_CMD              )
 gpio-2016 (SD_DATA3 (SDB_D3)   )
 gpio-2017 (SD_DATA2 (SDB_D2)   )
 gpio-2018 (SD_CDN (SD_DET_N)   |cd                  ) in  hi ACTIVE LOW
 gpio-2019 (SDC_D0 (EMMC)       )
 gpio-2020 (SDC_D1 (EMMC)       )
 gpio-2021 (SDC_D2 (EMMC)       )
 gpio-2022 (SDC_D3 (EMMC)       )
 gpio-2023 (SDC_D4 (EMMC)       )
 gpio-2024 (SDC_D5 (EMMC)       )
 gpio-2025 (SDC_D6 (EMMC)       )
 gpio-2026 (SDC_D7 (EMMC)       )
 gpio-2027 (SDC_CLK (EMMC)      )
 gpio-2028 (SDC_RSTn (EMMC)     |reset               ) out hi ACTIVE LOW
 gpio-2029 (SDC_CMD (EMMC)      )
 gpio-2030 (BOOT_SEL            )
 gpio-2031 (                    )
 gpio-2032 (                    )
 gpio-2033 (                    )
 gpio-2034 (                    )
 gpio-2035 (                    )
 gpio-2036 (                    )
 gpio-2037 (                    )
 gpio-2038 (ETH_RXD1            )
 gpio-2039 (ETH_RXD0            )
 gpio-2040 (ETH_RX_DV           )
 gpio-2041 (RGMII_RX_CLK        )
 gpio-2042 (ETH_RXD3            )
 gpio-2043 (ETH_RXD2            )
 gpio-2044 (ETH_TXEN            )
 gpio-2045 (ETH_PHY_REF_CLK_25MO)
 gpio-2046 (ETH_MDC             )
 gpio-2047 (ETH_MDIO            )

>
> [...]
> > > >  &usb1_phy {
> > > >         status = "okay";
> > > > +       phy-supply = <&usb_pwr_en>;
> > > From the schematics it seems that this is not the PHY supply (which I
> > > admittedly have used incorrectly for VBUS before).
> > > In the schematics that I have (odroid-c1+_rev0.4_20150615.pdf) it
> > > seems to be enabling VBUS.
> > > So in that case a vbus-supply property should be used inside &usb1 instead.
> > >
> > As per the debug log I have added this since core phy looking for this property
> Let's discuss the results with different polarities first, then we can
> also discuss the rest.
>
>
> Best regards,
> Martin

Thanks
Anand

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
