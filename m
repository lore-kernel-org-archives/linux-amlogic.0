Return-Path: <SRS0=BQut=RS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01FC0C43381
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 Mar 2019 21:09:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE47D21871
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 Mar 2019 21:09:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mz3Jwxfb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="CdlQZ3us"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE47D21871
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kuxmUboTHh09QQ2ufxkp6pj/sQHZKRTE0nDcmTK+pJ0=; b=mz3Jwxfblpnc3Q
	vumBxZS6Ncb5CUJ1LrIJRhYOaG79POJga0nzpNbc3khIe6M6IhskMsJvq0BxIBGd75cNGVh0qpnLL
	uw7DAvTJf7BNXfDIokoqlwWuSEqzqiADxb6Jz9vPZJU6lP4NAhkgv7jRHwclUIdDBZl8EsSW1aKoA
	2mTlY98Sv1sMLV5VMRrZCgwwbEbM6rXNbdTNJcjP+5bYAFdHTLmSE8bDYA6i658KmVJoWZT6oAhba
	waamjOrFmhguzETLvPNqkASI/+4liW7HiwJWWicqYSqD5XCOJIsS/beMTRb0KiZiAnYKq/TEtk648
	YipEunTUbsXIUbdvXVkQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h4u5G-0002cd-Qw; Fri, 15 Mar 2019 21:09:42 +0000
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h4u5D-0002bx-Qb; Fri, 15 Mar 2019 21:09:41 +0000
Received: by mail-oi1-x243.google.com with SMTP id u12so5527477oiv.1;
 Fri, 15 Mar 2019 14:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kui9b3hFWnE2uUTU7SbYrqlPmXB13fsLEaAm0fowE0M=;
 b=CdlQZ3usPgNg7Y3hMH38BgbfDizrmuaaTzQk/NaAcUQXDfIrW/rRcHVceUbqYTC2Yi
 Tbd8ThAyc5DmxVuncU/kjWZC0FXaIoi3Mc4yjDqLjSVh/uPkVLyTKB/TfSlWiLXJsFHo
 U0LNGnD5/yBTtuLAOTJ/FHRL5b++ffqpmA0XE4jIbNZNQk4XxOL1g+R8GsFcWxeX/xZd
 3BCy0OHrfnFO+yk6pLYIbnwhLDAhVUrxGYJHDn/pfKmoH9zXfl5zqdL2N2LHb7jQVrbA
 Tq9dOZbqASBz9AF+5VvFZx4g87se630mbkYF6o6tanseA4ej/5YgA9AxLlWCjKs5CT7E
 H6ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kui9b3hFWnE2uUTU7SbYrqlPmXB13fsLEaAm0fowE0M=;
 b=bL0fQRI2LB5oQTsu939dxo+LuLfdTMqfdK3ZDRRMAguQ8ESWCwykwixEUDC6oltmyE
 PW8bB0K23VBcdDx5pG4OHBNlTcBd6iq522FMLJQwO7gClsm6HPoevVDi2/HYwfEOGXhZ
 bd92yOUglNz7zAAwAUOZZPtjWpULXvqIgy7KqalJX/sKs/TRHfFSxIkloB5NXM4Mn8or
 c5vFWlX2wpGmJvySGXC7u+qPQ3a4O5yVvLZqShhw4Dh0vGOKoa79NXfyw7CACc0+lKAA
 xEvNAz4wl7wkrpm1lSMWy+bnOCmmGD66LlDn8IcDJ3KQfhAdf8aAnk2fwAmLHOSF2x2L
 20OA==
X-Gm-Message-State: APjAAAWwo1/AvhuVoa+vwvzHtmwUSURwgqM1sNLK2C4Fa9swi+PUrlNB
 314UJ+X7c0t9xvzKp+i0OEQPGfNI3puQyA5TREo=
X-Google-Smtp-Source: APXvYqx5F4qCzzgRpIH1kHEn7fyeri/ssXbZsMy/pFhTtFxsXHPnPMQewQu8QbAdWVe8tPNRFtF8YPpckIJVDbDx22U=
X-Received: by 2002:a54:4e02:: with SMTP id a2mr2987252oiy.140.1552684178774; 
 Fri, 15 Mar 2019 14:09:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190307151342.7381-1-narmstrong@baylibre.com>
 <20190307151342.7381-3-narmstrong@baylibre.com>
In-Reply-To: <20190307151342.7381-3-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 15 Mar 2019 22:09:27 +0100
Message-ID: <CAFBinCAp6xVk_wmVB+Fo+WPs4k0TzTdaF5zGC-QvjgrUEXo7Zw@mail.gmail.com>
Subject: Re: [PATCH 2/9] arm64: dts: meson: g12a: Add AO Secure node
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190315_140939_861870_7E989D3F 
X-CRM114-Status: UNSURE (   7.49  )
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
Cc: khilman@baylibre.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, Mar 7, 2019 at 4:14 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> This adds the Always-On ao-secure system control registers node,
> which is used by the meson-gx-socinfo driver to detect the SoC IDs.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
