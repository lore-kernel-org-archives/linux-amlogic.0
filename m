Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 205ACC021A6
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Feb 2025 09:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A3RpGhUe1NER1cnjiyuVNrjyRgHE407ph3ji9PzLbPU=; b=2Ej5X78J/aaFTx
	5ZeawP335pA1iQgMdsi7BUdFI66wh5K23FiVJuaC6/tHVmuZ1yl4l0cwOBXhSnP0i7zRAESEe0sWT
	QNLuEINqvlGqauzS5kaPHJMECb2076NgZkBQR53Sasbtpg1Nn6wP+R43uXpysGR7x5yOm7s7IDVpy
	RQwniEzEjTGk9QYhIg18jhUlmo+llWtWq6BQysU9UMPlMhe7TM2xsoomprT6nHqSz/kgT2H1yhp+p
	Zyq89Lz2ka/wqb64NqLRWfmAgcCYDQ7A/2dN/tLgEsqz+FOfSgxb0GwOYUZD/GJx6bbJbsEYZqnmv
	T6oEvhBvufkxQRItrgqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tirkA-0000000EGkN-43OU;
	Fri, 14 Feb 2025 09:12:18 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tirk8-0000000EGiX-0lzz
	for linux-amlogic@lists.infradead.org;
	Fri, 14 Feb 2025 09:12:17 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-38a8b17d7a7so1023912f8f.2
        for <linux-amlogic@lists.infradead.org>; Fri, 14 Feb 2025 01:12:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739524334; x=1740129134; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XWPLpS01eydUHu6GBaBUe8/ayY4CKHZMhz0y47NMUSQ=;
        b=fnmtQZB7OjHnhE5GPVkN9kIb0CDNxCsd+6eZ/PZfAEEoVroZvaRI7oPo/R1pYkCqqW
         q8wWwKPHzpyF8CI7B3Jx69Uwro8Ryfag3nwEcOE9F84lKNt/RCnS/8XJ06fpqTIc2fLp
         12p9Bv3YX7B9FGWESqUzA3F05KtR1OepxMbY9mJR/Vz8IxM3KnULO0fF9p1bELIiy0AY
         S9WkV/v+sqRGK6J7gvC7/SuRYhWZP0nGvtg5PwxZMXU0IMqWEcptudqf0WtQV5T78Rz2
         /10Cr3k3HrIFjuFla32WCOS04xJtu4IPMcTbOF9DdAgArt6XXJ0L5uKdG5K95lDg0oZq
         yvLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739524334; x=1740129134;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XWPLpS01eydUHu6GBaBUe8/ayY4CKHZMhz0y47NMUSQ=;
        b=LJ83lbcDbp2mwaWaLS0P2eyhKKJv9qMMQXwqlyLiWsu2+7PzinjWSOoATNNY/Or+ss
         QT80/XFte6WSw/gXI3i16vNA33FIi+3NhJE8ozkgxCdOPTCoBK+sSb/i/lYx20M3ABMe
         C4gVLy3RBP7Ieun/hY1+41ls1YetxN2QwpLNZFUQM1ihWP8uPOCwc4ix8YNIwPr+fsyF
         AdxPCFzpCVbmOlrOyaRsrOeRJG0DqWoz49QVJWmq9+nfAD6A/RwMvN4v0uBTpFrpXKDO
         Ofn9JjyrXc5uovyCvmz1b0WOnWB+kfuzofZe5LIuKy0TzKJRLqrP2q3GUhCh/a2YdEHA
         TKXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzHuCan2+KCvvXx1127HoP4kK6s+Fb7tQYAu4oRhW8B11C4JJn47x8zLEVOQy8gz+0nXuV/omZnpkGUkd4@lists.infradead.org
X-Gm-Message-State: AOJu0Yyc/s2EM4SFHlxiS1rjqjWuWsTKDo1KvmiVT+X24+4hTUU/jd2R
	nOG25SEvF7a8ADqONS9gi1TH9XHG7znxgxjECO7ZGULnh6UZ3VsKjQg0k9yY3sk=
X-Gm-Gg: ASbGnctL+Xzj0mC7Qcr9KODHH+lgxNbzPeKoDUbQ0nIOndqSR2psAKqTj3ZhEp6THfO
	zoQ5af3w2akDDVdLsMJqqMbrAi67UOlaFkF7dJuFazXNFKOos0gpJVDgCvXsVc1itYUYixNT/p2
	wnkxYTNn0A8eJDwXPqdpNOMh/BsV3LpJ1Rdq26HquIBmBJKIIjtYw/AD2x8skKcc01o+6LsLdQD
	oO0AmSKy2UwsfIiJh80cpz/JNjPdgRKX2PCTZS7Ckh0lx+BbDKyyV0nwrSxeY5BBvyXAZ7Mfid7
	hZ4EpQHADWtfxrc=
