Return-Path: <SRS0=Jj0Y=VW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F29AAC7618B
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 Jul 2019 14:41:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C565520644
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 Jul 2019 14:41:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NvUtzUGL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Ury/kvRj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C565520644
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2GDED6kWtnti96FI0DEqb8pVgOM7IXAAZf226o8T2ec=; b=NvUtzUGLZsTkir
	sIainVmWEzpUr6bA7AE0OHu72irKLh1Nt8Al49kjHuAlD2eaIULwE3NBEhrSGXrPnSBUKfu/jiMo2
	nl96OBPUa4LtET/BFobOJa3PGM41z3kXlyQcXY71zV2Cm6NYZX4s5mhy4SnzxPx0/+BTU5aNS6Fpk
	tcUOcM8wewnVqRXA5E3H+ctlHaUvsP9TFNkotMBT89pCt6BVn0aDdK3UOrwPyNzkvUeN78qW2XSUY
	XL/D7J0Qep1Kambb6ZNU9tUaNy3JZKIFtpAFD9fgamO+vlkLda80Ht3pOny5apJaTDxP3JW8JZqwP
	/JI8syoLVsUs/nZ4a1kg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hqevp-0003Cd-Qg; Thu, 25 Jul 2019 14:41:21 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hqevm-0003C3-SZ
 for linux-amlogic@lists.infradead.org; Thu, 25 Jul 2019 14:41:20 +0000
Received: by mail-wr1-x443.google.com with SMTP id 31so51123347wrm.1
 for <linux-amlogic@lists.infradead.org>; Thu, 25 Jul 2019 07:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=afaFQV2+gmSxhIryTqlJume5dpsRUmNQp36xGyN5C8c=;
 b=Ury/kvRj+NiTLXBSM04pVrmFHM/wLxt6u/rgc/s5fuHi96rbi2u3sokiMds9/2p9vy
 kKNRDRgjlu9jCbJsEO1aD3mvta0FkTmy0YPyqb9rnbwzDSACsGZoWZDIAbwJFo1YBn8P
 YQ9MQXCXdW87VxyXUUk4wWZtXe6nMrXFSjsH+C73aDNT2pEft53bo1xCeON8XAazNq4V
 P58r7dQwNCCrs2/F6/1zD7ggMNcElPZT0wmDS4w19b/Z8H8eO9tEI6y17cwcjl7rf9nI
 COcPtjo0VIxFgwKJyYoHDmEZOMMnWSYcYfXnZAnhiLIpxVEzxBulGfurwIC1vTS2nNJ0
 jjDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=afaFQV2+gmSxhIryTqlJume5dpsRUmNQp36xGyN5C8c=;
 b=k8W8Q5J2fu1l/O8J3BHsbC45HQzAdZR090mqFFe8UM8Syagl7DAoIiQNakAaXvaO6L
 Utf1ncEguKRGrtDptn/xokSnEoinAm17NYXZ5TvvysSUxMQ8kY9iYsmU9rKnu+Qj+4+4
 9fDEG87pLaPyLGL27TjfZ8Y5me8629nIOOfw3PWNfytw3qe1BYSvblhBMdqyH+RVXbpK
 Uc6pi9XTJ3u7Yvfo4rume2nf5yNjon/dIwOhx69cTZXFi2eIoN+9Yh87ZO/eNsuw8hcr
 5G13hksVxHJJEWgZjuv8yKKky0O/yVoPQzgyKCjAz9NqM+QIeu7vabSsJsJWN/ucC/A4
 zYTg==
X-Gm-Message-State: APjAAAWvHp0YdS1+pyAcB/3YQQh+UGalof0vdKeOycNbHIQujsksNOQl
 g2YOcV5b4C9KMdwHlI3KOor9sg==
X-Google-Smtp-Source: APXvYqy2GHFBySWKMfAzGAvRpQ7QBGKW3FV/iX32ZBFt+sohr5Tc9Rcu6r1RKs+nXquFhZPtzZjVWg==
X-Received: by 2002:adf:afe7:: with SMTP id y39mr92710271wrd.350.1564065677169; 
 Thu, 25 Jul 2019 07:41:17 -0700 (PDT)
Received: from localhost (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id a2sm50055474wmj.9.2019.07.25.07.41.16
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 25 Jul 2019 07:41:16 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Alexandre Mergnat <amergnat@baylibre.com>
Subject: Re: [PATCH 2/4] clk: meson: gxbb-aoclk: migrate to the new parent
 description method
In-Reply-To: <20190722095053.14104-3-amergnat@baylibre.com>
References: <20190722095053.14104-1-amergnat@baylibre.com>
 <20190722095053.14104-3-amergnat@baylibre.com>
Date: Thu, 25 Jul 2019 16:41:15 +0200
Message-ID: <1ja7d2xjlg.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190725_074118_925459_5B104CBF 
X-CRM114-Status: UNSURE (   6.38  )
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
Cc: narmstrong@baylibre.com, sboyd@kernel.org, khilman@baylibre.com,
 Alexandre Mergnat <amergnat@baylibre.com>, linux-kernel@vger.kernel.org,
 baylibre-upstreaming@groups.io, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon 22 Jul 2019 at 11:50, Alexandre Mergnat <amergnat@baylibre.com> wrote:

> @@ -208,8 +216,10 @@ static struct clk_regmap ao_cts_cec = {
>  		 * Until CCF gets fixed, adding this fake parent that won't
>  		 * ever be registered should work around the problem
>  		 */
> -		.parent_names = (const char *[]){ "fixme",
> -						  "ao_cts_rtc_oscin" },
> +		.parent_data = (const struct clk_parent_data []) {
> +			{ .fw_name = "fixme", },

Hum, that would work I suppose but I'd prefer if used .name for this
work around. Remember to throw an '.index = -1' as well

> +			{ .hw = &ao_cts_rtc_oscin.hw },
> +		},
>  		.num_parents = 2,
>  		.flags = CLK_SET_RATE_PARENT,
>  	},

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
