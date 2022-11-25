Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B405BC4332F
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Nov 2022 23:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UMxrCeWDTA21TqTwQb9yhdTz6wU//mUeaSLhZHljK1c=; b=r6lpt8H7SPMNg7
	0DLMK6vgi0THIqBM3qZePtocx8dUEWKRFzXxRHdBV+A0sV9yAPd92p2ODh1dNun6MBvlu+StZOlOs
	jDZ7FIlAif61ZMnuFyF1pOGZynla16W3NlkF1yS7itaUVdudCeW57U1r1Zr/Yqtse3jbG2jBXsqbk
	PKUfEb2MmplSj40WiGqeXOZr3amGep7u+sEAnTT0mHxLMkByp/eewTaWpR3E3UAl6m+2ub/ulx2Zb
	lApYeRFqUQqA04TGtHSOMS6Pp9hKq2I4GEXu48oG89mPWLG9d3x5E83JnHEQO6TXtLgTkz/VD2thc
	rS+ybaGsHVxh02/Nwhow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyhqY-002htZ-CO; Fri, 25 Nov 2022 23:11:02 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyhqV-002hr7-Sz; Fri, 25 Nov 2022 23:11:01 +0000
Received: by mail-ej1-x636.google.com with SMTP id bj12so13115290ejb.13;
        Fri, 25 Nov 2022 15:10:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Q7U7G5CiQhnzMThzAFGcx2s+uHerZTRaEXypLXgixeA=;
        b=UVMyss+7rEYxSPmb8p82Mv6D8rx8V5naJGOde7hXp+cosnBNL9xoyXahQ1mQYKYnNd
         Lua1xFxAK17/ooO492vC49X+luSzix/pD+lVfTH2ZK+c5u+IK34+v7gvt/Gh/vGINusx
         2jxFPSUsb2U4kcU5SkxVPIuki3NalU3fcOHSzoM2QDNCbTs2WLohr8vDm6HLl9GjBMmI
         Pl8IQrfN7F93OROvLZjI1vbx+ClSjlx2dEQIyhxhXEvmRIOxHN0wXhJWdDYp+jKFQW4O
         O0ZItoUA0e4H4dX6/MjXpenaKHNs9WOF5SYidalNj8S367LHiqHHRo4NucIfStWJ+G+W
         Z9mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q7U7G5CiQhnzMThzAFGcx2s+uHerZTRaEXypLXgixeA=;
        b=KwqqKzlXzvwSubRr1CM35N2Yju8ymIelL69ceTo68fWGZH3T01R3n0IC/6ew6oxNlg
         v3dKuRfhEz5BARfb1N9ZqFVE+dLYLgxmLBRnhacg0GTh/JqltYmKWK4chmcDUOulwQTt
         XRPIYBxO0oXKJZfPBgMf0JXtsRaZtqzfLCJvc9PB6sgXlv0juj7gMYHIrXGdtgrYg+zw
         gl1kC3JwDVmCIBhmBktyAkIbsSqxS97urrv5z4A06LZC/79FuuRzGIPrjDYUJfeEfPmj
         iF1hmCnfZcNW4/a3TRmRTOXvEz2pzI7ox95o1enjLD4ajdjTKu7MmJ5zw3suzC43Vw5J
         ewCw==
X-Gm-Message-State: ANoB5pnw9Dvc66tZt7PtIsNhlh1WeDR/U37EMTk1zhXXilZEf10R5WQz
	mrM1PG5u8oBlH8SuDAi41+S2vj8O265iSX/Kah7quDvNKhDd6w==
X-Google-Smtp-Source: AA0mqf4eckeBj0/Wph7U7qMN8zegn2m4M80Mi8LIoBZHcXLcZcwyhvtCy2QiSp7o9N+U4CA/QRN9W/V0xDqjX61QtAY=
X-Received: by 2002:a17:906:6bd8:b0:78b:a8d:e76a with SMTP id
 t24-20020a1709066bd800b0078b0a8de76amr35199024ejs.725.1669417856212; Fri, 25
 Nov 2022 15:10:56 -0800 (PST)
MIME-Version: 1.0
References: <20221117-b4-amlogic-bindings-convert-v1-0-3f025599b968@linaro.org>
 <20221117-b4-amlogic-bindings-convert-v1-9-3f025599b968@linaro.org>
In-Reply-To: <20221117-b4-amlogic-bindings-convert-v1-9-3f025599b968@linaro.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 26 Nov 2022 00:10:45 +0100
Message-ID: <CAFBinCBQi21vKuT_eScmswTx2rP1DsH_uEL=+Lp9a5EfgfFUTQ@mail.gmail.com>
Subject: Re: [PATCH 09/12] dt-bindings: phy: convert meson-gxl-usb2-phy.txt to dt-schema
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
X-CRM114-CacheID: sfid-20221125_151059_972055_EFDD3CD6 
X-CRM114-Status: UNSURE (   8.00  )
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
> Convert the Amlogic Meson GXL USB2 PHY bindings to dt-schema.
>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
