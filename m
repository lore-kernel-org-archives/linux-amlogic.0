Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55F5FC54EBD
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Jan 2023 18:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2mGhgygDP/rugsMGapQ/aqftJPFAujMHz9j72S/qB48=; b=PI9Q3Mv/asbWrc
	700FfBkOK4M/q9U0BGMk7akFKUODSCDtEXX5i6gSk1Rwp6FU/faCnTLcGfHS1xUWtyqiwKL/o2WJH
	StNIsBpJwOgX+842KIZyj3Vgd7SIAleDS1A4f8aM2uFJohjUxp0dNJ3bcqDX5slMADhg7hunxHfnD
	f4NXRnEJF1jQCsTHI7NUzYj1Ktcq3SEVPgMBHXwBi5MELM1IhETGyWtjMGZPgC/9AToLHAZ8emQ8x
	/gqTj997L0ZQlWgXgouDcQV9MnesKhBxZ6Y+cSfXGb0M/HhwZhebqVy6OCnUmItJBMNvbRMpUmzdh
	Ea3A+3dtWXfTYWJyIouQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEx5l-003NeV-Kl; Mon, 09 Jan 2023 18:41:53 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEwvM-003JC0-FE; Mon, 09 Jan 2023 18:31:10 +0000
Received: by mail-wr1-x429.google.com with SMTP id bn26so9164745wrb.0;
        Mon, 09 Jan 2023 10:31:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SXXAJ3DUbtkoovXuYo+KyTb41EHZPfFvK143Ru7TRh0=;
        b=Y3YgV25OfF4n3rHemKxGZcfAeio40Dp6qtvOjQWf913+9nWH4KqVyHdHIkMkUsAwXG
         93CXGcSSc6sfg5XBZJ59/TRBU/9vyU3+m6ECVJFZliFy4OOw37gA/swtHHzS46FmyYtO
         2kaPopgHHI8DZIFkD2sqHY1FZhHGfgeF5u92IDOtcoCrKiefVUZAgBDI7o2pQOXPJ+Xb
         cqUX0qfSTCRgoGVFyPlYlbRY7FDuwtfqCKa4UCJgkJurzhyAOsCefsf/nt8FXdd5/qqS
         r4jRzTw9IGfuVnNp06Bqd6jb//rWFYDqTkSPfYnfcZDZh8Hbtc1hN3JevPbwvxiTs25I
         2c4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SXXAJ3DUbtkoovXuYo+KyTb41EHZPfFvK143Ru7TRh0=;
        b=lP0HHlrqeCdtC4Ji568wh3qi0I22zdEVNCUJxOwu0CaSDaQTofyl2Ss1jMwvJlbAck
         Z3WHqUxuvBbyoF38QD+zytSrZMc2S5eo9B2dhNuEvC5XrAbySzTsU+dL/e3cS+0CgXAS
         YZRrStR8IPGx3UsE6f/nvlT/SKkHeiFgdciH4Zq8yMzp9IHKEzD7zuxLeu5dYCKHSZmN
         GKMS5VO85qsS71wZB4yA0H8Kacsz2k/UD6YWxEAO+zZ1eZhJUMa++g1+mRDJGK1Ffuqz
         fQFift+/YcpM5mPU20STE4yFOeeEt004YLLmJ5Y9Lte/L5sSvCCzqo5v9J/eCiZG6p+d
         VSUg==
X-Gm-Message-State: AFqh2kpdpjNzMI5qOFIg687eh07joztGTu9OVCFzUlNeCu03SM8uBjgZ
	2tIzCszRpyOVLP9sFvOTy8g2TIF3TH7BBqBYlzQ=
X-Google-Smtp-Source: AMrXdXscfKc2XlHhJGkSUt354hzYjXoSXX7udzIPMG3m4dLRRzySFvVOTt7lnZdOtk3U1hQBc413+xKD/FpirX0yc24=
X-Received: by 2002:a5d:6451:0:b0:28b:905d:a0b5 with SMTP id
 d17-20020a5d6451000000b0028b905da0b5mr1043980wrw.451.1673289065282; Mon, 09
 Jan 2023 10:31:05 -0800 (PST)
MIME-Version: 1.0
References: <df0096b5aea2a18d1540cde379c5abf589ccd7c4.1669799805.git.mazziesaccount@gmail.com>
 <CGME20230109134646eucas1p17c7fbd379b0301b8429278ff289f2e83@eucas1p1.samsung.com>
 <6c865dd8-b6c3-4491-48ca-df3e3fa45a2d@samsung.com> <0ef85cba-fa9b-6d72-ca44-48c4d6cf2752@linaro.org>
