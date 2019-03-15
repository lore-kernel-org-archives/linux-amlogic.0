Return-Path: <SRS0=BQut=RS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFC97C43381
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 Mar 2019 21:16:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9CB4C2186A
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 Mar 2019 21:16:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PwQct572";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="b9K9gySO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9CB4C2186A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3SKqhRnR3r//B10Dams5kyZOGDMlFEpml2ClYUX1O68=; b=PwQct572JhstGl
	K0uHvoYKB3oOrhjrUoT/5UcGGsLMp53zZPf5SpQGg5Eh96paRLSpsKZh/HxD7ftngaqjUCCcMHsE9
	Y6YV0ceQj5w2Ybni2hAmt9pN1VjpwxdOdUK9VF5Zfys7GM1SEXUY60NaPE6caScaG4RL/a6QA1tIK
	sNIZFtJonJtvdy9EcNVTWUOKupqd2r7KY9sbGLJD5u31IfxA6ZR861rcjAq8YXMET62owFPR/StY3
	AZYMwTAObhJyIT5ZutBRgRMn+L7yu3yycuLbqU3xnqY1IYy46VaCsQrus/Iz4ukCbOJEhZ1FWG6kM
	VTgqzBjs/9j0tyyKDpWg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h4uC1-0005jR-ID; Fri, 15 Mar 2019 21:16:41 +0000
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h4uBy-0005j6-Nv; Fri, 15 Mar 2019 21:16:39 +0000
Received: by mail-oi1-x244.google.com with SMTP id u12so5541451oiv.1;
 Fri, 15 Mar 2019 14:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CGGR8l7ZhEyPC+Uq7I15TeHxFirEjOjPYiPcaqY8A8I=;
 b=b9K9gySOwM9Kt8K6pQ2/9raP1GT7rSRzvnHNATBXojBJJq3f3Q2hXBvCrQhpyUvF0p
 whoPZJJxes2kaQd1P/5+MWCt6XN3+TpfdtbQ1YIJnEf2UEVWlZ0cJ85Om3RdVjKfWO+t
 EeReaOpaKWyjLGFKw08LJTpdtRHcuB2x0j5leMJT+lGlgC+jV0y33znBwIfH7eBvaVBf
 WZKmK8vzS5XbTLoR2zMue3gYrvpridl6w8jiBFOextnMSgvVsfrIiCl3y2PYXWpEgxo4
 9nBL/sq/UZEB5fg3MvpujSmsWZl1LZ6wq9gGFF9/WAq5QpYoSfXr9T6KMvP/ODBt1e/6
 iPzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CGGR8l7ZhEyPC+Uq7I15TeHxFirEjOjPYiPcaqY8A8I=;
 b=P7bGv+wXF3Wc/9KK1/9YRWsjexGFBK90Y7lyQbGIUpJrvKaXb0QVz4e8RRxtio1iTQ
 omsW3yLyEHqBQz+SD874yr9oyYPb1exBJY1KJnpZo30SNY/rXjmWBmrZvIGAuxmijsI5
 Rv6n6EbHJNjrL/020OAHpK7emYDnINJZKXErbjAxD98YHZ0NZCvVwK5f7AxvggzWv4XA
 G4WLg7RghrB8EpfteAMC3pleC7zp/0aCyHFiONK79JUNWP5auUEdcSNoxte0Q1z4BrtA
 WWB2wBgyLOWeVdfBOKUmaLZ+6Zbn8BYeGoWvUfrxYG7QtFQ/sl8K5H7Y4GgXAi3Z/br9
 bLtg==
X-Gm-Message-State: APjAAAX+Qs++1QcJykUgE3K8ekhJ/dDtvIZ/Ws2uYc7FVpq7mmDIv+n2
 Z7nhBeL6tFDOtlq/6kH/AvGHDrkFXpmSsIV9nok=
X-Google-Smtp-Source: APXvYqzw+m0vFbRkhAfgbes49irYzTkU/qUnWHxpoZCkUHefXDMMHPzkmnhUyGdEgly0OL44bEkZ/ONiStY6xXppJ0Y=
X-Received: by 2002:a54:4e02:: with SMTP id a2mr3005399oiy.140.1552684597495; 
 Fri, 15 Mar 2019 14:16:37 -0700 (PDT)
MIME-Version: 1.0
References: <20190307151342.7381-1-narmstrong@baylibre.com>
 <20190307151342.7381-8-narmstrong@baylibre.com>
In-Reply-To: <20190307151342.7381-8-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 15 Mar 2019 22:16:26 +0100
Message-ID: <CAFBinCBKraoQXZL6uOr0Fd7QQX6EKwaheiViF1TcKnX4vdtFhw@mail.gmail.com>
Subject: Re: [PATCH 7/9] arm64: dts: meson: g12a: Add SAR ADC node
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190315_141638_804714_62D2C2C6 
X-CRM114-Status: UNSURE (   7.01  )
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
Cc: khilman@baylibre.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, Mar 7, 2019 at 4:14 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> This patch adds the SAR ADC controller node.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
