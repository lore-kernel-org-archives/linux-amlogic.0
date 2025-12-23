Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E52C6E6F077
	for <linux-amlogic@archiver.kernel.org>; Tue, 23 Dec 2025 08:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TfMK2ygrc1oZ4AoXi5e1MO7CAZb4xIQUA8lnAhgHl1Y=; b=EQM8Hw/jHjGx1C
	9QeJjCsKkoyniwuCoQLbxl4arqubgnVg6VRHwDIRXJCEJFtAfdir6grAXCz1Chl9pskpnEyAw/9P8
	qOSVp0iZ+U2gqfmSPSNXwy1OZkMT3j254mkKtlXvFPHAwV4ckkkthj7qU7v/fCtfrTBSFOzN0Se68
	E0eaxuwo8tg1NEE086yfNZSTNkUF3ja+L534lVERLDYzjWhVgCmhK4OOfsRKNQqDYTT8dMUmFzvvh
	vth4ZxbUQQUnZlsbKnqmHmpYvwMAqPRgUEcbcFYxOtrAr6jlAjDHWYFHRPY2ofZ739oAVXC04oUHD
	r2Tuexsw86JITn8ENXNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXyEf-0000000EiB4-00b1;
	Tue, 23 Dec 2025 08:59:17 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXyEb-0000000EiAK-2Qtk
	for linux-amlogic@lists.infradead.org;
	Tue, 23 Dec 2025 08:59:16 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4779cb0a33fso48442935e9.0
        for <linux-amlogic@lists.infradead.org>; Tue, 23 Dec 2025 00:59:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1766480351; x=1767085151; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=H0N0Qh+h5z6q9jM8GDDqCGvbZlEglLrOpZcIVjBvhiM=;
        b=M5cgeDlUotPGbMksaOYGZ8ORrpXS4bhcnkNxqOuiXzq8PORmYYjNjYS1qKerwpOKAp
         Q+SOGV2n+sGlM4x/Pys7OqsTWZ4eNHqjoSFUYOnyWBNvVXjp+aTqeLKzkBZLXo0MGjk4
         gc4D7nHPAOQI1uhfyUJXDsPjEPHNbKAccLEZRv0Cyx6TzB+WtXersiWWa8oxyLEnRvp4
         NpJJidFYZI0K8FRhHGxtP1R3kvxVyiLPKiN0im6abQF1xLYKKMAueL7dLtBS+0O3kgLN
         gs13xFTmDl6a8lwHSuRWmp0BQqFAISO3s3O8Q2TdqZxTJBV+HuPDDsbtbVKM1LUPQhJg
         69sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766480351; x=1767085151;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=H0N0Qh+h5z6q9jM8GDDqCGvbZlEglLrOpZcIVjBvhiM=;
        b=VfGgvhylOcv3hPVicyGvTLWwdR0X+yrkRuygsqwwRNpYco+9+2ZADzJZsboW5FhMzs
         73GqTrXuo8N6k66XA6+eJ/+aLpe3rOkyqsTzAWlg+V8dJTWqOIHs9tMfc7FScNC9OmGy
         yhe5whtPIEzonQFHIfRRFrnVXE9PqgNMkZgPl4IPNSlovak31I2HD/UDIo5KOUwd+lIj
         WU2zq4Rx/Y7OE2VuPY6uAmnE05uv8zrqN7cXDNm7Iojc4/sdFg8aBdWOOff74dRkyCFU
         xUGB4mv5KBzQBjEQnGE6wkw7Mln5OlL/KGMOQsmRNbZfPkACLOzubhI4ddtNx2EeqQz1
         wL+w==
X-Forwarded-Encrypted: i=1; AJvYcCWMVnU7SNONGLeCOQlKmDO65BGAOhBYzmip+RzWEW2fC9Oul3VKPD85/AyK8erA40GTLotebpmTSz8MaGNk@lists.infradead.org
X-Gm-Message-State: AOJu0YzYaKv8re0AjuLWVwjzMKYXRikKkJLnRAc4P9ZUQL8B+tIyBPYN
	4bRMhW1SGPP7Zz4b+0/0w3A8vhL/oGBIdeZnPCj1mukGULmhLG/xYAGxd4Hm50HMNwo=
X-Gm-Gg: AY/fxX6/jiBq4DLy+cK5Vde8tY+//TmG+MbCZLnZxYwTn3YcOfnR8pPMMZEHzQoBBp2
	CHfR90t5iHOs9A9XVsMKHkovpFJ8LR1U+6NNtTfhMKR4Ip/RMuVDYUbkGYtrwowFWx51uD2bN69
	SskUzbG9PnlJl2CPa+XTJjmoBajhJO+sBoUKg41VA9YuQqP4u/DGfOMK5yXifRNiZbyM64SA00O
	55MjcbrK9zEs68N6DtzHd11O58DZi9b0NDPxiFLCmRJ4Ze2SHmc4AmMZ5VwpYNggCk8wYKs/A1y
	uu9SgGhI531tgQq5YIN1sEuM1XJCw5HR1h351Yt+ptPaPplZ/dA6e571eTwzkl1FIENKAOPVjl3
	I3P7R2LK+gCqlrPTRk53OWszVDrswFnGQZwl6bbj3D/hG8Ph3buu26ZgZvrrUjbt5ItQkAE3EnC
	f2VA3OuP45wA==
