Return-Path: <SRS0=VwQk=ZW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 242CBC432C0
	for <linux-amlogic@archiver.kernel.org>; Sat, 30 Nov 2019 17:11:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E76DB2075C
	for <linux-amlogic@archiver.kernel.org>; Sat, 30 Nov 2019 17:11:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rlGeFMLf";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rU803rKa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E76DB2075C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aF/3PIgiXZJIbPlqCumNby39ryuTzPZHMZCRW7iPnoY=; b=rlGeFMLfYJahWd
	FOyuXY0+uSOXRsYXTYzHoL678dhmz2wdHLlH5hGOeJZ/LVbeq1ib5Nw/92zHfbtMPeJ0CEgQieKgZ
	Qi+pqvwLIXzBHwUjeRjhEKbl5cf3ZUVlAcah24VQvVdITTKAS9ae5VzUTnET49SvRqE/YaKHVhZyN
	PZGAm/LQ93kymAn3Ffu5CMh0ryxSQYGcCLfwLxxa+WYilNiWEWNg15stDh8cJn3yTjOLGop1uj3oO
	DPNXg7kjjet71HqGEfOt2hc5WxbWGMWONxFJfF5kiUPjrpeDCpGaZ/78CXnOGcIkjku5C8kTqMo8+
	n8ENiq9byD3VEVz/M+bw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ib6HL-0000ko-1k; Sat, 30 Nov 2019 17:11:31 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ib6HJ-0000kI-BV
 for linux-amlogic@lists.infradead.org; Sat, 30 Nov 2019 17:11:30 +0000
Received: by mail-wr1-x441.google.com with SMTP id a15so38720087wrf.9
 for <linux-amlogic@lists.infradead.org>; Sat, 30 Nov 2019 09:11:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=UQL+AVMYlXHuUQ/VgmF2hZDjdLHQZNOvD2MO7e4tukA=;
 b=rU803rKaqI4eJSixM3JP0QLOI3hYlebb+dCaUz+d9ZGGl6FR1nNELe+sA4WRNCPAWO
 Q2G+9ZLwIxMZqgHCTe//BHqKljOfR921M4ccImOjiiopIZOgWT/3iVLHEF5WT4hOoAjn
 roMGCizkPGUdk5lfTNrSVd1fGGLnTmek+/iba74+Jo/2+1wKH3pbvln8nxSe3Pqh7/PW
 UofqCXP7FF8BqQ1kO13CHSy92+gvbTlPoVPDt+yH79fx2NHZPCflBKQmUBxTvXgPxjME
 8rqzBRgzv1nkyvUf8BC8G430o8woLvRA1r8c4zrAd1rDkAs72y3ybWzlkzSXKMeoB9vN
 PWTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=UQL+AVMYlXHuUQ/VgmF2hZDjdLHQZNOvD2MO7e4tukA=;
 b=o7Nqjn+rRpFTj2QDNHJSOu/QpmpjDm/xXm3vxs+NbIRh01tfqE7xAgnbMkunRbDLSs
 KHELHHRHvPmyViGSsQaKwHWz/3jEGVrcM3W0EQpTgr15scmz7aDkI8vTtf4JA1arWOD6
 Dz+urNqEmSmuIL4I5M+skxjBpRGQcVP1KH7HH4hGE7a8HeM2I89/qsQJbz5Tidlp9b9b
 obTGbeSqbzHCfCkVJImWmast2Rce3K6bQ6EJgYa0+ut7DLuYRmaltkJQgkp0UHGOh7zO
 uyzAX6UvMqtY78QqorUVXCGKsb0OD4fycPj2GRc7ra8cqfsIhXCNHTsrU4LJyUDXfTlL
 noAA==
X-Gm-Message-State: APjAAAUF3Rxsm/B/oUOlqOk05S8wDM8VvKvV9VN7BaxNiW2ioOV7t3an
 ogZj0cC1tBrkkmh6x/fLwytIdzOeX0Dsaw==
X-Google-Smtp-Source: APXvYqw6jbkQFYeaVC7kFrelTbJ4a+slCVnwEENHqo1UFXL7HMSIb1GuXHqNAVYfY3OuhDTbqc4akA==
X-Received: by 2002:adf:ef92:: with SMTP id d18mr23092195wro.234.1575133887755; 
 Sat, 30 Nov 2019 09:11:27 -0800 (PST)
Received: from localhost ([37.238.188.27])
 by smtp.gmail.com with ESMTPSA id a26sm16844378wmm.14.2019.11.30.09.11.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Nov 2019 09:11:27 -0800 (PST)
Date: Sat, 30 Nov 2019 20:11:24 +0300
From: Mohammad Rasim <mohammad.rasim96@gmail.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: Add vendor prefix for Videostrong
Message-ID: <20191130171124.3a2ifmkpfymxztlr@manjaro.localdomain>
References: <20191130115824.31778-1-mohammad.rasim96@gmail.com>
 <20191130115824.31778-2-mohammad.rasim96@gmail.com>
 <CAFBinCCg5GdHprEKfXU1LBtgQi2G7P30=bmLh8Acrn82vYGfeg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFBinCCg5GdHprEKfXU1LBtgQi2G7P30=bmLh8Acrn82vYGfeg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191130_091129_418593_9184F152 
X-CRM114-Status: UNSURE (   8.36  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 19/11/30 02:45PM, Martin Blumenstingl wrote:
> Hi Mohammad,
>
> On Sat, Nov 30, 2019 at 12:58 PM Mohammad Rasim
> <mohammad.rasim96@gmail.com> wrote:
> >
> > Videostrong Technology Co., Ltd., A manufacturer of Android Players & STB
> > (Android with DVB Hybrid box & DVB-T2/S2/C/ISDB-T/DTMB-TH/ATSC )as well as
> the space after ATSC should be after the ")"
>
Thanks, will fix that
> > HD media players.
> >
> > Signed-off-by: Mohammad Rasim <mohammad.rasim96@gmail.com>
> with above typo fixed:
> Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
