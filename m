Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71ACBECAAD3
	for <linux-amlogic@archiver.kernel.org>; Fri,  9 Sep 2022 11:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YPOf4/4GSdRjYbE465XrrksZvIM6uFeuLJ9gDl2NdQQ=; b=JaSMaNRek+v85r
	mqudB4OeOsIwN/6wnghq9yMYHxYomzEfVJHGSMjw1e5KKWxfQ8gJf8pu4iFe1JVtnIeSF2vNK8uRj
	Sf+VwVzMw2BrdR6UKuF5YpkjKFIMNMOSNXNfqgVnluaZyZc510bT8Jpip0CCNxL/IYWaRJH+rbXbY
	HfC2HvW5aW1wrSZfc4Ghj7gmcG2yOvJ7Q6464wYGJpBD11xHybQXflI+K4yPNn3eerZaXH5K6xacu
	7P01q5RiSKcORFQulceRaA/Zb54WFpladN48RsF1S5p6sTEWL9ImAvHroAYANJJ4DCjPnXOGPvCIv
	W6XAeSntJx/2apT1d+WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWcJB-00FldN-J6; Fri, 09 Sep 2022 11:36:29 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWcJ8-00Flbs-Iy
	for linux-amlogic@lists.infradead.org; Fri, 09 Sep 2022 11:36:28 +0000
Received: by mail-wm1-x330.google.com with SMTP id m17-20020a7bce11000000b003a5bedec07bso4279171wmc.0
        for <linux-amlogic@lists.infradead.org>; Fri, 09 Sep 2022 04:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=eMfi4sj8sxdilltEjT3o0CYqu/07v37iL0oI9NwLuhQ=;
        b=xXitpySp81/iq5mCHbx1NL8ZY6KlIzQ2Rm0uNjQizzQDLBQmsIKIH+CCmZJqYEV/aj
         8VYnxt2C6ZjL/NTMjKjqNBjgyraFcIq4GJ6iuWoExRQlc8mVmFsDvlk+4ChybibvaJKw
         Q1wK+sQ5Gqay66QK/o5X6z+W+xAhcOAFSRqKlG+0557aFl8BLOYLQAju9meHM+hi4BE9
         abFHZTbce1cN+D998Mv3YYqrGmasXmFUbWtNpEBca3MTIqsqII8iYafZfe2rh5oGj+ht
         VPbbb487QpqIHXE4u6/mROYOYVqnGx8Nnw4P2KtqOcRoeGswB2HFIYrUlAR6BEFOg6az
         JHqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=eMfi4sj8sxdilltEjT3o0CYqu/07v37iL0oI9NwLuhQ=;
        b=BgtUvq7cdlzLkyJS282FbWCdI1U3ybe9/Oik4ZmM6vfU3O69yhvXIYTHwJ9OgtoBpT
         j4iasnmpE5h1biWGQK0NRfueO0aCw1jiCz+FaB7PUf0ifrk2ydAqiLUkACXBcFTxfYp5
         4sCK725PmY6uEyrbFy2f1YGWQVPfZEZb400Y3BBs9tzl0YO4jjS7K5rTwyRb93f3w2s3
         0Q34pny7u0FE8AO8S53mOmvKre02gALJpd+urNPAPW4Z6odMNTypR27QAeY4opeUbh9q
         jamgGyPT/htDs8E92RtBH6Ge2XhEY8Auu8qCFOSUQeETTasQ8jrInJY4k17Mc3SJzhsh
         CwDg==
X-Gm-Message-State: ACgBeo1z/SjZjinxk3Ba5+oleUf/llYBidkTX9qxt4qKg5L6gR8+6kQQ
	3SwHZr9HxF82dJVHfQ+WP7X8+8QFZTVPh+fx
X-Google-Smtp-Source: AA6agR5Hz6kkduJeRFgp/DA6BwlkbNwFTw/nfrGwXvXISQa+66SCJbXRvxHYQfYYcMMhOCPKMIWT+w==
X-Received: by 2002:a05:600c:4f53:b0:3a6:9d3c:47e9 with SMTP id m19-20020a05600c4f5300b003a69d3c47e9mr5330903wmq.116.1662723383738;
        Fri, 09 Sep 2022 04:36:23 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:982:cbb0:ca05:c15c:ee41:c8ab])
        by smtp.gmail.com with ESMTPSA id b14-20020a5d634e000000b00228da396f9dsm272862wrw.84.2022.09.09.04.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Sep 2022 04:36:23 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: linux-amlogic@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	Stuart Menefy <stuart.menefy@mathembedded.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH] drm/meson: Correct OSD1 global alpha value
Date: Fri,  9 Sep 2022 13:36:21 +0200
Message-Id: <166272336889.954213.3103687270457215628.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220908155103.686904-1-stuart.menefy@mathembedded.com>
References: <20220908155103.686904-1-stuart.menefy@mathembedded.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220909_043626_639039_91B4588D 
X-CRM114-Status: UNSURE (   7.98  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi,

On Thu, 8 Sep 2022 16:51:03 +0100, Stuart Menefy wrote:
> VIU_OSD1_CTRL_STAT.GLOBAL_ALPHA is a 9 bit field, so the maximum
> value is 0x100 not 0xff.
> 
> This matches the vendor kernel.
> 
> 

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-fixes)

[1/1] drm/meson: Correct OSD1 global alpha value
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=6836829c8ea453c9e3e518e61539e35881c8ed5f

-- 
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
