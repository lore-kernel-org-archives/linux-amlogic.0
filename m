Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B5A3C38142
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Jan 2023 07:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BMs+NFLL8qMJzDPdl89ljZowej+ILPD6Io/s3AteHGI=; b=t5d1bk7kg8pONV
	KOeAEGU+sEJPxYjUxAfD/5vLdenGPo2HMliPgBhq1STRKeFtB5OGcM+vnhVdCszZmZESIHtAHIiSb
	gg3g5x+m/T4KtzOxMyJO91WUEMIBjPjobKSr+F1lBd2z7dyrMEmPDZZe6eXBS5ikztrThd+vahWde
	GWz5dG75HpYlqJN1IQcPAcWeRgy4aBsqs5KBUqOrSAg2uw7Ut//z/1ld88cC4Efu8H+x+TLrMXqa8
	IxpvGfS7c+GPgeO4x67avhRQ5pCKZyaaNhGyPGfc01URPnOX7BOmjtZCpXxNv0GibZjAJEOULvQJn
	/47ghoZhznN0Bp7gmx1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKDkW-002eNP-UG; Tue, 24 Jan 2023 07:29:44 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKDkK-002eJL-LB
	for linux-amlogic@lists.infradead.org; Tue, 24 Jan 2023 07:29:35 +0000
Received: by mail-ej1-x62c.google.com with SMTP id tz11so36710471ejc.0
        for <linux-amlogic@lists.infradead.org>; Mon, 23 Jan 2023 23:29:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=streamunlimited.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=m6qG3BxsU9DzBi96t2cPx3U6M9c7IcgwUtyH0SLYa4g=;
        b=XQJEBD+Y7xXVzz/nDHd/S0HvH752rWzTMP0DGsUG38TNK8qbInkeX38e7aL20QWe6M
         kBVcoZbmlAMEKoI1tVfFsZpem66CouQRKsddSFwIgsX5WGdyHserqv6Cz18iyTVwfS51
         nRepPkKhPh77MF1ftu2fBC1KafiG0Apx3fp/A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m6qG3BxsU9DzBi96t2cPx3U6M9c7IcgwUtyH0SLYa4g=;
        b=4xzooVXU8DiP3dCrZjEpNucS9HbBvD0CinbZYFF4JARmehbXWcu3RChEYBKLH7YxA9
         KGHcTZ2VNs4RxXF7gzOSqo9QsMJx0QiBcsuLdO9wye44yku6omQ4ya7PkWjkscny8u6W
         zNYTfMp06WfL9rtz5+Y5uMTFtikYkqc7pWBRizZSJN4kgWZScJawNr4lni46c+h5lnlK
         gvP7XSNNX4AEh5htjQMKEp6HbpL+dCe1kI2nVqlbLWVi2JuIldaAeCGsQyZIfCClpfjX
         L0VqI2BeoepqxyesmPxnyeQTGrHbTDvLjOUh+YsqtSCWD3SZ/NrndZZOmVZNQ2PbGcxj
         eVMg==
X-Gm-Message-State: AFqh2kquG4AmOUvyagjR41GcZaJYhdYloYdAIWEvfNK5vwBP30Euedh6
	l3qRPi5mvLygagEshYhLTqUZJ9EG0EyrC8QSsEp57A==
X-Google-Smtp-Source: AMrXdXvidJI1X9Ofw2tlxMTOMXNJKUk8KX9Nvo9V+Ox1qGGWLz9APdwv7vOmlMKgq5MPZP8u79+DHlr5adylHiaktg0=
X-Received: by 2002:a17:906:f9d5:b0:86e:65b8:e908 with SMTP id
 lj21-20020a170906f9d500b0086e65b8e908mr2065436ejb.450.1674545367480; Mon, 23
 Jan 2023 23:29:27 -0800 (PST)
MIME-Version: 1.0
References: <52861a84-0fe2-37f0-d66a-145f2ebe1d79@gmail.com>
 <20221214134620.3028726-1-peter.suti@streamunlimited.com> <c6863a3e-8855-50fe-25cb-0b38bc3a05e0@gmail.com>
 <CACMGZgZY4Zb+3vHUDAS0+3r55K4_J40dtbsTPTFZMd6duBikpQ@mail.gmail.com>
 <7c4aa0d2-d8e9-416b-b2ad-f5c3c8ea33de@gmail.com> <CACMGZgaS7z2YoViA3jV-gVBvASSq1maiGj_6hfrJQ3zr69esgQ@mail.gmail.com>
 <c6d797f8-8177-75c7-4522-eea3da6b56d8@gmail.com>
In-Reply-To: <c6d797f8-8177-75c7-4522-eea3da6b56d8@gmail.com>
From: Peter Suti <peter.suti@streamunlimited.com>
Date: Tue, 24 Jan 2023 08:29:16 +0100
Message-ID: <CACMGZgbR_aE9Wph3ZGZ8yGy+V2qjG6GXV8w6JMkw2WYzk8gdow@mail.gmail.com>
Subject: Re: [PATCH v3] mmc: meson-gx: fix SDIO interrupt handling
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, linux-mmc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_232933_023721_463A451F 
X-CRM114-Status: GOOD (  14.46  )
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

On Thu, Jan 19, 2023 at 8:37 PM Heiner Kallweit <hkallweit1@gmail.com> wrote:
>
> > v1 and v2 also fix the issue, but v3 does not correct the bug when
> > WiFi is stressed for a longer time. And therefore it should not be
> > used.
> > Could you please give us some advice on how to investigate this further?
>
> One more thought:
> When checking device tree I found that my system uses IRQ_TYPE_LEVEL_HIGH
> for the SDIO interrupt. meson-g12-common.dtsi uses IRQ_TYPE_EDGE_RISING
> in mainline Linux, however vendor kernel uses IRQ_TYPE_LEVEL_HIGH
> in meson-g12-common.dtsi. A wrong interrupt trigger type may result in
> lost interrupts.
> So you could check which trigger type your system uses for the SDIO interrupt.
> If it's IRQ_TYPE_EDGE_RISING, re-test with IRQ_TYPE_LEVEL_HIGH.

Thank you for this suggestion, this change fixes the problem fully.
With the interrupt trigger type set to IRQ_TYPE_LEVEL_HIGH everything
works as expected even when WiFI is stressed for a long time.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
