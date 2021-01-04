Return-Path: <SRS0=8AZD=GH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C52E6C433E0
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 Jan 2021 16:13:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA4A4221F1
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 Jan 2021 16:13:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA4A4221F1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=u3bcg84LfZOFg/ocp7yBtn5bnngDcwYbL+a43kCoiDQ=; b=CrcY2j3CJl2xAbSLZvQ080+U2
	r4tLQrOpHbhDiMUV8j6CHdcOtIVxuSk0AeKHi7pFR2r5njR+czkzXvFsncZnfuu79oiclyd5jukzB
	IerS36NZ4XPP/nUkjZsHkk0k817GeEyrvHq7jfHb3dFUXjhWqrzXfiVxpV4XIKvYuicDc6w3wo6XT
	oVy5kHStrGatULfh7xpuK4ZZkN8MonmZZYoePuAASOX/JSWSrsadPXt+h6KVyiP9Ocs5Q716ihFPy
	2zhHjewPWNZD7m6peg/tbfQY2Wo2mEfP9OhJ0s2R9KS+XnFNX9NjprsrnAnPGE+vDCuG21QZCd44v
	hqCcssxIw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwSU4-0006NG-RB; Mon, 04 Jan 2021 16:13:28 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwSU0-0006LC-9U
 for linux-amlogic@lists.infradead.org; Mon, 04 Jan 2021 16:13:25 +0000
Received: by mail-pf1-x435.google.com with SMTP id t8so16701381pfg.8
 for <linux-amlogic@lists.infradead.org>; Mon, 04 Jan 2021 08:13:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=XDfsTJvF8BHWT/MwLCJjoGuI8FbQRWjKjuVmDMQxU8M=;
 b=mVSg0/91IdSUQNfDZ1CuvV95N73XydEpcMZEkS9cLA7xrpuWEiKRa2CwBZBPaqSQbf
 ocOEQT2NMLlRGb0bYAlWV0tAEwWiBQT6oD0B3R2HBOzslWIJuKCKxOvRcA8YVg8RuZCJ
 d+vXwIENA93kVBVD0o4HxoNca6TMZj6dR+MSqlqg3SsF3LCbMyiItxYf45L2Fx9mIXCT
 EgYSdh8fowgKMvxdlF0b62BbRW/O/kTFqHWpWr2nu2pXEiS1+moU7WAnHxO4/Vxa9+fC
 DCn11syJR9zxjIk3rNxjyZn4kIqPwvbR2yyRVqEYwC7dBZ1wEJnAMiB02GypqSDIEU8r
 wvfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=XDfsTJvF8BHWT/MwLCJjoGuI8FbQRWjKjuVmDMQxU8M=;
 b=rrhGsD9/pg+04p2Gn5BK62kaNT7Cd3FUceRjH2DlvgsNtvQmirR6ppI55Nrxq0w0OI
 JmdKqKVpqWY7xhBkGVJhVkXYRQoU7nmTP+T3fzG48qtuXgWS/5r4U6wHCdFzgm1f4CUY
 /9FP0ipA1Ncj3GxLJIeeG5JCQo4qAoRIyhzuk1cTFRLsxTC2UdfQwGfKE7S1l8zPpgUe
 839dakq8WXYKoNtMTQZv7P8OlQW6DEUobHqtc9xthPoBXX7timAcLD+bipS9raZbURN6
 VaDuMAthc3Ly9SYQAKshNBQWpJ1AviscXKYzqEIlcrG59yQQeCUlCsxnst02ZmSqx7LT
 v8ug==
X-Gm-Message-State: AOAM531WCXmnYEoT+FAJm2vO5bJTo6HZd5RTPJGiIh1ElvjQI9CnKffC
 ljFJlC08F3xr1GBib1656GPXxA==
X-Google-Smtp-Source: ABdhPJxiSbquKtEEXiVFyDA3gyCmMk8WaU6Pzjy6k497zwZtHFZ3/TlUj90UnzII6zSWOz9L7Y+WYQ==
X-Received: by 2002:a65:6659:: with SMTP id z25mr61934189pgv.427.1609776801878; 
 Mon, 04 Jan 2021 08:13:21 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id q23sm57413879pfg.18.2021.01.04.08.13.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jan 2021 08:13:21 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Alexander Dahl <post@lespocky.de>, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v9 4/4] arm64: dts: meson: Fix schema warnings for pwm-leds
In-Reply-To: <20201228163217.32520-5-post@lespocky.de>
References: <20201228163217.32520-1-post@lespocky.de>
 <20201228163217.32520-5-post@lespocky.de>
Date: Mon, 04 Jan 2021 08:13:20 -0800
Message-ID: <7hv9ccn0in.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210104_111324_414917_73396725 
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 Alexander Dahl <ada@thorsis.com>, linux-kernel@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Alexander Dahl <post@lespocky.de>, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-leds@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Alexander Dahl <post@lespocky.de> writes:

> The node names for devices using the pwm-leds driver follow a certain
> naming scheme (now).  Parent node name is not enforced, but recommended
> by DT project.
>
> Signed-off-by: Alexander Dahl <post@lespocky.de>
> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

Queued for 5.12,

Thanks,

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
