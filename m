Return-Path: <SRS0=Q7B6=2D=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F59EC00454
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Dec 2019 22:27:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3726D2077B
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Dec 2019 22:27:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eRYbh+9O";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Bp//zj4J"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3726D2077B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XkcevnHXInRURjmxA7oE1ASmiAT8cQYvF5VM8nsCtxE=; b=eRYbh+9ON+vDpo
	i6q9ru9rDfCfdXD3ndQFE3OkZ63Wbt0QsqTsBf+MKuhNtk4zj3k7E+KDanOlFd8Z83a9/zgUn9uNy
	EvlkPkTaKhjkDWVstgobD1bjWjRaK5c9qHDZZ7GqIi99ICE4kUhbPOmViigr3LPvGtMoA2b/y4tav
	NTelGepjy3ue1DX4oShnFBo+Y1pdyxcnN/5KTkVvFZ+jhGF41FKZY7XewuQrMEoUkM9X0hUipU9zF
	Oi32rMcnvsd8P/36sq4pluMkIX8vsB3w37pt7xDbcH33K4wDludDqT3JzR3DlA/4IQLubCS6ThsPC
	vwg12MrKZQyUWM9Rr3+Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ifo3p-0005cu-Mq; Fri, 13 Dec 2019 16:45:01 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ifo3m-0005cG-BX
 for linux-amlogic@lists.infradead.org; Fri, 13 Dec 2019 16:44:59 +0000
Received: by mail-pl1-x643.google.com with SMTP id a17so1458882pls.5
 for <linux-amlogic@lists.infradead.org>; Fri, 13 Dec 2019 08:44:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=fmI0q2QLwZdi1/ko0IPKbdfR0E57YPB/Rs3JgkuWmOE=;
 b=Bp//zj4JBODXzYJJt7veZ/peeeptebZ8fr4dGpjaOgGTbKBdU60fw5XQE6jAF8ljhD
 VkU64UqGutn0G5bSFoAJ59Rb+GV6l70KWPlLdZ/F9MVdyN4z7XKlN/laM9deWvBjbuCx
 1U5k61e8NBl9yGOQEL+C9RBShdt9tlxPbaeSr/gW3HtrGGLRwJ2jb2UcE+9xd+KNPKQz
 Jj5MaiJxpRC6BcyfsAGEgEiqu8je2bBaaJjpnWzpUI3dvMJtZKJR4WOvciBXMF+vLbsH
 Z9i6D5YgK/zoTQaD3aRhDfkIzWNPOkSigMn9f7jqZtvXga86iIBEQYOM0BM1eYVYi9Jj
 DcLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=fmI0q2QLwZdi1/ko0IPKbdfR0E57YPB/Rs3JgkuWmOE=;
 b=c8esHYndwRY1XmLyFQA4/Eb0k4TsIzlUhMmk0zL5FD8sJXoA9B82oHkn3n33T1L54Q
 a+NmKZtdBKADxPQA3FSjVKQRECE3MxtPzRSwED667d4uSnq0P51zBHQWxGDTu1xzueod
 MI7bqOalEKYDK3t98OxjM0aZPDkHf0yOsPBXLrgySdTWovIC+Uv6j2qRWgfH+xPIdAPr
 RgFVKmF9RjEQY9Jjqy7G0Suz2QcYdAEREJYfN2MSRuPurRHjWNqPJYGH/6HwniXOJGY+
 c//hzSzhkw58sfru4asfVKIjGeLZ3AYGixsHeVk79B5A0BL6IyT1DLQkkQyWFW8DePH+
 SXEQ==
X-Gm-Message-State: APjAAAW8ZcTw3xiRYWzh4UNcTOGUhuwe3FEvJ7MpOkH7Ps+7u7T6d7Jz
 9iutfoT+qHXo3fBBC0lsjTZxRw==
X-Google-Smtp-Source: APXvYqym6EAp5lYCv8KMi1Fhh/VFm6LJynE5N3+KB+ys3E7f6IvzFL3EHBCYw3mNN3ueV7B57ro+vA==
X-Received: by 2002:a17:902:6a8a:: with SMTP id n10mr241277plk.9.1576255497466; 
 Fri, 13 Dec 2019 08:44:57 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id q11sm12167725pff.111.2019.12.13.08.44.56
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 13 Dec 2019 08:44:56 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH] clk: meson: g12a: fix missing uart2 in regmap table
In-Reply-To: <20191213103304.12867-1-jbrunet@baylibre.com>
References: <20191213103304.12867-1-jbrunet@baylibre.com>
Date: Fri, 13 Dec 2019 08:44:56 -0800
Message-ID: <7h1rt89nuf.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191213_084458_538750_936EE710 
X-CRM114-Status: UNSURE (   6.60  )
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
Cc: linux-amlogic@lists.infradead.org, Dmitry Shmidt <dimitrysh@google.com>,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Jerome Brunet <jbrunet@baylibre.com> writes:

> UART2 peripheral is missing from the regmap fixup table of the g12a family
> clock controller. As it is, any access to this clock would Oops, which is
> not great.
>
> Add the clock to the table to fix the problem.
>
> Fixes: 085a4ea93d54 ("clk: meson: g12a: add peripheral clock controller")
> Reported-by: Dmitry Shmidt <dimitrysh@google.com>
> Tested-by: Dmitry Shmidt <dimitrysh@google.com>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Tested-by: Kevin Hilman <khilman@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
