Return-Path: <SRS0=yQOf=LQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5A8DC2B9F4
	for <linux-amlogic@archiver.kernel.org>; Tue, 22 Jun 2021 20:12:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A500B6109E
	for <linux-amlogic@archiver.kernel.org>; Tue, 22 Jun 2021 20:12:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A500B6109E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KrG3it1zPypt+plcFNAIpPlSQMNG0serpMsqHyFXDhY=; b=hMmhm2fkFQs4+O
	rkGU/fDDZT+zaY9Q/kbWcRnkV4WMvDjZqhFEfMFPCiLXycZ4TVODe3IQWYDKbRj9G2wUWXqW87BpJ
	dYcVOefnDWMeAuXdJZ2R4T6UyKqgRCUH+sMfI48qnhqoK4grihate1iaCfbupPo8YrFVJW6OE/xRC
	fghSQ2xrb52scQD7hBKR0/SUcsfy9k0gYKrAmr8YP0G1G5HLMgnRzuq7Zo+2BUOZu9XVtLFBsaH04
	3es7Qv5EEShtqZ+2HT+3101Fg9qWDOc0nIgu/Lx0geyMDpxjAcBeG+STJWDjqlgyH1tmuD2dzEXqw
	gHanQGf//tpFMDUzuSkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvmkz-008KHY-Er; Tue, 22 Jun 2021 20:12:25 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvmkh-008KED-Vl; Tue, 22 Jun 2021 20:12:09 +0000
Received: by mail-ed1-x533.google.com with SMTP id s6so396821edu.10;
 Tue, 22 Jun 2021 13:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=x32YDuCNYMIMWiusaAMc7PppyDkWuVh9XTNpn/BCcpQ=;
 b=BVWcNCtQ4is0MBgfGJQ+u0YjZxicJsGPzkwdc9vxUNSbSFWNcKLZw9aS8L9VTwoMng
 5wVZHg0BjK1WPhnEpuCI0f/oVS0iBoem0SRuYCxn/sw43fqs2GlFa+851hEpIABucYSp
 NGLRq3KJK8C1J+p3Z0iBqqC48GwvlcAje6NdaafN24SAbViQQ73uZrM4r+JAoIX26/mK
 /lCdftyAfcYiJUDaGm1aFDYfktGqPbJMRofn7i9EEeRjucyQRTbsLpKwVr7jrIrNe+VF
 fOLRAMsgWTJxZtSChOqRG1V73VsWlrXfOSu9u6DvouSU9pQJOsqX9zw7+Fve/RRej9QS
 A5AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=x32YDuCNYMIMWiusaAMc7PppyDkWuVh9XTNpn/BCcpQ=;
 b=OTRMTGw0QMfucdCQjfJkSn3AU3Jo35bPDNbCz/hdUltYyl+0WrqphcNpdLVa/jj+WA
 bYJ7Ru3baGW/H0sOcVBczMIwv0LcrqerWcNWh/vfGImoTUr1Xqq2RIWZRphV4WHeBWAe
 mMGLIVghqUKyEmxuF6mgfL7xk4JxluS1CLssGha3gGX4x0986rqnEP29BKTDdhbvaDUA
 u+l606hwEWanYdzjlIm6cJc1VAde36pe+lryhb/ck/oqgYpQnQgHUsgxba5d015SDOgx
 ndj1BiRSKhM/6M4tS0akkkPSy1ajTk/kycLtT68t+MWElD97xXvQunerEMjQk92RnooR
 U0cQ==
X-Gm-Message-State: AOAM533e5p1AIPxooODZHdypgYn+wycZQewa3KUcgNY5urnzdXk6f4Gd
 k8IHv226ZYh/UD8cChEcoBX5KdhIQk0Z9IeTSF0=
