Return-Path: <SRS0=HsQz=GJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8071BC433DB
	for <linux-amlogic@archiver.kernel.org>; Wed,  6 Jan 2021 02:36:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2893422CB9
	for <linux-amlogic@archiver.kernel.org>; Wed,  6 Jan 2021 02:36:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2893422CB9
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CFbphLpisXSkMECe0wBUYCaem4ov9kuNXFHnSQvmxi8=; b=dQFmLDI/r02+pJkD3AVYCj9M9
	1Pu2RP7sKxVpZjDYtCix0sAfziBI5l2PfSLbOWQgHWcajlt9UrgbzoRBFQIY5l7AXf7+8frTwKKw5
	vHqFUveB2qSm0bGZD3nAI4oDngCanBftWlk4wU0Lkmjnqq7xpSqttJyPp3gqa5AFFm0DDJCNfJGYF
	A/Yx4HuIvEWYNQLtHHA+8mQjbADjB3isIu7u7KT+IplRUBIP0MBpzdZvL1DUKMQygYwn023hyZjNP
	mgKvZqiKLB7DlTm4tVrlS0nBrkaSmc4d+juKk1kBKDHGN57T1bkObuanARnQmJfhRE0RmLW+uSFPy
	FrQaErg5Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwygH-0008EA-LM; Wed, 06 Jan 2021 02:36:13 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwygF-0008DI-NJ; Wed, 06 Jan 2021 02:36:12 +0000
Received: by mail-ed1-x530.google.com with SMTP id b73so2921320edf.13;
 Tue, 05 Jan 2021 18:36:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bsBv85TTm4bgmfYBTRiSlgurbvsoPr/alhSs5wTQ52c=;
 b=e24RhaxnHw3+cr9cGGVan/vH+w0VN606TrjGMOxFrDO81s9DQ2DGwpb170/u+doflG
 WmTrDT6vTHh1hjO+318B9fsTAP37fFEnQ+O6LsxeZc6rP3ub6O76EjNRiduaGUPmuynP
 JSIAdFlLl1VUBxTq3DPAi7JAkDpuUGUQ7VO/EQaXmGtouRHsPKrSSCjp77bSZTdnhHXH
 dgl95XbpDhL0G28w62zpb6vvyegg+bGltGeqUWuICAmzPah/L3oetBLPFe9tcXmKXrQQ
 juE+Zdlkw/EwZQMZ4TU2BHz4OesOEggqpSC0E8QXk445mY1NUYGdkKUNeABoGEFay0Y0
 fscA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bsBv85TTm4bgmfYBTRiSlgurbvsoPr/alhSs5wTQ52c=;
 b=iiqAWaCQwRilMxZO0znQqeHwv+/zCTtvv8IH9UuxmaaXxl9F88qI2XIboP8m080q1u
 mC0HPKnjGVomajg7pxQHkgsItMDgpb60iFoG5axul2btFE7Bw4WE5GTxWp6GCM9VyN6W
 +mvSopYYHhSr7ZBtvFzYNk0Y5dakXYfvsKaW42uNrjJEuXWKz2J+CwFSuK/hVB1nfDse
 KQjUQcFihGEf8bXnCpTSpB0zz25tozjXu/iDIqHaWYXy8Y3uGRT8jvo3/MWyMS8nXB8M
 Hsi/u81tbqzIqDOvX4PNpHy1Z39XCRdnGM3RAOeyFTGejQpcBjWHyWTO25HXIOem1/S/
 Gc+w==
X-Gm-Message-State: AOAM533BJb9YD9BEzwdRlrq+fmOj+0Vb8PfQoOQxsfOSAJoHU+7Emeba
 OOlnj4PNNUUh/4C67zHs2FVEECf+0SchVhIKMMc=
X-Google-Smtp-Source: ABdhPJwxX9TWwIJFOsXAtq6lI8P07T6o74sKnQuOfsPo8Stl+MMSuybZBfFt/7RA4thtxmuzgxJ1Yj7oink8/xFF1fQ=
X-Received: by 2002:a50:fd18:: with SMTP id i24mr2549874eds.146.1609900568600; 
 Tue, 05 Jan 2021 18:36:08 -0800 (PST)
MIME-Version: 1.0
References: <CAFBinCA4EnbJZ5HnWzqP-LdLJE0FD_nGqA6PxdQaR5KfETgvTQ@mail.gmail.com>
 <57a65a09-606a-8773-e1ff-4202e83779c8@baylibre.com>
In-Reply-To: <57a65a09-606a-8773-e1ff-4202e83779c8@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 6 Jan 2021 03:35:57 +0100
Message-ID: <CAFBinCAxWfUjFvL8xqxPZLGcA2UeqBb-2zqYEf5TVX_yQi-hFg@mail.gmail.com>
Subject: Re: discussion: re-structuring of the Amlogic Meson VPU DRM driver
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210105_213611_793640_42F0E529 
X-CRM114-Status: GOOD (  50.54  )
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, daniel@ffwll.ch,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Neil,

