Return-Path: <SRS0=AlqK=2A=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD073C43603
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Dec 2019 18:43:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 903A1206D5
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Dec 2019 18:43:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="I1LUUvqG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="SfH4rbV9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 903A1206D5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=38o+Nj91/NG6XdVU92rTMdDUMH4i+nwURSLxkxg02rs=; b=I1LUUvqGhARiGe
	galNV6sWuv8UNZg+BxekapO8smpSBtBzV/KWr0kzxgZYRQzZFJTTXBPgIXhNXsh+Y186dXAw2znMR
	3MgMOyWGhwyMKwbXzyumeVk5q0c5jD8WL0Xiky6DNFV2z170QzHOaHAELnZk+AgPlYM0mgpVYQvd2
	JncvhcrFvD7MlgEErkk8f9qUYG7+BA6gK1JDO+3/grXeb5EcxMdQG/PrT3uAHVr67Er4e9IKYhuQ5
	c1BFQ/sqT1kxx7ahcDjh0Ak4lFQFS0GOS40AZpGRcsc+cgWGNRT6ZwcaewgD6cAx+KbHRkq20O7Nx
	6ddt2Ascg0E0iDeUPJVg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iekTW-0004mU-W9; Tue, 10 Dec 2019 18:43:11 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iekTU-0004lh-A8
 for linux-amlogic@lists.infradead.org; Tue, 10 Dec 2019 18:43:09 +0000
Received: by mail-pg1-x541.google.com with SMTP id r11so9323133pgf.1
 for <linux-amlogic@lists.infradead.org>; Tue, 10 Dec 2019 10:43:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=cXgeofGslOi+RjL/J6mEqJJEbNd8kJE15RHzG972FUQ=;
 b=SfH4rbV9YZ1hWUHfo6cMIDDXDMylmGSkT93R4GTh+Vcu9RUxPGbiNBkAG3NbdHpxLv
 G1SKn9dJ2jYhaRCFo3u55A1kll1ZmyWpn4zM876CL3bjaHxBuPO16j48vc4Eamz3b/k1
 K2RPNZft07rIOQeGIXjppjTzrLmt28J4ZXLxwcsdCt1AxZ4CGFaTm/Y/wbPnPG71pkIw
 GRKkwd5rks5xS9URrQMyPKsIEowX25fbB4RuXFxGhqmoGv39UtNs0dWn79kCP+ec1XLo
 hNxzRCHUIR3xk7YRLPXCX9yEIBs86nu0PTIHkJ84zHzuJ4p4qhBV+Ga6CCnNwEp974ba
 klHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=cXgeofGslOi+RjL/J6mEqJJEbNd8kJE15RHzG972FUQ=;
 b=h0vwc5z3QFJNmoG8g/XcHN1mAgmTiRldvQcc54fuUX9pw+GPpvQEv8Y7mSUYQxdjbA
 kb2KmgbT384a1rJ25rCAfuymsZjQF780vuAvYRJh6zzyABIyfUfyw7QucMUG9CwStMWq
 5H//2CfmhfKPtKpqZEZxux3MZzoqmuayflIMND7wxZz/AsTjIIYO81+PIoexvu65H25a
 VPQHWoJwJ6Hj56ca8sbJFloND4InGMW3MDxw2pWeVhykoqDht2z0/R1kQ0E973RJvs33
 AyF7+9Wsc7q6uOFNd6B6gqynqhIndu9HNqv8tE0XFpvEunhm2+sKJIc+7cDE/A8NKJx1
 unRg==
X-Gm-Message-State: APjAAAVM09tvmFP2d7Pbi2YdWbXZVbrUNyrf8wbHRRdBeGADLu3IhiuT
 gByGdZe22f3vGrBB0tt/U5pTSQ==
X-Google-Smtp-Source: APXvYqxAch1OM+Hj+dyhmaGulL00rkkcafPXofsHFHUk6+pyjE/E1S2dK7Z5HJ8gaKs6VYJkuFVJkA==
X-Received: by 2002:aa7:8d4d:: with SMTP id s13mr14405829pfe.18.1576003387448; 
 Tue, 10 Dec 2019 10:43:07 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id k15sm4313480pfg.37.2019.12.10.10.43.06
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 10 Dec 2019 10:43:06 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>, Jian Hu <jian.hu@amlogic.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH] arm64: dts: meson-a1: add I2C nodes
In-Reply-To: <1j8snkh4cz.fsf@starbuckisacylon.baylibre.com>
References: <20191202111253.94872-1-jian.hu@amlogic.com>
 <1j8snkh4cz.fsf@starbuckisacylon.baylibre.com>
Date: Tue, 10 Dec 2019 10:43:06 -0800
Message-ID: <7hwob4owcl.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191210_104308_353960_7BF43107 
X-CRM114-Status: UNSURE (   9.89  )
X-CRM114-Notice: Please train this message.
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
Cc: Mark Rutland <mark.rutland@arm.com>, Rob
 Herring <robh@kernel.org>, Jianxin Pan <jianxin.pan@amlogic.com>,
 Wolfram Sang <wsa@the-dreams.de>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Jerome Brunet <jbrunet@baylibre.com> writes:

> On Mon 02 Dec 2019 at 12:12, Jian Hu <jian.hu@amlogic.com> wrote:
>
>> There are four I2C controllers in A1 series,
>> Share the same comptible with AXG.The I2C nodes
>> depend on pinmux and clock controller.
>>
>> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
>> ---
>>  arch/arm64/boot/dts/amlogic/meson-a1.dtsi | 149 ++++++++++++++++++++++
>>  1 file changed, 149 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
>> index eab2ecd36aa8..d0a73d953f5e 100644
>> --- a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
>> +++ b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
>> @@ -16,6 +16,13 @@
>>  	#address-cells = <2>;
>>  	#size-cells = <2>;
>>  
>> +	aliases {
>> +		i2c0 = &i2c0;
>> +		i2c1 = &i2c1;
>> +		i2c2 = &i2c2;
>> +		i2c3 = &i2c3;
>> +	};
>> +
>
> I wonder if assigning i2c bus alias in the SoC dtsi is such a good idea.
>
> Such aliases are usually assigned as needed by each board design:
> meson-a1-ad401.dts in your case.

Agreed.  I don't think SoC-wide aliases are a great idea.

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
