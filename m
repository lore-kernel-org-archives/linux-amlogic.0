Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFC96C7619A
	for <linux-amlogic@archiver.kernel.org>; Wed, 12 Apr 2023 13:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+yHR05RlSR2nwUuA/fKkq29ZUXCMXFYK71/I3uxCosA=; b=dpiovrMf/MDwZ1
	9AB8oFWRUoQyvPdCtxvmusCKz1D5+2qI4vzDwAnzBssrgFWaIs4AC2A9A441onTK02cLjODuWob/R
	GjN843e5nZtSFeLmf+I+RXj1HpjgOGsauGbIpSpPIyjnGCfgHqzA/gIyUbJjvNoiFW9Pmv6OFSXv+
	XDyllSZjsqafXkfvbHBMk2xWJLVZqXpEZS+jloyG6acFea28xxFdS2vPHNKrNOLduJKsWGHkpGSba
	PdZP+HHjo97o1LDNPReij34WIDCSXT0q8MToAlvKHSNRkcO5uImyAoZZSENmAD50HcYXtyCm22LFV
	gDiSA+v/oOGp/x5il/IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmank-003O7P-2g;
	Wed, 12 Apr 2023 13:46:20 +0000
Received: from mail-oa1-f47.google.com ([209.85.160.47])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmanh-003O6s-2k;
	Wed, 12 Apr 2023 13:46:19 +0000
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-1842e8a8825so13761931fac.13;
        Wed, 12 Apr 2023 06:46:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681307177; x=1683899177;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e9LJNXi7ThfER3Q1hIKQ2Q7ZDEK5eNuLphLK92f+qek=;
        b=ZjcrA52M1E2xPp428QYi3FSJdEEyytAGd/e9MBktifQOBXa1YLRjYAOId8WAwGMBJJ
         ofwoxm9gkCxv9ZDbGBJUm69AiK8QY1i18S3956zdVWUjM2tujJCB5uzFF7giWZ2ARgIs
         Bla4hm6wl2JFLIspm7PY9omLBq//QvV5uqkgFZArnN8BVbxgNVSMR1+/MuIioh5BGJXZ
         Sy2lyNkYisLn4nFOCDoT1dE8ZzLShqUudEj/PEU/uwhSrJy1Ro/irEe2V5Q7TSMH0xNt
         QTvxa/HrSNjPQIv8UCKNlzcU4ivy33tOOvuxUO6fFh9eb4Z6t3AZwW9D2BP+HGBiuXwJ
         IfZQ==
X-Gm-Message-State: AAQBX9fuVUB6bkZXnChE3F2Z5B+kbsq8a/WgyFix2kfMXKNSMfRRe48Z
	WWxTwKQrEHjVIDY3AT1Qnw==
X-Google-Smtp-Source: AKy350bWdptJOMt5Rq/RspEgq7+COWs65y9hDkmpUsYoMkj/BLsWgSwRgWLmHLHU7QpMyjUQJT6+1g==
X-Received: by 2002:a05:6870:9593:b0:15f:e044:23b2 with SMTP id k19-20020a056870959300b0015fe04423b2mr1550794oao.7.1681307177033;
        Wed, 12 Apr 2023 06:46:17 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id u4-20020a4a9e84000000b00524faf3d2d7sm6926840ook.41.2023.04.12.06.46.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Apr 2023 06:46:16 -0700 (PDT)
Received: (nullmailer pid 2217552 invoked by uid 1000);
	Wed, 12 Apr 2023 13:46:15 -0000
Date: Wed, 12 Apr 2023 08:46:15 -0500
From: Rob Herring <robh@kernel.org>
To: Dmitry Rokosov <ddrokosov@sberdevices.ru>
Cc: mturquette@baylibre.com, jian.hu@amlogic.com, khilman@baylibre.com, krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org, jbrunet@baylibre.com, linux-kernel@vger.kernel.org, kernel@sberdevices.ru, sboyd@kernel.org, linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org, rockosov@gmail.com, neil.armstrong@linaro.org, martin.blumenstingl@googlemail.com
Subject: Re: [PATCH v13 3/6] dt-bindings: clock: meson: add A1 PLL clock
 controller bindings
Message-ID: <168130717511.2217492.4753998979663647449.robh@kernel.org>
References: <20230405195927.13487-1-ddrokosov@sberdevices.ru>
 <20230405195927.13487-4-ddrokosov@sberdevices.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230405195927.13487-4-ddrokosov@sberdevices.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_064617_891971_7AD2EECB 
X-CRM114-Status: UNSURE (   9.74  )
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


On Wed, 05 Apr 2023 22:59:24 +0300, Dmitry Rokosov wrote:
> Add the documentation for Amlogic A1 PLL clock driver, and A1 PLL
> clock controller bindings.
> Also include new A1 clock controller dt bindings to MAINTAINERS.
> 
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
> ---
>  .../bindings/clock/amlogic,a1-pll-clkc.yaml   | 58 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  .../dt-bindings/clock/amlogic,a1-pll-clkc.h   | 20 +++++++
>  3 files changed, 79 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml
>  create mode 100644 include/dt-bindings/clock/amlogic,a1-pll-clkc.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
