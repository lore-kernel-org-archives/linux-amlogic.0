Return-Path: <SRS0=pzWI=4C=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1FA3C2BA83
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Feb 2020 19:18:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B79F9206D7
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Feb 2020 19:18:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JioKSfie";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="LJSwO27g"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B79F9206D7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KtG1iwkRZBjwO01eovDyK/kmVvfipiJfEuJ7FDgcynA=; b=JioKSfiey4iiMN
	BLsdsPvgBvAoZuxdUYkAPdP3hYy//UuFkYcGxSvfHPWK+qQAfkCTrLQmasFTcFcfqD0iU5IOsKAU3
	J4nDRR/5CYoadOewz5OWV2ankJPcupx1GKsLum/6NBPIZpfqANU72BBKDZkuowNyuWFhmZBjLtbTp
	vAVCEFrnfwfpsevqsBbKxYdneVszoX5JtDh1+LtKa+taaw9SRDbXBKsu4C8dzZqvVPEiMdUvtCJqY
	US+DyCP5YL9PYuhUwdU8Z2itAYmtSSWvTPHtsivuj9zoFJ9Cu0QwJhWkNCaP+S2NYkR4LgTApG5PJ
	cWRb6eZPrNxZLCdVIxSQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j2gTi-0005nW-LD; Fri, 14 Feb 2020 19:18:18 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j2gTb-0005fU-M2
 for linux-amlogic@lists.infradead.org; Fri, 14 Feb 2020 19:18:12 +0000
Received: by mail-wm1-x341.google.com with SMTP id p17so11856844wma.1
 for <linux-amlogic@lists.infradead.org>; Fri, 14 Feb 2020 11:18:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=alfJFtHKJM/Uyz0gLDfPfrM5tSB9dNPsAfTb3Z88wWA=;
 b=LJSwO27g2GKc2awVc8VpB/xF0Y1TAHxkCB4lDDP5c+PfqZJYx6jpTfHi5IdhIIoBXj
 oDxysBiJQlYIG4LVMpFi32QleK68KJw7uIvfB7WADBx5So/a68VG/D9GkxVu7gLulsl7
 ky/fP98MM+iOVubCw6s0W7wXuPWuX5/TTMHCZaoSq2eULAY6A8ytrfdkM1dH7uaSJVw8
 NLHfP8Dl+U3cQuQKfUjuk5VfFRf0uL3ZbyyzIm9MfzpXLBFmqVLKUS+DJCrM7HCRupBi
 rN9uchVRidbMX9t+Z9QMvjJNZMGDAdwNZzpy54SjraFBCj31MjiFOVjQKOpfm4W+DchM
 K0pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=alfJFtHKJM/Uyz0gLDfPfrM5tSB9dNPsAfTb3Z88wWA=;
 b=FnXmTom8LoOqBI3FMcTQJrs5Qa7VuT1pNClrCo1vahzXEvzjJjXy+rkEjTOKp9of8+
 ZJ4fuNBiGg8z7Z0ayvA+ARRP9g8j76hiOebvzw6+kbHuPTW8PEAOO4xe1xIrY/Dn2UZc
 +7u2jB4nsRJZ8ncxJB6xJUff6hVUipS8QiO7e272kltg8Kiy2u4NPsyrpzfa648PDASr
 PBUCogNAekaSwWWYEHcjUwYDv090EtgExly+U1BJ4v3Ax6ySziPAYae0k4GqPynPQ9pj
 Ad/UhAmHcazMOM8Rt7IaTJMsroe0w7RJ7yiMHINzeF/q0Qm+TCqzoiKfSzFPeoGyw/UY
 Uq8w==
X-Gm-Message-State: APjAAAV7J0zYmDA1/UAu4aL6+B/2Ze4swhgIgchvceIiu6ZjidL2e8Fc
 8A7TMFVusRs57fODA8pXwDcASA==
X-Google-Smtp-Source: APXvYqzyucT7GHVeUgi+5TIyBryVhiWXBuXBSMxGy6Ld77Vtz6UEawy6ZwoJS89byCYQ4btqYCjn0g==
X-Received: by 2002:a1c:3d46:: with SMTP id k67mr6370811wma.171.1581707890051; 
 Fri, 14 Feb 2020 11:18:10 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id c9sm8045588wrq.44.2020.02.14.11.18.08
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 14 Feb 2020 11:18:09 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>,
 Guillaume La Roque <glaroque@baylibre.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: meson-sm1-sei610: add missing interrupt-names
In-Reply-To: <42e82841-067d-245b-6196-183503da389b@baylibre.com>
References: <20200117133423.22602-1-glaroque@baylibre.com>
 <42e82841-067d-245b-6196-183503da389b@baylibre.com>
Date: Fri, 14 Feb 2020 11:18:06 -0800
Message-ID: <7h8sl5asgh.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200214_111811_720959_01D553D4 
X-CRM114-Status: UNSURE (   9.27  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> On 17/01/2020 14:34, Guillaume La Roque wrote:
>> add missing "host-wakeup interrupt names
>> 
>> Fixes: 30388cc07572 ("arm64: dts: meson-sm1-sei610: add gpio bluetooth interrupt")
>> 
>> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
>> ---
>>  arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts | 1 +
>>  1 file changed, 1 insertion(+)
>> 
>> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
>> index a8bb3fa9fec9..cb1b48f5b8b1 100644
>> --- a/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
>> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
>> @@ -593,6 +593,7 @@
>>  		compatible = "brcm,bcm43438-bt";
>>  		interrupt-parent = <&gpio_intc>;
>>  		interrupts = <95 IRQ_TYPE_LEVEL_HIGH>;
>> +		interrupt-names = "host-wakeup";
>>  		shutdown-gpios = <&gpio GPIOX_17 GPIO_ACTIVE_HIGH>;
>>  		max-speed = <2000000>;
>>  		clocks = <&wifi32k>;
>> 
>
> Acked-by: Neil Armstrong <narmstrong@baylibre.com>

Queued as a fix for v5.6-rc1.

Thanks,

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
