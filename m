Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F47CC02183
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Jan 2025 17:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pWdxaV+n/T3hNya5bXjhtXRvnwLioixnFA8iytMpOeo=; b=MZu7uN77BoWxyc
	hNEuTS0zW+ZZlU5Gu/hYfmrOAFe9vnQjZFpq9kNwwR5vAuwOm/QgSgu3TILLAs4AHdyXnne6SeqrL
	wr0P/0xuyttTfjlHG4ExNqRHowN9pENltc2GAeUiSqW4WQb9wq6ou7nupw6Llr4i0jkqp4QRDSmd9
	JiAlbie+wuqMtRd+jAkFXVE1acWRRBxXPOtd7NzabBjX6PhetotK1wLammCP21OWw/hV1kO7L/R/S
	kNL8l41twT4riMM7x0gYizr8LaFIm8YigadFAn1hClNy/IWbxB6nIJU4FvQo7XIftrXovpaNoJiOz
	PWlwmqae4QUQ8gENjqsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXOaH-000000066I9-3TXn;
	Mon, 13 Jan 2025 17:50:41 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXOaE-000000066HI-0yrK
	for linux-amlogic@lists.infradead.org;
	Mon, 13 Jan 2025 17:50:40 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-385f07cd1a4so3792222f8f.1
        for <linux-amlogic@lists.infradead.org>; Mon, 13 Jan 2025 09:50:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736790636; x=1737395436; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+V4+ss7VmfFv1ZzmIjUW4cCV/+dSLMs2iLGWhoJnQnc=;
        b=BG7FK4YW2mOLK2PdopyWpQKLlJVPQky+hdkk8aRnmlSX2ugGJMyJfTpOSLQm3oikmr
         tQfKepeJXOWIUWawKiNOIQLRPgD8i8N4mDx7tBaHBSsbKDZY+pqQu28FoPMsXZAi0lMT
         kspyi/R+OgIFgJYpfePrmqYW+WDmblbEcXjkZnhW1X6be14Npi0BpXALT2s/GGQ3TTtb
         GyBy8ofi86jg8mQl7S1QQlZzqvZ4KGXR2/wjS4qgixG89zMABQliv9tp/Z5Uh/i2obXE
         OSxgrd0pTnzC60NtJoIuCErWRzv1cJqqq2iKooobq+orEuAqoOaiIoFp8V0eF1qwyvOI
         3tfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736790636; x=1737395436;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+V4+ss7VmfFv1ZzmIjUW4cCV/+dSLMs2iLGWhoJnQnc=;
        b=vNBuXozdpUVrhbr1zdSjEzy5pzET58Awbngpdls1hMkb4Igm0u8Aghe3p+eogYjoDH
         2TaC/1OmTBAKd/mlIEYOQKjYUZLomWS/4BEsi6fquiM5LOzEQCUtJb372qJvhcPZGZS8
         nAnWta+RZU9VK3uwMaFdZxKS3lLg2HEMxNhVH3emMe8TFWwIWrtst98TSZZ7dcA6eQTm
         86V4M8vREG5xZ2cNJxnAC6Uj86WdRcVyDIYfoIGWoiyP6Nn73n6ubjgZ4U5NoMXyY/z1
         KAHk9KuTt+rQUn0vImMZwcH7mhgvGS5RTM5hTzANAlJpdO2uEq3vgUufobE7znVAvA6A
         +FZw==
X-Forwarded-Encrypted: i=1; AJvYcCURGBMsfazTdU48bxw6V8JKB7wIhk4FYF0SoAuysYLXtaCP2h8q2FdnnDVOjTAEVSm3PXLh20/O1FCxvWPb@lists.infradead.org
X-Gm-Message-State: AOJu0YweyPXfJQJmD1+kyC+D8YlC1038ZOh+nA/MBKjPxAZpsQY9l1I7
	nDlcVmkf290B/v5zanI2DFgLhpHx/e0w0WU+lPpdC1SxJgiKTVnog4mhaV5WFVbOk7h7LPG4YaL
	d
X-Gm-Gg: ASbGncvCo2WSmA15fZTdak0QHdVkOGRMZPUJgbfEgNnG8jF7Iq9vDQ/9iV4CoH3H2u9
	So3YoLsuev0Bcbmd8E2yhgfbk3qgwtgtvW0fIsq4qVSnyE2dXoGH8RO8FC/28ClFxQLEhgXRSUW
	yFFvofmKEX/DqXPeFpYutRUJXiYNS6MgerbBABr08Ej1UlGKjJCGSumXQIWS07meQNEt6OIPdNR
	hmDYAbK0p/ScZEuMmSYnyGiYP9jeIHGcHtEtYC6Y5I+mApEom+wfL6g
