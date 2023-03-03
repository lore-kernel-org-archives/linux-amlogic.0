Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BFD0C64EC4
	for <linux-amlogic@archiver.kernel.org>; Fri,  3 Mar 2023 13:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C22DLA6J+MnVVFfW6U6ZuWAvXT28M/bN7cY0QmwLEbU=; b=C0wRgo9r/vkz+f
	xY2/RjAGSOlC+nKutxNnOedOlgFj+sBY2psh8LdH15OcwkAzHmeH5D7JAxwa55cd0Nnw+5icr1FgI
	3JmScZyzT8d3JH4X0ee8SjYX+JALdxE0dMxBupsgnIoCjoVQBpC5uKyjtajtYJKZAWbZy6A/YhD5q
	6uy09ElYjqElqfTRgqpw0zwfIOD3QpUm0vWSntKBz66zKfaiMOIh0mrpeGTV3Q22/MpeJcWh+6zgG
	yFJSSrrZfIh3DGl5325wNwrTRNjhAtAr/h0KSDqSsPBivT3PBfiU/tcjgu0RqOfIxIVKdq/9pR7KE
	ho4ZWAKDjDMERlK1uQOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY5L8-006Qrr-W8; Fri, 03 Mar 2023 13:20:51 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY5L6-006QrF-0O
	for linux-amlogic@lists.infradead.org; Fri, 03 Mar 2023 13:20:49 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id BB9935FD18;
	Fri,  3 Mar 2023 16:20:45 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1677849645;
	bh=+rBieqkMux5sP6oyEOSgIkFeZI6CxgVMi6don9FXROA=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	b=RLdb+L4hcEn6/accvwZhkFpN17vkeywVfM7JdBMpmjjMw8FKEpLECL5mFPXNuCfYb
	 2JxlRttjxGCV4uANIjZoIxvH4gjwBiWdG9/HyILtZdT/sN2SROChtI23W8/UU5Zky7
	 seu08PEXcjWp/iS3mBBE1vvj3vAjPyRU4i6DINyXIMIOHTvfEiRzZMmhCXRsT6EkbJ
	 6Is+b/LtvOW6vaOT1RHmjXrDOSg4AZBjnrfmsBFFSisMwpXy47urky3PE3mgJWqu3r
	 YWadTLOWwp8tt3PhUa1MJCmgx0xq1TwXSvTVUsPIgV7IYk/VLdmsRFMmano7/h/qRC
	 CqbfzTcKZGDDg==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Fri,  3 Mar 2023 16:20:45 +0300 (MSK)
Date: Fri, 3 Mar 2023 16:20:45 +0300
From: Dmitry Rokosov <ddrokosov@sberdevices.ru>
To: zelong dong <zelong.dong@amlogic.com>
CC: Neil Armstrong <neil.armstrong@linaro.org>, Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	<linux-media@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <kernel@sberdevices.ru>
Subject: Re: [PATCH 2/3] dt-bindings: media: Add compatible for Meson-S4 IR
 Controller
Message-ID: <20230303132045.nsmaqi3ph6xkls7k@CAB-WSD-L081021>
References: <20230302063402.42708-1-zelong.dong@amlogic.com>
 <20230302063402.42708-3-zelong.dong@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230302063402.42708-3-zelong.dong@amlogic.com>
User-Agent: NeoMutt/20220415
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH01.sberdevices.ru (172.16.1.4) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/03/03 09:42:00 #20911747
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230303_052048_264627_368EDDE5 
X-CRM114-Status: GOOD (  16.47  )
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

On Thu, Mar 02, 2023 at 02:34:01PM +0800, zelong dong wrote:
> From: Zelong Dong <zelong.dong@amlogic.com>
> 
> Add new compatible for Amlogic's Meson-S4 IR Controller
> 
> Signed-off-by: Zelong Dong <zelong.dong@amlogic.com>
> ---
>  Documentation/devicetree/bindings/media/meson-ir.txt | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/meson-ir.txt b/Documentation/devicetree/bindings/media/meson-ir.txt
> index efd9d29a8f10..2a6662edd04d 100644
> --- a/Documentation/devicetree/bindings/media/meson-ir.txt
> +++ b/Documentation/devicetree/bindings/media/meson-ir.txt
> @@ -5,11 +5,14 @@ Required properties:
>  		  - "amlogic,meson6-ir"
>  		  - "amlogic,meson8b-ir"
>  		  - "amlogic,meson-gxbb-ir"
> +		  - "amlogic,meson-s4-ir"
>   - reg		: physical base address and length of the device registers
>   - interrupts	: a single specifier for the interrupt from the device
>  
>  Optional properties:
>   - linux,rc-map-name:	see rc.txt file in the same directory.
> + - amlogic,ir-support-hw-decode: enable hardware IR Decoder, and register
> +				 rc driver as type RC_DRIVER_SCANCODE

One space character is missing, if you want to align 'rc' and 'enable'
words.

[...]

-- 
Thank you,
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
