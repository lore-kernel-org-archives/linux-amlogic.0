Return-Path: <SRS0=nSb1=BA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24864C433E2
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Jul 2020 21:15:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E498720720
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Jul 2020 21:15:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="z7tSoh0V";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="c/mV4KGi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E498720720
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1EL0Q5ssPx4OCyOk+LqjKitIhUFlz8CdCMmiYsSuib4=; b=z7tSoh0V8Ov/7UdoJA+p1Ph/T
	l+rbmJdilgW402skhIkO2zdAYOPV0MN6lTr9DUFtDaszhUmvmC829K38N/qu4/xDZhOoxID85lSVW
	xiU/paGJ4GTF1OyNEOxX4io7ME7eR38CqtQ+2S4O02yThZM4P7do9y+7QRwoFdo8ir8doI0lN23mD
	WnUrKln0ObLy5i9F5TbcwjSluP9I1lKbiLW/ONilpal+eV3g42BuJHcAge7UWR6UZb7RXbyKQLK+d
	de4Qz0bwCdIN+X2gQXTfYZOiYhHiqmYXO9Y3/HHokbzF7hqLz68uwIFNxq4qAbgIU0Khqgo2rO+Ee
	Tdcj5Rn8Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxzbc-0002ak-Pa; Tue, 21 Jul 2020 21:15:20 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxzbF-0002S1-F5
 for linux-amlogic@lists.infradead.org; Tue, 21 Jul 2020 21:14:59 +0000
Received: by mail-pg1-x543.google.com with SMTP id d4so56904pgk.4
 for <linux-amlogic@lists.infradead.org>; Tue, 21 Jul 2020 14:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/Mj6y7SpdNvDf6DkVOLENUdvlRqS8Z/NC8haKO/C3F8=;
 b=c/mV4KGi1aIfY5IlbtJjjCefNaJrsbEvvqK9NOIvwQ7QSax22F3MLnozNmRI1GtGDC
 6WOx1Yc8T07VvG7dNcxLYW6kAXze4sWKvIoXXjTMn6aboTZHelK0g4J5UtymI9qDBWc3
 Y7l+Wxek4YdBh4BGSzsJ3bGkx7FItIPf74ga1U6lDfHQNOA/kE0KXI3yjp1SaK5xFKsv
 akchu0o0VG+OVH5pP4lgrjsMEPHyiddyylS8qmfQkSCsC1FNmN9eNGxubgYWi+cA1ePP
 Mf9vaYbt3IdLFWFkHQ2V3a380ZVNdIkxM+kpTa8lM4lIQaO8Vrwd2MA7TjDFK/oJHDcJ
 vzDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/Mj6y7SpdNvDf6DkVOLENUdvlRqS8Z/NC8haKO/C3F8=;
 b=qprRn9OUCi6zM9v8Vm6enHqfx6x6RroC/5F5T3Nl6LkhugS+IDYGeHT7fztScmhSDW
 ebEeGmQYAUmwIGplsCbKTXzWsoXDBw6ESk2JaXa4746VP/8ehBzmr5CcxK/FhC7lbAJK
 kiXevZXabDZh6+p9q7RRGosMbtxM/ja5ToLiYxHot2jHFMKgOiq/bT0BKpvnwgq+A7n4
 4xt93LgsQzasW8OY14FNUMHaMCAtzjqFcokuDn6zAZTRcmNr/vFcfGw2pMiD8vVcnd1e
 8s2qIAVSyXJo/nE1QhSHgn0WaPhDcyAnCOFJyO/ZMg1SmicG20gpnbOQ3QQWVdGc2NE3
 RbWw==
X-Gm-Message-State: AOAM533r/SIQ4/xURNmU1My9o+U69DUsRWAaio3HUdFifdwKagTIBIO5
 R1oix1wc+TSKquRaXH6yM2cpICHf5HXNfQ==
X-Google-Smtp-Source: ABdhPJz1PqGZETkshE/A+1/sajBkQw7tyu3KeqdkwhOxqabRkKhYh2WCIXwbVfN5GRPhQ7aZkt35xg==
X-Received: by 2002:aa7:8648:: with SMTP id a8mr25835447pfo.222.1595366091969; 
 Tue, 21 Jul 2020 14:14:51 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id y7sm4130549pjy.54.2020.07.21.14.14.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 14:14:51 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: linux-amlogic@lists.infradead.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v2 0/3] GPU DVFS for Meson GXBB/GXL/GXM/G12A/G12B/SM1
Date: Tue, 21 Jul 2020 14:14:46 -0700
Message-Id: <159536607960.30777.14967661305847327487.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200719173213.639540-1-martin.blumenstingl@googlemail.com>
References: <20200719173213.639540-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200721_171457_562877_F48D0727 
X-CRM114-Status: GOOD (  10.60  )
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
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 narmstrong@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sun, 19 Jul 2020 19:32:10 +0200, Martin Blumenstingl wrote:
> Now that we have GPU DVFS support in lima [0] (in Linux 5.7) and
> panfrost we can make it work on Amlogic SoCs.
> 
> I decided to remove code duplication for the Mali-450 GPU on GXBB and
> GXL so it will be easier to maintain this. This refactoring is part of
> patch #1. Patches #2 (GXM) and #3 (G12A, G12B, SM1) are straight
> forward; it replaces the hardcoded clock settings with the the GPU OPP
> table.
> 
> [...]

Applied, thanks!

[1/3] arm64: dts: amlogic: meson-gx: add the Mali-450 OPP table and use DVFS
      commit: 46ffadc7e658277d7559899d7f641f14a3cfae8c
[2/3] arm64: dts: amlogic: meson-gxm: add the Mali OPP table and use DVFS
      commit: 8f16cfabbc0a6c52b114eca2ff8e95bb07949741
[3/3] arm64: dts: amlogic: meson-g12: add the Mali OPP table and use DVFS
      commit: 916a0edc43f03f86b13fbc9943e5dc936671ea6e

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
