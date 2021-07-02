Return-Path: <SRS0=mpVK=L2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CF55C07E95
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Jul 2021 19:13:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B644961183
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Jul 2021 19:13:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B644961183
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S0xQcLwMUSP1MISw5PIkzhO3XzrCH241r3C8/CkFHlo=; b=sApQ6L6spp44hY
	7Hd4iOAT1P1xWKSC45favTMlEwBWsknslHTQb78FBc0kXjg6sS1Fy+yI9Orey7k6nRF2TTV25sgBS
	HMmzzsGip1iEWbNN0JK+CQiKXOM092nMh+4Zsv4sfXLkiHJ4kBIBDaYLNCbsZNyK2I0WJTiNJu8XU
	oRv2UJ8sXglXjamRVQAWdiuH/i762sqpnjPfuWRLcooyLjyM9DFPWJiRy3QWyOsKutcbclcK7Wkfx
	IQg7YylQw1+NcL33XwvCw0hhWQ2N01kyUkrgbTlBeQiXxQgJ354iFB3uRR3PvBkvTUmMB8gHiQDeA
	w8jedqQo8g/mfsVplD3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lzObh-003rNG-51; Fri, 02 Jul 2021 19:13:45 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lzObU-003rKS-4R; Fri, 02 Jul 2021 19:13:33 +0000
Received: by mail-ej1-x62b.google.com with SMTP id o5so17777999ejy.7;
 Fri, 02 Jul 2021 12:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LiyPmQuAW3XlG5gYx+V9yk5pkVvqy7w5OWOrUXZV0n4=;
 b=UqPAdZftWYY/hk0t9QGH80VUUUp/cKIvZzpInyllIdYALv7pGWNN6EYb9DX8rcEMfg
 zBT7n0f90YpRpe4pm+sZHhKKiNbjvLF2Nq/+J+hvaxE5/A95hfGWA+eeDj5jVgoO/m/R
 74L7X1Gw0RgCrJthw0yHiT07xHc8pevXDS70DIK35llk81VFruoaOTMo7fCMeCer2Lpf
 i6uzHmj2HWfaG07TPSFMpbjssHiFUmzNMNWgSvuY34IgN0kLn+4ldpmVceLG+M7b27Gq
 Aq1oAHDLJvyN1O3j/YqXAvULs0h9d8I/HOHuhYMzU892zHesxICaEtGgmqNO2si9HoIp
 BfiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LiyPmQuAW3XlG5gYx+V9yk5pkVvqy7w5OWOrUXZV0n4=;
 b=GSCJUN6UZQdcNpcP1HJc0mxqRbZWjIHbbvRqn2/dGZ0M6jdAE9GKla/RC9/ApN3Ui3
 NY/7KRSlU4ioxh9/IFDdMKU/X8mebJYRPd43hoZ1Dv3+oMsB62MdmsjzxVsV6SFW+SfX
 D77yAqWjRMFb5G+dCfvX0z3a7BVNdCNIIcMqF06lXU3oKPPP4QdqN5r3xyzjsA210Trc
 3kHTTUvgsLJbtJsm6EFFxXcrfoKu0G5K2iVp7CVpImnO4nsVSjb+Q3GdMIaR7KTIV19R
 UcxMYzraS04ZHvup24pMPhtG5o8+77RW+SejVVc4TB72lQUn5TzjJi2ZB8vwI0uYm6E0
 nlZQ==
X-Gm-Message-State: AOAM533X08L7JAOZPQSE36WoVCaV5ckJWP2okU7w3W/IQPNrxZDEQHI5
 o5b5JrMHLm5j0HV1RZ3q4GXCuRMaoqW/gCSwzvU=
