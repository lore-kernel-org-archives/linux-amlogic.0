Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88A75C3E8A8
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Nov 2022 18:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UApPmCKT2AwSF2kY+T3HL0uYj4pQAXxLxoIm8f7cFSk=; b=Mvn/RtmBh/MaEp
	Vq66BKi65KyLOA292jHVExYrgka0Xkk+QP+WEOnTfoYvO7kxezSzi8SjWhFZ1Qka3i5VXwVQZYc4I
	QXyIiJ654zXuPFWKAMelSLAuWdLjwflE5fofsUOM111T9nwVGt1OqjV/Dh7DJ4bDriSNUxoEHAZ2n
	u/7JfDo1hQwszEbU99RT2WnWNKvvagsk7Y0Uc5SDvMbriejs/m8+n8y5aiLVA8FA+38nYTa/T47Aa
	6Bl0oFQH8IYNaUleHxhjyPIIgJfNbAgkM7rfoys2Y4aQOU/z28qX3ZD0DHzzvuF2WjamoE7bxzUNj
	by0v2uYKZQtZ0mnaqlMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow6S5-007J8D-Qp; Fri, 18 Nov 2022 18:51:01 +0000
Received: from mail-oi1-f172.google.com ([209.85.167.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow6S3-007J4N-Kh; Fri, 18 Nov 2022 18:51:01 +0000
Received: by mail-oi1-f172.google.com with SMTP id l127so6293895oia.8;
        Fri, 18 Nov 2022 10:50:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AEGisTxdolA6TJB3qImtZFl0Ek6u4ZDhP6CL8w75bQo=;
        b=tD7h22tlDrM+HU482UesydE4YeVGZiR6Bf5+VxiLI4QBn2jJJT0aDetiYZjBHCIowt
         3G+MJ2lFoCwft+GFc8odL4BQ4aMoP9VeO6yXA2EWWwHmXvb4gTqJqp+yPtWlIOpseyGM
         DzxpLuTpwrWJpXE0HGRvsbNRSKmI8losr1LP/yJJMhaBAw0fDxC3bDhqxR9PzCBhKWPb
         ZPXsCApvSGs233f/+NPEnG5gQv4Jevprw4hrbhffbXg0L4RMrv9ohgRCPDJdtgadR78k
         Wx7Gp/ZcZx/S2Bzh5Vmx9X8QnFW+fbV4uDNQIbksSSrNZioKiLqhL9Z8iVArtALjY1RB
         6BWA==
X-Gm-Message-State: ANoB5pnUl9UIZNFfzJSKNM8cAY3Ea3nouPm/qLImM+yYpT8G/K7A4HYc
	0PRDsaUw6bx4GrhflasDp5//ewGIBw==
X-Google-Smtp-Source: AA0mqf41OMDQLBy2vrDxYSCq614dvKht2GD0zl0kCDAuuXBa962QTC+b9/Mrb78yb8+vJHmZs3z4Lg==
X-Received: by 2002:a05:6808:20a:b0:35a:eae4:b8c5 with SMTP id l10-20020a056808020a00b0035aeae4b8c5mr4164391oie.155.1668797455071;
        Fri, 18 Nov 2022 10:50:55 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id q11-20020a9d630b000000b0066da36d2c45sm1893619otk.22.2022.11.18.10.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 10:50:54 -0800 (PST)
Received: (nullmailer pid 856957 invoked by uid 1000);
	Fri, 18 Nov 2022 18:50:54 -0000
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Eric Dumazet <edumazet@google.com>, 
	linux-amlogic@lists.infradead.org, Vinod Koul <vkoul@kernel.org>, 
	linux-kernel@vger.kernel.org, Heiner Kallweit <hkallweit1@gmail.com>, 
	linux-phy@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>, 
	linux-watchdog@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, 
	Bjorn Helgaas <bhelgaas@google.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Russell King <linux@armlinux.org.uk>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-media@vger.kernel.org, 
	Guenter Roeck <linux@roeck-us.net>, linux-arm-kernel@lists.infradead.org, 
	Alessandro Zummo <a.zummo@towertech.it>, Jerome Brunet <jbrunet@baylibre.com>, linux-pci@vger.kernel.org, 
	netdev@vger.kernel.org, linux-rtc@vger.kernel.org, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Rob Herring <robh+dt@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, devicetree@vger.kernel.org, linux-mmc@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
In-Reply-To:   <20221117-b4-amlogic-bindings-convert-v1-1-3f025599b968@linaro.org>
References:  <20221117-b4-amlogic-bindings-convert-v1-0-3f025599b968@linaro.org> 
 <20221117-b4-amlogic-bindings-convert-v1-1-3f025599b968@linaro.org>
Message-Id: <166879731050.850509.16574480348039079520.robh@kernel.org>
Subject:  Re: [PATCH 01/12] dt-bindings: firmware: convert meson_sm.txt to dt-schema
Date: Fri, 18 Nov 2022 12:50:54 -0600
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_105059_699192_73028A7A 
X-CRM114-Status: GOOD (  11.48  )
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


On Fri, 18 Nov 2022 15:33:27 +0100, Neil Armstrong wrote:
> Convert the Amlogic Secure Monitor bindings to dt-schema.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../bindings/firmware/amlogic,meson-gxbb-sm.yaml   | 36 ++++++++++++++++++++++
>  .../bindings/firmware/meson/meson_sm.txt           | 15 ---------
>  2 files changed, 36 insertions(+), 15 deletions(-)
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20221117-b4-amlogic-bindings-convert-v1-1-3f025599b968@linaro.org


secure-monitor: compatible:0: 'amlogic,meson-gxbb-sm' was expected
	arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dtb
	arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dtb
	arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dtb
	arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dtb
	arch/arm64/boot/dts/amlogic/meson-gxbb-p200.dtb
	arch/arm64/boot/dts/amlogic/meson-gxbb-p201.dtb
	arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-meta.dtb
	arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-pro.dtb
	arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-telos.dtb
	arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-hub.dtb
	arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-play2.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s805x-libretech-ac.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s805x-p241.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905d-libretech-pc.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905d-mecool-kii-pro.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p231.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905d-phicomm-n1.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905d-sml5442tw.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905d-vero4k-plus.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905w-p281.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905w-tx3-mini.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905x-hwacom-amazetv.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc-v2.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905x-nexbox-a95x.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dtb
	arch/arm64/boot/dts/amlogic/meson-gxm-gt1-ultimate.dtb
	arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dtb
	arch/arm64/boot/dts/amlogic/meson-gxm-mecool-kiii-pro.dtb
	arch/arm64/boot/dts/amlogic/meson-gxm-minix-neo-u9h.dtb
	arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dtb
	arch/arm64/boot/dts/amlogic/meson-gxm-q200.dtb
	arch/arm64/boot/dts/amlogic/meson-gxm-q201.dtb
	arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dtb
	arch/arm64/boot/dts/amlogic/meson-gxm-s912-libretech-pc.dtb
	arch/arm64/boot/dts/amlogic/meson-gxm-vega-s96.dtb
	arch/arm64/boot/dts/amlogic/meson-gxm-wetek-core2.dtb

secure-monitor: compatible: ['amlogic,meson-gx-sm', 'amlogic,meson-gxbb-sm'] is too long
	arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dtb
	arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dtb
	arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dtb
	arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dtb
	arch/arm64/boot/dts/amlogic/meson-gxbb-p200.dtb
	arch/arm64/boot/dts/amlogic/meson-gxbb-p201.dtb
	arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-meta.dtb
	arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-pro.dtb
	arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-telos.dtb
	arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-hub.dtb
	arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-play2.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s805x-libretech-ac.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s805x-p241.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905d-libretech-pc.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905d-mecool-kii-pro.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p231.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905d-phicomm-n1.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905d-sml5442tw.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905d-vero4k-plus.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905w-p281.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905w-tx3-mini.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905x-hwacom-amazetv.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc-v2.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905x-nexbox-a95x.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dtb
	arch/arm64/boot/dts/amlogic/meson-gxm-gt1-ultimate.dtb
	arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dtb
	arch/arm64/boot/dts/amlogic/meson-gxm-mecool-kiii-pro.dtb
	arch/arm64/boot/dts/amlogic/meson-gxm-minix-neo-u9h.dtb
	arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dtb
	arch/arm64/boot/dts/amlogic/meson-gxm-q200.dtb
	arch/arm64/boot/dts/amlogic/meson-gxm-q201.dtb
	arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dtb
	arch/arm64/boot/dts/amlogic/meson-gxm-s912-libretech-pc.dtb
	arch/arm64/boot/dts/amlogic/meson-gxm-vega-s96.dtb
	arch/arm64/boot/dts/amlogic/meson-gxm-wetek-core2.dtb


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
