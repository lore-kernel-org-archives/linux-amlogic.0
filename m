Return-Path: <SRS0=8EGG=SL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C005C282CE
	for <linux-amlogic@archiver.kernel.org>; Tue,  9 Apr 2019 09:18:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3AFEB2133D
	for <linux-amlogic@archiver.kernel.org>; Tue,  9 Apr 2019 09:18:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MeDGDkDh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="l8bE+rUI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3AFEB2133D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/UZlyZigQrCZCj+JT5SVdoXFbnptmDuI7vXH5pPbFfk=; b=MeDGDkDhzEATYc
	44MjipxF55FXYeq9TmTlkGQ/QrJKDFKLr+4+T+H+uZrZUHu0jL3fmd+U2+vLzg0jrRv+kxpmHBuKY
	c8bY1wyi4qd5L60jgB08ibPHKiGJD+xrKR8LQfxayCsK+SAF2aX0F6fc/vgnqHTgVF7lYUR8OSPQY
	orUHwfgidY9l6zpiRXxk93YA4fgKNz3t8tnvAq9Ab+KzYmusM4AR5Vo/aPoHU55Dtxx92lPHlTTRi
	0zGRW+goap/MrBDwa2x9R1mHg5ODAWLuorcFSBmeuynxUSBxI/AW5VMetnk+bcGua0bmpExGp6PDM
	A/oUl5W+rmtb2lxbBsVA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hDmtp-0003wI-3f; Tue, 09 Apr 2019 09:18:37 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hDmtm-0003vv-Gn
 for linux-amlogic@lists.infradead.org; Tue, 09 Apr 2019 09:18:36 +0000
Received: by mail-wm1-x344.google.com with SMTP id r186so1905383wmf.1
 for <linux-amlogic@lists.infradead.org>; Tue, 09 Apr 2019 02:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=ZnXexWYwI+T1QGQA8EYhFqtYMBOyyZDEmuQ12ZmRDng=;
 b=l8bE+rUIGwVfB1oZ5hssX+linwBOU2hhIIn9GSgX/UuJ6GU1gRkpCcRnX2JJ6H4p0y
 fDA+hxtY3P7sg2/GSTLv9zTh4mhlDKFvWMVUXyz74MZT35PEimLp9t/8xPrZX6bt3Bnt
 s6DGWDF+qO+i61TRhQfDFVmkm9TBCJVu5owc+WiDQ8lxc+ke+t1BK8qL7dDVUd/ODBbT
 MSBLwoNEJp6AFJ31UuZsmP1uqWXyiluZ2gq5HSEcoX4u1BkZONUIc1PFxJA3fsatwtif
 /WpsGmBpUMRjljCgxwuj5xYl19iw4W2rMPExVV7Olhp0YRaOl3bEArbxtP5WSAeCCqKt
 h2gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=ZnXexWYwI+T1QGQA8EYhFqtYMBOyyZDEmuQ12ZmRDng=;
 b=TCTj9BKY8fB2K2LXFV5gIaTV/TXgdosDl+NMjHaQdKpi/dIXd/LfddY58kNKAwUUgI
 Lx9qKXVSs8JK2yFLV95bKQrbZGSj4c7ck5DgXogbz3e0wPUXWVeUKVD/JNABn3zjNWn5
 XnJaslPjyxvXW2hzy3i5Bq/JvaogYddPV8pYp/e+n3YSFlxLCnR/ebc3zNKn8BVAg/x7
 6EiyrKRTykjNNPXm2STAkswKDj+qnmS33AoEEPutM+CJXkmM7e2Rq8vYlbeOHbvcBMnt
 HiSRwpD2OZtPpYhsJDPzKZdecCrie9h5EGXf+V8AXbIYrhUh8ShmpibOMmKHDPoNazmw
 b6yA==
X-Gm-Message-State: APjAAAU+ZA1hj532a2VGWDZs7uyoW1PiIXm/a52m6ww0OA5+TmrDMcjQ
 xhpJezqFIof/6juY5iMn0lhFDgUgYEZpJw==
