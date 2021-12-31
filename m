Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BD21C433EF
	for <linux-amlogic@archiver.kernel.org>; Fri, 31 Dec 2021 10:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y2kPCvINaW30hkcKjcLOzNS1H9U/tcfkWiRuG2bgju0=; b=tCjTGOA4oAe8Y8
	bo7U3FudIPT15arOF4Qj/zU4JKE3GEtH9YOB5nspYbcswptNE+3sEJLC1OeDT4OXLdy8awgsf4X8V
	h8SKd+ROZS88OlYZC4Rpla7bZpMIlmcvYcgTMv0S6RTFOvuKICRDWmIlrP3Xb+luw2atIAaZi4aoX
	3oFR9rcA9xPSaGnMbG52WaJHGzuk6NuZyGP/fPOcA0O2VD/ljKP7FaFtfbkya9sBC+7Firv45d1qG
	Mlx/nVZA4hvBuiUu8vXeZbY/qij7ynMsCuiIH6g5uB2gLmoH9Bk6c7xWgVYZJ9r8TIKUTKe+K8gSn
	lvi/In2a8vMu3Hc1rPJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n3FG9-005wN6-ES; Fri, 31 Dec 2021 10:35:41 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n3FFy-005wLp-Kp; Fri, 31 Dec 2021 10:35:32 +0000
Received: from [10.18.29.173] (10.18.29.173) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Fri, 31 Dec
 2021 18:35:28 +0800
Message-ID: <93da58f8-aca1-2fcf-e45c-e341e1be593b@amlogic.com>
Date: Fri, 31 Dec 2021 18:35:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH V3 3/6] dt-bindings: serial: meson: Support S4 SoC uart.
 Also Drop compatible = amlogic,meson-gx-uart.
Content-Language: en-US
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
CC: <linux-serial@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jirislaby@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, Vyacheslav
 <adeep@lexina.in>, Kevin Hilman <khilman@baylibre.com>, Jerome Brunet
 <jbrunet@baylibre.com>
References: <20211230102110.3861-1-yu.tu@amlogic.com>
 <20211230102110.3861-4-yu.tu@amlogic.com>
 <CAFBinCB0RTfOLbV3ZC+9dJEiw2_y41V+JvNP9GOPaQcCLB7UdA@mail.gmail.com>
From: Yu Tu <yu.tu@amlogic.com>
In-Reply-To: <CAFBinCB0RTfOLbV3ZC+9dJEiw2_y41V+JvNP9GOPaQcCLB7UdA@mail.gmail.com>
X-Originating-IP: [10.18.29.173]
X-ClientProxiedBy: mail-sh.amlogic.com (10.18.11.5) To mail-sh.amlogic.com
 (10.18.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211231_023530_720927_7A79CBD6 
X-CRM114-Status: GOOD (  12.09  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org



On 2021/12/31 6:34, Martin Blumenstingl wrote:
> [ EXTERNAL EMAIL ]
> 
> Hello,
> 
> as Greg already mentioned the $subject line is very long.
> 
> On Thu, Dec 30, 2021 at 11:21 AM Yu Tu <yu.tu@amlogic.com> wrote:
>> Deprecated, don't use anymore because compatible = amlogic,meson-gx-uart
>> don't differentiate between GXBB and GXL which have different
>> revisions of the UART IP. So it's split into GXBB and GXL.
> actually it's split into GXBB, GXL and G12A
> 
> [...]
>> -              - amlogic,meson-gx-uart
>> +              - amlogic,meson-gxbb-uart
>> +              - amlogic,meson-gxl-uart
>> +              - amlogic,meson-g12a-uart
>> +              - amlogic,meson-s4-uart
> In addition to Greg's comment I suggest splitting this into two patches:
> - one where the "amlogic,meson-gx-uart" compatible is marked as
> deprecated (Documentation/devicetree/bindings/power/supply/bq27xxx.yaml
> has an example for deprecated entries) and GXBB, GXL and G12A
> compatible strings are added instead
> - another one where the new S4 compatible string is added
> 
> The idea here is to have "one logical change per patch".
> Deprecating and replacing "amlogic,meson-gx-uart" is one logical change.
> Adding a new compatible string is another logical change.
> I am hoping that this will also make it easier to find a shorter
> $subject line (which according to the patch submission guide [0]
> should be 70-75 characters: "the summary must be no more than 70-75
> characters")
> 
I will split the two patches in the next version.One was deprecating and 
replacing "AmLogic, Meson-GX-Uart" and the other added S4 compatible.
> 
> Best regards,
> Martin
> 
> 
> [0] https://www.kernel.org/doc/html/v4.17/process/submitting-patches.html#the-canonical-patch-format
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
