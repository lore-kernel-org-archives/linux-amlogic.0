Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC1A3C6FD1D
	for <linux-amlogic@archiver.kernel.org>; Fri, 17 Mar 2023 18:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d+DAp+u531TslgovTme+zsYkdrCDgGa/ky9XOEuRlMI=; b=axFXpZePOkTFzi
	C85cOFJFrA/MBd67HDnmhPHyoM6Tqu0VNQ9MyIJjFuvjHVCpJc1rnS9m7yZifaAxGtmDDxQGa4tGd
	nTR4pY6lzKA0J3k6eQpRL8Xy+vxqANqzAFKSzvzIePPqi/at2+VeU22xiJyn4RMk+pikzmkz4vGsV
	ACwTT+IlD2PTNAFz15RClA9dRL3t/TVzd5GM0jGPHJit3R05GYXw4gsnF5hCoFsfISeArN1qxHo/P
	HTdrZx8IJlfoPPEIXY618Rq9q6U2Zqy9h5nDd7NU8J201tPsmdAXk1vgVvm587pYDhPSQ7Nj0LArp
	aenaWTBrNszqkt78Uf1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pdFCf-0034Yb-1U;
	Fri, 17 Mar 2023 18:53:25 +0000
Received: from mail-il1-f174.google.com ([209.85.166.174])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pdFCc-0034Xl-0z;
	Fri, 17 Mar 2023 18:53:23 +0000
Received: by mail-il1-f174.google.com with SMTP id l9so3243576iln.1;
        Fri, 17 Mar 2023 11:53:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679079200;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LhejdJ2QzRiuDi7NcPcw8B7d/cMeKEhfekni41Gxpkk=;
        b=ueDOSud/MuOqSbsi30Ml8tUja1EwqHTlqg266A8gnD6zKpKfPiEfj6l9qdobWvgYpR
         GNjR/O2hJ7HpCJ7DcTd1KBkjBAFscSrUI9SN8XQ75jZi85BdTJhdhwrmFPRoEnysH3Id
         DbZQH42P9k8WKw+7KtqH00Gnd5SvE99HThlmeqH+c/QUXeOlpx/yTSFMWEUJuLt2yEMm
         z21J/Uzh6EGwUrXZz877tkbDVb6umM5+y2Uqe5gYIno6wae88wzZiUkIsWRUTe5eORdg
         MCJfV+VVCpIieOKyvw0EUwEYfwqCHub+IX5niJdNRfrssLUk7oz9LPunEMBWRFU/XK9q
         7VdQ==
X-Gm-Message-State: AO0yUKU6oNU3srcARu5vfxd5l8tDBM3HuWkR6BRn0p2wHs7SXQrVHYZz
	kjOnvdbQc9aqbaekoeh/9A==
X-Google-Smtp-Source: AK7set+MH4oe7paXw4mNYBNwZmQ3XrzicpMki++gWyEP2w53ywhZy/ZcN6LTqzsa+uss+FVSLWKCcQ==
X-Received: by 2002:a92:dc01:0:b0:317:99d0:8ad6 with SMTP id t1-20020a92dc01000000b0031799d08ad6mr246243iln.16.1679079199880;
        Fri, 17 Mar 2023 11:53:19 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.249])
        by smtp.gmail.com with ESMTPSA id n24-20020a02a918000000b004050d92f6d4sm905689jam.50.2023.03.17.11.53.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 11:53:19 -0700 (PDT)
Received: (nullmailer pid 2616891 invoked by uid 1000);
	Fri, 17 Mar 2023 18:53:17 -0000
Date: Fri, 17 Mar 2023 13:53:17 -0500
From: Rob Herring <robh@kernel.org>
To: Dmitry Rokosov <ddrokosov@sberdevices.ru>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, neil.armstrong@linaro.org, jbrunet@baylibre.com, mturquette@baylibre.com, sboyd@kernel.org, krzysztof.kozlowski+dt@linaro.org, khilman@baylibre.com, martin.blumenstingl@googlemail.com, jian.hu@amlogic.com, kernel@sberdevices.ru, rockosov@gmail.com, linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v10 3/5] dt-bindings: clock: meson: add A1 PLL and
 Peripherals clkcs bindings
Message-ID: <20230317185317.GA2608140-robh@kernel.org>
References: <20230313201259.19998-1-ddrokosov@sberdevices.ru>
 <20230313201259.19998-4-ddrokosov@sberdevices.ru>
 <ffebef1d-8447-181b-1890-3e638d399c62@linaro.org>
 <20230314114825.yiv4vcszr6b7m45w@CAB-WSD-L081021>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230314114825.yiv4vcszr6b7m45w@CAB-WSD-L081021>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_115322_342768_D65BFEF6 
X-CRM114-Status: GOOD (  20.48  )
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

On Tue, Mar 14, 2023 at 02:48:25PM +0300, Dmitry Rokosov wrote:
> On Tue, Mar 14, 2023 at 12:28:40PM +0100, Krzysztof Kozlowski wrote:
> > On 13/03/2023 21:12, Dmitry Rokosov wrote:
> 
> [...]
> 
> > > +#define CLKID_SPIFC		84
> > > +#define CLKID_USB_BUS		85
> > > +#define CLKID_SD_EMMC		86
> > > +#define CLKID_PSRAM		87
> > > +#define CLKID_DMC		88
> > 
> > And what is here? Between 88 and 121?
> > 
> 
> Explained below.
> 
> > > +#define CLKID_GEN_SEL		121
> > > +
> > > +#endif /* __A1_CLKC_H */
> > > diff --git a/include/dt-bindings/clock/amlogic,a1-pll-clkc.h b/include/dt-bindings/clock/amlogic,a1-pll-clkc.h
> > > new file mode 100644
> > > index 000000000000..8e97d3fb9d30
> > > --- /dev/null
> > > +++ b/include/dt-bindings/clock/amlogic,a1-pll-clkc.h
> > > @@ -0,0 +1,20 @@
> > > +/* SPDX-License-Identifier: GPL-2.0+ */
> > 
> > I found in changelog:
> > "fix license issue, it's GPL-2.0+ only in the current version"
> > and I do not understand.
> > 
> > The license is wrong, so what did you fix?
> > 
> 
> Sorry don't get you. Why is it wrong?
> I've changed all new source files to GPL-2.0+ except yaml, because yaml
> dt bindings schemas require the following license:

Why 2.0+? The kernel's default license is 2.0-only. Are you (and 
your lawyer) okay with GPL v4?

But this is still part of the DT binding and has the same license 
preference:
 
>     # SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause

However, the header licenses are complicated due to .dts licenses which 
are all over the place. The requirement is dual licensed and matching 
what includes it.

Rob

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
