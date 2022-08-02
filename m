Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41383C00140
	for <linux-amlogic@archiver.kernel.org>; Tue,  2 Aug 2022 17:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TS7vRvlM181eMxoxMArpfXpVWldUm7EuB+vWpMcMLH0=; b=4vkBGcbPtVzUkF
	Lhu4Joq4ncRWSsLWNRTaL7FUj+80+izQzUT15gVgbQ5A/a3rJQ+hKuC591dEVzObt2a+EP83WFKKi
	D1O997af/iQfXfPFhm30ipR3LgqGduBOPJ7n9qzOfbsB2pHbwRzs8oU6LtppGzVazU9sTo8F8oYvC
	1mFjKahBcMZilW61ANg40mWndxlrqSk9J6bQt/N0ZIYrUq7IZoyEUUGwCNJFIylaWgURecg/DrX2H
	JcdLNsy6xoP2JSUmCJ7HEgh5OW4jG3cPBQ/Q0EQlk/75D1TVP49CAqLkxR8GuAW+C4JDLx7v5yxRs
	CYex1Adj9FInPleofwqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIvI2-00G07x-U3; Tue, 02 Aug 2022 17:02:42 +0000
Received: from mail-io1-f53.google.com ([209.85.166.53])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIvHo-00G01I-AF; Tue, 02 Aug 2022 17:02:31 +0000
Received: by mail-io1-f53.google.com with SMTP id q14so11117535iod.3;
        Tue, 02 Aug 2022 10:02:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=zd2vKlsbpX4kSUurJItYz1iOedbxqkmyfZZ+qbhotp4=;
        b=vEiK7tHgONibwHpZu1IY/EUzl9gJVXKQX+QX8u27u+tizBXnNWeojZ4z79fNRQhlon
         6vfSeqRTnq9AOHA90nlIlgFgifD+VMuKqkCryf3RxBbEM9iKj5uVazoaWRR3AyiM1cOC
         uzmGvmtkcFJX2d1IyqPq9ZoXAz8D7+dk+w6tvVbA8S0jPCthrapXYlcCujPx6T/7osm/
         2QQm3dRHMeJbkRfkVEXU274vLPCVqIKdnBXE6bb0X3OLjK9vjmFPrsuM4oxOS/gjJaBI
         sucwYsFkr3/GeYYniSJNkh54ngPZoJL86YhP+5FK/4cEMD0hj3EP/OO64l3AsL9Njxyf
         Uq2Q==
X-Gm-Message-State: AJIora/KRPsIUrDZjGyLUC15spQe3GtwdAvxn8FxMts2dEs2H2m735yM
	QVhIa0g3wORTyzaWQtPDkw==
X-Google-Smtp-Source: AGRyM1svEWFBOHGvFaTQr5tLMFsgPS+M1FKnnU2ObSjmb7UeBz5CbIEByI/m2ubKaDbg7SO8wQ2fMA==
X-Received: by 2002:a05:6638:3010:b0:341:dda0:dcc5 with SMTP id r16-20020a056638301000b00341dda0dcc5mr8246995jak.210.1659459744832;
        Tue, 02 Aug 2022 10:02:24 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id w28-20020a02b0dc000000b00342781cfd1fsm2347709jah.15.2022.08.02.10.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Aug 2022 10:02:24 -0700 (PDT)
Received: (nullmailer pid 296519 invoked by uid 1000);
	Tue, 02 Aug 2022 17:02:21 -0000
Date: Tue, 2 Aug 2022 11:02:21 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, Matheus Castello <matheus@castello.eng.br>, 
	Iskren Chernev <iskren.chernev@gmail.com>, "Andrew F. Davis" <afd@ti.com>, 
	David Lechner <david@lechnology.com>, Hector Martin <marcan@marcan.st>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>, Michael Klein <michael@fossekall.de>, 
	devicetree@vger.kernel.org, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
	Mike Looijmans <mike.looijmans@topic.nl>, linux-arm-kernel@lists.infradead.org, 
	Dan Murphy <dmurphy@ti.com>, linux-amlogic@lists.infradead.org, 
	Orson Zhai <orsonzhai@gmail.com>, Stephan Gerhold <stephan@gerhold.net>, 
	Rob Herring <robh+dt@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, =?UTF-8?Q?Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>, 
	Linus Walleij <linus.walleij@linaro.org>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-kernel@vger.kernel.org, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Tony Lindgren <tony@atomide.com>, 
	Jianxin Pan <jianxin.pan@amlogic.com>, linux-pm@vger.kernel.org, 
	Michal Simek <michal.simek@xilinx.com>, Sebastian Reichel <sre@kernel.org>, 
	Purism Kernel Team <kernel@puri.sm>, Jerome Brunet <jbrunet@baylibre.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Hans de Goede <hdegoede@redhat.com>, 
	Sven Peter <sven@svenpeter.dev>, Artur Rojek <contact@artur-rojek.eu>, 
	Kevin Hilman <khilman@baylibre.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, David Heidelberg <david@ixit.cz>, 
	Ricardo Rivera-Matos <r-rivera-matos@ti.com>, Chen-Yu Tsai <wens@csie.org>, 
	Dmitry Osipenko <digetx@gmail.com>, Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH 1/3] dt-bindings: power: drop quotes when not needed
Message-ID: <20220802170221.GA279692-robh@kernel.org>
References: <20220726115748.101015-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220726115748.101015-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220802_100229_732103_F29F15F2 
X-CRM114-Status: UNSURE (   9.94  )
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

yOn Tue, 26 Jul 2022 13:57:46 +0200, Krzysztof Kozlowski wrote:
> Id and schema fields do not need quotes.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/power/amlogic,meson-ee-pwrc.yaml      | 4 ++--
>  .../devicetree/bindings/power/amlogic,meson-sec-pwrc.yaml     | 4 ++--
>  .../devicetree/bindings/power/apple,pmgr-pwrstate.yaml        | 2 +-
>  .../devicetree/bindings/power/brcm,bcm63xx-power.yaml         | 4 ++--
>  Documentation/devicetree/bindings/power/renesas,apmu.yaml     | 4 ++--
>  .../devicetree/bindings/power/renesas,rcar-sysc.yaml          | 4 ++--
>  6 files changed, 11 insertions(+), 11 deletions(-)
> 

Applied, thanks!

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
