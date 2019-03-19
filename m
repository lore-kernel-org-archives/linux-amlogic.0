Return-Path: <SRS0=/WbR=RW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CF28C43381
	for <linux-amlogic@archiver.kernel.org>; Tue, 19 Mar 2019 10:38:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 70DB12085A
	for <linux-amlogic@archiver.kernel.org>; Tue, 19 Mar 2019 10:38:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Wh2souzL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="JTuPLG2v"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 70DB12085A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FxNBGKUAeCOxxTxo64M+5vvOAZwfGAdqpWLQFN7pn4Q=; b=Wh2souzLGxTiWN
	QXVDI7ZW+KRPYxBiEbrvQPbpHZaOrptw7spC5m+ITIiNopKAzbqhHQ7jdqROij0LNHnXvtX6BFZl+
	9k+sy1EKncbkfNiPBfq6bUcp72yLiVw9DyF8U/yiTpWu6W6L2sk4pq7UjxC8dZUc2QppV/FjiKBEv
	ZiawkgY2K9nb4mDFmgwbt/uAFM7aU/1JlpMeL8HYF/XJlnAgTpxU3o2h+rCEaZn+YQPBkaP8Z3y4O
	amqzOgQg93MBJZv3ZZeE6Kepw5q+JTttOGMSLhyVr0oF+WX3ojJLUkSMNnPfEXF1i52jaL+PPAhUA
	yoyxBSYputUOVgIHSrOQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6C8F-0002ot-V4; Tue, 19 Mar 2019 10:38:07 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6C8C-0002oU-MA
 for linux-amlogic@lists.infradead.org; Tue, 19 Mar 2019 10:38:06 +0000
Received: by mail-wr1-x441.google.com with SMTP id n9so16336710wrr.9
 for <linux-amlogic@lists.infradead.org>; Tue, 19 Mar 2019 03:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=bGNhN/EeMUPRr7n1WXqDMzu2NVo3Hbqotr7dmoUcqNI=;
 b=JTuPLG2v3RyJUZg0s4N+hCuhyvGOPBcPZ96nknS3OU5i5XVn/QUTbaE20ZeC0GcMbo
 EDVYKBz6hLmWIXMqFRTxsEw97hu+k9jYgkTTVJtNEQUY7jQfUHMvpM3AwG9GvnXxobW0
 kBYVYWiPjJFl5m3MzSZkHvqwMR7KT9JjaEEIZAw3OsRFqYf+vOF1fclbY+ghyMhMPC/w
 76n1WKusnbXQW3R7fiU6bLdWTqMeKIBNG1gyAki4hOBcdsca3clWK5jdKpiyf3AQplK/
 8jX2CC+lgrijZKbQ+0+hl0YTw878JE+vUNcA9Q5bTR/Fv9kJ4N2UHDZ8zjOeeR01kLJ/
 RhJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=bGNhN/EeMUPRr7n1WXqDMzu2NVo3Hbqotr7dmoUcqNI=;
 b=L5jOorcpd1xhyozq+6dYBVNP4hnj6Zcvaq90kbL9AcZkek75O7ZIBHcwVZzd9Y3eUt
 L5PGviTsDDS1Wb6Zw/v6/Afo+Sp6/ATIXGkYXtpZQi28m4aQMONoXB1100ec2dnoobVH
 NkfZpN3TO/y+cNPAL0RY6WOYC6XJ8jTTda2XHV3xyfwcRV6hMc5OIfWVxml3G4qYU6vP
 hGkhI7+muNU5JbijWVv2ERX5I8u1BgHqF2CtJm8QSz24XYwiN5rK8kVb61UX/6CbofuX
 OJjx3aM7mW7AVHbDDUn9ciR8prltzyjpb6fofyajKBxBuqTEBn6KTjZbzYYtr9LpmL5I
 B9SA==
X-Gm-Message-State: APjAAAVQPH8BUltbHENsmD1ZR/GsaJHtfk6KcTerD/1pE9tNkTYQQCF0
 L/QPdEyvLE7Zb5pN87vQtUR5CvCC+B8akw==
X-Google-Smtp-Source: APXvYqx86CoqHb6sM6VpjyQh3QqVfOn0nwE8DgrHsyKGmTuiVnF7dOvhV+Ohq8oAfhmLAuqaR8KrSg==
X-Received: by 2002:a05:6000:104b:: with SMTP id
 c11mr17284077wrx.9.1552991883074; 
 Tue, 19 Mar 2019 03:38:03 -0700 (PDT)