X-Google-Smtp-Source: AGHT+IHoW/dJXXFDIaypQq5flb4uL8n3vMd3OOwNi9RrzsjX+joUmbyw1Xx/wzp9vW06KectOo11Ig==
X-Received: by 2002:a05:6000:4020:b0:385:e3c1:50d5 with SMTP id ffacd0b85a97d-38a87338fa8mr22388141f8f.48.1736790636460;
        Mon, 13 Jan 2025 09:50:36 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:9d2d:28cc:aafd:8429])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e383df8sm12973781f8f.38.2025.01.13.09.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 09:50:35 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Rob Herring <robh@kernel.org>
Cc: Jian Hu <jian.hu@amlogic.com>,  Xianwei Zhao <xianwei.zhao@amlogic.com>,
  Chuan Liu <chuan.liu@amlogic.com>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Kevin Hilman <khilman@baylibre.com>,
  Stephen Boyd <sboyd@kernel.org>,  Michael Turquette
 <mturquette@baylibre.com>,  Dmitry Rokosov <ddrokosov@sberdevices.ru>,
  devicetree <devicetree@vger.kernel.org>,  linux-clk
 <linux-clk@vger.kernel.org>,  linux-amlogic
 <linux-amlogic@lists.infradead.org>,  linux-kernel
 <linux-kernel@vger.kernel.org>,  linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 1/5] dt-bindings: clock: add Amlogic T7 PLL clock
 controller
In-Reply-To: <20250110155404.GA2928945-robh@kernel.org> (Rob Herring's message
	of "Fri, 10 Jan 2025 09:54:04 -0600")
References: <20250108094025.2664201-1-jian.hu@amlogic.com>
	<20250108094025.2664201-2-jian.hu@amlogic.com>
	<20250110155404.GA2928945-robh@kernel.org>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 13 Jan 2025 18:50:35 +0100
Message-ID: <1j4j228uxg.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_095038_308837_CE275B51 
X-CRM114-Status: GOOD (  20.57  )
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

On Fri 10 Jan 2025 at 09:54, Rob Herring <robh@kernel.org> wrote:

> On Wed, Jan 08, 2025 at 05:40:21PM +0800, Jian Hu wrote:
>> Add DT bindings for the PLL clock controller of the Amlogic T7 SoC family.
>> 
>> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
>> ---
>>  .../bindings/clock/amlogic,t7-pll-clkc.yaml   | 103 ++++++++++++++++++
>>  .../dt-bindings/clock/amlogic,t7-pll-clkc.h   |  57 ++++++++++
>>  2 files changed, 160 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/clock/amlogic,t7-pll-clkc.yaml
>>  create mode 100644 include/dt-bindings/clock/amlogic,t7-pll-clkc.h
>> 
>> diff --git
>> a/Documentation/devicetree/bindings/clock/amlogic,t7-pll-clkc.yaml
>> b/Documentation/devicetree/bindings/clock/amlogic,t7-pll-clkc.yaml
>> new file mode 100644
>> index 000000000000..fd0323678d37
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/amlogic,t7-pll-clkc.yaml
>> @@ -0,0 +1,103 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +# Copyright (C) 2024 Amlogic, Inc. All rights reserved
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/clock/amlogic,t7-pll-clkc.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Amlogic T7 PLL Clock Control Controller
>> +
>> +maintainers:
>> +  - Neil Armstrong <neil.armstrong@linaro.org>
>> +  - Jerome Brunet <jbrunet@baylibre.com>
>> +  - Jian Hu <jian.hu@amlogic.com>
>> +  - Xianwei Zhao <xianwei.zhao@amlogic.com>
>> +
>> +if:
>
> Move this after 'required' section.
>
> Generally we put 'if' under 'allOf' because we're likely to have another 
> if/then schema on the next compatible added. If you don't think this 
> binding will ever get used on another chip, then it is fine as-is.
>
>> +  properties:
>> +    compatible:
>> +      contains:
>> +        const: amlogic,t7-pll-mclk
>> +
>> +then:
>> +  properties:
>> +    clocks:
>> +      items:
>> +        - description: mclk pll input oscillator gate
>> +        - description: 24M oscillator input clock source for mclk_sel_0
>> +        - description: fix 50Mhz input clock source for mclk_sel_0

The rate is whatever the clock will actually be. Better not to mention
it in this doc.

>> +
>> +    clock-names:
>> +      items:

one being "input" and other suffixed "_in" looks really odd

>> +        - const: input
>> +        - const: mclk_in0
>> +        - const: mclk_in1

or just in0, in1, in2 if you are going with Rob's suggestion.
Having "mclk_" in the top level would be confusing.

