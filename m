Return-Path: <SRS0=DVbv=PT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E16CC43387
	for <linux-amlogic@archiver.kernel.org>; Fri, 11 Jan 2019 22:42:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 324CD21783
	for <linux-amlogic@archiver.kernel.org>; Fri, 11 Jan 2019 22:42:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="t6E1aiNM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="XwVAvXeD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 324CD21783
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MKpaUv0JnBDmTmzf74KlMcvEZ7LMbUhRAqFTuX9w18w=; b=t6E1aiNM6oEmwg
	jP1kCrYkRdY13C90vThcUueu7qVMBgZ/cJuPjqx4NxMx95zRVskt7+d9diK/F6jtFdg7mrpxLp5Uc
	D+mkMXVUx8hVt6iWstrxQMnCjHDNnLs4YL0fkOyiKGIgH9p0rFU5y7vEostXW7y69qKiAQlRDudjL
	qla4zsidhmnAlwXKBZeWL5pGYjjELaJ0QyHebBvK7bGGOw4Wq8kuePWDdnX7hfewjUegrzp6nZ3BJ
	/vrzrFqSSqytqjyGZGI+C9DBZaL9RY/4jbcnXmfD+tzfGUjwt/2kMHrhAK067xiolPaRTNWRZCPo5
	dVzhOInGKnlP2LvITjMg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gi5Vk-0007W1-05; Fri, 11 Jan 2019 22:42:44 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gi5Vg-0007VC-N9
 for linux-amlogic@lists.infradead.org; Fri, 11 Jan 2019 22:42:42 +0000
Received: by mail-pf1-x443.google.com with SMTP id z9so7608740pfi.2
 for <linux-amlogic@lists.infradead.org>; Fri, 11 Jan 2019 14:42:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=RhQpiFSimfcqud9uuLN9/qAo6QVLD+85AWtP8nRFrBY=;
 b=XwVAvXeDM94WBJj0kwiIpzHXiqFsFy2zFUHkg1S1RBABLgCxDG3b9XUBF60Fz1sVC0
 jciV+ZH5dmC6xws0nfbt0wu+NyigoHmrZNyjloI/ZpEHzs5NQaVvHWSuiPjQHKvkZ+1m
 bhWjoLhKhX8sCAxyazsj3jBxWRVRZllnkdB97xymh9NBbHGG1u8BsepmYL71NDJX3DFS
 SnzJlWp6nXPKVkMuX+SLRPlZS6j2pLjOq9sSX3/qvuB7yPUwwynHCf990TKEWCqyKLEt
 196yXexxhNLoyZb9EW6Ig33VVuPZcD00nPIsPos96zLn61rD4j6twT5w5CGBwzMMEXRY
 mbFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=RhQpiFSimfcqud9uuLN9/qAo6QVLD+85AWtP8nRFrBY=;
 b=Kz2gWnp6Ib5OViNwuWzMx5NNUCXzq3SW3oLzsN8WQb7HNm+XXDnnURaldGoAn4NWxz
 qt6eOEYcSICZV+nWyyXcYyyVdECfQvtV4+V5vSo3Nrqmw3WNb2fAyZH8huTyP5zBY2Uc
 hjjx59uQ/lsRyt5FonuhL2b7UO9xKIs+Y9yA4+rQ5vo0LY7yruen1emhENdnUqyYTB6p
 8SYtPONW5V2houCUNxpmkktyUUKqK6bTgsKC13FsdvVzskw7LBYJg5nImQc4VGjeAPoG
 eotIOcw3H77s8B7MOrHb4yc27eac0HKUE8vjM9eTUV6+ju+EYvlN/AAzA5QbJiZoY5ol
 L40w==
X-Gm-Message-State: AJcUukc2xdOQjIQtBk/ovNJ5kQlCJsMeVeV9nJp2SkOBhyYKgZ48ooho
 d+f8PqcC/G6By7J/GGKwlWehu1iseZw=
