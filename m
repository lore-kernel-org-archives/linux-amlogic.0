Return-Path: <SRS0=QOxW=ZR=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DD04C432C0
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Nov 2019 07:53:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2AE1B2071A
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Nov 2019 07:53:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UucNgkru"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2AE1B2071A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amlogic.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cHYJ3FcbYUaL2cikvD1dEACkODslpOQ0yNL9QFbFG7M=; b=UucNgkruI0gxDk
	AZQ408rpnQBi5xDFS15t425nWvWVQSWGG9el/7qPZVJ6yCGgR+M5o0yDZVKyfG1jBHgTxwKs2vhOS
	kN+zpY96FJ+yGaVTlWyKzsoileEv7BCim3bacWjOb7fbInxivxSRiUyAHxNZCHix2tl7wmQooiRHs
	EueNGnrfvA0p+EuOWmcmjKRYr87QmgeJhIRLkLaA1y+sg9HkhSGWyXIWJFpltaYyQ8sBrxqfValff
	OJnIR/WGW/UJM0VR2AbvAkWCfo9SWQlKk03q16tOLf7ET7AJf46mlxipB+79rFQfGSxitZ92sESod
	Y+S3cvgq+AKU8YJHcFVA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iZ9Bg-00013Z-25; Mon, 25 Nov 2019 07:53:36 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZ9Bd-000132-AV; Mon, 25 Nov 2019 07:53:34 +0000
Received: from [10.18.38.198] (10.18.38.198) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Mon, 25 Nov
 2019 15:53:58 +0800
Subject: Re: [PATCH 0/6] arm64: meson: Add support for USB on Amlogic A1
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <1574405757-76184-1-git-send-email-hanjie.lin@amlogic.com>
 <CAFBinCDA=ZekRC0hgQnPLRZM3LMnqBZ6TWCvXhyixAmgDyTAsw@mail.gmail.com>
From: Hanjie Lin <hanjie.lin@amlogic.com>
Message-ID: <5c0029ec-7377-4c1a-0062-3b59a87f8dea@amlogic.com>
Date: Mon, 25 Nov 2019 15:53:57 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <CAFBinCDA=ZekRC0hgQnPLRZM3LMnqBZ6TWCvXhyixAmgDyTAsw@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.18.38.198]
X-ClientProxiedBy: mail-sh.amlogic.com (10.18.11.5) To mail-sh.amlogic.com
 (10.18.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191124_235333_359665_C91E0075 
X-CRM114-Status: GOOD (  13.47  )
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
 Felipe Balbi <felipe.balbi@linux.intel.com>,
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



On 2019/11/22 15:52, Martin Blumenstingl wrote:
> Hello Hanjie,
> 
> On Fri, Nov 22, 2019 at 7:55 AM Hanjie Lin <hanjie.lin@amlogic.com> wrote:
> [...]
>>   dt-bindings: phy: Add Amlogic G12A USB2 PHY Bindings
>>   dt-bindings: usb: dwc3: Add the Amlogic A1 Family DWC3 Glue Bindings
>>   phy: amlogic: Add Amlogic A1 USB2 PHY Driver
> drivers/phy/amlogic/phy-meson-g12a-usb2.c seems very similar to the A1
> USB2 PHY you are introducing here.
> 
>>   usb: dwc3: Add Amlogic A1 DWC3 glue
> drivers/usb/dwc3/dwc3-meson-g12a.c is also very similar to the dwc3 glue.
> 
> I have two questions:
> - how is the PHY and the dwc3 glue different from G12A (or SM1)?
> - why do we need a separate set of new drivers (instead of updating
> the existing drivers)?
> 
> We try to use one driver for the same IP block, even if there are
> several revisions with small differences (for example the SAR ADC
> driver supports all SoC generations from Meson8 to G12A/G12B/SM1,
> because 80-90% of the code is shared across all revisions).
> 
> 
> Martin
> 
> .
> 

Hi Martin,

thanks for the comment.

1, G12A have usb2-phy0/usb2-phy1/usb3-phy0 three phys and an interrupt to support host/peripheral/otg modes.
   A1 has one usb2-phy0 phy and only support host mode.
   
2, G12A glue/phy drivers are for G12A SoCs, there are some diffrences to A1.
   G12A glue driver have dr_mode and interrupts two attributes to support otg mode while A1 hasn't this requirement.
   G12A glue driver has a hard coding vbus regulator code to support otg mode while A1 hasn't this requirement.
   G12A glue driver has a hard coding support phys while A1 only supports host mode.
   	enum {
		USB2_HOST_PHY = 0,
		USB2_OTG_PHY,
		USB3_HOST_PHY,
		PHY_COUNT,
		};
   G12A glue driver only supports one clock while A1 needs four clocks.
   G12A and A1 phy drivers have different register configurations since hardware differences.
   
3, We have estimated these differences and we thought it's more clear and readable to have a dedicated glue/phy
   driver for A1 SoCs, so also dedicated dt-bindings.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
