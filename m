Return-Path: <SRS0=HwYM=Y6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7819EC5DF64
	for <linux-amlogic@archiver.kernel.org>; Wed,  6 Nov 2019 19:18:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B024217F9
	for <linux-amlogic@archiver.kernel.org>; Wed,  6 Nov 2019 19:18:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TmJQlAep";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="pNzIfW2l"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B024217F9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9+9cEIv6yKNHHpqtn3dspnBksoEMe6nUsKntjDEod38=; b=TmJQlAepsRYvk5
	pOXkXqMnU3UcXpLAMUsLN33U/H2ROqecAFqikqP35+4nPmE1RTso3GCSGf8DWDn+lINHiVFrPEpsr
	MVtB11nZzPrSU8Bp0+qa7gwP20vuAoHdJXEX4xnUTGpCI1L6yQBKB3erJx56jVaMW2Q9Xxxkun7RG
	T5bsrndYt/qv+XjpWu9nEqsXrL+ccpBrbrZPSExkKxOQsA4solQxH8RAM8ZUAvcmULi/W2tDLpKZU
	xqSLuWVK0Q2YjQ/ibkX2n9XBfK8sDFaH0BErtCbq+Sm8P0XoY3hETmxugdvcG+M3HpJdDywEMgDrA
	wz2gP5Py5AbEngJcDdYQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iSQor-0002WY-3g; Wed, 06 Nov 2019 19:18:17 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iSQom-0002V7-LL
 for linux-amlogic@lists.infradead.org; Wed, 06 Nov 2019 19:18:15 +0000
Received: by mail-wm1-x343.google.com with SMTP id c22so4856204wmd.1
 for <linux-amlogic@lists.infradead.org>; Wed, 06 Nov 2019 11:18:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=PU9cgonQbeBUlqD6smuE3HVC0qfgvpeOW/hibhDm86U=;
 b=pNzIfW2lSQa0r/h9lm3RqqX7bh074trKmxFhai4BOlXwBi3iPmBUtxEuI9KxpyeYCg
 DFxFVmbUnm2l1vmJyAdPNU1CwnyV7kcJ/fbddZ8WUTI6Bc+XVGW7X4Ebb3PfGioEivI+
 yzpD7F9urWPbI6eeLuFqYuRPlKuKCmrqQMYmUc41cR4ghL9o0bzJ3At+hVLGbGkneHox
 rAf0NakMMnk0FRzD2P7NC81JmwgWzjQYmewAzo34RaJzLO8AHi7D6sdI4PuaHlCXEkqZ
 Qyk4+41Ag2Una8+y8uxScUg923YYDbrTRMVGBY2vcRGsRGZCFy9SEsz7RgeuBaHLNCde
 Oq0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=PU9cgonQbeBUlqD6smuE3HVC0qfgvpeOW/hibhDm86U=;
 b=qup14+IyGUd+Kmv6mgOi5qfkve7Pt3NOxZAy8ek+LD3Sz1EIXqXNc2itKyPTFu637w
 80XVQNjkpf51wekbT4aniF3moTFqgQiCEqiG4LROHM3zfkCXpqTcdQW11bzl72oF4u9x
 4QvNz1/ESbb4hwRqb/d+jTKJ1q1FCIhCbuzspTs2Dab3JyM+1kfOmTLhjk6NQvPmG2et
 khcudYdZ4OoyM6J3SSwGTP8rUih+xHDdR2ypMZra3ub1zN3+3aN8KUf7gg6WTpBCo52z
 IX1icXPypev8TzO/7gtBsKiSnx/wqIUHEkkQPyBeERhTlejs0xKop9gg+q/MYi6zg5Gb
 vEiw==
X-Gm-Message-State: APjAAAXKvlhyo51tcq9hqpe9IIYJ+fLCHVNnK/IYFPY9QGzBDMUicT8b
 y2p2Sx0ywNSlzOr91TNWbBy+xA==
X-Google-Smtp-Source: APXvYqxkmHQPv2qjioyUcDooANq4YwZdbLDpJXqEm7lqXEUgckuPqSHnNkueWlA2awFRBwWXBUkVkg==
X-Received: by 2002:a1c:1b06:: with SMTP id b6mr3930121wmb.3.1573067891320;
 Wed, 06 Nov 2019 11:18:11 -0800 (PST)
Received: from localhost (amontpellier-652-1-71-119.w109-210.abo.wanadoo.fr.
 [109.210.54.119])
 by smtp.gmail.com with ESMTPSA id 200sm4974176wme.32.2019.11.06.11.18.10
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 06 Nov 2019 11:18:10 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 0/5] arm64: dts: meson: new fixes following YAML bindings
 schemas conversion
In-Reply-To: <CAFBinCD7NzK8EphtVTx77aSQxRytm4F8JhzbJMZ1aXfaQyFVMg@mail.gmail.com>
References: <20191021142904.12401-1-narmstrong@baylibre.com>
 <CAFBinCD7NzK8EphtVTx77aSQxRytm4F8JhzbJMZ1aXfaQyFVMg@mail.gmail.com>
Date: Wed, 06 Nov 2019 20:18:09 +0100
Message-ID: <7hr22k6cge.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191106_111812_701290_147D8158 
X-CRM114-Status: UNSURE (   7.71  )
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

Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:

> Hi Neil,
>
> On Mon, Oct 21, 2019 at 4:29 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>>
>> This is the first set of DT fixes following the first YAML bindings conversion
>> at [1], [2], [3] and [4] and v5.4-rc1 bindings changes.
>>
>> These are only cosmetic changes, and should not break drivers implementation
>> following the bindings.
>>
>> [1] https://patchwork.kernel.org/patch/11202077/
>> [2] https://patchwork.kernel.org/patch/11202183/
>> [3] https://patchwork.kernel.org/patch/11202207/
>> [4] https://patchwork.kernel.org/patch/11202265/
>>
>> Neil Armstrong (5):
>>   arm64: dts: meson-g12a: fix gpu irq order
>>   arm64: dts: meson-gxm: fix gpu irq order
>>   arm64: dts: meson-g12b-odroid-n2: add missing amlogic,s922x compatible
>>   arm64: dts: meson-gx: cec node should be disabled by default
>>   arm64: dts: meson-gx: fix i2c compatible
>
> for the whole series:
> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Queued for v5.5,

Thanks,

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
