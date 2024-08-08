Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD92FC3DA4A
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Aug 2024 10:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=08f0RDOLRkK3sCLpH4RJu1TcVl3NCizNZfXt5mcthPc=; b=vFF4BkudlSLkoK
	+XoiLg+kVmF8PKGmqtOa1bimIyYVQmtHKhPj57sdOvR35diPTCynjgQMcMSVHaVuP+5oDPXklkqXw
	nRCtcmKSEwlpjKSBUwiZqOYBfPtGzInqx1F32K33kfI2Tiug+YKMfjZmvicBqth/ew3edkcXSElSU
	w+rN5H5aHwW73SD3ZfuArCjvuH+kKlnM3MtSaQhoqSo/IYK90c7FsOSHipLZuUQ6EWalDjJpLf1Vb
	GkHE37YH9iZWquPyvyhrWNNdgpymCEvbJkZ0ZZOyrBk4+Zw3Q9K6cn+OUx8LUclNNsXkvbcOvpqNI
	1yacwyAzmvGtOw5B+H6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sc0BH-00000007r2W-3wJw;
	Thu, 08 Aug 2024 10:15:39 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sc0Ay-00000007qxF-02vB
	for linux-amlogic@lists.infradead.org;
	Thu, 08 Aug 2024 10:15:25 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4280b3a7efaso5575255e9.0
        for <linux-amlogic@lists.infradead.org>; Thu, 08 Aug 2024 03:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1723112118; x=1723716918; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=uHKU+qWDGf01eQdWksVZpo4JSdzafD6OrXnwsvy06EY=;
        b=BWkKzZ6PikR0f4H7OM5lyXyP3M3/r7nbMVRgaW4ZGB+oumwPFgyD8ReP4rXIqW8Zm+
         dHBNjYEQyWv84INwiXgZicH3YU6ALJI5RkRbPwDaHL432IvQf0niE7ZEdVrYe98innEa
         NjlUXd6UyiFw2L8emhVCkLnlCTvksbZf2WABAUwe6LgPYj0To3N1ktv7BP89n9IofdxV
         bR6u4/P6ZnBuKmA6p+UFUKdJRDkc5QfLl/OV3ujWx7LmU/Q8ziIpjen/8gpOVymmS/08
         K8QGSYHGoa+6B3vPyK2WVzyGkJE6eZBFqMKMPXEcyZfL91Mf9v9rSs1b/gl5Pcf9UCb3
         066w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723112118; x=1723716918;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uHKU+qWDGf01eQdWksVZpo4JSdzafD6OrXnwsvy06EY=;
        b=ZEHDpveVHwfbvrNmJ8ugJSyRhdOFpkimXgrlighz/FV6Z7zFPu3R61OlfDOuZ2Vm2A
         BxN+Fl/uWDvjrdc68pvmxDFLjfEf/sYC36J8hYTlTH5NzyYOkTUPntUwN9dAAvZPXerO
         lSiqtvBWuIgFqz9Qm6nJ1umm7i77gYibd6WYhsoHNFWBxZX4d9iUzawdMnbuPDtE2dRf
         99TybxzvD7Y8LDN5RgG3ZjrT8BOjCP9wGNpX4ON1O7QdM4q2rzYeAw0fqtMINXT+jzBi
         griO5pA3W0hWvrua67gQux7tlb27G9U/yY8xQioi1vHGTZg87ezy3s6DfbUHwY+XWR/O
         NWHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFr+zDbwog18Tky+5x/Z9QvF3QsNO9bGqYVaxiXYBaQDP2Wh4eajPjwW8t8Muw9UU1FkU4Taf2qXrbGJe0YnjSmiFfNTZB6mFQLFooWcEtMiU=
X-Gm-Message-State: AOJu0Yy2o7XP+xWsxmVeAqnreGl7zEkOlDjHbnSlshGskk7nANErx67M
	G1AeUIXSNgXEDaa7/06lacOP5koQzYoK+UBQY7icDtXPIwDErT5Tm1FKpQBGY/n2s3HfyKtNP8P
	81kc=
X-Google-Smtp-Source: AGHT+IH20/85w4Ip7Pzi8RePzbDVoqHc01uOa2goRjWmjwxMDR86wk62jwXwrKpXG/AxjdYpn/0xog==
X-Received: by 2002:a05:600c:1d05:b0:426:6e9a:7a1c with SMTP id 5b1f17b1804b1-4290af0fc7fmr9739075e9.25.1723112118023;
        Thu, 08 Aug 2024 03:15:18 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:ae7:4e79:8821:15db])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4290c74a96bsm15015415e9.24.2024.08.08.03.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 03:15:17 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Jan Dakinevich <jan.dakinevich@salutedevices.com>,  Philipp Zabel
 <p.zabel@pengutronix.de>,  Neil Armstrong <neil.armstrong@linaro.org>,
  linux-kernel@vger.kernel.org,  linux-amlogic@lists.infradead.org,
  linux-clk@vger.kernel.org
Subject: Re: [PATCH 1/8] reset: amlogic: convert driver to regmap
In-Reply-To: <11e8dd92e07674133d8a291cc016c314.sboyd@kernel.org> (Stephen
	Boyd's message of "Thu, 18 Jul 2024 12:29:13 -0700")
References: <20240710162526.2341399-1-jbrunet@baylibre.com>
	<20240710162526.2341399-2-jbrunet@baylibre.com>
	<b12ac6b2-cb46-4410-9846-86ed4c3aea1f@salutedevices.com>
	<1jv813makr.fsf@starbuckisacylon.baylibre.com>
	<f5bc9590-f37e-491e-9978-c1eab8914c30@salutedevices.com>
	<11e8dd92e07674133d8a291cc016c314.sboyd@kernel.org>
Date: Thu, 08 Aug 2024 12:15:16 +0200
Message-ID: <1jle17xqvf.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240808_031520_163205_4CEC8A45 
X-CRM114-Status: UNSURE (   8.57  )
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

On Thu 18 Jul 2024 at 12:29, Stephen Boyd <sboyd@kernel.org> wrote:

>> 
>> Full analysis is following:
>> - using regmap_update_bits() instead of writel() is incorrect because
>> this changes the behavior of the driver
>> - regmap_update_bits() should not be used here because default value of
>> regs isn't taken into account and (_apparently_, the doc is terse) these
>> regs could be updated by hw itself.
>
> Maybe use regmap_write_bits() instead.

Actually regmap_write_bits() performs an update behind the scene.
You'd still get the undefined read value making a mess AFAICT.

I'll stick to the usual regmap_write().

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
