Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1A20C433FE
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Nov 2022 16:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YJDWvSyTAZfHjLJpxcZnvQ3ZJSXU6jNcvXT84nShLQc=; b=21Dl1Xlu5SE1Zo
	u39p/5GIo7jpUlT0KgKmEqFJ3Id/TTxyadAVBBqN7AvGehsn3r9vYZqBG8EGd5MZFsd6nhU0mPbVO
	tfDIpSFR+T+6w8PEXrzt0QHe7NTAWjYnE0H/oANEtcjAf1Jd6BH5DIPRGKS85a56Erah7R7mZySAG
	Oq+/nP+n0L6Veb0Phfau4yH4MTx95/PVYivBlUmAG+J+koSV6gjXm0bYCyZ3wACcCEOq3g7pXElWB
	JODjiikKxsi9cO6ElzjiCLlna6ZmEjuXonoN3Uv1+rai8qw6FzH/zQc7VPzaM2ZXioVqnyNBZpDIZ
	iUO3GxDN/DAMTxz928DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p03rq-00AINl-EN; Tue, 29 Nov 2022 16:53:58 +0000
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p03rP-00AIB2-BM
	for linux-amlogic@lists.infradead.org; Tue, 29 Nov 2022 16:53:34 +0000
Received: by mail-oi1-x231.google.com with SMTP id c129so15891998oia.0
        for <linux-amlogic@lists.infradead.org>; Tue, 29 Nov 2022 08:53:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nX3XDw+aJWbqG71jNK2XOm8EYBY4nRDO50tiBkk6nzE=;
        b=eZGUMebShf+nYBcnZ7+qSuog/s1H+Yimyzp9jVbMHDnUyBIOtfdsnqOmKxJgXhilUd
         kCXBn7Yj1M1Lji4/kmPp22ZbV8L2bYAvIcl9J+UYTD9d7jjjdIF6ZBGC1sYmCukK7y+w
         6aFYnilDbD+HyK8J/Y4o/PtDq/xStFYCLkAEVDmMwchKt2sw+M0T+CCo68KLN2fjES/t
         VWiWU7c/hgJb8sW+E/qFU6bABXcp+OnEMRzS53qibSrm9O5I+6nRBFva891L6ph/KSbC
         zyuy1HPdFjuz3+iSiKFzARg/85GaMyGxDMYRiciqzd8wWdWoOd2TFNu1zf1zYgSkvH80
         ShBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nX3XDw+aJWbqG71jNK2XOm8EYBY4nRDO50tiBkk6nzE=;
        b=2tujhgyC9ToM1lUf43LrWV0R37tLNQ6lX+S7N0as2kEMaP0U4Uj6MKXiMd53wC3T7L
         gAhwcGYaQ+2DQcA2mB/MRBohN1jz582EYMqJoIq/mBo3B6l5HYZ6+K/YTyZun/ndZNVx
         2Ri7MXqwCsIb+U0sNGR7P48Ln/IIthaUEOOp/OAeciAkTZoqi/oD+CHoijxn/KLU9UAy
         x8DtKkxedXDAq6DrglGD5wmPR9r9S8clsDGScnrswQkOcVS5x6wh+G9Zu6poagCLeGHK
         bQDtMyedllYYwd+8a30OeqyeBk8hG2l3pq8rIOMRogxLwx44Z74mdAVW+6hQTPWeguKM
         C2MQ==
X-Gm-Message-State: ANoB5pm6slW3O80ITS7aHpGXUBgbUSVyj8lZtnTzVc6vfLNnA5s+qlju
	aXpnVX0cuoXERTo3Qg3vVFqIT/s0OwDDWBzFdjGq1A==
X-Google-Smtp-Source: AA0mqf5IXY8LzctaU4Fl4SjDm7702lMsmNWFfYQL6NXNStETLNdQMSdiKZ9Qj80YpnL+BWAZoUuLwX40hFVJgAK67OI=
X-Received: by 2002:aca:2801:0:b0:35a:13f4:d875 with SMTP id
 1-20020aca2801000000b0035a13f4d875mr30406072oix.190.1669740809533; Tue, 29
 Nov 2022 08:53:29 -0800 (PST)
