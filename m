Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02F37C4167B
	for <linux-amlogic@archiver.kernel.org>; Wed, 28 Dec 2022 14:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tUmvDVpQs+G13IpKNKswlM2k1eLeycnpud0vyZLKdw4=; b=nWVdZrKxj5/RPj
	+h0IpELhndwwFzKLF/fIpOpUUShM3DF8KipJ4hWhpDV5dSABwil9ENC8c0JaehSc/2p/LO3vaxTCl
	uCBT22vqOaJY7jQfKS/ILWhxutWTSkLmF0GVAAXU3gt/GcvQnjarEYO5+Phq9BBuwxIe1UTAmOHrg
	wCwOOzswH4KA5lJRuNRLYfPhY8wxwvhsiZnWrzXAG+58rURERDK1wQqdBiUxravu6crxdV9c4YkMd
	mW5FyqWfVMIT5yZSmTpcKMrV5gs10n1BcQjNLAu5TEt+F6DQOTVE04fVAFaFqo6XiTOw/GxfGGBoo
	Pg0fNRSDJTyH0o+vWJ4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAXfi-005fAj-CN; Wed, 28 Dec 2022 14:44:46 +0000
Received: from mail-vk1-xa2f.google.com ([2607:f8b0:4864:20::a2f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAXff-005f8t-EB; Wed, 28 Dec 2022 14:44:45 +0000
Received: by mail-vk1-xa2f.google.com with SMTP id bi24so238142vkb.6;
        Wed, 28 Dec 2022 06:44:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nWly6CS117lh6W/pWnUHNuJLnc15iy3WKMaFGfN+hgI=;
        b=bC2m3zrfa87ubxBUOud/XnpoJ6JRQtIp5AvFP+Dg/RAfR3vLc3p3BbBnNuHMaFMkei
         wBdlTKZYONWbZWmgtF80/Od4Gw2vptTCDBS2qOKfrjzlwz4nObQZXJIu/K/woxvOyUHL
         gwAKm/jeYk5ljndDFPSMualoMn2J6ZmAu66QNS4n6mzyGS6hlJq0hF/UIm4R9Uk4Twq2
         DsLXuCnICp2OMF48mttlcnLUy0LSASlzfARftklE8BhyNiGwVDmFwd9jK1OzACUUCm3s
         olYwbfI1R9iaZEIYOL+Au9daFjixBBJSwM47bm1z45J4NFutuytYsdawrsRBhigy6MJO
         3ixA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nWly6CS117lh6W/pWnUHNuJLnc15iy3WKMaFGfN+hgI=;
        b=VcYW8lh1yibz2T406ExNMa4f9v74SKRXzEFTG+5lDv/90918O6Sk2dGoY//0hzDYhr
         Gr6gntdOL0b/cVT7N0rcNn1AaQ23pruZuO27ow/MSidg89stKzQpPgwFx1p5jXN+WqaI
         jO+vTDeUtsvA5uZGCCeOKX3oMt7xpDuhSPMabQeVEYIWZSC3ydCzK6d6+GZuYhk1t+z9
         MFQBG5egPLUP52dTZyfPqHHMV6Z/6ldyX8AkMRtw+HsHkwZieWPO6PT5MEqbase/j2d9
         M4Qy/u+hLT0iB/K/KMN8cbxLFEuvxZO69IgkPLqitX10MR7+V3suE8eJZpFlaVg71L+1
         gJ4g==
X-Gm-Message-State: AFqh2kpm143Qdgk6i3DoG+NnjXIXJMafWjajQ/EW0q6CF8buj08wSL2P
	7XWRdnyph28HUxC5ubJJFRH4JCWwirUDFj3ud7w=
X-Google-Smtp-Source: AMrXdXvufFe8mF9LmkJ38VB3Th1R8eAghiEZYOYmoZ632g02xmiJBzLZcs2CNmlAkxfTxs9jvjt4E0bKNvbqBXn1tGc=
X-Received: by 2002:a1f:2189:0:b0:3d5:8603:a96f with SMTP id
 h131-20020a1f2189000000b003d58603a96fmr191769vkh.22.1672238681977; Wed, 28
 Dec 2022 06:44:41 -0800 (PST)
MIME-Version: 1.0
References: <20221228100321.15949-1-linux.amoon@gmail.com> <20221228100321.15949-4-linux.amoon@gmail.com>
 <CAFBinCCtJbF6UjG3czQjVy_Zy_B4DO8BkcayOqDirn0OXw3PtQ@mail.gmail.com>
In-Reply-To: <CAFBinCCtJbF6UjG3czQjVy_Zy_B4DO8BkcayOqDirn0OXw3PtQ@mail.gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Wed, 28 Dec 2022 20:14:26 +0530
Message-ID: <CANAwSgTS+j_oRrckwmi60afX6-D=OP0oy05m3eQga_gEZJJ_mg@mail.gmail.com>
Subject: Re: [PATCH v1 03/11] arm64: dts: amlogic: Used onboard usb hub reset
 on odroid c2
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221228_064443_599143_CBD5D89E 
X-CRM114-Status: GOOD (  24.10  )
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

On Wed, 28 Dec 2022 at 18:21, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> Hi Anand,
>
Thanks for your review comments.

> thank you for working on this topic!
>
> On Wed, Dec 28, 2022 at 11:05 AM Anand Moon <linux.amoon@gmail.com> wrote:
> [...]
> > +       usb {
> > +               dr_mode = "host";
> > +               #address-cells = <1>;
> > +               #size-cells = <0>;
> > +
> > +               hub@1 {
> > +                       /* Genesys Logic GL852G-OHG usb hub */
> > +                       compatible = "genesys,usb5e3,610";
> > +                       reg = <1>;
> > +                       vdd-supply = <&usb_otg_pwr>;
> > +                       reset-gpio = <&gpio_ao GPIOAO_4 GPIO_ACTIVE_LOW>;
> > +               };
> > +       };
> My understanding is that the hub@1 node should be part of the
> corresponding USB controller node, not a new node.
> In this case hub@1 should go into the existing &usb1 node. That way we
> describe the way the hardware is set up (meaning: hub@1 is connected
> to &usb1).
>

Ok, I will move this code under &usb0 and &usb1 nodes.

onboard_usb_hub module just assists in usb hub reset.
so these changes are meant to replace the gpio-hog.

$ dmesg | grep onboard
[    5.405558] usbcore: registered new device driver onboard-usb-hub
[    6.383428] onboard-usb-hub 1-1: reset high-speed USB device number
2 using dwc2

Here is the boot log of the odroid c2 [0] https://pastebin.com/PFy5waPb

> In case hub@1 is not detected within &usb1 then you may need something
> like [0] (not tested for your use-case).
> If that helps: feel free to include that patch in your series.
>

Thanks, will check if this is needed in this case. As of now it just
reinitializes the hub.

>
> Best regards,
> Martin
>
>
> [0] https://github.com/xdarklight/linux/commit/d8b96e5bc9c20ab2585194e0e59580c3b062c431

Thanks
-Anand

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
