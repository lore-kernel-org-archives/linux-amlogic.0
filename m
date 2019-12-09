Return-Path: <SRS0=O3JJ=Z7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2674BC43603
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Dec 2019 22:31:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E947720637
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Dec 2019 22:31:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HziLqiyx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="HTp9jArp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E947720637
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C/wVwJ/EAnkTgiYKKCwkJPqIQw73/2xMB5OxMevC1jQ=; b=HziLqiyxr91kpn
	mlkbdmDRlfMNkyP7xoFSmKiGEy+PO8P7OaMTWz0o2kWsSvbGKKB0lhPhFEfYPtYsqaO50JS9YigAh
	H2p7ov13eYvk3wcU+fL3wOMPxmY4P57oVHuLTb/8eSn6EvvKvVDX9Z/McdDGdpX7+AFlU70bPILYC
	Ewo2iUt5XK+HW9OwKOBEILrIznzW3axa0d5qWK3RGsEM/yldrLKIOt4p7Z0pgimiW3GbihYSWpHhX
	W6mQVKEUmP5Ox6YQnOHbOdgDActfFeCF7UqHZhvkxfWyUgkO3ngy6D3kkKDeOSbdR8P1mioNEWabG
	REb5AA7GVbNfmDKL50Cw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ieRYj-0006IB-9k; Mon, 09 Dec 2019 22:31:17 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ieRYg-0006HO-TR
 for linux-amlogic@lists.infradead.org; Mon, 09 Dec 2019 22:31:16 +0000
Received: by mail-pg1-x544.google.com with SMTP id 6so7844640pgk.0
 for <linux-amlogic@lists.infradead.org>; Mon, 09 Dec 2019 14:31:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=Cx2z047F3Ll9UyhvmTIUKw1QKz/v8Cg8wDfoTOsVivw=;
 b=HTp9jArpEsdSXKx19phAMC7QOeF0uEdiUTso77IiM26VQM0wG5TTLvmhWsJOGp4pdf
 OaftSP/5vIJXOmHukAIv0HTPe7xrldz+giaIlxVbebF3WrocJ2jImvgnZGMP9hSTKLYp
 K+2tGdyjBr/xkpD8vR/KQZ5ZSlVAqmIaHevnk+2RiX1mPmkqZAGpFGHaWXnZB1v1d8Qo
 Jncr7M9214fQKScs2+R2vdosgAoyG/xAJkplUSAvISL9uR9vSNp3AQDpIcTRcZDaBuFU
 7fHd+WD4wPMjHVvOPtGKcqYZKxAlsXcZl2mMZEgxJnxjuWpS4Zh2zJSbABxMAUmaOcgP
 qkZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=Cx2z047F3Ll9UyhvmTIUKw1QKz/v8Cg8wDfoTOsVivw=;
 b=MjS0Fikri6lyR1k/qleX4TVxXebHVQVMVwsPsTJQvDtyLIM7p/YZFqxEUAruo35Vg/
 EH62MrVGwLazTCBJ4Y17EMoMPW4hJqpU8debgrMqO5tBKn3RhDPSmOI7GXG/gnEUyDLd
 2gblNOwHnXnFHIfmAlQBjvYe7Vpq/huhwNmrAJnWyK/QiYI2tLBGSey0TSCY3Nsewvtp
 kdN5ruvitV8j2L2YLc85+FkXEeEr8UdX1P+VB49vI5w13E370Cm80Y3x6CPepzwg56jq
 sclxTK09ZahPkk8it9dBbdSxa8dE+F1NYVAxUhFFv4mil8jbuOVrj+mjVNl2E0bn9+Gt
 rGAw==
X-Gm-Message-State: APjAAAUHD38gSzjNKUoznhEXKCw6TJu4mwXxbqeIm43wunU5pxBK6Pf2
 TBrOEspmU9cfbA47KeHuPJKvHA==
X-Google-Smtp-Source: APXvYqzgALPC2Kq/jgwCucpkOsh4n1vOENpAkkTZm4oI2gFFe1B5K1OcTX/2Iuc1SyEcXa8A/eVzxQ==
X-Received: by 2002:a62:7541:: with SMTP id q62mr31527326pfc.256.1575930674077; 
 Mon, 09 Dec 2019 14:31:14 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id k18sm502723pfe.7.2019.12.09.14.31.13
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 09 Dec 2019 14:31:13 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Mohammad Rasim <mohammad.rasim96@gmail.com>,
 linux-amlogic@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v4 0/3] add support for videostrong KII Pro
In-Reply-To: <20191130195335.17740-1-mohammad.rasim96@gmail.com>
References: <20191130195335.17740-1-mohammad.rasim96@gmail.com>
Date: Mon, 09 Dec 2019 14:31:13 -0800
Message-ID: <7h1rtdrv0u.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191209_143114_950842_0F15FE2B 
X-CRM114-Status: UNSURE (   7.43  )
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
Cc: Mohammad Rasim <mohammad.rasim96@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Mohammad,

Mohammad Rasim <mohammad.rasim96@gmail.com> writes:

> This patchset adds support for the Videostrong KII Pro tv box which is
> based on the gxbb-p201 reference design.
>
> Device specifications:
> - SOC: Amlogic S905
> - RAM: 2GB DDR3
> - Storage: 16GB
> - Connectivity:
> 	- 10/100M Ethernet (IC Plus IP101GR)
> 	- 802.11 b/g/n/ac Wi-Fi (Ampak AP6335 BT/WIFI combo)
> 	- Bluetooth 4.0 (Ampak AP6335 BT/WIFI combo)
> - Video out: HDMI 2.0 up to 4K @ 60Hz, and 3.5mm AV (composite video) jack
> - Audio out: HDMI, AV (stereo audio) and optical S/PDIF
> - Tuner: AVL6862 DVB-C/T/T2 + DVB-S/S2 demod and Rafael Micro R848 tuner
> - Ports:
> 	- x1 micro SD card slot up to 32GB
> 	- 4x USB 2.0 host ports
> - Misc:
>     - Power button and LED, IR receiver

Series queued for v5.6.

Thanks for adding a new board upstream!

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
