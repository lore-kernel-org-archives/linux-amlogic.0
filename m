Return-Path: <SRS0=VErV=K5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 084DAC47099
	for <linux-amlogic@archiver.kernel.org>; Thu,  3 Jun 2021 18:03:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C643A61402
	for <linux-amlogic@archiver.kernel.org>; Thu,  3 Jun 2021 18:03:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C643A61402
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jqab05og3ppUwk3+++ltw7ga6y12S2Giu1stIS9HICw=; b=2+mrNyKg4zKnqm
	Ty3eUJrnRfAhx9CTjJxM06i1FqzfOVr5dJ9t1yWSLrYpMTwTYOxJxkKBAuysftVfD8PtwW4Ez34Tn
	CYT5m29UqaH9KU9ws7+lFF8xacHx7XjwslNAKbw40a6Cuw1hYhCTOk8wYBC8gfywMXLaRVLUP/SmT
	M0q4fMiMf2/AOpu9qo5CB8M1t5CrbqT1UYMKhRo2ZkQZ3P+FjB933cwhekbxOo7c/nDESerI7MJUS
	YdeIgAzDbheTFJcTpUXZdVZ1KMHYI+98s88nq5Pls6B2jWGCaOXHZ5t7fuBLsEneS+cOTGOXbEVyC
	vXQJEYxX2hWP2TraNcyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lorgu-00A0kd-6Q; Thu, 03 Jun 2021 18:03:36 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lorgp-00A0ja-R1; Thu, 03 Jun 2021 18:03:35 +0000
Received: by mail-ej1-x62d.google.com with SMTP id k25so5063879eja.9;
 Thu, 03 Jun 2021 11:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jhuorpEwWaM24p5GKEX8o1M3vPLTB9Mbm2fC2Wr3lLc=;
 b=MO7ybZYyh1zLZK3xW5pB0qSJ7+MeBnGLfNZk6FGlHi4Qsus1eXoKj/MJ/Dm9Zhd0He
 81yBlPed88OQVbDUeCVxNwV0MEIHm84UZOHPzK0uAPxHJ06k7AO4aXC81BQ6wJdzaI7w
 qAgCXn3UpsuLBt3cAZnlh9LlG8xmGgHiiLso/NfT+U8TEy4Jd/HdrNlEMV8X8i1I454M
 wbeeF1e4b7GEGLLcSNuJSXNXix4xSbpsJPLBRdL2++uW6BZa/Il4qyeDuIH0kfzrP9Hl
 FA5PZnNrN7pNHWDWPCkqyLfZI6D7dswnlTAAx5npDKro4SEO6/Eys6eFYWNolPfEfE0N
 dvOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jhuorpEwWaM24p5GKEX8o1M3vPLTB9Mbm2fC2Wr3lLc=;
 b=Ta7jkp22/4opOfiwgggf9uVOBGlfq7oT0/YHTc4A0Jrl41JNGGhA1QXblFvzMCvz3N
 WJIv3CzV/XhsdZnN3f51LX5HZCJul0IQTO7VYyI3rQqgnVQ2XrqP396IvzeBX9otQqZV
 e9SfLP4pklQeWX3LrewqbDb1hvM9sqPRkYHGcCfDVlEECK4E/VVFlkF4aMy0GMVzC3Hb
 iir5LP4gLLqKRsChrjtglBJEUR/E4UwltjMWMBXyOWic4NRlYkCvI/TRG/LUBD37ChFG
 7aJ0xaGdap9cjMZCyFGT06RBToB4MPz0bS8flPG34EENc1pUk56S2fqTnv63TvMYcW0X
 rv/w==
X-Gm-Message-State: AOAM530muqzGbK2BiKDFgIij4tUmhaBrPampMIyMFaKOVu4lBsuahlSk
 /fFssbaKgNg1Y+CxyW9hN/xo5gwgX+G0pFcNHfo=
X-Google-Smtp-Source: ABdhPJy/HSvM6SWAJNO+/5mUui3RjSzM8+GY+x941nZByI3bRfV+ASnzQ+GE7gjz53O5+Wo0R2Dt32XKtr1k+6zzpxM=
X-Received: by 2002:a17:906:1682:: with SMTP id
 s2mr566367ejd.172.1622743409439; 
 Thu, 03 Jun 2021 11:03:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210601090140.261768-1-narmstrong@baylibre.com>
 <20210601090140.261768-3-narmstrong@baylibre.com>
In-Reply-To: <20210601090140.261768-3-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 3 Jun 2021 20:03:18 +0200
Message-ID: <CAFBinCC0RJ=HGzOHSy+8C-WsA2rd-Yiri3_sF--h4vGcz58N=A@mail.gmail.com>
Subject: Re: [PATCH 2/6] arm64: dts: meson-sm1-odroid: set tf_io regulator
 gpio as open source
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: khilman@baylibre.com, jbrunet@baylibre.com, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, tobetter@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210603_110331_893900_8FBA0264 
X-CRM114-Status: UNSURE (   8.93  )
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

On Tue, Jun 1, 2021 at 11:01 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> According to Odroid-C4 & HC4 Schematics, the TF_3V3N_1V8_EN can be in Hi-Z for 3v3,
> and since it's the default GPIOAO_6 mode at reset, let switch this GPIO as Open-Source
> to drive for 1, and input for 0.
>
> Fixes: 88d537bc92ca ("arm64: dts: meson: convert meson-sm1-odroid-c4 to dtsi")
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
