Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2530C4167D
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Nov 2023 12:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nL8V2j7m30vB8hnKf5kFhxb0wX/vqr4royT5AT5cKJo=; b=XgrqHxwv1R6nC2
	1ySB+17KuurSOzX6WS9JO62UPYqjYMQHq77AN4N4/aUOejeWUArz/3TExWh98K4qA2aZc0IV7cP1z
	1z6o2U9hltLvdGgu8k/DspyG/Jo7E60qYL85wPe848PtkuoLZ33Fyi+56zsZiARKGS/QHjfdbwsqE
	Hhhsp5/V7NSmy0KQDl0IVcZc0j1zlWCr/k6T+aE11r6FAi0l+tHgjcQh9QTPfLQodZ0P7bVuD5zcM
	H63Ty85sFe3QfDumh3l3kkGfca9PPXwWiQwQ38PsCXkZ4QPBmyVnUrWpSoIyywtf6N7Xn8raJk3iL
	HgHREPxvUGKnuqCzj8UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qzyMa-00Gav5-02;
	Mon, 06 Nov 2023 12:05:52 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qzyMS-00Gajp-2m
	for linux-amlogic@lists.infradead.org;
	Mon, 06 Nov 2023 12:05:48 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4084de32db5so38692805e9.0
        for <linux-amlogic@lists.infradead.org>; Mon, 06 Nov 2023 04:05:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1699272341; x=1699877141; darn=lists.infradead.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=Eo4meWKVFbrqc+IQu3vvUKMXOAHSBvoghj78YURGCoQ=;
        b=D5c8ppeCK2SbPJpmnJ744cZgGhi//gnY9xqrRz1ygpCBkYDHWjFiZ9UbdLJXbS66+9
         fFX8SpR1d7nN/fzjN8daotjqPT23lYfZx41adi55zP8mF9uq/QqL9OYisnGTDrv9l7O5
         Ybdmv1LDBxcz2uf6YrVGUuICweH2ddKkXpd8LtU37jbbp/MHuqu/eYA8r2m/88ukCfE8
         QgCAb8iDUdqCYcySsnjsHKz0wJb/neHn8rdvQXooXdDc0NE7xcUtaJkwkeo1jcmsFBRo
         /KU9rGgVSGWBdeMTadaJKADNw7jVwhY+jT00+x0RgMJecYSuyMmLtgYyrb5vPT0ejShH
         aZbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699272341; x=1699877141;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Eo4meWKVFbrqc+IQu3vvUKMXOAHSBvoghj78YURGCoQ=;
        b=hq6jLOVTVve7ZP0ss2bYGlfQSWrDPdld6avGk+gzNpZ+Yp/iKMo92BDv6HXDuZ278S
         neC7uZ6k0Ily7zuNyZrFgoTMzE+gG4+LfPytWKuLgv6PkvCn255tQOP5TfEIZNnhWML9
         Svm+qHqXV90cI/loCOULRykawlH3ifugQtIct1oWtZJWIIhshh9iAzKT4k/OeqMzTSgX
         x53AJe5y+hrmbbhf7VWDcmRkeM9uEIRM7zf/us9j0qerpve4Itx0rf93n2J1mIq277ac
         GLBC7OTD0Pl3K0ydst5DFQySofTV1x5a1waRccqR+Iz9QHpa7fkp7JdgLUgD5MH44z3k
         hpXw==
X-Gm-Message-State: AOJu0YzL+IXzbqqXH2i5MG1qKPDfHsuV2R98DLuqcDeAcDoesUKqSpJ8
	HCdgNbhYziAPujdUom0vcOTvhw==
X-Google-Smtp-Source: AGHT+IGu95NsFHRZTou3YhjXBBK5ogenE5avfEYXW4hsTBJuOW/jW6etIJgVfKslUMiWzjhlSUBZ4w==
X-Received: by 2002:a05:600c:3149:b0:402:8c7e:3fc4 with SMTP id h9-20020a05600c314900b004028c7e3fc4mr23843592wmo.30.1699272341427;
        Mon, 06 Nov 2023 04:05:41 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:78ae:2eac:2baf:467c])
        by smtp.gmail.com with ESMTPSA id p22-20020a05600c419600b00401d8181f8bsm11695356wmh.25.2023.11.06.04.05.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 04:05:41 -0800 (PST)
