Return-Path: <SRS0=lgrq=RV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC2B5C4360F
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Mar 2019 09:46:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE0FF204FD
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Mar 2019 09:46:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VQxNWWpq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="qj8VRM9F"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE0FF204FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=si707yil9E3diaTONyHrptylqvcDa0r+jJMUggFir4E=; b=VQxNWWpq2aAd6w
	+eZhGlPtKr3odKReNqo/pQtaNchjv/mkH0U6iHFo5IBP6DEvhN/X1tis1ZVTpsP6nkfJJOfNiHY6d
	42m/8BGQGWG3oGFF/nUvipdYZ3GjNxIxhVQFHB7C59BEkZnPxdb2Fdjee0eaB5rLOnoe9SSTAQ4ly
	3r/pUyWytrJvo7tnApw44TnzwT9313mGQEe47DI22XJ7p5Sa1ajK6yMy6IObbsCEP3B3w4ewMLpRe
	GF3f2bYY86kJ0fyq9usX+dI4J3RrGFiD41mPwgDdZbmRApMa/eOm7qrKDH39KI/+XruQ/v4e7Qp6/
	FabCG4NlU0caCUgZtTSg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h5oqJ-0006Ts-6B; Mon, 18 Mar 2019 09:46:03 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h5oqG-0006T9-4d
 for linux-amlogic@lists.infradead.org; Mon, 18 Mar 2019 09:46:01 +0000
Received: by mail-wm1-x344.google.com with SMTP id h18so3562195wml.1
 for <linux-amlogic@lists.infradead.org>; Mon, 18 Mar 2019 02:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=EdSvjKSxJLGio5lUoPlROrDL0qJb0hpWbkvUZ1jgR/M=;
 b=qj8VRM9FS50UaS2GTStR9ZsFwZNQu4khMY5SdoCKu7TVrNiV7sw/1Sz0pXJODmZxYy
 reMqvZKv6aomXuB39E3wmzB+r2mp2shYJyxjN3P45ZICUYdD4TxmLG31m2qrBoKGnPU+
 812wlRdbxGtIODpxqB5N52Eas9iU0Ji01XBEH9rcT+TPxTkYl/eF+Ioi7B9Jq8PcWmvE
 QWEVmfYjpsDzodPz/YRwX151csAJzf06X9P0szyQ+RfNA7sjA39Lv+o9FvhHDSY/wZRe
 DF/IrCVJk8pkFmYDOsZV8g2JCko0CnNoKrR5dYc0lDcxCGzrly2KpHPW06qd3PNe0H0f
 eC+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=EdSvjKSxJLGio5lUoPlROrDL0qJb0hpWbkvUZ1jgR/M=;
 b=WspzjIP8XV9xRdyULWgq1GHYEEzfDXHV4UZN1cJ8L9nKa13F7Tl4ddf3fPdCsA6NUf
 W5lRya8sIOWXckrEDtoAlBXnHj3wD1WYe+UplYMwP+UkoaxmOcWWCDE/uMxA/+AwNQDx
 GoKV+RYtkhlY2EuvvLx8HWwJGz/r8OoRkJdhaNdR6/bAGsReehZgjsbZqTp2bHDpvq9B
 oUNhcf2VP1UGXT+RtoM1b6S/eRotekId3BhXixqrQpyxw5nHttttW6PYyO/3HhDOG0wu
 u1TQ6BS48pjK+X9wLJoODQLZNQoyoCHBn6LmL+srN4OHKX/AXd6B5p3rnpv0/T4fWrAy
 fAlw==
X-Gm-Message-State: APjAAAVMqQBqhHS6R+zifATTNEb0200+70HiVXC8XwVUAtAR7Nc4DBpu
 3PIlZiR2d3O2BKfUtE875eYbYw==
X-Google-Smtp-Source: APXvYqzUvs4wtLfEu9SWT2ERgzQQK9tP5denBFZ+6jzCKjuQEJql3PnDc737/T0eh2dR10FDAoY2rQ==
X-Received: by 2002:a1c:2e85:: with SMTP id u127mr11247629wmu.45.1552902356874; 
 Mon, 18 Mar 2019 02:45:56 -0700 (PDT)
Received: from [10.1.2.12] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id 132sm23678202wmd.27.2019.03.18.02.45.55
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 18 Mar 2019 02:45:56 -0700 (PDT)
Subject: Re: [PATCH net-next 2/3] net: phy: add amlogic g12a mdio mux support
To: Andrew Lunn <andrew@lunn.ch>, Jerome Brunet <jbrunet@baylibre.com>
References: <20190314140135.19184-1-jbrunet@baylibre.com>
 <20190314140135.19184-3-jbrunet@baylibre.com>
 <20190316025448.GD29548@lunn.ch>
 <13432d537f671c8065693b7e53348f812e8bbc04.camel@baylibre.com>
 <20190317154821.GA22226@lunn.ch>
From: Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <c7c1af27-eb6d-d148-887c-6a069f01ad7c@baylibre.com>
Date: Mon, 18 Mar 2019 10:45:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190317154821.GA22226@lunn.ch>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190318_024600_179880_05C9BF59 
X-CRM114-Status: GOOD (  18.87  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Andrew,

On 17/03/2019 16:48, Andrew Lunn wrote:
> On Sat, Mar 16, 2019 at 06:02:45PM +0100, Jerome Brunet wrote:
>> On Sat, 2019-03-16 at 03:54 +0100, Andrew Lunn wrote:
>>> On Thu, Mar 14, 2019 at 03:01:34PM +0100, Jerome Brunet wrote:
>>>>> +static int _g12a_enable_internal_mdio(struct g12a_mdio_mux *priv)
>>>
>>> You would generally use the _ prefix when you have a locked and an
>>> unlocked version. I don't see anything like this here. So please drop
>>> the _ .
>>>
>>
>> will do
>>
>>> Nice to see the generic clock framework being used. I just wonder if
>>> this is the correct place to have this clock code. Can it be made part
>>> of the SoC clock code?
>>
>> the PLL is local to this particular device.
>>
>> In 'Soc clock code' (driver/clk/meson in this case) we usually put clock
>> controllers. Those controllers feeds the different devices of the SoC but we
>> tends some more clock elements in the consumer device
>>
>> Usually, it is just a few mux, dividers and gates (like in
>> drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c) but in this case, we have
>> a PLL. IMO, it belongs here. Do you see a problem with this ?
> 
> Hi Jerome
> 
> Some maintainers like to have code in their directory structure. It
> would be good to check that the clock maintainer in happy with clock
> code under the network driver subtree. Also, the clock maintainer
> should also review this code. So please at least Cc: the clock
> maintainer and clock list on the next submission, as well as netdev. I
> personally don't know the clock code well enough to review such code.

If it can help, I also co-maintain the Amlogic Clocks drivers, and I did
not interfere with the review process in purpose, but if it can help :

For the clock code :
Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

Neil

> 
> 	   Andrew
> 
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
