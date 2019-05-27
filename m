Return-Path: <SRS0=xEjq=T3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75C7CC04AB3
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 May 2019 18:06:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4FD1C20883
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 May 2019 18:06:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dvSuDMQC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="VIMO5j89"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4FD1C20883
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3Ta9Ygtv2KxXpewWD7BlXfcL1NgMND94eXwDcyFA6gs=; b=dvSuDMQCtSd7Tr
	n2UecWCRP2z40ECXPvdJl/tTUJcfGXv9LLEPSFT1DCe5ndCTbCNkh2fIvXOOJ+J+ZUqOuKxHRXl6L
	tefsTAeIJQ5MUAiJlH/BNcp2OcwjU/x5PjkKNcI6VtSw4aGOsP7ytbBOqxF6emmGjUOhVBKzrnlwD
	AmRwXbgUcyrxWX6+7u1bqsSukAVG82rIuk3PJY/eCZFLhXX+LQGPsaErXSVDnzIb2uhmr+5KtKB2T
	YgQl4Tf6468nBQ5W2VO3MEUEQE3dBdS2UeIM0oEJPMwBwTZflQeHT6A40sNVpRxzyuQpMGKAmy0Tp
	jsrJ6x68kN+vc6vuTvyA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hVK1L-0003od-3F; Mon, 27 May 2019 18:06:51 +0000
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVK1I-0003ll-CD; Mon, 27 May 2019 18:06:50 +0000
Received: by mail-ot1-x343.google.com with SMTP id u11so15483948otq.7;
 Mon, 27 May 2019 11:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=snK6jJsPt2cSi+KLqPDOwYhYAz49h47RS/7FICnk118=;
 b=VIMO5j89eAKkZ3BZaR3UNVrOBTq8G7EzDz2d7UVeCRB3QmXVlk6gO5QBY6a+zqiSwq
 XeT5TmkLs6P1XgBDRpyJBEVhem40JqYvx6iuHyspme1Kqc1kSXc2P32gr5PS+Da4sLRs
 2kCm7xAkLqqaxYpogKocEDBaRqkgFZCwEcnTupyT6lVj+5Hno8Pp1DyqTzaem3jl5VP8
 3tduNdligrKsnpDlQTofcESHOElwHQuM46FMAclszjZLa5I3MbX7c43WVg253VYEXXfr
 oonqzC/yZDOC2f2eX24JhPWEv/1HGnIhgG0SJSiMHLhjOgnMZTJkHZgIC4BoiAxlxFgj
 ZMKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=snK6jJsPt2cSi+KLqPDOwYhYAz49h47RS/7FICnk118=;
 b=Vs6+YzjlVUSAytevRVxNcse6EeiooNpdu/O/Zu9BIRX2DkGk1UFocI3TvRmU5js3zZ
 NJtw9shRyuDU9v8Ketdq1clNP0NJK2EjE9C2qlxC8OY+NiJ2/ENf3iFssGS4xnlVU0qL
 p6GfcML/84Wax+APNKNCll70ywJuQwWwCips11XaTmNvZVJFlTmu6JWre2avrG9PIWKt
 8ep2HJyO7aYnrbOajVZYsosAgNOZ19MIpaYlEnCYej76UWYK9dwtGqDxlBz6FnZag1Fs
 0CRioMAwIUoaBhm//8/pT9hgqun3PQ/NSjlg9gjmnT34+PeV1lAnq9AlQk6xKef+U9N9
 rYPQ==
X-Gm-Message-State: APjAAAUowrJBYOFLVOLJOLUKROwHZJz4UmKv7+NwULEfVyrTmVMplNyW
 ntB5LM8kkV9tligxV6tMK9d6dBlr0nYQByyUIA+pV9JseEM=
X-Google-Smtp-Source: APXvYqzNvbybIxun0sU5draEQ7ge3c2t/2uDs569BXI/oeZpZdVW/zg90e+PwWX1spRmfHdTfLHxqYz6QYBGe1UcujU=
X-Received: by 2002:a9d:32a6:: with SMTP id u35mr61296326otb.81.1558980407622; 
 Mon, 27 May 2019 11:06:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190527133857.30108-1-narmstrong@baylibre.com>
 <20190527133857.30108-5-narmstrong@baylibre.com>
In-Reply-To: <20190527133857.30108-5-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 27 May 2019 20:06:36 +0200
Message-ID: <CAFBinCABE=C3LP+8kxvBiuaiXVmKM6j1Tkxhi7tdXZcRy=qJNA@mail.gmail.com>
Subject: Re: [PATCH v2 04/10] ARM: dts: meson8-minix-neo-x8: update with SPDX
 Licence identifier
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190527_110648_442942_CA79A977 
X-CRM114-Status: UNSURE (   8.29  )
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

On Mon, May 27, 2019 at 3:39 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> While the text specifies "of the GPL or the X11 license" the actual
> license text matches the MIT license as specified at [0]
>
> [0] https://spdx.org/licenses/MIT.html
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
