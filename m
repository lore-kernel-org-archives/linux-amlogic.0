Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5751DE77197
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Jan 2025 22:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4AiXzGhweaUs7LcQm1s2+uDXmslXLGD9zb1abiFF4w0=; b=iEhMJ7iYy6pD0l
	WQ6vH2Br1Eyb6eMhxfitQP5H9FNaIi4fJ9f+nQJUdYYQMdSrAO4lbzeAND8GRK2Oaj2APEk/Rmlmb
	LgIMI9SgD1RY36dwYzLUEXGw+myPj2NkYK/bsdmFCYPgJoYBJZDWvRfvhUe9cWpb79FUX8Q/Q3wK9
	ffA1mc5PUBEDnfMIP88BjVKdOVRKf1wXFXh/lb95nsctWuRnprAjypvv+4dgb4rtB6IRLgKqdi3yQ
	vwCEURMTZdiLIUWFkbVygHnemJ7TWTldzr2JIQ8qDm68sgDw/nDuV3CMWJLxd/BolbeSGycKmneJX
	013FIQDFiJMWInHmXt3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVHy3-00000006POQ-2knL;
	Tue, 07 Jan 2025 22:22:31 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVHy0-00000006PMv-1Fih
	for linux-amlogic@lists.infradead.org;
	Tue, 07 Jan 2025 22:22:30 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-53e384e3481so15196039e87.2
        for <linux-amlogic@lists.infradead.org>; Tue, 07 Jan 2025 14:22:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736288546; x=1736893346; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6ESQnJJ6RaWplIB/jgPT0AvvoPiUybJLXeZ80lh+Xy4=;
        b=LlzVtzp8kvCsJlcxmIHLrWr2728rYFUQn257rNLuyWCtFyEyHr5/axk3xDWStzNuI6
         +5IcC3vHL2slIJBVwLfyEm4W0P/Owz9NsHLZrO0NXt86n0oKroB63HO4+H2JcQwTRBoD
         gk7NxnpcqqlBPKmtkyU+jWpLscXZcZmk27EDhK0MBoEm0oc2A7U4r5DD+wjQMyMRiUFl
         Qh1CjpV38rJhq7q//KdgivKolNbz5rTrnev0ZNRPCT01so3fTto7slWGMm4zL/MS3P9B
         ZHcPXnnkdvrfk7hCsA6HCf8TRWxOCMa1YAyF99AiXoQTafiUCS8TH5JpZKRJeI1DuH4q
         40+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736288546; x=1736893346;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ESQnJJ6RaWplIB/jgPT0AvvoPiUybJLXeZ80lh+Xy4=;
        b=WRXrNUkcppQk05PL4Y51kCsGLS8RCsg76fhmVJEJz95ZUFo5xxVW7M9uP0JvGaPb67
         Lk9VuoB7K7D499acHqVRsFhyfjxKrNpUvth7Md212n5bdGaZKjM3hR/VAxnVukGIRdmZ
         L3dfF5vzL8CQcZ8WfTogPkfReq8kppeNmOaI4NJChSiQj5A86SeZmTNU7cQQJQln59iG
         bgCpjSTXxQDBR6Wy/zf4xIK2atoF4/XSBhTIHEol132iewiZi1Tt8e6CkRWD3hC9QLVn
         dooD0hdsCQOzvpiubNRL8emTHJFM/3/a2TMn1yAi8rSKNeRjlisqdW/3+nXeIndrUlil
         R4Xw==
X-Forwarded-Encrypted: i=1; AJvYcCUz58fLsmQOIhsh1go2+fIauqQllVcz7MTAjFIoe7Tlhm3dPWba8SvjUrrdBe85onxecBN64xyvP6gRd0kc@lists.infradead.org
X-Gm-Message-State: AOJu0Yye9sBZAstLu2m+CZMsNjEqwkdW44VJhCHF4v38PVVFskVhI8ic
	Dgi6itgSuFNAZ4xD3GNxciGzzsY8ilX/abPx8PTkOOSn8ORa7UGRtCTOgx3HMAU=
