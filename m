Return-Path: <SRS0=re6n=PR=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC50BC43387
	for <linux-amlogic@archiver.kernel.org>; Wed,  9 Jan 2019 22:19:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A934206B6
	for <linux-amlogic@archiver.kernel.org>; Wed,  9 Jan 2019 22:19:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YLMQk9X2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="S0T9L2Cf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A934206B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KIH1GHpCPTFb7X2FH/7TJ9t/YyY5VhxbADZTYM6HJHQ=; b=YLMQk9X2m53UBF
	Fhkn+7Bmx2bJBBk8RSVqx9bNnQ/VgdsDv2ncuVipgZ1Ys5yCAQWT7Pprr5u3udZYpCi2eyQPN0nmF
	PV/82pMHCToamt2wcA2pL1y6pMrjmysq/TcKSZ/UgPZZ4K8hgxlHvMdRHs9SGrKiByClUoMzrKv9n
	9LulE9Fko6wqw92WQ+gcTj9l818telEPNiFGqFzLTsku+pHKM+dAKxR3yRzC8yW2TVCzrHUg+rvtg
	osF+kZ4x/SWhXWMTRhhuP2yp+A+adkjKXiJnUE3AuE0Y3dkSUmV0xeIb65cH8Zi1tf3FJwIU+P14O
	5ycXTAdNY12sCT/zX93Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ghMBb-0005PV-Jo; Wed, 09 Jan 2019 22:18:55 +0000
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ghMBZ-0005PA-GO
 for linux-amlogic@lists.infradead.org; Wed, 09 Jan 2019 22:18:55 +0000
Received: by mail-ot1-x341.google.com with SMTP id 32so8134727ota.12
 for <linux-amlogic@lists.infradead.org>; Wed, 09 Jan 2019 14:18:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eajiQ24UNxwoRXCMgoYAv710gsNkfyQN/SYf67E/6Zk=;
 b=S0T9L2Cfshpk5gAISGag7w4FTbGEe0MBQ5wpDmf3UZ0HziZetNrGg8K2NSzh1BuuQa
 VmWXAbhYKuGyJ9/jasHlNBBgctx5jUQiNsUcrQAAwRvVWu5ONKb9dcVQHTrGi1TgUKlU
 uLHXIsmhb3VsulAIlxMgFAz6x1KERjW+85wwzWkqf17JHx2SzB4apDdkhy1o/CXjFLgJ
 ndYYrXA76UX+BPB1iU3UWJFebimmzF83SnbJtCrYQr6HMr+d79LdXybTaBlV1eAPr43h
 tNoHe60C33+NCFEgRAiFyqIqjU8WXIWVOE5fN/UP6CiBFHlzSHeAjtpZuNxNnzjRdY5M
 Urpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eajiQ24UNxwoRXCMgoYAv710gsNkfyQN/SYf67E/6Zk=;
 b=FVDSX6msuU0OipmY8TaRvTnxnTu9ydOhUR79UdyVfY0l+nNBp3PD84aQaG/UTAsNZX
 nNTYnytxUjgU504s2DFeYTJqFt6Q8CCkeKef3zgCWtafzwe/dX6Ms1etOndcecFdcgcC
 tp+/gtZzm2YLcWmq0heUoqayMwUPbTgXtgc1FoH1Z0flBo1metLDuJXa0x9oOkkCFzOo
 MdwCPs5NF6vAJgIPTK/1aa4MbvB4zvaOYJKuYr8GIJdo14SqfYbYn9Uep5Bq6e5Ey8ib
 yCfeV0tkhJ5pbUQ55GBM8Mob0Jw1FoWKVD8WK1MltvHaT3UKEe6945qw+UdOirSsoRJn
 X/4w==
X-Gm-Message-State: AJcUukcMd+lbTdjgtITZ8IdhF4XqYe51nfyVK1+5rlJaJD0psGxIP6cv
 W+iAusG7CioLEZdRcZJaljCEkSbnCistnbiipaA=
