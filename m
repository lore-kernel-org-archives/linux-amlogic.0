Return-Path: <SRS0=uQWM=X7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B090BC4360C
	for <linux-amlogic@archiver.kernel.org>; Sun,  6 Oct 2019 15:48:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 685A32084B
	for <linux-amlogic@archiver.kernel.org>; Sun,  6 Oct 2019 15:48:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Bg5qsHIj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 685A32084B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B9TiiMOXhoEt4rxUSJ/4RxexodzSnsF3Ark2YUNyzaU=; b=Bg5qsHIjcAwWCd
	jeT6RTeRAu6BW7oF35cwh1NJcac1G0a4OT5PrVZ+ylL+jcIjNRwgbFxwsAYOfSRGjmO6JNtZuVz+N
	lGdnL0vc+Y8EmPazr8j4adJLY6eHTYIz5T9oKjKlRf3PvX7KuypUsohx9t4X8CZyIcPAwWgUUhBSV
	eJGDVxwQToDPZiQjfuiK5xxuG1ciQmy8xGb4j05K6ooxBePalbnWYj+e63t/no5EUBR+nv5QlIAwB
	fcfYcRhv4iJJUTXfxv3rtXqFCwhVWXWJj7qccTvaMtQA3i8GErC9FD6vd2oqHOatvdi6D7O03lbRx
	TOIcA2JDuOYUi+zctepQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iH8lA-0008Ci-Uf; Sun, 06 Oct 2019 15:47:48 +0000
Received: from mail-wm1-f67.google.com ([209.85.128.67])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iH8l3-00085z-C0; Sun, 06 Oct 2019 15:47:42 +0000
Received: by mail-wm1-f67.google.com with SMTP id p7so10068981wmp.4;
 Sun, 06 Oct 2019 08:47:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=SBpRb6qd+48zQK5uPLn0YvEluIoUY9o3FhFhGA6TXtY=;
 b=ajwMrKqGGs+MSWgpQfn/qD44uavgYXu08qxi+o2dPt2G5n0vFweYdR8/OJ3wLzaK/f
 f+NL/UMT7eg+pOjTs3b6umOrQaKw9eWOP/jHhopdSpgSrFZb+cGuVaPQLRSKJGD0RDiH
 RBm8UQwfG8zDvZIVpobqT5Ut3LGcFNJHu1Bueovpg1peleJFfqLMk0myApAvJkMEBdMj
 U6RUY6nR9YxxE7+hPr6HdfU2bI2+776A4cwSjrrqU6ou1Ccg+lZHZltTV1s0FC2vcDVu
 NnnwoTC8Td+xoyQvcM4AaEFr0hXuxU3ZmBIRNZjQsGQGIslGt9OQAMDnerUd2YDrdX8I
 Mdhg==
X-Gm-Message-State: APjAAAVN3nktyLWNOJZstNhsKVJh+2GsAZj4W8SKIS/b6rlV99K1v/fI
 BuekligCLJbg9sUr1ACAi/w=
X-Google-Smtp-Source: APXvYqwiD5w33vuIYv9624AWG0k3vsCYtE8uO59mkpTJi1G/TZQDv7OS1UJvxH3zuwZ0w6XxIwuUIQ==
X-Received: by 2002:a1c:9988:: with SMTP id
 b130mr18139392wme.164.1570376858781; 
 Sun, 06 Oct 2019 08:47:38 -0700 (PDT)
Received: from kozik-lap ([194.230.155.145])
 by smtp.googlemail.com with ESMTPSA id o22sm31539882wra.96.2019.10.06.08.47.36
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 06 Oct 2019 08:47:38 -0700 (PDT)
Date: Sun, 6 Oct 2019 17:47:34 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sudeep Holla <sudeep.holla@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-media@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-amlogic@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 3/3] ARM: dts: exynos: Rename power domain nodes to
 "power-domain" in Exynos4
Message-ID: <20191006154734.GA29365@kozik-lap>
References: <20191002160632.11140-1-krzk@kernel.org>
 <20191002160632.11140-3-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191002160632.11140-3-krzk@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191006_084741_409730_1409EAA3 
X-CRM114-Status: GOOD (  10.82  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, Oct 02, 2019 at 06:06:32PM +0200, Krzysztof Kozlowski wrote:
> The device node name should reflect generic class of a device so rename
> power domain nodes to "power-domain".  No functional change.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  arch/arm/boot/dts/exynos4.dtsi    | 14 +++++++-------
>  arch/arm/boot/dts/exynos4210.dtsi |  2 +-
>  arch/arm/boot/dts/exynos4412.dtsi |  2 +-
>  3 files changed, 9 insertions(+), 9 deletions(-)

Applied.

Best regards,
Krzysztof

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
