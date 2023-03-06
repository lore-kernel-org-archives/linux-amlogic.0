Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21DCEC678D4
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Mar 2023 13:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hPBDLUG3yiCtrdN9E+psGPZ52CUCnRgSQnvATXZL+OY=; b=0yCp+BZZR8N4af
	sT5WCpspEgZEakmg+I82+32iMVG7xyRFljqbeTazFASh4BlGH2/LgOtAzSJ2745XSzoXNoFAUWPph
	+zvTBrWd/WH2cmRjkoEDR8/vApQwVBluwob/ifPhX/S28eRaQQvKMKmqn9j130PWQ6YQpBH7Eh8fn
	Te5QzfDKqjPuZ10YpQ5wWd+nwrGIrrkCkge/aRrDSBILDVHZ9qQgnh5fN4aMUIT+82lBP6cikvLha
	YRiivbylWcS3uIYLW+wI4UvEAcQ98BwCX62qR++6ammuNr+Vzm5tqwaUtxf8v8U2EYju2GLI0bwgl
	bXnyDXaM5eWIYhKp+B2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZBAK-00Cxsy-7S; Mon, 06 Mar 2023 13:46:12 +0000
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZBA1-00CxkH-Me
	for linux-amlogic@lists.infradead.org; Mon, 06 Mar 2023 13:46:00 +0000
Received: by mail-yb1-xb30.google.com with SMTP id c80so1143442ybf.5
        for <linux-amlogic@lists.infradead.org>; Mon, 06 Mar 2023 05:45:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678110351;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZFIbx50TOAGdusihLynH+ae6XYzZvYwEgeedQokViGg=;
        b=fOwimeAvFap0D1nJ4fRL/t/XFIqYbLk6E2TjJZhuqZ7QV5/u+mnJ5+1dulmMyELHdY
         XS7Gy32QSSGjFo6M4C6VIsagaVPJh4ZfsCsJywBqKDKrW+WF/hgJB1bAtuXMWW5LM2X1
         ij55xg+RX5QmRul/7fZIk+pAT72rl+YJJV9vPZTkGLC2jtn/D3SDRhLpnp584+CuzE0C
         Sej1CC+LaWJyeLpr7HMiyuCQL/KM9NOwlymzz3QO/AzAAsebchYCopVjjjsuTbkHB5Ei
         CqPH1xteZIfWSMZQJ3nIpm9XsWcBqU7Sp0badquFUs0pD/wpwhRW9ZHHas824EgET5J1
         VYWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678110351;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZFIbx50TOAGdusihLynH+ae6XYzZvYwEgeedQokViGg=;
        b=5UF5Mx3/7+nRPOPYT6BNG2kvtsrYOQBBMXb0/uu4JdYHnw42yAOeboPWnoYRtOxPYY
         xQPJabJdNLHQ77XcVXGul8CJFo8Brh1oHaadfjFonc/M25qO5/Kysc49VG2b41Xl09Jm
         ddDlj6krpgD1sP29ON/mgqWgOXO4PHlf8XHpzS0Tb4czBnWbX1zWAzwBuebYLZ4Ywctk
         21ZyH3sytZbMuuRKGOThRa2O7CHqZz5PnmGkdroa0HhF3vsYqkVRVlMazgux/maWHAfQ
         3T60atsEesjSwibvN6Qbus/hxKEO4eE4VmVBd+Okm88ChX1wOCjxzW6Hbl/lpbvIO/QD
         aBaw==
X-Gm-Message-State: AO0yUKVctOD2siTaOz29j0IK3LCxTLWkf5XlRV7i2P8dpfBK6bPhW3r2
	VbZEoE2hHGTPy4r36mrdsv14hblaowQxk0vAN9Wusg==
X-Google-Smtp-Source: AK7set+ajV0Y/vEoRv05zU+DieyfXzWUrA2TqJ74hoKUUvOh0iDfOBK7W4aTQ1ilVZx9eCSHsyDwVi9JVzBmfW8VvDY=
X-Received: by 2002:a5b:38a:0:b0:ac9:cb97:bd0e with SMTP id
 k10-20020a5b038a000000b00ac9cb97bd0emr4956436ybp.5.1678110350935; Mon, 06 Mar
 2023 05:45:50 -0800 (PST)
MIME-Version: 1.0
References: <20230222115020.55867-1-avromanov@sberdevices.ru> <20230222115020.55867-2-avromanov@sberdevices.ru>
In-Reply-To: <20230222115020.55867-2-avromanov@sberdevices.ru>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 6 Mar 2023 14:45:39 +0100
Message-ID: <CACRpkdbWubk3A3qYuYqDc4OBGP6T7TaKwFeW17CwAzPvttk=WQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] meson: pinctrl: use CONFIG_PINCTRL_A1 with CONFIG_ARM
To: Alexey Romanov <avromanov@sberdevices.ru>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com, 
	martin.blumenstingl@googlemail.com, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kernel@sberdevices.ru
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_054553_779139_66C66D65 
X-CRM114-Status: UNSURE (   6.68  )
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

On Wed, Feb 22, 2023 at 12:50 PM Alexey Romanov
<avromanov@sberdevices.ru> wrote:

> Tested A1 pinctrl support for ARM and it works.
>
> Signed-off-by: Alexey Romanov <avromanov@sberdevices.ru>

This patch applied to the pinctrl tree for v6.4.

Have you considered also adding || COMPILE_TEST?

Or does that break builds?

Yours,
Linus Walleij

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
