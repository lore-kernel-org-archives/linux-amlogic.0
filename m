Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A525EB64DD
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Jul 2023 19:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Esgos676fE+8tMGxClQkQW7FjBo8Fn2tk4ujSim6+Ms=; b=DtvBeOtngY7zqn
	XF1U057bSkdZmNCJ93PiCvd/YyuBjTjve7CR2HOdCmpG9z5ltWW+r1YSzKouX75v7t8vginIMXY5w
	5LcNax0SwzQjEntyliQ/IORPjBzIhWja/JSlglCQH+VOU4RcGKN1TWdM+sxJ2LGz6DmJILAwyhMvQ
	qpu/OPL48MA93/vXjqWnS5uds5D5Mf/lSbKv7eD1KlwD6PdyTg11tvkVI3uiehlH3YlC/mUxEajXt
	+gz7V9uhEJkNTwV1aG71l94aE4Q2DJzWQgbdXpUEStqEUY/KdhI3EnyXM21922AAC+eldId7ei4Ei
	LF719ozQvbVYlgOit1PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHUKw-002Tai-0Y;
	Thu, 06 Jul 2023 19:08:18 +0000
Received: from mail-io1-f53.google.com ([209.85.166.53])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHUKt-002TZa-1r;
	Thu, 06 Jul 2023 19:08:16 +0000
Received: by mail-io1-f53.google.com with SMTP id ca18e2360f4ac-7835e5fa459so38198539f.2;
        Thu, 06 Jul 2023 12:08:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688670493; x=1691262493;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MDtpj3AemTprLuOeN9ET5glEPVq64dNxotKByZ/22z0=;
        b=BUT4+0FNN0SATVsg4lFcQv6kccIxpBEjNyFLJJfw49fr6j6aP8FQXUQ/h45wwQWoPd
         OZkZYu+id/SHHy0W9TbcV6yIQ+T40NC2SGF32L60IW8lOWlFQM5DINV5LlZiRz8UZ+Oh
         tsr8DySQQ7vHov0syuwJPwpIlGjTPUAIgmKyViNxXnT4dmf2oVOA6mNNBAVV97oBLwWN
         ibt2RT95Ij+7Xq0N/Dk+YB4B3RrcsA9OML6QQkXcqMVCBQqMbLHMuUPTCaFsYbXz2EfZ
         sTfMZ+9gTSdibqPrWvM9A+Ufnj5W+hkhB4IULcswGyBDiafwQ87P44XDUiyfbu27KqBQ
         gy2A==
X-Gm-Message-State: ABy/qLZuBHGX6rgQG2gA/Q952NEt+PZXiMFyd1nwAVnAHlvMuvFF9b01
	L6zvhPSGnlpaYE1FcUUE/w==
X-Google-Smtp-Source: APBJJlGcC2tN7uRy5/zmvOcJRSvJfJhaWa5WsJUy45o9yDL4txQsVMEV32bENG8vzc4/KNKPEfz9xw==
X-Received: by 2002:a6b:760f:0:b0:786:26f0:3092 with SMTP id g15-20020a6b760f000000b0078626f03092mr2893375iom.3.1688670493131;
        Thu, 06 Jul 2023 12:08:13 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id f8-20020a056602038800b00785ce1b3293sm690554iov.49.2023.07.06.12.08.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 12:08:12 -0700 (PDT)
Received: (nullmailer pid 163081 invoked by uid 1000);
	Thu, 06 Jul 2023 19:08:10 -0000
Date: Thu, 6 Jul 2023 13:08:10 -0600
From: Rob Herring <robh@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Heiner Kallweit <hkallweit1@gmail.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: amlogic,meson-pinctrl-common:
 allow gpio-line-names
Message-ID: <20230706190810.GA161389-robh@kernel.org>
References: <20230706-topic-amlogic-upstream-pinctrl-fix-bindings-v1-0-fa442d5aae91@linaro.org>
 <20230706-topic-amlogic-upstream-pinctrl-fix-bindings-v1-1-fa442d5aae91@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230706-topic-amlogic-upstream-pinctrl-fix-bindings-v1-1-fa442d5aae91@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230706_120815_609013_64630392 
X-CRM114-Status: GOOD (  13.39  )
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

On Thu, Jul 06, 2023 at 09:42:26AM +0200, Neil Armstrong wrote:
> Allow gpio-line-names property for the gpio subnode.
> 
> Fixes: 94df03a45276 ("dt-bindings: pinctrl: Convert Amlogic Meson pinctrl binding")
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../devicetree/bindings/pinctrl/amlogic,meson-pinctrl-common.yaml        | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-common.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-common.yaml
> index a7b29ef0bab6..28659f0389a5 100644
> --- a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-common.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-common.yaml
> @@ -34,6 +34,7 @@ $defs:
>  
>      properties:
>        gpio-controller: true
> +      gpio-line-names: true

There should be a range of number of entries.

>  
>        "#gpio-cells":
>          const: 2
> 
> -- 
> 2.34.1
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
