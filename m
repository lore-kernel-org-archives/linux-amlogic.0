Return-Path: <SRS0=drR+=TO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C397FC04AB4
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 May 2019 18:25:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98EC72166E
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 May 2019 18:25:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jgSzkoEf";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="lJr0Zzq/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 98EC72166E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RhqDGa1ct/1ow6xF/+5CTsEpXkzuXlCCf/UYP5DBbiU=; b=jgSzkoEfI10IK2
	LcsY9bhJuOU9CXmMLO4aLLpMISLRCeZTXUOX+8jjfKggYKDNVN/DijUiWiPdNwa1Un/Nb/zQFIVg2
	MpX3hMLwozEWHAYr9JbcphkE+YmkE6KKol5LjaWDUxkquaJCXAjwsW7J2xoBWQeeks0dKf5HcmS2f
	ZbcohjgaWpi2KSl3oxq5B70mdRUX4espzRspSlkZ5cTWt/kBf65CvMidq9Uh6Bgk4oK42B3AiU7nw
	Uzg10TMQBEIRrgvF3EyDHgVATyhxd09nLNB1x1e0l9EDso2bO6KR4tEEpy5m6b6KCj72qMKk0UHN5
	AAkwGd1j0Lm3vG0lC/4A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hQc6u-0003KY-0Z; Tue, 14 May 2019 18:25:08 +0000
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQc6r-0002nz-3z
 for linux-amlogic@lists.infradead.org; Tue, 14 May 2019 18:25:06 +0000
Received: by mail-oi1-x242.google.com with SMTP id w144so7371016oie.12
 for <linux-amlogic@lists.infradead.org>; Tue, 14 May 2019 11:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kw3IOsl4tz1Kex8D0hbfYf2WNfpKc0o/lXZ+cVw7qjc=;
 b=lJr0Zzq/wwnxu0m2KeQgieErswd5Yc517neOCGeh1PtLvrXwf/bAxE4Lb1MJS5E2iU
 Q1JQhCcj6az7Bn1+cEetwZ3KUCQYjPa1r5R9lWU+KscBgqT4bNBBfR/jO3OWnG8Xf2Rb
 mclBcWeZF2rY7uG8NkF6YY3WksmciEdWC1KnQOc03AvywuyPRgkWsk/0FbAyuGETryaS
 fxp7e3UNkBLueJWWkKWj5oiAks30wFhQexvpgGbPeUHHnSoPUFliBwVVMYFhai5DBTCi
 g4Cjo6ccfLQkmSMk7pkq3Btuq7ZH9zROPV/CRPoIQnJdoUaloOZc8z6PHvZA0xVnT/m5
 qoFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kw3IOsl4tz1Kex8D0hbfYf2WNfpKc0o/lXZ+cVw7qjc=;
 b=Uo+lVyW/wMimQh7F8jHIsXyp5q5Wl/e0rygrJs4q0D4JFBO0H7o4wdvHZZX83EDdi7
 /P6L95XYlU8cIyx6Z91F/T/Tgm36cmiFlJmghXJ4HTc9Qa0Qz40lpipYOj9angF+U2Yj
 w5lZyn+XzCmrd5rYA1dIZvsz7Vn4aR0zb09pxS5PMon6b4/XNRx4m7HiMpC18tngLarb
 ZKz9k4uvJwQWHtB3vu4UjcbmGZJdGJQFDSfC3IE8MybOQL2DvClCPdalRNSjfJ7lq2/r
 ZndapQE2LMYj1nOMYReIxTYRDkiB7LwMFReCGSH2aNI8kK3jVFAYlCbcwLtDk9rAfis6
 q7sw==
X-Gm-Message-State: APjAAAXhIdKj3oLMMjfK7eNiwHTLXRCiefs1Ik97b671sYDMyw904lk1
 Ao4lydcc8Wnb8A5KVe6rn0LBeIAECLK+DE2r7U8=
X-Google-Smtp-Source: APXvYqyJrHbY/exB6YGUUMsPrCvn/3mcKsx1q0CU06ZeAfCGMaEVzFez/hJkMHPJ0+gpcEtC6YgIIDJWKB6/cggmMh0=
X-Received: by 2002:aca:b68a:: with SMTP id g132mr3828880oif.47.1557858304300; 
 Tue, 14 May 2019 11:25:04 -0700 (PDT)
MIME-Version: 1.0
References: <20190514091611.15278-1-jbrunet@baylibre.com>
 <20190514091611.15278-3-jbrunet@baylibre.com>
In-Reply-To: <20190514091611.15278-3-jbrunet@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 14 May 2019 20:24:53 +0200
Message-ID: <CAFBinCDdyctRu04PrnsrvLMbe+Ty7xo1jxaRzomjwq9VVu215w@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: meson: u200: add sd and emmc
To: Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190514_112505_194192_577698CC 
X-CRM114-Status: UNSURE (   7.67  )
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
Cc: Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, May 14, 2019 at 11:16 AM Jerome Brunet <jbrunet@baylibre.com> wrote:
>
> Enable eMMC and SDCard on the g12a u200 board
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
I compared the GPIOs with the Odroid-N2 schematics because I'm
assuming that they will be the same on all G12A/G12B boards:
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
