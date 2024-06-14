Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDB03C27C6E
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Jun 2024 10:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8oE81MaV1wt2z6ocs+lyYSRp05Cmi3YtIi6LQGp/BIA=; b=b+IHWyoF82G2YV
	42ms7/hVT5M5f8BEv+eLKB0ceFdmY2b/TqQvcsrPtFfw9kMdYbaMpuuyQRTML5z1mNhfgvG/IArnc
	21N7jYlQcO8kAbmCY247HbJJ4w7gNeEe36LbHXqydnJYRppSvqkU4Ati0PI6vEEEcPuBactL4tZTC
	2RlpqhoRyqtmHD8cPuBT7qLIAVRMgDUX2uW4vtjz8/6ZdSUmLxt7gz4AQ20WyM7xQ5Ml25nwyOYPH
	uB8iSPqP4Ma0VG+9AdY5jqP3CHbr6Tu1VY+5SwQOISaCNAZw8kDOTVtJ1ybAN3vJhkqZPsGG+NKE3
	Qhu6WDQ6C0ukxGLSw/0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI4HH-00000002SwL-3ZRs;
	Fri, 14 Jun 2024 10:35:27 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI4HF-00000002Suh-2qU2
	for linux-amlogic@lists.infradead.org;
	Fri, 14 Jun 2024 10:35:27 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-52b78ef397bso2885543e87.0
        for <linux-amlogic@lists.infradead.org>; Fri, 14 Jun 2024 03:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718361324; x=1718966124; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gi0zKyxT3hCd9nb/MhrUUh7myaChKF1I5PdBUyc2GXs=;
        b=wNa9FF2iW/dqnyT8FfqO2qVJ36xW+O+kcdEbPmibXP3+P3u3KLqJx1xKjXIHsznx81
         xdIYVTXdkM6wWA01K0KdyfPcxYG5wPOwpJTLOhv+edMmKjxDcwDhbPLLoJbcLkg7ogmg
         5v0bez0jpMgT4YoPbg7jeSoVXyuJZtA8KvqaJYON8MKHZ/wP7jSIaPkmlcN22eXt7wGO
         KYT+1YxShxNrtrAe5xYLxrBcryUqTttzNPsM1g+9KcNHdc8VPvr8FEHSVJKj6pMy0/s6
         MnyRqaCEMiIIztt6VldyyGPpRC6gq3Mdf6WUB91F+2X0e/L4Ey6YFmkcmNgdv4Lcrm5a
         GSDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718361324; x=1718966124;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gi0zKyxT3hCd9nb/MhrUUh7myaChKF1I5PdBUyc2GXs=;
        b=t1MSxlLc+8epCqjVwsLWdUCC+PWb6N5XgNIjb2frGWql8Agtds4O6U6h9zRyScV4S/
         vDg9ijaLlb3Cc2coEdk6DhLMTcuzsT/CBnFgghsmdiAIXgh4R1GoosmD9MbzQd4P1h3k
         LYvcP1/aBt0NToyKdjrioS74kLGi9BjwTzBlJjCBB6o7V0VrtAWFKo1/teSts7TWAlxS
         6i8jsvjOGKcjenUEOxxwsIgldgehEwiz5jR4SiVaVCHZ+20QIgSRJavwnHsYGbxXlTDv
         aiDlHeXwDGN8XojiDuRc8fTHl22QAkjxDINSozx28vs4Y9Ehw7M/Ko41zYxTA2Kx5CRy
         02Ag==
X-Forwarded-Encrypted: i=1; AJvYcCWNqOlQ5xavfAcwNCfNxZ1WxVd4FdLnMqfwWFwUp94WFlS6JSKEJ0RwBsIE5U8d9N/d90C06ryPgptqzH3e7yXwMTdvzusGCagHuq87CTZnTpk=
X-Gm-Message-State: AOJu0YyGcZGKRTdnkuWzdxL1wL20dmA58C5IstXNoZV/s930QQRpe9cf
	efAatq5bi1Y+vakIfPyuvoz8IUYFJ6AIfbI1z6UWZOFpK5SiHdl3E4bufDR3ssw=
X-Google-Smtp-Source: AGHT+IF21atwqR62ijL3XLbekBscy+usmTEKarUelgvxFuWKneWXxFSinPdGquI11kE+MEGG3syk0w==
X-Received: by 2002:ac2:4649:0:b0:52c:94ad:9b26 with SMTP id 2adb3069b0e04-52ca0464493mr1605471e87.30.1718361324088;
        Fri, 14 Jun 2024 03:35:24 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ca2872578sm468370e87.130.2024.06.14.03.35.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 03:35:23 -0700 (PDT)
Date: Fri, 14 Jun 2024 13:35:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Guillaume La Roque <glaroque@baylibre.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Vasily Khoruzhick <anarsoul@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Anson Huang <Anson.Huang@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Amit Kucheria <amitk@kernel.org>, 
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, Heiko Stuebner <heiko@sntech.de>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Pascal Paillet <p.paillet@foss.st.com>, 
	Keerthy <j-keerthy@ti.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, zhanghongchen <zhanghongchen@loongson.cn>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Bjorn Andersson <andersson@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	imx@lists.linux.dev, linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, Florian Fainelli <f.fainelli@gmail.com>, 
	linux-rpi-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 09/22] dt-bindings: thermal: qcom-spmi-adc-tm-hc:
 reference thermal-sensor schema
Message-ID: <mobms3s3tibh6wljulwr3okof2msvewed55ukecj3bkdfbgech@blk6udpuy5ov>
References: <20240614-dt-bindings-thermal-allof-v1-0-30b25a6ae24e@linaro.org>
 <20240614-dt-bindings-thermal-allof-v1-9-30b25a6ae24e@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240614-dt-bindings-thermal-allof-v1-9-30b25a6ae24e@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240614_033525_775282_103495EF 
X-CRM114-Status: GOOD (  12.07  )
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

On Fri, Jun 14, 2024 at 11:46:08AM GMT, Krzysztof Kozlowski wrote:
> Device is a thermal sensor and it requires '#thermal-sensor-cells', so
> reference the thermal-sensor.yaml to simplify it and bring the
> common definition of '#thermal-sensor-cells' property.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/thermal/qcom-spmi-adc-tm-hc.yaml          | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
