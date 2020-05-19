Return-Path: <SRS0=cBSj=7B=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7888DC433DF
	for <linux-amlogic@archiver.kernel.org>; Tue, 19 May 2020 23:12:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40B3720809
	for <linux-amlogic@archiver.kernel.org>; Tue, 19 May 2020 23:12:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CnAAmvjV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="A5oPi8I5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 40B3720809
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xtUdlrkZtHafnfEM2CZP6p2Lew6+9ZbQnyfDFvcXcNc=; b=CnAAmvjVgqjj1X
	gx66OYCiroxfzZFNtwwz7bhe+5cGZ9paYHd/3T3gHsS3lqf8ETrqCg8QCufI2Yp06TPntg7qjJtuV
	5BCY8ndv8raBi3bZEub+Syo+DpuJDFHJ+fL1nNnOqHtx3ydRFwHc3TTGVr0M9BGJVE85o/5Po7Ofo
	y0VjmgAQOxh7/Bg1fVj5MZK3QM0Fb1a8mIUf7L60JKepi+azdnWK9mBnu6Y/8NmLNP5MS2QUyJMau
	JfcSIeELTSpQfFHXBMLFqyJrNsPJdzT8fkKtwQU5wMZ9VqAAOyFo/Rk9GeK/Cg/XGYK41P8Pp+Yju
	zhic9+GtKYG72vY0jW9g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbBP3-0005U4-DT; Tue, 19 May 2020 23:12:05 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbBOt-0005Lg-TA
 for linux-amlogic@lists.infradead.org; Tue, 19 May 2020 23:11:57 +0000
Received: by mail-pf1-x442.google.com with SMTP id n18so649163pfa.2
 for <linux-amlogic@lists.infradead.org>; Tue, 19 May 2020 16:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lx7UJrQLBWSojDrUx+gUmzxXfR3CRe9hyj+Wu8TV59E=;
 b=A5oPi8I5sC1vfxsrl1SRotsn0XbQlnU4l+EniyKtzY0siFWyg6jLea3qRNwgDiFZd1
 z4NM+aZAM2If7cQMOkmhbi2//3CMrdMvRKIQ3xDem4GqVU5elpaHvRgiz2O9D81+ief/
 G6ffhFeUe3LKqzIj1In5sAXgCEd2hC5dXQ3Vft77LMk06G6RwqXVLBYke2ooTXHPa1IZ
 Xjy+l7Q90/SKSaW6sujHObI0N36jWxj2DNqEorK3b0K4lNavJZUYOQjrCE9y1XyM13rc
 Ai2IzZAgKw1eYrYF6wRtZQcKTcgmDsLfK6QHfUtXsIWuuK5mk3izlz61DOk8PZH+OF32
 1v7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lx7UJrQLBWSojDrUx+gUmzxXfR3CRe9hyj+Wu8TV59E=;
 b=OSUA5zM/uLVLStBHWN85k2ZQY1zxZASMcBh9aHLHL8wyzWpDZf7yYlKS970d1VbJBd
 6x74t+PoM4QeSDqWs68KWinDakiHSf9fnd345h41QEstiBWPSKDjsMP7Ds8AIXqIkkva
 NZsl4NFu7gnE4MXp2zHGyQLbYSNK8Im3fcfqbnt07W4zrrL/+f2srhRBuyUIKcCBNih8
 JwuGXjYtu+EpbJSg4FJ5d1uSjKvX/UfCstSo2fgJyT+hHik38kUbCIVFHk8nfyG7ol7p
 udgGLAB1BHM15npJy88oJ1gIv2R+nt2k/L+05OXYKcsgXRqBi1fw163tnRMuhURs+/cQ
 c9XQ==
X-Gm-Message-State: AOAM533+4hBltH9keJzEcjfS4tFCPVn7x02VJlYfJiZpuoWZogwtV7Xl
 xOSxsbe49Loh7EyIUGNgHyIwqGjriTKUvw==
X-Google-Smtp-Source: ABdhPJxsn0827XE2LOmPwBfl0cphgvNpH894AcJ7kRUW9DLwqSEUoaYm2yWR1fAAETXit5YR1DXd/g==
X-Received: by 2002:a62:4dc3:: with SMTP id a186mr1327386pfb.269.1589929914830; 
 Tue, 19 May 2020 16:11:54 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id 192sm426908pfu.182.2020.05.19.16.11.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 May 2020 16:11:54 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: linux-amlogic@lists.infradead.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH] ARM: dts: meson: add the gadget mode properties to the
 USB0 controller
Date: Tue, 19 May 2020 16:11:53 -0700
Message-Id: <158992990571.5859.7805491457862081284.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200504195105.2909711-1-martin.blumenstingl@googlemail.com>
References: <20200504195105.2909711-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200519_161155_937547_4C622188 
X-CRM114-Status: UNSURE (   7.67  )
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
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, 4 May 2020 21:51:05 +0200, Martin Blumenstingl wrote:
> Testing with a USB RNDIS connection and iperf3 gives the following
> results:
> - From the host computer to the device at ~250Mbit/s
> - From the device to the host computer at ~76Mbit/s

Applied, thanks!

[1/1] ARM: dts: meson: add the gadget mode properties to the USB0 controller
      commit: 9530dcf1082da23438ee557291c07d475128f63a

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
