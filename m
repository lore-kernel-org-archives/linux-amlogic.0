Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3C3DC352A1
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Dec 2022 13:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KDlUHMADWfpHjD/jDctbiip/uNsSl+QSEhqfJ654a7A=; b=oXeHFECFt6npkw
	tZzSJKPIVWq2buK8UTZNFUBbxKveijv2PiAWbjP7tjwFTWEAJzh/hWOfro1AJ1s0FV1ZCVWorh6Hg
	dMncRbblE02qmOsWD5YFlrJxtUzKhfi4wuxZv8p7QAYUHm2kOSw/Fe7Sq2zLKU8H5X7nH2j8KhzJm
	wWN06ZXkI3y4LOEZMfVr/mwcKatCVACX3yB+id1NQwYk8q1btePCBRkxaqLwGD4TcGphKW57cMMLj
	8yAlyYHsSPx+U78VP35SAfKJ667LKkn7GpKvAJKXZOFiem7BxXm4lUVd9Gy7AjCEiRRSGkHahcvhb
	I+YWaG9iwxCMK8olDcfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2XeE-009W0g-IA; Tue, 06 Dec 2022 13:06:10 +0000
Received: from mail-oi1-f176.google.com ([209.85.167.176])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2XdY-009Vg6-Rk; Tue, 06 Dec 2022 13:05:30 +0000
Received: by mail-oi1-f176.google.com with SMTP id r11so11102986oie.13;
        Tue, 06 Dec 2022 05:05:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rrwbZJ2FtqdiY/vPwt8LzCwhlE5brQNmYQJ5C/oztSA=;
        b=DmwIQltlPxHEybOsl7HYWwfMIGA62S+zE4bsNEBQpDCZQKlWcIviZJ9BCh06P9YntT
         Im6elXkBNlCO1qyJsF2A7fADXYrook36S4ywi8BQlhsAzx88m84MKS70hI/FIFNNATGC
         EarI7Kwxc6C6AKq7eNiO+b5sdEPR/tCHexXPjpijg62i9GU4Z69ikEaNnJmQTSjO0XNP
         QzCtv4f++eToXO7WU6RjSyOR7bVOK6VdtSuRNX3uzgZayCWKlZUhaQiXj4/bPS/Sa5Hp
         yWgMM3JE3dwy52JmQgPlqirbIRNpWdeNBjOk2Do9JDlFNKirFN60t1Pni8woqA7cDZrW
         /Cpg==
X-Gm-Message-State: ANoB5pmOed0Gxs6L/0kespt9i352QaR/ppPZxxNKNul3YkIiksiEwANB
	O+ibM8YfJCvgl1jegabCgA==
X-Google-Smtp-Source: AA0mqf7QB/v7IlggjKBD6x/KqN9IIBVSGh0duRfsvstQud3W+Q+pd6KBR5mHK5Q1z7FhTSzvoSRH5g==
X-Received: by 2002:aca:911:0:b0:35b:f740:483d with SMTP id 17-20020aca0911000000b0035bf740483dmr8132174oij.133.1670331925570;
        Tue, 06 Dec 2022 05:05:25 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id l8-20020a05687040c800b0011f22e74d5fsm10626970oal.20.2022.12.06.05.05.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Dec 2022 05:05:24 -0800 (PST)
Received: (nullmailer pid 229892 invoked by uid 1000);
	Tue, 06 Dec 2022 13:05:23 -0000
Date: Tue, 6 Dec 2022 07:05:23 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Neil Armstrong <neil.armstrong@linaro.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, devicetree@vger.kernel.org, Joe Tessler <jrt@google.com>, Yannick Fertre <yannick.fertre@foss.st.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Thierry Reding <thierry.reding@gmail.com>, Jeff Chase <jnchase@google.com>, linux-media@vger.kernel.org, Alain Volmat <alain.volmat@foss.st.com>, linux-amlogic@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v2 8/9] media: dt-bindings: nvidia,tegra-cec: convert to
 DT schema
Message-ID: <167033192331.229827.9468903892650962280.robh@kernel.org>
References: <20221205151845.21618-1-krzysztof.kozlowski@linaro.org>
 <20221205151845.21618-9-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221205151845.21618-9-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221206_050528_969855_059D87BE 
X-CRM114-Status: UNSURE (   8.92  )
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


On Mon, 05 Dec 2022 16:18:44 +0100, Krzysztof Kozlowski wrote:
> Convert Nvidia Tegra HDMI CEC bindings to DT schema.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
>  .../bindings/media/cec/nvidia,tegra-cec.yaml  | 58 +++++++++++++++++++
>  .../devicetree/bindings/media/tegra-cec.txt   | 27 ---------
>  MAINTAINERS                                   |  2 +-
>  3 files changed, 59 insertions(+), 28 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/cec/nvidia,tegra-cec.yaml
>  delete mode 100644 Documentation/devicetree/bindings/media/tegra-cec.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
