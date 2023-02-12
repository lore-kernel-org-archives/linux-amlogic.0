Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF30DC05027
	for <linux-amlogic@archiver.kernel.org>; Sun, 12 Feb 2023 22:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y6J8Cb0WLqQyDE5DLqJVVz6964e5x0pu95iOfiYB3bY=; b=p4vsrQ7+rG7nsf
	ApNdxRP4l1gG/EWimte6KhamqNw06Fd+2eAOGvZK0H/k5bsAse9FPZDtxcIB+XadN6UdRR1DJpPLZ
	A8jQMBYyqaFrW4iSma7k+s3mkdDtKezbeQBH9DTPd6yL7wsEzM1tT9IWAs3Ji9GvHFru5jAqUzD4y
	I/vJZ1h8+E3mWc4U9tTwrtmxPxFKUX56YvCDfoGpLJO4ayqKUgoNpMiM5A5/yVJZ2HUJz7f3Ban1S
	fffebb9GikIYCnpqQUTd2lrGlAnQzKYDx6PB9w7j9h0mwMSlXmXDliZ7WkFXQapEYFTZvH0ThQfNM
	Qcq1cMIyK1v1AGLP/TQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRKzG-00CWpy-GN; Sun, 12 Feb 2023 22:38:22 +0000
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRKz5-00CWnn-Td; Sun, 12 Feb 2023 22:38:13 +0000
Received: by mail-oi1-x22d.google.com with SMTP id dt8so8892090oib.0;
        Sun, 12 Feb 2023 14:38:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=s3pF4e+yE1WYMQ/Nq6UrylxVMHOzbrRpD8GFxZ6NraY=;
        b=CKyKXVVWoHCGRqb4JHNeo/JHJbmvJDR6xIqrXhZU5kKzSewBAV7DAKhI1ISJeI4gGJ
         i/YhAsri0JcTFKvopelGLVvVd8GvftuZSjXdizrxlL5TnsliiK73V4pNfWs2lumSI+Hp
         SZ38Mi8WJjLbEBR5n7piGXBL9An20OKpR8oJZbmfDIJ0m5cAiM1tVtLF3FEglUpN06C2
         Lw4WWEd2/X5zwZyGJcd7vbnp/Z6eA2PprDkPws94TZBTUbV6eZ9c9WwmwE3GS0omrXWI
         oXkncjR0F3SSIhVO7LbN4Fu0ASFemDdm8QkX9UF6icQtO6T6QPDhHyozX2FJ/IMn7xWA
         2btA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s3pF4e+yE1WYMQ/Nq6UrylxVMHOzbrRpD8GFxZ6NraY=;
        b=24xwa9+1Hs7iRECSkM3cyvHFheoEWoEgvJmXZkp4wSetDscVtCk1M3S5S3FN/BDLXZ
         6N8Y8JYtPi2uJN+SJexJo+LpjQlzPcrYUqrdSwFlxznSGKTKhkZkZDMmuGcRdW/iJUyr
         +DeIevi0GLcqlX7nezP2KoQP3O7pVbiTOO65/RzWlVwecfQHFk2sfHQSTRsvjZZ0UO9H
         qAwgcAm534JwMNeIvAQlBho6JvRR7uOSdBW+/l8TNDg4hp6nwMwLTFkpG3NmJpCgCh3l
         qy8JxchnKTVkBuUaaNexbY5UlkUQILzX4bLT0qswivDP7M7ToyhrpvzdIfRJfRdO+ey5
         5aHw==
X-Gm-Message-State: AO0yUKVdyiNhn5M5oDZQaI4VDXX6AbjOMGJgBAMf4GjoLy0IxYKKqSq6
	8+8CUho4VAVKXwQj8u6Y0LA=
X-Google-Smtp-Source: AK7set8K2xP2e319H6ENNR2E4+vRrcu/Xi5EcOFsEBG3yR/+06GOwJjxQWj1HpLFS5N/r5+8RfqLmw==
X-Received: by 2002:a05:6808:9bb:b0:37a:2bf0:5026 with SMTP id e27-20020a05680809bb00b0037a2bf05026mr7730019oig.20.1676241490657;
        Sun, 12 Feb 2023 14:38:10 -0800 (PST)
Received: from geday ([2804:7f2:8006:2be1:80e4:f9a7:d80e:f5ea])
        by smtp.gmail.com with ESMTPSA id q187-20020acaf2c4000000b003780e80fad6sm4476952oih.49.2023.02.12.14.38.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Feb 2023 14:38:10 -0800 (PST)
Date: Sun, 12 Feb 2023 19:38:05 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	"linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
Subject: Re: [PATCH] mmc: meson-gx: fix SDIO mode if cap_sdio_irq isn't set
Message-ID: <Y+lqTSqKm4a/qTDN@geday>
References: <9e296859-0363-ecc4-2d99-fd0239efceff@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9e296859-0363-ecc4-2d99-fd0239efceff@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230212_143811_998165_CC170CE0 
X-CRM114-Status: UNSURE (   8.94  )
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

On Sun, Feb 12, 2023 at 10:54:25PM +0100, Heiner Kallweit wrote:
> Some SDIO WiFi modules stopped working after SDIO interrupt mode
> was added if cap_sdio_irq isn't set in device tree. This patch was
> confirmed to fix the issue.

Hi Heiner,

with this patch, with cap-sdio-irq set or unset in the DT, it doesn't
matter, I get the following warning on dmesg:

meson-gx-mmc d0070000.mmc: unaligned sg offset 3148, disabling descriptor DMA for transfer

The offset number varies between reboots.

Is that to be expected?

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
