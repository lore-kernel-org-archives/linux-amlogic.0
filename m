Return-Path: <SRS0=XvYc=TJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,T_DKIMWL_WL_HIGH,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F378C04AB1
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 May 2019 17:34:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E718D21783
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 May 2019 17:34:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="upRvhpyG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="bzNv4L1M"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E718D21783
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9YT0JkWErc5namELh8ndWAbhxKtKsfAdW/EihYqpjtk=; b=upRvhpyGDAoHCq
	Myk6S/ELe+VAEeYQemewZspsazjU/3cK2EE1SM/lWFUjMzjvUjKgROKSGsrX5YniiHzbwrpx06F9o
	NDknQy6vq8ZFThWAuQ1uRRmztt+6rrDnDDi7JafEEyti4YnPACE447Zx2NJOIlXIeKQruT+vdNygY
	Jn6Cl2pVl6U/swrFtut4eCdnu+xQo7qtLDcc5nzN6UmOeCCYrNFd6CVAN/ML5UqUKeEYsNvdPKbUj
	lxB7cGPiQ83Gii9oEjGR64QCuOyHdSVlUfIlWFtYLNjtdu9xPiZj6jkOlr93drubReSQBHXnJk5SK
	YLDLx3037mTvAj1K/COQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hOmwL-0003k2-BZ; Thu, 09 May 2019 17:34:41 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hOmwH-0003jE-GT
 for linux-amlogic@lists.infradead.org; Thu, 09 May 2019 17:34:39 +0000
Received: by mail-pl1-x644.google.com with SMTP id g5so1484930plt.2
 for <linux-amlogic@lists.infradead.org>; Thu, 09 May 2019 10:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=NV8a2i73WVKMbLkPe/ykYUDMcv3XghE7mWCl/3SVv/k=;
 b=bzNv4L1MDrKiasCNxfbxCkBQ9X3YkMoS0qsgQKS0FtFlKHET55fhcvqLMiusJECl5l
 q/33EuO92lW5akeoBjO9Pim9SjApfPHNf541rTI06X0gZY92PMvN9WsuoigCAeDwBUMc
 XvhUhEPTQGBPY12oVfWmeSo3sl/1Qk9HuwLDh86ABXPBGVhxt1zOfx9MDP3s2thtSgCt
 CB5bE7CMg58hEpmBZ4orboXWEYAp5JFYb5lOtzi3LSbormd5dDzCQT5rrksBbFFmXGLG
 hSmngon424Ew+aAH8fUUGbhVRdYNuJCp5G47qZ2KzRjP0+SN/BUw/uMtcwpA6qssDh2D
 hzzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=NV8a2i73WVKMbLkPe/ykYUDMcv3XghE7mWCl/3SVv/k=;
 b=khwT+lTU1pR0NlmcbokTnvkacj/jCdfgzAwkjjsVY2jpmIDwBv1wqbyvz11bmLJ50O
 zFmodFjKROk3z4s6n3DDMsEGkhbpizNz2zpnMu1K5wn3HkFyRxlRkuz+GffBxirAVBXW
 aO4aYEN1srQ/qCOWln3FRikwqxwIR78QSmvz9bjp07eFgSnHQDM+joxAP6T4//JYBYU8
 9NTqC7gUMmtFLhKzJpgfW49/A2b7OIChwQpk66Vd4GFBgdTFRfXjY7tYgL02I4IBYmnf
 9O0ucqiYXGQ+5h/s0MYYMmiH4bDao41k6+1AmZqAD6i+nhjXvKcHtUVCK8hlWjXbiIdu
 3agQ==
X-Gm-Message-State: APjAAAVGl3yVqx8kDl6da0FxTOwUqS9BYdWjqYnYtj8NbAR1l96RlQYj
 kxDAiQ7vGesAY37rNwPuuzU0XA==
X-Google-Smtp-Source: APXvYqwGtwtzv7H/zs+qkb/WvwOd0PUv3OZLcslB9uxXJvZ5w1rSJfUucWQhGKXD0BdWBBMGExYOmg==
X-Received: by 2002:a17:902:424:: with SMTP id
 33mr6829930ple.102.1557423276297; 
 Thu, 09 May 2019 10:34:36 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:7849:6889:3e03:e97c])
 by smtp.googlemail.com with ESMTPSA id 25sm3909134pfo.145.2019.05.09.10.34.34
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 09 May 2019 10:34:35 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Guillaume La Roque <glaroque@baylibre.com>, linus.walleij@linaro.org
Subject: Re: [PATCH v4 0/6] Add drive-strength in Meson pinctrl driver
In-Reply-To: <20190509162920.7054-1-glaroque@baylibre.com>
References: <20190509162920.7054-1-glaroque@baylibre.com>
Date: Thu, 09 May 2019 10:34:34 -0700
Message-ID: <7h36lnh6qd.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190509_103437_682981_2A6133B0 
X-CRM114-Status: GOOD (  10.29  )
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
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Guillaume La Roque <glaroque@baylibre.com> writes:

> The purpose of this patchset is to add drive-strength support in meson pinconf
> driver. This is a new feature that was added on the g12a. It is critical for us
> to support this since many functions are failing with default pad drive-strength.
>
> The value achievable by the SoC are 0.5mA, 2.5mA, 3mA and 4mA and the DT property
> 'drive-strength' is expressed in mA.
> So this patch add another generic property "drive-strength-uA". The change to do so

Looks like you forgot to update the cover letter.

The new property in this series is actually named
"drive-strengh-micromap"

> would be minimal and could be benefit to other platforms later on.
>
> Cheers
> Guillaume
>
> Changes since v3:
> - remove dev_err in meson_get_drive_strength
> - cleanup code

You didn't mention the property rename.

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