X-Google-Smtp-Source: ALg8bN7I2OlYvd8AOTDV66Tv0PvdZoWzd3whezjTYp12qwyB8kyViw4I5aL2d8lJCaRFwMS0luftFP0gApORVdYeIp4=
X-Received: by 2002:a9d:a48:: with SMTP id 66mr5256177otg.308.1547072330952;
 Wed, 09 Jan 2019 14:18:50 -0800 (PST)
MIME-Version: 1.0
References: <20190109133644.27459-1-narmstrong@baylibre.com>
In-Reply-To: <20190109133644.27459-1-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 9 Jan 2019 23:18:40 +0100
Message-ID: <CAFBinCAGGDx_9g3Y16fczUPGaBC0Ep=ULkY__n3WdrQRnDSsyA@mail.gmail.com>
Subject: Re: [PATCH] drm/meson: Fix atomic mode switching regression
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190109_141853_569396_95491228 
X-CRM114-Status: GOOD (  15.78  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, daniel@ffwll.ch
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Neil,

On Wed, Jan 9, 2019 at 2:36 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Since commit 2bcd3ecab773 when switching mode from X11 (ubuntu mate for
> example) the display gets blurry, looking like an invalid framebuffer width.
>
> This commit fixed atomic crtc modesetting but didn't update the display
> parameters when changing mode, but only when starting a mode setting after
> a crtc disable.
>
> This commit setups the crctc parameter in _begin() and _enable() to
> take in account the current ctrc parameters.
>
> Reported-by: Tony McKahan <tonymckahan@gmail.com>
> Fixes: 2bcd3ecab773 ("drm/meson: Fixes for drm_crtc_vblank_on/off support")
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  drivers/gpu/drm/meson/meson_crtc.c | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/meson/meson_crtc.c b/drivers/gpu/drm/meson/meson_crtc.c
> index 75d97f1b2e8f..5bb432021caf 100644
> --- a/drivers/gpu/drm/meson/meson_crtc.c
> +++ b/drivers/gpu/drm/meson/meson_crtc.c
> @@ -82,14 +82,12 @@ static const struct drm_crtc_funcs meson_crtc_funcs = {
>
>  };
>
> -static void meson_crtc_enable(struct drm_crtc *crtc)
> +static void meson_crtc_setup(struct drm_crtc *crtc)
>  {
>         struct meson_crtc *meson_crtc = to_meson_crtc(crtc);
>         struct drm_crtc_state *crtc_state = crtc->state;
>         struct meson_drm *priv = meson_crtc->priv;
>
> -       DRM_DEBUG_DRIVER("\n");
> -
>         if (!crtc_state) {
>                 DRM_ERROR("Invalid crtc_state\n");
>                 return;
> @@ -98,6 +96,16 @@ static void meson_crtc_enable(struct drm_crtc *crtc)
>         /* Enable VPP Postblend */
nit-pick: this "enable" comment is now in meson_crtc_setup().
I would drop it because my interpretation of the following lines is
now "setting VPP_POSTBLEND_H_SIZE enables the VPP postblend"

>         writel(crtc_state->mode.hdisplay,
>                priv->io_base + _REG(VPP_POSTBLEND_H_SIZE));
> +}
> +
> +static void meson_crtc_enable(struct drm_crtc *crtc)
> +{
> +       struct meson_crtc *meson_crtc = to_meson_crtc(crtc);
> +       struct meson_drm *priv = meson_crtc->priv;
> +
> +       DRM_DEBUG_DRIVER("\n");
> +
> +       meson_crtc_setup(crtc);
>
>         /* VD1 Preblend vertical start/end */
>         writel(FIELD_PREP(GENMASK(11, 0), 2303),
> @@ -121,6 +129,8 @@ static void meson_crtc_atomic_enable(struct drm_crtc *crtc,
>
>         if (!meson_crtc->enabled)
>                 meson_crtc_enable(crtc);
> +       else
> +               meson_crtc_setup(crtc);
it's probably only personal preference, but have you thought about
re-ordering this:
  meson_crtc_setup(crtc);

  if (!meson_crtc->enabled)
    meson_crtc_enable(crtc);

with that you could get rid of the meson_crtc_setup() call in
meson_crtc_enable(), leaving only one code-path (instead of two) which
calls meson_crtc_setup()


Regards
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
