Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21C01C46467
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Jan 2023 22:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0lRMIt0b+ST/e/ZyO5lu9eR0tKM8Lrzs6t+PuqxYtSE=; b=fsVw/mMiM/XIYS
	Kd9QbdAWhaPeIi2GWomc1HX1lC/zztrELvji7/mSCm23KKsnJ8OoKv+TMGRnXfQHYdrjT0TCs42rN
	bSLV3iLHZSmaCw0UC3CInX15HAHuc9dvDQ7gXLYUG9GPCyxhRAnjtfgEaplUcHCIaMfb2FHSKICdc
	0lF8b8TMRP9iAvaAmQ29nFT7qlO6RjJ4G1OGQ/qET2idt9BhnGJAQ4N6MdFf4uYPMUBAh1N6hPnHN
	/d195yoqO/KsDf97d5IMxy0Xfui1sjTySKEZJYak4CPJbPy+vEYW+txd5CDKQxe1GNFGdxVTCT9Qu
	pXactU7XwVcHHaXdvSgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFMgn-008hyi-Bq; Tue, 10 Jan 2023 22:01:49 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFMgc-008hvm-GN; Tue, 10 Jan 2023 22:01:39 +0000
Received: by mail-ed1-x536.google.com with SMTP id v30so19670093edb.9;
        Tue, 10 Jan 2023 14:01:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1zojtUlTJ41SuWrZfC5EvKnzTTlRKFzqNeYYEkay3v4=;
        b=cddZySA12Yq1swNWNYpIqK5JVInCajEv34dtVRX5iLyqxr5N3PemsxVXbnYOYIAGnr
         gKqEW06tcOHsUR8VcFS7DQXlbibMgWFmmH7wYHUh2NL0DKearGTJxtoM93CdEr7jbMDa
         O9ctWwjV5w20+4FuPz2Hrf6A4e+2EkHV+2R1k7gHfAtogBaDtnsVgEfWmQRtkix/YR5s
         5XEKKjiSszvnbWScuBp9OOtkHUJmcyyUHP0ylIIYBERyQsHDrotlg+UBh5g0M8HCQsQV
         oDCEclTpfv1WZWvEXDWC9pZsmAAQIsOWKCMhRAz34wryF5FxONHePBLWOopXe29o2SPe
         Ybkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1zojtUlTJ41SuWrZfC5EvKnzTTlRKFzqNeYYEkay3v4=;
        b=K5JrmHg1F2G8qjavIynTvrkYrxvQgM0OxrCot8EitbM49e3Y4WgLgM0T6Vr7E0FGfc
         LfkACwbYtta63ulrxDwdAEQ2n0Z8/FaPEjg8NWRLs/WpIxh3LdtHoHs2HU+hKFrAPxIe
         wJeUoxi9W0T6d3XY3549tndmwUTcvAe/MGqyNKOFR6blOxQnULSJoYxdtRY5ukunKQZp
         P9xAPt5BM+U/JtJrU9QxtbNPxiNzNJOihaHtiCZg5WIs6J84zgnJ0WFpnZDluJH7PycD
         yrjHdJfy+397vASWFPGrdbHwGpEvp2EiZBzjskCEjpe+wA7YQcoY82K8Txtxae4L4DGE
         3JhA==
X-Gm-Message-State: AFqh2kpHLYLxxq9kSdRBK05xp8isLn7VloDKoqzTsFO1rKoWDPYuRTFc
	nn+JqV9HdA+w0f/aCldVA1MZsP6m8WKbe4RxBgE=
X-Google-Smtp-Source: AMrXdXs/xAROFlmP1Z6gsP4nU76Fz9ohlobY7nC70UqqJ6A94oT0iQ6simlwUiEPavrP8bBYALj6XMxx0kprOzT+6D8=
X-Received: by 2002:a05:6402:4290:b0:498:61f5:5734 with SMTP id
 g16-20020a056402429000b0049861f55734mr1027278edc.238.1673388094576; Tue, 10
 Jan 2023 14:01:34 -0800 (PST)
MIME-Version: 1.0
References: <20221117-b4-amlogic-bindings-convert-v2-0-36ad050bb625@linaro.org>
 <20221117-b4-amlogic-bindings-convert-v2-2-36ad050bb625@linaro.org>
In-Reply-To: <20221117-b4-amlogic-bindings-convert-v2-2-36ad050bb625@linaro.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 10 Jan 2023 23:01:23 +0100
Message-ID: <CAFBinCCP7xyFEa9GhRQ3NBhfSkn1WSP_qyoLKfaMPpqUTe11bA@mail.gmail.com>
Subject: Re: [PATCH v2 02/11] dt-bindings: nvmem: convert amlogic-efuse.txt to dt-schema
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
X-CRM114-CacheID: sfid-20230110_140138_566787_47F3F4FA 
X-CRM114-Status: GOOD (  11.10  )
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

On Mon, Jan 9, 2023 at 1:53 PM Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> Convert the  Amlogic Meson GX eFuse bindings to dt-schema.
>
> Take in account the used variant with amlogic,meson-gx-efuse.
>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

This will cause a warning in
arch/arm64/boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dts
though (which is an existing issue, this patch just makes it visible).
I sent a fix for that: [0]


Best regards,
Martin


[0] https://lore.kernel.org/linux-amlogic/20230110215926.1296650-1-martin.blumenstingl@googlemail.com/T/#u

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
