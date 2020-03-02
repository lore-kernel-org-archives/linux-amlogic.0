Return-Path: <SRS0=FFcv=4T=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C807C3F2D7
	for <linux-amlogic@archiver.kernel.org>; Mon,  2 Mar 2020 13:49:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3EB6321739
	for <linux-amlogic@archiver.kernel.org>; Mon,  2 Mar 2020 13:49:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YLTtWhw7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="UH5EmQ8x"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3EB6321739
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yn+AI9nHeU6fl1o8gPGzRlB5EoOAYFooi6ET0XYKSqQ=; b=YLTtWhw7QkSk++
	poIiY9BppqInD7U+5bkyWWdy3pSzp6vcuK0u5Dzex5MkwMV8XkuPp3ZqbC3U0pOCvDq+JV+xbZjCj
	/G/gkavgB4PZMufiiP5MqJ1UG74l6Csw5xPUzZjythfZv+ItM9FywYxulLGnQe1uUfs04PWeZb8aA
	TxDW699d1QJeYS6770m85zF6K/s8bbR2COXUgg3Wx8fOuVaYW9dACZFDNWggYf+NSQAxNLL8oxx4R
	mpMpcwG6GmOPmiCXTnKrc4zW3NHBrDBa3tNlqG+6WishbFJxrp+aKQF4ZQ9UmRDfAvFWDS49cstNo
	IXGEqCJqBRBSHEenIKFA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j8lS1-0006og-VR; Mon, 02 Mar 2020 13:49:41 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j8lRq-0006ft-FH
 for linux-amlogic@lists.infradead.org; Mon, 02 Mar 2020 13:49:32 +0000
Received: by mail-wm1-x342.google.com with SMTP id a5so11285651wmb.0
 for <linux-amlogic@lists.infradead.org>; Mon, 02 Mar 2020 05:49:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=pDQHChPAvHbaHiAh1rx2hc7lXXqfrv2AqyVIgjj3sL4=;
 b=UH5EmQ8xNHA0Plu/McRn1qzyUYWuxXbSKQ2Os9L0yoktOYu7tCx3sdJI7YWZDxYoHd
 +YL3OEUKvM/W7hKB41X+4FFEjSxBJAVk5gdh5ny/LUcvZAIIrr1B3WQhGeUbo8nhyhjJ
 YErz9cLbumJ9EU8Q1wTQxX1Bo4aRM5DcDqFGnmdskcTtTl60EykI71bjpWhvL433KI6k
 1zp5xmHgz0vxdOb2LAhL2niLWDwbVPa+UYR0WaVrxCd+4X1KV0gISqCbaTXsch8ZTvpP
 2pSH5mZIJxey3CFXFP6hifTlnIokOwzOBrOrJD7jVSHNogev7ThF6WI4H0vnNCqvkDfL
 J1iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=pDQHChPAvHbaHiAh1rx2hc7lXXqfrv2AqyVIgjj3sL4=;
 b=e6FttcNeAajcNMspHo3+loPzjgCJ5Q8brEkw7aW/lCh5fg0NKyOMc0svxwZ5lLn6Ar
 e4CeXGe5K8XyqumhZHt8LdxAAA1zeP0xk1V+ryJznlP74Mz9SvdfsaL7QE+q14UALOgZ
 rntTkFcqav5l2Tsfk2zBTMWnGLDk12k7IgJ6zDBCBjTTuIGNG0YmXJIHlWLnqTM/hngf
 VF93XDGkj9CQIsBWpYNkluchX1gsl6wkFfwOUHBbcCPFiKOYT7OpSpC09EdOtmfQQJLh
 UdQEIHCm3vJFYwTUiDG9YeaYb+NOLFkFa9q9KJ8sQBrah5iMuSex4gkSNEh5zxANDsd1
 Vxiw==
X-Gm-Message-State: ANhLgQ2ndcQ9dTpC4Nnl2WKt7zrZjl9TnUyWLMs21XV4U7AEwDkdmHOR
 +QE1OOFBRRxb9PfQKnTFAMAI4A==
X-Google-Smtp-Source: ADFU+vvG6MBPGRkXYyxVAEaRWeNUehBlIcQSHO6fOGOEKIiRp511b6KjpX5fIWmrSFxV9Fue65UAYA==
X-Received: by 2002:a1c:2d88:: with SMTP id t130mr7393177wmt.68.1583156963877; 
 Mon, 02 Mar 2020 05:49:23 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id h10sm16163783wml.18.2020.03.02.05.49.23
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 02 Mar 2020 05:49:23 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Christian Hewitt <christianshewitt@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: meson-g12b: fix N2/VIM3 audio card model names
In-Reply-To: <1583135051-95529-1-git-send-email-christianshewitt@gmail.com>
References: <1583135051-95529-1-git-send-email-christianshewitt@gmail.com>
Date: Mon, 02 Mar 2020 14:49:22 +0100
Message-ID: <7h8skisw7x.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200302_054930_514659_1FF66EA7 
X-CRM114-Status: UNSURE (   7.26  )
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
Cc: Christian Hewitt <christianshewitt@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Christian Hewitt <christianshewitt@gmail.com> writes:

> This is largely cosmetic, but Odroid N2 and Khadas VIM3 are G12B devices so
> correct the card model names to reflect this.
>
> Fixes: aa7d5873bf6e ("arm64: dts: meson-g12b-odroid-n2: add sound card")
> Fixes: c6d29c66e582 ("arm64: dts: meson-g12b-khadas-vim3: add initial device-tree")

nit: no blank lines between Fixes tags and others (cf

> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>

Queued for v5.7,

Thanks for the cleanup,

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
