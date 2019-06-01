Return-Path: <SRS0=xyi4=UA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF8FAC28CC1
	for <linux-amlogic@archiver.kernel.org>; Sat,  1 Jun 2019 17:35:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB26927747
	for <linux-amlogic@archiver.kernel.org>; Sat,  1 Jun 2019 17:35:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Yanu04MV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WerUmUvF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BB26927747
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9G6YPSkANf43WGNnYvD8MnbzOyFBbhrJl1N65L4E+Zg=; b=Yanu04MVDPtC8N
	6gbZzZRfUGwD+laphYEhW1ZCFRxybzIqgIVMtgmfNAHwnjgz9Y/WgmHsTf7wM922M+J2ISgQRdTG5
	gRqFVuXJqt07+zCCRYbCzJ60PCEVpUT/Q4cYw/VHdzvcqQdgGo9sh5nVnmN5/qqf1mqTbnRRwHkpF
	MTb2fnD9tdQq1AFcXndbltjjYZXTdhtzJD0PmK7akmmT+GWVwbhIFusAfQ57St+5kK7mj4FGaPnmQ
	p+UWLcyNBi5BJcpq7c46p33bB0qtsU9k7JMl/t3HOrcPjPkVzlOmrpvxgJrwLY3u8kRI4yZs8H+hX
	5fMlupfopSn0auggfTqA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hX7un-0003hF-2k; Sat, 01 Jun 2019 17:35:33 +0000
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hX7uf-0003bM-D4
 for linux-amlogic@lists.infradead.org; Sat, 01 Jun 2019 17:35:26 +0000
Received: by mail-lj1-x242.google.com with SMTP id m22so12305022ljc.3
 for <linux-amlogic@lists.infradead.org>; Sat, 01 Jun 2019 10:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=owmhC4nkQ++0XWcQKeCbAiLKodtwVwoOL0lLVZVcgyE=;
 b=WerUmUvFuVb1ad6IAGBDRNrocbnRRe/ludsVjfZCo7EVt4en/Ja8o70U0DMLbhvG20
 sk9Ry7wH0dKBjHUAuIMonGzsi/O5gR0QAf34QQl+i4YRH5jyZUcXmHYnsUGS6KHDbHM9
 DJjELC2evjoStf0LYeAFVEfWL0dnLm88pVHlmUiLBTUk0U8JLPkxjpxzujDTTKXI2AIp
 nEj5ui2QIbFv5tqVv/BrJi5wzVULfQ8NIpuDZhRNJkWG57ZMXOwo37eDsa2K3tlQzGo9
 6EEmeBbimUfiJ+R/kstgGxrxMYMv7Xo9vBZRhNAe63uDyH0exAXY2I7sEBevheD9mKAZ
 N/Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=owmhC4nkQ++0XWcQKeCbAiLKodtwVwoOL0lLVZVcgyE=;
 b=QRW/sGCZzdu+yEn5JEyN/jOvzgsYtMHAM1shSDOmEX2F5Joh4M2vj2lgKeZ/goTS0g
 c/9ue0x8aErispFedOHqZq763lhvx4HF/unYKg21fHlP9VofbossPvSBLU42gwgh0ObH
 sY+a3kW5RDI1MaijV9vQ+BJj604rk7hY2FZtdIckzATNQgNVmJJ8vVxpkI3InWMQu3ts
 qWnhfQj/D04DfhXgtB6z/4xDeB/hrcwxBwia28RkDlwgoAJMDFhXd9Mkq2F8INdIH2KS
 PwP4RcuVqMe92HyyYjMQ26q8zsWYtmjdvKQpZ0++IW9abnnXGCAgYoGSL93j6vhp2t/m
 dw0g==
X-Gm-Message-State: APjAAAUFIPxP7dskkW2qfLp2QDXSa1CSgZ7/qMEDK1C7wvK5+PbKIzHP
 Dqn7JuPKmbPpu1HsLnEKlj9Ho8ejm6njy0kTjnnPJA==
X-Google-Smtp-Source: APXvYqzq9gTWZsAaPSchU/CdBc50ntEnexEA2Elo8kyp/1cSgd9LzQr3i7TrIBqh5qaIoJg1bUhCfWWkTV+Bw7CC2tY=
X-Received: by 2002:a2e:5bdd:: with SMTP id m90mr289291lje.46.1559410521088;
 Sat, 01 Jun 2019 10:35:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190520144108.3787-1-narmstrong@baylibre.com>
In-Reply-To: <20190520144108.3787-1-narmstrong@baylibre.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 1 Jun 2019 19:35:09 +0200
Message-ID: <CACRpkdZ6PBMPDie4RyuPfzfhs3W5XunZMqa6cG4bg7+kEhUegg@mail.gmail.com>
Subject: Re: [PATCH 0/5] pinctrl: meson: gpio: update with SPDX Licence
 identifier
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190601_103525_494354_29C9606E 
X-CRM114-Status: UNSURE (   6.60  )
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
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, May 20, 2019 at 4:41 PM Neil Armstrong <narmstrong@baylibre.com> wrote:

> Update the SPDX Licence identifier for the Amlogic Pinctrl drivers and
> the corresponding GPIO dt-bindings headers.
>
> Neil Armstrong (5):

All 5 patches applied, I took a quick look in mainline and it appears those
files were not hit by the large scripted conversions to SPDX that tglx did
recently.

Yours,
Linus Walleij

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
