Return-Path: <SRS0=rvs0=Q4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6FE7C43381
	for <linux-amlogic@archiver.kernel.org>; Thu, 21 Feb 2019 14:21:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 987DE206A3
	for <linux-amlogic@archiver.kernel.org>; Thu, 21 Feb 2019 14:21:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cFC/zuA+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="K+GnpyBH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 987DE206A3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pBrlVFqPB/GhXCt8cxEzZ+vElbAisvrX96emLh/+EPQ=; b=cFC/zuA+DZ83w2
	qA0f6focBqs8lrXBSdR8Bud/AQsSLMjieBz3IPGaQArrm+TuDw+SuvuW6On6b/L79fRDFHjjuduc+
	E2SUaMtHy/18Ov0HawovNLnt7QtDglJrYIncdi+UT86G0mdvCrD9MlSchXoowlUisbrQGJy0Iv24M
	6EkfJs3qZ50jsf7gHNfhJY7XsXw1sZFM3w5tGCYPj7Vz1qKM6kqRA4DHDnqFgwai3uyJLA6CLmz75
	fcohICybRw6Qoos22SHXLY1vpQ1CPTMEog6Ne16DFtmLDLGlYcXKM+Mr6P0EP27b/awkKNMwT48M+
	qmAsjnE5ugeonIu5YVPg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gwpDz-0004AF-AI; Thu, 21 Feb 2019 14:21:19 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gwpDv-00048o-Ru
 for linux-amlogic@lists.infradead.org; Thu, 21 Feb 2019 14:21:18 +0000
Received: by mail-wr1-x42c.google.com with SMTP id r5so17175294wrg.9
 for <linux-amlogic@lists.infradead.org>; Thu, 21 Feb 2019 06:21:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=yJiSPFVjVJ4X8gWiA3+GiZbTR6evQSXAhXa9yAk722U=;
 b=K+GnpyBHy05MPVixHVEQeBqQWaQCuU/JOvzZVzXWxmu10XAPVEmkh95gxA/1w++D/o
 v8xmN9pPWKkGZb0veWuRIrAYc927hkghumflAM2FmQX2ZxfiBy0epcUpPudJlIb4Yxf5
 mBP1A73N/D//y/peQTFVIO38zHQRv1tJCEUUhcJ60Er6uJbaNyAgSkv5T3t5ng5p2Kbb
 HaHHFtRgLAJh60Kxk7QTv5I0QO7pexR06n0cnjLQE5q/Fwyz2uRnEK3MYhgnfNmPaG9Z
 LzfsjbRg2KSMYeJWKgrPZSd5KZwnK/7xw18pANvPSiUKyolqKc3jOadxvOPO/kYAceg8
 MBFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=yJiSPFVjVJ4X8gWiA3+GiZbTR6evQSXAhXa9yAk722U=;
 b=iHCMgL5/6dfjdCkwK5WkjrV2fH8cGBrUODycR/yiX1zjhO/Q0trV3qPtgSGgd7gE00
 2z6l+o3DKVrSpl1VSi5NXeTa681GkSFL9LlRtlpYhXCZbhyMDYu55a4pGrnJounBjhS/
 j3nQWIa0iik1J/iAl4csd6TrShaaPKUpASURcbrDYDQbqZku/G38SCmfkOopPXaAr5DA
 cO7BbfeGOaQAmLLa+oNcVYQKFBBN68HJT2kD5qSCipP29gJkFAR1CNaI6spmK76/J36j
 SkCK4fVxCiItJONs57+x9R1YxPvyz9e/WxfuZ3hWbEn5a274TQ137nm9YZhKa/iB7hXJ
 LLGQ==
X-Gm-Message-State: AHQUAuYlsfwWf41Mvh3yqui13JghlqMbQJOeGVHyQPPjWqBphRV2QzEE
 shc01qhlcHF1CGkKaiVEYX1f/0FzNuM=
X-Google-Smtp-Source: AHgI3Ia+MrtW1Y78p704G6P/aQhiU6t/Tu6csld8jO7+uBXYcSeF9MQX10pEKUM44YlFtDD0yiK1EQ==
X-Received: by 2002:a1c:30b:: with SMTP id 11mr10556882wmd.110.1550758873316; 
 Thu, 21 Feb 2019 06:21:13 -0800 (PST)
