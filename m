Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA6A7C433EF
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Dec 2021 16:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=of3+Cv+0ztGqdla5e2vzd7wx5fyzZfVuc5k5QYBh6hw=; b=fJPbneXQ74jy22
	kxtiizdjJnTrq+JrgpnD1Joyck+eZNlnP8jKCOASj1KQsyh3Oz1q69OXCerW6AiH34qKHW5EohOCw
	sIYjR4Yrp3FDGdstPmoJ4dTo/CWu8CDgTV8LtigPX3wnuZx8P0qbLvXb9sAQlhJtXkOkXEdWU9igV
	ameSRUCNCX/3jGi/9UBpH+VkzEKJteaDwHXl0OeRzIjtK6PQrsptqXTyVx+uGSlHibWODipPaSvac
	kHDUmz5i27wB69qSQCFoRfltWHrnTxMzg6dACVcD3tRr0hRatjOuXgXEKDPnmON3aMgfKjsZyQN4e
	f4PJrGdWZswjf7IAs1eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n1tGh-00H5E8-De; Mon, 27 Dec 2021 16:54:39 +0000
Received: from mail-qk1-f171.google.com ([209.85.222.171])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n1tGI-00H57I-6w; Mon, 27 Dec 2021 16:54:16 +0000
Received: by mail-qk1-f171.google.com with SMTP id 131so14907683qkk.2;
 Mon, 27 Dec 2021 08:54:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=HUQW6IpkyjLukSOt9D0oujpEApqWaV8yZBESVCrJm0c=;
 b=kn9k6Z4qZeIUcoR4wXg8Lxx8oshvwo8behe6eJ7n2HYQm/Bfuk+H0QBMn2ytyWk30/
 H6RBtn1UltiRcosXW9BYYpFWcRVilcMZlJdePIpI77PnBZw4jx4Xb9PqbKZojtzW20US
 snwB7rzSxdMXe0T/ENwKCyW6AIlMmXmB/HyWrny0vJCdrbYVdp/9LAUeci9uH46Iqo23
 rc1R800kWxDmb2pc41i2uMB1xzKcDXveYvUNiMTgow689xS37dwzt8W24KhTTrNnJG77
 xYDA1FbALkLL9L0htmdvVAe4Rkylzq7oxnHMdrLu4hNq3To2g9S19M/DJ1qWVBW3xHsT
 qo+A==
X-Gm-Message-State: AOAM532bzXajbA+QLSOD2iuJIP47kZc61GDkNw+4SefkYcwd9+VUxtZk
 CKD5y0YFqUecPA2WA+2T5A==
X-Google-Smtp-Source: ABdhPJzkM7JmikYM7JLfuijM4GdYFenX1pnv9WJFIE/CT7bFaCiQZlHXnwfhTPsptFlZrKbjp+77FQ==
X-Received: by 2002:a05:620a:2687:: with SMTP id
 c7mr12225344qkp.473.1640624052589; 
 Mon, 27 Dec 2021 08:54:12 -0800 (PST)
Received: from robh.at.kernel.org ([24.55.105.145])
 by smtp.gmail.com with ESMTPSA id z8sm14070194qta.50.2021.12.27.08.54.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Dec 2021 08:54:12 -0800 (PST)
Received: (nullmailer pid 648280 invoked by uid 1000);
 Mon, 27 Dec 2021 16:54:10 -0000
Date: Mon, 27 Dec 2021 12:54:10 -0400
From: Rob Herring <robh@kernel.org>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 kelvin.zhang@amlogic.com, devicetree@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kevin Hilman <khilman@baylibre.com>, linux-serial@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org
Subject: Re: [PATCH V3] dt-bindings: serial: amlogic, meson-uart: support S4
Message-ID: <YcnvsriW+mHHBIti@robh.at.kernel.org>
References: <20211227054529.30586-1-xianwei.zhao@amlogic.com>
 <1640619206.696540.519387.nullmailer@robh.at.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1640619206.696540.519387.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211227_085414_305959_5FCA9359 
X-CRM114-Status: GOOD (  15.77  )
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

On Mon, Dec 27, 2021 at 11:33:26AM -0400, Rob Herring wrote:
> On Mon, 27 Dec 2021 13:45:29 +0800, Xianwei Zhao wrote:
> > Add serial bindings support meson S4 SoC family.
> > 
> > Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> > ---
> > V2 -> V3 : fix the type menson->meson
> > V1 -> V2 : update author name
> > ---
> >  .../devicetree/bindings/serial/amlogic,meson-uart.yaml          | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> 
> Running 'make dtbs_check' with the schema in this patch gives the
> following warnings. Consider if they are expected or the schema is
> incorrect. These may not be new warnings.
> 
> Note that it is not yet a requirement to have 0 warnings for dtbs_check.
> This will change in the future.
> 
> Full log is available here: https://patchwork.ozlabs.org/patch/1573297
> 
> 
> serial@23000: 'bluetooth', 'uart-has-rtscts' do not match any of the regexes: 'pinctrl-[0-9]+'
> 	arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j100.dt.yaml
> 
> serial@24000: 'bluetooth', 'uart-has-rtscts' do not match any of the regexes: 'pinctrl-[0-9]+'
> 	arch/arm64/boot/dts/amlogic/meson-axg-s400.dt.yaml
> 	arch/arm64/boot/dts/amlogic/meson-g12a-radxa-zero.dt.yaml
> 	arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dt.yaml
> 	arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dt.yaml
> 	arch/arm64/boot/dts/amlogic/meson-g12b-a311d-khadas-vim3.dt.yaml
> 	arch/arm64/boot/dts/amlogic/meson-g12b-gsking-x.dt.yaml
> 	arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dt.yaml
> 	arch/arm64/boot/dts/amlogic/meson-g12b-gtking-pro.dt.yaml
> 	arch/arm64/boot/dts/amlogic/meson-g12b-s922x-khadas-vim3.dt.yaml
> 	arch/arm64/boot/dts/amlogic/meson-g12b-ugoos-am6.dt.yaml
> 	arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dt.yaml
> 	arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dt.yaml

These are all due to no reference to serial.yaml. Please fix that. We 
fixed all of these, so this schema must have come in at the same time.

Rob

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
