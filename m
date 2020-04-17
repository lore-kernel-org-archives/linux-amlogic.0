Return-Path: <SRS0=ZPw0=6B=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FF03C3815B
	for <linux-amlogic@archiver.kernel.org>; Fri, 17 Apr 2020 18:58:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 48C26206E9
	for <linux-amlogic@archiver.kernel.org>; Fri, 17 Apr 2020 18:58:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HuXRVg5d";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="fo9jdYtU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 48C26206E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5BdJ5a2kpQo1ttvuOiLdLY3AOycZLkCFb2C9JkAkEXQ=; b=HuXRVg5dqOYxVp
	c/XhzVd4yUI/PXnYaHiFi6KFwE3a5zu0IMyAle+tIYd/xGzCe+nG2QLRHKgBjvE5h6z4mySWYdx6d
	8H8B6zENswyNL/lKpy8tWg4dkFxjCKQiRTANyVTyHa/mcfXdmFhDPnIFHXGfaGszL/znNyaQQ8Ido
	IaJ20oiCTd/FHFCtDsh1LLwK0CLNY/89G0N7HBana7IktPHGy2NoI43LZVpSRYubaco9d4JvM4zlj
	OES6RQMwPIUrCX9hCKGU1CWeD93g3ssh6UFaUbMe3dVJiOOrsiXXfBgXfAowbaYS5oI7FGzFgISWJ
	0Xk7K22ga0AoFjFL0wtA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jPWBu-00037e-Qo; Fri, 17 Apr 2020 18:58:18 +0000
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jPWBs-000374-Rm; Fri, 17 Apr 2020 18:58:18 +0000
Received: by mail-ej1-x644.google.com with SMTP id nv1so2345750ejb.0;
 Fri, 17 Apr 2020 11:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nlMFBx94GCBfheLIsuK5jE2jfZjb/ff2QESeWVLDTaA=;
 b=fo9jdYtU3T1u7shVeHbNWBxaUnvCMAs51p7ITTnBk0XK8aZFdpqwimCEkoVfVdHnX+
 eRId7zN/unfZUtKp6jDQ3FZ9fokbx6h5lUxmOw9/lr69K4+EobBDQUq9Zlu/AWzommVO
 i/b6Dd5ugZi29Y9v+q6rBQ+t0RVhn4RK02KBZnkgad3jJTc7X4TBZ/AQBwwQNtTon9rH
 0tL3tUAXoIIVvkjz6Hdj6ERZCugZet/uwre/IkgFV32UXzCVmhjF0v1hQMoDGsUB8+SC
 YV5lJYrq9j8rQCxT0faPnqY4mBz38lt7LNyPO+Gq70AhqrDKJXnyKYe8LU2mjkwTjfY+
 L7zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nlMFBx94GCBfheLIsuK5jE2jfZjb/ff2QESeWVLDTaA=;
 b=i5lrWSBA95eayz4YGJPJeisj3usclSq61VrBt3H3O8A4y5O6/7IJmb5+XUrMI0jjuo
 hf3fSgqaWZhLIn8s02o+CwomVRIN26oswNBJ9+pdESbT7IdB9oqdGjHKurqOGkBo/yyT
 vvdSGS5s4hJ+uxV01dczcKIkTcgIQtZgCWDSBu3R3UOcjitW73bp1exAIk9T/AHSgExB
 +ri/3NTEtLcSF2z9QgTcuNlXRHacs+Sihz1J1sp+B2orhoShs7LD4QrHiHOWvz+kXQ7O
 kfUY3iFUU2+XYzPWqrUyC7tBm7mpJJwER4EoB7xusTyBps7sCU/5xeT8HptDEep+9kOj
 /N1A==
X-Gm-Message-State: AGi0PualKiBnBRP5bmXVXzOLGgnrniUL/le+aRAjOWv9Ct6KOE2cK5uM
 J8tmzl51fZ2FXow2Gm1e+ZMfKlh6CfQaGtxqMZQ=
X-Google-Smtp-Source: APiQypJDTAOAKuxrm7soIeXoSsvXePAMrOLicPlcfUvzaZAHE61vBhTuJxahrdb1K9VgXzzNto7Uz3Fvb31Q2ubZeVk=
X-Received: by 2002:a17:906:4048:: with SMTP id
 y8mr4465506ejj.258.1587149895198; 
 Fri, 17 Apr 2020 11:58:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200416121910.12723-1-narmstrong@baylibre.com>
 <20200416121910.12723-3-narmstrong@baylibre.com>
In-Reply-To: <20200416121910.12723-3-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 17 Apr 2020 20:58:04 +0200
Message-ID: <CAFBinCCUM1Ht1_yRcbG=exJBign=YBX1+xUr8kz=3pJy2PxsnQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/8] usb: dwc3: meson-g12a: support the GXL/GXM DWC3
 host phy disconnect
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200417_115816_921155_CF9F843B 
X-CRM114-Status: GOOD (  15.56  )
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
Cc: balbi@kernel.org, khilman@baylibre.com, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, kishon@ti.com, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, Apr 16, 2020 at 2:19 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> On the Amlogic GXL/GXM SoCs, the OTG PHY status signals are always
> connected to the DWC3 controller, thus crashing the controller when
> switching to OTG mode when port is not populated with a device/cable to
> Host.
>
> Amlogic added a bit to disconnect the OTG PHY status signals from the DWC3
> to be used when switching the OTG PHY as Device to the DWC2 controller.
>
> The drawback is that it makes the DWC3 port state machine stall and needs
> a full reset of the DWC3 controller to get connect status to the port
> connected to the OTG PHY, but not the other one.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
one nit-pick below. apart from that:
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

[...]
>         if (mode == PHY_MODE_USB_DEVICE) {
> +               if (priv->otg_mode != USB_DR_MODE_OTG &&
> +                   priv->drvdata->otg_phy_host_port_disable)
> +                       /* Isolate the OTG PHY port from the Host Controller */
> +                       regmap_update_bits(priv->usb_glue_regmap, USB_R1,
> +                               USB_R1_U3H_HOST_U2_PORT_DISABLE_MASK,
> +                               FIELD_PREP(USB_R1_U3H_HOST_U2_PORT_DISABLE_MASK,
> +                                          BIT(USB2_OTG_PHY)));
if you have to re-send for whatever reason then I would like an empty
line here to make the code easier to read

>                 regmap_update_bits(priv->usb_glue_regmap, USB_R0,
>                                 USB_R0_U2D_ACT, USB_R0_U2D_ACT);
>                 regmap_update_bits(priv->usb_glue_regmap, USB_R0,
> @@ -297,6 +318,12 @@ static void dwc3_meson_g12a_usb_otg_apply_mode(struct dwc3_meson_g12a *priv,
>                 regmap_update_bits(priv->usb_glue_regmap, USB_R4,
>                                 USB_R4_P21_SLEEP_M0, USB_R4_P21_SLEEP_M0);
>         } else {
> +               if (priv->otg_mode != USB_DR_MODE_OTG &&
> +                   priv->drvdata->otg_phy_host_port_disable) {
> +                       regmap_update_bits(priv->usb_glue_regmap, USB_R1,
> +                               USB_R1_U3H_HOST_U2_PORT_DISABLE_MASK, 0);
> +                       msleep(500);
> +               }
same as above - if you have to re-send for whatever reason then please
add an empty line here

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
