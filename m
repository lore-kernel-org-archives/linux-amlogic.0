Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 226D6C761A6
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Mar 2023 15:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PDPQQRuVd7OWWpz0fn7weW1pOatGLtJ8x8nzPAJmYUU=; b=ylPIfKWW4/bvoU
	H+64WOL1AbwdPtoAY+5/ffHa9+XcAIluvCxCPNV30kg3NzzvTfzkPlhgQtJtX4AB080/JbhiOwwsT
	P9f7U5jZCYHAPia07oeZfCHEsNJfKuRD0zgeJX6nHgjB7P4HtN037hRSiXL2uNROz1XjF3MAiErLx
	sVqnWfvjpufrePfN1tAw22HMC3xVOBaCqeQR2Dl5FUDVcgkqcOrvba3COZFwdhxcr4wCWjFY04nm9
	AgqpoYbhM8PrItAZSQqUPg/SZgCugUykTSe/yqSyU94uGuYTmEwY6tCn+PSuDhtYJfz8QZv0YnKkk
	1LqWxfV880sFqZKdgzxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgomA-00BWHO-0P;
	Mon, 27 Mar 2023 15:28:50 +0000
Received: from mail-ot1-f53.google.com ([209.85.210.53])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgom7-00BWFg-1U;
	Mon, 27 Mar 2023 15:28:48 +0000
Received: by mail-ot1-f53.google.com with SMTP id a30-20020a9d3e1e000000b006a13f728172so1566015otd.3;
        Mon, 27 Mar 2023 08:28:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679930924;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LEE//CVec7N01zWXhmb3QcGzLCREQLQp/FRs8Lve+i8=;
        b=YLIoj8Vm9c2t4QwvPvOU4fbyumezLdwzNxc8sGpP2/miJdDuFl6uT2tBBTFYDJzcj7
         NY/WsZU5S1+rBwUOwpru1uvXUkuzAf4fwbm+Iv8gF9jmCb1igD8ZyBSpOnCCqxs9BK76
         xzQ3/u6X52415CezjACNSzooBRg7cR/bHKjxy6Q5viHHOfLiXbw3MEWKwCiv4dNi7hf6
         B++BFZLw+gu0qPu6YbE0L1JlaF2LkYZbvw8vvnhmW/HYTooOk9btREPmL34NVk7XEOU1
         pdSPNPYGtIZE+1htz0nr5tMGLAsqNAoOKsoAOtMtBukTW7evUbRyyiOml9WUI7g/iq/3
         KABQ==
X-Gm-Message-State: AAQBX9cWfpFVFhFztJ6KeW9mks9jHRJ5TYIpXDDxreaUPa3do5qF58y5
	Y+qgiQrgv/lJLCl6MnSJUA==
X-Google-Smtp-Source: AKy350bmPVQig+xpjcFDj6G5EpbUIjt419xav/Kwr6elxAu9ry41ovS9zixIUChIOJIaJ1v3e4y4UQ==
X-Received: by 2002:a05:6830:3892:b0:6a1:2a17:16f2 with SMTP id bq18-20020a056830389200b006a12a1716f2mr4375958otb.1.1679930924535;
        Mon, 27 Mar 2023 08:28:44 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id n37-20020a056870972500b00177b33ce85bsm9935770oaq.30.2023.03.27.08.28.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 08:28:44 -0700 (PDT)
Received: (nullmailer pid 3907135 invoked by uid 1000);
	Mon, 27 Mar 2023 15:28:43 -0000
Date: Mon, 27 Mar 2023 10:28:43 -0500
From: Rob Herring <robh@kernel.org>
To: Dmitry Rokosov <ddrokosov@sberdevices.ru>
Cc: robh+dt@kernel.org, linux-kernel@vger.kernel.org, jbrunet@baylibre.com, neil.armstrong@linaro.org, rockosov@gmail.com, sboyd@kernel.org, mturquette@baylibre.com, khilman@baylibre.com, jian.hu@amlogic.com, kernel@sberdevices.ru, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org, martin.blumenstingl@googlemail.com
Subject: Re: [PATCH v11 3/5] dt-bindings: clock: meson: add A1 PLL and
 Peripherals clkcs bindings
Message-ID: <167993090466.3906795.9343915150600336952.robh@kernel.org>
References: <20230321193014.26349-1-ddrokosov@sberdevices.ru>
 <20230321193014.26349-4-ddrokosov@sberdevices.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230321193014.26349-4-ddrokosov@sberdevices.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_082847_495499_8EA7833D 
X-CRM114-Status: GOOD (  10.72  )
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


On Tue, 21 Mar 2023 22:30:12 +0300, Dmitry Rokosov wrote:
> Add the documentation for Amlogic A1 PLL and Amlogic A1 Peripherals
> clock drivers.
> Introduce Amlogic A1 PLL and Amlogic A1 Peripherals device tree
> bindings and include them to MAINTAINERS.
> 
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
> ---
>  .../bindings/clock/amlogic,a1-clkc.yaml       |  73 +++++++++++
>  .../bindings/clock/amlogic,a1-pll-clkc.yaml   |  59 +++++++++
>  MAINTAINERS                                   |   1 +
>  include/dt-bindings/clock/amlogic,a1-clkc.h   | 113 ++++++++++++++++++
>  .../dt-bindings/clock/amlogic,a1-pll-clkc.h   |  21 ++++
>  5 files changed, 267 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/amlogic,a1-clkc.yaml
>  create mode 100644 Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml
>  create mode 100644 include/dt-bindings/clock/amlogic,a1-clkc.h
>  create mode 100644 include/dt-bindings/clock/amlogic,a1-pll-clkc.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
