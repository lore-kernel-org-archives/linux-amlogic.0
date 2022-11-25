Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D8DFC4332F
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Nov 2022 23:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QVY+UrcpRg/x1oPVtKt8gFVij3WtzJaet92FDo+XtC4=; b=oa4QI2Wb99QqC0
	uHgk65WQ5muY/zwiuAK0ItZ28400hFf2P+Xjl9oh+w0wGRqkReWXzCntTWFY1cxesyBuPdtjjsl8V
	unFlUNGrNS3YChxALSjHrw2d7wBo9cqK1G++lipbtIpOFHW+6y1CpcHSPb0KJlBnPKu1tPwVUXcWE
	VK9TgAxArjzV7LmEaxtbmlx0oHVCIaR2rihl9/AOsKb9VDbPX5m3Ol96wOYFR3vBGo/WCXHnHIVjg
	cmf4fFIm7Gdxikunob7MDG+yXnDWWCYM0NOnL4dFY6+J4YbVvDv6V2fjYSARMUDlw9vLFfLh6VfCF
	vo12kfbVf5QYsZeTZUOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyhpK-002hBj-Ga; Fri, 25 Nov 2022 23:09:46 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyhpH-002h6W-MK; Fri, 25 Nov 2022 23:09:44 +0000
Received: by mail-ej1-x632.google.com with SMTP id e27so13137825ejc.12;
        Fri, 25 Nov 2022 15:09:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0XioFARl1h+9O4FdVBDeUHFWIc6Iha9ExJeFsC7agBo=;
        b=ijem6b9zdomha6/vwYCcu6q8sRZEnyYMC+N/TfI2betHX8h/17lEvcObNDwAQZJrG1
         CyZg1GysIN3LJ6SCN+fz3ZbQ0s5Tv99nsSKleNi1cMo4HZr6+dqNoyz0huHMEsUKblbo
         j0iZ8uZIUhy4GKX8DuQdVW9dJAeRPmOdo8wBpvyB4DGVk6RFhKFlvSC6nHSvFV45a7GV
         lzTF7YNPMIzzTc7iDwJt6lA682jcC7xhATg7OxVhqLcIYkgwlIJUf08RD07lTP6m43xu
         p3UHG5Dp/A/fg39MCY4C9PQ6p5pXNBt0+B08vp6X1ohQfD/1CGL0eDy8QZLi3Eh7sP1A
         p+9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0XioFARl1h+9O4FdVBDeUHFWIc6Iha9ExJeFsC7agBo=;
        b=aSLR07IH8dp/NFWJTUy/9ak9rds5/hEstKI6l1tcSi1m0GPDrcc5nTkLGa4bMlHiP5
         2p/LPi9n3dOdP0c9ASLI5nbaklcdWjon7X/FU1o36fpwMh/ShCSNwMejNBVr6xOHbKYm
         8khf7Ctk8+HYCvthDJxq6V4PIp1L/M2+l+M1n7AOrnfflodecS1CUWkT3Vlxb+0I8XtQ
         cLXn0WuAL9YjimaU7Hru02DxGcTMWPtg2i6A0ArYtbERMmZzsbt8mXX+DmPUK0r/qUKj
         /hi21rhETvoVygbPuHpxa3kGKF+wFvHWzUIKJDgVqFWjfIO6qZXtpCssXNNiMpODQT7J
         JLVQ==
X-Gm-Message-State: ANoB5pm2PkSNQT3ljPwkF8c/X+FMCIAcE1DLta3eRXW+RRLM9wWdbFiy
	0JcHmDHLxOWfJxNwZ5AvGUJfRDEk1+cbdtOBQvA=
X-Google-Smtp-Source: AA0mqf6ewtl/tvr8AuX1o3Xv/HwzUQiWRCO/BLv6pZISPImaHV2Rdm1l6LFkGhHL2TOQaHdJhN8otAdj5S+OkRcsIHY=
X-Received: by 2002:a17:906:1498:b0:73f:40a9:62ff with SMTP id
 x24-20020a170906149800b0073f40a962ffmr34923198ejc.678.1669417779871; Fri, 25
 Nov 2022 15:09:39 -0800 (PST)
MIME-Version: 1.0
References: <20221117-b4-amlogic-bindings-convert-v1-0-3f025599b968@linaro.org>
 <20221117-b4-amlogic-bindings-convert-v1-8-3f025599b968@linaro.org>
In-Reply-To: <20221117-b4-amlogic-bindings-convert-v1-8-3f025599b968@linaro.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 26 Nov 2022 00:09:28 +0100
Message-ID: <CAFBinCBgj-SCh8-BN6aG49GxfNXshjV3XGi0uWkZ26zT3mOceg@mail.gmail.com>
Subject: Re: [PATCH 08/12] dt-bindings: timer: convert timer/amlogic,meson7-timer.txt
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
X-CRM114-CacheID: sfid-20221125_150943_759371_A7B81AB8 
X-CRM114-Status: UNSURE (   8.62  )
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

there's a typo in the subject line: it should be meson6-timer.txt
(instead of meson7-timer.txt)

On Fri, Nov 18, 2022 at 3:33 PM Neil Armstrong
<neil.armstrong@linaro.org> wrote:
>
> Convert the Amlogic Meson6 SoCs Timer Controller bindings to dt-schema.
>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
If you re-send this with the subject updated and the per-timer
interrupt description (that Krzysztof mentioned) added then please add
my:
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
