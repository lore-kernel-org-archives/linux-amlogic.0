Return-Path: <SRS0=bWzJ=UG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1498DC2BCA1
	for <linux-amlogic@archiver.kernel.org>; Fri,  7 Jun 2019 22:31:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA0B020449
	for <linux-amlogic@archiver.kernel.org>; Fri,  7 Jun 2019 22:31:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dJSN3gXd";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="ZaRcvhRJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA0B020449
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=64SS5ytLXdI6s3ITBjd3XUYfuPcKJVVRPLfaJDJ248I=; b=dJSN3gXdvXj5ba
	cE606hOeZX0KnnVEuxQVI5ZHBmeheKM6PeSxMJvJoz0RzAe1RMIleBAQA0icD1vQLS8VSPzFZssgn
	c5meIOaBxyrGUeXGkmwj8NtqzSxKutUtm/TyxGqRzjJEn754LArdpbyZP9WXsFWRsYjYGiInT4qRC
	iidnuzEh4H3drk3TuScsL9qyUQPkyqruQX90b0We1DuZFA7skmGIeuJ7DNek9yIscYhayclOO8SFW
	3aItMK9RXKl7aVKgBqOmLpELyzHcsN029tBSGiiEyPQ8G+oB0v2Am6UyvpDmUIX0AzHT9JHGU0Ywu
	oQq65LVfRebur6ZUW1lA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hZNOU-00038C-Qi; Fri, 07 Jun 2019 22:31:30 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hZNOH-0002uR-Qr
 for linux-amlogic@lists.infradead.org; Fri, 07 Jun 2019 22:31:20 +0000
Received: by mail-pg1-x541.google.com with SMTP id v11so1861395pgl.5
 for <linux-amlogic@lists.infradead.org>; Fri, 07 Jun 2019 15:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=DjeIfF6JVcOuy3AfVkOGht8864fNBaz7bDSsSWoX9TU=;
 b=ZaRcvhRJt+lWFHNijIWNhrnilHwAsieAqy37yaaaiRUxylGw+20sUHDgYTvLwZXoLQ
 7Kz8Wr0w2D1hgQgm8qwXPISrC/NsfiVyGa0Ays+kZ12z05H2xaVjwsSI54FDH+4vgaXb
 DKW2YYHK6FYOHtehJJ7mwFSm272oTXDX/+bKAqtSKIHNTP/1Yc9ts3dK6dNVo5AmMRQu
 RVMEHaN2lksBao7riU/CVRglNW5yVlvDzQVHNpypOeXl6E0z6nWrOK4bVmi0ee634i+h
 U07KQLErwYvKttiJYrkU8RURfL/zNKTY6JyTWFQVTLRM2wWnJUmoAFJYBxrCQoHjEX6q
 g3lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=DjeIfF6JVcOuy3AfVkOGht8864fNBaz7bDSsSWoX9TU=;
 b=U5hVtraqB0oAZKhwAFjrrYkg8kAHgppkWsjjCatn4onz4A8RxCdapvcunAJMYLSQ2L
 wsuPCaiBQ5xfAkAYUvFBPHSczjk7AV8PyrHGjeg8cWrRPpKfAXDMhHUVXKlYVmxbg3C7
 yqyo+yV2pkK0FoKdVi3qgyY4GbaEo4kHkGjcYdrDZDGgCgvCJbVTtRl0vfRYGPjOVths
 2d3zV506u7QrJdwqx1CKUvaxkO+y+RPTOJN3+/B12Hir86Gmhs3PIbpB2/jYDbty3QtW
 ATWIJulgQbzNr34vGRfZ3Uq1w/+gcpVgwU98/UZA/81vsa/AC7EJ7cxmL8ep56JuPV73
 TviQ==
X-Gm-Message-State: APjAAAX83Lgm9H7JjTVDakPfEczoh5DwyEbbFBH8D1ODYcGnbNV/yEzI
 xq27bqsUrb+dQF58X4IpDt+AtA==
X-Google-Smtp-Source: APXvYqy1arVJLueel+cI+iNSxrU0sdtYKURzlXY9sOv3HhCRaoXzJNw0gelleuoSn1Mvz1PB8ZaEkg==
X-Received: by 2002:a63:514:: with SMTP id 20mr4976382pgf.272.1559946676909;
 Fri, 07 Jun 2019 15:31:16 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.googlemail.com with ESMTPSA id ds14sm2846230pjb.32.2019.06.07.15.31.15
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 07 Jun 2019 15:31:15 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: meson-g12a-sei510: Enable Wifi SDIO
 module
In-Reply-To: <20190607144735.3829-4-narmstrong@baylibre.com>
References: <20190607144735.3829-1-narmstrong@baylibre.com>
 <20190607144735.3829-4-narmstrong@baylibre.com>
Date: Fri, 07 Jun 2019 15:31:14 -0700
Message-ID: <7ho939auz1.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190607_153117_930715_ECCC3403 
X-CRM114-Status: UNSURE (   5.43  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> The SEI510 embeds an AP6398S SDIO module, let's add the
> corresponding SDIO, PWM clock and mmc-pwrseq nodes.
>
> Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

Queued for v5.3,

Thanks,

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
