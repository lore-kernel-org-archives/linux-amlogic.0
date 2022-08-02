Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42631C00140
	for <linux-amlogic@archiver.kernel.org>; Tue,  2 Aug 2022 17:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fo8ZEKsq4Qg7n7Sv+HgVfR6Yu1vQwqvQ+Pz/9c3uxfI=; b=Xu1O/k1sj4Vc2h
	2Cu0P+D/mkSu+AQDWfjbLgj+DXlKq+sTRt5niIGFeAtCgqtnJfAeN8Zww3kKSyxO/w0UPn1lUxMlY
	s6+WzpAx7ZKDbI4gLVnY8Qgvhd1zzRSp3RAdWHORpo0KIiBdIF0JTFg548j3v5t0HMCyUqDmC7VSr
	TF/jZaQKtflkTheksgGVTh+JIT5JXlHmeCFety8OHEgZyMfSK02UGDiGLSlwwO765XxtOYf3rFwhU
	5xq+P11euEM4S3mD5LgIn8LDnCt1wFyvgzGHiang3XaUbVJbXLZwCPrm0FdB5Xd7Bib2VYKEYSiWY
	ByfkcWkURV+57y99BRvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIvIQ-00G0Ip-VO; Tue, 02 Aug 2022 17:03:07 +0000
Received: from mail-io1-f50.google.com ([209.85.166.50])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIvHv-00G055-2S; Tue, 02 Aug 2022 17:02:36 +0000
Received: by mail-io1-f50.google.com with SMTP id c185so11098901iof.7;
        Tue, 02 Aug 2022 10:02:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=0574V06d4DveCOys7RsnN5l2UlxXC7328YWoYfFQnSM=;
        b=vflbhlhSCaLpLPny5ql+2GFLb0bGp5dZuXww3LXl/rfg0NqHppRRoGQ+GwYUIZn0qF
         6YGQy/UomQzqnrtrWtkpcbmN7ziv9I7+oj3XSeKIB1wQoe3phbt/KvsaqDbuBYqb9wLL
         AN2+t5cS6IPnKnwqgnSVE8IK6daf8M0HSK03Z1Rqs56lep/VgLLhHdBXxGth90kDOkRJ
         z/5ttqUrouFOjYKhWkM/S/cac+yDlp//iI7rbrFGT3peXvrYW4XflmAPuuL4XFMiPgBm
         GwTMUFY1VqAX5lGYzElpfyYct0oGvXsM4aG16lS/bafXAF2+kZ3d/feI8bH9n9MK9d8q
         MBvg==
X-Gm-Message-State: AJIora8doG55ERHHAkxlseT9H7K+G+O4UDaJofsAHgCcvPx92zsF+4B3
	cN9gakBUgHRZQBbb4IFaRQ==
X-Google-Smtp-Source: AGRyM1s18wdUJAam3DTxeqhloATZSlewRzhbV3ZnSE3O1/2Mo0z69lxMSUjKhD9vcc3Nre0Ez9a1mA==
X-Received: by 2002:a05:6602:29d1:b0:669:428e:8c59 with SMTP id z17-20020a05660229d100b00669428e8c59mr7584524ioq.85.1659459753890;
        Tue, 02 Aug 2022 10:02:33 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id b15-20020a026f4f000000b003427f2c25b7sm471289jae.68.2022.08.02.10.02.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Aug 2022 10:02:33 -0700 (PDT)
Received: (nullmailer pid 296764 invoked by uid 1000);
	Tue, 02 Aug 2022 17:02:30 -0000
Date: Tue, 2 Aug 2022 11:02:30 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Dan Murphy <dmurphy@ti.com>, Michael Klein <michael@fossekall.de>, 
	David Heidelberg <david@ixit.cz>, Ricardo Rivera-Matos <r-rivera-matos@ti.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, devicetree@vger.kernel.org, 
	Chen-Yu Tsai <wens@csie.org>, Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Purism Kernel Team <kernel@puri.sm>, 
	Neil Armstrong <narmstrong@baylibre.com>, "Andrew F. Davis" <afd@ti.com>, 
	=?UTF-8?Q?Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>, 
	Artur Rojek <contact@artur-rojek.eu>, linux-arm-kernel@lists.infradead.org, 
	=?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, linux-kernel@vger.kernel.org, 
	Kevin Hilman <khilman@baylibre.com>, linux-pm@vger.kernel.org, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Mike Looijmans <mike.looijmans@topic.nl>, 
	Matheus Castello <matheus@castello.eng.br>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Sven Peter <sven@svenpeter.dev>, Stephan Gerhold <stephan@gerhold.net>, 
	Jerome Brunet <jbrunet@baylibre.com>, Orson Zhai <orsonzhai@gmail.com>, 
	linux-amlogic@lists.infradead.org, Sebastian Reichel <sre@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, Jianxin Pan <jianxin.pan@amlogic.com>, 
	David Lechner <david@lechnology.com>, Hector Martin <marcan@marcan.st>, 
	Iskren Chernev <iskren.chernev@gmail.com>, Dmitry Osipenko <digetx@gmail.com>, 
	Michal Simek <michal.simek@xilinx.com>, Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 3/3] dt-bindings: power: supply: drop quotes when not
 needed
