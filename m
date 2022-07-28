Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19AA9C04A68
	for <linux-amlogic@archiver.kernel.org>; Thu, 28 Jul 2022 08:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7l1+f8YNFxnZzIc7BZyNIJoZQblU3/a/tWoT6nW89X0=; b=ANsOa7zBaziaOw
	v2dzYK19MocEthSMrI9j0ubMwLQzQHV4I5Zstnmkd3NhnW4NtLx94DVOmBXIk4JBZoFk6oOLVYUOZ
	WPWHo7gP/1FBibTG/hPe0jImkEjG0GMmWnf+ibqAgpw3mue3tLZ/XyqrL3rD6oem9wSbUS6o54DHH
	IqbAQcKHEVn22gdUaj2+oTkr8h0vT/6IaDMFs0u9SghfNDjG9cJQUUGTts8F5fVQQ+oZeW72rippq
	fF5NJ9jpwxRANiB5dSgBFVd4lsZelSF3PE/3ogLqOjjJctH6/kkJODR5A0gAUAAJVJ0N5wanNqqfu
	+ixBXVdHH+tL5Hgx9+0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGz5B-005sqZ-3U; Thu, 28 Jul 2022 08:41:25 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGz4v-005sgx-Lx
	for linux-amlogic@lists.infradead.org; Thu, 28 Jul 2022 08:41:11 +0000
Received: by mail-lj1-x22b.google.com with SMTP id q7so1187367ljp.13
        for <linux-amlogic@lists.infradead.org>; Thu, 28 Jul 2022 01:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=qNuYEjp7WeXIJ9ePRdLMLsHm6eHVbqcc9mreMlXusBM=;
        b=T6rixmhUatWGToZ2WePBF7ExJxbbNLXwrPSTZsIotzvYO5UME86v74npwnrBqHJPms
         fOQczzq5bJ4diI6T0lTWdkv8wfVEJerbNqKV/tO18z/j50ofdkcaeWzdwHj+ncxFJSQT
         AUby0P0gqCd6YU0W8j3j5Vd4eJ/a+hYdxtUqTAXS3bdL4EKu024EsMfCL7jGTD+Am1gJ
         td47eKhbYeglYbBBbNVwOLje5bVN6OCWtimYrifFPvKZgHZPXTS7jgAzkzfBItrupe6t
         57FGTYN1Z6g0diW+wmfqdn/cXW/eiOGxpI3ZxCKbhFRbMVIvhujaaXus1U8uCDzN0qy8
         tGwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=qNuYEjp7WeXIJ9ePRdLMLsHm6eHVbqcc9mreMlXusBM=;
        b=20i3TbngUxenzV2PSyeH2vYKEL2mfa8wJllvSWGrX5C/OiOT6Q1rERAC06TbzkCd7N
         h9W96iX7eMqBcJV0ISkoCZ13ug04G/F6TBep/o+vMc6mMg3FNm6HAYuLZH4V6Ml57vV/
         3JxQmzIvYSm34on0kU+Zs07GWdkDCTXvf6RNL9bRX7+6E+1jNZRoOM89WwxfW0+H80J1
         a97wiRAg4KSILk57QuThdm9bMlrFbUF3jN6NWLPTRgS2kCWsU2dQFJhikzTiIt1/5/jd
         j3fPItbNWpe1cqJE/nBCwpkzR0V3OkeYa3gGtfQAfP6fIMoBxikMt0neOxdzmBm01rTv
         smlA==
X-Gm-Message-State: AJIora8ZaCdGxNJPRSQzyxQczytp70GPYWeTPgoHY6pqmhk3F1+98ewL
	up3szrwF11GuPWXulRUfkSh4qg==
X-Google-Smtp-Source: AGRyM1sDoEXB5/FNKjHlS/zvqoBlUUeT2luECMbU/cwhNDKKkdOvFAaAuNscnU+XY5m7mUFR1n8DRg==
X-Received: by 2002:a2e:a58d:0:b0:25e:d96:3281 with SMTP id m13-20020a2ea58d000000b0025e0d963281mr5597695ljp.379.1658997665641;
        Thu, 28 Jul 2022 01:41:05 -0700 (PDT)
Received: from [192.168.3.197] (78-26-46-173.network.trollfjord.no. [78.26.46.173])
        by smtp.gmail.com with ESMTPSA id t20-20020a2e8e74000000b0025a724f2935sm10541ljk.137.2022.07.28.01.41.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Jul 2022 01:41:05 -0700 (PDT)
Message-ID: <82e3fd36-df96-a555-4cea-47fabd26502b@linaro.org>
Date: Thu, 28 Jul 2022 10:41:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH V2 1/3] dt-bindings: clk: meson: add S4 SoC clock
 controller bindings
Content-Language: en-US
To: Yu Tu <yu.tu@amlogic.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20220728054202.6981-1-yu.tu@amlogic.com>
 <20220728054202.6981-2-yu.tu@amlogic.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220728054202.6981-2-yu.tu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220728_014109_738572_F46C5BEB 
X-CRM114-Status: GOOD (  13.41  )
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

On 28/07/2022 07:42, Yu Tu wrote:
> Add new clock controller compatible and dt-bindings header for the
> Everything-Else domain of the S4 SoC.
> 
> Signed-off-by: Yu Tu <yu.tu@amlogic.com>



> diff --git a/MAINTAINERS b/MAINTAINERS
> index c1abc53f9e91..f872d0c0c253 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1775,6 +1775,7 @@ F:	Documentation/devicetree/bindings/clock/amlogic*
>  F:	drivers/clk/meson/
>  F:	include/dt-bindings/clock/gxbb*
>  F:	include/dt-bindings/clock/meson*
> +F:	include/dt-bindings/clock/s4-clkc.h
>  
>  ARM/Amlogic Meson SoC Crypto Drivers
>  M:	Corentin Labbe <clabbe@baylibre.com>
> diff --git a/include/dt-bindings/clock/s4-clkc.h b/include/dt-bindings/clock/s4-clkc.h
> new file mode 100644
> index 000000000000..b686c8877419
> --- /dev/null
> +++ b/include/dt-bindings/clock/s4-clkc.h

Filename with vendor prefix, so:
amlogic,s4-clkc.h

> @@ -0,0 +1,146 @@
> +/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
> +/*
> + * Copyright (c) 2021 Amlogic, Inc. All rights reserved.
> + * Author: Yu Tu <yu.tu@amlogic.com>
> + */
> +
> +#ifndef _DT_BINDINGS_CLOCK_S4_CLKC_H
> +#define _DT_BINDINGS_CLOCK_S4_CLKC_H
> +
> +/*
> + * CLKID index values
> + */
> +
> +#define CLKID_FIXED_PLL			1
> +#define CLKID_FCLK_DIV2			3
> +#define CLKID_FCLK_DIV3			5
> +#define CLKID_FCLK_DIV4			7
> +#define CLKID_FCLK_DIV5			9
> +#define CLKID_FCLK_DIV7			11

Why these aren't continuous? IDs are expected to be incremented by 1.

> +
> +#endif /* _DT_BINDINGS_CLOCK_S4_CLKC_H */


Best regards,
Krzysztof

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
