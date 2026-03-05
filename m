Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45594EEF334
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Mar 2026 09:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ak0PTyM6YsFyfb2MSsyjoNyRBF4368SJuJp/7uoT1vw=; b=axsQX07X03ft6Y
	YirqKtgn7+MiqL9CDSqr1tHGAEpA1N0no0yCOEmaVetOamtepC/vjRROy5UHtb/1vhWPU+X2za5uL
	Q4CRNfDFwGNAoxtSmGdDN6+CROTcMKIjgcPZ9ck6O1bakXC5eOpaR+I08IX/ckb/ijlPl6POYHW3U
	wVfisqmyqKPHSVFF6GJ2D8arlyxrYXFZHg2d8VZGWEsxSlDja554BuveqipgqPbsSTPkSHMn9AO6L
	3F0xj0gMixqJyGBDpN2YMVUUegR+zEW+oQG5lrbvIQe6MN4+5zG/2u89Oo6YCUFi5ffvdsIuGAsX9
	osqgePG1ybdUjz/25qbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy4cR-00000001Gya-0YRC;
	Thu, 05 Mar 2026 09:03:43 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy4cL-00000001Gxn-0nSO
	for linux-amlogic@lists.infradead.org;
	Thu, 05 Mar 2026 09:03:42 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-483a233819aso76534015e9.3
        for <linux-amlogic@lists.infradead.org>; Thu, 05 Mar 2026 01:03:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1772701415; x=1773306215; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WAQoJ+BsCX38jr9SNjCgtieBrTo3xV4mFgoDVHJVgRk=;
        b=px+FeFRACG/gosituoEtcZqUmtKmL7KsRzrVYKIWoRIF1klSIh4yWtbQnm3xVMeBtW
         MwoV31gLX2HdRao6Y52/38l8h/OyYspDJJMAbwTUuSPWkPwKGxdGxBc/s3LCW3+lyW+s
         Ul+XH1Jmgsnn2wQSkJhehxZCfvsoiKIOhA2NhrX1m8D7k74/oQLFrm5jAhBdxCpnsl07
         2RUX1xcj6CTiWUdi7v1gfHqLJeFWh3gqH4lPtOHhug6q2d0HLTkAeznkDcIfBFKWSyk/
         daugJpSMJc06XhLWV5XYWdDb1ZEUAbLfbrNY7qEi0MsEtcBqScTwBPWGFdgvf/D6d3nX
         ZX0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772701415; x=1773306215;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WAQoJ+BsCX38jr9SNjCgtieBrTo3xV4mFgoDVHJVgRk=;
        b=lVQ6FSAqnBOUGvPiBaUdsUyu4xODl1KMh5W9D+j9rjX1JjcXD49YXIDbmSRKGp/SI0
         xEG2toxhss3sWkAAkcMw4UqnRKGwo/KggHl4NwDGB473jkDfDOylvrIADjWeJwDAIBc0
         nQHtGX4CMwy6Qz9BVIJ5AaJT5MRY/eZeywvUO3a9nLiVMUEKWGR5MadcwvwRYIKAblW0
         FEQwk4/+lTVoQPdAdzYsP/0pZUIW24QtGIig0jg7OOcRBOpem45TV3Ggx4xQ2QhcduD+
         I43xCfeIxVV0uAm/M5C4RuzBv0unoGEJEGOPjAJZ2U0M5Lvk/ruTHfHNWhWQ42frsnpE
         GDbw==
X-Forwarded-Encrypted: i=1; AJvYcCW7gbPe2Kk3yPS4RbOMp32pg6C0ITVbMzOG9lR1O5pdU3IzHhmqdifW/og9bnTqVMXWi3CYUu/4+a/JrF86@lists.infradead.org
X-Gm-Message-State: AOJu0YyWEYcS/5DzffEVz4EhNlrcFt84KSqx3BFNUrZfCseyHq1K0szT
	YYzyh9SCqxpzi4KBWLqnxNeMELZbN4y5AFphHV5tTgvvpDeMmmX/oyUa79xXte/cdfY=
X-Gm-Gg: ATEYQzweMOn2g2zNLLUbjNLKBETzAUymIRlB9XIsAWsJ/0SMFV2GWhZKv62aMCHYvIG
	+7yBC+dVecUfLhws1LkCO0SubUjYdH0F4LuAPDOEdEWutVwsYHXd1jKnFk0ek44V2QL0qId3cvt
	bYFHcOpzR75bpTMVZ240upKkkOlz6thF+8VCJrs1HQ6Z5JJq4v2hW5RbD175rKwiJT6NimNCA7r
	NvaoCPyBH4Y7edOBtbjpuKYfdQajEMz7Syz6eWbLVvifG5dOA3BoTNBVGzOrtpwJyzk4zniaRvj
	NRGHHQ3ACFju0H+f3GtPwf4p+wvEQeS+3wieh9W9CKASCFYDxsPz6MW6njSxrzw1ueUolVmvJC2
	eJpOWS6FDQ0oI1ewb9CYq8dXQ5vrlGY5iLAUQ3TrnEFac79Ge+CC8sNWFF1KojprwkDm/rNFh26
	15U17GXJi18rojo1/DblxT
