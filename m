Return-Path: <SRS0=8AZD=GH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BDB5C433DB
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 Jan 2021 16:05:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F0842072D
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 Jan 2021 16:05:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4F0842072D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Kj6nh6ir5KmyfCGYO15848LnC45jL7EwaPhqsDK93jU=; b=1yTyHzLaN+RW+kcCGWi9A+/2y
	5CiR17LJmNwV9iyfrYh39vLgcmWpKmdch+68f4LI2h+zlmQ7iwxZ4go+KKewnxLk6T4svOahNJ+8M
	2B3XJyEoerlISJtEU/nxk1eE0uJvpJOSAINmmq8FdH4NRGlzi5MbtvXppk/stkx2uK2+GJlJnIEgw
	pbGrxrlfhu9YkBR27Yl9mizbvcPPd/O62doEvGFwpyFI/xru7GDIELZKn+PMA83u5FjUewE/yF9+F
	qcrDzpNqaLzGENRCJRlgdnqgFY8FZqOMokLndv2n4yXyBvTKd9bUC8WP7rXrM9eQjzCYwvFt+krrs
	CPel9+Njw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwSLm-0004d6-86; Mon, 04 Jan 2021 16:04:54 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwSLj-0004bX-Bj
 for linux-amlogic@lists.infradead.org; Mon, 04 Jan 2021 16:04:52 +0000
Received: by mail-pg1-x52d.google.com with SMTP id n25so19340824pgb.0
 for <linux-amlogic@lists.infradead.org>; Mon, 04 Jan 2021 08:04:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=9ySUyqHnb2Bu/EFFSYUbKAOb0257YZr5FhrjovHluhE=;
 b=kU9xnURePHBTQ0qBw8ozGrUHqPEPNFttdeAtwovYK4xhWiLpt4D8hM7rsrpTlAZIjJ
 8nQkGcuj4GC9D8SLD3q4zMOwHBSbvmIufgzsiil8YqEB5nM7AbwvUt8Xe/7IidEV7oDS
 30bCHIx3ZDmFXhAMnB98isUIpCAaFPn6ylbK7fQnWuXz73uHheMdqfi0U8bHloj0g53e
 sGRAuxynNWHJfFGnXnT5yO6OmSf/PiT8t+k5EZFT+GEJZFoIcV8FIJm5SU/CYMn+ZDcv
 SIrW8HwEoPE3jh0lgxHoOe5kjtikz0l7FL2JSqdSjxo1FL4lcAT96FFTnISp77QoYVYX
 urYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=9ySUyqHnb2Bu/EFFSYUbKAOb0257YZr5FhrjovHluhE=;
 b=tZcIt4ndYXnkRft8TQl8Mo5m9npqymnq1O+mhvMptGS3KgJ6QQtAJ73NEhorgxY8WJ
 q1qtaCoN51pzxHwESUN4257pnmGElG3OXCCeMHPXX3xm8EnTadh4eGqGIxChmh/+1o8q
 Z3BySyTcoQ2VHMNIZom0S6agyuzWoNsb8Q+EKp7j7d2a2gdG+YyJLPaybRjh4X8KQVQJ
 HH0mAbmfVjasjywoTkhos3GZ6jOc90H6a6e8wHtZXfYLeQzvUjb/TYX6Jnm2ST94WP3i
 QGNHk/Gni3jNwA8dHZLwJJ7Ch4fFLjg0uTTP8LRnNPi5zaN5BSK/D0OZ7zCnUSmJhmxk
 g+Mw==
X-Gm-Message-State: AOAM532To9bdXxBQjX3pgt96GXIwK8EuL7Iw8QSNjkmffmmiLbhmwttU
 BFQ4qojw92keoxmKiM77MBhr3g==
X-Google-Smtp-Source: ABdhPJyfm0XQK6gCh/zYHr7iLrA56OMUKYHCwQzIIk6uEgzKmzMiRH6PQOXJkaG3WVRmivsaUgoVSw==
X-Received: by 2002:a63:445a:: with SMTP id t26mr71872848pgk.402.1609776286507; 
 Mon, 04 Jan 2021 08:04:46 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id ga12sm21696625pjb.48.2021.01.04.08.04.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jan 2021 08:04:45 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH 1/2] arm64: dts: meson: vim3: whitespace fixups
In-Reply-To: <20201207095346.26297-2-jbrunet@baylibre.com>
References: <20201207095346.26297-1-jbrunet@baylibre.com>
 <20201207095346.26297-2-jbrunet@baylibre.com>
Date: Mon, 04 Jan 2021 08:04:45 -0800
Message-ID: <7hy2h8n0wy.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210104_110451_532806_CD0269F7 
X-CRM114-Status: UNSURE (   6.11  )
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
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Jerome Brunet <jbrunet@baylibre.com> writes:

> Spaces have been used to indent 2 nodes.
> Replace those with tabs and remove one extra newline
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Queued,

Thanks.

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
