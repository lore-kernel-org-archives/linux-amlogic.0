Return-Path: <SRS0=5fWL=4J=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B9C3C35640
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Feb 2020 07:14:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C0B72073A
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Feb 2020 07:14:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LYr/o1oq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C0B72073A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amlogic.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aV+/CyHD9fg610NtK+p9sG4gNEuJ3NK9iiwylcK31LI=; b=LYr/o1oqBe/pQW
	NgB4bNlmRrvozj4WeICHMFG/qV5rdiwzxwuTRbLRfA8vuPIODJC8Imu/OTmwO3f841gMZ2tif8Cf6
	tCIs/YlJndJvGowpPQP2mh9XrqWQOikMVQGj38g4Y1qV0eOJ4hKu4OEtMIZo5H+F2QbQKXCYmDqFR
	3t2fmMZe6EphG1eJtzGlBn+mYm4/yZfif7uYThCG+N1GYTlK9fuvwKJamMcUSKRfdseHmpqUpAkm/
	vcIOBwOjidI6OicUkqcwOH+uWpZjLwLpg2OB70H7lLeF8byyIm5LHD1Tt6tjfk7rpsPwWgUuoX4OR
	HgjgswBrOxxUOZLZBAjQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j52W7-0003zt-DY; Fri, 21 Feb 2020 07:14:31 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j52Vw-0003qs-Fe; Fri, 21 Feb 2020 07:14:23 +0000
Received: from [10.18.91.136] (10.18.91.136) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Fri, 21 Feb
 2020 15:14:42 +0800
Subject: Re: [PATCH v6 2/4] dt-bindings: power: add Amlogic secure power
 domains bindings
To: Rob Herring <robh+dt@kernel.org>
References: <1579087831-94965-1-git-send-email-jianxin.pan@amlogic.com>
 <1579087831-94965-3-git-send-email-jianxin.pan@amlogic.com>
 <CAL_JsqJwYChw_S4anOPGhH4r3uwD9SVCnRqa_5BwRvwVicjwrg@mail.gmail.com>
From: Jianxin Pan <jianxin.pan@amlogic.com>
Message-ID: <8c7f2a8e-edbd-37e6-7328-e2985284f307@amlogic.com>
Date: Fri, 21 Feb 2020 15:14:29 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <CAL_JsqJwYChw_S4anOPGhH4r3uwD9SVCnRqa_5BwRvwVicjwrg@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.18.91.136]
X-ClientProxiedBy: mail-sh.amlogic.com (10.18.11.5) To mail-sh.amlogic.com
 (10.18.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200220_231422_215342_566D3583 
X-CRM114-Status: GOOD (  12.70  )
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
Cc: devicetree@vger.kernel.org, Hanjie Lin <hanjie.lin@amlogic.com>,
 Victor Wan <victor.wan@amlogic.com>,
 "open list:THERMAL" <linux-pm@vger.kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jian Hu <jian.hu@amlogic.com>, Xingyu Chen <xingyu.chen@amlogic.com>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM
 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


Hi Rob,

Sorry to introduce this mistake. I have sent a patch to fix it.
Thanks for your time.

On 2020/2/20 21:27, Rob Herring wrote:
> On Wed, Jan 15, 2020 at 5:30 AM Jianxin Pan <jianxin.pan@amlogic.com> wrote:
>>
>> Add the bindings for the Amlogic Secure power domains, controlling the
>> secure power domains.
>>
>> The bindings targets the Amlogic A1 and C1 compatible SoCs, in which the
>> power domain registers are in secure world.
>>
>> Signed-off-by: Jianxin Pan <jianxin.pan@amlogic.com>
>> ---
>>  .../bindings/power/amlogic,meson-sec-pwrc.yaml     | 40 ++++++++++++++++++++++
>>  include/dt-bindings/power/meson-a1-power.h         | 32 +++++++++++++++++
>>  2 files changed, 72 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/power/amlogic,meson-sec-pwrc.yaml
>>  create mode 100644 include/dt-bindings/power/meson-a1-power.h
>>
>> diff --git a/Documentation/devicetree/bindings/power/amlogic,meson-sec-pwrc.yaml b/Documentation/devicetree/bindings/power/amlogic,meson-sec-pwrc.yaml
>> new file mode 100644
>> index 00000000..af32209
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/power/amlogic,meson-sec-pwrc.yaml
>> @@ -0,0 +1,40 @@
>> +# SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>> +# Copyright (c) 2019 Amlogic, Inc
>> +# Author: Jianxin Pan <jianxin.pan@amlogic.com>
>> +%YAML 1.2
>> +---
>> +$id: "http://devicetree.org/schemas/power/amlogic,meson-sec-pwrc.yaml#"
>> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
>> +
>> +title: Amlogic Meson Secure Power Domains
>> +
>> +maintainers:
>> +  - Jianxin Pan <jianxin.pan@amlogic.com>
>> +
>> +description: |+
>> +  Secure Power Domains used in Meson A1/C1 SoCs, and should be the child node
>> +  of secure-monitor.
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - amlogic,meson-a1-pwrc
>> +
>> +  "#power-domain-cells":
>> +    const: 1
>> +
>> +required:
>> +  - compatible
>> +  - "#power-domain-cells"
>> +
>> +examples:
>> +  - |
>> +    secure-monitor {
>> +        compatible = "amlogic,meson-gxbb-sm";
>> +
>> +        pwrc: power-controller {
>> +            compatible = "amlogic,meson-a1-pwrc";
>> +            #power-domain-cells = <1>;
>> +        };
>> +    }
> 
> Missing ';':
> 
> Error: Documentation/devicetree/bindings/power/amlogic,meson-sec-pwrc.example.dts:27.5-6
> syntax error
> FATAL ERROR: Unable to parse input tree
> 
> Please fix this as linux-next is now failing dt_binding_check.
> 
> Rob
> 
> .
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
