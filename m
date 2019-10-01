Return-Path: <SRS0=zbOs=X2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A269ECE587
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Oct 2019 13:15:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3ADB020640
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Oct 2019 13:15:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SygCcZJM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="rTsyBF4v"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3ADB020640
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	In-reply-to:Subject:To:From:References:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=GA62tfbRLIIu0vylf83PKB9qptCera9lh0SeLt3UyEU=; b=SygCcZJMTMrUL72SKnhhOB/Gdg
	jAhbCUTwyEr5FtDhq66YbwM329jQLTEXIu/6VauSeUaxAZKoDXqv84rhuJZl9GT0K0JgP3zxjqiXn
	mi1UrXT5dmlp78fYm4hOeH6nMYX97RZEepbdZHx6z/MXhpZb/XTWFdgvUOz8q4oNWHP9dMsgvb4yY
	B2pKeOjXnfDX2JQbNpWzKZFSS97dnG5ugIcUyzWBbYysBW58TD8J0hUbKK97uJYah58VYwhj4HpjD
	zHU9/gV+QLg2XcCVpERJOHt4en1SzGsCi6VAJBs3tBVmhgVT4tofTMNJkhCO7sxoNPSgEWbIrlsfl
	GojhwmRg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iFHzu-0000gV-9f; Tue, 01 Oct 2019 13:15:22 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iFHzm-0000Xt-EI
 for linux-amlogic@lists.infradead.org; Tue, 01 Oct 2019 13:15:16 +0000
Received: by mail-wm1-x343.google.com with SMTP id v17so3190787wml.4
 for <linux-amlogic@lists.infradead.org>; Tue, 01 Oct 2019 06:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=DGm+jAKzcyF9jL/nAhZEw01gpHilyJv1iBgg1UwcO5I=;
 b=rTsyBF4vLm99v9d1KGwh8d1rbKgIWDAaHB6/bpo+pUKuKNfi/Hkwd2ektAhOZAG9h8
 i1pJgrjhTedbVbq9/Rdz07hnxeVdepDGKcfpLSPBTGLR31jsL21Ptrtab6OSTLuFUFTX
 1QK+WmbtXbF2rCTbs606Z8SBkuF12Qy0ikh3cdpi6DONpUfuMWyeGaRf5KXWVLgY3JIl
 TUG2EGpzQrzKvxohcBNO8bAQHC4ELBFciyoeOhjnmQ9kvmj8iGinr0lBUZCYWbv/s3Jc
 eZqzaTM1o90YA6e5QOy3RcBybGGAin5YjmQFT00wQyK9t+k2XYKXr8zBqCG5E1Q1kjEz
 e7pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=DGm+jAKzcyF9jL/nAhZEw01gpHilyJv1iBgg1UwcO5I=;
 b=nNo8O/NlEVeD4egVlBxTdlVnd+DSzUUIs/DPjYLiLs4/KJzn/DAtXpNgb6D8BdCuBO
 6RnvQsAz/9Rxv3qgl8DY6Z3BTqCsvotxsgSakQcG6rDgwuvo1ij6H7mVkjWven5G2Xtm
 00FKDs+QJI+8LA3Ik4emcPDi8rw/Ze2QUrwizKCKHt2Arj5UMT0JXdJ0830YKCUJEegU
 OjL50fTV5839q92QTWgZU/gePBYrS11cUWKFkv4hbpkztH5IKmUZjgw9i8hh/Pgimdrr
 Mmt70BiiGW+lYwNrNLycBXkVBysem7cf9E4HRu26QiyLJYZ/qd/wS7w1+xc0d8PtAQHP
 s7zg==
X-Gm-Message-State: APjAAAUMRZUoo6QI49YWVl5/kXRH+w1Z+AlRZ1ZLi/jm4d9wy/91I6D7
 vYzW0P0O5KW/DzUDH9T9D3VbEw==
X-Google-Smtp-Source: APXvYqy9u48k/I0891LpeWRVLsDnw8XWv4XSzhE2JT0unm7u7wxQCSBojPGSF2V8pa6KZeJmjxKotw==
X-Received: by 2002:a7b:cb91:: with SMTP id m17mr3681665wmi.151.1569935712186; 
 Tue, 01 Oct 2019 06:15:12 -0700 (PDT)
Received: from localhost (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id y186sm5172875wmd.26.2019.10.01.06.15.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Oct 2019 06:15:11 -0700 (PDT)
References: <20190921150411.767290-1-martin.blumenstingl@googlemail.com>
User-agent: mu4e 1.3.3; emacs 26.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH 1/1] clk: meson: gxbb: let sar_adc_clk_div set the parent
 clock rate
In-reply-to: <20190921150411.767290-1-martin.blumenstingl@googlemail.com>
Date: Tue, 01 Oct 2019 15:15:10 +0200
Message-ID: <1jimp8r4ip.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191001_061514_508958_16460EF6 
X-CRM114-Status: UNSURE (   7.60  )
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
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 narmstrong@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Sat 21 Sep 2019 at 17:04, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:

> The meson-saradc driver manually sets the input clock for
> sar_adc_clk_sel. Update the GXBB clock driver (which is used on GXBB,
> GXL and GXM) so the rate settings on sar_adc_clk_div are propagated up
> to sar_adc_clk_sel which will let the common clock framework select the
> best matching parent clock if we want that.
>
> This makes sar_adc_clk_div consistent with the axg-aoclk and g12a-aoclk
> drivers, which both also specify CLK_SET_RATE_PARENT.
>
> Fixes: 33d0fcdfe0e870 ("clk: gxbb: add the SAR ADC clocks and expose them")
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Applied, Thx

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
