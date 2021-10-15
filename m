Return-Path: <SRS0=WmWE=PD=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B687AC433F5
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 Oct 2021 22:07:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8086A60C4B
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 Oct 2021 22:07:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8086A60C4B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8Nvftz3XI6RwIizBYMsZB1YoFngr4VyWLBMCaeZv9bY=; b=OxcwOrDXd2C4h4
	Wp5OZtk5Q5UNsTRGrG9Kemn5JxQZEgAQUrI143tWxA/4IBGHlOWzJsDomFegm2TAVsdhl6Sx7FnZ/
	1h+gK3Zttrl9QYSP+N4yNV7fAF9v3u35UIS+W6RLXXgyusQLxnRa4DzsSBFOYiVoR5IqeXXELByt0
	foS0z4MlnCrMW5lK9CNl2SZLq9vZNXRcxF1sBNy9YGq9hpsU1qTAEtmnzq+pIEDF7QdqvuIH0JeHl
	GqhQ4KO6lwZxeXETwVA4oq3Q9YPleTLCAyFWC/s7kuoYvWzSHO9lN0aiM57u9FI4x05OUDyN0oBem
	YKtvYxwOU4U5aYHz2ZyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbVMg-008v57-Ij; Fri, 15 Oct 2021 22:07:46 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbVMd-008v3l-Vi; Fri, 15 Oct 2021 22:07:45 +0000
Received: by mail-ed1-x529.google.com with SMTP id w19so43140048edd.2;
 Fri, 15 Oct 2021 15:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dfrvNfe8cIeMC9VL0sueBqNC1Hm+TJOvlEdZe3LO7Ak=;
 b=HNDT+KKahn+9l5vdegEbLOmNFbvNFNqWXYAWDhkbdEYMUNc/sEM2zBM8ujgmkt1WGl
 89NRQPZhMD0ctuXGU+8CRvEOVew/tfir7xFaWIqc2xhSIfMJPuYg/Rc+oJgAZkwB9RSh
 cvYnyZyiFRKlO0rHaZE4k4T7gLLCYxPKSgo0SPJkOyNiVvCeCZtmQLqhYDHKmwI9J/XI
 QeNxx0vJwHyqLuH+RviME2mk+XJeLWPHpbSN6vlCFOd0qPtapsGeZxChswmdFOZA1nRZ
 4iPeHmBImFeWi4y82OqUmHN9vBxXPWimcGeQazGafKvDJnqZUi9yVQCgTQSULTqVjqzy
 Tr6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dfrvNfe8cIeMC9VL0sueBqNC1Hm+TJOvlEdZe3LO7Ak=;
 b=xg1BF/VY/cVefrrF8CROZSGxtCl0BoW8wh70fvFJ67JhlNDYPeN8gRAHk7BqUhqHhq
 dR+htCdtlW/ffoHtN52WmgKW1f0pEmn08UfpgxL2mFJl+BywOxUEQfXbsxPz8JQAOEvs
 dOtehYlXv83n5A+0t6ORyApOmDrxF3DKMQjT2XMHT99ptsmjoOThq+/mcI9pFN9XyOsQ
 Jad2mWlvKMhj7nWXpZqA45zA/GFSnbC1VN9+1jrI9c/bWq4kfcFWV3wl7PLjdhfXskcv
 91cOXouhlU4ykqPC6J6OycjqimGclFKcCUB3ORr3xLv3vTsge8E/a0AYhj5tF3D/C6OP
 xoxw==
X-Gm-Message-State: AOAM530QLll6rDxdT0Tgag7KxJoDUpMhPq2GfEcfpsWb08BAU79h2lfC
 JV+UZhQeBbarlgx8OW5LjDyDngNhdpi+TcE4/OSwZKVH2hk=
X-Google-Smtp-Source: ABdhPJyiA3feuV5RcRuc8R/2D8DhxlO3N51TUr3uX065PKdazoD72Wacb3BIrg/vh2ntU3s9aLA26Fsrl3E/ZH+5MRk=
X-Received: by 2002:a05:6402:3186:: with SMTP id
 di6mr20882798edb.225.1634335662519; 
 Fri, 15 Oct 2021 15:07:42 -0700 (PDT)
MIME-Version: 1.0
References: <20211015141107.2430800-1-narmstrong@baylibre.com>
 <20211015141107.2430800-6-narmstrong@baylibre.com>
In-Reply-To: <20211015141107.2430800-6-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 16 Oct 2021 00:07:31 +0200
Message-ID: <CAFBinCAqA1s--b-iUYe_Wx+rVU56uiMybe2kYSxYOZUXtOt6jA@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] drm/meson: rename venc_cvbs to encoder_cvbs
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: daniel@ffwll.ch, Laurent.pinchart@ideasonboard.com, sam@ravnborg.org, 
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211015_150744_069747_F1BAB325 
X-CRM114-Status: UNSURE (   6.97  )
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

On Fri, Oct 15, 2021 at 4:11 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Rename the cvbs encoder to match the newly introduced meson_encoder_hdmi.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
