Return-Path: <SRS0=O3JJ=Z7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBAC1C04E30
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Dec 2019 22:12:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B0A18206E0
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Dec 2019 22:12:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AjPLuKt8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="PLTuiULk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B0A18206E0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CZUfhyh09ZLKC8uufbgbEGNCM71hJLo2KwuopTQ7iRg=; b=AjPLuKt8y2Vtf1
	OoxiFxBmhgvOTjV+tF6S1pawKvYldsb360CVk7K1/ZzSxowH+fbqJq5BP1N+qU2G9IMu6gf+SmEQ+
	mjHRIBNEu3wAYZac3E6jDFdJHmYJl87pGlquRJx7yntJ0gpyApRHRmZemOvLQuvUG/1lRQZVsKPIi
	WpAWAJHkmPFqFfmPksR0XYeRJ+Of9TfBrVaLQiZmBSAEVxieCe0cXKPKyByrCBkpXgNIFK4ep5oWr
	YjUzMrsqpLPcWONL3gmyQ0neYlp6EhXoed/JtBopHX29lwHKQpnt9qEVvkuJwQxo5q76RChsYsTc9
	1B7dNQQt/nmb23GbVbgw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ieRGk-0006x0-6N; Mon, 09 Dec 2019 22:12:42 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ieRGg-0006vb-R9
 for linux-amlogic@lists.infradead.org; Mon, 09 Dec 2019 22:12:40 +0000
Received: by mail-pl1-x642.google.com with SMTP id o8so6379518pls.5
 for <linux-amlogic@lists.infradead.org>; Mon, 09 Dec 2019 14:12:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=ItZ6nMPESHqLIASUC8LoX6fE4/wm+TwTGtRQ1RnKUZ0=;
 b=PLTuiULkvl88lhZJ7eXEZyEeyBFYh9ogHEt4KRJu32M2cSkg+0HS26NQbqT2+JfAs8
 dFf9qlMcSwGgR4627eFALudbNGexXTuCa6SEd7v3Hx7SK9dSKEmEDuk0v3Y9NsZMgpq/
 mxKlvx6opX6J7hpzmDQ29YK/mcz6eYhMYpvY7riVO3pCebZFVxPLkDvLO1gjPrP4dbl0
 qw0SWvQc7uOLp3QQ6G2B5Umx3KsUyg6T/YMGTRGxF0aoJzaXX7Q/e5NoJnusYIyu4tta
 Y4nffcrao80vVYOpikWwtkLJbMFNjwwLDRDUfSTT/wF3gKdXO1iPaFge9FbUtvSWhNtK
 rqrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=ItZ6nMPESHqLIASUC8LoX6fE4/wm+TwTGtRQ1RnKUZ0=;
 b=EYf33nSRpOMI9nDfFjJ3dN4ygLWsKGliqM/FUHOjtbnbcv4tsav94aA7tp6GHWnBVv
 U5HAWn6HFdTVNvcNWe+NH5WoyNHNtV7gCvYlLyKMslIc896gnfaSfk6LmyUB6PFnPhok
 8tfcLN6B8e10Az4+oShJpubOciinA6G57ddIfxLmXsHygA/zTF7/Yv6jGPbLe8IALcaE
 n1mlexGXjnn0MD0oJYOeJyir6m6GTpyclCZ6xyPRvAsouFYy2Z+0IBIw/scj/vFC9hmq
 NJ8OGU8A2AruGpwpIn9Izr0dLq24iWTq04sJ7HMvnpYeRs6Ychz8zUwpgro2/4IbfUs9
 QGyQ==
X-Gm-Message-State: APjAAAVpmxnKXOtbfPvaaoMsRIOuSLg3PJN16pBe2qsnSp4Cje70FT6F
 jJvNhbO9cojneiN1gzzgFBZa8A==
X-Google-Smtp-Source: APXvYqx22xb5jLxK6hTsSuOBQ53SZCEaDbusHD9ujqDQUXDe6tywX359eNJglK+iOHzOxi2uui8Ynw==
X-Received: by 2002:a17:902:a614:: with SMTP id
 u20mr31864485plq.107.1575929557672; 
 Mon, 09 Dec 2019 14:12:37 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id q13sm345574pjc.4.2019.12.09.14.12.36
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 09 Dec 2019 14:12:37 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Anand Moon <linux.amoon@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [RFC-next 0/1] Odroid C2: Enable DVFS for cpu
In-Reply-To: <20191101143126.2549-1-linux.amoon@gmail.com>
References: <20191101143126.2549-1-linux.amoon@gmail.com>
Date: Mon, 09 Dec 2019 14:12:36 -0800
Message-ID: <7hfthtrvvv.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191209_141238_904828_6944F6E6 
X-CRM114-Status: UNSURE (   8.47  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Anand Moon <linux.amoon@gmail.com> writes:

> Some how this patch got lost, so resend this again.
>
> [0] https://patchwork.kernel.org/patch/11136545/
>
> This patch enable DVFS on GXBB Odroid C2.
>
> DVFS has been tested by running the arm64 cpuburn
> [1] https://github.com/ssvb/cpuburn-arm/blob/master/cpuburn-a53.S
> PM-QA testing
> [2] https://git.linaro.org/power/pm-qa.git [cpufreq testcase]
>
> Tested on latest U-Boot 2019.07-1 (Aug 01 2019 - 23:58:01 +0000) Arch Linux ARM

Have you tested with the Harkernel u-boot?

Last I remember, enabling CPUfreq will cause system hangs with the
Hardkernel u-boot because of improperly enabled frequencies, so I'm not
terribly inclined to merge this patch.

> Patch based on my next-20191031 for 5.5.x kernel.
> Hope this is not late entry.

Re: "too late".  FYI... when you post things as RFC, it means you're
looking for comments (Request For Comment) but that it's not intended
for merging.

I didn't see any comments on this, but I also didn't see a non-RFC
follow-up, so I didn't queue it for v5.5.

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