X-Google-Smtp-Source: AGHT+IGV3tIWup1oKWrQfjC460UZGieaL8gFZ5EVbZ1uUIL00or9Qu0bOv0POApDVytvlHgK7GBnWw==
X-Received: by 2002:a05:600c:3b0e:b0:477:b0b9:3129 with SMTP id 5b1f17b1804b1-47d1955b7d1mr134846215e9.3.1766480350772;
        Tue, 23 Dec 2025 00:59:10 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:a0c2:899c:2c46:1e7a])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-47d193522cdsm221854375e9.4.2025.12.23.00.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 00:59:10 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Cc: Chuan Liu <chuan.liu@amlogic.com>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor
 Dooley <conor+dt@kernel.org>,  Neil Armstrong <neil.armstrong@linaro.org>,
  Xianwei Zhao <xianwei.zhao@amlogic.com>,  Kevin Hilman
 <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  linux-kernel@vger.kernel.org,
  linux-clk@vger.kernel.org,  devicetree@vger.kernel.org,
  linux-amlogic@lists.infradead.org,  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 1/8] dt-bindings: clock: Add Amlogic A5 SCMI clock
 controller support
In-Reply-To: <20251028-a5-clk-v4-1-e62ca0aae243@amlogic.com> (Chuan Liu via's
	message of "Tue, 28 Oct 2025 17:52:27 +0800")
References: <20251028-a5-clk-v4-0-e62ca0aae243@amlogic.com>
	<20251028-a5-clk-v4-1-e62ca0aae243@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Tue, 23 Dec 2025 09:59:05 +0100
Message-ID: <1jv7hx7ew6.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_005913_868747_0685FF02 
X-CRM114-Status: GOOD (  13.43  )
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

On Tue 28 Oct 2025 at 17:52, Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org> wrote:

> From: Chuan Liu <chuan.liu@amlogic.com>
>
> Add the SCMI clock controller dt-bindings for the Amlogic A5 SoC
> family.
>
> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>

Please read:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v6.19-rc1#n503

and adjust your patches accordingly

> ---
>  include/dt-bindings/clock/amlogic,a5-scmi-clkc.h | 44 ++++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
>
> diff --git a/include/dt-bindings/clock/amlogic,a5-scmi-clkc.h b/include/dt-bindings/clock/amlogic,a5-scmi-clkc.h
> new file mode 100644
> index 000000000000..1bf027d0110a
> --- /dev/null
> +++ b/include/dt-bindings/clock/amlogic,a5-scmi-clkc.h
> @@ -0,0 +1,44 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
> +/*
> + * Copyright (c) 2024 Amlogic, Inc. All rights reserved.
> + * Author: Chuan Liu <chuan.liu@amlogic.com>
> + */
> +
> +#ifndef __AMLOGIC_A5_SCMI_CLKC_H
> +#define __AMLOGIC_A5_SCMI_CLKC_H
> +
> +#define CLKID_OSC				0
> +#define CLKID_SYS_CLK				1
> +#define CLKID_AXI_CLK				2
> +#define CLKID_CPU_CLK				3
> +#define CLKID_DSU_CLK				4
> +#define CLKID_GP1_PLL				5
> +#define CLKID_FIXED_PLL_DCO			6
> +#define CLKID_FIXED_PLL				7
> +#define CLKID_ACLKM				8
> +#define CLKID_SYS_PLL_DIV16			9
> +#define CLKID_CPU_CLK_DIV16			10
> +#define CLKID_FCLK_50M_PREDIV			11
> +#define CLKID_FCLK_50M_DIV			12
> +#define CLKID_FCLK_50M				13
> +#define CLKID_FCLK_DIV2_DIV			14
> +#define CLKID_FCLK_DIV2				15
> +#define CLKID_FCLK_DIV2P5_DIV			16
> +#define CLKID_FCLK_DIV2P5			17
> +#define CLKID_FCLK_DIV3_DIV			18
> +#define CLKID_FCLK_DIV3				19
> +#define CLKID_FCLK_DIV4_DIV			20
> +#define CLKID_FCLK_DIV4				21
> +#define CLKID_FCLK_DIV5_DIV			22
> +#define CLKID_FCLK_DIV5				23
> +#define CLKID_FCLK_DIV7_DIV			24
> +#define CLKID_FCLK_DIV7				25
> +#define CLKID_SYS_MMC_PCLK			26
> +#define CLKID_SYS_CPU_CTRL			27
> +#define CLKID_SYS_IRQ_CTRL			28
> +#define CLKID_SYS_GIC				29
> +#define CLKID_SYS_BIG_NIC			30
> +#define CLKID_AXI_SYS_NIC			31
> +#define CLKID_AXI_CPU_DMC			32
> +
> +#endif /* __AMLOGIC_A5_SCMI_CLKC_H */

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
