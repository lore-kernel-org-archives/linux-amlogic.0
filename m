Return-Path: <SRS0=v2ss=SS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85B55C10F13
	for <linux-amlogic@archiver.kernel.org>; Tue, 16 Apr 2019 11:24:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5534520821
	for <linux-amlogic@archiver.kernel.org>; Tue, 16 Apr 2019 11:24:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="X7HGmABy";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="VLA9+5WB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5534520821
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Subject:To:
	MIME-Version:From:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KPrw+fD+rWXLh/zTp9tU5I6RnaXVWqyAIo6aBRSWW1M=; b=X7HGmABy4G9Cp9
	Tnr8znT4PVWF6dswMsCs0IrHGNvTBuPXc1VX+XM72XLrYIsgedWm2lHVcsvbZf+BGIW5ZuJIEU+0t
	2tZ2G7lL9iJEJVKFU9qs4MEDMEzFT+JfDYqQc0UbGvGG6BjUdhkWFV1JKGyrUGXJuqdw1aa9GWrO1
	B76UrnHpHwoAtuby2EI/WoyWWBvt+uk4OZosBOEwoo8ebl63jAL+F01OeEf7SLny3q1ZRBPA/8Okz
	8P9V+roqHVVXbY3lQkbJwRglD8Jp6k/bCNbXKjxSwI5PlgVcIAWBH8Unf+e41wJ0UFUjQGusFD7HS
	zKBHhN2F3UPl1IxjFx4Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hGMBz-0004um-5P; Tue, 16 Apr 2019 11:23:59 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGMBr-0004ib-Ca
 for linux-amlogic@lists.infradead.org; Tue, 16 Apr 2019 11:23:53 +0000
Received: by mail-wm1-x341.google.com with SMTP id y197so13069145wmd.0
 for <linux-amlogic@lists.infradead.org>; Tue, 16 Apr 2019 04:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:date:from:user-agent:mime-version:to:cc:subject
 :references:in-reply-to:content-transfer-encoding;
 bh=b/G5+2IKb4PAJeRbqkm/KrAQjVm2iADH4HhYLIXqUtE=;
 b=VLA9+5WBQh1N/5EA0d3gsKHXwN+KTGenFXZHf9Ki4Ecz4TNH+V9iJW7r8aOLDfntu/
 5ZZvtA8UxU4D4SjupNK1sDJPs1lzzKNm2CtHdDIfg8aqNrD8kSdLXKYx+i9IyaRh+HRW
 08+NUMPXg9F11fbmRgeCceckdvkIB7RDvFECr5gyFv95BR5M5tz1OnM3R4P4kJfbOPI1
 cRwH2XTfXtHLcU+/dXGURLgeiRiTVJMvM4yqfCLr8DWkOSug3OXH5MXvWMgRckFyMu45
 IwtMBpoGBiBnJbK6Ltp8NkTBctKTDmknAcWi7ZlPkOaz6V9gl/+bDDmp2cUdswb9AneZ
 uH2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
 :cc:subject:references:in-reply-to:content-transfer-encoding;
 bh=b/G5+2IKb4PAJeRbqkm/KrAQjVm2iADH4HhYLIXqUtE=;
 b=quBL/SFahIlrxzb0MGMoFz/3mYLGH/mTr9jDpAa07yhpHAfTfXnEGpdp0YnVLo2DYh
 DwiuBRG82rHUuAKearyLx8jWP+pvNeVMYgadoOP3062ASZG+0D+f27qhisMhHUjsQNan
 GmcwT2IcUx68GYar7Qx8UdzNvap7crV45qrl4qOud8DC9nfjzdhtIEdptIPQdQmqMKY1
 cmebJ9Q+L3v91bJ5s4OdolC+uGrwNt8pSBggkteegSDSGFA2TInJCY4/dulVs9iy2WYz
 bmXArs2XTlBSBC2gZ9kiNDxTWRs97c4esQbBR2QJ5pf/oP8xPIMcCoPn4fL3oEtnKQN3
 a2Lg==
X-Gm-Message-State: APjAAAWCEThVUkmiB6BgnRAJhgCi1wsARIrvxgCbPw17Fq8f0r41dtSv
 Q3MhanJemEGc+hOTyiBoEJ5Hcg==