>
> Move these to top-level and then both of these are just 'minItems: 3'.
>
>> +
>> +else:
>> +  properties:
>> +    clocks:
>> +      items:
>> +        - description: pll input oscillator gate
>> +
>> +    clock-names:
>> +      items:
>> +        - const: input
>
> And 'maxItems: 1' here.
>
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - amlogic,t7-pll-gp0
>> +      - amlogic,t7-pll-gp1
>> +      - amlogic,t7-pll-hifi
>> +      - amlogic,t7-pll-pcie
>> +      - amlogic,t7-mpll
>> +      - amlogic,t7-pll-hdmi
>> +      - amlogic,t7-pll-mclk
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  '#clock-cells':
>> +    const: 1
>> +
>> +  clocks:
>> +    minItems: 1
>> +    maxItems: 3
>> +
>> +  clock-names:
>> +    minItems: 1
>> +    maxItems: 3
>
> These are the 'top-level' definitions if that's not clear.
>
>> +
>> +required:
>> +  - compatible
>> +  - '#clock-cells'
>> +  - reg
>> +  - clocks
>> +  - clock-names
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    apb {
>> +        #address-cells = <2>;
>> +        #size-cells = <2>;
>> +
>> +        clock-controller@8080 {
>> +            compatible = "amlogic,t7-pll-gp0";
>> +            reg = <0 0x8080 0 0x20>;
>> +            clocks = <&scmi_clk 2>;
>> +            clock-names = "input";
>> +            #clock-cells = <1>;
>> +        };
>> +
>> +        clock-controller@8300 {
>> +            compatible = "amlogic,t7-pll-mclk";
>> +            reg = <0 0x8300 0 0x18>;
>> +            clocks = <&scmi_clk 2>,
>> +                     <&xtal>,
>> +                     <&scmi_clk 31>;
>> +            clock-names = "input", "mclk_in0", "mclk_in1";
>> +            #clock-cells = <1>;
>> +        };
>> +    };
>> diff --git a/include/dt-bindings/clock/amlogic,t7-pll-clkc.h b/include/dt-bindings/clock/amlogic,t7-pll-clkc.h
>> new file mode 100644
>> index 000000000000..e88c342028db
>> --- /dev/null
>> +++ b/include/dt-bindings/clock/amlogic,t7-pll-clkc.h
>> @@ -0,0 +1,57 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
>> +/*
>> + * Copyright (c) 2024 Amlogic, Inc. All rights reserved.
>> + * Author: Jian Hu <jian.hu@amlogic.com>
>> + */
>> +
>> +#ifndef __T7_PLL_CLKC_H
>> +#define __T7_PLL_CLKC_H
>> +
>> +/* GP0 */
>> +#define CLKID_GP0_PLL_DCO	0
>> +#define CLKID_GP0_PLL		1
>> +
>> +/* GP1 */
>> +#define CLKID_GP1_PLL_DCO	0
>> +#define CLKID_GP1_PLL		1
>> +
>> +/* HIFI */
>> +#define CLKID_HIFI_PLL_DCO	0
>> +#define CLKID_HIFI_PLL		1
>> +
>> +/* PCIE */
>> +#define CLKID_PCIE_PLL_DCO	0
>> +#define CLKID_PCIE_PLL_DCO_DIV2	1
>> +#define CLKID_PCIE_PLL_OD	2
>> +#define CLKID_PCIE_PLL		3
>> +
>> +/* MPLL */
>> +#define CLKID_MPLL_PREDIV	0
>> +#define CLKID_MPLL0_DIV		1
>> +#define CLKID_MPLL0		2
>> +#define CLKID_MPLL1_DIV		3
>> +#define CLKID_MPLL1		4
>> +#define CLKID_MPLL2_DIV		5
>> +#define CLKID_MPLL2		6
>> +#define CLKID_MPLL3_DIV		7
>> +#define CLKID_MPLL3		8
>> +
>> +/* HDMI */
>> +#define CLKID_HDMI_PLL_DCO	0
>> +#define CLKID_HDMI_PLL_OD	1
>> +#define CLKID_HDMI_PLL		2
>> +
>> +/* MCLK */
>> +#define CLKID_MCLK_PLL_DCO	0
>> +#define CLKID_MCLK_PRE		1
>> +#define CLKID_MCLK_PLL		2
>> +#define CLKID_MCLK_0_SEL	3
>> +#define CLKID_MCLK_0_DIV2	4
>> +#define CLKID_MCLK_0_PRE	5
>> +#define CLKID_MCLK_0		6
>> +#define CLKID_MCLK_1_SEL	7
>> +#define CLKID_MCLK_1_DIV2	8
>> +#define CLKID_MCLK_1_PRE	9
>> +#define CLKID_MCLK_1		10
>> +
>> +#endif /* __T7_PLL_CLKC_H */
>> -- 
>> 2.47.1
>> 

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
