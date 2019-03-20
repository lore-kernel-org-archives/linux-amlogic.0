Return-Path: <SRS0=2I4g=RX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2254C43381
	for <linux-amlogic@archiver.kernel.org>; Wed, 20 Mar 2019 09:05:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 738042184E
	for <linux-amlogic@archiver.kernel.org>; Wed, 20 Mar 2019 09:05:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gT8ZaRZi";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="UgXys/Yk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 738042184E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zLw7JoDjDDlND4Wfxvb/rTvrpcPeHWEOQ10QTRlEqEQ=; b=gT8ZaRZimJnVvf
	eTc2AafrYxZxQ7NPHZmZYMnwx+qo1bfBTQi7SLcgi2/cLbEIpFd2g3tNMy9EzwQVCKOpsvwj8B6L6
	BTeEWb1b0A4orpi3HYooMbNzneTueDAUqPo5kPzRYaMYA7rMdZYX/TcDoGUx2lIgdkyIr64F5Xokx
	Isi10mzyABGaaeLhPzwrwNuAlNK5TOkNnwbWog75fi/9xNvBgSq+yosE5a3v8bGfznhy+kx4lqJDz
	s4CYVc5bLYwc0GzNVGzyupyoT+O6kTwdQnCpYerQulH0NpulKLerJLmrERoqwcjHfG2KkedWolVej
	hl6USctDQfz5hxLrOL/A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6XAC-0004j1-AD; Wed, 20 Mar 2019 09:05:32 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6X9q-00045e-Ha
 for linux-amlogic@lists.infradead.org; Wed, 20 Mar 2019 09:05:13 +0000
Received: by mail-wr1-x442.google.com with SMTP id n9so1785080wrr.9
 for <linux-amlogic@lists.infradead.org>; Wed, 20 Mar 2019 02:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RQzgXpUy5ei3usYQ6WK/1U/tk6t8iy2sCzuXJ+U0vig=;
 b=UgXys/YktUaqh5iKlbOWxTmWg3gyfw+YYhCKEKYy8Ffc4Q3bT/vcAxcVmC/a8ChehE
 0DQpMrUjPnycI4dDMPctNdv/vMTumv/scmA8HR/k9E5g0SrOaYccZkPZWIDmjkyDJ2gV
 vgqkzvq081KY1dW3t966Qiicbk0SvGg16P+HN7ErdzxNP5ge33FJ7JGmcGZ8pTK79KQt
 Vjwo5adG0kfHRxOVOKZC84eJZepjlOXBnE2y35XXb+INM8hvKwJExy8vN86nc4SSaNLu
 LJT0wpo/FybSKPymcVUtQ+wqNm4+CzpAk5PmQGfYUpQrGlbeAEIC8D/QVlXhDB9lLRy8
 FDGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RQzgXpUy5ei3usYQ6WK/1U/tk6t8iy2sCzuXJ+U0vig=;
 b=pWrvR37zHC7map8IFbHE+7SZkN0Y+BJ/KRSF4I6JPdTRD1Ge6J6WTzEqaujzIP3VOc
 3mglSadA7AQbOcST5IeiEJgh5PC/pmA0W2Rd1aUxoWV1Y13fr3IrjCSEwmlitnmi/Jce
 MotP4avj4kvzPvHE6K5KLldAF9X7o+gM79zke+Yg/cweaSI2SLHqA6lfoAD/pbxKljhm
 teXq1mhr0ccB+uzE532PYTTM2ZkjwYT/xdXdKMV9OxhiV3cyTqS9rAzvdWlRUa+Wk5T+
 WRbpWmaxt/QiKY44kXkcKt9F6Spf0D+nuCWZlDFGEYubmZ3sg4G/dEGafibnGOKfUogY
 ivDQ==
X-Gm-Message-State: APjAAAU/bRNv72OJA6tcBmHh5Dc8Jyi1dzMg1prjjPRzZh3sGDMETvhG
 prTH3/yHw+M/wZb5XAlMEwta1fcoqaNb9NpT9htOgA==
X-Google-Smtp-Source: APXvYqzMkhGCQbYgprw3asmwlfB8aGzhKo6avgH+uXYdPwKKW+WTPm8sLLWF85att2OXv9+4n0TSeN6hJ+LrJZ1+0og=
X-Received: by 2002:a5d:6202:: with SMTP id y2mr20199699wru.29.1553072708376; 
 Wed, 20 Mar 2019 02:05:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190320081110.1718-1-narmstrong@baylibre.com>
In-Reply-To: <20190320081110.1718-1-narmstrong@baylibre.com>
From: Maxime Jourdan <mjourdan@baylibre.com>
Date: Wed, 20 Mar 2019 10:04:57 +0100
Message-ID: <CAMO6naz5bqq7_S_y4yFR-ALinB3ApoE3z3m_fymP2RbaqRotAQ@mail.gmail.com>
Subject: Re: [PATCH] drm/meson: fix TMDS clock filtering for DMT monitors
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190320_020510_661686_FDFF9B8B 
X-CRM114-Status: GOOD (  15.92  )
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
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Neil,
On Wed, Mar 20, 2019 at 9:11 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> DMT monitors does not necessarely report a maximum TMDS clock
> in a VSDB EDID extension.
>
> In this case, all modes are wrongly rejected, including
> the DRM fallback EDID.
>
> This patch only rejects modes whith clock > max_tmds_clock if
> the max_tmds_clock is specified. This will only reject
> 4:2:0 HDMI2.0 modes, who reports a clock > max_tmds_clock.
>
> Reported-by: Maxime Jourdan <mjourdan@baylibre.com>
> Fixes: d7d8fb7046b6 ("drm/meson: add HDMI div40 TMDS mode")
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  drivers/gpu/drm/meson/meson_dw_hdmi.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> index e28814f4ea6c..563953ec6ad0 100644
> --- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
> +++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> @@ -569,7 +569,8 @@ dw_hdmi_mode_valid(struct drm_connector *connector,
>         DRM_DEBUG_DRIVER("Modeline " DRM_MODE_FMT "\n", DRM_MODE_ARG(mode));
>
>         /* If sink max TMDS clock, we reject the mode */
> -       if (mode->clock > connector->display_info.max_tmds_clock)
> +       if (connector->display_info.max_tmds_clock &&
> +           mode->clock > connector->display_info.max_tmds_clock)
>                 return MODE_BAD;
>
>         /* Check against non-VIC supported modes */
> --
> 2.21.0
>

Thanks, this patch restores HDMI output with my old 1080p TV which
does not specify a max tmds clock in its EDID. (all modes were
considered BAD before).

Tested-by: Maxime Jourdan <mjourdan@baylibre.com>
Reviewed-by: Maxime Jourdan <mjourdan@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
