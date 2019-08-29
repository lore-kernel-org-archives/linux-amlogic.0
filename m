Return-Path: <SRS0=jO5x=WZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73292C3A59F
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Aug 2019 23:03:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F54F2166E
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Aug 2019 23:03:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BM/aM2e0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="E3fc+Ebe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F54F2166E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=65t5aYacy3AcoDi/OM61OWOv8+Cwe04UhOnoc1cxYfg=; b=BM/aM2e0FVM6j6
	6aJ+6qs/Wr4ZhOVS1mTeJmzs/qk/IXfVmYv6ErSxsG7bBIgvwS2iJ7T0dMXj5jtJeo9U0dzb+k/sa
	24mqM5e37n4U1cTR3KJtq8IVuJ8yFGvc7+C7LxCP1kuydMQJvrd9Q7VActB35YEzNS7a7BDS2JUkG
	FsVRF70UuxuyhRSce9CvwOYz7JybcUMRXrNT9TIMvTTJSr4MKaPDPvQb7NdrMETNCjyPJWKKf0AI2
	FQR92ZCzWtrak4MdI1d0K0Xvq5VvLUmSicg1VTCQc0MLt2cBp1z6j+g+XKoIsDeLb4SLaTK/XjFnT
	iKB/6ouSCPP88KngkJpQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i3TSK-00010L-1r; Thu, 29 Aug 2019 23:03:52 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i3TS8-0000rQ-DL
 for linux-amlogic@lists.infradead.org; Thu, 29 Aug 2019 23:03:42 +0000
Received: by mail-pl1-x642.google.com with SMTP id go14so2322317plb.0
 for <linux-amlogic@lists.infradead.org>; Thu, 29 Aug 2019 16:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=9YyWUF96nwE5mShasDD/q0vy2KUwpho+jHAD/EggO/w=;
 b=E3fc+EbesE2EnnhcCkWNr8OeFmAiwB31tGtH4vMsizr2rJN5JhNxgrjqQjoCpMGs5s
 H+KUxXhqWFilM9t6kGV1egEdo6P8RfV3nLFoXUFcn1xJyPw4voXgSqZuRtSrWdevm/dY
 gF4y1CwkCYrculoIZcBjcc+6FfLqDrdODlxFXaBQskrV1KDFp2+WFp7XBQJ1CojMfkuc
 a6Gw8mcXGXMgKWd8rup3ZWQo4YBcJQCYRSSMHmqCj6RGE418K+fIOBytns/WZHqJa/Sr
 2akE1oNntrr98DnrZTp5Unlf7MBdhOouoMnmTgsVlItUcfk1VOQ1nWQ9lRsbL/BdDe6I
 475Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=9YyWUF96nwE5mShasDD/q0vy2KUwpho+jHAD/EggO/w=;
 b=QJt5ULDdtWFgLvbmqp+ezlqxpYEewpwSlcVbIcYk7j7nzOKta92vEPrsyqmvTKJHcs
 Njqcv4/rkpzD97LFFhwYxQgay3ngQ8Ryt8LxVht3DmlEo6Ces+ZN5jvO49ZutpCimfSb
 rjO1vXgYAPMyGjUhw41zRMV2rZttZt59Fb4orOqoTGBbIdfn6vkOuo+D50/cz488Rmt5
 ePnoSKthkNVyKrhTXtjcCM6TePgmGGNOL91nDibFWezlJk9vd3q4qexCJac4TV/I/00y
 wNG3zyY6ORHh6lERmBQYZxrmyTjzp3StVSkjgvxzeWIPFn1xNIy0ypaSzhr1Z73BoZhI
 bw6g==
X-Gm-Message-State: APjAAAUujKN8OxWCGYDLxZEAOf9qUkEjaEJQjJ94cxTRqF5jP/Qo/rIc
 /p34qZ1Bk7Heq50+FoZOJ+5pmQ==
X-Google-Smtp-Source: APXvYqzsxpgvCbGnvWog6IzW12Snn8x1XyrwztFdkSvGC6j6ot+16ICVrd51JSm5Q5xuqVBXFpTAZg==
X-Received: by 2002:a17:902:7616:: with SMTP id
 k22mr12347002pll.315.1567119819497; 
 Thu, 29 Aug 2019 16:03:39 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id v145sm4676778pfc.31.2019.08.29.16.03.38
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 29 Aug 2019 16:03:38 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: arm@kernel.org, soc@kernel.org
Subject: Re: [GIT PULL] soc: amlogic: updates for v5.4 (round 2)
In-Reply-To: <7ho907rfsf.fsf@baylibre.com>
References: <7ho907rfsf.fsf@baylibre.com>
Date: Thu, 29 Aug 2019 16:03:38 -0700
Message-ID: <7hsgpjo9px.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190829_160340_502123_38F74385 
X-CRM114-Status: UNSURE (   8.40  )
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
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Kevin Hilman <khilman@baylibre.com> writes:

> The following changes since commit 49ed86f503be80aac158a567c4cfd31cf1cd181e:
>
>   soc: amlogic: meson-gx-socinfo: Add of_node_put() before return (2019-08-20 14:53:33 -0700)
>
> are available in the Git repository at:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git tags/amlogic-drivers-2
>
> for you to fetch changes up to eef3c2ba0a42a6aa709828e968b64bd11f4aeb19:
>
>   soc: amlogic: Add support for Everything-Else power domains controller (2019-08-28 14:29:37 -0700)
>
> ----------------------------------------------------------------
> soc: amlogic: updates for v5.4 (round 2)
> - add power domain controller
>
> ----------------------------------------------------------------

Please ignore.  I messed up some dependencies.  I'll respin/resend.

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
