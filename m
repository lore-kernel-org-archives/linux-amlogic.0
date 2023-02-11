Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AEBFC636CC
	for <linux-amlogic@archiver.kernel.org>; Sat, 11 Feb 2023 20:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kg85KWwf961QShW2FW4KGgjsyu05PLQewxs0C67PvFk=; b=HNa7WONwXsWH8T
	fmP1tNp9/mqeC6thTJ0nGdTkQWJvZHm34AdpOUCntX0nrwOT+D8WzJT+IqAgl2NrrJ8R4VcprWqxz
	LlvbJLmzyNDnzX8USqamBTfjaugOfgh9r/Hr/9LINiupg1mPNU0FerdRKZUSRZTKAFbS1t22fDC+J
	Ft+HuV7zKWojlpQctjLWaHxrx26Zw9umAeNritsuOESudjYz5ZUnOJOILzQYf1nIheg9hFu4l6KSR
	drbdiUEqJcVxZp/wFbjhMRXp9eB1ocvDZBQc8UWLGgsfgdwZPMdqc8CHYfwBPlK+ZwLP0KFJacjBh
	/ScFKscbqHOXwo2WSqog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQwRX-00AKpd-77; Sat, 11 Feb 2023 20:25:55 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQwRK-00AKnn-JT; Sat, 11 Feb 2023 20:25:46 +0000
Received: by mail-ej1-x62d.google.com with SMTP id jg8so23414835ejc.6;
        Sat, 11 Feb 2023 12:25:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lLacBBRlz93H3GiKKvSQD2qZJYcpqiTjyuyAIXkHfUk=;
        b=HnvlPd2wCVKP1vEA5oBzN09Hm7YBjsJX5upx2hujewee0OEBtMeFDjUN0pNfY1qNzj
         /6e+ChM9OpYSHEHTVo/d5JN4LCYMYeMvjzMpTmh5pZ+FbQjTSiarXOl3fsp3LN3r5lrU
         uVDbJHNlzEbGRXVmnwYdZ+4BdMeKqhSrmF7yAiLEgDHQOfQsGAU1ESNHG4p1GZ/FBk8C
         PYnUrj+WyW5jtbwdj9wyGMdBbTO10UXCDDg9EzsoEbicsFM6IuGG6OOIQre7nLz3vyNV
         Rx/nB7kR/S5q71duUSyDIiXocP70Q2eDFgGyiBMVG3XXFeN6BUnMsH1/O0MgRKRhZ9v1
         peQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lLacBBRlz93H3GiKKvSQD2qZJYcpqiTjyuyAIXkHfUk=;
        b=xPYsgbwZp1OgFN90taj4qShIU4d3L2UChaZOuLsVSHeb4nPdyQhy+joNT5sYnsI0Rd
         +3NXAPPn3CNUqGNJmNrVyMac5hbybMdfqxdDtnPuHGlpBAMPTvXoiK4RAb1P4mb4gaUg
         smgtmTsCJyOPZNYu5ANbDL+Sr2bmVwEOkMcBrEgsdt90QtLhHpZRlUldTfG9HTL3n17a
         f1amm9hb4d/jntKz/PEUY4gqJFQMO8aKt1w4PvF6+31pzt0eLGy7GZIqCoJ3rN+uQbyc
         I5HMszIyMh5/FTe40WSit9sKsm7ceWncplxY2N+ZgMDBSjMrNlgS/xBHUMWP5nn1+cYM
         Av2A==
X-Gm-Message-State: AO0yUKX4padtAYiedS0xT6y06shyojxgBrskvQvWDighOuTWyDSgVubJ
	vU79UiYbuPKqnaal7mU9WjrfxDJE4ApoLSeyWOY=
X-Google-Smtp-Source: AK7set+r8/isemvwKFykUdz65hr3VaRSbzbkw3mFuod0hK8/niYyuljq/yGDoa19MVZw3qAcXd7psXWFNbni52Mh3LI=
X-Received: by 2002:a17:906:c44e:b0:8af:341c:1f82 with SMTP id
 ck14-20020a170906c44e00b008af341c1f82mr2622125ejb.4.1676147141118; Sat, 11
 Feb 2023 12:25:41 -0800 (PST)
MIME-Version: 1.0
References: <20230209-b4-amlogic-bindings-convert-take2-v1-0-c4fe9049def9@linaro.org>
 <20230209-b4-amlogic-bindings-convert-take2-v1-3-c4fe9049def9@linaro.org>
In-Reply-To: <20230209-b4-amlogic-bindings-convert-take2-v1-3-c4fe9049def9@linaro.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 11 Feb 2023 21:25:30 +0100
Message-ID: <CAFBinCCACzEDaa2Z+h5JzXRjEcQ9QH0R+=_UXOKHe7zX02im=Q@mail.gmail.com>
Subject: Re: [PATCH 3/6] dt-bindings: soc: amlogic: document System Control registers
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230211_122545_515017_DDAC7C4E 
X-CRM114-Status: GOOD (  15.79  )
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

Hi Neil,

On Thu, Feb 9, 2023 at 2:41 PM Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> Document the System Control registers regions found on all Amlogic
> SoC families and it's clock, power, pinctrl and phy subnodes.
I understand clock (main clock controller) power (power domain
controller) and PHY (HDMI and CVBS PHYs). Are you sure about pinctrl?

[...]
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - amlogic,meson-gx-hhi-sysctrl
> +          - amlogic,meson-gx-ao-sysctrl
> +          - amlogic,meson-axg-hhi-sysctrl
> +          - amlogic,meson-axg-ao-sysctrl
If you have to re-send this then it would be great if you could add:
          - amlogic,meson-hhi-sysctrl
because we already have that in arch/arm/boot/dts/meson.dtsi for the
32-bit SoCs.

[...]
> +        power-controller {
> +            compatible = "amlogic,meson-gxbb-pwrc";
> +            #power-domain-cells = <1>;
> +            amlogic,ao-sysctrl = <&sysctrl_AO>;
For this node (and similar ones) I have a question to the device-tree
maintainers:
The power controller has a dedicated sub-range of registers. This also
applies to the CVBS and HDMI PHYs.
But the clock controller does not (it has its registers all over the
place - unfortunately that's how the hardware is).
I have been asked to add a "reg" property to child nodes with a
sub-register space.
Does this mean we need to add a reg property here as well (regardless
of whether we're using it in the driver or not)? And what to do in
case of the clock controller though?


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
