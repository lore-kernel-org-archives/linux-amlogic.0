Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50159C43217
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Nov 2022 23:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pM6NRoWrlaoPtcHFXiTJzN7fP4TDiGzqN9qew+nESpw=; b=jzzIzTcLlu3Gnx
	2wW9ciWYYlAOF/gHSw7qMhuQX8IcylT+5sP6bUNhMwNNyiBBdo3x+IC9w3lrWpAYRnD7N8GNBUvZk
	RM7OsNkBDBUNrHpfAuQ5qTKtHTfcietbhsvkQ8c5mLHH7u9Il0b4fPsIke/b7Yr8YM91+YNSdN2nl
	lRfxqkA+id6jrNMcVfX0jn5LoAicB+F9a4O25MUNCMDiV6vCv5B5auB5DieE4zfA/ZtgexUek5S2O
	j7avBSe3+M3doA1k9TfI3GxZ/P2EHCIEXg55hYMErP2NW6DPXr4pFzufqiXKcCZi7v4u2d1Mx3sut
	OWls6W9lq4PC+YfxIhjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyiFX-002rqe-BN; Fri, 25 Nov 2022 23:36:51 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyiFU-002rnh-MX; Fri, 25 Nov 2022 23:36:49 +0000
Received: by mail-ej1-x633.google.com with SMTP id ho10so13303419ejc.1;
        Fri, 25 Nov 2022 15:36:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=53pASLo6U2zzYHdiGPJru2sei7EMeIsybEcbugHJMGw=;
        b=aNmO4iy1jEBOxe4hLQffwUBwh9RXL7ogbj5yuKyKDk+Xzpa9rmxmLXt65tfNv5wpIX
         zCIgP3UXxPHLUlvesV043w+pnVAvv6aeeguf3WSjGGxzBGh+aGFCYvAO2eYViSso1InR
         eOGZh6VgaeO+Dmvu0OMjrZ0zg4rQqCRarVo3050M4z3zqJJCa0+ynj6CUT3S+u+xB6b0
         vn0mNPQGaf68AAHuzsCi7zOUJm60aMjynS55gdF+ou7JUayNoM4xyAM+nJwCMhQWg9XQ
         JoCTXbY/uWDqaBgF7oYHso/i7h9fojytw30ODsNPAnbkRuWDT8FHy4rdPIF3rXMBPTMf
         AFlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=53pASLo6U2zzYHdiGPJru2sei7EMeIsybEcbugHJMGw=;
        b=k1QVb7k2VRA34kxaZ2OgSrtkX9NOnikOdsNFs0sKw4q5hp7ixasqA9nCYoYAEqV7Os
         0GN9zfBpkRZkMA2C3nxCsKSO2pgN4DPsdylmvp5CpCP3fwWf/2KP8d9+/iDN4nd4/UB2
         Qr5JGLKgitXFDEi0Fqfv17P9Je0QQzEhbOgYoG1iNXjJjorof97zl0HTc3K+AJatlq9x
         wVDm85BcFb8dPhaQ4a4/kkX8+QUbie3Ps7+Gve20v63xGs1FI33BypJKZnlLJjQSVKIf
         Sz3gdSHMcOQ883C59oK7vZnvy4DKKK9zR7CMRX68uN4SQBU9cuTJOVNVcymTDN5ldEAK
         ttXQ==
X-Gm-Message-State: ANoB5pmgqt+Ee0cqqJh8ek0c+b97xkyUMCFtzv0wBvxmVq2kWuYU2FAb
	0BubOrMpSgSFqsAqh+MdOSJFd2wIJmqihsbzEdI=
X-Google-Smtp-Source: AA0mqf45bdEJiOxhbUnLhIigBT0GjU47GsHYZmyiWPQnPoGEsgOfGs0TvhtmfqACF3pOoGPbacknnLPg3TD8cSTM64A=
X-Received: by 2002:a17:907:a709:b0:79f:cd7c:e861 with SMTP id
 vw9-20020a170907a70900b0079fcd7ce861mr33399680ejc.339.1669419406346; Fri, 25
 Nov 2022 15:36:46 -0800 (PST)
MIME-Version: 1.0
References: <20221117-b4-amlogic-bindings-convert-v1-0-3f025599b968@linaro.org>
 <20221117-b4-amlogic-bindings-convert-v1-6-3f025599b968@linaro.org>
In-Reply-To: <20221117-b4-amlogic-bindings-convert-v1-6-3f025599b968@linaro.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 26 Nov 2022 00:36:35 +0100
Message-ID: <CAFBinCAmV7wuPq8y+g0YKxZ0W1G8_=WgY+E3OT9WT62eDkxXqw@mail.gmail.com>
Subject: Re: [PATCH 06/12] dt-bindings: rtc: convert rtc-meson.txt to dt-schema
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
X-CRM114-CacheID: sfid-20221125_153648_753242_D697FDD5 
X-CRM114-Status: GOOD (  10.98  )
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
> Convert the Amlogic Meson6 RTC bindings to dt-schema.
>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
With the comment below addressed please add my:
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

[...]
> +        mac@0 {
> +            reg = <0 6>;
> +        };
My understanding is that here you want to showcase the nvmem integration.
This IP block only supports 4 bytes of NVMEM. Instead of using MAC
(which is not what's stored here, the suspend firmware uses it
instead) I'd just use something like:
data@0 {
  reg = <0x0 4>;
};


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
