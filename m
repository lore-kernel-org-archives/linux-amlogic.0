Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49178C27C6E
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Jun 2024 10:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BbAILjtk1AVJZicE3+PQuYmKgzLxxhZjiGHfvXWuqqc=; b=uPfy6N54O9OPn2
	ww3m+6+MgqkdLleeEh86EaiBdMfW0G8YLGuYxZZBu5MN6K7LIja2UFySo3y2tueEDf1cEnB7RFE3r
	ozqCaFAlT9OKd2GdNJYt/d/qgeuk1hCv6iwAGQypCCxRA+VmVmuyv3q7Wffa7yuCKW8k2pEHtPyRY
	+dMxg6jItnpzkRLXdV8gZwNhaC1SD2rO/P/PveOIdh4qbl/2nnv6maMgu38+MAyoIfqLQ5qOV9+1b
	8LsacMDFapGr3bEyyMCEyJ0cU448P22heODhymVcr7wgiL+7qyOyCrU6Rnlz1iqz6cT+jmWS2p930
	IzuHDD0ObCxc+q1+fAhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI4HX-00000002T45-2MsW;
	Fri, 14 Jun 2024 10:35:43 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI4HR-00000002SzQ-0rTk
	for linux-amlogic@lists.infradead.org;
	Fri, 14 Jun 2024 10:35:40 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-52bbdb15dd5so2389724e87.3
        for <linux-amlogic@lists.infradead.org>; Fri, 14 Jun 2024 03:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718361335; x=1718966135; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aGAN2NxY+2dqaICcDThn1Gl9L9GbHbJmWxV3worL+eg=;
        b=b05vS2qVy5oIIUziGU8y4m6np64gM+A+amTb4zgwtVKfjUm4ga+Tb+6kuCfS8UOlI2
         hqPhy8JNuQ30HubPJh2QUUOhTwynIDYbTykuWlNjBEyzEK87tAGr76S+K03RF0MvAA1J
         q1rXB6LyqFq30L71WX3aXujkL4RcL2mPtXzGq5DkKdfToW5tJU0vV+wwJrhDVRrdCDfa
         3BgcgA+VcpYV5VQIiVQjM0KcLZiFUJhw8zPujXKA86E32MfI0Xda0st7eHPQJWdbN8dn
         VXaWbsROUHjdpaUdt8gcMTMtviCDyxNLeoxQIMWeno6yo5B/IG2uyonbg2lUgX9XANzr
         cH0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718361335; x=1718966135;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aGAN2NxY+2dqaICcDThn1Gl9L9GbHbJmWxV3worL+eg=;
        b=iR60dF3pzHGP8oJNxt3cSqE+HEKJNez+5R01uAWyXMWXtCnYEVcmXsx8u2XCYalfu9
         w3VYPWML+SMYKSIU8wrzBEYEiqfljyRk4lU8wvDHvDQfTt0tMRUYJsavhVt9B7GWFQQr
         hk/0F21VG4mCxJnhzYQSjE8ryufLl0aVpqMGYC29wYy3yUBStD0mZuEghTaD2EIwPBXZ
         6k74wMR8kiQMGT45RAJS7n9W6QAOrY2LiHsFf3Er01SFhp6ZNABkpHvN283D6lybqoPG
         cvRMrSRu+MbP+C56nImFeXw0hOb1Z4hp5vhYWPmrEDALUR507G4wVL51JdhaHo72cLXL
         sZxA==
X-Forwarded-Encrypted: i=1; AJvYcCW5Gcq8FbgwVimuLZr+kj1pTInR2cVueaLOdvs5ItOGP7X6ZUMdOUNhv+WFVytsg3XbTqNThvBKnJ2vcAuKCwqgpilqJDGVWWQGIwusog1+tWI=
X-Gm-Message-State: AOJu0Yw7V6ea0wf+CyIkkZJp5vYmU9LsdwDuFirkgQq6dw5MNjO2uscH
	oLEjJOVAPpjDpzDsxPN/ii6pcESmX7xlWrm/hBm0AsWhmOplhVHJo4WGKm4qSrA=
X-Google-Smtp-Source: AGHT+IG9296cngTsNvss2HWOM7KAlI/jj4Qy+Im6Q+mlyoACYXVlropKfCXjXHH3MK5suUqtTVw77g==
X-Received: by 2002:a19:f809:0:b0:52c:89ff:10bf with SMTP id 2adb3069b0e04-52ca6e999e7mr1289070e87.67.1718361335571;
        Fri, 14 Jun 2024 03:35:35 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ca2888363sm467688e87.278.2024.06.14.03.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 03:35:35 -0700 (PDT)
Date: Fri, 14 Jun 2024 13:35:33 +0300
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
Subject: Re: [PATCH 10/22] dt-bindings: thermal: qcom-spmi-adc-tm5: reference
 thermal-sensor schema
Message-ID: <os5vrqh7usscb2lmvwpzcea3uu2k2gbhhbfolwgoc7mc2tdjah@pt5ckx2gbfo7>
References: <20240614-dt-bindings-thermal-allof-v1-0-30b25a6ae24e@linaro.org>
 <20240614-dt-bindings-thermal-allof-v1-10-30b25a6ae24e@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240614-dt-bindings-thermal-allof-v1-10-30b25a6ae24e@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240614_033537_331150_021E7A4B 
X-CRM114-Status: GOOD (  11.96  )
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

On Fri, Jun 14, 2024 at 11:46:09AM GMT, Krzysztof Kozlowski wrote:
> Device is a thermal sensor and it requires '#thermal-sensor-cells', so
> reference the thermal-sensor.yaml to simplify it and bring the
> common definition of '#thermal-sensor-cells' property.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/thermal/qcom-spmi-adc-tm5.yaml | 8 +++-----
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
