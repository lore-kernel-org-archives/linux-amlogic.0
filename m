Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8FC8C4332F
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Nov 2022 23:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mkIFIiaXUzzqRT9VIlePsSeeBDtnzl+v2AmWYGyunEM=; b=17z9vZrpWsRA7B
	64oWP6LW9fXlUwMnf+j7syQH6ajj9DbKccDu0ua7pqN6uGrbrvlPlvZZXnIC41MsFvj2Ov5JwkvSc
	H0reJ3viIuAm4k8JcTEuW/TLR1thQlLIzlM1eA6dzwtW3k5dBkKW+u4geFWorsFx9eNAstUXE8/Bx
	QGWfwNr9g1YNMKEWgfbAYI2XVNlww9W2rdwcfygTagtXXSANkKKiRnXV2L3OAaRMU1+bC0l93A5xp
	iJkRTbkYBWXUSZY341LGLkNQaCoyAcar9r3vbjyGqXn+kb2q5XFI/DjF1IDgaABVM0pRUPgZDmr4b
	S69PKKjGOEoqM22qBaIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyhsZ-002j73-JK; Fri, 25 Nov 2022 23:13:07 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyhsX-002j4h-C7; Fri, 25 Nov 2022 23:13:06 +0000
Received: by mail-ed1-x534.google.com with SMTP id m19so6904351edj.8;
        Fri, 25 Nov 2022 15:13:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YRXgY3Jj45tR352JHVnAGEWNDK4+LNF88JlctEC+BmA=;
        b=j3YfXXi2BK/0UmIyMEYU4Gb2t3KZRjWodKFfA0jiYv1dUB5lmqNn0PDEGb4yYPU93g
         pOnB9z7lPCqSCmdIDRrz7HPfJM+Pmllr7qI1szglZRA6i+NorVrK5ayHVx3EdC+JQ9dW
         q34It7p07BHIvQ1PqQSW/o5aYE7AKR7bi9USit5/aXNEB/0QLnz7dG7sr98f53TlP4W/
         RC3Ae2ve6tReSFOXusxBgVMtqNG9oae4pkLWd3JM9V7JOkTO7ojuFe66esG6PJZa7KUi
         +sHUexpTzevypIqqnWkuVjqyYrDP3kkAN0IEYD1aDEyBRuKfvKyWrTdHMBalPS2vGkHR
         Wuow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YRXgY3Jj45tR352JHVnAGEWNDK4+LNF88JlctEC+BmA=;
        b=XLbaTkUAX5AtFNDUU8HnLx7YfQp2b+PzmfIPRNMSV+UTzbMvTRyOkIp7mxdnJoCP9T
         oKPWY13iKXzsUkKRDZ8lS2ZJV3PVpl/34TfAq8hAt/SA5zfVpHtOyuEGGE3W0QytuVgY
         ElEf+VU0JkxVWknKJzceizwHd4wWLFAdLQId61T3R12OoN9OFuk2IR8ZbL8adAhoBG+9
         4+gHZjH4KFM2rrNmwxZ21ltG20Q5OtAQOcM8DEpD2A6XzeXlxqGc+JxkfVTsaP6dbx7Z
         ijrtadyEBFqsD8zorvpGMsJWwvRSkOermG9+/vqAQBEsLEScaXTnzWd0qDKBcLP+tjnD
         EdGQ==
X-Gm-Message-State: ANoB5pnjV/a8M3yXRzBB+4x4OSIIEjh+BgYJuFUdRKBRicj7Da0/UuIj
	M/7yZewfjtEyr+cSN9glytf11vhua+2lww/WDQc=
X-Google-Smtp-Source: AA0mqf6z19L+80cdJdpiBrZekD7zi3b7v//rvam5MbPAwZbpIOcjE6QLP7tSIYyKnEp307OqAF+z+mpMYDtlI5ZbDxA=
X-Received: by 2002:a05:6402:3893:b0:461:b033:90ac with SMTP id
 fd19-20020a056402389300b00461b03390acmr25846123edb.257.1669417983555; Fri, 25
 Nov 2022 15:13:03 -0800 (PST)
MIME-Version: 1.0
References: <20221117-b4-amlogic-bindings-convert-v1-0-3f025599b968@linaro.org>
 <20221117-b4-amlogic-bindings-convert-v1-12-3f025599b968@linaro.org>
In-Reply-To: <20221117-b4-amlogic-bindings-convert-v1-12-3f025599b968@linaro.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 26 Nov 2022 00:12:52 +0100
Message-ID: <CAFBinCC+v-301V2DV5TCMEOW8_q2-+NJCvY+4vCg-05ki+ETUQ@mail.gmail.com>
Subject: Re: [PATCH 12/12] dt-bindings: net: convert mdio-mux-meson-g12a.txt
 to dt-schema
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
X-CRM114-CacheID: sfid-20221125_151305_429475_E30838AF 
X-CRM114-Status: UNSURE (   7.99  )
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

On Fri, Nov 18, 2022 at 3:33 PM Neil Armstrong
<neil.armstrong@linaro.org> wrote:
>
> Convert MDIO bus multiplexer/glue of Amlogic G12a SoC family bindings
> to dt-schema.
>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