X-Gm-Gg: ASbGncu7gUs646wjwjXil6af44VwyZRSTO+Wy8zslCdjWNF5vgHbz1J/rTgOZCTlWzO
	qWQbzOmwcusvwir9tM5eQIxSeOM5FTxbU2p7kWXV5tziRZGIIOMzYUxid1wq8+PLNi7wtj77GmT
	tlnsdMg/KdkT2oSSF2rhcIkZFfWhh7bmL6hXakFcfFh9CFWb6DjoiB6XOBSYVujHKVBmUnkMfWm
	NNfgipsirSLLoAsSZRGKFjloLBrYrP4I52G+K/u95wpN2k3l5xkyHGIIonOzZ28rHz2JFpo2BC2
	T1qvTb8kevREMDca4dptqgqMQNSBV31lWixo
X-Google-Smtp-Source: AGHT+IFnS+89P+R20rxSVwXMFgmVIida5oAviwnvCG7UgPRL6sqycM/IAnw4EINYUJaJOUGjeMeCug==
X-Received: by 2002:a05:6512:23aa:b0:540:358d:d9b5 with SMTP id 2adb3069b0e04-542844ad98bmr149812e87.0.1736288546084;
        Tue, 07 Jan 2025 14:22:26 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54223832b6csm5379607e87.273.2025.01.07.14.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 14:22:24 -0800 (PST)
Date: Wed, 8 Jan 2025 00:22:22 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Lucas Stach <l.stach@pengutronix.de>, 
	Krishna Manikandan <quic_mkrishn@quicinc.com>, Jonathan Marek <jonathan@marek.ca>, 
	Mahadevan <quic_mahap@quicinc.com>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Jacopo Mondi <jacopo+renesas@jmondi.org>, dri-devel@lists.freedesktop.org, 
	linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, linux-mediatek@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: display: Correct indentation and style in
 DTS example
Message-ID: <g5u4xazpsgoxes3bwowufrdd266uhwqw2qidqs3tm4wq2qbk6h@bpzh4cnwybaj>
References: <20250107125854.227233-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250107125854.227233-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_142229_192959_81BDFED8 
X-CRM114-Status: GOOD (  14.10  )
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

On Tue, Jan 07, 2025 at 01:58:51PM +0100, Krzysztof Kozlowski wrote:
> DTS example in the bindings should be indented with 2- or 4-spaces and
> aligned with opening '- |', so correct any differences like 3-spaces or
> mixtures 2- and 4-spaces in one binding.
> 
> No functional changes here, but saves some comments during reviews of
> new patches built on existing code.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../display/amlogic,meson-dw-hdmi.yaml        |  8 +-
>  .../display/bridge/fsl,imx8mp-hdmi-tx.yaml    | 28 +++---
>  .../display/bridge/samsung,mipi-dsim.yaml     | 66 ++++++-------
>  .../display/mediatek/mediatek,aal.yaml        | 46 ++++-----
>  .../display/msm/dsi-controller-main.yaml      | 98 +++++++++----------
>  .../bindings/display/msm/dsi-phy-10nm.yaml    | 40 ++++----
>  .../bindings/display/msm/dsi-phy-14nm.yaml    | 34 +++----
>  .../bindings/display/msm/dsi-phy-20nm.yaml    | 36 +++----
>  .../bindings/display/msm/dsi-phy-28nm.yaml    | 34 +++----
>  .../bindings/display/msm/dsi-phy-7nm.yaml     | 34 +++----
>  .../display/msm/qcom,sa8775p-mdss.yaml        |  7 +-
>  .../bindings/display/renesas,cmm.yaml         | 12 +--
>  12 files changed, 221 insertions(+), 222 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> # msm

I think we can take it through drm-misc-next (or even
drm-misc-next-fixes) once we get acks from Renesas and iMX maintainers.

-- 
With best wishes
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
