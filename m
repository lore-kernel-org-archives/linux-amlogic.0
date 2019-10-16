Return-Path: <SRS0=vLcw=YJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 410A8FA372A
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Oct 2019 16:26:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 137D121A49
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Oct 2019 16:26:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MU/N8Kb3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="LgzC5Cn/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 137D121A49
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zk+Y2XzdbIPv+b4Cj0K/Vg0QLl94i25HxBB+IWNYPdY=; b=MU/N8Kb3feNRU4
	Xjidr2vqwpOQdmCBi302H3HZkaSeg3bMULTGiDcg5Qfi/k4IeqoWEpfEgQuzpyFXTMpNlIt3en29O
	mn+6D8cqqs0/yDzPgPxbGkKA3Guhfl7VPuRDOGDMN7mG2RCcfJBBLZz8pyCk9GB3rnUxoVHP7j/eT
	QtCA+0pnmsM7MhVgXtd3vwii4JrmK0wzvQ3fEwpqAvx40CSStboWWXV5qh9tZqcAMO+cyXBR2Xy8m
	lKsEfbJQLgyke4eC6GZ/WirPF6mjwensRKz0ZExcIIsiE/1NQbeRhvQYxEIwmQoqXhfQXhbWUajo8
	rNk4kmMM5pffPi1DKMPA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iKm8P-0000TJ-Et; Wed, 16 Oct 2019 16:26:49 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iKm8M-0000RL-3i
 for linux-amlogic@lists.infradead.org; Wed, 16 Oct 2019 16:26:47 +0000
Received: by mail-pg1-x543.google.com with SMTP id e13so6386448pga.7
 for <linux-amlogic@lists.infradead.org>; Wed, 16 Oct 2019 09:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=2XIK6irSOUYOqaT55Cb2rTG7oY2nstdNhyuJ62jJp1w=;
 b=LgzC5Cn/xPt2olUE60N4pEOt4RSI2ZpcK9ac3jR5QUoHjfZ6KopcgFKySrAzfqZTLK
 xw/GP4Ayp98mwvf5lXiBtokVwF22c/go7Jq2fmAHO3+z/dfZ4UGj2h2lSPA4WPi3wTu5
 kx2xY3EISo3KDeawhuE8CoFt6RS3ckhddrTpZUBfj85vPWLuQ5gjqKgIodSgMg2Z8UOE
 QLXiWAtlZnMJukqaX13llRVWRA5GhM1++i+VT2hv2z7Jz1d1zTL4o+yZm0aV0tI5Dor3
 5/Lm+xvgudiyUXI4Q4b3d+P6YU/hlFTOozKWQPwvl5Qs3pkxxAMSoh8rHBJCZr+G0LNL
 AJnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=2XIK6irSOUYOqaT55Cb2rTG7oY2nstdNhyuJ62jJp1w=;
 b=FwfxyoKMe0RKeUBOffYRcFqScJpRSRI/dCIVDHSGUAwHcLlBCnbFw2Bya10yoU0XM+
 IEHF+cQwliI3ojMu4IqpIrW0q+7gANdz++jEqKcECtElsk80u0k0pbV78Rcp4I2aVB1A
 n9X+2o9eaqVC04IhkzX7vJvJuvIdEW7lKaENGRrN7g0sXJDf5ATfPKlIf/cvf4ivTIKf
 aJH8r7OWh3RtM26GqE5rQUhnMbQd4tf2FsOT9dCJ0Cz0NpIoORDbNW19aJo8pFNFesar
 T4piUXRGC2Gs7559dENMZlxj3/cpTs0kyr+k8MFmJx44dRnGz8Dm4ZebtPuUtC9Ge+VD
 fIjQ==
X-Gm-Message-State: APjAAAUhh6gyB0AVJmma/39nEYQ/tcHlCfDoWH7Het0PrsjxUVGYGTRi
 x9zeMC/+ce8INqnq/cf6e+0XTQ==
X-Google-Smtp-Source: APXvYqygm5XuOYj8EY825cN0gcWiXGpwZtxv9FetNVUXLKyxWccm3GGuLgq33/o/9nNMAg3YUL0DMw==
X-Received: by 2002:a63:4705:: with SMTP id u5mr24757808pga.317.1571243205298; 
 Wed, 16 Oct 2019 09:26:45 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id c16sm3155360pja.2.2019.10.16.09.26.44
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 16 Oct 2019 09:26:44 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: YueHaibing <yuehaibing@huawei.com>, herbert@gondor.apana.org.au,
 mpm@selenic.com, arnd@arndb.de, gregkh@linuxfoundation.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 ludovic.desroches@microchip.com, f.fainelli@gmail.com, rjui@broadcom.com,
 sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com, eric@anholt.net,
 wahrenst@gmx.net, l.stelmach@samsung.com, kgene@kernel.org, krzk@kernel.org,
 dsaxena@plexity.net, patrice.chotard@st.com
Subject: Re: [PATCH -next 06/13] hwrng: meson - use
 devm_platform_ioremap_resource() to simplify code
In-Reply-To: <20191016104621.26056-7-yuehaibing@huawei.com>
References: <20191016104621.26056-1-yuehaibing@huawei.com>
 <20191016104621.26056-7-yuehaibing@huawei.com>
Date: Wed, 16 Oct 2019 09:26:43 -0700
Message-ID: <7h4l08hd18.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191016_092646_161765_7802C4B8 
X-CRM114-Status: UNSURE (   4.95  )
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
Cc: linux-samsung-soc@vger.kernel.org, YueHaibing <yuehaibing@huawei.com>,
 linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

YueHaibing <yuehaibing@huawei.com> writes:

> Use devm_platform_ioremap_resource() to simplify the code a bit.
> This is detected by coccinelle.
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Reviewed-by: Kevin Hilman <khilman@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
