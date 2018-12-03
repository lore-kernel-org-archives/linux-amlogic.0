Return-Path: <SRS0=94bh=OM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95494C04EB9
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Dec 2018 09:43:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64F8720666
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Dec 2018 09:43:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Wv5S9CVd";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="E9hm9DQK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 64F8720666
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IEybObJHtewkNxO9uw6uJaLl+WFjx/X6MtevNiLiJdA=; b=Wv5S9CVdfTO7c9
	HdAiCUxptI5HfFt9BHDbxeC+21oJ1p5OC1GOvkYQ/iN3saeIJ6FtvbhjYcK9i076+LmCJuVjn9jz+
	SdrZTJ5hMghdSEaoQD3wTGlJWzGviiuzPvVx7LUhhVmfgXtrKQRi7Xy0ehJcSZo/mMY+WrJPBg+ME
	go39WEBSXef5Zhj0+d0SJOIGNqH8bJvD2jVRV0C299Ppt4y0P7a8ug1pRC9KOFURluYk0+vhO3ey2
	NVp8UVFQI28eyanfG+mBw93n0LApzWTL3hxBQmFjqmVvEUgIbg0J+OXa7pLewj7e+ca1u9oRzmKmz
	rH3DUb6hsdpkc5LiFOmg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gTklA-000677-7k; Mon, 03 Dec 2018 09:43:24 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gTkkk-0005i0-1K
 for linux-amlogic@lists.infradead.org; Mon, 03 Dec 2018 09:43:03 +0000
Received: by mail-wm1-x343.google.com with SMTP id s14so5012385wmh.1
 for <linux-amlogic@lists.infradead.org>; Mon, 03 Dec 2018 01:42:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=ZZvre/H46WpeUXFq0et7nHwNI50jgdXDNyFmlD+6BSQ=;
 b=E9hm9DQKx48tCmOd36diBiaMaW0azrsRN3JZYKkoXScI7xO7td1QnW0sDRZdVktSwF
 94DTMFFdKqzY/d7GJSeIXis13a87YQ2EtrULTUuMVWlTFd9dOF6rM12eWSKkJ+Xm7voF
 G4wTM8jdRUw8nLAuGCZD1kyyB6R0W/jpiOk0ArxTW4npj7I5xae8+CFb4jMLPsmnOMwL
 xABjDPpK7GkArSxTEAhrrbWAwkIJLUsq3eQyPnjZUbm4MQVL/gUeBfrGIXl1NSgdni2s
 UkBZgvANZAaBCjobyTMQj+hb/5uReHsL6BtBoDq77M4mGFuZNoCkdc1c94P6A9GvKc8X
 BLvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=ZZvre/H46WpeUXFq0et7nHwNI50jgdXDNyFmlD+6BSQ=;
 b=Ge6ypWAKgjiRy9sxp5zflU+VM5dyGxiw16MQp2HcoSYkSOzu9XKylqFmTrS+tfxnwt
 zsA67IJzqvupZ3H8/bpuFx1/R3irHCxvL+wo00S1IUrNFtOqzKjYxf/g0jiZrXIZKi3+
 pzsf/H6bPif+lfxq94sTjqTQRK+gt2HtHtYsJ+bYd8c8hOrkZ3vlPhBJwQKfzLeKBkVr
 617Y1DkoRNI1Xs5H5NHMKF9cP6pm05fjibpFXXkHQIX3jpVneyyZQlsItKJ0CiE2p/7o
 0bVoxlOuSBIK3MNCKeg0WmRYw0HgAC9pouPy2IxvUj30A6qlHbEVfgORZscx13UETcVJ
 xpjQ==
X-Gm-Message-State: AA+aEWah1AkyzLewbdrtFW1BH1ITI9qQ/wxe+AHQQXE/Zvrf2AWk8fsl
 SClKCCU62d3eNXRK0b6h7TdJ8JwVpzQ=
X-Google-Smtp-Source: AFSGD/XnTMiELjUeNxWjC6swx2wr5MBqPiwu0fqjZNBs0w9jtRK92Ex2AgowB4oVGbrXkbQAmd1RWQ==
X-Received: by 2002:a1c:e513:: with SMTP id c19mr8004574wmh.101.1543830166448; 
 Mon, 03 Dec 2018 01:42:46 -0800 (PST)
Received: from boomer.baylibre.com ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.gmail.com with ESMTPSA id
 h12sm20248605wma.48.2018.12.03.01.42.45
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 03 Dec 2018 01:42:45 -0800 (PST)
Message-ID: <d52679a197a46fa19fb44c446c52fd286ad639f2.camel@baylibre.com>
Subject: Re: [PATCH 0/3] - clk: meson8b: add the (read-only) video clock trees
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 linux-amlogic@lists.infradead.org, narmstrong@baylibre.com
Date: Mon, 03 Dec 2018 10:42:44 +0100
In-Reply-To: <20181202214220.7715-1-martin.blumenstingl@googlemail.com>
References: <20181202214220.7715-1-martin.blumenstingl@googlemail.com>
User-Agent: Evolution 3.30.2 (3.30.2-2.fc29) 
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181203_014258_075270_59B2F000 
X-CRM114-Status: UNSURE (   9.53  )
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
Cc: sboyd@kernel.org, mturquette@baylibre.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sun, 2018-12-02 at 22:42 +0100, Martin Blumenstingl wrote:
> Martin Blumenstingl (3):
>   - clk: meson: meson8b: fix the offset of -- vid_pll_dco's N value
>   - clk: meson: meson8b: add the fractional divider for -- vid_pll_dco
>   - clk: meson: meson8b: add the read-only video clock trees
> 
>  drivers/clk/meson/meson8b.c | 746 +++++++++++++++++++++++++++++++++++-
>  drivers/clk/meson/meson8b.h |  54 ++-
>  2 files changed, 789 insertions(+), 11 deletions(-)

Looks good to me

Acked-by: Jerome Brunet <jbrunet@baylibre.com>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
