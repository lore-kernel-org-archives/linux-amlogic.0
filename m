Return-Path: <SRS0=Dn2N=WI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF5C1C31E40
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Aug 2019 20:47:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ABF2320684
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Aug 2019 20:47:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KDzE7GsC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="HrjBeS9Z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ABF2320684
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HQiwjIG6HczpYZVQ6UsQUBlWbtr3ZHpl/x+q27TiTso=; b=KDzE7GsCai4QFy
	9Fpp5vBYHN29CiDJxPSHVX+4W7mnSBgSWifZCNCvQ4YT+Us8dXT7DO12LVUuRqS+lkSS22471U7Vq
	1CUMn1tm7AEeXB6c/0j6dpB8N1E9LVO/naDLE/jVZggCVPbf+EaK37vWPPEX+3LKbi8tM+zHcEwjY
	j7hFy4fXjFVNEo67rackk+SCscJuj+3qaF4QPIVtxvv/6PZ1Qc7z+91ch67EDaB2p6Ycmwt0jA5ae
	VfhOs/tiU0eBU3+A7XODqFS31kJnU1ohdJcTAtkutR8NsLA3ul66xN1ejYIdFTIZd9BJbbiJZsjnI
	RYp7OOAM58E/PlUPqaEQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hxHEA-0006sT-I8; Mon, 12 Aug 2019 20:47:38 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hxHDu-0006MG-Og
 for linux-amlogic@lists.infradead.org; Mon, 12 Aug 2019 20:47:24 +0000
Received: by mail-pf1-x442.google.com with SMTP id c81so1286423pfc.11
 for <linux-amlogic@lists.infradead.org>; Mon, 12 Aug 2019 13:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=hAImoiaUIllvdsBRFvJI6AVDH7GSLwPssj/NGvLfhGc=;
 b=HrjBeS9ZsyLwpI+3rMjl+CHZ311L6zE/1Ign9jTBQ4c4bZeGZ1oNrKSzY7jklwfZO4
 jQz8qscJDMHkT8vWn/AKmJswfNLnvSHbdqAS9ciRAZt2QV2W7tn8eKuJL1iuU0y5Rt3J
 opoSVCa4fYTt4ao5aYgahFxd6xI828mrQq9z9l9I/RDpxckQaSfg6mFv2k5u3RmFXzqx
 IalBD4kFyngp+o5yIvxtk3xxAsUghKBb0Vedfr3B5suwP+TWukez9VqD3MB6aiSLc+xe
 TlBRrRy0VSsyU/qJANpdR1I8y7/IWXiICWjwQGwq6UgTd83Ee82vjynJKciy94+7YYes
 1mSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=hAImoiaUIllvdsBRFvJI6AVDH7GSLwPssj/NGvLfhGc=;
 b=QVzed/ZWPYrSNpt08KwziNTOEfS0myz4uLbIw0WeE8P0vBRsmKfsfoizoLaPS7JHwD
 MfGfOhZ6v0JwFTHZSwAHAkazR+ET0iFFPflRjx2hDDpYpOZc70iclLkBEvsOpIA7ET+s
 54Ldqp3enBL6pEfjKXQljuLjSPD8RlXACiCrizUDETwd7UIMHhCHsf45jVpRkeSOAUzH
 EWgscRUonoQDOl/m6ToT9DoxwRM9SixEyRQx+A3WrZRHgGBy+8ocy2UoeAra6lTtHqot
 r9Su9+bwlsNzqzTu/YZ7hBVI5x0NBye4vwRSnd+COMVN3ZEuAEDQ6Q1GqFAzisXGJusI
 Rmkw==
X-Gm-Message-State: APjAAAUdMor+kJMoDf0gt2jufM6tORXrJl98Rk4AW7kdhUmKwjtzOoMu
 WhBnENiIbguoyjus7xYBNLURWQ==
X-Google-Smtp-Source: APXvYqzeXAq4ry5YjGbwv5kPRL4fMM13o6q1ipU3KtUFAp8Qt4Y/TkCu66N8CMtnsn0Zb3DXcgVCPw==
X-Received: by 2002:a65:50c5:: with SMTP id s5mr31765219pgp.368.1565642841591; 
 Mon, 12 Aug 2019 13:47:21 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:14bb:580e:e4d6:b3a8])
 by smtp.gmail.com with ESMTPSA id k8sm100204280pgm.14.2019.08.12.13.47.20
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 12 Aug 2019 13:47:21 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 0/1] ARM: dts: meson8b: persistent MAC address for
 Odroid-C1
In-Reply-To: <20190812175004.24943-1-martin.blumenstingl@googlemail.com>
References: <20190812175004.24943-1-martin.blumenstingl@googlemail.com>
Date: Mon, 12 Aug 2019 13:47:20 -0700
Message-ID: <7hv9v2157r.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190812_134722_800680_9B6EB627 
X-CRM114-Status: UNSURE (   9.24  )
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
Cc: narmstrong@baylibre.com, linux.amoon@gmail.com, ottuzzi@gmail.com,
 linux-kernel@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:

> This series makes Odroid-C1 use the MAC address which is programmed into
> the eFuse.
>
> build-time dependencies:
> none
>
> runtime dependencies (without these a random MAC address is assigned,
> just like before these patches), both are already part of -next:
> - "nvmem: meson-mx-efuse: allow reading data smaller than word_size"
>   from [1]
> - "net: stmmac: manage errors returned by of_get_mac_address()" from [1]
>
>
> Changes since v1 at [2]:
> - only add the nvmem cell to meson8b-odroidc1.dts as suggested by Neil.
>   It turns out that neither MXQ and EC-100 have the MAC address in eFuse
>   (which means only 1/3 boards has it at the given eFuse offset, so it's
>   not worth having it the common .dtsi)
>
> Kevin: you already have v1 of this series in your tree. Feel free to
> replace the two patches from v1 with this single one.

Replaced.  Thanks for the update.

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
