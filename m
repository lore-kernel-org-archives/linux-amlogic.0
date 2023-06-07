Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A178CC7EE23
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Jun 2023 15:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kfMisosTM5ychTSd4aydKTydhaKfGV3QVzFN9bWAmSw=; b=bimzNDnugdQNmN
	jMDobSceF/NvVKaE52sBYSd50O094RlJIbk+yjGmMuyp7HX2bkGleaDKHTCK7BfMHQZuZJqYJWW3p
	HTglg0FaqAGdX/cjyo599ZeRPT8YiDrFtMLCZnOG9KeEB7XDfjEse/IfBApyGvQBT/8qbNkr+C/Xf
	3W106Sbq7ncXfQg/Og+ycW6qz3v2VCJn+IVSGrTl7LZCa+9o6AZH7HMp3OOlLR8Ql5dwHs9+7Ussq
	T3lZCJm05Hm0YveIG6ulatQAbipvgzldp0z5TPCpem5RB2YXeU7utcKc2ln3sRVvXy9he4TMw5Hwa
	r2yV2AHhCTirb6bA4YZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6v0g-006OmQ-1h;
	Wed, 07 Jun 2023 15:23:42 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6v0d-006OlZ-1U;
	Wed, 07 Jun 2023 15:23:41 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 3E8765FD6E;
	Wed,  7 Jun 2023 18:23:36 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1686151416;
	bh=AKHvLZtrNDiHdcmWapONq/JHCTZbwhGGzWLU3S9Nz8o=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	b=HGWY+8HwQqkgjUzQ+XzLOGB6mX1nCQrkWdB6f21Xz4GjIERJ0J+5sd0hKd26PoYRB
	 kIJXgxwlucvZOSU21WYmh2kanQ3NVh70d5INOuiE1soMV//hpeNhDYdAvCEbA182Jd
	 ADCfelaKPuONRD/C2XQaAT+ElhHWKJP+5X0trJfn+MkLpgu/suS25IxgHjULgbASL8
	 HMF1bbtyClN4hITUHjoUs9m+hqlJLRYPPsgrIAV3VDhOZiDF3+k0cFgis0R77QqZaF
	 fu6zlBwt9Lp4Prvfu3plN1iV8dHWN1+JSJzG3ERhB9RF/EWMSjUvr+GhgtLOX4jdAe
	 ueCHqSkYG2Ufw==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Wed,  7 Jun 2023 18:23:34 +0300 (MSK)
Message-ID: <a1e048aa-ec64-bd0b-aa17-e3e9bdf18090@sberdevices.ru>
Date: Wed, 7 Jun 2023 18:18:39 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v1 0/2] Meson NAND: waiting w/o wired ready/busy pin
Content-Language: en-US
To: Liang Yang <liang.yang@amlogic.com>, Miquel Raynal
	<miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Neil Armstrong
	<neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>
CC: <oxffffaa@gmail.com>, <kernel@sberdevices.ru>,
	<linux-mtd@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20230607145026.2899547-1-AVKrasnov@sberdevices.ru>
From: Arseniy Krasnov <avkrasnov@sberdevices.ru>
In-Reply-To: <20230607145026.2899547-1-AVKrasnov@sberdevices.ru>
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH02.sberdevices.ru (172.16.1.5) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/06/07 13:30:00 #21453197
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_082339_854703_D4403074 
X-CRM114-Status: GOOD (  16.21  )
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



On 07.06.2023 17:50, Arseniy Krasnov wrote:
> Main thing that this patchset adds is support for waiting for command
> completion when there is no wired ready/busy pin. This is implemented
> by using Meson specific command which operates without wired pin, but
> supports interrupt driven waiting (default way for waiting without
> hardware pin is 'nand_soft_waitrdy()' which uses software loop instead
> of interrupt). To select which mode to use during driver initialization,
> common NAND controller property is used - 'nand-rb'. It is described in
> 'nand-controller.yaml'. But for Meson, its description was missed in
> 'amlogic,meson-nand.yaml', so this patchset also adds support for it.
> 
> Patch for bindings was tested with dt_binding_check and dtbs_check.
> 
> Arseniy Krasnov (2):
>   dt-bindings: nand: meson: Fix 'nand-rb' property
>   mtd: rawnand: meson: waiting w/o wired ready/busy pin
> 
>  .../bindings/mtd/amlogic,meson-nand.yaml      |  7 ++
>  drivers/mtd/nand/raw/meson_nand.c             | 82 ++++++++++++++++++-
>  2 files changed, 85 insertions(+), 4 deletions(-)
> 

Changelog:
* Two separate patches:
  For bindings: https://lore.kernel.org/linux-mtd/20230606193507.35024-1-AVKrasnov@sberdevices.ru/
  For driver: https://lore.kernel.org/linux-mtd/20230607073015.1280085-1-AVKrasnov@sberdevices.ru/
  Now fixed/updated and combined to this patchset with v1 version.

* In binding patch:
  * Invalid type of 'nand-rb' is fixed, it was 'bool', now it is 'uint32 array' as required. Also
    new declaration of 'nand-rb' contains several restrictions like number of elements and min/max
    value of elements.
  * Location of 'nand-rb' is moved from the controller object to the chip object as required.

* In driver patch:
  * Update comment which describes when it is needed to send NAND_CMD_READ0 to
    leave command waiting loop.
  * Change type of 'no_rb_pin' to 'bool' as in v1. Now it is just a flag which selects
    mode to wait for command completion.

Thanks, Arseniy
  

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
