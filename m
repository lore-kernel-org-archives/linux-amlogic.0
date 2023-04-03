Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32C4AC77B6E
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Apr 2023 18:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8ptkD2gqheUsucYCBgUoCyO/zKJahmU+lQeoNdqVATA=; b=mjzonrpa2rD4Sl
	UOUu+3hdEc7GF9R9CTlKb/vsGp4pexaTuxFEqjPfigEv53TNqjdq7DZQ5nloNsQklsnabka5rqsNj
	Z4ilsUNDeYtUks+zZCAu3Cu/5a76XNCCJTwNxXcnK5+WgEv5nXd4+pF0X46oNsI78hP2mCIQ9RNIU
	ofycpGx5HUXCUBrxIoBOSUR6DIOPDgSPDq8aoSa6qf0ZRmA5eTy+KXKLnJgunuyAZuUHm+j6dyyUs
	TIk+GGG7C61urcvKGfdGpkzSId70ZuZdGvojvSHHdH7YEhldXiKxAmpfu1pmF2h/aV66YNVUHM4+G
	n2btOlVrmXQUtLN1daZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjOzC-00GE1D-2v;
	Mon, 03 Apr 2023 18:32:58 +0000
Received: from mail-oa1-f48.google.com ([209.85.160.48])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjOz9-00GDwm-1g;
	Mon, 03 Apr 2023 18:32:58 +0000
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-17ebba88c60so31803135fac.3;
        Mon, 03 Apr 2023 11:32:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680546771;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FYyVy/snGJqjQZr7MOg2KuFtqjR1UL00/hKQM++ILHc=;
        b=w6dZhp05lLxsJHppvXjczU2qF0e0oc0/WTxhUHPri+ESZfiicGnV1axZg/8w4tfzNt
         3qP3ftDFI9UBkFIsa8mKu3GZtQxQVogTecUEPktUeIDAMrQVEJEhV3wf2cEVUzm7Uxm0
         t3TQFeO4eyhMSd3WkDUjJ0PL7rnVnJebzFquuddUUviBhkFpct7k8YSOttu/z7+WSVje
         R89kLbinC+TMrrt21qLleeLZHnzHCUcxe4i+mqtl5dny+ANu3/wmPu4AfrmlOszKpCuk
         Ku4rXiwawxaN2MaRjvDp2BVqnbvFn09rzlb4TOgEh671km+vcc33tXktpz+BrHtVMcEu
         oddQ==
X-Gm-Message-State: AAQBX9e0LWmBMiPGzi9gtUhVvCS0++O/kiAigV4o+sAx0TB//EKefKQ8
	eqYzyexNGmXvQALQ+CcaMQ==
X-Google-Smtp-Source: AKy350blJmcdZF5R/4BqOsx8DNqeMLH92xBA8mK6SNqOrYr7M9L0L5nMoc8O2STh58ZO+5pukMg3Tg==
X-Received: by 2002:a05:6870:a40f:b0:177:a3dd:a92d with SMTP id m15-20020a056870a40f00b00177a3dda92dmr150224oal.7.1680546771133;
        Mon, 03 Apr 2023 11:32:51 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id uq11-20020a056870df0b00b00176d49bb898sm3770737oab.44.2023.04.03.11.32.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Apr 2023 11:32:50 -0700 (PDT)
Received: (nullmailer pid 1335330 invoked by uid 1000);
	Mon, 03 Apr 2023 18:32:49 -0000
Date: Mon, 3 Apr 2023 13:32:49 -0500
From: Rob Herring <robh@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-amlogic@lists.infradead.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jerome Brunet <jbrunet@baylibre.com>, Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH v5] dt-bindings: timer: convert
 timer/amlogic,meson6-timer.txt to dt-schema
Message-ID: <168054670780.1333984.6325350392024796667.robh@kernel.org>
References: <20221117-b4-amlogic-bindings-convert-v5-1-63781bed4452@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221117-b4-amlogic-bindings-convert-v5-1-63781bed4452@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_113255_563475_38307CE1 
X-CRM114-Status: GOOD (  15.40  )
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