Received: from [192.168.1.62] (wal59-h01-176-150-251-154.dsl.sta.abo.bbox.fr.
 [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id g1sm84958wmc.25.2019.03.19.03.38.01
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 19 Mar 2019 03:38:02 -0700 (PDT)
Subject: Re: [PATCH v2 7/8] drm/meson: Add YUV420 output support
To: Maxime Jourdan <mjourdan@baylibre.com>
References: <1549022873-40549-1-git-send-email-narmstrong@baylibre.com>
 <1549022873-40549-8-git-send-email-narmstrong@baylibre.com>
 <CAMO6nayWKDfcsQtrPK7-Pki75F5tAYO-0B=D=TAbGvQmt=gwrw@mail.gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <cd6b8fc6-82a7-faba-54d5-e271242ba024@baylibre.com>
Date: Tue, 19 Mar 2019 11:38:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <CAMO6nayWKDfcsQtrPK7-Pki75F5tAYO-0B=D=TAbGvQmt=gwrw@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190319_033804_792607_0FF264AB 
X-CRM114-Status: GOOD (  26.19  )
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
Cc: heiko@sntech.de, maxime.ripard@bootlin.com,
 Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, a.hajda@samsung.com,
 Laurent.pinchart@ideasonboard.com, p.zabel@pengutronix.de,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 19/03/2019 11:35, Maxime Jourdan wrote:
> Hi Neil,
> 
> On Fri, Feb 1, 2019 at 1:08 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>>
>> This patch adds support for the YUV420 output from the Amlogic Meson SoCs
>> Video Processing Unit to the HDMI Controller.
>>
>> The YUV420 is obtained by generating a YUV444 pixel stream like
>> the classic HDMI display modes, but then the Video Encoder output
>> can be configured to down-sample the YUV444 pixel stream to a YUV420
>> stream.
>> In addition if pixel stream down-sampling, the Y Cb Cr components must
>> also be mapped differently to align with the HDMI2.0 specifications.
>>
>> This mode needs a different clock generation scheme since the TMDS PHY
>> clock must match the 10x ration with the YUV420 pixel clock, but
>> the video encoder must run at 2x the pixel clock.
>>
>> This patch adds the TMDS PHY clock value in all the video clock setup
>> in order to better support these specific uses cases and switch
>> to the Common Clock framework for clocks handling in the future.
>>
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>> ---
>>  drivers/gpu/drm/meson/meson_dw_hdmi.c   | 110 ++++++++++++++++++++++++++------
>>  drivers/gpu/drm/meson/meson_vclk.c      |  93 ++++++++++++++++++++-------
>>  drivers/gpu/drm/meson/meson_vclk.h      |   7 +-
>>  drivers/gpu/drm/meson/meson_venc.c      |   6 +-
>>  drivers/gpu/drm/meson/meson_venc.h      |  11 ++++
>>  drivers/gpu/drm/meson/meson_venc_cvbs.c |   3 +-
>>  6 files changed, 184 insertions(+), 46 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
>> index e28814f..540971a 100644
>> --- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
>> +++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
>> @@ -141,6 +141,8 @@ struct meson_dw_hdmi {
>>         struct regulator *hdmi_supply;
>>         u32 irq_stat;
>>         struct dw_hdmi *hdmi;
>> +       unsigned long input_bus_format;
>> +       unsigned long output_bus_format;
>>  };
>>  #define encoder_to_meson_dw_hdmi(x) \
>>         container_of(x, struct meson_dw_hdmi, encoder)
>> @@ -323,25 +325,36 @@ static void dw_hdmi_set_vclk(struct meson_dw_hdmi *dw_hdmi,
>>  {
>>         struct meson_drm *priv = dw_hdmi->priv;
>>         int vic = drm_match_cea_mode(mode);
>> +       unsigned int phy_freq;
>>         unsigned int vclk_freq;
>>         unsigned int venc_freq;
>>         unsigned int hdmi_freq;
>>
>>         vclk_freq = mode->clock;
>>
>> +       /* For 420, pixel clock is half unlike venc clock */
>> +       if (dw_hdmi->input_bus_format == MEDIA_BUS_FMT_UYYVYY8_0_5X24)
>> +               vclk_freq /= 2;
>> +
>> +       /* TMDS clock is pixel_clock * 10 */
>> +       phy_freq = vclk_freq * 10;
>> +
>>         if (!vic) {
>> -               meson_vclk_setup(priv, MESON_VCLK_TARGET_DMT, vclk_freq,
>> -                                vclk_freq, vclk_freq, false);
>> +               meson_vclk_setup(priv, MESON_VCLK_TARGET_DMT, phy_freq,
>> +                                vclk_freq, vclk_freq, vclk_freq, false);
>>                 return;
>>         }
>>
>> +       /* 480i/576i needs global pixel doubling */
>>         if (mode->flags & DRM_MODE_FLAG_DBLCLK)
>>                 vclk_freq *= 2;
>>
>>         venc_freq = vclk_freq;
>>         hdmi_freq = vclk_freq;
>>
>> -       if (meson_venc_hdmi_venc_repeat(vic))
>> +       /* VENC double pixels for 1080i, 720p and YUV420 modes */
>> +       if (meson_venc_hdmi_venc_repeat(vic) ||
>> +           dw_hdmi->input_bus_format == MEDIA_BUS_FMT_UYYVYY8_0_5X24)
>>                 venc_freq *= 2;
>>
>>         vclk_freq = max(venc_freq, hdmi_freq);
>> @@ -349,11 +362,11 @@ static void dw_hdmi_set_vclk(struct meson_dw_hdmi *dw_hdmi,
>>         if (mode->flags & DRM_MODE_FLAG_DBLCLK)
>>                 venc_freq /= 2;
>>
>> -       DRM_DEBUG_DRIVER("vclk:%d venc=%d hdmi=%d enci=%d\n",
>> -               vclk_freq, venc_freq, hdmi_freq,
>> +       DRM_DEBUG_DRIVER("vclk:%d phy=%d venc=%d hdmi=%d enci=%d\n",
>> +               phy_freq, vclk_freq, venc_freq, hdmi_freq,
>>                 priv->venc.hdmi_use_enci);
>>
>> -       meson_vclk_setup(priv, MESON_VCLK_TARGET_HDMI, vclk_freq,
>> +       meson_vclk_setup(priv, MESON_VCLK_TARGET_HDMI, phy_freq, vclk_freq,
>>                          venc_freq, hdmi_freq, priv->venc.hdmi_use_enci);
>>  }
>>
>> @@ -386,8 +399,9 @@ static int dw_hdmi_phy_init(struct dw_hdmi *hdmi, void *data,
>>         /* Enable normal output to PHY */
>>         dw_hdmi_top_write(dw_hdmi, HDMITX_TOP_BIST_CNTL, BIT(12));
>>
>> -       /* TMDS pattern setup (TOFIX Handle the YUV420 case) */
>> -       if (mode->clock > 340000) {
>> +       /* TMDS pattern setup */
>> +       if (mode->clock > 340000 &&
>> +           dw_hdmi->input_bus_format == MEDIA_BUS_FMT_YUV8_1X24) {
>>                 dw_hdmi_top_write(dw_hdmi, HDMITX_TOP_TMDS_CLK_PTTN_01, 0);
>>                 dw_hdmi_top_write(dw_hdmi, HDMITX_TOP_TMDS_CLK_PTTN_23,
>>                                   0x03ff03ff);
>> @@ -560,6 +574,8 @@ dw_hdmi_mode_valid(struct drm_connector *connector,
>>                    const struct drm_display_mode *mode)
>>  {
>>         struct meson_drm *priv = connector->dev->dev_private;
>> +       bool is_hdmi2_sink = connector->display_info.hdmi.scdc.supported;
>> +       unsigned int phy_freq;
>>         unsigned int vclk_freq;
>>         unsigned int venc_freq;
>>         unsigned int hdmi_freq;
>> @@ -568,8 +584,10 @@ dw_hdmi_mode_valid(struct drm_connector *connector,
>>
>>         DRM_DEBUG_DRIVER("Modeline " DRM_MODE_FMT "\n", DRM_MODE_ARG(mode));
>>
>> -       /* If sink max TMDS clock, we reject the mode */
>> -       if (mode->clock > connector->display_info.max_tmds_clock)
>> +       /* If sink does not support 540MHz, reject the non-420 HDMI2 modes */
>> +       if (mode->clock > connector->display_info.max_tmds_clock &&
>> +           !drm_mode_is_420_only(&connector->display_info, mode) &&
>> +           !drm_mode_is_420_also(&connector->display_info, mode))
>>                 return MODE_BAD;
>>

Hi Maxime,

> 
> This part makes all the modes identified as BAD on my TV, on G12A and
> GXL, which in turn breaks HDMI output (no signal detected).

In fact, the issue comes from patch 2.

+	if (mode->clock > connector->display_info.max_tmds_clock)
+		return MODE_BAD;

is wrong if max_tmds_clock is 0, as reported from a DMT monitor.

The original :
+	/* If sink max TMDS clock < 340MHz, we reject the HDMI2.0 modes */
+	if (mode->clock > 340000 &&
+	    connector->display_info.max_tmds_clock < 340000)
+		return MODE_BAD;

was correct, and I was asked to simplify it.

I will submit a fix reverting to the later.

Neil

> 
> Here is the dmesg with drm debug: https://pastebin.com/t3XESC2w
> 
> Cheers,
> Maxime
> 
> |snip]
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