Message-ID: <20220802170230.GC279692-robh@kernel.org>
References: <20220726115748.101015-1-krzysztof.kozlowski@linaro.org>
 <20220726115748.101015-3-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220726115748.101015-3-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220802_100235_134379_F660B4C9 
X-CRM114-Status: UNSURE (   9.21  )
X-CRM114-Notice: Please train this message.
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

On Tue, 26 Jul 2022 13:57:48 +0200, Krzysztof Kozlowski wrote:
> Id and schema fields do not need quotes.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/power/supply/active-semi,act8945a-charger.yaml   | 4 ++--
>  Documentation/devicetree/bindings/power/supply/bq2415x.yaml   | 4 ++--
>  Documentation/devicetree/bindings/power/supply/bq24190.yaml   | 4 ++--
>  Documentation/devicetree/bindings/power/supply/bq24257.yaml   | 4 ++--
>  Documentation/devicetree/bindings/power/supply/bq24735.yaml   | 4 ++--
>  Documentation/devicetree/bindings/power/supply/bq2515x.yaml   | 4 ++--
>  Documentation/devicetree/bindings/power/supply/bq256xx.yaml   | 4 ++--
>  Documentation/devicetree/bindings/power/supply/bq25890.yaml   | 4 ++--
>  Documentation/devicetree/bindings/power/supply/bq25980.yaml   | 4 ++--
>  Documentation/devicetree/bindings/power/supply/bq27xxx.yaml   | 4 ++--
>  .../devicetree/bindings/power/supply/cpcap-battery.yaml       | 4 ++--
>  .../devicetree/bindings/power/supply/cpcap-charger.yaml       | 4 ++--
>  .../devicetree/bindings/power/supply/dlg,da9150-charger.yaml  | 4 ++--
>  .../bindings/power/supply/dlg,da9150-fuel-gauge.yaml          | 4 ++--
>  .../devicetree/bindings/power/supply/ingenic,battery.yaml     | 4 ++--
>  Documentation/devicetree/bindings/power/supply/isp1704.yaml   | 4 ++--
>  .../devicetree/bindings/power/supply/lego,ev3-battery.yaml    | 4 ++--
>  .../devicetree/bindings/power/supply/lltc,lt3651-charger.yaml | 4 ++--
>  .../devicetree/bindings/power/supply/lltc,ltc294x.yaml        | 4 ++--
>  Documentation/devicetree/bindings/power/supply/ltc4162-l.yaml | 4 ++--
>  .../devicetree/bindings/power/supply/maxim,ds2760.yaml        | 4 ++--
>  .../devicetree/bindings/power/supply/maxim,max14656.yaml      | 4 ++--
>  .../devicetree/bindings/power/supply/maxim,max17040.yaml      | 4 ++--
>  .../devicetree/bindings/power/supply/maxim,max17042.yaml      | 4 ++--
>  .../devicetree/bindings/power/supply/maxim,max8903.yaml       | 4 ++--
>  .../devicetree/bindings/power/supply/nokia,n900-battery.yaml  | 4 ++--
>  .../devicetree/bindings/power/supply/olpc-battery.yaml        | 4 ++--
>  .../devicetree/bindings/power/supply/power-supply.yaml        | 4 ++--
>  .../bindings/power/supply/richtek,rt5033-battery.yaml         | 4 ++--
>  .../devicetree/bindings/power/supply/richtek,rt9455.yaml      | 4 ++--
>  .../devicetree/bindings/power/supply/sc2731-charger.yaml      | 4 ++--
>  Documentation/devicetree/bindings/power/supply/sc27xx-fg.yaml | 4 ++--
>  .../bindings/power/supply/stericsson,ab8500-btemp.yaml        | 4 ++--
>  .../bindings/power/supply/stericsson,ab8500-chargalg.yaml     | 4 ++--
>  .../bindings/power/supply/stericsson,ab8500-charger.yaml      | 4 ++--
>  .../bindings/power/supply/stericsson,ab8500-fg.yaml           | 4 ++--
>  .../bindings/power/supply/summit,smb347-charger.yaml          | 4 ++--
>  .../devicetree/bindings/power/supply/tps65090-charger.yaml    | 4 ++--
>  .../devicetree/bindings/power/supply/tps65217-charger.yaml    | 4 ++--
>  .../devicetree/bindings/power/supply/twl4030-charger.yaml     | 4 ++--
>  .../power/supply/x-powers,axp20x-ac-power-supply.yaml         | 4 ++--
>  .../power/supply/x-powers,axp20x-battery-power-supply.yaml    | 4 ++--
>  .../power/supply/x-powers,axp20x-usb-power-supply.yaml        | 4 ++--
>  43 files changed, 86 insertions(+), 86 deletions(-)
> 

Applied, thanks!

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
