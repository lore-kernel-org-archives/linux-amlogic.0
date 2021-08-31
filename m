Return-Path: <SRS0=FHOR=NW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA7C8C432BE
	for <linux-amlogic@archiver.kernel.org>; Tue, 31 Aug 2021 20:48:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 802AF60ED4
	for <linux-amlogic@archiver.kernel.org>; Tue, 31 Aug 2021 20:48:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 802AF60ED4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YQWbY645qUUpBWKXfYEeA3KYgxDcnEJpJocl7MO+ZEo=; b=Z/SmQaJinV6Orz
	hUStD5B5PVfh+kZm6K+HZSOitGQ0s2gXnLRYhmlSHuA1OZMzWAZjmCbvIa6++mQXupMm6pV+KGxyD
	lhGPKuO/BmdoI3ijtlDfAWvyMjleWZFsbKDDGyUc/twidRv/rxfqRehC5lBDwuwf7DyKKP9W+hDVA
	V5ptMnmJfwgcaGuZu645J6uIxCb082qY4hLe0E+7iw7FoHEnyyt4Hq+EjgAYGeaNO+Y1gCmFflh2Y
	VSAIAg4STaJaVcPOhw7tabMXF4lipz34lT2ZvH96WHBLEeQiJfdIreTpN4WsemqG3xUMiwugtYiHv
	aI95Bcq/DFpMTiT1KAkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLAgP-00399j-H8; Tue, 31 Aug 2021 20:48:37 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLAfx-00394Y-RJ; Tue, 31 Aug 2021 20:48:13 +0000
Received: by mail-ed1-x52f.google.com with SMTP id q17so524593edv.2;
 Tue, 31 Aug 2021 13:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PukLxj8PF44hPfPZSax4F6FSnHNWQbfJmpSj2w22I78=;
 b=Xiuk9zA30NMWF8XhrbeTJPEl62/se/94IUtFgYD5W4nLHJ48vY5U7IJjWmtKVC3w1t
 o0AznnrBYn7L2lyG+Cqhqcrk6jhGtnHIQZB2YroQsrpO3GQMPOzAj/yna7wxPnJdPEPy
 qlnlFTNeTdfhHQutlVrf4xVLfCPiHbpUl39ebItWilCFor0DBvFTL7RqQqZNiSEEwDhn
 PCR1hOTGR9P6Zr/SkzzZRwnm/tJwF9GCdjQO9jDgrHNzIBF94Damn5s5Sa/Ve2Phc1YG
 DvM5FBHDhBxeUmguDyzpuTjy3TRFCn5Qdc+YrgKJjXLxxj+xNYEGcxtkB3UIzD78SuDm
 XZHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PukLxj8PF44hPfPZSax4F6FSnHNWQbfJmpSj2w22I78=;
 b=R/DqcrZgzdv3NAmsRu7tvXuGAfKqE6ccWStYCBa6Uj1t+zKoxiSwCjFT3q0s8dtIM5
 KvI1R34ligJ3vJBkPyVu/dziO/ay6f5uamhscwJo3bvQkogj4AZL0Pos/sMVvLADtSep
 Xk0gaXA6jSxYmiPLYG/CYlqUiCSJZIlYNvQ5gHicJ1BSv2PCUESvfE3GqR9+bsjiq+pS
 Nzs2Lyu5KwFqwPTpHT/FF5L9OxxeiO8WFRtATNZrRhki2ek1hxbOYmaQ5Sql9iOGUa65
 PNxNF2ZxCBqKp5KDow2nwX68jon0rY7UuLp2YX95c+WioTak6MyfSdEqaiUUZfAIg3rU
 SB9g==
X-Gm-Message-State: AOAM530Rkw7d85+QZFVJnrM3N/DoTe+uV3FDA1HNCQ+PodUzcCIPmwPK
 3kXisUPqLP3m2I5tssHxABcbljZr55COHYObCFfIN1xG
X-Google-Smtp-Source: ABdhPJyNzcwfdq3eKJsOgi3wlcy3jJWKnEhkHouSu9RoNQ1aKGfQSX/1suN1mGAqKGoQHXilkSjWxYdx/ZEM2Z+dWlI=
X-Received: by 2002:a50:e699:: with SMTP id z25mr31279466edm.130.1630442887231; 
 Tue, 31 Aug 2021 13:48:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210817041548.1276-1-linux.amoon@gmail.com>
 <20210817041548.1276-2-linux.amoon@gmail.com>
 <c7f6213b-5ddc-881c-1aea-9cc7b03e6a4f@baylibre.com>
 <CAFBinCBeNMET2tvH0h6HF3dR+xBb59hifQyaoXigUs3UGkS+KQ@mail.gmail.com>
 <2b07b3de-cee5-c570-8fde-6a4c684122d6@baylibre.com>
In-Reply-To: <2b07b3de-cee5-c570-8fde-6a4c684122d6@baylibre.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Wed, 1 Sep 2021 02:17:54 +0530
Message-ID: <CANAwSgRNp8UtU+Yy4smwZ5POTWTU+xN1mrf_cH7Pu9yX5HU=VA@mail.gmail.com>
Subject: Re: [PATCHv3 1/6] ARM: dts: meson8b: odroidc1: Add usb phy power node
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-phy@lists.infradead.org, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-amlogic@lists.infradead.org, 
 Linux Kernel <linux-kernel@vger.kernel.org>,
 devicetree <devicetree@vger.kernel.org>, 
 Matt Corallo <oc2udbzfd@mattcorallo.com>, Rob Herring <robh+dt@kernel.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, 
 Emiliano Ingrassia <ingrassia@epigenesys.com>,
 Brian Kim <brian.kim@hardkernel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210831_134809_947931_BEBC57B6 
