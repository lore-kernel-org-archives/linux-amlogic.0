Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA7BCECAAD3
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Sep 2022 16:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:Cc:To:From:MIME-Version:Date:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WlJc6RS1XyPpJiydvYq09DhvsVRQrXRTujJlShlEy/s=; b=aTqQi24PPV4QxRXaz0NUoo5Avi
	bdrmuLiqpLj1VfV4r7iEY8AUtHPFbj7sg8HwQStkx+qxIkiMaPVI4u/yAIL9rRD1qgCDx3Z1ST+b6
	bd9Ve5vdqSacz8mdTBV7t2AIMSqvpe+VkMT6BHQ7AxDrPGoVwLaCEJ5Og94Tbb1njqjrYrPjY2phf
	dLoJwXxjdaUBLxQjcpeNs669UZ+7O4B/43XZdYQNWBtJdlJ4tFL+4QVcj9bwgjUFia6V8Gk31McpO
	namQPzi7XLnTc5ZVhxI2U3+VmbP+hB033fM4JcSxYAY4r3c3mTHEYNAooBMD1LAyH8DocdKWDHIAI
	P+pycfPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVFFv-00746e-9A; Mon, 05 Sep 2022 16:47:27 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVCmr-004B56-KS
	for linux-amlogic@bombadil.infradead.org; Mon, 05 Sep 2022 14:09:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Subject:Cc:To:From:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=46nHfwcVM1dDNCdF68Lvdzc8m/qkXwrQBKqu1SebdGU=; b=iHzNV2n3V4it/W9D+XlCMBc0Q9
	8mokyYpGgMxM9EqB8kDTYKOzvDNmIwvyV3RXUdqGsbmshQAcU3Np4oRmOaqiBrhRKN5LasTDqRHwa
	S/6A5+Pii2l6tj5ZZS6wjy64srngVyJSTwhYZqcTC6CDz5VUNxCiAYNZ5Z5CcHcog3Q2a+DP/qcvf
	hMVv8k32hS37Y3hCk1E79DfoxbrQO76ujnOdYZIkDlgw5/YkwZYCXyjN0BtN06OcWqS1r4V25Vzhn
	cMjkPPjaRcNaon8tvMALN/J9QEPiDJKeUATx50/HVGtPNgTSPyA4iouTtDE8RPQtQD7qelcMhPDjm
	86HvE/yA==;
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVCaQ-009g9V-4D
	for linux-amlogic@lists.infradead.org; Mon, 05 Sep 2022 13:56:28 +0000
Received: by mail-wm1-x32f.google.com with SMTP id h204-20020a1c21d5000000b003a5b467c3abso7844502wmh.5
        for <linux-amlogic@lists.infradead.org>; Mon, 05 Sep 2022 06:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:organization:content-language:subject:cc
         :to:from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date;
        bh=46nHfwcVM1dDNCdF68Lvdzc8m/qkXwrQBKqu1SebdGU=;
        b=ltzfA3Gd+3ClHYPACNX8TAyUi62J7/B9l8WmYYZc+JsvK8w0IByaJRegcReh5AwCy3
         uJZ0+cQZ10HTp/d0EREkbggRncVZZzdLNfWH56MmzoMi5QMNNDua650zAklG9ektXBTV
         vvrE7qt3nbUbJF1EFjsUkJOE0N7CmRlYyQ88gfBordGaBokmEZu7ltv89xbgdbYrDeWu
         iPgtj7SflLR5sobYqJKl09V9y4JBsaCEgLJQleYs1g2Am7QpKaaUvqD1eCsBPLKiz4Pl
         Y3OQ2ZwsR5tesezdEf+TgYriKIhlqcq3B4cjMMX/0W8u4VmzzwSssjobFqs/AAQfA2SW
         fIgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:organization:content-language:subject:cc
         :to:from:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date;
        bh=46nHfwcVM1dDNCdF68Lvdzc8m/qkXwrQBKqu1SebdGU=;
        b=iE1rG7Z6tPuVjJ/l2uYRF0wQ63fbBFcL9M1IRszNeznO4uvXQqE2IRtiMSEEnMWtdx
         Cr4af8b/d7Z18p0Xe4grOcnx/Q9aK2tI0ND6OEfbd59KvmytbXA6lEN5SS3q2SoXgvZh
         usc/T/0x3KCzAqRSi6sAH2d21Ylmj4lsRWZinq6ubdRy3ZUGpXmjqGvSOTrZ1My2/XZ7
         u4XRToqR4ygzDQ0GrNWqf//UYtWd1lf50NtByKkUyU5w4krgkuwTfkzAfUPhuyoapXC0
         dvZOaKjy1CTpuqSqk/lGMkwecW9I472uatjmF4TWh6XAQ4P4aR2LRBEWR4f19s6LZu0W
         W/TA==
X-Gm-Message-State: ACgBeo3Bsej7kwo1uDVLP0khsZYhVAIXNKi4R3avw2V+/5JUkExEtyUo
	QnE9S9IRMiABLXGe0u6ug2Gy+g==
X-Google-Smtp-Source: AA6agR5+RfLa+a1KzdIA7RtQhGcgSFgElRnEUw5hzLPm9OQeakg4mFNtRMzXb4uob/qFX1XtV1bXHA==
X-Received: by 2002:a05:600c:600b:b0:3a5:b811:e7fc with SMTP id az11-20020a05600c600b00b003a5b811e7fcmr11412504wmb.190.1662386184598;
        Mon, 05 Sep 2022 06:56:24 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:f365:27e9:453c:4c15? ([2a01:e0a:982:cbb0:f365:27e9:453c:4c15])
        by smtp.gmail.com with ESMTPSA id z15-20020a5d654f000000b002211fc70174sm10598832wrv.99.2022.09.05.06.56.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Sep 2022 06:56:24 -0700 (PDT)
Message-ID: <ea093c00-a4bb-fb80-3430-71916b2853f8@baylibre.com>
Date: Mon, 5 Sep 2022 15:56:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
From: Neil Armstrong <narmstrong@baylibre.com>
To: soc@kernel.org, arm@kernel.org
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] amlogic Drivers updates for v6.1
Content-Language: en-US
Organization: Baylibre
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220905_145626_257966_91046A0A 
X-CRM114-Status: UNSURE (   7.01  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi,

Here's a Amlogic Drivers change for v6.1, with of_get_parent() refcount fixes for meson_pwrc drivers.

Neil

The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:

   Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-drivers-for-v6.1

for you to fetch changes up to 9491cff16a4996aee578adf9f41acfb1bc483df9:

   soc: amlogic: meson-pwrc: Hold reference returned by of_get_parent() (2022-09-05 09:23:54 +0200)

----------------------------------------------------------------
Amlogic Drivers changes for v6.1:
- Hold reference returned by of_get_parent() in meson_pwrc

----------------------------------------------------------------
Liang He (1):
       soc: amlogic: meson-pwrc: Hold reference returned by of_get_parent()

  drivers/soc/amlogic/meson-ee-pwrc.c     | 5 ++++-
  drivers/soc/amlogic/meson-gx-pwrc-vpu.c | 5 ++++-
  2 files changed, 8 insertions(+), 2 deletions(-)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
