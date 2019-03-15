Return-Path: <SRS0=BQut=RS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4313C43381
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 Mar 2019 15:45:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 80C0121872
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 Mar 2019 15:45:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OQK5dZXe";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="zdbDsxmX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 80C0121872
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1mDQIjFbWyT42L54WvbK2wfp/FTl4VXky8eqU95yKGs=; b=OQK5dZXeSmL1pM
	oBJ9SOUYWqRBxlHlfTBmj9hbwPdrK6uY205ZHru1GfouqVKEbXU077qewsdYDIVZtYAzS9+m/ueJK
	u+v/TDnEcR4Ze5rYDUSRFmhjLHIBVktu0yNChOVKLuDcRyJw4D1UDrNnakoldUnY9rAXIgxGEzctR
	W31K4p/zL7yZp5FfgiDJBvl36tcRb2U7T8xTl7mOzOutKrdFgydaNg8vRXxfblxTqIaDBiabRRRKO
	uUn2bzzcIPHjODkKkaFdTxUcCbaFZ2kFUMpjOPW/UJR0yEi7gnWf5zIT6DHHlZ5yr9y1NAQcUwn7t
	Zm+PhpEqem4kJ02IIEhA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h4p1K-0005Mb-S2; Fri, 15 Mar 2019 15:45:18 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h4p1I-0005MA-HF; Fri, 15 Mar 2019 15:45:17 +0000
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BFE21218D8;
 Fri, 15 Mar 2019 15:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1552664715;
 bh=Bvuob3aBdY3fJSwQ9N7TrCmMqBOE9Jo7y/wVG2WYZ5Y=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=zdbDsxmXCqXVRrPnVsJnhAH3vVcr3CoSOk/r1mUjFeCU785NzqXD62aNMgr41AQi0
 6nfbohXoo4IrcCW9xb0psdE8NTeY6Qe9tKRBoD1Ap1ekrCegwbshMHQ4nAm8yVKdw9
 WQV1bGPEddTonprgHvlOjQGt7c1M/WTxsJMgUpSE=
Received: by mail-qk1-f179.google.com with SMTP id b74so5749311qkg.9;
 Fri, 15 Mar 2019 08:45:15 -0700 (PDT)
X-Gm-Message-State: APjAAAVRbEuXXc2zpMWdr5mcqVuKDpqi5msW0XcUOXAT5drO6p/gDlN/
 AU1Z3i21m1X2Eki5eZvA9Sk6KFYd0P1/rbb4sA==
X-Google-Smtp-Source: APXvYqwrlOTUWoFVXlcXfVIB4JA4jgMrwfdOxySg9vTNR3xP7KKIOldumKwT/x2Ced1rB/YzNIjlM/bO1AfoCy2aXYY=
X-Received: by 2002:a37:d285:: with SMTP id f127mr3346624qkj.147.1552664714936; 
 Fri, 15 Mar 2019 08:45:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190315095414.28520-1-narmstrong@baylibre.com>
In-Reply-To: <20190315095414.28520-1-narmstrong@baylibre.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 15 Mar 2019 10:45:03 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJ_+=h_Xpdm2RJd0mtHS1YxtxDwNxY19oAe4-+JNd8A7A@mail.gmail.com>
Message-ID: <CAL_JsqJ_+=h_Xpdm2RJd0mtHS1YxtxDwNxY19oAe4-+JNd8A7A@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: dw-hdmi: disable SCDC configuration for
 invalid setups
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190315_084516_611654_8F42E0F4 
X-CRM114-Status: GOOD (  25.01  )
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 "heiko@sntech.de" <heiko@sntech.de>, Andrzej Hajda <a.hajda@samsung.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, Mar 15, 2019 at 4:54 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> This patch is an attempt to limit HDMI 2.0 SCDC setup when :
> - the SoC embeds an HDMI 1.4 only controller
> - the EDID supports SCDC but not scrambling
> - the EDID supports SCDC scrambling but not for low TMDS bit rates,
>   while only supporting low TMDS bit rates
>
> This to avoid communicating with the SCDC DDC slave uncessary, and
> setting the DW-HDMI TMDS Scrambler setup when not supported by the
> underlying hardware.
>
> Reported-by: Rob Herring <robh@kernel.org>
> Fixes: 264fce6cc2c1 ("drm/bridge: dw-hdmi: Add SCDC and TMDS Scrambling support")
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>
> Rob,
>
> this patch should also solve your issue with your 11' display, could you
> test it ?

