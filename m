Return-Path: <SRS0=il4G=DB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB031C4363D
	for <linux-amlogic@archiver.kernel.org>; Thu, 24 Sep 2020 16:51:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50F4321D20
	for <linux-amlogic@archiver.kernel.org>; Thu, 24 Sep 2020 16:51:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="l/9DcjTC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="sF4Hvgm4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 50F4321D20
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jIUgOX0qBczJkfRGG8r5N80MNIRt0Hhf8PjPaf4U1ds=; b=l/9DcjTC1dgJN6sKmEDW1jrgk
	MP55yAymxM8/ZouOIAWQJIREfCMnod8Qir70lzPaYfyYAVweuKVhh5TrRVBJzRoCGTXdl1SYB/dy5
	SzfC1zh6HDtnHl2wCeaD4LxQI8FcghVY/9AD4ooAJinW2WK4Q0MEEXYugNk46LXZ+XkHH1Z3OcQ1M
	8f1IUAOTVedscCrIjles1dMW8Xo01j3SnbP7VKPEq0PuJDEphgYdE/pjGGD2YaIc38wvdE43XvucV
	wUfetkNRTGwWtxzVzFORRLJA71SymTRc04VcNse5ZVef7Tovj0/uHTSIvRVzhnojnHMhvWnKVDaCy
	GnzMBHp2w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLUT6-0006pv-Tr; Thu, 24 Sep 2020 16:51:40 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLUT2-0006os-Uu
 for linux-amlogic@lists.infradead.org; Thu, 24 Sep 2020 16:51:37 +0000
Received: by mail-pl1-x643.google.com with SMTP id bb1so45809plb.2
 for <linux-amlogic@lists.infradead.org>; Thu, 24 Sep 2020 09:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=pqeo0+ordMchNpddfhm5pIn2x8EAw5l5wTXt0uNN9GE=;
 b=sF4Hvgm4kE4UY9UGDBSe8f4ma8iHmxFAZNIt5H8MCPfcaIiNzIXkGYHTymogy+iEiT
 U8I8xqOHeOahNcl8x/e+C05gCZStqTAretO/HD+4exa1iz5kB92IfS4jJkEjVm0zZHb1
 Sk+cfPP4F7V5wttHlDALP6WJ81IKC70bKmLmGv99Zjm+bcwfgSXK/hH80cdpMnudY1jn
 dw6bz8lx8/DMRk+PSn5GpTct1LaaLkWX9PMkZN/TB1TZ6Bfov4J/2vaPnBlJky8Q2QYa
 r5v1NcL+lpR8VaQGrfX10y2zigf0igp3STUwuzAgJaYnDQFed+oOFAuirquCVSCyOJYi
 K2eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=pqeo0+ordMchNpddfhm5pIn2x8EAw5l5wTXt0uNN9GE=;
 b=hJQP6TDCf/dv7KwY5rK3jxMOCYpvr9Ury6jFE6O4nG/dUrL4gGHlR4azOjG1K25yHf
 fgWYgmAD1W9QzJLqwPkS+4qHOF+6z0JZMOrxO02skrqNgh3zrNMAlHeXVYMZ2EOFlQWG
 Oc2k4gjbYlHYiwrB6pQf8iT8bXB1cOR3vK7kQWlz0SkYQAQC7rWgeScgrjg0gLqlD8hF
 VhU7UsvkibFxNqwJurgM3QB/xzRrRncGdY20QoHtY4ztv+Fcc2hOy41TcvpjTQNrBnWj
 VFwFgBaT7s7ms/54+DRoIRIphdct+EeBnCp0gOvdTKdINh6ksi2LZp5jBxRlpQ26m70W
 iztg==
X-Gm-Message-State: AOAM533h+5q+0xDIjmNPCFDpJ2/JJw5d82VMnREfjyusKz4u/MkOKLkX
 HuckuI1KJbHGxn1h1gC5zVF+nQ==
X-Google-Smtp-Source: ABdhPJzMSHbGLYo2g5Z7rZjbVaYYZcqg1CIZzhc7X74SKXOwebVurVfHHNo9UKwz9SPSEe+LGjq0TA==
X-Received: by 2002:a17:902:760f:b029:d1:f8be:b0be with SMTP id
 k15-20020a170902760fb02900d1f8beb0bemr90676pll.9.1600966294797; 
 Thu, 24 Sep 2020 09:51:34 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id q65sm3327621pga.88.2020.09.24.09.51.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Sep 2020 09:51:34 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: remove Maxime Jourdan as maintainer of
 Amlogic VDEC
In-Reply-To: <20200923160910.31968-1-narmstrong@baylibre.com>
References: <20200923160910.31968-1-narmstrong@baylibre.com>
Date: Thu, 24 Sep 2020 09:51:33 -0700
Message-ID: <7ho8lv9kyy.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200924_125137_032671_8A60F464 
X-CRM114-Status: UNSURE (   7.50  )
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

> Maxime is no more a BayLibre employee, and his e-mail address is now invalid.
>
> I'll be happy to add him back using another e-mail address if he wants to continue
> maintaining this driver.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

Acked-by: Kevin Hilman <khilman@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