X-Google-Smtp-Source: ABdhPJxzgiSFYuAF6bcGf2ZGpBCK4YxwOEs6nOAZgcWJxDPcDT203mzVcUzx3TCooP4yABmGdttrQ+s/KNqNmrNKgNE=
X-Received: by 2002:a05:6402:2694:: with SMTP id
 w20mr7479552edd.287.1624392726470; 
 Tue, 22 Jun 2021 13:12:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210617194154.2397-1-linux.amoon@gmail.com>
 <20210617194154.2397-7-linux.amoon@gmail.com>
 <CAFBinCCE+6G7QtDoxfbcZVVRf-MDX-epSo=_k_PJZgWX+_Whvg@mail.gmail.com>
 <CANAwSgRqixugUr-t2OheLBVwD=EOkaLqxnGkT-Bx=p_A4Nyr8Q@mail.gmail.com>
 <CAFBinCALsnpbJGEb4LBLd_jy3E8fOZAQaacz-P7ijfkeyYg2dA@mail.gmail.com>
 <CANAwSgRABOyWYJPrrw64Wa6j2D94T4tybn7MHGCTbBowt7UncA@mail.gmail.com>
In-Reply-To: <CANAwSgRABOyWYJPrrw64Wa6j2D94T4tybn7MHGCTbBowt7UncA@mail.gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 22 Jun 2021 22:11:55 +0200
Message-ID: <CAFBinCD91eYNXSqnmDKoAvJHWqqRbXVjnaq9RuRNCnip9kKqkw@mail.gmail.com>
Subject: Re: [RFCv1 6/8] phy: amlogic: meson8b-usb2: Use phy reset callback
 function
To: Anand Moon <linux.amoon@gmail.com>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 linux-phy@lists.infradead.org, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-amlogic@lists.infradead.org, 
 Linux Kernel <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210622_131208_107969_D9F6BFBD 
X-CRM114-Status: GOOD (  21.31  )
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

On Mon, Jun 21, 2021 at 9:16 AM Anand Moon <linux.amoon@gmail.com> wrote:
[...]
> Ok Thanks for the inputs. got your point.
>
> I was also looking into Amlogic source code for reset. (aml_cbus_update_bits)
> [0] https://github.com/khadas/linux/blob/khadas-vims-4.9.y/drivers/amlogic/usb/phy/phy-aml-new-usb.c
> is there some feature to iomap the USB with cbus?
for that specific code: that's what we do inside drivers/reset/reset-meson.c
Amlogic's vendor kernel uses an increment of 4 bytes per value, so
0x1102 translates to 0x4408

then in mainline's meson8b.dtsi we have:
    compatible = "amlogic,meson8b-reset";
    reg = <0x4404 0x9c>;
as you can see 0x4408 is part of the reset controller node.

next in include/dt-bindings/reset/amlogic,meson8b-reset.h we have:
    #define RESET_USB_OTG                 34

the register used for reset line 34 is translated using:
    0x4404 (first register) + 4 (4 * reset line / 32 = 1) = 0x4408
then the bit inside this register is translated using:
    reset line % 32 = 2

that's how we express aml_cbus_update_bits(0x1102, 0x1<<2, 0x1<<2); in
the mainline kernel (by going through the reset subsystem)

[...]
> > > > > -       priv->reset = devm_reset_control_get_optional_shared(&pdev->dev, NULL);
> > > > > +       priv->reset = devm_reset_control_get_optional_shared(&pdev->dev, "phy");
> > > > I think this breaks compatibility with existing .dtbs and our
> > > > dt-bindings (as we're not documenting a "reset-names" property).
> > > > What is the goal of this one?
> > > >
> > >
> > > OK, If we pass NULL over here there is the possibility
> > > USB phy will not get registered.
> > I don't understand why - with NULL everything is working fine for me.
> > Also no matter which name you give to the reset line (in reset-names),
> > it will be the same reset line in all cases. If it's the same reset
> > line before and after: why is this needed?
> >
> I need to investigate this reset feature. With my setup with current changes
> after I update the below.
> -       priv->reset = devm_reset_control_get_optional_shared(&pdev->dev, "phy");
> +       priv->reset = devm_reset_control_get_optional_shared(&pdev->dev, NULL);
>         if (PTR_ERR(priv->reset) == -EPROBE_DEFER)
>                 return PTR_ERR(priv->reset);
>
> Reset will break the USB initialization, see below output.
interesting, I have not seen that USB problem before and neither is
Kernel CI seeing it: [0]
Is it only happening with this patch or did you also see it before?


Best regards,
Martin


[0] https://storage.staging.kernelci.org/next/master/next-20210617/arm/multi_v7_defconfig+ltp-ima/gcc-8/lab-baylibre/baseline-meson8b-odroidc1.html

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
