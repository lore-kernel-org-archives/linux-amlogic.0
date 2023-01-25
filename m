Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8D21C54E94
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Jan 2023 20:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ictGcsNgD0OVTdXftue+5Vz/DlwxegwdP5zp+sMufcw=; b=gbFHrl1dINN50F
	UZlzmjh9xjCJRXdBW0Y2OELLH/TyJ7Dh+0/INqK0Mi7m1HuFmHGloPWVGikvu0odwcK9qTGN323Q4
	U5LKv4kE88yuq9Y/O3nfgXSfY7W52N3AKCnsiHNz6tdF+/bfVI2a30maUTMrQ81HUQEXhIYKh13sk
	uq/RGXp6cf8R+Wco40ZhruDejWwVvQeCfqE+rnbkVk3kjtDmXwuO50J/ifaAP4sOMZO1cPLHMpk70
	JWYnAxtCuJKN5VtsBa/Ui7YtDZprU39+yMwO0YfRDjIm0b0RpMt9bVuu+zPAs3c8e5e/9RN0zC1Ph
	YkFD6aXeuV9UjkyKYyrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKmE2-008eOp-G2; Wed, 25 Jan 2023 20:18:30 +0000
Received: from mail-oi1-f180.google.com ([209.85.167.180])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKm43-008Zsk-E4; Wed, 25 Jan 2023 20:08:12 +0000
Received: by mail-oi1-f180.google.com with SMTP id r9so17238132oig.12;
        Wed, 25 Jan 2023 12:08:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n1p3FdYLlGUAChSL+8xP1SW3yYfJGghI7cagrX3Bi/I=;
        b=K/KPYU0hyFXH2kE6Q7M6aMlaJW38E+dXTDbJ3KccYrYd6MbYxs3SE/s7wFY6hT9RWL
         9AFNyTJcnwbeQEJ15xpavAZDv00ERS5fvjjJuZCJs24uJ+sUDYAsoulVpA3f/8LbtXNM
         g7rbmI9qHmonA81S9Cll4AN+UET//Zqpnho5d7UfJtFYBWDhvzCZOFbHUPp3aOhFSWiV
         rUOtAzIcdXdocZ6ikLdRG2fo7srhqAmAMnAlZMxiF4c9CsUgP+OHIISzroc8DoWYSx8T
         T+gm13wBzyJiFEKrGLtBJvSq+pmqcPEnAADXUWectNyu8iCC5aYrCSeGLyNdqmuL6iZo
         ZTRw==
X-Gm-Message-State: AFqh2kqQH+VpM0MJOARlaJxaVnK0Pz8scut3Bx65Bu/ZC8wh0L42X4Ma
	HCoklXbjijB8hMyy5LcIXA==
X-Google-Smtp-Source: AMrXdXseqabcyHulKdSW9gY6uTAUwCSIlEbwqpw1soFhskncwZCdeRj5URGKhSfWNKhae8zY1f8dDg==
X-Received: by 2002:a05:6808:189d:b0:364:d523:e138 with SMTP id bi29-20020a056808189d00b00364d523e138mr18874315oib.32.1674677284798;
        Wed, 25 Jan 2023 12:08:04 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id b18-20020a056830105200b0068646a8223bsm2528460otp.57.2023.01.25.12.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 12:08:04 -0800 (PST)
Received: (nullmailer pid 2785052 invoked by uid 1000);
	Wed, 25 Jan 2023 20:08:03 -0000
Date: Wed, 25 Jan 2023 14:08:03 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Michal Simek <michal.simek@xilinx.com>, devicetree@vger.kernel.org, 
	Fugang Duan <fugang.duan@nxp.com>, linux-riscv@lists.infradead.org, 
	Kevin Hilman <khilman@baylibre.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Fabio Estevam <festevam@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	linux-kernel@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>, 
	Pragnesh Patel <pragnesh.patel@sifive.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Peter Korsgaard <jacmet@sunsite.dk>, 
	NXP Linux Team <linux-imx@nxp.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, 
	Rob Herring <robh+dt@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-serial@vger.kernel.org, 
	Sascha Hauer <s.hauer@pengutronix.de>, Tomer Maimon <tmaimon77@gmail.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, linux-amlogic@lists.infradead.org, 
	Chester Lin <clin@suse.com>, Lubomir Rintel <lkundrak@v3.sk>, Le Ray <erwan.leray@foss.st.com>
Subject: Re: [PATCH v2 06/12] dt-bindings: serial: 8250_omap: drop rs485
 properties
Message-ID: <167467728253.2784879.8231136375928061202.robh@kernel.org>
References: <20230124091602.44027-1-krzysztof.kozlowski@linaro.org>
 <20230124091916.45054-4-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230124091916.45054-4-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_120811_538039_33450B6C 
X-CRM114-Status: GOOD (  10.42  )
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


On Tue, 24 Jan 2023 10:19:10 +0100, Krzysztof Kozlowski wrote:
> The binding references rs485 schema, so there is no need to list its
> properties.  Simplify a bit by removing unneeded entries.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/serial/8250_omap.yaml | 5 -----
>  1 file changed, 5 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
