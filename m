Return-Path: <SRS0=UU9i=P5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 673D3C31680
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Jan 2019 18:37:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E30621721
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Jan 2019 18:37:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Hm+SlTEa";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="BzicyZlR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E30621721
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XOUeZz32vrxa/8800OZrsNyW5UT3yqiJLEjVa+ZdNEQ=; b=Hm+SlTEaosQ8Qv
	gtsFGASaf5wJXNd9Tpt/3f5E5xwAX6lv4CL3zuHv2aAqSAgJHVmQL2WH1nzB2rdD0TL5yrd0Pqclu
	Lim1+RrjNx2MmaDQGugjYH8znscRdOz14wYnbcW++U+1Vs627GBzxKPCaE+mRr3c5tgQch7cX5zog
	KA1XCfYqhOU0bjoFpp4AyqmnLsOvvmPcfwB3dD7qzZohpvbime2Ft5CPZ+lfN3X4hVR7EE5GI3QZM
	4t1pclHMgGPLK9TZLFz6Bci3mVpF4mNKQJ8SdXrmMtUOmdKZeeRxagzVsYUKTEAs/xL1noAT7vj4u
	u705danXLWcPSHqbNmqg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gleSF-00089f-3k; Mon, 21 Jan 2019 18:37:51 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gleS0-0007wH-Fq
 for linux-amlogic@lists.infradead.org; Mon, 21 Jan 2019 18:37:37 +0000
Received: by mail-wm1-x344.google.com with SMTP id p6so11795720wmc.1
 for <linux-amlogic@lists.infradead.org>; Mon, 21 Jan 2019 10:37:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IbM0DOHyY5jDzz8JUksEJIkvkZh69ojXO6oQ2IQ4b2c=;
 b=BzicyZlRZpKGla3A8MH48unLgy+9GDe/MS88i0gFXdjLs1rRegmgg9w2PdUkxzVHIz
 UA+F7FOTX0CfsTi/OituDbsyCkKFu9YbU0qZ13U3pgX+yXtzryClDXMk9UUx9SVT2uNO
 ImWIP4GdzJRaV0yNNZ6K4CvukXY0Q2sl+sVHjmhmExOS/uyZPLinl0a2GxJSk73lDdBA
 0q6h1iwrU0wL2MfwwcRupUTeTkUHS0aXxbZ+WLVFGZz16K4F6uJrXnPXtw4IgNqmzlw5
 DYdb78zJrUorRillGFqghAgH4aZFW+rg0CztXKgFLO8lp4nvIFSyR3M+NJVxOeDtCCwA
 4XVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IbM0DOHyY5jDzz8JUksEJIkvkZh69ojXO6oQ2IQ4b2c=;
 b=OaBJm2W0LIOQ0loNCVgU4EpKUXY3rQOYzzRTdpLd4Tq1fgPFjsnVCsAXCfaYpBvKN6
 cSyraY/D3tAYilS2QBUqIFnHtofzR0ou2q26VmQCXQOwixMrqcLnNtipGQHw1STSqn5K
 LH/a9ppz/kBTDgbljjqfQfWvMUH++4wj5Meaf3bk7XVrH9LrnSTp36OXTJEwFF5slxlR
 SPKihDrYPIkIdd7rX0HiXeAHSo2F2BRftfOia3eHKLcYDtQ78z8yfUJEQ2asp4rjR1M0
 x6U0ZDwTH98AwiEwtrru2y7ZP/sqY0V9qO2+Rt78MDmNq/w6v5708X86F9r6MHt8RtTL
 ejAA==
X-Gm-Message-State: AJcUukeuFGkX+D7hKySXAofhdI173oUhF8MO4n6fl303Q4dNaqeDENWR
 RjKzCzh+qcI2oKRKS0bTFpc=
X-Google-Smtp-Source: ALg8bN74X/1kQ/ljU1/EePf8kWlSiqNK9rZIXDijxhcGCIIwumXTi2t0vB0hJmKupiT0YVZJHT5iCQ==
X-Received: by 2002:a1c:2d42:: with SMTP id t63mr535619wmt.9.1548095854572;
 Mon, 21 Jan 2019 10:37:34 -0800 (PST)
Received: from blackbox.darklights.net
 (p200300DCD73A8100428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:dc:d73a:8100:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id 199sm55700630wmh.21.2019.01.21.10.37.33
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 21 Jan 2019 10:37:33 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 0/1] pwm-regulator: reduce noise on EPROBE_DEFER
Date: Mon, 21 Jan 2019 19:37:22 +0100
Message-Id: <20190121183723.25231-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190121_103736_545725_B433A290 
X-CRM114-Status: UNSURE (   9.64  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, thierry.reding@gmail.com,
 linux-kernel@vger.kernel.org, boris.brezillon@free-electrons.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

pwm-regulator can be a bit noisy during boot.

One example are the 32-bit Amlogic SoCs when using
multi_v7_defconfig (which has CONFIG_REGULATOR_PWM=y and
CONFIG_PWM_MESON=m). During boot the pwm-regulator is probed multiple
times - the first five tries end with EPROBE_DEFER. This is expected
because the pwm-meson driver is only loaded once rootfs is ready (as
it's compiled as kernel module).

Other drivers typically suppress an error message for EPROBE_DEFER
cases, so let's do the same for the pwm-regulator driver.

Example boot log where multiple "pwm-regulator regulator-vcck: Failed
to get PWM: -517" messages are logged (Odroid-C1, v5.0-rc3): [0]


[0] https://storage.kernelci.org/mainline/master/v5.0-rc3/arm/multi_v7_defconfig/lab-baylibre/boot-meson8b-odroidc1.html


Martin Blumenstingl (1):
  regulator: pwm: suppress EPROBE_DEFER error message

 drivers/regulator/pwm-regulator.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
