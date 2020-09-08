Return-Path: <SRS0=WuYP=CR=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 875E1C43461
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Sep 2020 19:50:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 367B720768
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Sep 2020 19:50:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZJhMF4/i"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 367B720768
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oO/oJQwQCTZd+wb7mdWu+3wLOJILaOxU+p3vOrHLrTg=; b=ZJhMF4/ipjN/F15v5w01TtTnM
	kI9fUg5qkoTdbJOyMB/Ay7BsLJmPGt3b0/7ueMoPH0aZ3vwHhu6pg1Ll7pHhnfAtfFt8ODMsqExR9
	6s9NfQOi7GdEH7rBCMzwUwMH0JcaLzS/XMHvV9XSB88E2lGMZ/6Ptma1UoBoyiyuagnoGCoAX//4e
	F73gq2o6TX5T/+luEKmBSuhzjAXXUAPpQ54XgqN3Czbjp13B/N+N2H0atpPkrLy3RKvzVXateDVXA
	sBsYuhVgZDmk7hmrLtWVKeC9/ir7VxqWVNyQi52j/its6SI+AQ6r6SSWBdHJVWwzufv/8ap4jsMgw
	CVgiOdx+w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFjd6-0005lZ-E1; Tue, 08 Sep 2020 19:50:12 +0000
Received: from mail-il1-f196.google.com ([209.85.166.196])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFjd4-0005kv-G4; Tue, 08 Sep 2020 19:50:11 +0000
Received: by mail-il1-f196.google.com with SMTP id q6so52076ild.12;
 Tue, 08 Sep 2020 12:50:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5c1HRgnQ3n06UIr0qlZyRVS1Vpy/Owe423E/eWb8Yz0=;
 b=OIsgvQctYZKMaekmlUS/UKA08CtIZ/N52j5cinvjOzCaRxD/DrO7KxRYnMdY12TJvD
 gavfrbhH9Yr2/BJCP5HEeuqX4S6q/HammXblognN7IcmlEB48hr+tzNItmeY4tt6yvCO
 A4UC/Lbcr4YReBPihhJQNaed6eXvthAp6O9AGMyDvc5CzQGL7gNffh60+Fg1tZ3wM8kd
 lw4bOCnpJrq1hECic+TWKu9dapUOTtaRerpxAdrKh1MIk0YsYXwpQ4tx2YqaRSIdmUlO
 3sKrFKa50y6K7USqQTNQXEFcj476As8hvVYnPUMUB8BJzQ/F3ZyaoBq1+AfNrtuJ39TE
 HM6Q==
X-Gm-Message-State: AOAM530lVX21xeQqkLspdYmLO8CgD/uWZ6ai5YKWg8kszRWzDvPk3P+E
 tnKy/VDPZnMuKxPhlFlH3Q==
X-Google-Smtp-Source: ABdhPJzcBJdUYSOqv5vyyPlfYhRkyAZLdFPz4Ih+Qvjiv4ZaD+Mgtxnccaffyn/7jgGO/9dLHjaRQQ==
X-Received: by 2002:a05:6e02:807:: with SMTP id u7mr360581ilm.67.1599594609068; 
 Tue, 08 Sep 2020 12:50:09 -0700 (PDT)
Received: from xps15 ([64.188.179.251])
 by smtp.gmail.com with ESMTPSA id z4sm132715iol.52.2020.09.08.12.50.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2020 12:50:08 -0700 (PDT)
Received: (nullmailer pid 794409 invoked by uid 1000);
 Tue, 08 Sep 2020 19:50:03 -0000
Date: Tue, 8 Sep 2020 13:50:03 -0600
From: Rob Herring <robh@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 1/3] dt-bindings: phy:
 amlogic,meson-axg-mipi-pcie-analog: remove reg attribute
Message-ID: <20200908195003.GB790974@bogus>
References: <20200907073402.26674-1-narmstrong@baylibre.com>
 <20200907073402.26674-2-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200907073402.26674-2-narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200908_155010_549401_686FD1B4 
X-CRM114-Status: GOOD (  15.84  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kishon@ti.com,
 repk@triplefau.lt, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, Sep 07, 2020 at 09:34:00AM +0200, Neil Armstrong wrote:
> The Amlogic AXG MIPI + PCIe Analog PHY should be a subnode of the hhi mfd
> node like the axg-clkc node.
> 
> Thus the reg attribute is not needed.

If the phy registers have an address then it should remain even if Linux 
happens to not care. The exception is if the registers are all 
interleaved with other stuff.

> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  .../bindings/phy/amlogic,meson-axg-mipi-pcie-analog.yaml      | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/amlogic,meson-axg-mipi-pcie-analog.yaml b/Documentation/devicetree/bindings/phy/amlogic,meson-axg-mipi-pcie-analog.yaml
> index 18c1ec5e19ad..a9040aa387cf 100644
> --- a/Documentation/devicetree/bindings/phy/amlogic,meson-axg-mipi-pcie-analog.yaml
> +++ b/Documentation/devicetree/bindings/phy/amlogic,meson-axg-mipi-pcie-analog.yaml
> @@ -13,15 +13,11 @@ properties:
>    compatible:
>      const: amlogic,axg-mipi-pcie-analog-phy
>  
> -  reg:
> -    maxItems: 1
> -
>    "#phy-cells":
>      const: 1
>  
>  required:
>    - compatible
> -  - reg
>    - "#phy-cells"
>  
>  additionalProperties: false
> -- 
> 2.22.0
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
