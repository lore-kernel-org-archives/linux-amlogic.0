Return-Path: <SRS0=yXyy=WL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BB12C3A589
	for <linux-amlogic@archiver.kernel.org>; Thu, 15 Aug 2019 21:20:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED2772083B
	for <linux-amlogic@archiver.kernel.org>; Thu, 15 Aug 2019 21:20:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bLNmNV6M";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="ldOQ1g85"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED2772083B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lYY3jG5W6yqGT+Xt25c5LI4jykzCAYnKfWkVK0mm7sw=; b=bLNmNV6MMsnY8E
	D331u7Mt3RfINarIuXrSmzCcvfquASkxFGywZy7UuFk7AsgnxVuEBdck3I8ViTJlL/bj7ygmerds/
	n2znnT7dJkA/k2YxJrHIT89I4DP/l6X6L4zPFTpeKxB/RpGRlgMW5blOfxZEiSBbXDGUlttpKPJfT
	ItAp5GAx2HmyljWhbJIpow20aFlBgfk9KU33VB1QCh/4sQutVGj3GyYj5AmwQxNUqIrSBjR5WzTK6
	XFn0qUystQO+d3ijQ44WCsxAbqn65TwnttPYq47V9wIzeTiEnkWLoh3LHvDD6I2QTtXOx3yetJXdt
	KEhxjFvB19yxm0wCY9UQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hyNAZ-0005bz-Qw; Thu, 15 Aug 2019 21:20:28 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hyNAH-0005Rk-Um
 for linux-amlogic@lists.infradead.org; Thu, 15 Aug 2019 21:20:11 +0000
Received: by mail-pg1-x542.google.com with SMTP id m3so1247090pgv.13
 for <linux-amlogic@lists.infradead.org>; Thu, 15 Aug 2019 14:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=9btH7gObuB7NSQ1wmgbhVZL9CQC9MoVtAlUTgmdlp/M=;
 b=ldOQ1g85IZyn6tEYhDDDtoDQkL5oBt1ZjAFMcZGTsaB7jPGcdGzXIak3YLLZaTR0c8
 qyOas6sL+nx6Bo4hMFou+zcTNTEyIkvEgzdUyR+Tz8+g8VWDmT63g4ErRX971OaPAEOu
 LNTOuzynSiCWRzi4OWMXx//YvU1rCchuwhVAiI4HE3gPmqYVWfDuhDBrq8dSZvafE2VW
 EB5z1lE6MyIhBvHUTIjDm6sUY5s7Qj5cvND4xW7k0oyiTPoRcJPzQ5CGwSo+wvRPAQhX
 zPoirYx3EgGyiqGIoT8sf7B5zYIoTunjTrvVKpNGzhWJbLric8x7VPfldcCljayK+DI+
 iicw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=9btH7gObuB7NSQ1wmgbhVZL9CQC9MoVtAlUTgmdlp/M=;
 b=tauyxOvNqfUwxgMvUrtNitqFWwRufh1YSFAN8ra4+J8CNWPe5yLSz3A1gTXlT5fTSL
 VdzV7sK6xHV4SVHi4dM9ycPSb68kaZHN82CIS4cnd0bgFoEwXd2eAupZ/rZFim9Q20tD
 0BpMQS9kOe4fFmC3J02d3ZsV2LGm5p0aFW74AC7vyov3t4j3dCx/o/2ogjRkofdvZLL5
 zy5bszqzZlQv/9tIdklVH/aHp4hPx91cd9Flw3YQpWSXnXUbEpSf4TW705wFm2LQQy8n
 Pva/9MDvntpIxVUZU6TfUF3hpIAoHW0txPsdbo/tdT9hxjc+t0CkypWmMAZ7Ajl7wyuO
 udmQ==
X-Gm-Message-State: APjAAAVNob192x2aM7ZZr90DZ7ei5i9OFdw7owEC6whOUlXdsU9kSv+h
 PPpOKeSmy/nSDov7RUmvQtZGvw==
X-Google-Smtp-Source: APXvYqwMBqMHkTvOrHQeYUS4WkFo34Kt5c0X1L9kzdWXYp9P9JmoS5s7mD4im0y2s/z3WEE8BbiNWQ==
X-Received: by 2002:a17:90a:858c:: with SMTP id
 m12mr4020145pjn.129.1565904008258; 
 Thu, 15 Aug 2019 14:20:08 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:35:cf9b:bad:702c])
 by smtp.gmail.com with ESMTPSA id y23sm4193386pfr.86.2019.08.15.14.20.07
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 15 Aug 2019 14:20:07 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: robh+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/4] nvmem: meson-efuse: bindings: Add secure-monitor
 phandle
In-Reply-To: <20190731082339.20163-3-ccaione@baylibre.com>
References: <20190731082339.20163-1-ccaione@baylibre.com>
 <20190731082339.20163-3-ccaione@baylibre.com>
Date: Thu, 15 Aug 2019 14:20:06 -0700
Message-ID: <7hk1bew2gp.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190815_142009_989782_4BE7F02C 
X-CRM114-Status: GOOD (  13.48  )
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
Cc: narmstrong@baylibre.com, Carlo Caione <ccaione@baylibre.com>,
 srinivas.kandagatla@linaro.org, linux-amlogic@lists.infradead.org,
 tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Rob,

Carlo Caione <ccaione@baylibre.com> writes:

> Add a new property to link the nvmem driver to the secure-monitor. The
> nvmem driver needs to access the secure-monitor to be able to access the
> fuses.
>
> Signed-off-by: Carlo Caione <ccaione@baylibre.com>
> ---
>  Documentation/devicetree/bindings/nvmem/amlogic-efuse.txt | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/nvmem/amlogic-efuse.txt b/Documentation/devicetree/bindings/nvmem/amlogic-efuse.txt
> index 2e0723ab3384..f7b3ed74db54 100644
> --- a/Documentation/devicetree/bindings/nvmem/amlogic-efuse.txt
> +++ b/Documentation/devicetree/bindings/nvmem/amlogic-efuse.txt
> @@ -4,6 +4,7 @@ Required properties:
>  - compatible: should be "amlogic,meson-gxbb-efuse"
>  - clocks: phandle to the efuse peripheral clock provided by the
>  	  clock controller.
> +- secure-monitor: phandle to the secure-monitor node
>  
>  = Data cells =
>  Are child nodes of eFuse, bindings of which as described in
> @@ -16,6 +17,7 @@ Example:
>  		clocks = <&clkc CLKID_EFUSE>;
>  		#address-cells = <1>;
>  		#size-cells = <1>;
> +		secure-monitor = <&sm>;
>  
>  		sn: sn@14 {
>  			reg = <0x14 0x10>;
> @@ -30,6 +32,10 @@ Example:
>  		};
>  	};
>  
> +	sm: secure-monitor {
> +		compatible = "amlogic,meson-gxbb-sm";
> +	};
> +
>  = Data consumers =
>  Are device nodes which consume nvmem data cells.
>  

With your review/ack, I'll take this through with the driver changes.

Thanks,

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
