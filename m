Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24450C83F1D
	for <linux-amlogic@archiver.kernel.org>; Thu, 10 Jul 2025 10:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xcEQiWbmjx/PX1GuKaPpzOMcBThu75SXFv6wXNLbOoY=; b=lh5nPZHY7e2/qA
	ks2p1T0S0PtAzojScNcKWKRzj/vDiDzN1hMD9bzU2F0ZxJAKQr4mu4tlCtIrPkQDjShwNUHZVVs9g
	fPVgw660hNGH05ZDhr8nAQipxB2KFI9tdOPluajKKE6a/53/l6LX4Gf4KeqvnfT7dvRqBJFO7BQ/p
	mVV1RDHdVpoxaoaZkto8gwZ/lDki8dGUkxaI3nKvlfz5brl0UUI6nXgNQb0180yQ33W1Tw0w5mLvL
	xuDox6O7RTSoc111ynSy5dXYvVjE8kz6yRD+OEQFheJE1EUfw4m6jTB9xtNAOqfnccIwK9nof9vuL
	52+QeNjFw4z009wBTjSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZoGx-0000000BQz6-0auA;
	Thu, 10 Jul 2025 10:12:59 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZn5r-0000000BFpw-0k23
	for linux-amlogic@lists.infradead.org;
	Thu, 10 Jul 2025 08:57:29 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3a4e742dc97so1190690f8f.0
        for <linux-amlogic@lists.infradead.org>; Thu, 10 Jul 2025 01:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1752137845; x=1752742645; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pEnfT6FkztCf1NEW9XiU9AdGyzA1VPDKN8Lo+OyIA2Q=;
        b=XE4PhRMvQxSoDRI2lDn+HHvcHAMfmiw5Z+8Ioud3FexAG0aAbvbO81ceru/GqiGi3n
         HQy+pc8WqETtw5KzVp93eqKFaMNoNCKlgFyO7NhliBRbhm8Ng2LJfAxdtoymkecL5q0X
         GMhS9c6evDVRodEWIXm0QLsIy+bPZ/S1wrq2Nw1Fs0UJEwt//HP4xsfn1TYK/PwhkZu5
         vK0kA9/orNJIM6GrJ9GIOVDKPAbViS/OGUKyjB61y20dOmL3C+8QTnBkl2eTYT0dEtAi
         GSIlX9LHghpRFCeSYgodikXrZkACQXTRlbOPqxhZPXfqvz9aUZHVTYNItNEXu5uNsEa3
         5gGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752137845; x=1752742645;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pEnfT6FkztCf1NEW9XiU9AdGyzA1VPDKN8Lo+OyIA2Q=;
        b=nZW0Y+K8D6JDSN8Ril19UA6eIF0FCIXF8Uxcy0+qL1znrTOgaSrU1wcavmxsL4FiyI
         0fN5EmUqmNe2bys1LszQI27J7+0B+F+Ayo1O/iEEhvp9un4fD730C/3gbX9aS3mXoa4i
         XMza/yRCaXl6vNEcVcs0LVWxHdA9mZV1LlKg12iunRwbwReJxyu2/JmRWKY0MPNWdR31
         5ZK8DLhw1j6QuvfqDkHuIQaapW0prxgNsByeVtWOcVNP0kDlWdc4yHHeFyLdexRRWdxO
         mCbtVUnMlwviWLY2mgm0hAZBdhnl0tk9NVRJ9uL3DYpCOr00NhVi0O8MGFNMuuB3hCGc
         nS+g==
X-Forwarded-Encrypted: i=1; AJvYcCUftKIcGzTeAE+fVCZCJf2gIQI+dAxI6At4StKcwSlKJRXiaVRRrphemdrd/xdSkR9YzwTTcg5d1jhOxnUX@lists.infradead.org
X-Gm-Message-State: AOJu0YwLdVMQFKmOh6gZYCGP+56qjV7WfVGSN9VcIvAEm7oflslz/s9W
	jM129Qsfj17hpuiDesCJVofFzWHDpkjUcKkVNADVdmCA8uam362r2K4LLzQt8ZK/L2U=
X-Gm-Gg: ASbGncv25qlitYdFymlNHvyGt7C9H5+FCRyiGnZ5R4xbY02rsTJTNyXdTTVJTUo+f3k
	re7KUxc687pVQ+5F8FtWYidntoH2B5mdZpBSJVfHe7xid93joeectLUFTwccNylIHpeqb2acz4k
	+QBk7uQ8pK5oUjDvSIWHVaSXyKKZKvoc4QxkuRi/OueYAnrECfuOVwfvh1iJArexiqc043LLcZN
	V47IKZW2GIrJIWNrJFWH7Z7KFvJfmFRfVqixiaKFqqRCPho8MGboVlWJpWfZBlwf673lEre3Tm+
	IFWh2qqlfzr5TLB96bYWYx5v2S7PtLz0DAFcHrfrR/wZeCt4ce5HCUdwXT/1DQ==
