Return-Path: <SRS0=b0VC=J2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58976C433B4
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Apr 2021 21:31:34 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D57DD613AD
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Apr 2021 21:31:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D57DD613AD
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+J8Ys2HNPbIIT9dIKna2pBZeuDKVzdXjblw82CA8JEs=; b=ZtnfN8Gzn4Sg1gCl41I5RSOhm
	zhMfqjnlezLpBrmT0J7SpaRO8yc3+PYtWGvrqm1dV9bnirK2aTnV3UpCrgOeljSG0Bmo7o/MRXtyc
	bu5e3OEUQMVyBmLbeSkC6S3JJ6NS7Swt97tMRYx0134tSeQ2I8tuWn0SNEIbUnlyABnvXiPk0dEQI
	60PEIpliaSB1QXQyOTB6d9lueXNY78HUWReRzjiT5vgWErLfYbRF+BZDdApUPVYqa4kzpYnYAihsa
	BUOurUqhMJMW7zrNg+YO3YaP14ZpH70MXVGHuoqhe3TlU6kpEQy7TOH2gFuhpiu6qMTV2n6QYAnIZ
	A+caA5X4w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lcEFr-006Zdj-5F; Thu, 29 Apr 2021 21:31:27 +0000
Received: from [2607:7c80:54:e::133] (helo=bombadil.infradead.org)
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcEFo-006ZcJ-GQ; Thu, 29 Apr 2021 21:31:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=uVMl1qnVSF03rfGgdYkMBHAAAqe4Ku/OnaBY2U59O2s=; b=3+UJCLC7KMTcFxs4QcpdLNSoMf
 VhVI7NUPtQgdYFI2CYEOTw26QwjZolSUpU7fGZP1XIiK98tnhWZIOQNzXis9DEXl/DjVTrSg4IO7Q
 wJy7sdyUO9iELo/bjmXIMZE4e1V9pSKS1NrxyNEvvTT8Mb0N1gW27pERcfilG/ET9DBX1IWwWEHSJ
 4rbWTsB1mbo9v7Hc8yNQ9CkNjIOHuO0uayTPPdkk6aV95l/nmQK34A2UplbMHHplflR2aBRpKWH86
 DchZBdT45jgvCc/ThwcufwskXkSUO1rT33w2oZ4ipQwxipa8ACk1Cb1XDQ53YCeDctrzhNxyHlDfl
 PrZXwT3A==;
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcEFb-000z8g-Og; Thu, 29 Apr 2021 21:31:13 +0000
Received: by mail-ej1-x632.google.com with SMTP id w3so102095261ejc.4;
 Thu, 29 Apr 2021 14:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uVMl1qnVSF03rfGgdYkMBHAAAqe4Ku/OnaBY2U59O2s=;
 b=Zf4acKs32A29H762/G5LkAPIL+Q3bdfTEdtGk/fYQOU1SrXKCu1N2KGhE/O9hZAR8m
 XK0xyoHOfBHj4RkF23kP7wj3fRTOkgt5u1Dq7qxGpklWYp4mH61RhjEUQiaWUeSfLE8L
 xNLSINLOfkVEF9AE6dqRIqf/PyCX4DAAajVZCNZJNPu0TChO+jRwreba2jVDNB6CbRiR
 2PCEPa0cnOksoqsJxIuwGSHuT3+qaKRDjHusl39Bpi1gjIjQqa9bcE97VlIlv7km3o2u
 OPZosYhoteIcxKdL2OM9upHe5maTv1WsfKeb5FDGWQTtRBE/6fxp++P5m2JZ3TnlhHD/
 vDbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uVMl1qnVSF03rfGgdYkMBHAAAqe4Ku/OnaBY2U59O2s=;
 b=W1lhw6mZ7OxVGgGd9jJBRVnT5F7Ld9q99MgILLudRAetVoFG35BvRJrkRBiGFkWM1l
 QZgj5gflEgnIwaESWcHY5m/+iEzG9EWM/jhUdyEuogAYUAB7kHLgELOSSFJt/HqxM4gC
 Yuho+/nvj+AfK7amiBQVJITUdjPCCTOnihbzh0HiF2Q1b0FQ/3ZDoEvtAOk5GkYc0ieZ
 3P6Y7PlpSPgQkKCQM/a650NvvkUGfxkR3kIrJxQyfkcH9LleO5/GiT1pL4T0XowAyzKT
 NaXexO5sKqe1Yw2Gbo/YpLtS80B7RWuWGhKKH4i0IKFEDe/sPE76/UySqcECeOXaQzKy
 /uOw==