That works for me.

Tested-by: Rob Herring <robh@kernel.org>

Too answer your question on the other thread, there's not really any
model name for the panel I have. Probably what's in the EDID is the
best thing to go on.

Here's the panel on Amazon:

https://www.amazon.com/gp/product/B07GDDG3WJ/ref=ppx_yo_dt_b_asin_title_o00_s01?ie=UTF8&psc=1

> If this works, I will focus on the underlying issue where the RK3399 SoC
> freezes in your setup.
>
> Thanks,
> Neil
>
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 34 ++++++++++++++++++++---
>  1 file changed, 30 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index a63e5f0dae56..db761329a1e3 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -1037,6 +1037,31 @@ void dw_hdmi_phy_i2c_write(struct dw_hdmi *hdmi, unsigned short data,
>  }
>  EXPORT_SYMBOL_GPL(dw_hdmi_phy_i2c_write);
>
> +/* Filter out invalid setups to avoid configuring SCDC and scrambling */
> +static bool dw_hdmi_support_scdc(struct dw_hdmi *hdmi)
> +{
> +       struct drm_display_info *display = &hdmi->connector.display_info;
> +
> +       /* Completely disable SCDC support for older controllers */
> +       if (hdmi->version < 0x200a)
> +               return false;
> +
> +       /* Disable if SCDC is not supported, or if an HF-VSDB block is absent */
> +       if (!display->hdmi.scdc.supported ||
> +           !display->hdmi.scdc.scrambling.supported)
> +               return false;
> +
> +       /*
> +        * Disable if display only support low TMDS rates and scrambling
> +        * for low rates is not supported either
> +        */
> +       if (!display->hdmi.scdc.scrambling.low_rates &&
> +           display->max_tmds_clock <= 340000)
> +               return false;
> +
> +       return true;
> +}
> +
>  /*
>   * HDMI2.0 Specifies the following procedure for High TMDS Bit Rates:
>   * - The Source shall suspend transmission of the TMDS clock and data
> @@ -1055,7 +1080,7 @@ void dw_hdmi_set_high_tmds_clock_ratio(struct dw_hdmi *hdmi)
>         unsigned long mtmdsclock = hdmi->hdmi_data.video_mode.mtmdsclock;
>
>         /* Control for TMDS Bit Period/TMDS Clock-Period Ratio */
> -       if (hdmi->connector.display_info.hdmi.scdc.supported) {
> +       if (dw_hdmi_support_scdc(hdmi)) {
>                 if (mtmdsclock > HDMI14_MAX_TMDSCLK)
>                         drm_scdc_set_high_tmds_clock_ratio(hdmi->ddc, 1);
>                 else
> @@ -1579,8 +1604,9 @@ static void hdmi_av_composer(struct dw_hdmi *hdmi,
>
>         /* Set up HDMI_FC_INVIDCONF */
>         inv_val = (hdmi->hdmi_data.hdcp_enable ||
> -                  vmode->mtmdsclock > HDMI14_MAX_TMDSCLK ||
> -                  hdmi_info->scdc.scrambling.low_rates ?
> +                  (dw_hdmi_support_scdc(hdmi) &&
> +                   (vmode->mtmdsclock > HDMI14_MAX_TMDSCLK ||
> +                    hdmi_info->scdc.scrambling.low_rates)) ?
>                 HDMI_FC_INVIDCONF_HDCP_KEEPOUT_ACTIVE :
>                 HDMI_FC_INVIDCONF_HDCP_KEEPOUT_INACTIVE);
>
> @@ -1646,7 +1672,7 @@ static void hdmi_av_composer(struct dw_hdmi *hdmi,
>         }
>
>         /* Scrambling Control */
> -       if (hdmi_info->scdc.supported) {
> +       if (dw_hdmi_support_scdc(hdmi)) {
>                 if (vmode->mtmdsclock > HDMI14_MAX_TMDSCLK ||
>                     hdmi_info->scdc.scrambling.low_rates) {
>                         /*
> --
> 2.20.1
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