On Mon, Jan 4, 2021 at 2:29 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Hi,
>
> Sorry for the delay...
>
> On 31/12/2020 00:24, Martin Blumenstingl wrote:
> > Hi Neil and all interested people,
> >
> > in the past there were concerns about how some of the components are
> > coupled in our Meson DRM driver(s).
> > With this discussion I would like to achieve four things:
> > 1. understand the current issues that we have> 2. come up with a TODO list of things that need to be tackled as well
> > as recommendations how to solve it (for example: "driver ABC function
> > ABC uses the recommended way - take that as reference")
> > 3. one by one work on the items on the TODO list
> > 4. add support for the 32-bit SoCs to the Meson VPU DRM driver
> > (without adding more "not recommended" code)
> >
> > Disclaimer: I am not familiar with the DRM subsystem - so apologies if
> > the terminology is not correct.
> >
> > drivers/gpu/drm/meson/meson_dw_hdmi.c currently serves four purposes:
> > 1. manage the TOP (glue) registers for the dw-hdmi IP
> > This is Amlogic specific and consists of things like HPD filtering,
> > some internal resets, etc.
> > In my opinion this part is supposed to stay in this driver
> Yep, it's tightly coupled to the DW-HDMI core
>
> >
> > 2. load the driver for the dw-hdmi IP by calling dw_hdmi_probe()
> > I read somewhere that this is not recommended anymore and should be replaced.
> > Is my understanding correct and what is the recommended replacement?
> Yeah in fact the dw-hdmi glue should be a pure bridge, not a component anymore.
>
> This means it should probe by itself entirely, should not use the component stuff.
OK, I see

> This also means all the VPU related part (mainly encoder and clock) should be moved
> out of this file as a bridge and built with the meson_drm driver,
> then find the "next bridge" like other drivers.
is that linkage automatically set up with the endpoint definitions
inside the .dts?

> > 3. it manages the HDMI PHY registers in the HHI register area
> > For the 32-bit SoCs I will not follow this pattern and will create a
> > separate PHY instead.
> > As a long-term goal I think we should also move this into a dedicated
> > PHY driver.
>
> I looked at it, and ... it's complex. For the 32-bit socs it's easy because
> you only have a single PHY setup, for the new gens you have to deal with the
> 4k modes and co. This could be handle by adding a new parameters set to the
> phy_configure union, but what should we add in it to be super generic ?
you are right, on the 32-bit SoCs it's pretty easy actually.
it's only "4k" and "everything else".

I think using the phy_configure approach is the right way
but to be honest: I have not thought about which parameters to add to
that union (for the 64-bit SoCs) to make it "generic" enough
also I think this is a TODO "for later", so no action needed now - but
it's great to see that you had the same idea in mind :)

> >
> > 4. call back into VPU/VENC functions to set up these registers
> > This is a blocker for 32-bit SoC support as I would have to duplicate
> > this code if we don't make any changes. This includes things like
> > calculating (and setting) clock frequencies, calling
> > meson_venc_hdmi_mode_set for setting up the DVI pixel encoder, etc.
> > My understanding is that this part should not be part of the
> > meson_dw_hdmi driver, but "some other" driver. I don't understand
> > which driver that's supposed to be though and how things would be
> > wired up in the end.
>
> Yep it should be a bridge. You can chain bridges, it's designed for such use case.
>
> We will have internal bridges for encoders, ENCL+ENCP grouped for HDMI and ENCL.
I see. adding to my question above: would this mean that we have then
more "endpoints" defined in our .dts - one for the ENCI+ENCP (HDMI)
output, another one for the ENCL (DSI), ...?

> CVBS can be handled separately without bridges.
indeed, let's postpone CVBS for now as it's easy to adapt the current
code for the 32-bit SoCs.
in a perfect world I think the CVBS encoder/bridge (whatever the
correct type is) would be it's own driver as it's part of the HHI
registers

> I can have a try to move stuff if you can review/test on your side.
> Would it be a good start ?
that would be awesome
if there's any way I can help (you add FIXMEs/TODOs to your code which
you want me to solve, testing, etc.) then please let me know!

> >
> > In addition to HDMI my understanding is that for adding MIPI DSI
> > support you would
> > a) either have to follow the pattern from the meson_dw_hdmi driver or
> > b) also require some better way to achieve this
>
> With the cut I described before, we'll need a add a simple ENCL bridge
> in meson_drm and a standalone bridge for dw-mipi-dsi.
that sounds like we don't need to duplicate any code which would be great

> >
> > The biggest question marks for me are #2 and #4 from the list above.
> > Also is there anything I have missed?
> > Any input, feedback and questions are welcome!
> >
> > PS: an additional topic on the TODO list will be "use the common clock
> > framework" for clock setup. it's currently not clear to me if that's
> > possible on the 64-bit SoCs in all cases.
>
> It's the same issue for 4k & co, the high freqs needs special PLL settings,
> not sure how this would be easily doable in the PLL driver.
> We may need to add a gx/g12 HDMI specific pll driver.
the PLL settings are unfortunately also not very easy for the 32-bit SoCs.
but let's have this discussion at another time, I think that changing
the drm driver structure can be separate from this.


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