X-Gm-Message-State: AOAM53383yuuubl5GxZDRLFbMkRLSknblLYgPhqf3dWiUB7LvaS2eYKG
 LAyYMmAfwnO/JKlq7enH5A6p3Ao+DWUowHJTM68=
X-Google-Smtp-Source: ABdhPJwq1uyPLkWHfyPVREWPc7ZTJSfwQblAtTnULW2OPkFED5s8OL9ENgWZOb0EQRn+PTVaXvM/rd4GiBxndYSWEEE=
X-Received: by 2002:a17:906:ecb8:: with SMTP id
 qh24mr623023ejb.162.1619731869841; 
 Thu, 29 Apr 2021 14:31:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210429170404.3616111-1-narmstrong@baylibre.com>
 <20210429170404.3616111-4-narmstrong@baylibre.com>
In-Reply-To: <20210429170404.3616111-4-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 29 Apr 2021 23:30:58 +0200
Message-ID: <CAFBinCDQeTU0ss=oNmjX78MPyNZmmCt-haojNNcQqkjJUmJYKQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: meson-sm1: add Banana PI BPI-M5 board dts
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: khilman@baylibre.com, jbrunet@baylibre.com, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210429_143111_842518_662CB4DF 
X-CRM114-Status: GOOD (  20.43  )
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

thanks for adding support for the BPI-M5!
I had this on my TODO-list for a long time but didn't have enough time
so far. so it's great to see this patch now :-)

On Thu, Apr 29, 2021 at 7:04 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
[...]
> +       adc_keys {
> +               compatible = "adc-keys";
> +               io-channels = <&saradc 2>;
> +               io-channel-names = "buttons";
> +               keyup-threshold-microvolt = <1800000>;
> +
> +               button-onoff {
maybe just "key" (as you used below for SW1)?

> +                       label = "SW3";
> +                       linux,code = <BTN_3>;
> +                       press-threshold-microvolt = <1700000>;
> +               };
> +       };

> +       /* TOFIX: handle CVBS_DET on SARADC channel 0 */
it's great to see that after many years at least some boards finally
can detect whether the CVBS connector is plugged it

> +       memory@0 {
> +               device_type = "memory";
> +               reg = <0x0 0x0 0x0 0x40000000>;
> +       };
note to self: u-boot will update this from 1GiB to 4GiB

