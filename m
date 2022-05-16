Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F0B9C433F5
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 May 2022 07:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nE/BhCQLPdnANBLWBz+51wouvf6CxrvM9x73pCiTcuI=; b=2UJW5g8bvDFaARx2Tfagtibq5+
	VUPKO5HjD/tmCMo3XoOCtWQkuT8A64BbfFSHgLF2pPS7LvFkime8Tv9d9LL+6wR/cHOxkOumWqfuv
	4Sx429dBhMBdQKd+BSZn7UEZQ/Zmo91ubX74RhiVjGWCfOsLnH5iXL7YNGrhlIT8mp0m97+78mgUE
	pc8JaFamvZWCy6660gMN46foca92FqvJsi2J+/f8763/en8FnRVz51RUOIioCWv/ORIko0rR3dDFb
	bv7MeAGVSk1LhhY+H2lLOYK3jDf1oA+4IPj5jEfPy+/fMTA+JzeK6vP+o4yObbFiZiCN3WLJnPJ9L
	rsZUA/fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqVNQ-006WN3-GU; Mon, 16 May 2022 07:42:48 +0000
Received: from mail.manjaro.org ([116.203.91.91])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqVNN-006WLA-5M
 for linux-amlogic@lists.infradead.org; Mon, 16 May 2022 07:42:47 +0000
Message-ID: <d9d255a9-48aa-4296-0feb-f433298d2889@manjaro.org>
Date: Mon, 16 May 2022 09:42:36 +0200
MIME-Version: 1.0
Subject: Re: [PATCH] drm/meson: add YUV422 output support
Content-Language: da-DK
To: linux-amlogic@lists.infradead.org
References: <20220516072245.10745-1-christianshewitt@gmail.com>
From: Dan Johansen <strit@manjaro.org>
Organization: Manjaro ARM
In-Reply-To: <20220516072245.10745-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220516_004245_405686_768C056D 
X-CRM114-Status: GOOD (  19.06  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Tested-by: Dan Johansen <strit@manjaro.org>

Den 16.05.2022 kl. 09.22 skrev Christian Hewitt:
> From: Dongjin Kim <tobetter@gmail.com>
>
> Support YUV422 output from the Amlogic Meson SoC VPU to the HDMI
> controller. Without this YUV422 format out of the HDMI encoder
> leads to using the dw-hdmi YUV444 to YUV422 color conversion which
> gives wrong colors and a green line on the left edge of the screen.
>
> Signed-off-by: Dongjin Kim <tobetter@gmail.com>
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> Tested-by: Furkan Kardame <f.kardame@manjaro.org>
> ---
> I've had this patch in my sources for some time now; originally picked
> from Dongjin's mainline branches for Hardkernel boards and tweaked for
> some minor renaming after DRM bridge changes were merged. Furkhan has
> reminded me this is still needed a couple of days ago and now the same
> issue is reported on the mailing list [0] so best to submit it. If a
> fixes tag is required? please advise the commit and i'll resend.
>
>   drivers/gpu/drm/meson/meson_encoder_hdmi.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
> index 5e306de6f485..08529efb4405 100644
> --- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
> +++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
> @@ -218,7 +218,8 @@ static void meson_encoder_hdmi_atomic_enable(struct drm_bridge *bridge,
>   	if (encoder_hdmi->output_bus_fmt == MEDIA_BUS_FMT_UYYVYY8_0_5X24) {
>   		ycrcb_map = VPU_HDMI_OUTPUT_CRYCB;
>   		yuv420_mode = true;
> -	}
> +	} else if (encoder_hdmi->output_bus_fmt == MEDIA_BUS_FMT_UYVY8_1X16)
> +		ycrcb_map = VPU_HDMI_OUTPUT_CRYCB;
>   
>   	/* VENC + VENC-DVI Mode setup */
>   	meson_venc_hdmi_mode_set(priv, vic, ycrcb_map, yuv420_mode, mode);
> @@ -230,6 +231,10 @@ static void meson_encoder_hdmi_atomic_enable(struct drm_bridge *bridge,
>   		/* Setup YUV420 to HDMI-TX, no 10bit diphering */
>   		writel_relaxed(2 | (2 << 2),
>   			       priv->io_base + _REG(VPU_HDMI_FMT_CTRL));
> +	else if (encoder_hdmi->output_bus_fmt == MEDIA_BUS_FMT_UYVY8_1X16)
> +		/* Setup YUV422 to HDMI-TX, no 10bit diphering */
> +		writel_relaxed(1 | (2 << 2),
> +				priv->io_base + _REG(VPU_HDMI_FMT_CTRL));
>   	else
>   		/* Setup YUV444 to HDMI-TX, no 10bit diphering */
>   		writel_relaxed(0, priv->io_base + _REG(VPU_HDMI_FMT_CTRL));
> @@ -257,6 +262,7 @@ static void meson_encoder_hdmi_atomic_disable(struct drm_bridge *bridge,
>   
>   static const u32 meson_encoder_hdmi_out_bus_fmts[] = {
>   	MEDIA_BUS_FMT_YUV8_1X24,
> +	MEDIA_BUS_FMT_UYVY8_1X16,
>   	MEDIA_BUS_FMT_UYYVYY8_0_5X24,
>   };
>   
-- 
Kind regards
*Dan Johansen*
Project lead of the *Manjaro ARM* project
Manjaro-ARM <https://manjaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
