Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 705EBCA5FF1
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Oct 2026 08:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GT+h4WCULk9IoR+aAGtXwfzgCaIavM8WlnRZgwqaKGg=; b=oKF9dAKnyg/qZD
	jyxcZFaLGF+fA4bv3ifNhY1AZDJXxYrHXaFGlYELiWyyWWxtEIpJRP6vENuyGP5GA4yqAMtChDRar
	L2Ks8x6vs2n4nxxq9qgydXNGJZqEYz3mobINeO7GfFSCRQ0EjEvRDafeYgs1xoNIaOX6gFYE/rtZu
	URA8Ec0rGBx1a3DxR5SdbmNjVLunsTHnQoWlhbq7sFzo1kFfQA2tYACiS3Wy8NvSbnzotDAzFrIX0
	0AYzVjYq7R/ZOpDeycGZB23dyIg8Dbj+8I2DU/7DwqeItQvjDjrEKZnpBlz3LQbXAxj82j2vvfgxC
	tMwckzMjmU3Ac9H5zOvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEN6R-00000001xiq-3Tzs;
	Wed, 07 Oct 2026 08:34:19 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEN6P-00000001xhr-0CNt
	for linux-amlogic@lists.infradead.org;
	Wed, 07 Oct 2026 08:34:18 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-48afcfc4bf5so3118681f8f.1
        for <linux-amlogic@lists.infradead.org>; Wed, 07 Oct 2026 01:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791362055; x=1791966855; darn=lists.infradead.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k2LWVlEbO4mtlO7zkAsTCCHDAZ0eNseSbBPcM0qvM7c=;
        b=JeaEDWOdo8M++NX7JD0la9Q/+zBHTcT0/qo6q24YufNTtcPu9uzsHNKNeH353D8kdS
         LnFSRkGAtyU5HNsF0h68lx76cKDhLYwhmcJWPszO1yzaD+9YYNwalTdjSGwU6uOTj8N9
         TrN/Kn3O2vsL4ENSgkwvpI+/Fk+aksGG4+9vwkc3yasqNesy2A9GbMNCVh15OVkjG5WD
         rfqIINV3Q/q6sSWo3jui18rY2gqz1bEmsPdjgFMi2aG0FbAir4+2hYcNwkjBkFpt5wNL
         2RUTbNwrkVTY6yVSBUL2yMEsy0UPjKRy05X/baA6Nq+jCurbNsrzgJCRA4qnbgddu2P8
         f+1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791362055; x=1791966855;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k2LWVlEbO4mtlO7zkAsTCCHDAZ0eNseSbBPcM0qvM7c=;
        b=hi2qsd+KnlUfamfSuSUyZiy/JQGczWTUeJTNd6iEyL/40m5wOrtCr5LFo1on0lOkFW
         kG1bV/0IZBGWoUbyeOg8z3YJjc3CDt4TQ1JVwg2uXcaIV7OYQHRmldv0soBkMgEahIhH
         OCJ/2LHs+O8Riq9UCuh55iginZLcPTFEKPgMmoiCCUPxlDudAtgbGviSP7qRVFn/u7dn
         sK58SSP1jIdIvveFQI1ndxdxtMiI61EovuBh8k+1BuHKOVmt1daRmtrYoa133H06JqYQ
         LoRd0VMC7x07Ieze2WAii2g7ts9I8e4z0oBY8xrV2iD6dk/urRmFqD/K9yjJNuta6uB2
         rAIA==
X-Forwarded-Encrypted: i=1; AKwUvByYDUZoGE3saCcHRCyohnO2hawR9pOPhP5YoaXm9HXaLqqO1iGpaIy2ScjA/U0aQ8Y/Ep+451HTOi86NYS7@lists.infradead.org
X-Gm-Message-State: AFuF++mN3oU021UBvyEol7FOlW8buVmn2/URr4Yg88DFVsrFhSMmdxvw
	0OC46heVF7XAXdZlAjhUkkwijF0whFkg/LHkf8CdV1RifXhOV/mvHvNC0y5sgLAhqrg=
X-Gm-Gg: AYBFou3BaApHHLr75DT3/pFaxvhL0v4Wt+m+Lzg5QNC9vYraHPKdmKmD5uRSQQT3J+J
	hEimuKNBV3GE0kGWeLXt1p5ZLfKPgtNrAHHlzEhlRudfrPlt39VlkYi6ACxdxBPq9X/mhZmtkQh
	csnz1CMrWhNw8c/YMbFYxSreH9PiNKsX2/THCw+gppcCfmbIsdBUOGA0gXdStgUB+tl9F6g5goi
	v8lAKSg3mGNX2+8mg4pD8tsS+LbLO4DCG1bd+DXhUEClz7PoR3/xWaKyVN8QgpoRN7mn1m+aW1A
	7kOOZ0asqxvr0186S6fpBdHFc58axAz64cLl9SxBA76UKjHGH3KPA4cq+B62F2HO7yFdyxSwjv+
	DtQMmqyVirSuPtXDnATBdwuwk3a36Mq9mYag+mYbpbTrLxRZjhIqXd4DFyEVQzDSMo2luLUtWWM
	bvEkzHLnUhh/9MEK5Psqm3A1PR381K1btomfydeac1XBvFZXcwQjw9FDvP86bTSS6UsHNe4l0fN
	29sVt9nCXe8GIwoK3/5ta13zw==
X-Received: by 2002:a05:600c:5254:b0:49f:c1a1:5222 with SMTP id 5b1f17b1804b1-4a180679d9dmr19886705e9.33.1791362055220;
        Wed, 07 Oct 2026 01:34:15 -0700 (PDT)
Received: from localhost (90-182-211-1.rcp.o2.cz. [90.182.211.1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a17f493761sm79454375e9.2.2026.10.07.01.34.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 01:34:14 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Valerio Setti <vsetti@baylibre.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin
 Hilman <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, Valerio Setti <vsetti@baylibre.com>
Subject: Re: [PATCH v4 2/7] ASoC: meson: build gx-formatter as a separate
 module
In-Reply-To: <20261001-audin-v4-2-2476646118b5@baylibre.com>
References: <20261001-audin-v4-0-2476646118b5@baylibre.com>
 <20261001-audin-v4-2-2476646118b5@baylibre.com>
Date: Wed, 07 Oct 2026 10:34:14 +0200
Message-ID: <1j8q49zz7d.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_013417_092518_618FA576 
X-CRM114-Status: UNSURE (   7.18  )
X-CRM114-Notice: Please train this message.
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

On Thu 01 Oct 2026 at 18:06, Valerio Setti <vsetti@baylibre.com> wrote:

> Instead of including it in 'snd-soc-meson-aiu', create a separate module
> for it. This way it can be independently selected by either AIU or the
> (upcoming) AUDIN.
>
> Signed-off-by: Valerio Setti <vsetti@baylibre.com>

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