> +       flash_1v8: regulator-flash_1v8 {
> +               compatible = "regulator-fixed";
> +               regulator-name = "FLASH_1V8";
BPI-M5-SCH-V10-Release.pdf schematics are calling this EMMC_1V8. I
suggest to use that name so it's easier to compare this with the
schematics in the future

> +               regulator-min-microvolt = <1800000>;
> +               regulator-max-microvolt = <1800000>;
> +               vin-supply = <&vddao_3v3>;
> +               regulator-always-on;
> +       };
> +
> +       dc_in: regulator-dc_in {
> +               compatible = "regulator-fixed";
> +               regulator-name = "5V";
maybe use "DC_IN" here as well so the node-name matches what we see in
userspace/kernel logs?

> +       vddcpu: regulator-vddcpu {
> +               /*
> +                * SY8120B1ABC DC/DC Regulator.
> +                */
> +               compatible = "pwm-regulator";
> +
> +               regulator-name = "VDDCPU";
> +               regulator-min-microvolt = <721000>;
> +               regulator-max-microvolt = <1022000>;
the vendor .dts has:
  regulator-min-microvolt = <690000>;
  regulator-max-microvolt = <1050000>;
which also matches meson-sm1-sei610.dts (which uses the same regulator IC)

[...]
> +&ethmac {
> +       pinctrl-0 = <&eth_pins>, <&eth_rgmii_pins>;
> +       pinctrl-names = "default";
> +       status = "okay";
> +       phy-mode = "rgmii";
> +       phy-handle = <&external_phy>;
> +       amlogic,tx-delay-ns = <2>;
I haven't checked their u-boot code but some of the newer Amlogic BSPs
seem to let the PHY add the TX delay (which is also what the netdev
maintainers recommend)
that can be achieved by setting:
  phy-mode = "rgmii-txid";
and deleting the "amlogic,tx-delay-ns" property

> +&gpio {
> +       gpio-line-names =
> +               /* GPIOZ */
> +               "", "", "", "", "", "", "", "",
GPIOZ_0 to GPIOZ_15:
- ETH_MDIO
- ETH_MDC
- ETH_RXCLK
- ETH_RX_DV
- ETH_RXD0
- ETH_RXD1
- ETH_RXD2
- ETH_RXD3
- ETH_TXCLK
- ETH_TXEN
- ETH_TXD0
- ETH_TXD1
- ETH_TXD2
- ETH_TXD3
- ETH_INTR
- ETH_NRST

> +               /* GPIOH */
> +               "", "", "", "", "",
GPIOH_0 to GPIOH_4:
- HDMI_SDA
- HDMI_SCL
- HDMI_HPD
- HDMI_CEC
- VL-RST_N

> +               "CON1-P36", /* GPIOH_5 */
GPIOH_6 to GPIOH_8:
- VL-PWREN
- WiFi_3V3_1V8
- TFLASH_VDD_EN

> +               /* BOOT */
> +               "", "", "", "", "", "", "", "",
> +               "", "", "", "", "", "", "", "",
BOOT_0 to BOOT_13:
- eMMC_D0
- eMMC_D1
- eMMC_D2
- eMMC_D3
- eMMC_D4
- eMMC_D5
- eMMC_D6
- eMMC_D7
- eMMC_CLK
- (BOOT_9 is unused)
- eMMC_CMD
- (BOOT_11 is unused)
- eMMC_RST#
- eMMC_DS

> +               /* GPIOC */
> +               "", "", "", "", "", "", "", "",
GPIOC_0 to GPIOC_7:
- SD_D0_B
- SD_D1_B
- SD_D2_B
- SD_D3_B
- SD_CLK_B
- SD_CMD_B
- CARD_EN_DET
- (GPIOC_7 is unused)


> +&gpio_ao {
> +       gpio-line-names =
> +               /* GPIOAO */
> +               "DEBUG TX", /* GPIOAO_0 */
> +               "DEBUG RX", /* GPIOAO_1 */
> +               "SYS_LED2", /* GPIOAO_2 */
> +               "UPDATE_KEY", /* GPIOAO_3 */
> +               "CON1-P40", /* GPIOAO_4 */
> +               "",
GPIOAO_5 is IR_IN

> +               "TF_3V3N_1V8_EN", /* GPIOAO_6 */
> +               "CON1-P35", /* GPIOAO_7 */
> +               "CON1-P12", /* GPIOAO_8 */
> +               "CON1-P37", /* GPIOAO_9 */
> +               "CON1-P38", /* GPIOAO_10 */
> +               "SYS_LED", /* GPIOAO_11 */
> +               /* GPIOE */
> +               "", "", "";
GPIOE_0 to GPIOOE_2:
- VDDEE_PWM
- VDDCPU_PWM
- TF_PWR_EN

> +&usb2_phy0 {
> +       phy-supply = <&dc_in>;
> +};
> +
> +&usb2_phy1 {
> +       /* Enable the hub which is connected to this port */
> +       phy-supply = <&vl_pwr_en>;
> +};
I think technically we'd need to use AVDD18_USB here (that said, I
chose the same approach as you are using here before..)
USB bus devices (AFAIK) still need to be detected before any
device-tree properties can be applied and there's (again AFAIK) still
no pwrseq concept.
so I guess for now this is the way to go as there's enough comments
about it in your patch


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
