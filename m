Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B7DDC19F29
	for <linux-amlogic@archiver.kernel.org>; Tue,  2 Aug 2022 17:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TkT8oggC8VylXgKLj/swV9WNMRaIVL21pnsx44a8HSU=; b=IxyQuFt4kXtwkJ
	N26T3Jl/kiacKRu4WDh06n0BO8QXrD07SxL6DaB8FpfHWXvc3X1JRCUj+ma0La6iiJPBLjLga8HZe
	g1F/gv19GDKOlIrIquKfhHX7ZQqEe+j9FwALrfpwvKOMZhKf48Pllq01fs6NQwUN61b2XHjE5yIja
	IJ86weWgHsyVxIfO4TGcQzUl5S6Dm/wGOuQ8G6266/GPsOyf95iNybv3kPavAV0dh0mBD7AARs84h
	+BILgRYzoC2UaEnG/T03LnKhTKNrZIY8TU/OMsN1UCoSPbZ4ov4lcDqlqM8i6LOMLcwI3I2fQ8G/G
	7QvVTfHIytd7flsitPpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIvI3-00G08C-FJ; Tue, 02 Aug 2022 17:02:43 +0000
Received: from mail-io1-f44.google.com ([209.85.166.44])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIvHq-00G01U-0x; Tue, 02 Aug 2022 17:02:32 +0000
Received: by mail-io1-f44.google.com with SMTP id r70so11086465iod.10;
        Tue, 02 Aug 2022 10:02:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=MiaX/+ZZUFz6nZZMxDrJuCzbh/EX76DMC3XeOh9+aik=;
        b=UEz3VN/n8a6hhe+nfFytRTxYbolX8LgOjEjLZO2TdHvvhrLzi6v0wO4bJwsUq/2jyY
         iKhX9lgwwCzZjNW7nMbCHaFLVodVd5PNuXa0HO+xqzF4/11vvjYl3qXKIsdlDj19M5DS
         PUkHElYV6Dx6zTKUWpJmsq0KeCMNj6yVI16EQoZBup4bgXvLW/M5S0JUYUJjVHbNQQps
         agnc8QvhpHC8uBNgYO6gQHHMfHEWkO37+xVnjRAJV6Gak4lEFKUp0lqyUiYSnPYHhfQC
         r2kgCfRy0iKWu5F8cSfAciw8IdtzP9vixjp5T+xPh11NLfefLfZHaMDgdg3ZAXXFsRCk
         s1YQ==
X-Gm-Message-State: AJIora/UI6euRmx9Fg28ZAmHWehPz2tNL8rL6DSCqeUuDiK9QBpwIlzp
	XFM6qNZ6uwE4uBek/KjSsA==
X-Google-Smtp-Source: AGRyM1v+ycBOkCn7pHq4nN5H0WwvOFomY6D4GlbR9CpWXKVl5udKsotJWNvDjJbE0SIFRvQBOQTzWQ==
X-Received: by 2002:a6b:cd4f:0:b0:675:b0bf:d999 with SMTP id d76-20020a6bcd4f000000b00675b0bfd999mr7780143iog.193.1659459748570;
        Tue, 02 Aug 2022 10:02:28 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id x2-20020a5e8f42000000b0067b8e3be94fsm7288790iop.8.2022.08.02.10.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Aug 2022 10:02:28 -0700 (PDT)
Received: (nullmailer pid 296633 invoked by uid 1000);
	Tue, 02 Aug 2022 17:02:25 -0000
Date: Tue, 2 Aug 2022 11:02:25 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: devicetree@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, 
	Hans de Goede <hdegoede@redhat.com>, linux-amlogic@lists.infradead.org, 
	Dmitry Osipenko <digetx@gmail.com>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh+dt@kernel.org>, =?UTF-8?Q?Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>, 
	Dan Murphy <dmurphy@ti.com>, Ricardo Rivera-Matos <r-rivera-matos@ti.com>, 
	linux-arm-kernel@lists.infradead.org, 
	Iskren Chernev <iskren.chernev@gmail.com>, David Lechner <david@lechnology.com>, 
	Orson Zhai <orsonzhai@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Michael Klein <michael@fossekall.de>, Artur Rojek <contact@artur-rojek.eu>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Mike Looijmans <mike.looijmans@topic.nl>, 
	Tony Lindgren <tony@atomide.com>, Matheus Castello <matheus@castello.eng.br>, 
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>, David Heidelberg <david@ixit.cz>, 
	Stephan Gerhold <stephan@gerhold.net>, Jianxin Pan <jianxin.pan@amlogic.com>, linux-pm@vger.kernel.org, 
	Linus Walleij <linus.walleij@linaro.org>, Neil Armstrong <narmstrong@baylibre.com>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Michal Simek <michal.simek@xilinx.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Sebastian Reichel <sre@kernel.org>, 
	Purism Kernel Team <kernel@puri.sm>, "Andrew F. Davis" <afd@ti.com>, linux-kernel@vger.kernel.org, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>
Subject: Re: [PATCH 2/3] dt-bindings: power: reset: drop quotes when not
 needed
Message-ID: <20220802170225.GB279692-robh@kernel.org>
References: <20220726115748.101015-1-krzysztof.kozlowski@linaro.org>
 <20220726115748.101015-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220726115748.101015-2-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220802_100230_118517_5DD18706 
X-CRM114-Status: GOOD (  10.50  )
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

On Tue, 26 Jul 2022 13:57:47 +0200, Krzysztof Kozlowski wrote:
> string literals do not need quotes.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/power/reset/regulator-poweroff.yaml     | 2 +-
>  .../devicetree/bindings/power/reset/xlnx,zynqmp-power.yaml      | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 

Applied, thanks!

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
