Return-Path: <SRS0=0Q1W=UM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45599C31E45
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Jun 2019 19:52:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF06E207E0
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Jun 2019 19:52:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QsqC29Rd";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="WjINMRpt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF06E207E0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zkdkABNv3ElnymUSyJW7J3b3giefjh+IdZ8BUWb0lUU=; b=QsqC29RdvmLVnt
	UcAxQdPCgXD19dt6nyotMWRxNZIYgt3GYVjfeK1QpAq6VSlik+sl/DAxZZbCU86NX6f6NY5LvKIuy
	axs6fLTzMTHF5Kluq9PWfkfHr/gEMQ+jLGGiIO7mIE+i/3VfXNJfgAFdRdnz2SXTqyOKnrvT0LNTk
	bAif6lFRD5e4Cn1AhJq/6uF7F2Ni6oBJL2jdO/Ak7CdtApPOnlm/fyTx5xZAqsH4Hz5LnMYbE+tDo
	jhMvgK3Zl4vbQnP60BZq2E7qWOWvH8vWKgNt6P9/0SNXSTrmPbTdjP2sek9a3b8V4tBP8oxWqXmGN
	XRjbgW381rG5NgyGpOlA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hbVlO-0002P9-2d; Thu, 13 Jun 2019 19:51:58 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hbVlK-0002Oh-Pf
 for linux-amlogic@lists.infradead.org; Thu, 13 Jun 2019 19:51:56 +0000
Received: by mail-pg1-x541.google.com with SMTP id 196so107999pgc.6
 for <linux-amlogic@lists.infradead.org>; Thu, 13 Jun 2019 12:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=OzDF3aubB5pSwPDekd3OuhaKbAjZcfEkdUY9h4rLw7Y=;
 b=WjINMRptrJCvqpriro1+/6ZHJSjOgh/X8F709MMSEdo8kX+mKNdaHOXm+Zy0bxbk35
 k5PcOmIg9I1322RePlSaqR4u/qXbH4D9iYGXs+2ejEJeNmrjPgEfhkqiQoRGkDAXsoNu
 KJTNQ2oYHhqhz/XytpC0yf4Ff5dX588KMPJmpYOmVsPStFY9C17TUHFGQ4vnkK0/Vgwg
 u6xktb/5oqO3FiDtxmfV9SayDhOPoowlKmdf6O+9c/vlEW8pLCJgLOoOz6YpJGHXaR5K
 jtGKbG2LrXe3TeWT0NWGfa5L6QpGIKJxHogBMCjJq5ivB+nQmKKw08vtc6A2f2IWZ26e
 tqlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=OzDF3aubB5pSwPDekd3OuhaKbAjZcfEkdUY9h4rLw7Y=;
 b=Li9vsm2nVnABMe0CO0SLdmNpSUGJUYRUIBdNA7kT/U3Pt6cv75J+/H5qk3+nhg/KdA
 WEpfBThTbOEnofXfUsoxbRyYcw9VFONTQym9jsxJ2I/6o9Gm5Kl/0nejVL0dPL0KSfP4
 9ZV49zQoppQhC1E+hjgzCffsAR7irFgipc58ptioxiAHXIVhaHFtfoDnXKjkL2e9QAeo
 uZs3O6KrChpZ9z5JUxPsahGYXZaEhE/7T8G3WVMjbHdUqx7sewvebROtwNkSxM5lmxa7
 12od+uh0sH6TjhQQdJQjZEF+zKrO3GYFn0xY+F6jQgbfQcESdyDa7btifb6PoOTvI+KE
 VxSg==
X-Gm-Message-State: APjAAAXoPFltJMuMUzIeUzQXL4BWfv0FWakLVF11iujTw+vS37jocdRu
 bTLOsExcQD6mYl3o/iy/xxeKvA==
X-Google-Smtp-Source: APXvYqzWf9uvz00p9UwGWsnLphTuN6d19KekRXTMYzPsxoeKEysN+l0QHmIjFIaj4imLXrCJLxsQCA==
X-Received: by 2002:aa7:90ce:: with SMTP id k14mr95327159pfk.239.1560455513966; 
 Thu, 13 Jun 2019 12:51:53 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.googlemail.com with ESMTPSA id u2sm683435pjv.9.2019.06.13.12.51.53
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 13 Jun 2019 12:51:53 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: afl1 <afl2001@gmail.com>, linux-amlogic@lists.infradead.org
Subject: Re: [PATCH] pinctrl: add tsin pins for meson-gxbb/gxl/gxm
In-Reply-To: <20190613183846.18679-1-afl2001@gmail.com>
References: <20190613183846.18679-1-afl2001@gmail.com>
Date: Thu, 13 Jun 2019 12:51:52 -0700
Message-ID: <7hzhml2rhj.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190613_125154_844897_4E8CAE4A 
X-CRM114-Status: UNSURE (   7.04  )
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
Cc: afl1 <afl2001@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hello,

afl1 <afl2001@gmail.com> writes:

> Sorry for previous two emails. I hoppe this will be correctly formatted.
> This patch adds missing  pins for tsin in meson-gxbb/gxl/gxm  platform.
>
> Author: afl1 <afl2001@gmail.com>
> Date:   Sun Feb 3 11:30:17 2019 +0100
>
>     pinctrl: add tsin pins for meson-gxbb/gxl/gxm

Thanks for wanting to contribute your improvements back to the upstream
kernel.  We really appreciate it.  I have aa few tips/comments for patch
submissions:

It's still not quite the right format for the changelog.  The author and
date are not needed (those come from the email headers).

The changelog will also appear in permanent git history so the "sorry
for the previous two emails" stuff is not relevant for that.  Instead,
just summarize the changes, and epecially answer "why" the changes are
needed.

You're also missing a Signed-off-by.

I highly recommend you read through the "Submitting Patches" guide for
the kernel here:
https://www.kernel.org/doc/html/latest/process/submitting-patches.html

Thanks again for your contributions.  You're not very far off from
having this ready.

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