X-CRM114-Status: GOOD (  35.71  )
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

Hi Neil / Martin,

Thanks for your review comments.

On Tue, 31 Aug 2021 at 20:20, Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Hi,
>
> On 30/08/2021 21:37, Martin Blumenstingl wrote:
> > Hi Neil,
> >
> > On Mon, Aug 30, 2021 at 9:45 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
> >>
> >> Hi,
> >>
> >> On 17/08/2021 06:15, Anand Moon wrote:
> >>> Add missing usb phy power node for usb node fix below warning.
> >>> P5V0 regulator supply input voltage range to USB host controller.
> >>> As described in the C1+ schematics, GPIO GPIOAO_5 is used to
> >>> enable input power to USB ports, set it to Active Low.
> >>>
> >>> [    1.260772] dwc2 c90c0000.usb: Looking up vbus-supply from device tree
> >>> [    1.260784] dwc2 c90c0000.usb: Looking up vbus-supply property in
> >>>               mode /soc/usb@c90c0000 failed
> >>
> >> First of all, DT is not here to fix boot message.
> > Anand mentioned elsewhere that this is a debug/info message
> >
> >> Finally, I looked at the Odroid-C1 schematics and the GPIOAO.BIT5 is an input
> >> to the S805, and the PWREN signal is controlled by the USB Hub so this regulator
> >> should not be added at all.
> > I think there's a misunderstanding because there's two PWREN signals
> > with different meanings.
> > The PWREN signal for the USB host ports is hard-wired and not
> > connected to the SoC at all.
> > The PWREN signal for the Micro-USB port (which Anand is adding here)
> > is controlled by GPIOAO_5. odroid-c1+_rev0.4_20150615.pdf [0] shows it
> > as an input to "USB_OTG" on page 1. "USB_OTG" consists of a power
> > switch and the connector itself as shown on page 28.
> >
> > Personally I think that the change from Anand itself is good.
> > If you feel otherwise then please speak up.
>
> Ok thanks for the clarification, then the change is ok, but not the commit message.
>
> >> Add missing usb phy power node for usb node fix below warning.
>
> is not a good reason for a DT change. A proper reason should be added.
>
> And the commit message doesn't specify the change is for the Micro-USB port,
> this should be clarified.
>
> Neil
>
> > As I pointed out three smaller changes I am hoping that Anand will
> > re-send the updated patch anyways. At that point he can also add the
> > changes from your feedback.
> >
Ok I will try to address your feedback in the next version.

After enabling CONFIG_REGULATOR_DEBUG, with this patch applied
I still not getting the USB regulator to enable.
Do you see different output at your end?

On Odroid C1+
[    5.737571] reg-fixed-voltage regulator-usb-pwr-en: GPIO lookup for
consumer (null)
[    5.737630] reg-fixed-voltage regulator-usb-pwr-en: using device
tree for GPIO lookup
[    5.737711] of_get_named_gpiod_flags: can't parse 'gpios' property
of node '/regulator-usb-pwr-en[0]'
[    5.737906] of_get_named_gpiod_flags: parsed 'gpio' property of
node '/regulator-usb-pwr-en[0]' - status (0)
[    5.738209] gpio_stub_drv gpiochip0: Persistence not supported for GPIO 5
[    5.738490] USB_OTG_PWR: 5000 mV, disabled
[    5.740313] reg-fixed-voltage regulator-usb-pwr-en: Looking up
vin-supply from device tree
[    5.740394] USB_OTG_PWR: supplied by P5V0
[    5.741235] reg-fixed-voltage regulator-usb-pwr-en: USB_OTG_PWR
supplying 5000000uV

Odroid N2.
[    3.047813] reg-fixed-voltage regulator-hub_5v: HUB_5V supplying 5000000uV
[    3.049282] reg-fixed-voltage regulator-usb_pwr_en: GPIO lookup for
consumer (null)
[    3.049305] reg-fixed-voltage regulator-usb_pwr_en: using device
tree for GPIO lookup
[    3.049370] of_get_named_gpiod_flags: can't parse 'gpios' property
of node '/regulator-usb_pwr_en[0]'
[    3.049500] of_get_named_gpiod_flags: parsed 'gpio' property of
node '/regulator-usb_pwr_en[0]' - status (0)
[    3.049622] gpio_stub_drv gpiochip0: Persistence not supported for GPIO 22
[    3.049759] USB_PWR_EN: 5000 mV, disabled
[    3.051257] reg-fixed-voltage regulator-usb_pwr_en: Looking up
vin-supply from device tree
[    3.051320] USB_PWR_EN: supplied by 5V

Thanks
-Anand



> >
> > Best regards,
> > Martin
> >
> >
> > [0] https://dn.odroid.com/S805/Schematics/odroid-c1+_rev0.4_20150615.pdf
> >
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