X-Google-Smtp-Source: APXvYqzIfOFtHgxAEbRckGHwi/bONhwXTFCZSqWgjT/V4uHDXkHp5zRqZCbL83lPUll6gjId0M5lWw==
X-Received: by 2002:a7b:c3d7:: with SMTP id t23mr25270055wmj.62.1555413828814; 
 Tue, 16 Apr 2019 04:23:48 -0700 (PDT)
Received: from [192.168.1.77] (wal59-h01-176-150-251-154.dsl.sta.abo.bbox.fr.
 [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id c10sm61492893wru.83.2019.04.16.04.23.47
 (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 16 Apr 2019 04:23:47 -0700 (PDT)
Message-ID: <5CB5BB43.5040007@baylibre.com>
Date: Tue, 16 Apr 2019 13:23:47 +0200
From: Neil Armstrong <narmstrong@baylibre.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13;
 rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: Yue Haibing <yuehaibing@huawei.com>, airlied@linux.ie, 
 daniel@ffwll.ch, khilman@baylibre.com
Subject: Re: [PATCH -next] drm/meson: Make some functions static
References: <20190413141455.34020-1-yuehaibing@huawei.com>
In-Reply-To: <20190413141455.34020-1-yuehaibing@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190416_042351_462014_655EBEAA 
X-CRM114-Status: GOOD (  13.07  )
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
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org



Le 13/04/2019 16:14, Yue Haibing a =E9crit :
> From: YueHaibing <yuehaibing@huawei.com>
> =

> Fix sparse warnings:
> =

> drivers/gpu/drm/meson/meson_viu.c:93:6: warning: symbol 'meson_viu_set_g1=
2a_osd1_matrix' was not declared. Should it be static?
> drivers/gpu/drm/meson/meson_viu.c:121:6: warning: symbol 'meson_viu_set_o=
sd_matrix' was not declared. Should it be static?
> drivers/gpu/drm/meson/meson_viu.c:190:6: warning: symbol 'meson_viu_set_o=
sd_lut' was not declared. Should it be static?
> =

> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/gpu/drm/meson/meson_viu.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> =

> diff --git a/drivers/gpu/drm/meson/meson_viu.c b/drivers/gpu/drm/meson/me=
son_viu.c
> index 0169c98..b590723 100644
> --- a/drivers/gpu/drm/meson/meson_viu.c
> +++ b/drivers/gpu/drm/meson/meson_viu.c
> @@ -90,8 +90,8 @@ static int eotf_bypass_coeff[EOTF_COEFF_SIZE] =3D {
>  	EOTF_COEFF_RIGHTSHIFT /* right shift */
>  };
>  =

> -void meson_viu_set_g12a_osd1_matrix(struct meson_drm *priv, int *m,
> -				   bool csc_on)
> +static void meson_viu_set_g12a_osd1_matrix(struct meson_drm *priv,
> +					   int *m, bool csc_on)
>  {
>  	/* VPP WRAP OSD1 matrix */
>  	writel(((m[0] & 0xfff) << 16) | (m[1] & 0xfff),
> @@ -118,8 +118,8 @@ void meson_viu_set_g12a_osd1_matrix(struct meson_drm =
*priv, int *m,
>  		priv->io_base + _REG(VPP_WRAP_OSD1_MATRIX_EN_CTRL));
>  }
>  =

> -void meson_viu_set_osd_matrix(struct meson_drm *priv,
> -			      enum viu_matrix_sel_e m_select,
> +static void meson_viu_set_osd_matrix(struct meson_drm *priv,
> +				     enum viu_matrix_sel_e m_select,
>  			      int *m, bool csc_on)
>  {
>  	if (m_select =3D=3D VIU_MATRIX_OSD) {
> @@ -187,10 +187,10 @@ void meson_viu_set_osd_matrix(struct meson_drm *pri=
v,
>  #define OSD_EOTF_LUT_SIZE 33
>  #define OSD_OETF_LUT_SIZE 41
>  =

> -void meson_viu_set_osd_lut(struct meson_drm *priv, enum viu_lut_sel_e lu=
t_sel,
> -			   unsigned int *r_map, unsigned int *g_map,
> -			   unsigned int *b_map,
> -			   bool csc_on)
> +static void
> +meson_viu_set_osd_lut(struct meson_drm *priv, enum viu_lut_sel_e lut_sel,
> +		      unsigned int *r_map, unsigned int *g_map,
> +		      unsigned int *b_map, bool csc_on)
>  {
>  	unsigned int addr_port;
>  	unsigned int data_port;
> =


Acked-by: Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
