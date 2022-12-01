Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 832FCC4332F
	for <linux-amlogic@archiver.kernel.org>; Thu,  1 Dec 2022 22:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NYITNScYKf6K3uTC3DbMnOI1czzBNjYUEXn9kanWlW4=; b=em/FOwq2Hgx0/O
	IMejFlR9yT/LtE9pIrWUV9UeejAeWq588tH9+GkIN6cjaA0VazTAFlyTib2pHZgPGgPi208pWq5rh
	ttjiqpqcJAaspNQ46l9ePRJeGEZO5NKErJyYsm6RUfSUTcrp6wlrYE/sVME+DXKWW9Yx3BZvnGR6S
	kx8V/L4vl+45Q1EGTIBjdYSCA2+aydnSd9Fs4mn9KQ+iEqyl8D7dp/FACz6SMoG4PRtKKZ56bos4T
	cC9Xi2XGN8znPT7EXC5MVm8JmcWtE3eVHDOTsmFxPIZA/0FcaL8WzoyqS79NoYYHT+rNMAFtaEK1X
	Zs9B87aoQVdA9odFiK4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0sJw-00BQhs-Dl; Thu, 01 Dec 2022 22:46:20 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0s7Q-00BOlM-TY; Thu, 01 Dec 2022 22:33:26 +0000
Received: by mail-ed1-x534.google.com with SMTP id r26so4216259edc.10;
        Thu, 01 Dec 2022 14:33:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CRPZJVdzuBuGO231NILaK2vg63uIgCdtqFzKn750f10=;
        b=cabCx6OdMcHjFaK3HJJwSe6AE5ug8ecPyG6n8xIdM+KjsA0rXvbU5HeC4UAM1YCfSc
         SPYw+19rgtyZuDPEvAcSWoXidkSvV7lfLMxo4ALLAGdfYxxLJ6SR2JVzl/Z/GzuEJhfj
         AfRxxV7nwd3K6JkM6UJCkonf7MRph2Ut3mxxyg6OjmAYtsQii3zTUWhdk+vIlxMvhPar
         +eZqx9TpfBRjdYYLWhGbD8E9bJyQvcj3IInRiOApK3YBAJ8GAbUWvpgbQ5xUUIOQBuJk
         nJKkEfclYNm1ZpygzcGoC8kjShjVGfMZNITXyF9F9S0exTci4ZE6OAXYq+DNcsYpE6EG
         +Ang==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CRPZJVdzuBuGO231NILaK2vg63uIgCdtqFzKn750f10=;
        b=CDze4U6jz06Bm5jtYDx41dMvrU+rXcVTkPqEHlHjFElKBe5P5KqqKQaSanNvsrKEKm
         06Ez813fFpiDD8KH3rzLpOI3YF5Rr+hurGVuX02/lLrTeSFpiDs6dF78YII6AXPVU4wq
         e3UO9rGdBoRsg/6jHhfDzSKzanoa8PzMcEFbhgkbg4ZYB5HCJ9Q2sfkXmjuxnDZNIBnZ
         YMaEZVUdFPVyc8qkuK7ObZviGwCEgOGo1CA6/evWQ14sasNoC6jSaHNPg6FnAAvjFQRG
         g7uxHvz+UQEwlx+/34jVnLIXBCAuELlLuFR2lKuAzt/oovjSRViuYRXecxhjtFvhz03E
         ZBvA==
X-Gm-Message-State: ANoB5pnL7wdycsz9qPDSLGV7562WWsXnCjW7CfGk1xbPeRwZNnf9Yg2h
	fzbCCDbgj7pLiepEvt2DvnV4L6yLrLwMNIbs8Pg=
X-Google-Smtp-Source: AA0mqf4scydQ0RjuQwOxNTSsKlTD5nD1vQKUJYeD7R3+AYnOhONPpNH+OPn35vnZCX81KwV+f5BeOm57ONHRNVflYgU=
X-Received: by 2002:a05:6402:d6a:b0:467:6dbf:e3e8 with SMTP id
 ec42-20020a0564020d6a00b004676dbfe3e8mr23328055edb.291.1669934002487; Thu, 01
 Dec 2022 14:33:22 -0800 (PST)
MIME-Version: 1.0
References: <20221201103026.53234-1-tomeu.vizoso@collabora.com> <20221201103026.53234-5-tomeu.vizoso@collabora.com>
In-Reply-To: <20221201103026.53234-5-tomeu.vizoso@collabora.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 1 Dec 2022 23:33:11 +0100
Message-ID: <CAFBinCC8kQ-7v+PCZgsqo2kGzsOi5jT6ekmjvb_D2j5tBmHNoA@mail.gmail.com>
Subject: Re: [PATCH v5 4/7] arm64: dts: Add DT node for the VIPNano-QI on the A311D
To: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: italonicola@collabora.com, Neil Armstrong <neil.armstrong@linaro.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"moderated list:ARM/Amlogic Meson SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Amlogic Meson SoC support" <linux-amlogic@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_143324_996004_487EC4CF 
X-CRM114-Status: GOOD (  10.31  )
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

On Thu, Dec 1, 2022 at 11:31 AM Tomeu Vizoso <tomeu.vizoso@collabora.com> wrote:
[...]
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> index 45947c1031c4..61c8461df614 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> @@ -11,6 +11,7 @@
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/reset/amlogic,meson-g12a-reset.h>
>  #include <dt-bindings/thermal/thermal.h>
> +#include <dt-bindings/power/meson-g12a-power.h>
We could now remove the meson-g12a-power include from
arch/arm64/boot/dts/amlogic/meson-g12.dtsi
I'm not sure if we have any "rule" about this though, so I'm curious
to hear what others think.


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
