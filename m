Return-Path: <SRS0=O3JJ=Z7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFEAAC43603
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Dec 2019 22:26:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 820EA20637
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Dec 2019 22:26:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MVP7Xfad";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="NSH9ULh/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 820EA20637
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=//X9eIFjK6WegVLzwH0zTgMzQn0x/9aOuZg/vWFhp/k=; b=MVP7XfadMgsbb9
	BN578k9SbGsCux4O6pRoQnw312gADn+nDkTcbOQA0MtEsS4G8e5J2vrnUYr+7ypOvJsbDQwsl2L3t
	eQ4c5qizUKpUAjppEez1yCjKIGHj3F5aQY3YTECK4Ce+YTvcUo7HofMTanbWkC39d7KHel5bOncAv
	Wy4IJ/mX8zAmprMSOtlmuIe3oSRLpxPyqM++jOTqiBk7j/lAkGFA9NCanB5ulE+GVKcKVCMJ7tDEP
	rFbREgsAp3cdcafBHwoenF5598zivarTpw0T8/3kCJLR0QdO0bPssx81hgTj5giYYwywC3H1G62kL
	J2Qt0UcOf7KeJc3oCETw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ieRTd-0004RT-6y; Mon, 09 Dec 2019 22:26:01 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ieRTa-0004QF-ML
 for linux-amlogic@lists.infradead.org; Mon, 09 Dec 2019 22:26:00 +0000
Received: by mail-pf1-x442.google.com with SMTP id 2so7951721pfx.6
 for <linux-amlogic@lists.infradead.org>; Mon, 09 Dec 2019 14:25:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=e8vzmB2zQOVicf37JYB7f5dUsZ9PAEbPEnqlneCb8hk=;
 b=NSH9ULh/1hAOLuPMNPJfxklHlE41CsUwmWn/AlWHF+NXzPTPqa461LIDyAeuIK1ZkC
 jcvFyZM62M3TyE35p9IkhgrSTYl8uWlVlLUlyqR/zuwW4GTq75XDmk4xOazIivi0fjRQ
 HFStxYtDHWNEI+Hi/mOViXqpYWFULyktYYG0zvxkLbmQRhlWfpW8XO+VfQ0ml1j/lvz0
 OXmR1i8k6mKWWm8qHSSNqiiyPxT2sWUaaBZY7l5mRmphES0IKelAqESY+DkgQA28PRT1
 qvTzEDzU9U9VU7mP4ridDIou1QERo9IFl+safi1TbqdJMwfr07By6LDNeDRrT6sR0EIb
 PNXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=e8vzmB2zQOVicf37JYB7f5dUsZ9PAEbPEnqlneCb8hk=;
 b=eIVI+myJVVwDPCyH7jwI+dMlOnANyWKebGB2lOVumYf3nHtZNF+pQAe38jG6gq9wn7
 vkDKO8jPfLybYZmERafaHnPk6NDtzudgohSi2o/bpEW4Vi7mWQHvgFGJ+VGcCvyQNYB7
 NbNdQk/U0LSrDMw90v1YxhEt1SNs58J7V1oyN8UjkiM/G6TpCGKW/NuV7jgctkGnEXP0
 JykpVdkmtJfcgWZodorXK7rjsXQGZHhi8GINqnBmYmhZ+HMT4hKmd84HcBdG92J5U1Af
 fndTlWxW+X5TNLe3+km+vSzh9CSrxXRIGnHjSA/VSHyvIEF2Qi93Fg84NJrdT+axZPYf
 j3zg==
X-Gm-Message-State: APjAAAWu5T2Fx3Cy8whO69TLCnNVtIdFXIzs43MuyWFQcuOrVYxtjOSC
 mGM7+kerD3EqmH8eUifZJm2vBQ==
X-Google-Smtp-Source: APXvYqywvsTO2z1jHZUpDVc2D7xS1pwfKfSChZ6K2XJIA8v7tS/ZhIBV/gXtqeqzdKHsR1Wdvopmsg==
X-Received: by 2002:a62:3706:: with SMTP id e6mr32484589pfa.31.1575930358173; 
 Mon, 09 Dec 2019 14:25:58 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id g22sm515509pgk.85.2019.12.09.14.25.57
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 09 Dec 2019 14:25:57 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 p.zabel@pengutronix.de, linux-amlogic@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: reset: meson8b: fix duplicate reset IDs
In-Reply-To: <20191130185337.1757000-1-martin.blumenstingl@googlemail.com>
References: <20191130185337.1757000-1-martin.blumenstingl@googlemail.com>
Date: Mon, 09 Dec 2019 14:25:57 -0800
Message-ID: <7h5ziprv9m.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191209_142558_757378_2CD43F69 
X-CRM114-Status: UNSURE (   5.74  )
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
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, narmstrong@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:

> According to the public S805 datasheet the RESET2 register uses the
> following bits for the PIC_DC, PSC and NAND reset lines:
> - PIC_DC is at bit 3 (meaning: RESET_VD_RMEM + 3)
> - PSC is at bit 4 (meaning: RESET_VD_RMEM + 4)
> - NAND is at bit 5 (meaning: RESET_VD_RMEM + 4)
>
> Update the reset IDs of these three reset lines so they don't conflict
> with PIC_DC and map to the actual hardware reset lines.
>
> Fixes: 79795e20a184eb ("dt-bindings: reset: Add bindings for the Meson SoC Reset Controller")
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Queued as a fix for v5.5-rc,

Thanks,

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
