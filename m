Return-Path: <SRS0=bWzJ=UG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82AE0C2BCA1
	for <linux-amlogic@archiver.kernel.org>; Fri,  7 Jun 2019 22:58:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 523EE206E0
	for <linux-amlogic@archiver.kernel.org>; Fri,  7 Jun 2019 22:58:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KI0fkt1D";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="EDRoEZ99"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 523EE206E0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sTHkPJZKi8kbcJiFoT3T4c0LAFuqN4161PntaucG9EM=; b=KI0fkt1DcupDpP
	uVnoXY4LWnlCyepMrQuCfe2gFERQ3RXE7cvtsQZ1h7SFL8M+ra7ZLK0g8cOLYKMyT2A8M3rlezLS7
	G1qcW3TluNOdQ5Ioyb0M5+DyFXRH72lBmC/tfc3Qs3HOubxIOGULbRKIsnYF0Mgr5jtuUwWLFqQcZ
	SopY2mVjJ+ARBVTvfFJOYaL40qzY+jfObAXf4pE7/7Uei02IHDPP9verfQML4q92qjrnhBGIGaugS
	JtDq83BrNXfdWtq7uLnMSzhW8wnb+rRxEJ8T1WQhHGjMkZCGe9ZBOH8SYm9PXDjJeA5VBeYaFadtQ
	L3qzImGTLWaHz7QnU51g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hZNoq-0003zL-Ve; Fri, 07 Jun 2019 22:58:44 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hZNoo-0003yi-EX
 for linux-amlogic@lists.infradead.org; Fri, 07 Jun 2019 22:58:43 +0000
Received: by mail-pg1-x542.google.com with SMTP id a3so1893193pgb.3
 for <linux-amlogic@lists.infradead.org>; Fri, 07 Jun 2019 15:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=vA7iPSfOkgn9n9Lxwnw4ESV8GeztXdxLFk+OG9qi8cA=;
 b=EDRoEZ99CHv10cAFbNfRoc4bPXZoorDcRpw2VbYfhED8yUZGDxB7fmOs7gYz09/POO
 1dRqh2mN/+U3Y5iGDQSI1Dv0MkvElhhHEBtC1Il7lElMCF9DUeIpRxzodvWHWpaU4eRc
 pgMylh2u2oFIWFIjxyfDI3/+FMiJJGz1jlD6CXcESOagQIpuC8qnivZE8TCT4GDwwuwU
 TsyXmdWFbQ4r9Zc3ztcC+A0E0gDPlI8HNQvdfh8azf5RcyicRyD5x1TrdMnDIxnTZ6rr
 tr7XDs0c7oEpAiITXpd+fIpmKhFlgITbvEGAK7ChBb1q0QZ5vR9KAzbmJEXYTClgKRs8
 Tmcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=vA7iPSfOkgn9n9Lxwnw4ESV8GeztXdxLFk+OG9qi8cA=;
 b=ez+0zBS73d+xc31jcY3ywZRqRkJJpEON5CIELthM+Lz2XJPRfi+mwkfYx1fkPScYdv
 3RtYgxCCQxL2wn/cDu46lhlgRSBVpsNL6M+JSRHWqPsrHUKKaCgDRYeva9wBe4ZO7cn+
 J15mgAa7PDfuVYlLSR3kPTHsdiky9wFmbKzOGbOLDosqlMxiU3w6yghz504kaA/uaDTD
 5FgbTyNZsLS9wc9eROqZp8cN3wLvwcGY+VnrrnsyHbKMUJqfZGUPU1+TFf0IGASXsgqH
 Aey6xyz5kCHR5nUmHltkUyuEH7q5iFPkhQGhZA5OUu6TXcQwTSiYbv09IOKJH048amlc
 YK1Q==
X-Gm-Message-State: APjAAAU7n1QD87rEQkrLnMquy2hv4uOnyPP1HqFNLZWqJ2KsnrvQRI4L
 OlDUPM9Ptf6QE3eOtCOZ3ifeMQ==
X-Google-Smtp-Source: APXvYqwiBWoaaveRWBPUG0jXO6rGa0EnNmkAq9RGYUkVwh5pzlb6H8dOTi44KPQ2H+7hsZEvMN2DEg==
X-Received: by 2002:aa7:8219:: with SMTP id k25mr63254539pfi.38.1559948321852; 
 Fri, 07 Jun 2019 15:58:41 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.googlemail.com with ESMTPSA id b7sm3041930pgq.71.2019.06.07.15.58.41
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 07 Jun 2019 15:58:41 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v2 0/3] arm64: dts: meson-g12a: mmc updates
In-Reply-To: <20190607144735.3829-1-narmstrong@baylibre.com>
References: <20190607144735.3829-1-narmstrong@baylibre.com>
Date: Fri, 07 Jun 2019 15:58:40 -0700
Message-ID: <7hd0jpatpb.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190607_155842_489965_17F6C2A7 
X-CRM114-Status: UNSURE (   5.76  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> This patchset :
> - adds the SDIO controller node using the dram-access-quirk
> - adds SDCard, eMMC & SDIO support to X96
> - Add SDIO support to SEI510

Queued for v5.3,

Thanks,

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
