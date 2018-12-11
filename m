Return-Path: <SRS0=H3eD=OU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35DF6C5CFFE
	for <linux-amlogic@archiver.kernel.org>; Tue, 11 Dec 2018 17:10:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F16A52081B
	for <linux-amlogic@archiver.kernel.org>; Tue, 11 Dec 2018 17:10:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KuCvuDut";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="OYOvDDQF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F16A52081B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OyKHRtfOZwRfeHdUYnpiyT/uqbJWkpwHJkvf4PsiQQc=; b=KuCvuDutBexxk3
	HgXUH350YM1sPHPxZjMY0voKprt5X8riSAw/6eavsbZ0wd9zbjv/2+T3VZiPkHlxx19ayMqSmja0+
	xfre7/P+FD7/75QmCF/5ubFRIj5YHITU3KBXqJUwB4iGcRbWS1BCkFNz/DaoZfbOa0V6aCBhETHPU
	IzS+cs9JP0N30ZE8tu1G0uM8h5+c0WEWrijXM0EJ+xEaeOJUIKC/IlVcZvs2hGAlps79y2ljATI55
	Yh1g4jlRat0H2wnKmp83ZdHDd9ONviaq+mzpb8iyeBK9MH8+EbvIqOr1sfc5adnKuc2c+/NfFoxYy
	suzDmOS0LzZNqw/3hAeQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gWlY1-00028B-H4; Tue, 11 Dec 2018 17:10:17 +0000
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gWlXn-0000cf-MC
 for linux-amlogic@lists.infradead.org; Tue, 11 Dec 2018 17:10:09 +0000
Received: by mail-yb1-xb30.google.com with SMTP id r11so2067121ybp.12
 for <linux-amlogic@lists.infradead.org>; Tue, 11 Dec 2018 09:09:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=isO2lANIsBVerOp9/+QCe4JcFwBPboQ0U8MIF8oqQdU=;
 b=OYOvDDQFgjozMi950T2wJ93zbDHzYcx+bfPnyIb6rdTSFYHlViftwQSOQcY4QG775t
 09y1zJ5g4smFLTtIjNTDmVm/1VpgPUyEzTnL/ebxBWyjk02/QnCGxdOQ75x8ngM2KA60
 4laWTqPVVGIE8As0SAH931j74l1PdaVwr+WxU4xdc26T3TD8pF9rdjErrGsazJf36OQ/
 z6fejXl7yzurPttsfkPGkhBn+QdCfv72XRHz1/5syIfJsF6xFbKvrVEI4yaIQvXMBW2X
 E1yPEVKVE+OpgD3AI5oeqNc4JSltXTAVTr0i2CqTklCmkOpdeoS9dbq58osmKyi9QUQg
 NmEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=isO2lANIsBVerOp9/+QCe4JcFwBPboQ0U8MIF8oqQdU=;
 b=Pc38OfLemo1kfEKOT9cbE/TaCW8Q5o7sOEUMPnoOunfzX8XnzOGQZpN1ilMBVPmw0r
 t/UY0RPlBBO7pxrYnu21p0ty+yfeKE0S2jd8XY+UG99BHqvS3Qx0hPk3bR3vIt2IesG4
 Kw0iQk93k/mHE8b85x5HCXjiwdn7pwfYQ00aHvzm0zoaDIJjKcRAD3BA0D7XZpbRi4YT
 FvOLC54sQxGV/ZSWVzaMUe3tuwEqdluTBuvbB+G0QMoSInhvLMK/sn3f5qMVNPnmsq3K
 DHfnW5yXKTtOGyfta0rrr9hmKI1iPU19Vi0WoieaaA5NSM0GqCzC86aoiwPiszrKvMV/
 MuPw==
X-Gm-Message-State: AA+aEWb5baL+KKpNC9mO8DWCX5Hhf0QkNWFC5r6JSxb9ek8ysN1H37Vf
 NGvdVuqcyc72TVFma+k9taZGRLdJuBw=
X-Google-Smtp-Source: AFSGD/X4yQhW/rhJ7yUmhw+Fo7vORTq6PUCcBWTLcqmXZBn51hSXskaboJZ8Y/yaRD8xYOVLbyRh1Q==
X-Received: by 2002:a25:4b86:: with SMTP id y128mr17018799yba.10.1544548191724; 
 Tue, 11 Dec 2018 09:09:51 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.googlemail.com with ESMTPSA id j6sm4929467ywi.110.2018.12.11.09.09.50
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 11 Dec 2018 09:09:51 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [GIT PULL] arm64: dts: Amlogic updates for v4.21, round 2
In-Reply-To: <CAL_Jsq+SdoMCsk2uf=W_bs7ObCL6KvLA7gaojteFJmRhm4QjwQ@mail.gmail.com>
References: <7hpnu9w22b.fsf@baylibre.com>
 <CAL_Jsq+SdoMCsk2uf=W_bs7ObCL6KvLA7gaojteFJmRhm4QjwQ@mail.gmail.com>
Date: Tue, 11 Dec 2018 09:09:49 -0800
Message-ID: <7hftv4uh0i.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181211_091003_754703_B829D130 
X-CRM114-Status: UNSURE (   8.85  )
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
Cc: linux-amlogic@lists.infradead.org, ARM-SoC Maintainers <arm@kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Rob Herring <robh@kernel.org> writes:

> On Mon, Dec 10, 2018 at 2:37 PM Kevin Hilman <khilman@baylibre.com> wrote:
>>
>> The following changes since commit 5e339a1d7e438b2cc9f46ec9f2682efb58ee2dd3:
>>
>>   arm64: dts: meson-gx: Add Internal Clock Measurer node (2018-11-29 12:30:09 -0800)
>>
>> are available in the Git repository at:
>>
>>   https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git tags/amlogic-dt64-2
>>
>> for you to fetch changes up to b29e9eccaaa721c2a303db6540535ee77a515f61:
>>
>>   arm64: dts: meson-gxm: Add Mali-T820 node (2018-12-10 12:11:32 -0800)
>>
>> ----------------------------------------------------------------
>> arm64: dts: Amlogic updates for v4.21, round2
>>
>> Highlights:
>> - GXM: add Mali T820
>> - fix IRQ trigger type
>> - AXG: enable GPIO IRQs, PHY IRQ, watchdog
>>
>> ----------------------------------------------------------------
>> Carlo Caione (4):
>>       arm64: dts: meson-axg: Enable watchdog on Meson AXG SoCs
>>       arm64: dts: meson-axg: s400: Enable PHY interrupt
>>       arm64: dts: meson-axg: Enable GPIO interrupt controller
>>       arm64: dts: meson: Fix IRQ trigger type for macirq
>>
>> Christian Hewitt (1):
>>       arm64: dts: meson-gxm: Add Mali-T820 node
>>
>> Jerome Brunet (4):
>>       arm64: dts: meson-axg: remove alternate xtal
>>       dt-bindings: clk: meson: add ao controller clock inputs
>>       dt-bindings: clk: meson: add main controller clock input
>>       arm64: dts: meson: add clock controller clock inputs
>>
>> Neil Armstrong (1):
>>       dt-bindings: gpu: mali-midgard: Add resets property
>
> Submitted, applied and a pull request all in one day. I have review
> comments on this.

Sorry, I didn't expect this one to be controversial.

I'll respin without the GPU one, all the others have been in my queue
for awhile.

Kevin


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
