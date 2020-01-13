Return-Path: <SRS0=Ohoh=3C=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 554C9C33CA9
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Jan 2020 01:23:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 278D521556
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Jan 2020 01:23:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="j/hPGc46"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 278D521556
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amlogic.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=St9UUxK/u+GaVmK1VhmZ3V6zs7DK2L6mtODgspWHGHI=; b=j/hPGc46124qkd
	IVgYN2SQLV26bI3Anczy3b3qSXZuQr4Xk7zTl5kAqZSgx9JTmMiErFRY636dvGEbNJNvk0LzTm8qF
	BoLljMCrsdrpl2ONWFiIjBoF38TNuJHaH/ssYRxGb6gXGJQiXmFDp2JIiYE5zq8qdQPdKE9n7LTXv
	jDVNxDiOZdRtuU0GdpkP8czOTflVKbgMOPcIV26RW2ADbNUqQaW5uoDWDsybNODt2ncJUlTOWt6+8
	k1O+koGjMB7/FSeH/sz3ptKR+jOQd9Kt6KjOU93Ts7bh77qpidHlyYcEB4m0X7r5uqM5yPxjAqJTQ
	ZNiC+cHB0/ayXngHrb2w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iqoS3-0000Pr-OZ; Mon, 13 Jan 2020 01:23:31 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iqoS0-0000PH-S4; Mon, 13 Jan 2020 01:23:30 +0000
Received: from [10.18.38.198] (10.18.38.198) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Mon, 13 Jan
 2020 09:23:53 +0800
Subject: Re: [PATCH v5 2/6] dt-bindings: usb: dwc3: Add the Amlogic A1 Family
 DWC3 Glue Bindings
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <1578634957-54826-1-git-send-email-hanjie.lin@amlogic.com>
 <1578634957-54826-3-git-send-email-hanjie.lin@amlogic.com>
 <CAFBinCCZSBWdKQwmcvponuUu_aiTnDCyRiPqKDgqfNkJQoq06w@mail.gmail.com>
From: Hanjie Lin <hanjie.lin@amlogic.com>
Message-ID: <52566105-cbee-01d6-9110-f9954eabe22f@amlogic.com>
Date: Mon, 13 Jan 2020 09:23:52 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <CAFBinCCZSBWdKQwmcvponuUu_aiTnDCyRiPqKDgqfNkJQoq06w@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.18.38.198]
X-ClientProxiedBy: mail-sh.amlogic.com (10.18.11.5) To mail-sh.amlogic.com
 (10.18.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200112_172328_909540_A9B47F16 
X-CRM114-Status: GOOD (  12.53  )
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
Cc: Rob Herring <robh@kernel.org>, Victor Wan <victor.wan@amlogic.com>,
 Jianxin Pan <jianxin.pan@amlogic.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-usb@vger.kernel.org,
 Yue Wang <yue.wang@amlogic.com>, Qiufang Dai <qiufang.dai@amlogic.com>,
 devicetree@vger.kernel.org, Liang Yang <liang.yang@amlogic.com>,
 Jian Hu <jian.hu@amlogic.com>, Xingyu Chen <xingyu.chen@amlogic.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Carlo Caione <carlo@caione.org>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org



On 2020/1/12 4:50, Martin Blumenstingl wrote:
> Hi Hanjie,
> 
> On Fri, Jan 10, 2020 at 6:43 AM Hanjie Lin <hanjie.lin@amlogic.com> wrote:
> [...]
>> @@ -37,6 +43,11 @@ properties:
>>
>>    clocks:
>>      minItems: 1
>> +    maxItems: 4
> the driver parses one clock for G12A/G12B/SM1 and three clocks for A1
> if there is a fourth clock: do we need to manage it in the driver?
> (note: dt-bindings always represent the hardware, so if there's a
> fourth clock which the driver doesn't need then it's perfectly valid
> to describe it here. a comment which clock this is helps in the
> code-review process)
> 

Hi Martin,

Sorry for this confusing, I moved xtal_usb_phy clock from glue driver to phy,
but I missed this binding modification. 
So actually A1 do only need these three clocks and no fourth clock exist, clock
and clock-names maxItems should be three here for A1.

>> +  clock-names:
>> +    minItems: 1
>> +    maxItems: 4
> I let Rob comment on this, personally I prefer naming the clocks explicitly
> also I think clock-names has to be a mandatory property for A1 (see
> Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-codec.yaml
> for an example which makes properties mandatory depending on the
> compatible string)
> 
> 
> Martin
> 
> .
> 

Thanks for your patient and detailed advice.

Do you mean something like this:

+allOf:
+  - if:
+      properties:
+        compatible:
+          enum:
+            - amlogic,meson-g12a-usb-ctrl
+
+    then:
+      properties:
+        clocks:
+         minItems: 1
+
+  - if:
+      properties:
+        compatible:
+          enum:
+            - amlogic,meson-a1-usb-ctrl
+
+    then:
+      properties:
+        clocks:
+          items:
+            minItems: 3
+       clock-names:
+          items:
+            - const: usb_ctrl
+            - const: usb_bus
+            - const: xtal_usb_ctrl
+      required:
+        - clock-names


Hanjie

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
