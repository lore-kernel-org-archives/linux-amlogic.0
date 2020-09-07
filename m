Return-Path: <SRS0=IdmP=CQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E4AFC433E2
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Sep 2020 08:31:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 88FAC2145D
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Sep 2020 08:30:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="I3xo2zoH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="hDYe3/X1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 88FAC2145D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:Message-ID:Date:In-reply-to:Subject:To:From:References:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AGN52MNs8XHgVd0KN0Qnt3HrRTnc9D7LZiAztayWxbg=; b=I3xo2zoHmQVEVrxPbe11I1eKfU
	NFlh41B/qkN6apqPW2K56J7+0jSuWJsI2Bp1JGCumA3uNaRqnZUfhi8aoQM9UE7gGO7Wk9nEP7XpQ
	uf7jOLyeXTPr/Sw7eigkO6MT8Sxvwx8bhHp9Yk+vjC6fsHKSDfbJvzuOo7hZ5gi59pLz45QKk1qLP
	r7/2YL6jcC7qnI8Oi3wSAA9RBV1QuVaH3UNwTzSmdolE663g7GKXSP7Szr/WM4DKlZQrWUinvnB35
	j7Zc8Wqv72Lgzfmiwl+FwWy95xGzVcPno/JMa7Ng681RHmjGJ/ewODLJ5v8cWH86M57hKoCDWGp8t
	EWhmKmfQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFCY8-0002sz-Ca; Mon, 07 Sep 2020 08:30:52 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFCY2-0002qL-Aa
 for linux-amlogic@lists.infradead.org; Mon, 07 Sep 2020 08:30:48 +0000
Received: by mail-wr1-x441.google.com with SMTP id m6so14869995wrn.0
 for <linux-amlogic@lists.infradead.org>; Mon, 07 Sep 2020 01:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:subject:in-reply-to:date:message-id
 :mime-version; bh=nxwjXtCfzhbJphkRoaZPGRX8lSLuG3IRQbDMiVfMlTw=;
 b=hDYe3/X1Fp/nkA8cq5LKQEuabNxEiXDOUvZ6woI5zrDtV/o7pIJt3+dMMm+9HY2TUp
 cJLd1Ak+4UWRcYyvT80mTkYj6NBmFbmk6wB+qnPxWUc1KaSG9Qn2t56LtE+VGh2qiVzv
 9JuYo9Vx8HM3XBkFaq+ij9ZViBAHur8hlIbyrkyKrJ7qClw66Dqhb2jwIu0SC9QJzrdf
 gUGdUHALqoOY+mnDt2IsTPU1QvekYjKaGug1Vdp44Er/RQqCawCgaUylXU1NoaEZKpVP
 zru4e1SdyZCGOVqvjSWFeF95bi3nh2JfDYBl6ExDbqti5ZIjKFPpjuuV0LG1Bi9HubrM
 sD+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:subject
 :in-reply-to:date:message-id:mime-version;
 bh=nxwjXtCfzhbJphkRoaZPGRX8lSLuG3IRQbDMiVfMlTw=;
 b=N7zZMZGTkMtBSzzAtffu4/2fGiQt5eWIF/RiHBU1HyJ9Y063v4Lnh7b0wm87ed4zNf
 7G8g3v/pc/X0stL9v5oNGlrGAid87XSZuPTgWltO/Y8IKG56cXeOiuyYsX9o9weW0pod
 OLQj2qiomho3LcYv4Qx2aS1zbn3a384dPrJmIao/lJanuvXsMj3CLhMGv7mr5VYsAfPs
 6FWdeNt7eo8WBZYepDQef86BJ5i9Kq1URgKWtmKl9R3MEgLFTMtgzAYHS4MCJFJvkV/i
 +WGz9eqtmMv5hWJR7D9vskeJJqgjHQ9uGYkzbnMYsxNEMGBXMeq6HGpCOgtCqonmmw28
 /ltg==
X-Gm-Message-State: AOAM531eog2UzgNRoEZs7UpqmJvmH4yDswgw7Cm0qWbThQiwZcxZ+6/1
 XcQaGUecV9mBbNaFyLbBtjS/Mw==
X-Google-Smtp-Source: ABdhPJzSdXOEuAZoMyzc+6+YubqhNb8xreJ4au8coroTpf3gvY2rMuV8IzBk2Sy9KwE1J2Tz416CKA==
X-Received: by 2002:a5d:4591:: with SMTP id p17mr20049982wrq.408.1599467443488; 
 Mon, 07 Sep 2020 01:30:43 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id q18sm27461214wre.78.2020.09.07.01.30.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2020 01:30:42 -0700 (PDT)
References: <20200902150348.14465-1-krzk@kernel.org>
 <20200902150348.14465-7-krzk@kernel.org>
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 David Lechner <david@lechnology.com>, Sekhar Nori <nsekhar@ti.com>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 07/10] clk: meson: Simplify with dev_err_probe()
In-reply-to: <20200902150348.14465-7-krzk@kernel.org>
Date: Mon, 07 Sep 2020 10:30:42 +0200
Message-ID: <1jsgbuaszx.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200907_043046_489755_4ADE4B4C 
X-CRM114-Status: GOOD (  16.30  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Wed 02 Sep 2020 at 17:03, Krzysztof Kozlowski <krzk@kernel.org> wrote:

> Common pattern of handling deferred probe can be simplified with
> dev_err_probe().  Less code and the error value gets printed.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Acked-by: Jerome Brunet <jbrunet@baylibre.com>

> ---
>  drivers/clk/meson/axg-audio.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/clk/meson/axg-audio.c b/drivers/clk/meson/axg-audio.c
> index 53715e36326c..dc22b0c45743 100644
> --- a/drivers/clk/meson/axg-audio.c
> +++ b/drivers/clk/meson/axg-audio.c
> @@ -1509,12 +1509,8 @@ static int devm_clk_get_enable(struct device *dev, char *id)
>  	int ret;
>  
>  	clk = devm_clk_get(dev, id);
> -	if (IS_ERR(clk)) {
> -		ret = PTR_ERR(clk);
> -		if (ret != -EPROBE_DEFER)
> -			dev_err(dev, "failed to get %s", id);
> -		return ret;
> -	}
> +	if (IS_ERR(clk))
> +		return dev_err_probe(dev, PTR_ERR(clk), "failed to get %s", id);
>  
>  	ret = clk_prepare_enable(clk);
>  	if (ret) {


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
