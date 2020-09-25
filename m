Return-Path: <SRS0=7OpP=DC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A3C1C4363D
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Sep 2020 07:51:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E04B2084C
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Sep 2020 07:51:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GfuD2MA/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="AJrBx3og"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E04B2084C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gM7eUP0agA7dEwuG7MZq73eTeViTh1FlhuhIAVNG06E=; b=GfuD2MA/ruUvV4/vjp8aLF+Py
	jgocG32Mwsv+YKuUzxsr8TZXdiPTg/8z2RPT/+hcvKBhcYgo1qg8rHMyIz8F3f8HlBfTyG8uDFZZc
	qDJsRad+cLB5xJpQ25Lsz7UswgFShYx0ES3t74E95omy0Lf+R7yuWv3KsH9/QOLJL8/xCweeWI/Vq
	oMRW/QbWvcGVZujQLb8A+XdyLoLIIxmjrDFsqS29GGWaIdN3Y+W7s7zzW4xlFIDcVN70KltYuLB45
	6xKozqf0QOHR1SEwrf+llsQZ2CP4O4TsYG4z3C34spLYHoeoMKBemV7hhujCGjAL0GfpCiVWCq4g1
	nEOK03KpQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLiVv-0006Xr-Df; Fri, 25 Sep 2020 07:51:31 +0000
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLiVr-0006WV-1d; Fri, 25 Sep 2020 07:51:27 +0000
Received: by mail-ej1-x641.google.com with SMTP id p15so1772510ejm.7;
 Fri, 25 Sep 2020 00:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=C3MDToKFnc8Ld4NhDNLDgxEU3GH0UiPaPFBJOq/aOu4=;
 b=AJrBx3ogTrvrwTHp8UAK7s96cQayIHUcNQjkM+3RUjLDeIO1LXL2B4vu+07JnYMYaO
 O7ox4sSIYIYxY/ML1lbDnMsonYado3Ku9rxKvfc3soBYOa/A/N6cm1XkI0dqZIYToY6T
 v6ajjHspnIX9OOjal2Og2Q7B9LnxdxboXDtY1LoZWqKJNHTv+u+cNW4qG8Yroi2bIYr4
 JpkJDN2zDN7Z97NiOZCQzgtBpGzqkqXX58wb/k6cq4d9DWb95lg3Pqyctt4uQzCedpOP
 vtB0JSlc/LnYuwFVidQPnUVz9Koi1UWBG2Jsp0zh/qcTLrh12KOf68/Z4HLkOu36ILpD
 aWrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=C3MDToKFnc8Ld4NhDNLDgxEU3GH0UiPaPFBJOq/aOu4=;
 b=h9YzYawDoabmMmiaxcQXm2R161GWGFl+BmWLEPgzdHSQERGb34OmMtdtfJvNAp4UOd
 CVrhtQHSg6WkpM4xE67oe0Dpu/8bmawzuyAs6gMWmS7xGLGYgySNL6LLp2o30DJssenA
 TD6NAm0rjThrVSGRZbjmCA6o21vtl8NcEQN2ZbuaUhHMNxElxNKxhqhDd0cnRc7II1on
 dySVTvHIKq+hEEeB/dkVgDIHW4BHHTZqCBVfKHvMvoT2lGvEusKuOYczH/KAE79MZLQX
 Nv5W0n7FOr9cOsj6fhUVxy1dYeFsHfucJMFAJdUcZ86mWqfOXbB6KWS2xLLSCv4Cobd/
 eTSg==
X-Gm-Message-State: AOAM532fBV/xV110Gm+OsRLNXgl8VVEc5VpzVjt2rt+kEOohDZtaSUJs
 4CAZrrkhIOxAJJgwD72Wzht2KvMSVrhpushBIXA=
X-Google-Smtp-Source: ABdhPJz8LTTXIBSbijfWq+tPT8oZ+iOkpd7xsUuTf6dC+qoeeI/DTkVqkf5sikzIkMmvbBTf6C131zlVJFtLGVM8puo=
X-Received: by 2002:a17:906:16da:: with SMTP id
 t26mr1463323ejd.172.1601020285551; 
 Fri, 25 Sep 2020 00:51:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200925033017.1790973-1-art@khadas.com>
 <20200925033017.1790973-2-art@khadas.com>
In-Reply-To: <20200925033017.1790973-2-art@khadas.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 25 Sep 2020 09:51:14 +0200
Message-ID: <CAFBinCDcwHUJzK4HsvKxs1n4_jH9K47bNZcZobocLxKVj7+iNw@mail.gmail.com>
Subject: Re: [PATCH 1/8] arm64: dts: meson: update spifc node on Khadas VIM2
 meson-gxm-khadas-vim2
To: Artem Lapkin <email2tema@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200925_035127_110045_61471321 
X-CRM114-Status: UNSURE (   9.57  )
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
Cc: devicetree@vger.kernel.org, gouwa@khadas.com,
 Neil Armstrong <narmstrong@baylibre.com>, khilman@baylibre.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, nick@khadas.com,
 linux-amlogic@lists.infradead.org, art@khadas.com,
 linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Artem,

On Fri, Sep 25, 2020 at 5:30 AM Artem Lapkin <email2tema@gmail.com> wrote:
>
> 1) The VIM2 Boards use w25q128 spi chip only not w25q32 or w25q16
>    it's not really seriously becouse have 'jedec,spi-nor' which
>    have auto chips identifications
according to the "VIM2 - Transitioning From v1.2 to v1.4" document [0]
(page 7) both board revisions are using different SPI flash sizes
for which board revision are your changes?

> 2) max-frequency is 104Mhz
(note to self: according to the w25q16 datasheet it supports a maximum
clock frequency of 104MHz, so this is fine)


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
