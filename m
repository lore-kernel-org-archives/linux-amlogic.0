Return-Path: <SRS0=ULSD=UF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78B7CC04AB5
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Jun 2019 19:46:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 53705206BB
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Jun 2019 19:46:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PXFdUjEc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="dMA1DpS4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 53705206BB
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HP3kjQaC03wt8tvjk64f5NgsZq2w7MX5spxhI+42+t4=; b=PXFdUjEcsKvsYt
	lRgziLNc5z7or2brRzoqXFRMeBWSd7RuqDMyKfA/TuugaigtOtIzUKC6VJz51V2fowiqpzs8f/10Q
	GhHl9xjyRj71ZBB01Nk7F4Nw9OEL4H4w+IuCxjtrHwKPUdMrIU6Xa89BIlT8WNTSpcGGmyBN2zRxQ
	Yml3aQ1I8oSsCRWPJL/1Lma/ttlly7oDpE+lfY+QmdRC6+2u0tU4GuZ5qliEfuXgsdYEfdz6UxqEV
	saV02kOliMnRyNBcbeybSXtBpmQLfGV/8Cq1o63XSAE4o0wXYp0NMKRmlxteoY9FCrw0KZrY+IjJX
	6bjjYqe9VRMP9yTxgrtw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hYyKq-0003ET-92; Thu, 06 Jun 2019 19:46:04 +0000
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hYyKU-0002ka-BB; Thu, 06 Jun 2019 19:45:48 +0000
Received: by mail-oi1-x241.google.com with SMTP id b21so2457807oic.8;
 Thu, 06 Jun 2019 12:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HvsZS4bOWzh/rxJ7Vbhm+IleDBXmUoCFx+NzSXIR57o=;
 b=dMA1DpS4lVQzF3ZNO1J8lBPXw7HRf3KPEBh1nnzkpwHzS+JnIlc6I1WhERrDHbG3n6
 ZZMXV2U73oxBby1z/sJfZS2dxWu0uSLZb5L1SaobDKr1D9R1EP2mnsAUNjBCpgTX9637
 PaI1fAwxsKymUjv0iwjOkUUzxkGrmTUFQTpo3IqVi2PRDDtcRWWIOzNeDSzyYApA/YIs
 Iz3P+UD24H7N3ATUYFD71EFh+UsU6bkXcXSU0/dkIV0Yq8MDvXAhEMSRdhbJoB3VOh/s
 n/R2RIS309HBRdorUaO9BWvnXZdtPYPQd0tb1ZTLKhJE7Gj3eTTzvVAjHU8P/KmrdiBd
 zD9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HvsZS4bOWzh/rxJ7Vbhm+IleDBXmUoCFx+NzSXIR57o=;
 b=EqKApnN5I2qdct0zN9NzAC1CzEAZIcYyaMZBZ/92aP6oQs0l6dHm5YHQlIRlC7EPwY
 0Q2WnciO3JLvQRApoc6sEIRg7utJOfVd3lkHu4P2VpagokQIWfJnrR+AVq2BMmLpDAE5
 UjEs401+BCTl5F0nJ8GdygUv95Hq7Nad7jLzke3KrKvoOva1rRInu4YFSW7T+4eb76HX
 YgQidkvIr9r5BhlImCZDWX652URs2CjeEZ6Yq1jAXwZOkSoWUpNkaEBUS0fMQ3G7viSz
 wGyuYg0RnTjKC+6elEU3N6Xnint/x06NGzPwfwpFehhBJuFYDcRDSzk3QlEZBhjf+YyD
 I+Xg==
X-Gm-Message-State: APjAAAW2M/FN2HtkrWabbkAoI9zRygA7a6mQqEB2o85BUqPpEcAFL+9O
 mJPO4nlZpYh6HZdO8/lwAbiKlJz9XdhWA9kLlhQ=
X-Google-Smtp-Source: APXvYqzwNJzMn8BxHcmZMP8ExVHZkbQto4huDPJ4ia1CxvIjvKtYeqqbd10DSX8Ulxk42tGLcO6UqDoPI3VIjCXSj58=
X-Received: by 2002:aca:4341:: with SMTP id q62mr1300541oia.140.1559850341244; 
 Thu, 06 Jun 2019 12:45:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190603100357.16799-1-narmstrong@baylibre.com>
 <20190603100357.16799-4-narmstrong@baylibre.com>
In-Reply-To: <20190603100357.16799-4-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 6 Jun 2019 21:45:30 +0200
Message-ID: <CAFBinCD5y4rVO7AU7iDcrJXK7nj1uHowVnQOQT2wMSwL3EjuWw@mail.gmail.com>
Subject: Re: [PATCH 3/4] arm64: dts: meson-g12a-x96-max: Enable Wifi SDIO
 Module
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190606_124543_092691_2E8486C7 
X-CRM114-Status: UNSURE (   9.79  )
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
Cc: khilman@baylibre.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Neil,

On Mon, Jun 3, 2019 at 12:04 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> The X96 Max embeds an AP6398S SDIO module, let's add the
> corresponding SDIO, PWM clock and mmc-pwrseq nodes.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
with the comment below addressed:
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

[...]
> @@ -155,6 +169,12 @@
>         pinctrl-names = "default";
>  };
>
> +&pwm_ef {
> +       status = "okay";
> +       pinctrl-0 = <&pwm_e_pins>;
> +       pinctrl-names = "default";
on the other boards we list the input clock explicitly here (I assume
to avoid jitter due to a less precise parent which may be the chip
default or set by the bootloader)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
