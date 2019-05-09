Return-Path: <SRS0=XvYc=TJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F98BC04AB1
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 May 2019 17:35:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D8D36217D8
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 May 2019 17:35:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qqiMvcwT";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="e1POAryf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D8D36217D8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+SgEEWAUKarhsqG7WminNDpEEo1XFj4IE3ToxW9Fd54=; b=qqiMvcwTcIt9/B
	ikeu9wi/b2pVf7xVjs3WzfIZF//+w7ydpj751Vf30dTvCptkExcmiFRQTA8Gdpv9iI1mtk798j92K
	MT7ZuWspT2hOTOqLLHbrFKTBFkS9f4Wkjts+ZG4KX1RbcizxKp8qgjqcQtFQadxDsKTzXw2eoke2+
	rs89Rud/IGmCsfatiAqpxTkwH53HoWH6w91+TQALJV8RZlmKzKzDLmRT4R82iXTC+Zvz4NKhUL6Yy
	j8OaK18i2PVRNhvkkQQlezUuqYkwUuWdBud9a4lwNRHM6GqlD9EjH/x5pmomxPTWi5c4TXXW2n8bA
	/k6wF1FAbDyJHPTqsm+w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hOmwu-000504-0P; Thu, 09 May 2019 17:35:16 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hOmwr-0004zN-8a
 for linux-amlogic@lists.infradead.org; Thu, 09 May 2019 17:35:14 +0000
Received: by mail-pg1-x542.google.com with SMTP id z3so1555450pgp.8
 for <linux-amlogic@lists.infradead.org>; Thu, 09 May 2019 10:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=zX74GvSVOEa3r9Bsv+StbAMT/sdno07qDVSzxK/DkMM=;
 b=e1POAryfWOAkgAo7r+nE7m/OBxAvTUNZneYzdM/CAG/P2iw7nP6MVlZbhlm2mXQNf3
 6pnpb9xETfdJ1oRG94kw4lxgas2VviA3Lt8Z0IOpwQ3f6P/zowtru1v7xUIkLFCDE5Vw
 YWIIu9MwWy0bTxDqZKCXLpioP8lRzzG3U6iH46YK4k73AAjPUobuk1a5zHIMe4SJ0eRV
 dpUSo/mXt6X7t68d2AznkwJqO09clJ50Q7hlIe0Kt18SpWIJ8ogKEapQGigaD+9UbXXb
 m9hL9XvifvxTrI0LSy9pnCA/yRUZXF4hlWX3XRLhTWFg841BJWZs0bdOnxL7yGDZ31oN
 wWsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=zX74GvSVOEa3r9Bsv+StbAMT/sdno07qDVSzxK/DkMM=;
 b=GJHWoA+uXe47E7i7X05sgcIv84D46THbkN89Vc+Etp1JiPhaihwPDGe67CjCN2h70p
 qrPOhvFp7zX665vckxAe9QDEWxzgm+Clhs5gq3QSzWx52YuGMSsP7HRIFMgNuyiLl/VF
 kHjoHJejM3luOHBPbYtTS9viKGmfidarxboubfqp7JO8WsOhp8etA+P9M9zvN/YL6ZxJ
 f8gP9OFPZ7LavgrPhrb21LjJmwgLd5wCbhCumXFE36F/H4RfT4vMv7sdxLs7jIykojWG
 AmYEkOUKU+npKfH35iTx0692LRg0tE8plK4LAhcqg2+u2bPs3mhFwIESA2UHhp0ulO6U
 YbbQ==
X-Gm-Message-State: APjAAAV86jAiE/EQ2gy+MiwKn8grCYDhQwK+h6D2YPQZBwXOsAddhhzw
 EA7EY35i/pI1bCpTuJzr82+qu98AD1stlA==
X-Google-Smtp-Source: APXvYqwS7WimrfI1E3YNXr+sXRr9qBkaFQ0XqpEKS/H76BcklmD6ZZmvCasxKn1QPxA/n0YZ3uRJOQ==
X-Received: by 2002:a63:ba5a:: with SMTP id l26mr7236440pgu.183.1557423312287; 
 Thu, 09 May 2019 10:35:12 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:7849:6889:3e03:e97c])
 by smtp.googlemail.com with ESMTPSA id j32sm3288300pgi.73.2019.05.09.10.35.11
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 09 May 2019 10:35:11 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Guillaume La Roque <glaroque@baylibre.com>, linus.walleij@linaro.org
Subject: Re: [PATCH v4 1/6] dt-bindings: pinctrl: add a
 'drive-strength-microamp' property
In-Reply-To: <20190509162920.7054-2-glaroque@baylibre.com>
References: <20190509162920.7054-1-glaroque@baylibre.com>
 <20190509162920.7054-2-glaroque@baylibre.com>
Date: Thu, 09 May 2019 10:35:11 -0700
Message-ID: <7hzhnvfs4w.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190509_103513_306206_20583D7F 
X-CRM114-Status: GOOD (  11.00  )
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
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Guillaume La Roque <glaroque@baylibre.com> writes:

> This property allow drive-strength parameter in uA instead of mA.
>
> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
> ---
>  Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
> index cef2b5855d60..84adce9f2a75 100644
> --- a/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
> @@ -258,6 +258,7 @@ drive-push-pull		- drive actively high and low
>  drive-open-drain	- drive with open drain
>  drive-open-source	- drive with open source
>  drive-strength		- sink or source at most X mA
> +drive-strength-microamp	- sink or source at most X uA
>  input-enable		- enable input on pin (no effect on output, such as
>  			  enabling an input buffer)
>  input-disable		- disable input on pin (no effect on output, such as
> @@ -326,6 +327,8 @@ arguments are described below.
>  
>  - drive-strength takes as argument the target strength in mA.
>  
> +- drive-strength-uA takes as argument the target strength in uA.

s/uA/microamp/


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