On Mon, 03 Apr 2023 09:24:06 +0200, Neil Armstrong wrote:
> Convert the Amlogic Meson6 SoCs Timer Controller bindings to dt-schema.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
> Batch conversion of the following bindings:
> - amlogic-efuse.txt
> - amlogic-meson-mx-efuse.txt
> - meson-wdt.txt
> - meson-ir.txt
> - rtc-meson.txt
> - amlogic,meson6-timer.txt
> - amlogic,meson-pcie.txt
> 
> Martin Blumenstingl was also added as bindings maintainer for Meson6/8/8b
> related bindings.
> 
> Remaining conversions:
> - meson,pinctrl.txt
> - pwm-meson.txt
> - amlogic,meson-gpio-intc.txt
> - amlogic,meson-mx-sdio.txt
> - rtc-meson-vrtc.txt
> - amlogic,axg-sound-card.txt
> - amlogic,axg-fifo.txt
> - amlogic,axg-pdm.txt
> - amlogic,axg-spdifout.txt
> - amlogic,axg-tdm-formatters.txt
> - amlogic,axg-spdifin.txt
> - amlogic,axg-tdm-iface.txt
> - amlogic,g12a-tohdmitx.txt
> - amlogic,axg-audio-clkc.txt
> - amlogic,gxbb-clkc.txt
> - amlogic,gxbb-aoclkc.txt
> - amlogic,meson8b-clkc.txt
> ---
> Changes in v5:
> - Removed applied patches
> - Link to v4: https://lore.kernel.org/r/20221117-b4-amlogic-bindings-convert-v4-0-34e623dbf789@linaro.org
> 
> Changes in v4:
> - Rebased on v6.3-rc1
> - Added Reviewed-by
> - Removed applied patch
> - Link to v3: https://lore.kernel.org/r/20221117-b4-amlogic-bindings-convert-v3-0-e28dd31e3bed@linaro.org
> 
> Changes in v3:
> - Dropped applied patches
> - Added acked/reviewed-by tags
> - patch 3: removed invalid secure-monitor property
> - patch 4: added a note on the commit message about the meson8 compatible
> - patch 9: fixed mmc compatible bindings
> - patch 1-: unified PCIe instead on PCIE + PCIe
> - Link to v2: https://lore.kernel.org/r/20221117-b4-amlogic-bindings-convert-v2-0-36ad050bb625@linaro.org
> 
> Changes in v2:
> - rebased on v6.2-rc1
> - patch 1: fixed power-controller, added const: amlogic,meson-gx-sm
> - patch 2: added const: amlogic,meson-gx-efuse, fixed secure-monitor type
> - patch 3: updated example subnodes to match reality
> - patch 4: added reviewed-by, added interrupts, added const: amlogic,meson8m2-wdt
> - patch 5: added reviewed-by, added const: amlogic,meson-gx-ir
> - patch 6: dropped applied
> - patch 7: dropped patch, replaced with deprecated in the title of the TXt bindings
> - patch 8: fixed title, added reviewed-by, added interrupt description
> - patch 9: fixed example indent, added reviewed-by
> - patch 10: fixed const: amlogic,meson-gx-mmc case, fixed indentation
> - patch 11: added reviewed-by, fixed title, fixed bindings after rebase, added clocks/clock-names as required
> - patch 12: added reviewed-by
> - Link to v1: https://lore.kernel.org/r/20221117-b4-amlogic-bindings-convert-v1-0-3f025599b968@linaro.org
> ---
>  .../bindings/timer/amlogic,meson6-timer.txt        | 22 ---------
>  .../bindings/timer/amlogic,meson6-timer.yaml       | 54 ++++++++++++++++++++++
>  2 files changed, 54 insertions(+), 22 deletions(-)
> 

Applied, thanks!


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
