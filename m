Return-Path: <SRS0=GMFV=ZK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61336C432C3
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Nov 2019 19:21:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3CC4222318
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Nov 2019 19:21:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rIxghF/l";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pup8uN0/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3CC4222318
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QpsG6GcC5UJMAZLQ53lH9klF7YHpMctStzuE9YI1oEQ=; b=rIxghF/lat8KCu
	aagUGydkleza6wITRdrZaFekedNrC8WJAO4WbuOZOXcK0v8BTZXdRoCRcfKLy4qj+w1krGswesylv
	5cEYqRARxtetL9pnnjFQkBNbR3rPTyB92cMN7gJSXHFPd942sSXeI5H7lQi+SVy3jPFLv/11NroUK
	KzHWPUGVJ+XjWYsIISyhFj1OC8C1xiSVgADtL/94GrXcfVmPDfFz/IDj7GCc29K/r/OIfh2uURJV4
	NBCH/Ia5jqba1nKxtPQdpBp4aCErdm+RCr8yFlnDjDyL25ow51gcMNp4lys2GJpSK+SoGEBHWoeRR
	KuoUnvzGo8NQMFtcId5w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iWmaV-0003zi-CE; Mon, 18 Nov 2019 19:21:27 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iWmaS-0003yQ-9Y
 for linux-amlogic@lists.infradead.org; Mon, 18 Nov 2019 19:21:25 +0000
Received: by mail-wr1-x441.google.com with SMTP id s5so20920773wrw.2
 for <linux-amlogic@lists.infradead.org>; Mon, 18 Nov 2019 11:21:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=o/90Ms6BI5x9icISft1MSO0ezPRhWphSB1+2IQPK3/A=;
 b=Pup8uN0/k8+sJUenGIEmJb/vEQ3KpMQoaagCA1h+1CSl+xPG8rs24thJ6EpgMC7BAW
 ulCN1GQnBgH9fEe9Yfiy1uati6fN/ZRCfW0q1G66kB7hbcKp6bQSu2AmJOIqWBiGXUXu
 yMUqq9rjpcwVKY+ywaWyVa1ywGD3EpjkUEmiQ8l4GJwnPvmeLbrsdQy7sd6fiA0RU+Pg
 ZyTsm0KWlvWzRFsn3LnjVWKcNYpZAjQXNwAzFfLFM7kutKBHE/E5AdZYH1A/tVWL4IhR
 5LbFnKWxyPnW5YS3vDlYaZWJVbMdboRCqJHORiZUPXkjAY8ajPwdaArNmTY3aT62yUFq
 PstQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=o/90Ms6BI5x9icISft1MSO0ezPRhWphSB1+2IQPK3/A=;
 b=GmGOmRqzgrf3vcZqSE8xRs5U/A5VKvr68NAK8XGdB/wbAwGY5wvGgM/UsoI7FZEFaD
 M/X8Mq2QdV7On4hzuT/cNOQQDJCP2qWKK/8xkIDCuGeCm3gPFIRxZI+48/4hP7I2FxJ5
 6DEsg2NYGCaeLuFjEliTX0/a2BL5VzN+vUyCuV6YDfVpXQzGWO8ABhYKdRcZNMe0mPTt
 byy3tCNhi7UwYcj4Tu+1r1vUiaLhGhK7Zt12Lm7e7i9Z/0jROgls/rjo1AV2RxZxdVhJ
 Pnn70eAm9uFlBkgNQUgIu3XzYu9LuMM+VKdtumNIkojtmASxwpq0nxMRkcIiO9cJIWnH
 h50A==
X-Gm-Message-State: APjAAAU2kAOMH4STHYlysXnJjHzO/e4TOxIJhvymguABw4tsVr2n83gs
 VjG17SShJ5ckVY3cLuH8oEc=
X-Google-Smtp-Source: APXvYqxMVnlTHNXmWdSIJuSfFodkvY6O8Jst/ot5IklWYLq25TKrixg1mk0a6CXuogvsGzKxe0S2iw==
X-Received: by 2002:adf:f388:: with SMTP id m8mr3407261wro.18.1574104882900;
 Mon, 18 Nov 2019 11:21:22 -0800 (PST)
Received: from localhost ([37.238.189.2])
 by smtp.gmail.com with ESMTPSA id p15sm384430wmb.10.2019.11.18.11.21.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Nov 2019 11:21:21 -0800 (PST)