Received: from boomer.lan (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.gmail.com with ESMTPSA id f68sm16222891wmg.5.2019.02.21.06.21.11
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 21 Feb 2019 06:21:12 -0800 (PST)
Message-ID: <1426d8ed40be0927c135aff25dcf989a11326932.camel@baylibre.com>
Subject: Re: stmmac / meson8b-dwmac
From: Jerome Brunet <jbrunet@baylibre.com>
To: Simon Huelck <simonmail@gmx.de>, Jose Abreu <jose.abreu@synopsys.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 21 Feb 2019 15:21:10 +0100
In-Reply-To: <244d7c74-e0ca-a9c7-f4b0-3de7bec4024b@gmx.de>
References: <a38e643c-ed9f-c306-cc95-84f70ebc1f10@gmx.de>
 <CAFBinCB1WUMOmaF6Wmr5HTutrgLOru5CRSnOpUUMMuVzHSa3Gg@mail.gmail.com>
 <330a523a-c1d6-4a99-3287-459096af0330@synopsys.com>
 <CAFBinCAJwk5Go4ZEt2cqVKyfeeOxsa-+3pfLpzQo=XNr5u4Shw@mail.gmail.com>
 <2abbf79a-cdff-b6a7-42de-79ea2c6ab367@synopsys.com>
 <c80c1e5b-fed9-25ce-eb1b-258ac0135ce7@synopsys.com>
 <7afdaa0d-d0ef-b223-1f6e-2b52bfa44784@gmx.de>
 <6f25da2b-7f28-b888-3240-7178ac75c90c@synopsys.com>
 <84fb981c-75ab-ef9e-edd6-cd0c52d9dc36@synopsys.com>
 <cd344fa3-758f-3824-ddd3-568ce837c4f7@gmx.de>
 <8bae9cd6-5c44-30e3-bfe5-8d6f853f170e@synopsys.com>
 <065407cd-c13b-e74c-7798-508650c12caf@gmx.de>
 <227be4e9-b0cc-a011-2558-71a17567246f@synopsys.com>
 <45e73e8c-a0fb-6f8f-8dc6-3aa2103fdda3@gmx.de>
 <e1d75e7f-1747-d0ce-0ee7-4fa688b90d13@synopsys.com>
 <4493b245-de93-46cd-327b-8091a3babc3a@gmx.de>
 <adafe6d7-e619-45e9-7ecb-76f003b0c7d9@synopsys.com>
 <cd0b3dec-af3f-af69-50b7-6ca6f7256900@gmx.de>
 <fa35fb4a-b9d5-9bbb-437d-47e8819d0f27@synopsys.com>
 <244d7c74-e0ca-a9c7-f4b0-3de7bec4024b@gmx.de>
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190221_062115_964988_4C059C5A 
X-CRM114-Status: GOOD (  14.11  )
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
Cc: linux-amlogic@lists.infradead.org, Gpeppe.cavallaro@st.com,
 alexandre.torgue@st.com, Emiliano Ingrassia <ingrassia@epigenesys.com>,
 netdev@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, 2019-02-19 at 20:41 +0100, Simon Huelck wrote:
> Am 19.02.2019 um 09:47 schrieb Jose Abreu:
> > Hi Simon,
> > 
> > On 2/18/2019 6:05 PM, Simon Huelck wrote:
> > > disabling EEE doesnt help ( did it via the entry in the .dtb / .dts ),
> > > the results are the same. I can confirm the LPI counters are zero or one
> > > only after the test.....
> > It's interesting to see that you have a lot of RX packets but few
> > RX interrupts. This can either be due to mis-configuration of
> > interrupt flags or RX Watchdog.
> > 
> > 1. For interrupt flags you should be using LEVEL triggered IRQ.
> > 2. For RX Watchdog you can try disabling it by adding the
> > following in your platform wrapper driver (which will be
> > "dwmac-meson8b.c", at probe):
> > 	"plat_data->force_sf_dma_mode = 1;" and
> > 	"plat_data->riwt_off = 1;"
> > 
> > Thanks,
> > Jose Miguel Abreu
> 
> Hi,
> 
> 
> are you aware that odroid c2 dts is using level irq ?

The odroid-c2 (meson-gxl) is using level triggered irq, indeed.
For a reason that still eludes me, The odroid-c1 (meson8b) isn't.

This is confusing since both boards have been mentionned in this thread.

> 
> at which numbers do you estimage that RX irqs are low in numbers ?
> 
> 
> regards,
> 
> Simon
> 
> 
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
