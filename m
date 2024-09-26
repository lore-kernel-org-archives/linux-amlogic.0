Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37EC4CCF9E9
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Sep 2024 07:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KKt1MWV63XAuLwQxW+hyGMqOJ+s1BCEz8L6pvcgFY5M=; b=k2KeHmKzndF5o9
	aAJaGR6UxxsiyPAnNAMgKN1zmJ/lBpmogRS2x5OzTxsxeh2GFqL1EgvGcMIjN9skNVSHpicjrYFYY
	7V/HTlqZNBaeveAC6az9azLT2igB110TZ3TSzA25EMO54dTIM+UbzmdvPguy5NNIla5bFu/vE+U72
	sz5fwWRZQk0cWs/S4qftJIIoSwcubGyPN1zs+N5ndpau0mSEftD410VUb3cp2Diu0H0VgItlX9lF2
	eFlitDRTGvpBY4KFl/Rh3lOQf/cIyIVyG7IkGrAKoTktCjOUtx5IZr3uPnRXT+Qn9v1FJfZbUkAqs
	9+kgyYv0Rjj5v8Z06X0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stjAU-00000007YPo-37WA;
	Thu, 26 Sep 2024 07:44:06 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stizY-00000007WiG-0ZP5
	for linux-amlogic@lists.infradead.org;
	Thu, 26 Sep 2024 07:32:49 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-53654dbde59so1683919e87.1
        for <linux-amlogic@lists.infradead.org>; Thu, 26 Sep 2024 00:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727335965; x=1727940765; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8aonqfZhxhzRCigtKU2JDf5og9fZlc9KKVh/g2kla2I=;
        b=XF+31XYglE/tZ2VmcSk3MO6JvIeEy+c3mqZT+5bVUGUL7MXEqgQEO6hNbAEvrQLEsk
         u1S4YvdgGjKfauURKN6rd1zwDKT/qN7g42Aly9KYlwAmVgPGsZ7ko4+Ij66NUCTADhSX
         bX/7W1eYGifsP9qn31LISm2rvqepnd22ZRh4a+Io2kmYheMcnQ3umvzTawbi8YpiK9Ag
         dlmIJhe51cdpeDoSgZ0Qod2iWJi7R0OSXAutv9nt7SRK/iHGk/ZEGjhiSlHssw4rdg/h
         LE86cGeYl2tsBpkH3pgbGYeBYNLpozQK7SJwV/75Mkc+scN3NP6pdWB38RSYn7sKtnQv
         yfKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727335965; x=1727940765;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8aonqfZhxhzRCigtKU2JDf5og9fZlc9KKVh/g2kla2I=;
        b=B+dKGAzkM2cHjqEETaxf52ouM/FlzSUik7PtEKc/sdyL6Z1ZOQMxGM8YmSzYxj0G5m
         5U1yR+LDr9vntW+jcKJATJRn02WRndOnQIjQG5ed5vk0546Www/oU0kyl5DubXBG5bU7
         xAjdB62eRmVh0xEZSXpSLzgJMLVu1nhJMJLgSF6Jcwylz2Hdbt9Ya9y07aJb1WgQZn9u
         au9HAjTgiFQjvzfvDJWf+XX77SOTBJ7CgcFkqRvfzLzr1yQoNdo3fuXhaMbAn98m9wap
         Oj+1H30ONg/1navI4f4AM68WnAd7aL7I5qBIyTPI5YesZXqU5VS3MmjOybYr7+uKOsuj
         WMsg==
X-Forwarded-Encrypted: i=1; AJvYcCUABrwZpx4gz1EHJhIaGhnrFwp0SbTllNMMxclnKU6AnJ2yCo1e9FexdgYHZr6XsiKrzorhHx0PXvAOcYHd@lists.infradead.org
X-Gm-Message-State: AOJu0YxvGts/0WYZ0Axpxkw+5hhCJ7OkkPa+YpChcIzHQMTBP08yc3J3
	IITDr7uStey8HdPOBmtpG3fmVNEVfgh2a8/sQXzwvxhVqRDxWvur8WwdLrx9bJyJ78IaRU3GJ8c
	CI+CjhQ==
X-Google-Smtp-Source: AGHT+IFEJ3mGtjqHYi8+hQZO+ABBsYaf7BGxMD8HjL57H5h34gv/88G8VtZ+ToUkoIv8MyINwNfCgw==
X-Received: by 2002:a05:6512:304d:b0:52f:228:cf91 with SMTP id 2adb3069b0e04-53896bdeadamr669409e87.1.1727335965407;
        Thu, 26 Sep 2024 00:32:45 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-537a85e13edsm730901e87.10.2024.09.26.00.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 00:32:43 -0700 (PDT)
Date: Thu, 26 Sep 2024 10:32:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Stefan Agner <stefan@agner.ch>, 
	Alison Wang <alison.wang@nxp.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 0/6] drm: constify read-only regmap structs
Message-ID: <3i46wd7hqr5u3oxqlgyff4i27vxpg3spewkhby336hxmgbvmon@wijkq64pluzg>
References: <20240925-drm-const-regmap-v1-0-e609d502401b@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240925-drm-const-regmap-v1-0-e609d502401b@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_003248_231511_2B30E63C 
X-CRM114-Status: UNSURE (   9.04  )
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

On Wed, Sep 25, 2024 at 05:42:39PM GMT, Javier Carrasco wrote:
> This series adds the const modifier to the remaining regmap_bus and
> regmap_config structs under drm/ that are effectively used as const
> (i.e., only read after their declaration), but kept ad writtable data.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
> ---
> Javier Carrasco (6):
>       drm/bridge: dpc3433: Constify struct regmap_config
>       drm/fsl-dcu: Constify struct regmap_config
>       drm/mediatek: dp: Constify struct regmap_config
>       drm/meson: Constify struct regmap_config
>       drm/panel: ili9322: Constify struct regmap_bus
>       drm/sprd: Constify struct regmap_bus
> 

For the series:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
