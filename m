Return-Path: <SRS0=UlVA=OW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2CE9C67839
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Dec 2018 01:52:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98CC420811
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Dec 2018 01:52:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tM6FeUZr";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lixom-net.20150623.gappssmtp.com header.i=@lixom-net.20150623.gappssmtp.com header.b="ByY8CpDX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 98CC420811
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iWkkfgZ8/8fwCmunZV2SpRAKI1rMdQP4susYEAOZpj0=; b=tM6FeUZrWd85LH
	Wca92bdYgfUsWxHrPQRNb32LzxeGQ47I51eyuJptums7xF3YpTWU7fmD95SuF5nuFRm+9OjLAv1Bq
	TLnJGQNxK+eDojzTLLw1V2ajxTeXTAk79tV+OChVfnVKpF7Xi9ruZLqj0eSq7qZyVnZdYTZnQgF64
	KmAz03rdsZnEnDnxjmN57YvUIsoc4IZg9HPyk/LVDTaX74bHY3L2IZojuBNXTRZkL3zg2OLG3J30u
	Qn1osGKtJA1vc9w6cIV7c4o6jHw6vPRligpYxRXK+YYDRkQkeYG8cTWZWAzCwKEhy3IrsSXTc70//
	Fs2uQGLzpW8PofJ8rXNA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gXGAu-00059Q-R8; Thu, 13 Dec 2018 01:52:28 +0000
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gXGAr-00058b-LH
 for linux-amlogic@lists.infradead.org; Thu, 13 Dec 2018 01:52:27 +0000
Received: by mail-io1-xd2c.google.com with SMTP id s22so343277ioc.8
 for <linux-amlogic@lists.infradead.org>; Wed, 12 Dec 2018 17:52:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lixom-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7Sh/8tg+p+bV33QXiedI77lw2JdiNLBCp9uVCg9kYHE=;
 b=ByY8CpDXDlbX8AmkFtMVAYwW8fqpsCZd8TixzCRNtSoNzq0c23z4BNs/fPqez/aNl7
 ywHAUv81k89YRHfIvdqk94I0MIYXnh4libKzLEPpwxzWx0WqJW9u8DJ7a06yieHtKCe6
 QTxiTS0UlUZrlLYwhTThVTXunxFqynLQ6bq0almVogVLrCcQ5zO+uzu4VtoFqodbsHgs
 dr107V5Fe9ClHjrBL01Han9q/kxKCQ/TC2GT2987e2gX0fLPUp59W8a/opsfDPMIqqxs
 nV8V8p+BFPU3yEg9u1LGQ1tt3BIpneY6MUOa7exLiR7P8JkIMAMAy7KtqVEwxYfbAxyM
 BqWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7Sh/8tg+p+bV33QXiedI77lw2JdiNLBCp9uVCg9kYHE=;
 b=lC6H+tSMQpSUW7W4V+OD+OKyvoMUTgLQIq2ZdGVsMpWSU8Kht6zG69mmEA89EZcSww
 O7EdTrrB0S47Y5igcXnmmtIs4f04cS/W6op6f94KZJYaqAXGnS/63adDRVeD9pEBTI0a
 UVbKG/QmWM4/8zPgWJGWjLO8lZd0eJmny0nXrkv6qzyiLfhw6tpzB4p5VV5tm0LcW3Fg
 CGn/RyUpa5kP2UbjBRypLJnOqxwesg0OE28IkjW8t5+v+XfwfFRD4HRYagWG7DRs3YOF
 +u81iSyO3DxSTmXQBFrKCibEPwbqYECBjFhlInZP8Kwny64J243lkPSBqdk0NwvZTiIn
 BU/g==
X-Gm-Message-State: AA+aEWZeh5R1RZnxfpllmY795GJfAOhs5o/tgKywxaaF0KxhQH443d9+
 b8tTrg5+vM5z6QYvzw0njBK3J9mWaUPRdyTJcQx5OA==
X-Google-Smtp-Source: AFSGD/ViJUO+P2ZUlsTtAveO1YF4Ls2pWpD1eKSlUWG63jZjPVww9aTnMORQuUWsC2whMAZ5tZ5kaQfxFG0vG9g4X64=
X-Received: by 2002:a6b:1414:: with SMTP id 20mr18581386iou.140.1544665934237; 
 Wed, 12 Dec 2018 17:52:14 -0800 (PST)
MIME-Version: 1.0
References: <7hsgz2s3o7.fsf@baylibre.com>
In-Reply-To: <7hsgz2s3o7.fsf@baylibre.com>
From: Olof Johansson <olof@lixom.net>
Date: Thu, 13 Dec 2018 09:52:02 +0800
Message-ID: <CAOesGMgqfAKZG_X7QgBtOeAuLm3uxdiKgpZDVUx+G4DAmkRx9g@mail.gmail.com>
Subject: Re: [GIT PULL] arm64: dts: Amlogic updates for v4.21, round 2 (redo)
To: Kevin Hilman <khilman@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181212_175225_812269_5AB35059 
X-CRM114-Status: UNSURE (   9.67  )
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
Cc: linux-amlogic <linux-amlogic@lists.infradead.org>,
 ARM-SoC Maintainers <arm@kernel.org>,
 Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, Dec 13, 2018 at 7:53 AM Kevin Hilman <khilman@baylibre.com> wrote:
>
> Arnd, Olof,
>
> Here's a redo PR.  I dropped the bindings adding resets to Mali which I
> mistakenly thought was uncontroversial.  I was wrong.
>
> Kevin
>
> The following changes since commit 5e339a1d7e438b2cc9f46ec9f2682efb58ee2dd3:
>
>   arm64: dts: meson-gx: Add Internal Clock Measurer node (2018-11-29 12:30:09 -0800)
>
> are available in the Git repository at:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git tags/amlogic-dt64-2-redo
>
> for you to fetch changes up to 8b3e6f8999f8d704fccce225b9455b3fa639d1c9:
>
>   arm64: dts: meson: Fix IRQ trigger type for macirq (2018-12-07 13:48:58 -0800)
>
> ----------------------------------------------------------------
> arm64: dts: Amlogic updates for v4.21, round2
>
> Highlights:
> - fix IRQ trigger type
> - AXG: enable GPIO IRQs, PHY IRQ, watchdog

Merged, thanks!


-Olof

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