Date: Mon, 18 Nov 2019 22:21:19 +0300
From: Mohammad Rasim <mohammad.rasim96@gmail.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [RFC PATCH 3/4] arm64: dts: meson-gxbb: add support for
 Videostrong KII Pro
Message-ID: <20191118192119.dht2cpk7so2wztcf@manjaro.localdomain>
References: <20191117175606.5050-1-mohammad.rasim96@gmail.com>
 <20191117175606.5050-4-mohammad.rasim96@gmail.com>
 <65a64f28-c1fe-0ce2-d954-e96bc1924001@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <65a64f28-c1fe-0ce2-d954-e96bc1924001@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191118_112124_360521_E3F9BE58 
X-CRM114-Status: GOOD (  18.32  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 19/11/18 11:26AM, Neil Armstrong wrote:
> On 17/11/2019 18:56, Mohammad Rasim wrote:
> > This patch adds support for the Videostrong KII Pro tv box which is based on the gxbb-p201 reference design
> > 
> > Signed-off-by: Mohammad Rasim <mohammad.rasim96@gmail.com>
> > ---
> >  arch/arm64/boot/dts/amlogic/Makefile          |  1 +
> >  .../boot/dts/amlogic/meson-gxbb-kii-pro.dts   | 39 +++++++++++++++++++
> >  2 files changed, 40 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts
> > 
> > diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
> > index 84afecba9ec0..a795a170dcab 100644
> > --- a/arch/arm64/boot/dts/amlogic/Makefile
> > +++ b/arch/arm64/boot/dts/amlogic/Makefile
> > @@ -6,6 +6,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-g12a-x96-max.dtb
> >  dtb-$(CONFIG_ARCH_MESON) += meson-g12b-a311d-khadas-vim3.dtb
> >  dtb-$(CONFIG_ARCH_MESON) += meson-g12b-s922x-khadas-vim3.dtb
> >  dtb-$(CONFIG_ARCH_MESON) += meson-g12b-odroid-n2.dtb
> > +dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-kii-pro.dtb
> >  dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-nanopi-k2.dtb
> >  dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-nexbox-a95x.dtb
> >  dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-odroidc2.dtb
> > diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts
> > new file mode 100644
> > index 000000000000..b63dabb7bf97
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts
> > @@ -0,0 +1,39 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +/*
> > +/* Copyright (c) 2019 Mohammad Rasim <mohammad.rasim96@gmail.com>
> > +*/
> > +
> > +/dts-v1/;
> > +
> > +#include "meson-gxbb-p20x.dtsi"
> > +
> > +/ {
> > +	compatible = "videostrong,kii-pro", "amlogic,p201", "amlogic,s905", "amlogic,meson-gxbb";
> > +	model = "Videostrong KII Pro";
> > +
> > +
> > +};
> > +
> > +&uart_A {
> > +	status = "okay";
> > +	pinctrl-0 = <&uart_a_pins>, <&uart_a_cts_rts_pins>;
> > +	pinctrl-names = "default";
> > +	uart-has-rtscts;
> > +
> > +	bluetooth {
> > +		compatible = "brcm,bcm4335a0";
> 
> Use "brcm,bcm43438-bt" here if the I/F is compatible.
> 
> > +	};
> > +};
> > +
> > +&ethmac {
> > +	status = "okay";
> > +	pinctrl-0 = <&eth_rmii_pins>;
> > +	pinctrl-names = "default";
> > +	phy-mode = "rmii";
> > +
> > +	snps,reset-gpio = <&gpio GPIOZ_14 0>;
> > +	snps,reset-delays-us = <0>, <10000>, <1000000>;
> > +	snps,reset-active-low> +};
> > +
> > +
> > 
> 
> Did you try to determine the PHY and add a PHY node aswell ? The reset stuff could go in the PHY node.
looking at the PCB I can see the phy is "IP101GR" so I thought I can use
the phy node of nextbox-a95x [0] but I get these errors:

```
[   15.867041] meson8b-dwmac c9410000.ethernet eth0: no phy at addr -1
[   15.867079] meson8b-dwmac c9410000.ethernet eth0: stmmac_open: Cannot attach to PHY (error: -19)
```

[0] https://github.com/torvalds/linux/blob/f9717178b9be9477877d4c3776c61ff56d854ddf/arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts#L165-L177
> 
> Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
