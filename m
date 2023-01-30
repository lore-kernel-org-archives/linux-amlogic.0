Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57300C54EAA
	for <linux-amlogic@archiver.kernel.org>; Mon, 30 Jan 2023 21:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4UKpYZEYYhYVlarR3CLT+OK2ZXlAAQ3NTB9KkuPFXds=; b=iv4gXWC96ONoI/
	AYCuMrWNZXRwHVeV1nha4lBI4gDQmEH59aEshuTaxKw8wAcobT3FrSWVHuN3GEmAgjM30ZKrIDM7n
	Ilv9Us6QSyMHiSg2wl2W2ABR7Nq1hV05JACAF+bHF5297zBvFG7zPSIjBxTlRVNxrt4MjX5tZz15I
	DKYNr+2fgLXVZlDNnN4P7SbxBYOb+zk26Pos8dHUEEPbxXjTOOs7e5qdYXQpPsruXzsPo9eJnLq/f
	LeDYpufAswUqOjoj5kSrCFFJYDypukJeI0hcb1g2xhAKL11D/DEUM5ZKWZkJrudL62J9wVuZepOZp
	UU9A8lHsUHpCDp0LxyJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMbas-005TmC-W9; Mon, 30 Jan 2023 21:21:39 +0000
Received: from mail-ot1-f51.google.com ([209.85.210.51])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMbae-005TiH-QM; Mon, 30 Jan 2023 21:21:26 +0000
Received: by mail-ot1-f51.google.com with SMTP id x26-20020a056830115a00b0068bbc0ee3eeso2225562otq.0;
        Mon, 30 Jan 2023 13:21:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2zpzrKyS9XxSvm98qW4QbIC/Am08CDM2xVesuhLYrLA=;
        b=NaZelNm1ZhmXRk/uPZh8pBIcSqhzd3BRuNTdmRhUWaqXimh/3NIqosY1n6Y90+/SAG
         3cK7U+BpIQakYAiq0ibwAKAN+XXDcnNFN2jugjcJUgJjcGnJxHvjAWiUtPbeDmRVS0au
         np80uo+Qax3VvrpOiLYSUbZtm3AcrDfLFaT11YOvtgMoUaV3D+pqI2gkHNLQoS1xwzvB
         Abk+UdgGqhyY8G2tERITWEmZMAn2/BEsmFahVHJJynrAmOcgVV6tRobvQDmARg1UBP7u
         tZt03TplY+1C6wY8i/VgoXEasaFQm6RxcwTcYJSCtJSEzC8eUrnh8+5OHlaFbuvF+XdH
         66gg==
X-Gm-Message-State: AFqh2kpmsUI8hbqiHefGhNCzcGv7TiCKpE0x5mPt7Rb8PO6P1nolpbdk
	IjnfXz8zkpLqrDXmnmeiKA==
X-Google-Smtp-Source: AMrXdXvJ8iNrfIQAEQZqn76K9ENlbNXf+Q64nNWqXvJpA7MtqgLrP0m1Q+AXwxcjZXO2EcUA4PdOvg==
X-Received: by 2002:a9d:1b6c:0:b0:66c:4d30:b69f with SMTP id l99-20020a9d1b6c000000b0066c4d30b69fmr25099087otl.24.1675113682417;
        Mon, 30 Jan 2023 13:21:22 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id k96-20020a9d19e9000000b0068bb3a9e2b9sm4296762otk.77.2023.01.30.13.21.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 13:21:22 -0800 (PST)
Received: (nullmailer pid 3506884 invoked by uid 1000);
	Mon, 30 Jan 2023 21:21:21 -0000
Date: Mon, 30 Jan 2023 15:21:21 -0600
From: Rob Herring <robh@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Thierry Reding <thierry.reding@gmail.com>, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, linux-pwm@vger.kernel.org
Subject: Re: [PATCH v3] dt-bindings: pwm: Convert Amlogic Meson PWM binding
Message-ID: <20230130212121.GA3468100-robh@kernel.org>
References: <cb62dfc0-cb3d-beba-6d0b-8db18583dda0@gmail.com>
 <c92b9e51-bb69-0712-0b29-3db3c9a29f8b@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c92b9e51-bb69-0712-0b29-3db3c9a29f8b@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_132124_869778_F84E6DC5 
X-CRM114-Status: GOOD (  12.02  )
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

On Mon, Jan 30, 2023 at 09:34:57PM +0100, Heiner Kallweit wrote:
> Convert Amlogic Meson PWM binding to yaml.

In the future, don't thread new versions to old versions of 
patches/series.

> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
> v2:
> - fix clocks and clock-names
> - consider that more than one compatible may be set
> v3:
> - remove minItem/maxItem properties for compatible
> ---
>  .../devicetree/bindings/pwm/pwm-amlogic.yaml  | 71 +++++++++++++++++++
>  .../devicetree/bindings/pwm/pwm-meson.txt     | 29 --------
>  2 files changed, 71 insertions(+), 29 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
>  delete mode 100644 Documentation/devicetree/bindings/pwm/pwm-meson.txt

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