X-Google-Smtp-Source: ALg8bN5Tvz2Di5jECilBOVwGl6TeROYoU6TDjqEGvVQdBJMqJ94Nf2APogYdTh5ThDMtb6NOyPIKzA==
X-Received: by 2002:a63:de46:: with SMTP id y6mr14979856pgi.198.1547246559664; 
 Fri, 11 Jan 2019 14:42:39 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152]) by smtp.googlemail.com with ESMTPSA id
 p24sm131719146pfk.155.2019.01.11.14.42.38
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 11 Jan 2019 14:42:38 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v3 1/2] pinctrl: meson: meson8b: add the eth_rxd2 and
 eth_rxd3 pins
In-Reply-To: <CAFBinCB41iRf-5AdUir9Z9AYPGP4-yfD4B3Yn9+v+dxSFJoELA@mail.gmail.com>
References: <20181229143556.27339-1-martin.blumenstingl@googlemail.com>
 <20181229143556.27339-2-martin.blumenstingl@googlemail.com>
 <7hzhs8ovag.fsf@baylibre.com>
 <CAFBinCB41iRf-5AdUir9Z9AYPGP4-yfD4B3Yn9+v+dxSFJoELA@mail.gmail.com>
Date: Fri, 11 Jan 2019 14:42:37 -0800
Message-ID: <7hmuo6n7du.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190111_144240_896045_DBF728E9 
X-CRM114-Status: GOOD (  15.36  )
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
Cc: linus.luessing@c0d3.blue, jianxin.pan@amlogic.com, linus.walleij@linaro.org,
 linux-gpio@vger.kernel.org, ingrassia@epigenesys.com,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:

> Hi Kevin,
>
> On Fri, Jan 11, 2019 at 2:08 AM Kevin Hilman <khilman@baylibre.com> wrote:
>>
>> Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:
>>
>> > Gigabit Ethernet requires the Ethernet TXD0..3 and RXD0..3 data lines.
>> > Add the missing eth_rxd2 and eth_rxd3 definitions so we don't have to
>> > rely on the bootloader to set them up correctly.
>> >
>> > The vendor u-boot sources for Odroid-C1 use the following Ethernet
>> > pinmux configuration:
>> >   SET_CBUS_REG_MASK(PERIPHS_PIN_MUX_6, 0x3f4f);
>> >   SET_CBUS_REG_MASK(PERIPHS_PIN_MUX_7, 0xf00000);
>> > This translates to the following pin groups in the mainline kernel:
>> > - register 6 bit  0: eth_rxd1 (DIF_0_P)
>> > - register 6 bit  1: eth_rxd0 (DIF_0_N)
>> > - register 6 bit  2: eth_rx_dv (DIF_1_P)
>> > - register 6 bit  3: eth_rx_clk (DIF_1_N)
>> > - register 6 bit  6: eth_tx_en (DIF_3_P)
>> > - register 6 bit  8: eth_ref_clk (DIF_3_N)
>> > - register 6 bit  9: eth_mdc (DIF_4_P)
>> > - register 6 bit 10: eth_mdio_en (DIF_4_N)
>> > - register 6 bit 11: eth_tx_clk (GPIOH_9)
>> > - register 6 bit 12: eth_txd2 (GPIOH_8)
>> > - register 6 bit 13: eth_txd3 (GPIOH_7)
>> > - register 7 bit 20: eth_txd0_0 (GPIOH_6)
>> > - register 7 bit 21: eth_txd1_0 (GPIOH_5)
>> > - register 7 bit 22: eth_rxd3 (DIF_2_P)
>> > - register 7 bit 23: eth_rxd2 (DIF_2_N)
>> >
>> > All functions except eth_rxd2 and eth_rxd3 are already supported by the
>> > pinctrl-meson8b driver.
>> >
>> > Suggested-by: Jianxin Pan <jianxin.pan@amlogic.com>
>> > Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>>
>> Reviewed-by: Kevin Hilman <khilman@baylibre.com>
> thank you for reviewing this!
>
> I just realized that I forgot to CC the linux-gpio mailing list as
> well as Linus Walleij on this patch (fixing that with this mail) -
> sorry for that.
> right now this patch is applied to linux-amlogic.git's v5.1/dt branch.

That was a mistake I rectified earlier today. I meant to only apply the
DT patch not the driver also.

> please let me know whether you would like to keep it in your tree or
> if you would like me to re-send it (including Linus and the linux-gpio
> list this time...)

Please resend including Linus, linux-gpio and my review tag.

Thanks,

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
