Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33364C46467
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Jan 2023 21:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2dIALTwQabzhdvJzlQDBk3nhkMJ3gZ05WGioIjc6/E0=; b=sOBFAK2Mwps4z1
	+YUTKSim/mn2DcSso/+p0OtnB0CdpEEjLDkfFzgHlcnI0fk1cUobdGvE6YJ1hTdpl3hhxX1YjqUVq
	36V6vpqxwF+yqhfVzai5/ScpklsfmosFb7qF+kJO49kCkHbcUlaCulMlBgiXgQuggiXhbjtIeXHVv
	9oAx5f0edaP0hbNzHHeVzON8j93R96HSQq+tpiv18TLwXOZouSfvKKuaRJAJQtf8gKXHUmh+kGpqX
	i8t+5DBftQRvtpM2GEnjhsrddgDJfy4k4xEhR70cYPOj7ytflrA8LuRA26zv/TuLtmPVvurL5uhWh
	/fF0aGv8pGINwVd6UqyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFMUM-008fVu-D2; Tue, 10 Jan 2023 21:48:58 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFMUA-008fQU-A8; Tue, 10 Jan 2023 21:48:47 +0000
Received: by mail-ej1-x62b.google.com with SMTP id ud5so32220398ejc.4;
        Tue, 10 Jan 2023 13:48:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=M3b2Vz7EFrY4ZoAZ7zhZDOrT9y3BFK6sS3AzbYrmCT4=;
        b=SbL0sV3pbNJK6Bfyz2VD6czCXh94iQNaxKjXTjpArf+vHkqL2nrS4tK4IMhXZLfjob
         c09q+NtJP7jTDEHqrpo4z+vxiPked3kTWBAamhe6hgWly3pGWP1K2kIFb6xFE1EMHHuA
         W7zBN02N/9NXq5XxJ/cNLh3c3H5r4KcNP2TGEaQlZGQMQVMYxos6BKl4aN9W3LHnQDlo
         uGtcnMyr0/OMndxB8218GOxLOCJBH6euzCMpEExz1HDoJNY47/pGCsIUK7g0mauCBUMm
         nVxzqMQVGuqTMbJEYrlXPc7O60AVGYgvu35Ga9sqHDSFK9Pb5q0iDpNSZZ8SpIE1m8RL
         PTXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M3b2Vz7EFrY4ZoAZ7zhZDOrT9y3BFK6sS3AzbYrmCT4=;
        b=MnGNzFSk55mn0yIa0ZnpUB88tQeApwdOa/uSp2/mLpF2lNbo76S0jAamQ9RFifvlcA
         uw+EnNunNyPpSgb6n6AE+JFNbqXszRfMBdi1tu+ZlFdvfO105BtnGGS5/CnrIOsKvlk+
         64Tb12pTik5KdfLbVypXwQD74B08d2/o00ZkJ4te+oe/FZ71UfBWCbzlv71HHvzMJ0Gx
         59DMIC2Um0MFQx0qO7wXveXck2fqI0oTf607P9yTdz/cGxdemyy4zO36iQvS5TGQaAlC
         xl/EyJfMMi4jdqiFW+9mGmNtzhoYUpay7egGxt0ElNJBKGGJGyPEUEenL/nFa+Z8tmmT
         IelQ==
X-Gm-Message-State: AFqh2kr4WYr/4Pi8213N12PS3Wu2RaZngpuy+4mh89Z0kgYGEXQjDJfw
	EHKGvrjQUjDrU1HKqIZGZhMlxWVtr1AYG6G8sBA=
X-Google-Smtp-Source: AMrXdXvZWTCfsyyAyIXqF03H40iDiOq0blSYlASCBEmUrGVmKB7QN5KAlN7UDroP7DZCIIDm9TmpeUqouJfNZE/s2tk=
X-Received: by 2002:a17:906:e4f:b0:7c0:ae1c:3eb7 with SMTP id
 q15-20020a1709060e4f00b007c0ae1c3eb7mr4388606eji.510.1673387322980; Tue, 10
 Jan 2023 13:48:42 -0800 (PST)
MIME-Version: 1.0
References: <20221117-b4-amlogic-bindings-convert-v2-0-36ad050bb625@linaro.org>
 <20221117-b4-amlogic-bindings-convert-v2-4-36ad050bb625@linaro.org>
In-Reply-To: <20221117-b4-amlogic-bindings-convert-v2-4-36ad050bb625@linaro.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 10 Jan 2023 22:48:32 +0100
Message-ID: <CAFBinCDd1MJEmSHR1XPsfBoRasBq+cV1F+66sCBXALtCCmoyUA@mail.gmail.com>
Subject: Re: [PATCH v2 04/11] dt-bindings: watchdog: convert meson-wdt.txt to dt-schema
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Alessandro Zummo <a.zummo@towertech.it>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-rtc@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-mmc@vger.kernel.org, 
	linux-pci@vger.kernel.org, netdev@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230110_134846_393328_4D5E41F5 
X-CRM114-Status: GOOD (  13.40  )
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

On Mon, Jan 9, 2023 at 1:53 PM Neil Armstrong <neil.armstrong@linaro.org> wrote:
[...]
> +  compatible:
> +    oneOf:
> +      - enum:
> +          - amlogic,meson6-wdt
> +          - amlogic,meson8-wdt
Technically this is not an identical representation of what we had
before which was:
-       "amlogic,meson8-wdt" and "amlogic,meson6-wdt" on Meson8 SoCs

We're not using the "amlogic,meson8-wdt" compatible anywhere at the moment.
In the meson_wdt driver it's defined with the same per-SoC data as
"amlogic,meson6-wdt".

Long story short: In my opinion there's no need to change what you
have right now.
If you have to re-spin this then maybe you can add a note to the patch
description.
Please add my:
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