X-Google-Smtp-Source: AGHT+IGWtPkM7wNN2WAZ9ZBqWQxhQQPFiCu8f4+86eF186o2AjTuMIqbAyWP77bRc2dyw5l64yP3Qg==
X-Received: by 2002:a05:6000:2087:b0:3a4:f70e:bc25 with SMTP id ffacd0b85a97d-3b5e7f29674mr2434317f8f.27.1752137844837;
        Thu, 10 Jul 2025 01:57:24 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:9fcc:5953:3d1a:6b41])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b5e8e14cfcsm1284032f8f.67.2025.07.10.01.57.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 01:57:24 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: jiebing chen via B4 Relay <devnull+jiebing.chen.amlogic.com@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,  Mark Brown <broonie@kernel.org>,
  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>,  Jaroslav Kysela <perex@perex.cz>,
  Takashi Iwai <tiwai@suse.com>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Kevin Hilman <khilman@baylibre.com>,  Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,
  jiebing.chen@amlogic.com,  linux-sound@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-amlogic@lists.infradead.org,
  linux-clk@vger.kernel.org,  jian.xu@amlogic.com,  shuai.li@amlogic.com,
  zhe.wang@amlogic.com
Subject: Re: [PATCH v5 1/6] dt-bindings: clock: meson: Add audio power
 domain for s4 soc
In-Reply-To: <20250710-audio_drvier-v5-1-d4155f1e7464@amlogic.com> (jiebing
	chen via's message of "Thu, 10 Jul 2025 11:35:37 +0800")
References: <20250710-audio_drvier-v5-0-d4155f1e7464@amlogic.com>
	<20250710-audio_drvier-v5-1-d4155f1e7464@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Thu, 10 Jul 2025 10:57:23 +0200
Message-ID: <1jbjpsqv7w.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_015727_326128_CDE42E8B 
X-CRM114-Status: GOOD (  14.39  )
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

On Thu 10 Jul 2025 at 11:35, jiebing chen via B4 Relay <devnull+jiebing.chen.amlogic.com@kernel.org> wrote:

> From: jiebing chen <jiebing.chen@amlogic.com>
>
> The audio power domain has been detected on S4 device.

detected ?

> It must be enabled prior to audio operations.
>
> Signed-off-by: jiebing chen <jiebing.chen@amlogic.com>
> ---
>  .../bindings/clock/amlogic,axg-audio-clkc.yaml     | 55 +++++++++++++++++++++-
>  1 file changed, 54 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml
> index fd7982dd4ceab82389167079c2258a9acff51a76..c3f0bb9b2ff050394828ba339a7be0c9c48e9a76 100644
> --- a/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml
> +++ b/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml
> @@ -21,6 +21,8 @@ properties:
>        - amlogic,axg-audio-clkc
>        - amlogic,g12a-audio-clkc
>        - amlogic,sm1-audio-clkc
> +      - amlogic,s4-audio-clkc
> +      - amlogic,clock-pads-clkc
>  
>    '#clock-cells':
>      const: 1
> @@ -100,13 +102,15 @@ properties:
>    resets:
>      description: internal reset line
>  
> +  power-domains:
> +    maxItems: 1
> +
>  required:
>    - compatible
>    - '#clock-cells'
>    - reg
>    - clocks
>    - clock-names
> -  - resets

Not related to the decription ... and fishy ...

>  
>  allOf:
>    - if:
> @@ -116,12 +120,37 @@ allOf:
>              enum:
>                - amlogic,g12a-audio-clkc
>                - amlogic,sm1-audio-clkc
> +              - amlogic,s4-audio-clkc
>      then:
>        required:
>          - '#reset-cells'
>      else:
>        properties:
>          '#reset-cells': false
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - amlogic,s4-audio-clkc
> +    then:
> +      required:
> +        - power-domains
> +    else:
> +      properties:
> +        power-domains: false
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - amlogic,clock-pads-clkc
> +    then:
> +      properties:
> +        resets: false
> +    else:
> +      required:
> +        - resets
>  
>  additionalProperties: false
>  
> @@ -129,6 +158,7 @@ examples:
>    - |
>      #include <dt-bindings/clock/axg-clkc.h>
>      #include <dt-bindings/reset/amlogic,meson-axg-reset.h>
> +    #include <dt-bindings/power/meson-s4-power.h>
>      apb {
>          #address-cells = <2>;
>          #size-cells = <2>;
> @@ -198,4 +228,27 @@ examples:
>                            "slv_lrclk9";
>              resets = <&reset RESET_AUDIO>;
>          };
> +      clk_pad: clock-controller@330e80 {
> +        compatible = "amlogic,clock-pads-clkc";
> +        reg = <0x0 0x330e80 0x0 0x10>;
> +        #clock-cells = <1>;
> +        clocks = <&clkc_periphs CLKID_AUDIO>,
> +                 <&clkc_pll CLKID_MPLL0>,
> +                 <&clkc_pll CLKID_MPLL1>,
> +                 <&clkc_pll CLKID_MPLL2>,
> +                 <&clkc_pll CLKID_MPLL3>,
> +                 <&clkc_pll CLKID_HIFI_PLL>,
> +                 <&clkc_pll CLKID_FCLK_DIV3>,
> +                 <&clkc_pll CLKID_FCLK_DIV4>,
> +                 <&clkc_pll CLKID_FCLK_DIV5>;
> +        clock-names = "pclk",
> +                      "mst_in0",
> +                      "mst_in1",
> +                      "mst_in2",
> +                      "mst_in3",
> +                      "mst_in4",
> +                      "mst_in5",
> +                      "mst_in6",
> +                      "mst_in7";
> +      };
>      };

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
