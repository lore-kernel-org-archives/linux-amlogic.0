Return-Path: <SRS0=Dn2N=WI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C15B8C433FF
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Aug 2019 23:21:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9292720684
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Aug 2019 23:21:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Fb3XcKGl";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="r0ASmmil"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9292720684
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nAKmH0cG440Wvdo+qh7gqMkSHnZevJv4h70LbmCWUGU=; b=Fb3XcKGl6adT4Z
	qYsncCUbY8vb1j9R7O1XjF3dXW1fYrxwKOWYNJ2SYVW0eu/lz5ebxjYK5aSZMfvKxdfVvKi1sM72g
	sEG7L8bWRORcO1YGyO3CgOYY0oHbYce8ZhBs5hctmjHGMZ0cr/OsMm359I3CVSzJAvmHCxuj1zZjq
	B/2ioTbiuaWYV2EWEPNsOiFxdQpFSmETeaCXhvvTVuXRw2P9LjmKw/kxn7pO5LA232SYKabSw9PAC
	JBxvGWlbjoYguPAjPq1Oj1vVCbNKkAmvrieGBq6jYXO1rHpmfzvKXHpEM9QoydxC20GYHyLCf3vhC
	d1Q6DCou2dAxoHCKKgGA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hxJd4-0000fy-C7; Mon, 12 Aug 2019 23:21:30 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hxJd1-0000fR-1C
 for linux-amlogic@lists.infradead.org; Mon, 12 Aug 2019 23:21:29 +0000
Received: by mail-pf1-x441.google.com with SMTP id g2so50481577pfq.0
 for <linux-amlogic@lists.infradead.org>; Mon, 12 Aug 2019 16:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=g+l1+DGNELUOAq8cjxdJkWxhS0t5z7hND686YF94qa8=;
 b=r0ASmmilpv/FWZ7l/cQ2H+o3I3b7VzCxZKHWRWFFmeM1xUe4Z8TAViBrzPCMv2tCMW
 QfAXafIeqKxxZxwAFTArvKzroHrlEQKwZL869REw4ypPpAamqrJcjW+ldot7c3okYgB0
 E/M5qbir5PQMYxdsvgThXrIAQdu3C4lQMXmrDWZ/+TC6+2fnbAgkrFmhLuPtY265Kivj
 3PKRcJxnt4S4u0KCqR2tJpSv7jl0iHTJkEVp3U8af8RZOLFp9mGPv2Ivd+pSVJ+cuaeU
 lC8tttSeAU1OQKeH/+LHc3fJmVJOSZotUCaKmIKGcWjOakYL2yMk0EnE+ui0vY0JucGZ
 uA+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=g+l1+DGNELUOAq8cjxdJkWxhS0t5z7hND686YF94qa8=;
 b=duefPegQpgxba4/BMXQ+RXfJIFdAoUN5TO9Nw/rfEo9zW6Ze1BIlCwyTC2pQthmWNG
 bGG1E8IdlQbTxdCcE8EqQn3WUyNTjO0LgSKHryaJb2MSoFXva+5h9QZSxgwXJfRdxHuL
 QyagOsc3vDIK6fQzv8Y/WAmFmg5sP6PUlYMVy9XnFyn4pE0EvhlXPlGYzBWVuQFY75FW
 7y1UwkDLVTJoCjoAYx6EaOWIPK/Jz36RpcmU3q42uplZvu0UoyDmIaZNtnE43GLXIDiX
 xX0s+Yce52bxIVZYLSbgVyQSDL7dwBNjYTFTYBqYCPQcbWdo0IOY1o15L4iV5uPDskiI
 VkEw==
X-Gm-Message-State: APjAAAXN5pbo1nKJTgzN4t7CQbciMP293T9/6pnSyLaO67HzTdyCBMfP
 BAPCXyd2pwxsHOX9tGI85JRqDQ==
X-Google-Smtp-Source: APXvYqyyhI+uC5HceMN4J/VuKh52YYpjf5nScDIdktyKjduhHJqkAgfV5NDGXSujxj8llYASLi7Qsg==
X-Received: by 2002:a65:5043:: with SMTP id k3mr33102097pgo.406.1565652084961; 
 Mon, 12 Aug 2019 16:21:24 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:14bb:580e:e4d6:b3a8])
 by smtp.gmail.com with ESMTPSA id o35sm100362123pgm.29.2019.08.12.16.21.24
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 12 Aug 2019 16:21:24 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Kevin Hilman <khilman@kernel.org>
Subject: Re: [PATCH v2 2/2] rtc: Add Amlogic Virtual Wake RTC
In-Reply-To: <20190812211337.GW3600@piout.net>
References: <20190808042357.4663-1-khilman@kernel.org>
 <20190808042357.4663-3-khilman@kernel.org> <20190812211337.GW3600@piout.net>
Date: Mon, 12 Aug 2019 16:21:23 -0700
Message-ID: <7h7e7i0y30.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190812_162127_137456_ED72220C 
X-CRM114-Status: UNSURE (   6.20  )
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
Cc: linux-rtc@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Alexandre Belloni <alexandre.belloni@bootlin.com> writes:

> On 07/08/2019 21:23:57-0700, Kevin Hilman wrote:
>> +static int meson_vrtc_probe(struct platform_device *pdev)
>> +{
>> +	struct meson_vrtc_data *vrtc;
>> +	struct resource *res;
>> +
>> +	vrtc = devm_kzalloc(&pdev->dev, sizeof(*vrtc), GFP_KERNEL);
>> +	if (!vrtc)
>> +		return -ENOMEM;
>> +
>> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> +	vrtc->io_alarm = devm_ioremap_resource(&pdev->dev, res);
>
> You could use devm_platform_ioremap_resource.
>
>> +	if (IS_ERR(vrtc->io_alarm))
>> +		return PTR_ERR(vrtc->io_alarm);
>> +
>> +	device_init_wakeup(&pdev->dev, 1);
>> +
>> +	platform_set_drvdata(pdev, vrtc);
>> +
>> +	vrtc->rtc = devm_rtc_device_register(&pdev->dev, "meson-vrtc",
>> +					     &meson_vrtc_ops, THIS_MODULE);
>
> Please use devm_rtc_allocate_device and rtc_register_device.
>

OK, will update both and send a v3.

Thanks for the review,

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
