Return-Path: <SRS0=DVbv=PT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E17DFC43387
	for <linux-amlogic@archiver.kernel.org>; Fri, 11 Jan 2019 01:09:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B1B65206B7
	for <linux-amlogic@archiver.kernel.org>; Fri, 11 Jan 2019 01:09:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TiEvW53T";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="T9MnGTy8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B1B65206B7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7a7blohp+VKy8uvO8/Ss0aDU+KZfRUk8dAUqvK/dMBQ=; b=TiEvW53T1DqYga
	SZJMCSTvFO9T8HEel6tFTalMZCwNSlY/H1MTROPj+muaqcPRu+dLUTqskyn0iN9OR3Z4gRV5kF+F+
	caX5p8nNpj8m71ZRIQSzv11+D38dLU526AiFun/NlfR+lgOcZXSjSNzbB2Ng++LofsbGEoVTnGlS7
	+JXd8sG6U3yI40/H9XDL+HXeoqHZyeuBYC+6N7InurD0rRWTG6LhmVD5nhgWI8ea2iRbut5YOVoyg
	3QGx3lvjoMtVaa7Tzky4XLJIlGAAiQGGqkLx0OpzFnJ/l6li7dwDCc/Yv7EjtHSi/ejDflpM/uTQY
	VifaW2vkQdfwxpTZuCSg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ghlJf-0000tj-Hi; Fri, 11 Jan 2019 01:08:55 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ghlJS-0000jY-8L
 for linux-amlogic@lists.infradead.org; Fri, 11 Jan 2019 01:08:44 +0000
Received: by mail-pg1-x542.google.com with SMTP id c25so5573803pgb.4
 for <linux-amlogic@lists.infradead.org>; Thu, 10 Jan 2019 17:08:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=omrSHaakBQsbB/LnK/odyGqedPA1JQ5CHxOtSmQjaSM=;
 b=T9MnGTy86PSj5UBUcPp0+N51sjWgrXoqoF74bex/td21khwS/dl9JyPRVkrD66f5gy
 WtFHsk2YymEmQDkDbzPhv56dn+J7W9+GHW8dpRVN4b+kmWxs4u2xMgjtkq0OeTrDxXql
 5k8EriKk+Uiswwl/fbSv0cFoAqTCHtfjeEChVncbtaV7RbY5yJ7xSt7o99NKc7Kxhdpf
 a3yp6Oa9N3mNmZp1bh7qnIIUYXJE/rDtpYgJi8QPuDaEUBTg6DJtaMWT5Y0pVud5OEoa
 QquaCM5zLhWcxNgf0615Lbh+EM2iwv5kthwQKWj1B9IviBYQ5Rs/qGL8mTzIiIVPWs3W
 WY0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=omrSHaakBQsbB/LnK/odyGqedPA1JQ5CHxOtSmQjaSM=;
 b=mhME9mED9UgGycZ8SaPybaHpsmAFONEvd+1kVYckAtGhBwPnVexXp+/XtrLjtY7rrs
 dshgrHuR1ldvJCCtcSEqKauynZT4mwt5W4pU5iixfK3JLSTe89kZNXbsgnglDwNPiCKT
 zMtA5fmmrcyQ+ik1yEp9MNGzpRnnS7XNKR0XfUXoi7AikyN15wOo4N8E/fW7uE2A3Rx5
 Oobpe+YwioAW3xrUVT5SBiHpHe267oAmYxiiAbuEtwNcPadv3NyDeJSPU7bxzgY5I/gy
 Vtd5bkHgQbHezSM8jT2CEieoEsrknYxwNkLjDtfoa/Dxw+qrDl0bqpyhFjcio/rjyagV
 u3ig==
X-Gm-Message-State: AJcUukfd5beUVAgeZpUIFbLzYlV0stKAHwZ6I1b0nb3CDHYnraFhRKn5
 JNv3VirMAW9cY1pRdQRDc3c3lQ==
X-Google-Smtp-Source: ALg8bN7y5nklKnLRrC6ybdW9uVJhfNg8m94rfFRfrMPJmZGg8SM+7AnoRW/ZaTeADy763CZDABqIvw==
X-Received: by 2002:a63:1f1c:: with SMTP id f28mr11529925pgf.193.1547168921043; 
 Thu, 10 Jan 2019 17:08:41 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152]) by smtp.googlemail.com with ESMTPSA id
 196sm303711824pfc.77.2019.01.10.17.08.40
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 10 Jan 2019 17:08:40 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, ingrassia@epigenesys.com
Subject: Re: [PATCH v3 1/2] pinctrl: meson: meson8b: add the eth_rxd2 and
 eth_rxd3 pins
In-Reply-To: <20181229143556.27339-2-martin.blumenstingl@googlemail.com>
References: <20181229143556.27339-1-martin.blumenstingl@googlemail.com>
 <20181229143556.27339-2-martin.blumenstingl@googlemail.com>
Date: Thu, 10 Jan 2019 17:08:39 -0800
Message-ID: <7hzhs8ovag.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190110_170842_299397_928E46F2 
X-CRM114-Status: UNSURE (   8.44  )
X-CRM114-Notice: Please train this message.
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-kernel@lists.infradead.org, jianxin.pan@amlogic.com,
 linus.luessing@c0d3.blue
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:

> Gigabit Ethernet requires the Ethernet TXD0..3 and RXD0..3 data lines.
> Add the missing eth_rxd2 and eth_rxd3 definitions so we don't have to
> rely on the bootloader to set them up correctly.
>
> The vendor u-boot sources for Odroid-C1 use the following Ethernet
> pinmux configuration:
>   SET_CBUS_REG_MASK(PERIPHS_PIN_MUX_6, 0x3f4f);
>   SET_CBUS_REG_MASK(PERIPHS_PIN_MUX_7, 0xf00000);
> This translates to the following pin groups in the mainline kernel:
> - register 6 bit  0: eth_rxd1 (DIF_0_P)
> - register 6 bit  1: eth_rxd0 (DIF_0_N)
> - register 6 bit  2: eth_rx_dv (DIF_1_P)
> - register 6 bit  3: eth_rx_clk (DIF_1_N)
> - register 6 bit  6: eth_tx_en (DIF_3_P)
> - register 6 bit  8: eth_ref_clk (DIF_3_N)
> - register 6 bit  9: eth_mdc (DIF_4_P)
> - register 6 bit 10: eth_mdio_en (DIF_4_N)
> - register 6 bit 11: eth_tx_clk (GPIOH_9)
> - register 6 bit 12: eth_txd2 (GPIOH_8)
> - register 6 bit 13: eth_txd3 (GPIOH_7)
> - register 7 bit 20: eth_txd0_0 (GPIOH_6)
> - register 7 bit 21: eth_txd1_0 (GPIOH_5)
> - register 7 bit 22: eth_rxd3 (DIF_2_P)
> - register 7 bit 23: eth_rxd2 (DIF_2_N)
>
> All functions except eth_rxd2 and eth_rxd3 are already supported by the
> pinctrl-meson8b driver.
>
> Suggested-by: Jianxin Pan <jianxin.pan@amlogic.com>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Reviewed-by: Kevin Hilman <khilman@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