References: <20231106103259.703417-1-jbrunet@baylibre.com>
 <20231106103259.703417-3-jbrunet@baylibre.com>
User-agent: mu4e 1.8.13; emacs 29.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Thierry Reding <thierry.reding@gmail.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>
Cc: Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-pwm@vger.kernel.org, JunYi Zhao <junyi.zhao@amlogic.com>
Subject: Re: [PATCH 2/6] dt-bindings: pwm: amlogic: add new compatible for
 meson8 pwm type
Date: Mon, 06 Nov 2023 13:03:38 +0100
In-reply-to: <20231106103259.703417-3-jbrunet@baylibre.com>
Message-ID: <1jttpz9je3.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231106_040545_141365_647FCCF0 
X-CRM114-Status: GOOD (  24.64  )
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


On Mon 06 Nov 2023 at 11:32, Jerome Brunet <jbrunet@baylibre.com> wrote:

> Add a new compatible for the pwm found in the meson8 to sm1 Amlogic SoCs.
>
> The previous clock bindings for these SoCs described the driver and not the
> HW itself. The clock provided was used to set the parent of the input clock
> mux among the possible parents hard-coded in the driver.
>
> The new bindings allows to describe the actual clock inputs of the PWM in
> DT, like most bindings do, instead of relying of hard-coded data.
>
> The new bindings make the old one deprecated.
>
> There is enough experience on this HW to know that the PWM is exactly the
> same all the supported SoCs. There is no need for a per-SoC compatible.
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  .../devicetree/bindings/pwm/pwm-amlogic.yaml  | 35 +++++++++++++++++--
>  1 file changed, 33 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml b/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
> index 754b70fc2db0..3aa522c4cae4 100644
> --- a/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
> +++ b/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
> @@ -22,6 +22,7 @@ properties:
>            - amlogic,meson-g12a-ao-pwm-ab
>            - amlogic,meson-g12a-ao-pwm-cd
>            - amlogic,meson-s4-pwm
> +          - amlogic,meson8-pwm-v2
>        - items:
>            - const: amlogic,meson-gx-pwm
>            - const: amlogic,meson-gxbb-pwm
> @@ -37,7 +38,7 @@ properties:
>  
>    clocks:
>      minItems: 1
> -    maxItems: 2
> +    maxItems: 4
>  
>    clock-names:
>      minItems: 1
> @@ -70,11 +71,14 @@ allOf:
>                - amlogic,meson-gx-pwm
>                - amlogic,meson-gx-ao-pwm
>      then:
> -      # Historic bindings tied to the driver implementation
> +      # Obsolete historic bindings tied to the driver implementation
>        # The clocks provided here are meant to be matched with the input
>        # known (hard-coded) in the driver and used to select pwm clock
>        # source. Currently, the linux driver ignores this.
> +      deprecated: true
>        properties:
> +        clocks:
> +          maxItems: 2
>          clock-names:
>            oneOf:
>              - items:
> @@ -83,6 +87,26 @@ allOf:
>                  - const: clkin0
>                  - const: clkin1
>  
> +  # Newer binding where clock describe the actual clock inputs of the pwm
> +  # block. These are necessary but some inputs may be grounded.
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - amlogic,meson8b-pwm-v2

Made a mistake here while making a last minute modification
it should be meson8, not meson8b

Will fix this in v2.

> +    then:
> +      properties:
> +        clocks:
> +          minItems: 1
> +          items:
> +            - description: input clock 0 of the pwm block
> +            - description: input clock 1 of the pwm block
> +            - description: input clock 2 of the pwm block
> +            - description: input clock 3 of the pwm block
> +      required:
> +        - clocks
> +
>    # Newer IP block take a single input per channel, instead of 4 inputs
>    # for both channels
>    - if:
> @@ -111,6 +135,13 @@ examples:
>        clock-names = "clkin0", "clkin1";
>        #pwm-cells = <3>;
>      };
> +  - |
> +    pwm@2000 {
> +      compatible = "amlogic,meson8-pwm-v2";
> +      reg = <0x1000 0x10>;
> +      clocks = <&xtal>, <0>, <&fdiv4>, <&fdiv5>;
> +      #pwm-cells = <3>;
> +    };
>    - |
>      pwm@1000 {
>        compatible = "amlogic,meson-s4-pwm";


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
