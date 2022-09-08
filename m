Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0769C38145
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Sep 2022 08:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZSLKv0fx7UOE1ZPApnQrSsOz0gdQXCv+gmgcld6LtCE=; b=TCfcjX58SmsxOI
	jh/SFlQ0lQdj+w2TUQevm8dZfmX+UkdHFTtWR3zypgIqDi7eTZU8W+5ccN0hpNM7DYgouVCZaFuEq
	LVHoDJnjkn+uxouYPS51btaXdD6vlez0t79MJ+LBS4wkr0e3jJ7p3kwaQSopncdOkDwuFohi1Ufhf
	lrQdK6kiZ0vLTnHyDkFHSU1zBQa0AwM2EdRtka1vjXK2sWs9iaN00d6qE18DT50kfWy/8T97r8nIq
	Ah1PlmXHSHUm7cNlYA+WSroXMyThMLl+2JTEGgnsAFWMLVJf8086xCCXKm0bh9Rm5P3QM9WPLJ/hD
	v5Uq6bA7SKV/oEsCNcyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWD1H-0014NA-FJ; Thu, 08 Sep 2022 08:36:19 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWD11-0014FZ-Fo
	for linux-amlogic@lists.infradead.org; Thu, 08 Sep 2022 08:36:05 +0000
Received: by mail-ej1-x62d.google.com with SMTP id gb36so36305435ejc.10
        for <linux-amlogic@lists.infradead.org>; Thu, 08 Sep 2022 01:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=OUaGQ6uHB2+dXwiGE5+SddWRClVepXq6e8KWvsAWyP4=;
        b=PiSCA7ypGDZI4XkBQF4UUIrgN/BP8oLsZwNWQH3bREqrgToKcIfdN/4ceZWHNLX9HK
         rVIWS2yjw+/aFNVQbBzn1FYDtaG3vgt0tiXQA2Fn1IdezJ+5CLJE88Cmi5pU9OIqv3XW
         K6rEiwChBEFImck1k1N6huDaunHr//2mluYWC7h+FMLFlByC1e+KLFTuoXaNON+jhxv4
         0cUx+bC9K7rJeLzRu54byKrreiJGOguyXhprTDst7OGXMKW+XuMjE8P6nGQHBN2nPWhX
         haEj6ir5R6vNC763uquwTMEHlT5yf7VWTnUFoK88Qi5ym6SMg8uYx+7ElB20RkTZqzkV
         tbFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=OUaGQ6uHB2+dXwiGE5+SddWRClVepXq6e8KWvsAWyP4=;
        b=3ioQc0j2WF8ck07/2ZI9Fx+cG2FRxLYb9HvO1RjFzfSyFOu7AQzLi75TxVeBIRUVQo
         pDtIS9oYVBGpCFq2mPnjvCEmGSrnIQD7KB0AiRny9T703Z/m5RB4+u+8woHENL8hBOqF
         rjtxpOFVfdh3VNsj/hyZYA8rxKFciRQQOsQg8mfzPyXSTWD5auKc66o+b9PCbK3uRabD
         Dok4ehf6NoMYtJz360f0dTkt/f3lHETF426W5Qnr3GcrR2EPh6+q0Npz3YEo6eVBH6qE
         PbU95deMDuStCHjh9L0qT2eimiGJzBHOwJrWTJ3ESIrfdUGPaGqRV2dcsroheFuuL/KN
         +/4A==
X-Gm-Message-State: ACgBeo3af51K16zjrnJAR7w/FuVXXNQYlhStrXq9GPaGQr2TEL3OHlwh
	22kjSbrDbSvG0mZqiAOHKtoM6tMaTTZHOO6n/PctpQ==
X-Google-Smtp-Source: AA6agR4v7NBtPCgQRzAi/ZTCyJl7YFqTNxvR+MInAejEIuCw6PFGA+JstRAz6Wl6A39KNFiN9NMu9qm0UxdfUIKShNo=
X-Received: by 2002:a17:907:7242:b0:741:770b:dfc6 with SMTP id
 ds2-20020a170907724200b00741770bdfc6mr5241555ejc.203.1662626161400; Thu, 08
 Sep 2022 01:36:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220905180034.73132-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20220905180034.73132-1-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 8 Sep 2022 10:35:50 +0200
Message-ID: <CACRpkdYW+ZnR9tP5UyUYxQ+CYNYDvMqrbV4g8sOQAVqS1zCLkg@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] pinctrl: meson: Switch to use fwnode instead of of_node
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_013603_539082_FD7D6CDD 
X-CRM114-Status: UNSURE (   8.85  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
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

On Mon, Sep 5, 2022 at 8:00 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> GPIO library now accepts fwnode as a firmware node, so
> switch the driver to use it.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Patch applied.

Yours,
Linus Walleij

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
