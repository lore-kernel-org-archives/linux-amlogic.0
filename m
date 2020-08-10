Return-Path: <SRS0=TX8f=BU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18C28C433E0
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Aug 2020 22:18:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BDB68206DA
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Aug 2020 22:18:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VGh+9yTe";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="adOmvN9N"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BDB68206DA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GzN5sR3EBbUEBfnKYHB9j1rUXSzazSqX4qhrkWcfco8=; b=VGh+9yTefcSBDIq46KOnr1SZn
	5WzifWRh6D3RNp3t1mdHNfzbEYdNrjD78qGhdGKNNubE7o/rXvQd4LC+eINGx+sQVucqTM7o5fMqv
	8yV36RGDbXClAvobALz+Dk7do9D5LpOYEZmconqxZtVRfb4eqPz8YKBoOsJgwtrVl2kKX8eSrqkdL
	JtDr5kAyDNvKtBeHeR5RsjeWrvpvzcSL3TuQdV03ZLm4Dfe7v6teAcgGzvaqHaKPWWTblhyUSMoQ/
	uJx3Am/Tz7Lenfi2WE1wlVXV6fsV0/nhyNuBFv1DAKuF+5y99RBQFnzakTJvskxc2Z7gjYVRCBE6T
	zUEQm+1GA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k5G7N-0001Kn-4u; Mon, 10 Aug 2020 22:18:09 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k5G7J-0001JJ-MU
 for linux-amlogic@lists.infradead.org; Mon, 10 Aug 2020 22:18:06 +0000
Received: by mail-pf1-x430.google.com with SMTP id y206so6499367pfb.10
 for <linux-amlogic@lists.infradead.org>; Mon, 10 Aug 2020 15:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9g8qtC2V4GxzmzZnkUZiLYQpHL1EZPwlKyzwefOemH0=;
 b=adOmvN9Nh5Suu6Rr0ep559QiIFKSh6WVwTDWFA3E5IPQ8JTo6c6V1S2hhqTL5YhKq6
 Fe1vLM4FdGV5u9+AJCiOEAJD/CSxl6aCXYP8Eee04JbdVZDFEIMPq3ax4n8SC8ngwA8S
 QfyOD8iUtD9AEPfY7GNfGTzbl8JmSHfWdaJmrtHbNoVuGd2A8GoyuZNM2kc/FcoUv2Tv
 ou2axvuOdArvKWxvENZ7Yhsad2M0LnkJ8/D0XMgxdoWsZAUJG6akoHYp37UZdovcSLAR
 BUU8LfAgcvd6j748HEVdAQriBB4tGKw2Ols9mMChzbTx0tBAoYt3E37Xvrivt9G+Dbbr
 RK0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9g8qtC2V4GxzmzZnkUZiLYQpHL1EZPwlKyzwefOemH0=;
 b=dHtsHEZAKkT/sf8RvfIBy2o/DeCQdexskUa+QORemauyxEmSN7atppXyjDbO76q1Mx
 gi7tfzTe6r4G/X0OhomFaOxenoW0zysfopsc6TLwJEajO1tjznDGIC0qtebEM196cSmA
 mj8sQsn6XJZEChVJzX1rXRHerIf0XrbFzhBKtnjz5W3aHua1GlD9joZ/G3Z2oeB3r1th
 R+NK/Op/6D0amcPe/gHP9ogj/SJ45QdjYjYGaSQAQiQHRzTRigHElW3Lfx28LBjJhuED
 md2iRJ5szxf/3GEgwi5K4cfKNbecM9WgZRJtE4e/D4ef60NIFd3ncJcZVNjwO6ZgflWu
 9jcA==
X-Gm-Message-State: AOAM530U8ML6UmaR3fvw7/AHF9Zrncd6t8Q9jiBOodDuPW1RRF6dG7Ov
 WWLIHP9WrSFl1Hob/VLHgmXvDUDPtNA=
X-Google-Smtp-Source: ABdhPJx9lnuS7+qH12wiV7U1ngctEYmUJ4OoiBcArJNsL5iYq+ebYnx24jafb/3FYN+x5XD96Z5mXA==
X-Received: by 2002:a62:768e:: with SMTP id r136mr3295501pfc.187.1597097884004; 
 Mon, 10 Aug 2020 15:18:04 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id r134sm23791051pfc.1.2020.08.10.15.18.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Aug 2020 15:18:03 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH] arm64: dts: meson: vim3: make sound card common to all
 variants
Date: Mon, 10 Aug 2020 15:18:00 -0700
Message-Id: <159709786936.10576.5338765095406106083.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200803142158.173402-1-jbrunet@baylibre.com>
References: <20200803142158.173402-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200810_181805_775530_1BE0AC29 
X-CRM114-Status: UNSURE (   9.90  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, 3 Aug 2020 16:21:58 +0200, Jerome Brunet wrote:
> The vim3 sound card definition should be same all the vim3 variants
> Move the definition to the appropriate device tree file.

Applied, thanks!

[1/1] arm64: dts: meson: vim3: make sound card common to all variants
      (no commit info)

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
