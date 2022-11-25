Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A6D2C43217
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Nov 2022 23:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WTc6x0JdZ+dfCfwqQ6JedCDgI0ueSbqmdbYM16BI7zc=; b=yMLBS+EwsNlaPy
	oEOqiz44pyOyPz9RptL9Eg614lA/KUvDA2VCAe+MDMlV1/W4z9JPrEOSQAgdUTDbWIGyCRxNnhhty
	SdVucFlSYvQtY6+gmqvdg8dKLUOJqrMqMjlB/7RhdeIWyhARewH1fmhFl+irAWrY64yiwM02Btnu3
	xINKNHewJJ7I/tdTc3kZxhswcmgYpE/Y4qqjWWfsxqhfHjA5L0WUMHV8FmElMWtGmmn2ivMOXwEdN
	T9+RKtUaZyosL8GjdsKrdX9VNQtgMVyjG9TDqhwWOGlnEDgCaX61TbMQXCYLz498dbJsEsrt7QuGY
	X1CXOXbLB5T+71n9tV1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyi4b-002oGj-U3; Fri, 25 Nov 2022 23:25:33 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyi4Z-002oEe-08; Fri, 25 Nov 2022 23:25:32 +0000
Received: by mail-ej1-x631.google.com with SMTP id e27so13190782ejc.12;
        Fri, 25 Nov 2022 15:25:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tCTtF6fAWhMLt7sZbiPuunRpHFkZ2q0bqUFL/SjTMsw=;
        b=XO5fYO1oOwtpueIZWfSn0cCi0laQdhB3hXs3PtHdd4OHe23GYCorc0y8Plc2H8qhYv
         LH9Um4yafmwcg0CwYKDPPynP/ma2fvcmVr/dI+jLh3VXEEYqfRxf55tsTOHgkANnUVdk
         YYNgNvWH9oeYbutAzNf78VU2xm5n8CzkJQ1sYSm06g9m7ahaQFRQtoF8zTjxoIptgdRX
         GFvQGOfDC6UouP3xpg6y8h18RDmHkGu6d6J42lQritKDbeS4o5k1bR5+NSYQVUYvst69
         CT0ftvSz4BZ3AvUuRXFcsEitCTsNAlvScg9LFgPAGVyOscN277hzZtrcGIP99iABJqXZ
         1zyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tCTtF6fAWhMLt7sZbiPuunRpHFkZ2q0bqUFL/SjTMsw=;
        b=rETkbJyz6rTZ0r1x8lDhBOE4alzfT38TZbBCm0tBo7T60yGL4kV7Anowy6+AKWCLqT
         c3YC0RKObe5Mh/bY3RdbDakB/qZdTuZ1vLE1uuNcPfCCfkakvZVeY9ULA/Y3vu2Jdx6Q
         HwZX9hcUJ11iltf5QOm4pew26ladEqD8LqBDLJdc0NitBaY+frAo4s/7oKtDTgidlgjL
         ghAGHuFep7POzgtCu1vBdzrrnwjbJvfQokOvkOoSkLceh9i18oQGpUYHI3rcdqzVr+1G
         uCXwXi3OWuEkqk2Z/iINhYetJSC3gaCRWweHyOPOnUNRF1RHMGKqpe2s+NATv4QW5jk9
         FEvw==
X-Gm-Message-State: ANoB5pkicUVjrWjFbLliJT8nm0meCSwsnISYAb0rz8ltZSC5Q5AlS301
	M16cMYQO8e8dE2iaF6zgxxMxd0rddzNUMnHXrdA=
X-Google-Smtp-Source: AA0mqf6r8ZGoAmftNYWkAPDE8cV+ClfDfHNDigYfV7F4RFfaaXo6kES5wXG//eSV5jPV/Jc+P7ogrsCm0bmN17yrNT4=
X-Received: by 2002:a17:906:6bd8:b0:78b:a8d:e76a with SMTP id
 t24-20020a1709066bd800b0078b0a8de76amr35243355ejs.725.1669418728706; Fri, 25
 Nov 2022 15:25:28 -0800 (PST)
MIME-Version: 1.0
References: <20221117-b4-amlogic-bindings-convert-v1-0-3f025599b968@linaro.org>
 <20221117-b4-amlogic-bindings-convert-v1-5-3f025599b968@linaro.org>
In-Reply-To: <20221117-b4-amlogic-bindings-convert-v1-5-3f025599b968@linaro.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 26 Nov 2022 00:25:17 +0100
Message-ID: <CAFBinCC_hGBNTwAfLAZmyNz7vjedWyQ0vhPT_vAKXQ5LKhA3Tg@mail.gmail.com>
Subject: Re: [PATCH 05/12] dt-bindings: media: convert meson-ir.txt to dt-schema
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jakub Kicinski <kuba@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Andrew Lunn <andrew@lunn.ch>, Alessandro Zummo <a.zummo@towertech.it>, 
	Eric Dumazet <edumazet@google.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Kevin Hilman <khilman@baylibre.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Vinod Koul <vkoul@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Thomas Gleixner <tglx@linutronix.de>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Jerome Brunet <jbrunet@baylibre.com>, Paolo Abeni <pabeni@redhat.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, "David S. Miller" <davem@davemloft.net>, linux-media@vger.kernel.org, 
	netdev@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-mmc@vger.kernel.org, linux-rtc@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221125_152531_096561_E6379388 
X-CRM114-Status: UNSURE (   8.91  )
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

Hi Neil,

On Fri, Nov 18, 2022 at 3:33 PM Neil Armstrong
<neil.armstrong@linaro.org> wrote:
>
> Convert the Amlogic Meson IR remote control receiver bindings to
> dt-schema.
>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Before this is applied we need an additional patch removing the
un-documented "amlogic,meson-gx-ir" compatible string from
arch/arm64/boot/dts/amlogic/meson-gx.dtsi though.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