X-Google-Smtp-Source: ABdhPJx6rCEfImxf0/oDRg3iTiYeiezG2pXiv9sBVa07dhGxSS/k1eVBygBfRjdpHHRbL45t/o9PphKHpVMb00DyKjQ=
X-Received: by 2002:a17:906:2dd5:: with SMTP id
 h21mr1325571eji.522.1625253210735; 
 Fri, 02 Jul 2021 12:13:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210617194154.2397-1-linux.amoon@gmail.com>
 <20210617194154.2397-7-linux.amoon@gmail.com>
 <CAFBinCCE+6G7QtDoxfbcZVVRf-MDX-epSo=_k_PJZgWX+_Whvg@mail.gmail.com>
 <CANAwSgRqixugUr-t2OheLBVwD=EOkaLqxnGkT-Bx=p_A4Nyr8Q@mail.gmail.com>
 <CAFBinCALsnpbJGEb4LBLd_jy3E8fOZAQaacz-P7ijfkeyYg2dA@mail.gmail.com>
 <CANAwSgRABOyWYJPrrw64Wa6j2D94T4tybn7MHGCTbBowt7UncA@mail.gmail.com>
 <CAFBinCD91eYNXSqnmDKoAvJHWqqRbXVjnaq9RuRNCnip9kKqkw@mail.gmail.com>
 <CANAwSgRzY+699aSS9MVGAJYVR6_0Ni75JPhO9=LKunHQK0p=oA@mail.gmail.com>
 <CANAwSgQktfn9Q=PJhx5Uq0UQ2dHqJwjKu1RWyb2k=-dA9=+BSQ@mail.gmail.com>
 <CAFBinCD+seUuYUrObiqJNgEi_DaULB3nU+QQFHz9d85dAU06ZA@mail.gmail.com>
In-Reply-To: <CAFBinCD+seUuYUrObiqJNgEi_DaULB3nU+QQFHz9d85dAU06ZA@mail.gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Sat, 3 Jul 2021 00:43:19 +0530
Message-ID: <CANAwSgSfzwYTtAFeKSxGUW=rtON42AObrXGsRTb31WevFKJQLA@mail.gmail.com>
Subject: Re: [RFCv1 6/8] phy: amlogic: meson8b-usb2: Use phy reset callback
 function
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 linux-phy@lists.infradead.org, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-amlogic@lists.infradead.org, 
 Linux Kernel <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210702_121332_215147_17E4FD80 
X-CRM114-Status: GOOD (  23.99  )
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

On Mon, 28 Jun 2021 at 01:55, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> Hi Anand,
>
> On Sun, Jun 27, 2021 at 10:07 PM Anand Moon <linux.amoon@gmail.com> wrote:
> [...]
> > Sorry for the delay.
> > We could switch the reset logic to
> > *devm_reset_control_get_optional_exclusive* as below
> > to fix the reset line, since both the dwc2 c90c0000.usb and c9040000.usb
> > will have their own context to reset control register, it means the
> > reset line is not share
> > between two USB PHY nodes.
> This is something I don't understand.
> As discussed in our previous mails reset_control_reset in case of the
> USB PHY driver (which uses the RESET_USB_OTG reset line for *both*
> PHYs) is equivalent to the following code in the vendor kernel:
>   aml_cbus_update_bits(0x1102, 0x1<<2, 0x1<<2)
>
> We have two PHYs but only one reset line. So in my own words I
> describe the reset line as being shared.
>
> >
> > -       priv->reset = devm_reset_control_get_optional_shared(&pdev->dev, NULL);
> > +       priv->reset = devm_reset_control_get_optional_exclusive(&pdev->dev,
> > +                                                               "reset");
> Have you boot-tested this?
> Without any .dts changes this will return NULL because there's no
> reset-names = "reset"; in the .dts(i).
> If you replace "reset" with NULL then I assume that the second PHY
> will fail to obtain the reset line because it's shared between two
> devices but we're trying to obtain it exclusively for both (PHYs).
>
Thanks for your review comments.

I have always tested with both the phy enable and with proper DTS changes.
Yes, it gives false-positive results while initialization of the USB PHY.
Odroid C2 it will pass but on Odroid C1 it will fail kid off.

But it seems to me that the order of the PHY reset is kind of a problem.

Thanks for looking into my changes.
>
> Best regards,
> Martin

Thanks
-Anand

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