MIME-Version: 1.0
References: <cover.1668602942.git.mazziesaccount@gmail.com> <a2f0835e8d3b5f5768d887ce47a1575ae11b19f0.1668602942.git.mazziesaccount@gmail.com>
In-Reply-To: <a2f0835e8d3b5f5768d887ce47a1575ae11b19f0.1668602942.git.mazziesaccount@gmail.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Tue, 29 Nov 2022 17:53:18 +0100
Message-ID: <CAG3jFytRrhzWj+ka+fSK=cQfhg83pK9ZJAH4u5aRGnCmzJAZqg@mail.gmail.com>
Subject: Re: [PATCH RESEND v4 2/2] gpu: drm: meson: Use devm_regulator_*get_enable*()
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Kevin Hilman <khilman@baylibre.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_085331_437025_7FD268DE 
X-CRM114-Status: GOOD (  20.55  )
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

The prefix to the commit title is a new one, let's use an existing one:
- drm/meson: dw-hdmi:
- drm: meson: dw-hdmi:

On Wed, 16 Nov 2022 at 14:04, Matti Vaittinen <mazziesaccount@gmail.com> wrote:
>
> Simplify using the devm_regulator_get_enable_optional(). Also drop the
> seemingly unused struct member 'hdmi_supply'.
>
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
>
> ---
> I am doing a clean-up for my local git and encountered this one.
> Respinning as it seems this one fell through the cracks.
> ---
>  drivers/gpu/drm/meson/meson_dw_hdmi.c | 23 +++--------------------
>  1 file changed, 3 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> index 5cd2b2ebbbd3..7642f740272b 100644
> --- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
> +++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> @@ -140,7 +140,6 @@ struct meson_dw_hdmi {
>         struct reset_control *hdmitx_apb;
>         struct reset_control *hdmitx_ctrl;
>         struct reset_control *hdmitx_phy;
> -       struct regulator *hdmi_supply;
>         u32 irq_stat;
>         struct dw_hdmi *hdmi;
>         struct drm_bridge *bridge;
> @@ -665,11 +664,6 @@ static void meson_dw_hdmi_init(struct meson_dw_hdmi *meson_dw_hdmi)
>
>  }
>
> -static void meson_disable_regulator(void *data)
> -{
> -       regulator_disable(data);
> -}
> -
>  static void meson_disable_clk(void *data)
>  {
>         clk_disable_unprepare(data);
> @@ -723,20 +717,9 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
>         meson_dw_hdmi->data = match;
>         dw_plat_data = &meson_dw_hdmi->dw_plat_data;
>
> -       meson_dw_hdmi->hdmi_supply = devm_regulator_get_optional(dev, "hdmi");
> -       if (IS_ERR(meson_dw_hdmi->hdmi_supply)) {
> -               if (PTR_ERR(meson_dw_hdmi->hdmi_supply) == -EPROBE_DEFER)
> -                       return -EPROBE_DEFER;
> -               meson_dw_hdmi->hdmi_supply = NULL;
> -       } else {
> -               ret = regulator_enable(meson_dw_hdmi->hdmi_supply);
> -               if (ret)
> -                       return ret;
> -               ret = devm_add_action_or_reset(dev, meson_disable_regulator,
> -                                              meson_dw_hdmi->hdmi_supply);
> -               if (ret)
> -                       return ret;
> -       }
> +       ret = devm_regulator_get_enable_optional(dev, "hdmi");
> +       if (ret != -ENODEV)
> +               return ret;
>
>         meson_dw_hdmi->hdmitx_apb = devm_reset_control_get_exclusive(dev,
>                                                 "hdmitx_apb");
> --
> 2.38.1
>
>
> --
> Matti Vaittinen, Linux device drivers
> ROHM Semiconductors, Finland SWDC
> Kiviharjunlenkki 1E
> 90220 OULU
> FINLAND
>
> ~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~
> Simon says - in Latin please.
> ~~~ "non cogito me" dixit Rene Descarte, deinde evanescavit ~~~
> Thanks to Simon Glass for the translation =]

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
