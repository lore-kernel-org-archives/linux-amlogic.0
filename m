Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C74BC54EBC
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Jan 2023 22:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JC1J4RjUQ/YHekcJjkGAkXa3oJhiNgJwdSVd1Eo7P0E=; b=atyye78zQ/s3Uc
	k0LZ48eX3h2bHZGuulENw+yCO3kSsN2GkxIOObN1+qerCtXbot9+SJuZCz+KbYohQhT77y63KNBqc
	9IsiliGLT9hW7GYwW27wRuGZsnoohPuRqBQuiB1kF6bjF81GtukbNFdLY8aNawV9m/qroPR5EMv/N
	HiUV33isAiAERcPEL+VN/mT/fUIRSW7j5w/bI1pnIfxHb6HqbOXxHQ9EIq1TJBBdK79M2h3SEOOr7
	muAKYeON89lc465G6YmKa/ZFe0jCDkDOeRHKYmX5HC301/wcRIKNWKxlzdxP/u73RqOGFDc1j8ySb
	P7E9aiPhxb1Y/mJqJDbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFMkE-008iia-QR; Tue, 10 Jan 2023 22:05:22 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFMk3-008ieF-Jj; Tue, 10 Jan 2023 22:05:12 +0000
Received: by mail-ed1-x535.google.com with SMTP id v6so19655734edd.6;
        Tue, 10 Jan 2023 14:05:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WrKmlWHDUV61DahQUIaVkiL3+243B01IgkXVVlGEa8Y=;
        b=IU6f2FJsgTYlQlUxPC3SgJJ3nHFscGea08quQshVivr8hFfTaCsq0s0LtncJiE9VM6
         3mP91XMs097IQMqGrGDeR9Q+Nn9BKmtDOAQCWiDZ2Q8eVwcQryoz9SH1KeWnpPHN45c3
         rPkRe1EqQB8QmpZv3Xy+dztrHgOb2VFHNMCQaPsGirHXniNzQLu5bPySZcqFWzYtaPmq
         5A2dtC34COH9kL8iMQXmAHCiJ4F7MQp47VlpgBt+vNEbw1EwcfbsX8aGYfoKUM8gt1hz
         GDPLFshOAOL8YRSF/7Z9ozAVNX/9vQQ2R1X1DLFRvX0Cj+ub7mHHtQz157FGqOyEOaRD
         YtfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WrKmlWHDUV61DahQUIaVkiL3+243B01IgkXVVlGEa8Y=;
        b=RsTAX+hQUWaGbTPQYb50FH7igqf6hnF6ipAaDc4qeuGoxNttgIWZcqwJ4aZwzgkoNC
         sCl7n8tTj2KeZ2OoRyxUj5CAL2tlNMm7KZxWFZ6oKj0GLqtKJbWAEBGMYrNP26fe28wG
         wmzy8RjTQSx4skZY4/oAqY58pRwUD6bmTKN1fA/tPX6iljV7Kwo/lEP6ziRr1cWeM8i8
         wgGCr+ImiFcyifkUguKAslqVVFaATcLzcxCs64+mF4nTCwhS+U82hUNadqhIpKJD5wWS
         3+HaqdCmqjCfYmhdHBy96VoFHYhDtkUXY2JOk64eGpetPW2aOKNwseIXhhz4AOykrvrW
         G9Ww==
X-Gm-Message-State: AFqh2ko3VpVQSB4791/k22KteLPq3BYSGiyUghq6xiNJ5kMFeJgTOXAD
	BjGhU1g8WAe47xocm24sanwcaqC2vxideIrLgrM=
X-Google-Smtp-Source: AMrXdXslMt+extOJ67lNrPk/gzoVhLdRWwj56JScPZGQacLbHpwmoFzQ7g3CAvQIElO72fbF6+niQAf0El2SmKxOxfk=
X-Received: by 2002:a05:6402:78b:b0:494:cb79:1ff3 with SMTP id
 d11-20020a056402078b00b00494cb791ff3mr2392529edy.291.1673388309924; Tue, 10
 Jan 2023 14:05:09 -0800 (PST)
MIME-Version: 1.0
References: <20221117-b4-amlogic-bindings-convert-v2-0-36ad050bb625@linaro.org>
 <20221117-b4-amlogic-bindings-convert-v2-3-36ad050bb625@linaro.org> <5c59d432-3785-8eaa-af77-03fee09b5fd3@linaro.org>
In-Reply-To: <5c59d432-3785-8eaa-af77-03fee09b5fd3@linaro.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 10 Jan 2023 23:04:58 +0100
Message-ID: <CAFBinCCjDLN5owiD1x5UNcBiE7P6czkS1wrSYKn-bBPCHQxT9Q@mail.gmail.com>
Subject: Re: [PATCH v2 03/11] dt-bindings: nvmem: convert amlogic-meson-mx-efuse.txt
 to dt-schema
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
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
	linux-pci@vger.kernel.org, netdev@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230110_140511_689116_90FFE0A4 
X-CRM114-Status: GOOD (  11.01  )
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

Hi Neil, Hi Krzysztof,

On Tue, Jan 10, 2023 at 11:15 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
[...]
> > +  secure-monitor:
> > +    description: phandle to the secure-monitor node
>
> Missing $ref
Actually this IP does not connect to a secure-monitor. So the
secure-monitor property can be removed.


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
