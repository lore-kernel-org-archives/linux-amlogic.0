Return-Path: <SRS0=FHOR=NW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7473CC432BE
	for <linux-amlogic@archiver.kernel.org>; Tue, 31 Aug 2021 14:50:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 152E26103A
	for <linux-amlogic@archiver.kernel.org>; Tue, 31 Aug 2021 14:50:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 152E26103A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=biBHUSU/Vbb1t5WKK+kiQOi+WcEuByYcLgAC8gfmS7A=; b=s5G4PPjIkIa+Hu+xsdeTIIyL4z
	hFRLJxowaATWy2jYlhuHG3N8exxEVQK0pe5QSf6ByI4KT9XN9DNNE7eHcFEn0DfotYY1BBtRHVkS3
	vixZUHA9LFXgkfxLrJ2/ctJ4luJsIg8jTdusnDAHHhmIjFUN0BsxItP2SzNjNPN4UmyyOZVhGK/LH
	IspOAEtVa/a/sYT3TKBLhydQYP1rWQ7mZFjS+UNZm8bRQMbFv0+LxrJm+hgEmHLlN/z7IojBzsHA5
	ayBE4YK0cWEjlZDEjzbs6TDIKA3tGYidpaqpbtYZihuUyh5f/Eh/3zJxQG9tbgaOKDMXO88IZjeuN
	gAl7dHaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mL55j-002ZkW-GV; Tue, 31 Aug 2021 14:50:23 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mL55U-002ZiK-6u
 for linux-amlogic@lists.infradead.org; Tue, 31 Aug 2021 14:50:12 +0000
Received: by mail-wm1-x334.google.com with SMTP id
 z9-20020a7bc149000000b002e8861aff59so2383416wmi.0
 for <linux-amlogic@lists.infradead.org>; Tue, 31 Aug 2021 07:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=o9Xerj9x1DLdOo3ptOhFxaFlDghoWf30GwyqU+zR+pM=;
 b=LYnaMiSx6In2IhqsjnBuzcKiAAnYd1Z9V8nHKpwnTHxnVU6vKJz2kuv+v+NT4E+tln
 9K/V2zFOD0fOgpT3zUVuAXgWD4PXEoy4Q/gCZ6iQ8PnN4sJ2Vv0HAmlw0Z7T3ZloaJhj
 x1LX1KgDZl+tHo8sXoETBDndsSZqZAInIT78mAOBOROzg4xeiLpPdJa9UPZW1vj5LVGZ
 6mcjb56V3x8apPenmXWh4Cyt+t9rrgZyBC6YWHOsdIUdxQ8xFgGhHgQOk5jtiN5i42RL
 5JewEyU7Aob+VQCvD4w5+ONNDEfhERvofgfNc6MjumtnrSKDynZnccbGQxJfOHENd4zY
 48jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=o9Xerj9x1DLdOo3ptOhFxaFlDghoWf30GwyqU+zR+pM=;
 b=k+7BDrx2SH5X91s6UmLjQMpeh0dLJNl18NNCrxEo96DWu5RLYwG96B6I3pO/7Zybeh
 punsrJbM2n/BF5Y+tEvWlL4n1c81BOMQaLVkepeuX1a1IrZL2MAFkSEOd4r9CKpxALR9
 xjXrEGKu098ZfkqCdGUEvyX1KtA5kSSbcBpzhgvaHsrXrPCOEY6qys9+ltFeM9PIRw7G
 9JIm3Z1+xLa1zEWHqKsv7uAQruAf593KHWsL9+whQMtWheNEzmgcFrm16QqJgx25wEq2
 HoChjCqV2MqmlvaUUEUcFYJH1IT2nYtV29ZIvyEuo9R3vhkYXTDajt3QgYSTEw2JhRL0
 N7GA==
X-Gm-Message-State: AOAM532m7HFZITYI0nrH+RFH6fZ+6I5gNPP2XF8C46QmrOghP+Q5nHTl
 VkqDhVK5Cy+FjR0eMJE1IyVdWQ==
