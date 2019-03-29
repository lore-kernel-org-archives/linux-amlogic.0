Return-Path: <SRS0=wRYZ=SA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4EC3C43381
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Mar 2019 20:52:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98062218A3
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Mar 2019 20:52:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SpudkHW+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="ibnDC32K"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 98062218A3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/fVVVCHwrzVklIB5jA6PUfszUxr1fAXocROszelz2+8=; b=SpudkHW+WEyHJM
	48vlPqsps2+i7VIgXRUpuCAJAPsAUF/XbzLLg0nvVxtjrFiAsZTmbhN3ABxjU8Q8Bs6ZTupUiy9EY
	trX4BJGWz4aKzBsqxOyVFkgCeUIjFyKP2GdH54PTggq5IIsqxEag6sga1bwecdUlHW6ITlToEM4Z+
	efMFuUpy+KvGBWPPJC9aqVkZkJqdZnMD0yQNRoWm/uumLl6hP8/Z8thI3NbzvaY+t4Zm1aWo7+O65
	nhv/r8Oes46oun4ycuMc1sCDOzP39Yhq3ZmeuObcs1kOU9aQ7oYKZ1h0B2pTURBhTwZozeMkOO+Fg
	Iwb7fHbuWYPpQMkm/raA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9yUO-0004dj-M7; Fri, 29 Mar 2019 20:52:36 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9yUF-0004WJ-KE
 for linux-amlogic@lists.infradead.org; Fri, 29 Mar 2019 20:52:29 +0000
Received: by mail-pg1-x544.google.com with SMTP id 85so1764249pgc.3
 for <linux-amlogic@lists.infradead.org>; Fri, 29 Mar 2019 13:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=cGY50xjzFVSSIAoX5cwCjdfaK62U/LdZu8eZMT/M774=;
 b=ibnDC32KJ2cDA6C2Tt7GSOXBsRpxpQl+4E0ViAi7xIhikv0fQyNapSvygQ4MoFHdE/
 3T2KlVhKW4qsiu+jUZtBB+CCZWJqq15zjkb4NwkBAhl7v6njxzDrx+eN8ZYK9v21Pxbx
 srX6wu3I5wlRGthaD8pKC+XEysMjn/+2ZV8POrMezmywHO7gGjewMY9o4JNAaBtJpYIJ
 07JVx02iOQ9ugzvVbK1g9z2tShHHbRHZv8uw2WcepuJ0Sjk4Y/p8idBleiqFGdEwHOpF
 Do5dQV8gpQsc+C9bgm19DXLN60P7ebOua+bELkUIonYLOzpyBoLzEb6yRwSEoQZUiiZ8
 XHyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=cGY50xjzFVSSIAoX5cwCjdfaK62U/LdZu8eZMT/M774=;
 b=SrMtEOsAYSd4Zsmi86rjCYf7whZFKeJU9ZXSz9NdwUv+jqm/KVMA+Z5W++MnhBlvIE
 ea/ChUihT+viSbheydpobQyW2Jr33NIyU+xEYdBebLqf6rr/QrEkZ1pAseneyvrF53Y0
 6+3AEEryAOqxKMMXJctDyBkjyrMw1hGBV11eKeMS3DfF4bbjX/CijvQQd5T/eAcXr281
 VZueJdLYOEcLl+LJV+bOnh0PfZVNtPnGMXAlVEh1NlxEOXC4UIyguVwUxonxLMYbrvlq
 Jt2q2/EOyfW8dwXBw9EoGCvZElSnrY8H3M8pm2vU0fmKFYqnugcznq3aY8kFs0babDUF
 gN5A==
X-Gm-Message-State: APjAAAUSBovKk6+HpSB1qBe+CC7HDKhEcR6EWZi+nBy3KRYgfXqDr9Vk
 t6Ulw3saRNiUiGLYa43K2uZ2iFg2H0g=
X-Google-Smtp-Source: APXvYqxvt7ngPciCp5/4DEnTpJkJyGJSP1TfNvd1SSO+6ZdawVnV/KXvMTnwArFRfikZKd+tOqMMzw==
X-Received: by 2002:a63:4a4d:: with SMTP id j13mr47074131pgl.16.1553892746309; 
 Fri, 29 Mar 2019 13:52:26 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152]) by smtp.googlemail.com with ESMTPSA id
 n65sm10301733pfb.160.2019.03.29.13.52.25
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 29 Mar 2019 13:52:25 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v3 0/6] arm64: dts: g12a: Add boards peripherals
In-Reply-To: <20190325101453.3009-1-narmstrong@baylibre.com>
References: <20190325101453.3009-1-narmstrong@baylibre.com>
Date: Fri, 29 Mar 2019 13:52:24 -0700
Message-ID: <7hmuldwghj.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190329_135227_813676_C3A3044D 
X-CRM114-Status: UNSURE (   5.98  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> Following [1], add regulators, bluetooth and ADC keys on :
> - meson-g12a-x96-max
> - meson-g12a-u200
> - meson-g12a-sei510
>
> Dependencies :
> - Patch 1, 2: None

Queued for v5.2 (branch v5.2/dt64)

> - Patch 3: SAR ADC node at [2]
> - Patches 4, 5, & 6: USB nodes at [3]

Looks like I can queue these as soon as there's a stable clock headers
branch I can use.

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