In-Reply-To: <0ef85cba-fa9b-6d72-ca44-48c4d6cf2752@linaro.org>
From: Matti Vaittinen <mazziesaccount@gmail.com>
Date: Mon, 9 Jan 2023 20:30:54 +0200
Message-ID: <CANhJrGPbFo=v=G-HbbpHgCkT2fSmFTE43o4OzoVSOK66e5ZLrg@mail.gmail.com>
Subject: Re: [RESEND2,v4,2/2] drm/meson: dw-hdmi: Use devm_regulator_*get_enable*()
To: neil.armstrong@linaro.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, 
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Kevin Hilman <khilman@baylibre.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230109_103108_641387_9E93EA33 
X-CRM114-Status: GOOD (  26.26  )
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

Hi Marek & All,

ma 9. tammik. 2023 klo 17.23 Neil Armstrong
(neil.armstrong@linaro.org) kirjoitti:
>
> On 09/01/2023 14:46, Marek Szyprowski wrote:
> > Hi Matti,
> >
> > On 30.11.2022 10:23, Matti Vaittinen wrote:
> >> Simplify using the devm_regulator_get_enable_optional(). Also drop the
> >> now unused struct member 'hdmi_supply'.
> >>
> >> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
> >> Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> >> ---
> >> v4 resend 2:
> >> Respinning unchanged code with the commit title changed as wa suggested
> >> by Robert Foss and commit message changed as was suggested by Martin.
> >>
> >> I am doing a clean-up for my local git and encountered this one.
> >> Respinning as it seems this one fell through the cracks.
> >> ---
> >>    drivers/gpu/drm/meson/meson_dw_hdmi.c | 23 +++--------------------
> >>    1 file changed, 3 insertions(+), 20 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> >> index 5cd2b2ebbbd3..7642f740272b 100644
> >> --- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
> >> +++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> >> @@ -140,7 +140,6 @@ struct meson_dw_hdmi {
> >>      struct reset_control *hdmitx_apb;
> >>      struct reset_control *hdmitx_ctrl;
> >>      struct reset_control *hdmitx_phy;
> >> -    struct regulator *hdmi_supply;
> >>      u32 irq_stat;
> >>      struct dw_hdmi *hdmi;
> >>      struct drm_bridge *bridge;
> >> @@ -665,11 +664,6 @@ static void meson_dw_hdmi_init(struct meson_dw_hdmi *meson_dw_hdmi)
> >>
> >>    }
> >>
> >> -static void meson_disable_regulator(void *data)
> >> -{
> >> -    regulator_disable(data);
> >> -}
> >> -
> >>    static void meson_disable_clk(void *data)
> >>    {
> >>      clk_disable_unprepare(data);
> >> @@ -723,20 +717,9 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
> >>      meson_dw_hdmi->data = match;
> >>      dw_plat_data = &meson_dw_hdmi->dw_plat_data;
> >>
> >> -    meson_dw_hdmi->hdmi_supply = devm_regulator_get_optional(dev, "hdmi");
> >> -    if (IS_ERR(meson_dw_hdmi->hdmi_supply)) {
> >> -            if (PTR_ERR(meson_dw_hdmi->hdmi_supply) == -EPROBE_DEFER)
> >> -                    return -EPROBE_DEFER;
> >> -            meson_dw_hdmi->hdmi_supply = NULL;
> >> -    } else {
> >> -            ret = regulator_enable(meson_dw_hdmi->hdmi_supply);
> >> -            if (ret)
> >> -                    return ret;
> >> -            ret = devm_add_action_or_reset(dev, meson_disable_regulator,
> >> -                                           meson_dw_hdmi->hdmi_supply);
> >> -            if (ret)
> >> -                    return ret;
> >> -    }
> >> +    ret = devm_regulator_get_enable_optional(dev, "hdmi");
> >> +    if (ret != -ENODEV)
> >
> > The above line should be "if (ret < 0)", otherwise it breaks hdmi support.
> >

Sorry for the trouble and thanks for pointing this out! I believe the
condition I was looking for was
if (ret && ret != -ENODEV).

At least in my eyes the use of regulator_get_optional() sounds like
the -ENODEV should not be treated as an error. The obvious mistake is
regarding return value 0 as such. Thanks for spotting this!

> > I've noticed this once this change has been merged to linux-next and all
> > my Amlogic Meson based boards failed to initialize HDMI. Is it possible
> > to fix this in drm tree or do I need to send the incremental fixup?
>
> Nop, please send an incremental fix and I'll apply it asap.

Thanks for cleaning-up the mess I caused Marek! Please, let me know if
you want me to cook the fix.

Yours,
- -Matti

-- 

Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~

Discuss - Estimate - Plan - Report and finally accomplish this:
void do_work(int time) __attribute__ ((const));

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