X-Received: by 2002:a05:600c:1f85:b0:47e:e712:aa88 with SMTP id 5b1f17b1804b1-4851989f765mr93346545e9.31.1772701415004;
        Thu, 05 Mar 2026 01:03:35 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:5595:8450:af3:bbe3])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4851fad2812sm41178955e9.1.2026.03.05.01.03.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 01:03:34 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jian Hu <jian.hu@amlogic.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,  Kevin Hilman
 <khilman@baylibre.com>,  "Martin Blumenstingl"
 <martin.blumenstingl@googlemail.com>,  Stephen Boyd <sboyd@kernel.org>,
  Michael Turquette <mturquette@baylibre.com>,  robh+dt
 <robh+dt@kernel.org>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  devicetree
 <devicetree@vger.kernel.org>,  linux-clk <linux-clk@vger.kernel.org>,
  linux-amlogic <linux-amlogic@lists.infradead.org>,  linux-kernel
 <linux-kernel@vger.kernel.org>,  linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>,  Ronald Claveau
 <linux-kernel-dev@aliel.fr>
Subject: Re: [PATCH 2/3] dt-bindings: clock: amlogic: t7: Add missing mpll3
 parent clock
In-Reply-To: <20260305074328.639993-3-jian.hu@amlogic.com> (Jian Hu's message
	of "Thu, 5 Mar 2026 15:43:26 +0800")
References: <20260305074328.639993-1-jian.hu@amlogic.com>
	<20260305074328.639993-3-jian.hu@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Thu, 05 Mar 2026 10:03:32 +0100
Message-ID: <1j4imubqcb.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_010337_246618_C73F9AF5 
X-CRM114-Status: GOOD (  17.42  )
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

On jeu. 05 mars 2026 at 15:43, Jian Hu <jian.hu@amlogic.com> wrote:

> The mpll3 clock is a valid parent clock for sd_emmc and mipi_isp on
> the Amlogic T7 SoC, but was missing from t7-peripherals-clkc.yaml.
> Add it to enable proper clock parent configuration for these peripherals.

... but this changes the index of the clocks after this mpll3, and those
index are supposed to be stable if I'm not mistaken.

It is indeed more convenient to have the optional clocks at the end
as it avoids writing multiple <0> in DT when we do not have them.

At the very least, your commit description should say that this change
will not break any existing DT because these bindings are not used yet.

I leave it to the DT folks to say if the change is OK in such case.

>
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> ---
>  .../bindings/clock/amlogic,t7-peripherals-clkc.yaml       | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/clock/amlogic,t7-peripherals-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,t7-peripherals-clkc.yaml
> index 55bb73707d58..27cc1f331587 100644
> --- a/Documentation/devicetree/bindings/clock/amlogic,t7-peripherals-clkc.yaml
> +++ b/Documentation/devicetree/bindings/clock/amlogic,t7-peripherals-clkc.yaml
> @@ -24,7 +24,7 @@ properties:
>      const: 1
>  
>    clocks:
> -    minItems: 14
> +    minItems: 15
>      items:
>        - description: input oscillator
>        - description: input sys clk
> @@ -40,12 +40,13 @@ properties:
>        - description: input gp1 pll
>        - description: input mpll1
>        - description: input mpll2
> +      - description: input mpll3
>        - description: external input rmii oscillator (optional)
>        - description: input video pll0 (optional)
>        - description: external pad input for rtc (optional)
>  
>    clock-names:
> -    minItems: 14
> +    minItems: 15
>      items:
>        - const: xtal
>        - const: sys
> @@ -61,6 +62,7 @@ properties:
>        - const: gp1
>        - const: mpll1
>        - const: mpll2
> +      - const: mpll3
>        - const: ext_rmii
>        - const: vid_pll0
>        - const: ext_rtc
> @@ -98,6 +100,7 @@ examples:
>                       <&gp1 1>,
>                       <&mpll 4>,
>                       <&mpll 6>;
> +                     <&mpll 8>;
>              clock-names = "xtal",
>                            "sys",
>                            "fix",
> @@ -112,5 +115,6 @@ examples:
>                            "gp1",
>                            "mpll1",
>                            "mpll2";
> +                          "mpll3";
>          };
>      };

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
