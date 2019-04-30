Return-Path: <SRS0=l/Xo=TA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 701F4C43219
	for <linux-amlogic@archiver.kernel.org>; Tue, 30 Apr 2019 06:38:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3BDD520652
	for <linux-amlogic@archiver.kernel.org>; Tue, 30 Apr 2019 06:38:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="I9VjTi5m";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="GuHH2NYJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3BDD520652
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/dnHSFXPXsAushrU+Tl1NBI4l44u/ue5/OCVwTofTXE=; b=I9VjTi5mr2jkYu
	cfMSyF5+oGnYkXKs36B9JrVpkJuBE1Z54SKQWLsBraDLiZDPf9CnyOBkDfVfHO55yqaTDXGJIYAsf
	myKJM46NvXsncV4boDQG2Ve0YnAvRHFU0aEI/XWA+MydZDk4H2mzMf9X8WR/dqDimU/VD7Zk+hYGZ
	6Pvr7KX179sxm6137H2jmG0ahFePKO5x0QvWF6OQBohKEN47X8Qu15EQgMPHdjPEPIJE28IsktNVg
	k6QPdmpX/Vbpon9NSRvYthFbLkeIyDgUu/ByYlgnQnTm06GLXEvDVkVey6NqoHwd/GDwl/ReEDTVy
	k6YahhusMJL37aaN4u6Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hLMP6-0003Hd-JD; Tue, 30 Apr 2019 06:38:12 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hLMP3-0003H1-8K
 for linux-amlogic@lists.infradead.org; Tue, 30 Apr 2019 06:38:11 +0000
Received: by mail-wr1-x444.google.com with SMTP id h4so19571804wre.7
 for <linux-amlogic@lists.infradead.org>; Mon, 29 Apr 2019 23:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=mBIgwbzYmkgbhsO4N+I7kDrPR3sJoh79fVIbgSnCeDQ=;
 b=GuHH2NYJhfjGJwyv3eKUmddbs+NwlVoPBUQ6g4XbNyTIfA7LV44lPasCoVmrbOc1lA
 o0CP5Gg1GPuDRv1Kyt0PwgLvzmDt17MGVfznJfK2JgfG/EdNOkfqIMzvsdxdu6OfV4Ul
 H4jvi7EXAeTor5vxhMQ/DXmNZftZ1+n6Nm2VhMIpeBQx5reXVXjdSFIjZniX8mydQjjc
 q0FSCtLlqLaxg11dtdXIb+9IG8zKXRS/bTgZ7bSqrgAZWzQvczK0mXKWtFiJYV5UO6jh
 B0Ka2xDx/iBeit8A+aB8qkC5uBfJ3mqD5Whu8znjK2JBTHbY1e6XEO+GD0Y/BDlvESoK
 x+5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=mBIgwbzYmkgbhsO4N+I7kDrPR3sJoh79fVIbgSnCeDQ=;
 b=rKoQM0fm6Tgz9HOUY8IgMpSuq5ORO0yWHo5hE7y/ivUzTOkVCVq6PTXhzSeZ7926Wa
 B75Oih+0p5+vfKuOzO3KbgVZmLvTvimpWYhf27kK04FVQ2vfANu2XSGyz/W19OG5jno2
 YeizcJra1VvWeq4e1RP2unyZolhfjDsgBHJHe8aTc0dAWK3DsG/9U+eXaSUpVC1wLU7y
 ng51VfjTVoQ15DQihuiC31fhWIVqb/bNOt9RJIv/gTen3x1aic/jmZ1pUHapNnhkn+Fq
 eeYZEYB4c+kAz2yhzbzoLLwTJhPgK9bG5BvhiyT44/ASaPkJPxnaMd25wI7jNj9SeRJE
 npPw==
X-Gm-Message-State: APjAAAXiDhX7i2c4LT0MlEhxRsWkQn0VMmybnMn/17+6dNw/lnNOA917
 P1rscbFU4mdWjvUhifI1tjuuWA==
X-Google-Smtp-Source: APXvYqymYeEIEuBhAecoonvSwahyY44dv52RVC/Ac3Z8WNPqSu59fUyK/xQvi6hQJ1QB9v2pITNduQ==
X-Received: by 2002:adf:db0c:: with SMTP id s12mr4222632wri.184.1556606287158; 
 Mon, 29 Apr 2019 23:38:07 -0700 (PDT)
Received: from ?IPv6:2a01:cb1d:379:8b00:1910:6694:7019:d3a?
 ([2a01:cb1d:379:8b00:1910:6694:7019:d3a])
 by smtp.gmail.com with ESMTPSA id j13sm30419810wrd.88.2019.04.29.23.38.05
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 29 Apr 2019 23:38:06 -0700 (PDT)
Subject: Re: [PATCH v2 3/4] dt-bindings: pinctrl: meson: Add drive-strength-uA
 property
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20190418124758.24022-1-glaroque@baylibre.com>
 <20190418124758.24022-4-glaroque@baylibre.com>
 <CAFBinCD_qJw6-_zsnKFhsVHUHd2K2wJ3S9EsXGrPPxZ1SWn=uA@mail.gmail.com>
From: guillaume La Roque <glaroque@baylibre.com>
Message-ID: <7608f385-d412-f8be-d11b-9023f9702ec3@baylibre.com>
Date: Tue, 30 Apr 2019 08:38:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAFBinCD_qJw6-_zsnKFhsVHUHd2K2wJ3S9EsXGrPPxZ1SWn=uA@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190429_233809_429642_F779C788 
X-CRM114-Status: GOOD (  14.20  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, khilman@baylibre.com,
 linus.walleij@linaro.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, robh+dt@kernel.org,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Martin,

On 4/27/19 9:21 PM, Martin Blumenstingl wrote:
> Hi Guillaume,
>
> On Thu, Apr 18, 2019 at 2:48 PM Guillaume La Roque
> <glaroque@baylibre.com> wrote:
>> Add optional drive-strength-uA property
>>
>> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
>> ---
>>  Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt
>> index a47dd990a8d3..b3e4be696ddc 100644
>> --- a/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt
>> +++ b/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt
>> @@ -51,6 +51,9 @@ Configuration nodes support the generic properties "bias-disable",
>>  "bias-pull-up" and "bias-pull-down", described in file
>>  pinctrl-bindings.txt
>>
>> +Optional properties :
>> + - drive-strength-uA: Drive strength for the specified pins in uA.
> if you have to re-send this series for whatever reason then please
> mention that drive-strength-uA is only valid for G12A and newer

thanks for your review, i will do if i send new series.


> otherwise:
> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
