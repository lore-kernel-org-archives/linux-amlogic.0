Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFDB3C00144
	for <linux-amlogic@archiver.kernel.org>; Tue, 26 Jul 2022 21:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jG/2UKT9ZGBUXHL/SwxQ5hRY9cAOIyZWDICu8ruSUes=; b=Up3XNUg5jck3L4
	NcKG4GtAOFzUk6wckkIeXKotkg7b1AwbZ1oqlSzftx42n2WuCiRzyI8IUGWvFNykX3Z/dS4AvrqGh
	lKMnA6me2SYZP9MfjtBpOSpWRg18WyqU36pY0K+dZEec+YBrLMqJCevjtxnM0fS8WFCVMGNMZGO5f
	ANK9PSQetwFfHV2x6W/cnEjsceMQ+ZKZLOpvggnlPd2F7/tI0weVHgjn238kWCfGXlQxdT7q3YlEG
	5/ILoHMMM+frXTddSjmTyxg7gaTkISKhtuTbaa949F2IUD6NrUsMItWUhcwM7tyM8MFPLJiEkiKHH
	0KHepe+SnH2FwDkxzfPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGRqB-003obR-32; Tue, 26 Jul 2022 21:11:43 +0000
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGRpx-003oMi-V9; Tue, 26 Jul 2022 21:11:31 +0000
Received: by mail-yb1-xb2e.google.com with SMTP id d124so9880777ybb.5;
        Tue, 26 Jul 2022 14:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3t16s+OcKDcEZXENZbwqgCIwk/X+UcCVddI7l2RgCtI=;
        b=NLlIwrwDW5ocpVXLAcOp1+TDqUcPCxfwIlZYoT416DevuJKD+dUfl9bBi679g2rqK2
         CIUnAduiKXZV+uuX9vvtefQgXdxUXYyXsEuPfPNgM1dBPFpPcOIBJkPmyIsfPKqSlPvZ
         cs/NXt5vjastEJs668It7JG7h3U2M1XnFaZoUdfMr98yqbX8+51XzA9qScCCtr/0CPcf
         UKlseVrk75xrMR4lK0kFjvrou6WhmwoB1FSX4TmmBRPU0s2fcpACCZRIARCrZi4V0YhC
         R+/cA4lOo/YX9n2B3Mt9qqQ08B8mD20uA8ooW7zBv+hqRY2P5MRhNrqbHt2mKx2geVrI
         ym4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3t16s+OcKDcEZXENZbwqgCIwk/X+UcCVddI7l2RgCtI=;
        b=kh8QIjSYG8QLp4pCjKj5rEWOlNVsrIJQHDgFX6Ecv7mvcgoW3eznlVy6Va9TEiqVHG
         zw6Hef6JXAjCAh+goxCGz++hZ8ZXn8YqxRcsytvTWXqBbicH0K6i6J8ykqj53Om5ua0G
         zOhzt7bdQ1xav8D3QpYXMMNcaeLWgR3ea+c2+wqGG1Us6Ubanhdx4wpMc/h50tLZGHLN
         wbdTvyPuxNLFIqkv3rdqc44qYLTXVAYoS4FCVxbEUo3L3PQZJfiV1KawEOM4o3/f7rrK
         RbIk3pTwToIpFEwdzzCXJkI8t3Cl7t/cfiSh9pASI1H6mJh6TxRrW3kYOQrrUNOiD8O8
         423A==
X-Gm-Message-State: AJIora8g9pOt1Gq91/fdhCTXjG4VEaBo+lQAkoomukXaqp1e5YQAa3Wj
	meJiMNKpAk/fx6GUxbzmBs92OaCPOyP+Pz7ElFM=
X-Google-Smtp-Source: AGRyM1vRom4tJven8LPA373fu9mUzwWFI/x5WXxjSDmq4hHFo5RlkMbpmY16sruCIKeXcaYVkHJkHeLZd0gOeU0DUKc=
X-Received: by 2002:a25:e682:0:b0:671:79d9:66c7 with SMTP id
 d124-20020a25e682000000b0067179d966c7mr2977858ybh.5.1658869886200; Tue, 26
 Jul 2022 14:11:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220726115748.101015-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220726115748.101015-1-krzysztof.kozlowski@linaro.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 26 Jul 2022 23:11:15 +0200
Message-ID: <CAFBinCCOcuHeuXvEe9obBu2qby0bwQLPmaSbginmFh3_gSz4GA@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: power: drop quotes when not needed
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Sebastian Reichel <sre@kernel.org>, 
	Michal Simek <michal.simek@xilinx.com>, David Lechner <david@lechnology.com>, 
	Iskren Chernev <iskren.chernev@gmail.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Matheus Castello <matheus@castello.eng.br>, Hans de Goede <hdegoede@redhat.com>, 
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>, Purism Kernel Team <kernel@puri.sm>, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jianxin Pan <jianxin.pan@amlogic.com>, 
	=?UTF-8?Q?Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Michael Klein <michael@fossekall.de>, Dan Murphy <dmurphy@ti.com>, 
	Ricardo Rivera-Matos <r-rivera-matos@ti.com>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
	"Andrew F. Davis" <afd@ti.com>, Tony Lindgren <tony@atomide.com>, Artur Rojek <contact@artur-rojek.eu>, 
	Mike Looijmans <mike.looijmans@topic.nl>, Stephan Gerhold <stephan@gerhold.net>, 
	David Heidelberg <david@ixit.cz>, Dmitry Osipenko <digetx@gmail.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220726_141130_047617_0152C917 
X-CRM114-Status: UNSURE (   9.55  )
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

On Tue, Jul 26, 2022 at 1:57 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Id and schema fields do not need quotes.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/power/amlogic,meson-ee-pwrc.yaml      | 4 ++--
>  .../devicetree/bindings/power/amlogic,meson-sec-pwrc.yaml     | 4 ++--
For the Amlogic ones:
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>


Thank you!
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