X-Google-Smtp-Source: APXvYqyohQEHRDqWso0kiuJ9XeF1yOY39vuAmdKHqc9f/lGBq9dUGJWlDErk5yc2JUHg7zFZFOEexQ==
X-Received: by 2002:a1c:7512:: with SMTP id o18mr21658579wmc.68.1554801512762; 
 Tue, 09 Apr 2019 02:18:32 -0700 (PDT)
Received: from [10.1.2.12] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id b204sm22623214wmh.29.2019.04.09.02.18.31
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 09 Apr 2019 02:18:31 -0700 (PDT)
Subject: Re: [PATCH 08/11] drm/meson: Add G12A support for CVBS Encoer
To: Jerome Brunet <jbrunet@baylibre.com>, dri-devel@lists.freedesktop.org
References: <20190325141824.21259-1-narmstrong@baylibre.com>
 <20190325141824.21259-9-narmstrong@baylibre.com>
 <e5199bf4ff4a125414a8843ab4be0eb641ac5d91.camel@baylibre.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <9e59949d-c6c5-d5f6-c63c-f83c6032b272@baylibre.com>
Date: Tue, 9 Apr 2019 11:18:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <e5199bf4ff4a125414a8843ab4be0eb641ac5d91.camel@baylibre.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190409_021834_572155_3777A840 
X-CRM114-Status: GOOD (  18.87  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 09/04/2019 10:43, Jerome Brunet wrote:
> On Mon, 2019-03-25 at 15:18 +0100, Neil Armstrong wrote:
>> The Meson G12A SoCs uses the exact same CVBS encoder except a simple
>> CVBS DAC register offset and settings delta.
>>
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>> ---
>>  drivers/gpu/drm/meson/meson_venc.c      | 11 +++++++++--
>>  drivers/gpu/drm/meson/meson_venc_cvbs.c | 25 ++++++++++++++++++-------
>>  2 files changed, 27 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/meson/meson_venc.c b/drivers/gpu/drm/meson/meson_venc.c
>> index 66d73a932d19..6faca7313339 100644
>> --- a/drivers/gpu/drm/meson/meson_venc.c
>> +++ b/drivers/gpu/drm/meson/meson_venc.c
>> @@ -73,7 +73,9 @@
>>  /* HHI Registers */
>>  #define HHI_GCLK_MPEG2		0x148 /* 0x52 offset in data sheet */
>>  #define HHI_VDAC_CNTL0		0x2F4 /* 0xbd offset in data sheet */
>> +#define HHI_VDAC_CNTL0_G12A	0x2EC /* 0xbd offset in data sheet */
>>  #define HHI_VDAC_CNTL1		0x2F8 /* 0xbe offset in data sheet */
>> +#define HHI_VDAC_CNTL1_G12A	0x2F0 /* 0xbe offset in data sheet */
>>  #define HHI_HDMI_PHY_CNTL0	0x3a0 /* 0xe8 offset in data sheet */
>>  
>>  struct meson_cvbs_enci_mode meson_cvbs_enci_pal = {
>> @@ -1675,8 +1677,13 @@ void meson_venc_disable_vsync(struct meson_drm *priv)
>>  void meson_venc_init(struct meson_drm *priv)
>>  {
>>  	/* Disable CVBS VDAC */
>> -	regmap_write(priv->hhi, HHI_VDAC_CNTL0, 0);
>> -	regmap_write(priv->hhi, HHI_VDAC_CNTL1, 8);
>> +	if (meson_vpu_is_compatible(priv, "amlogic,meson-g12a-vpu")) {
>> +		regmap_write(priv->hhi, HHI_VDAC_CNTL0_G12A, 0);
>> +		regmap_write(priv->hhi, HHI_VDAC_CNTL1_G12A, 8);
>> +	} else {
>> +		regmap_write(priv->hhi, HHI_VDAC_CNTL0, 0);
>> +		regmap_write(priv->hhi, HHI_VDAC_CNTL1, 8);
>> +	}
>>  
>>  	/* Power Down Dacs */
>>  	writel_relaxed(0xff, priv->io_base + _REG(VENC_VDAC_SETTING));
>> diff --git a/drivers/gpu/drm/meson/meson_venc_cvbs.c b/drivers/gpu/drm/meson/meson_venc_cvbs.c
>> index d622d817b6df..2c5341c881c4 100644
>> --- a/drivers/gpu/drm/meson/meson_venc_cvbs.c
>> +++ b/drivers/gpu/drm/meson/meson_venc_cvbs.c
>> @@ -37,7 +37,9 @@
>>  
>>  /* HHI VDAC Registers */
>>  #define HHI_VDAC_CNTL0		0x2F4 /* 0xbd offset in data sheet */
>> +#define HHI_VDAC_CNTL0_G12A	0x2EC /* 0xbd offset in data sheet */
>>  #define HHI_VDAC_CNTL1		0x2F8 /* 0xbe offset in data sheet */
>> +#define HHI_VDAC_CNTL1_G12A	0x2F0 /* 0xbe offset in data sheet */
>>  
>>  struct meson_venc_cvbs {
>>  	struct drm_encoder	encoder;
>> @@ -166,8 +168,13 @@ static void meson_venc_cvbs_encoder_disable(struct drm_encoder *encoder)
>>  	struct meson_drm *priv = meson_venc_cvbs->priv;
>>  
>>  	/* Disable CVBS VDAC */
>> -	regmap_write(priv->hhi, HHI_VDAC_CNTL0, 0);
>> -	regmap_write(priv->hhi, HHI_VDAC_CNTL1, 8);
>> +	if (meson_vpu_is_compatible(priv, "amlogic,meson-g12a-vpu")) {
>> +		regmap_write(priv->hhi, HHI_VDAC_CNTL0_G12A, 0);
>> +		regmap_write(priv->hhi, HHI_VDAC_CNTL1_G12A, 0);
>> +	} else {
>> +		regmap_write(priv->hhi, HHI_VDAC_CNTL0, 0);
>> +		regmap_write(priv->hhi, HHI_VDAC_CNTL1, 8);
> 
> I imagine 8 stands for BIT(3) ? Could you add a define to explain (quickly)
> what it is ?

Ack

> 
>> +	}
>>  }
>>  
>>  static void meson_venc_cvbs_encoder_enable(struct drm_encoder *encoder)
>> @@ -179,13 +186,17 @@ static void meson_venc_cvbs_encoder_enable(struct drm_encoder *encoder)
>>  	/* VDAC0 source is not from ATV */
>>  	writel_bits_relaxed(BIT(5), 0, priv->io_base + _REG(VENC_VDAC_DACSEL0));
>>  
>> -	if (meson_vpu_is_compatible(priv, "amlogic,meson-gxbb-vpu"))
>> +	if (meson_vpu_is_compatible(priv, "amlogic,meson-gxbb-vpu")) {
>>  		regmap_write(priv->hhi, HHI_VDAC_CNTL0, 1);
>> -	else if (meson_vpu_is_compatible(priv, "amlogic,meson-gxm-vpu") ||
>> -		 meson_vpu_is_compatible(priv, "amlogic,meson-gxl-vpu"))
>> +		regmap_write(priv->hhi, HHI_VDAC_CNTL1, 0);
>> +	} else if (meson_vpu_is_compatible(priv, "amlogic,meson-gxm-vpu") ||
>> +		 meson_vpu_is_compatible(priv, "amlogic,meson-gxl-vpu")) {
>>  		regmap_write(priv->hhi, HHI_VDAC_CNTL0, 0xf0001);
>> -
>> -	regmap_write(priv->hhi, HHI_VDAC_CNTL1, 0);
>> +		regmap_write(priv->hhi, HHI_VDAC_CNTL1, 0);
>> +	} else if (meson_vpu_is_compatible(priv, "amlogic,meson-g12a-vpu")) {
>> +		regmap_write(priv->hhi, HHI_VDAC_CNTL0_G12A, 0x906001);
>> +		regmap_write(priv->hhi, HHI_VDAC_CNTL1_G12A, 0);
>> +	}
> 
> Maybe the values above are just magics taken from the vendor kernel, but if
> you can, it would be nice to break them down to help us understand what is
> controlled in these CTNL registers.

It's pretty magic values, but I'll do my best.

> 
>>  }
>>  
>>  static void meson_venc_cvbs_encoder_mode_set(struct drm_encoder *encoder,
> 
> 
Will fix in a follow-up patch,

Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
