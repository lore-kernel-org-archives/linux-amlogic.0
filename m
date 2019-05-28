Return-Path: <SRS0=WX2S=T4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 176C6C072B1
	for <linux-amlogic@archiver.kernel.org>; Tue, 28 May 2019 18:21:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D995E216FD
	for <linux-amlogic@archiver.kernel.org>; Tue, 28 May 2019 18:21:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iosAIYAY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="Ojcs6udB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D995E216FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iqedfXjkYSMu4+PT3/UZVf5qtjvNOpDZwARA1dAqoG8=; b=iosAIYAYwWhqXC
	Nj0j/zgTODTKoW8VfHbsF441PgVvZM+akdUTJbNSxXSj4q8JrXoYyL27s7lck+4DC9Y1GpK/Wk8yp
	oCtBwWtN78YkIpA2ke7nU5RH3Hi4Ca/MjlpEDhYlaVCFKW5TrAI7+H78mo4xN4oCKyxFVvkRPjRV1
	DiH0kJgku+ZNb0Mi1OLmX9ouVdy6jXTV6QpsMuz7niVzFhsM9p9KBLX4gqGpZhXapy+XaT7K9002a
	FLKziVFVA9d7r9MgFN0UbPBdzlobMhPpfKw9hU+Q42LfjYLI5yrP1HZX8VLX0IWuWFypbUtRkTIpC
	Retd3J48Qb1Kqq7u0ksw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hVgcI-0004Dl-Su; Tue, 28 May 2019 18:14:30 +0000
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVgc3-0004Co-PO; Tue, 28 May 2019 18:14:28 +0000
Received: by mail-ot1-x341.google.com with SMTP id r7so18667510otn.6;
 Tue, 28 May 2019 11:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LPvFSy/+Ol+ZuQMgkb+qnJE+L1Iql0hHfM4lKqsprYE=;
 b=Ojcs6udBEkePD30+FubBfExeTjFdf/YPOSYCAUMwiskoT4bMtWzZOPU9/eKjyPOG7U
 wVAlr775HDvInKKs9ocAemTOAMS11GS5df+uZmdNUi27faV9vJvZnuQC77iYUGzfY28o
 pPd64Eyv8SmCOroCDWO9P3uhnW5BMAAPYzWJjtLLkdLrQbp662bgEcrPAqk9B1XOkqX3
 mJLxI8CS0ikanr/A+ddV34f29i+OkHMjuc4IP0CFELBtD+09E+zlfQB/LYE/HBANMPyh
 tRwogab5N70tW5YDnREToqiEgRSlTZyRCdQQA4xwWIZCJxCWC1Ms+/aWZEVVz5KK1rg0
 7DsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LPvFSy/+Ol+ZuQMgkb+qnJE+L1Iql0hHfM4lKqsprYE=;
 b=Mf4VxcqTgj73obOxwYyoci44qpk7JzHkVOazH+IiqXacpPxeKM226bNHjxK0aJrvOD
 09BxQLk4PdqJ0H7HG9KnmmSF9McstMPWl8IueBVBkMteYhCsYeI+pWJnDO755ZwFhUL1
 epXABoBc91HcpRqG4KWdIbdz0F0VpNvRniAiAfdNIaVRb02tfQr0gsKrGrdIJOOCkT9J
 u7cMT4jvF8PR/IYOpD6LREVXO2cmvA1T6x9HQ61mqAhhlcaoPAJ9uASjne6QAETSCrgN
 DMtrcfmBmKcQbwCxrIYoYeoSDJFMFqcyj79LGPZ3vYhBOsbKvkZN80gdGkR//7ECIoow
 aRXA==
X-Gm-Message-State: APjAAAWMaL4k3rDt8pxHKdYyAOe7sWQIn5cVg00pKcoYfmMsEBgV80Zk
 E+LtU8APtB259jSUjacrDw7rTSScAGoOIBOtJew=
X-Google-Smtp-Source: APXvYqyagHBu0OgYtX3i84tIgx8uv2A97o9m+a9iuX4CshpGLW7d441lQy2nxKnxaNDuCwtbZifs7QCWJ9IKORrBOo0=
X-Received: by 2002:a9d:69c8:: with SMTP id v8mr22334562oto.6.1559067206898;
 Tue, 28 May 2019 11:13:26 -0700 (PDT)
MIME-Version: 1.0
References: <20190528080758.17079-1-narmstrong@baylibre.com>
 <20190528080758.17079-3-narmstrong@baylibre.com>
In-Reply-To: <20190528080758.17079-3-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 28 May 2019 20:13:16 +0200
Message-ID: <CAFBinCCMfTL337=HtvoXDDznfqhH+i0N6NAj8qBPso84XFoJBg@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] clk: meson: g12a: Add support for G12B CPUB clocks
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190528_111415_825318_BA8D10FD 
X-CRM114-Status: GOOD (  10.86  )
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
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Neil,

On Tue, May 28, 2019 at 10:08 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Update the Meson G12A Clock driver to support the Amlogic G12B SoC.
>
> G12B clock driver is very close, the main differences are :
> - the clock tree is duplicated for the both clusters, and the
>   SYS_PLL are swapped between the clusters
> - G12B has additional clocks like for CSI an other components
>
> Here only the cpu clock tree is handled.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
thank you for taking care of everything I noticed in the previous version!
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

do you still have the CPU post-divider muxes (which are currently
modeled as CLK_DIVIDER_POWER_OF_TWO dividers) on your TODO-list once
this is merged?


Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