X-Google-Smtp-Source: ABdhPJzfXFWLxmkSweI+5zHOnWUNvWwOON8f7JdZdJowyF1SEsMkEOlKFrkT0ehkRSJs7vuhu8m0zg==
X-Received: by 2002:a1c:4407:: with SMTP id r7mr4774784wma.150.1630421405887; 
 Tue, 31 Aug 2021 07:50:05 -0700 (PDT)
Received: from ?IPv6:2001:861:44c0:66c0:fc41:6c:2c4e:2156?
 ([2001:861:44c0:66c0:fc41:6c:2c4e:2156])
 by smtp.gmail.com with ESMTPSA id h6sm2795675wmq.5.2021.08.31.07.50.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Aug 2021 07:50:05 -0700 (PDT)
Subject: Re: [PATCHv3 1/6] ARM: dts: meson8b: odroidc1: Add usb phy power node
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Anand Moon <linux.amoon@gmail.com>, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Matt Corallo <oc2udbzfd@mattcorallo.com>, Rob Herring <robh+dt@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 Emiliano Ingrassia <ingrassia@epigenesys.com>,
 Brian Kim <brian.kim@hardkernel.com>
References: <20210817041548.1276-1-linux.amoon@gmail.com>
 <20210817041548.1276-2-linux.amoon@gmail.com>
 <c7f6213b-5ddc-881c-1aea-9cc7b03e6a4f@baylibre.com>
 <CAFBinCBeNMET2tvH0h6HF3dR+xBb59hifQyaoXigUs3UGkS+KQ@mail.gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <2b07b3de-cee5-c570-8fde-6a4c684122d6@baylibre.com>
Date: Tue, 31 Aug 2021 16:50:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFBinCBeNMET2tvH0h6HF3dR+xBb59hifQyaoXigUs3UGkS+KQ@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210831_075008_333924_3E1941EC 
X-CRM114-Status: GOOD (  27.34  )
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

Hi,

On 30/08/2021 21:37, Martin Blumenstingl wrote:
> Hi Neil,
> 
> On Mon, Aug 30, 2021 at 9:45 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>>
>> Hi,
>>
>> On 17/08/2021 06:15, Anand Moon wrote:
>>> Add missing usb phy power node for usb node fix below warning.
>>> P5V0 regulator supply input voltage range to USB host controller.
>>> As described in the C1+ schematics, GPIO GPIOAO_5 is used to
>>> enable input power to USB ports, set it to Active Low.
>>>
>>> [    1.260772] dwc2 c90c0000.usb: Looking up vbus-supply from device tree
>>> [    1.260784] dwc2 c90c0000.usb: Looking up vbus-supply property in
>>>               mode /soc/usb@c90c0000 failed
>>
>> First of all, DT is not here to fix boot message.
> Anand mentioned elsewhere that this is a debug/info message
> 
>> Finally, I looked at the Odroid-C1 schematics and the GPIOAO.BIT5 is an input
>> to the S805, and the PWREN signal is controlled by the USB Hub so this regulator
>> should not be added at all.
> I think there's a misunderstanding because there's two PWREN signals
> with different meanings.
> The PWREN signal for the USB host ports is hard-wired and not
> connected to the SoC at all.
> The PWREN signal for the Micro-USB port (which Anand is adding here)
> is controlled by GPIOAO_5. odroid-c1+_rev0.4_20150615.pdf [0] shows it
> as an input to "USB_OTG" on page 1. "USB_OTG" consists of a power
> switch and the connector itself as shown on page 28.
> 
> Personally I think that the change from Anand itself is good.
> If you feel otherwise then please speak up.

Ok thanks for the clarification, then the change is ok, but not the commit message.

>> Add missing usb phy power node for usb node fix below warning.

is not a good reason for a DT change. A proper reason should be added.

And the commit message doesn't specify the change is for the Micro-USB port,
this should be clarified.

Neil

> As I pointed out three smaller changes I am hoping that Anand will
> re-send the updated patch anyways. At that point he can also add the
> changes from your feedback.
> 
> 
> Best regards,
> Martin
> 
> 
> [0] https://dn.odroid.com/S805/Schematics/odroid-c1+_rev0.4_20150615.pdf
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