X-Google-Smtp-Source: AGHT+IHB7Zaq1DV8SNQlu/uvUkXW1GOYMzSJKw6n2qPshAIpNTdXKTBQ2IDut6nlYHPtUDgvHL/tTA==
X-Received: by 2002:adf:e390:0:b0:388:da10:ff13 with SMTP id ffacd0b85a97d-38dea26e7e4mr10175098f8f.21.1739524334488;
        Fri, 14 Feb 2025 01:12:14 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:baa6:bc65:b9db:3759])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-38f258dcc45sm4114605f8f.33.2025.02.14.01.12.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 01:12:14 -0800 (PST)
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
Subject: Re: [PATCH v2 1/5] dt-bindings: clock: axg-audio: Add mclk and sclk
 pad for s4
In-Reply-To: <20250214-audio_drvier-v2-1-37881fa37c9e@amlogic.com> (jiebing
	chen via's message of "Fri, 14 Feb 2025 10:13:40 +0800")
References: <20250214-audio_drvier-v2-0-37881fa37c9e@amlogic.com>
	<20250214-audio_drvier-v2-1-37881fa37c9e@amlogic.com>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Fri, 14 Feb 2025 10:12:13 +0100
Message-ID: <1jjz9szy8i.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_011216_220490_AE1B2886 
X-CRM114-Status: GOOD (  15.07  )
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

On Fri 14 Feb 2025 at 10:13, jiebing chen via B4 Relay <devnull+jiebing.chen.amlogic.com@kernel.org> wrote:

> From: jiebing chen <jiebing.chen@amlogic.com>
>
> add the s4 audio power domain, add the mclk pad, sclk pad
> and lrclk pad clock id for s4

Incomplete description of the changes that follows

Also the change mixes 2 differents topic for no reason AFAICT.

>
> Signed-off-by: jiebing chen <jiebing.chen@amlogic.com>
> ---
>  .../bindings/clock/amlogic,axg-audio-clkc.yaml         | 18 ++++++++++++++++++
>  include/dt-bindings/clock/axg-audio-clkc.h             | 11 +++++++++++
>  2 files changed, 29 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml
> index fd7982dd4ceab82389167079c2258a9acff51a76..364783c6f7572b09d57de2b35d33adb7bcf7db18 100644
> --- a/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml
> +++ b/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml
> @@ -21,6 +21,7 @@ properties:
>        - amlogic,axg-audio-clkc
>        - amlogic,g12a-audio-clkc
>        - amlogic,sm1-audio-clkc
> +      - amlogic,s4-audio-clkc
>  
>    '#clock-cells':
>      const: 1
> @@ -100,6 +101,9 @@ properties:
>    resets:
>      description: internal reset line
>  
> +  power-domains:
> +    description: audio controller power
> +
>  required:
>    - compatible
>    - '#clock-cells'
> @@ -116,12 +120,26 @@ allOf:
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
> +
> +    else:
> +      properties:
> +        power-domains: false
>  
>  additionalProperties: false
>  
> diff --git a/include/dt-bindings/clock/axg-audio-clkc.h b/include/dt-bindings/clock/axg-audio-clkc.h
> index 607f23b83fa7287fe0403682ebf827e2df26a1ce..75dde05343d1fa74304ee21c9ec0541a8f51b15e 100644
> --- a/include/dt-bindings/clock/axg-audio-clkc.h
> +++ b/include/dt-bindings/clock/axg-audio-clkc.h
> @@ -162,5 +162,16 @@
>  #define AUD_CLKID_EARCRX_DMAC_SEL	182
>  #define AUD_CLKID_EARCRX_DMAC_DIV	183
>  #define AUD_CLKID_EARCRX_DMAC		184
> +#define AUD_CLKID_TDM_MCLK_PAD0_SEL     185
> +#define AUD_CLKID_TDM_MCLK_PAD1_SEL     186
> +#define AUD_CLKID_TDM_MCLK_PAD0_DIV     187
> +#define AUD_CLKID_TDM_MCLK_PAD1_DIV     188
> +#define AUD_CLKID_TDM_MCLK_PAD2         189
> +#define AUD_CLKID_TDM_MCLK_PAD2_SEL     190
> +#define AUD_CLKID_TDM_MCLK_PAD2_DIV     191
> +#define AUD_CLKID_TDM_SCLK_PAD3		192
> +#define AUD_CLKID_TDM_SCLK_PAD4		193
> +#define AUD_CLKID_TDM_LRCLK_PAD3	194
> +#define AUD_CLKID_TDM_LRCLK_PAD4	195

I think we've been over the fact that s4 audio clock is very unlikely to be
compatible with the axg/g12 generation.

I doubt they should share the same bindings ID.

>  
>  #endif /* __AXG_AUDIO_CLKC_BINDINGS_H */

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
