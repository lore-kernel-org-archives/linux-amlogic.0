Return-Path: <SRS0=Om+1=PH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA586C43387
	for <linux-amlogic@archiver.kernel.org>; Sun, 30 Dec 2018 19:55:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ADC112070D
	for <linux-amlogic@archiver.kernel.org>; Sun, 30 Dec 2018 19:55:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fHx56fmz";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linaro.org header.i=@linaro.org header.b="Jljtcpvv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ADC112070D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q/IPdkFRhl2YvdP7QYB3j3fNv/jGl6aIGcXAXi9e2to=; b=fHx56fmz1Nyr/t
	CaEaL26qn3IqlW2VZXiT8pdRJY+nPek4m40EG0YFsCNdDqTqn1zguF9YsTxP3ABVZaKOW1kiB2y60
	aLcLx2qVOy+rCxotXjJFMcTXK0Jcn1KBsk57JZxY5rNa5PmhYStW9zWbFzLQ7EoF1ZUzI4mwmUJgI
	vIvfpypQkDWnTJFyAzJXeJor8r6K83LQun/wf5IEaHh/22QZGSbAjAHqxri8l8sbnZABI2iCdojiQ
	Uj/MIUT9+kr/IjnLYI0NUScINQLmuKq+kmq5kKuggNSrxH/wdmxAKPa5ahhxvunvNmdZTzHDziYb/
	QXw9rSNl0AdQnqIX9FdA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gdhAo-0007Rh-8c; Sun, 30 Dec 2018 19:54:58 +0000
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gdhAl-0007MG-1f
 for linux-amlogic@lists.infradead.org; Sun, 30 Dec 2018 19:54:56 +0000
Received: by mail-lj1-x243.google.com with SMTP id t18-v6so22473749ljd.4
 for <linux-amlogic@lists.infradead.org>; Sun, 30 Dec 2018 11:54:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aYtSk6UmrVbeFiJrPCWrDNJtF//zE/XhWTWZsfzZlr0=;
 b=JljtcpvvjvfZsyE41qtX+X1tW/+yg99c4/1+k84FYtW9k7CskCsttxkAjewQKzhwg3
 76je7ajEx5nc1J2d/WTVnZkuHRQICDO0Yzrd8D1mqevOpSAhpj03OrwwRiksZeryK6vc
 AyWwTLAJowftNyr1BxoGbNQt3nzuPyOXE1mic=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aYtSk6UmrVbeFiJrPCWrDNJtF//zE/XhWTWZsfzZlr0=;
 b=CC3dVo1xyuti0tIFAfnptGpyjq6XjJ7hooCVhRekSEF+U/SdJLk/0Z5/hQCo33toDY
 jbZ+E25pdyjEbLwIRj4uW1pBToocoKn8D7yBm9YfpWkE/4Hidqi0qDoEUWT9W3/LN+Ls
 G4y8MYYEVw/3g/PCct4X4st5U2IXhUHlyHFk/oKohOo0ZhwRUd98mBNxrHgBvlMvyi7j
 u9yq9hIE6ogS7mL5o9Ua3fqu1QgubQ5IGSxMlR9wePkf3LFFhDGlijiJSmwxD0EQprnS
 DApMV2KDYr04obx2HRYWkU7bIDvavagBq6UddaJToQNb+1jMzg41L35+iVaQWB10it/R
 vBjw==
X-Gm-Message-State: AJcUukcwPvY8Tfn9vsYlH2juXTdrxLxt47NN0PTi+RnDrqiZWXcQI5It
 JzQtY8WcuXSZLSnfig0B7955V5+tVu0A5N8NMcMiLQ==
X-Google-Smtp-Source: ALg8bN5rAd2E7nHQaFoEWAqqQx+/TmpYhhPdSZKd7GYiQQ+ISJS4dPPsG5gktd5lvzYxEjI2VJkCIOPNWb5H2puplv0=
X-Received: by 2002:a2e:7e04:: with SMTP id
 z4-v6mr19207070ljc.97.1546199683181; 
 Sun, 30 Dec 2018 11:54:43 -0800 (PST)
MIME-Version: 1.0
References: <20181229125711.5205-1-martin.blumenstingl@googlemail.com>
 <20181229125711.5205-3-martin.blumenstingl@googlemail.com>
In-Reply-To: <20181229125711.5205-3-martin.blumenstingl@googlemail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 30 Dec 2018 20:54:31 +0100
Message-ID: <CACRpkdYQLvCEvNaA_O2SP4VXh7Lp7sD31wOBD9ZDoZwx3c+ZuQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] ARM: dts: meson8b: ec100: mark the SD card detection
 GPIO active-low
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181230_115455_087286_71CFFCE0 
X-CRM114-Status: GOOD (  10.72  )
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
Cc: linus.luessing@c0d3.blue, Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 balbes-150@yandex.ru, Kevin Hilman <khilman@baylibre.com>,
 linux-mmc <linux-mmc@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Guenter Roeck <linux@roeck-us.net>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sat, Dec 29, 2018 at 1:57 PM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:

> After commit 89a5e15bcba87d ("gpio/mmc/of: Respect polarity in the device
> tree") SD cards are not detected anymore.
>
> The CD GPIO is "active low" on the EC-100. The MMC dt-bindings specify:
> "[...] using the "cd-inverted" property means, that the CD line is active
> high, i.e. it is high, when a card is inserted".
>
> Fix the description of the SD card by marking it as GPIO_ACTIVE_LOW and
> drop the "cd-inverted" property. This makes the definition consistent
> with the existing dt-bindings and fixes the check whether an SD card is
> inserted.
>
> Fixes: bbedc1f1d90e33 ("ARM: dts: meson8b: Add support for the Endless Mini (EC-100)")
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
