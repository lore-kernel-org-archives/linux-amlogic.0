Return-Path: <SRS0=t54K=26=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 233BDC33CA2
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Jan 2020 18:48:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E0CC620678
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Jan 2020 18:48:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kiPYXnWW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Lw0ZM7JF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E0CC620678
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9y6WbfVJnrdK8YMQYtdfVXO88m35h5yEFnR8TM8LNkI=; b=kiPYXnWWMNL4YH
	rfoM8In4yRhk8fs0VbUUhVM5LGswFAQ1nQTcKeS9fdzq1+rm/BXmFJka0k9bfwLsTtL5shhNWcogc
	apA8Eo0T08GV/kByl8SgWRhWvXNdMX/J+naYhNDgwOiJdWz7mLVcrdvNUhPx+F7TISK4PW3Rrq4ss
	+wFKO+HWCbL6K8KylckAPIix7fs+Zr5n8VbJYKUaypLYqMjN1xClSKARpCv5QGG3lZWW0j5K5Q3xW
	I5kxedFRwQ39bpcdIoa2Zim6i4jd9kOnDDXi01wZPCAzcyq370ULV+8uvnjCY1htQt8Yhd9efwZV/
	kKKKViRbASCsl8ZByxfw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ipcqs-0002ql-Q0; Thu, 09 Jan 2020 18:48:14 +0000
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipcqq-0002ov-5L
 for linux-amlogic@lists.infradead.org; Thu, 09 Jan 2020 18:48:14 +0000
Received: by mail-pj1-x1041.google.com with SMTP id m1so1518807pjv.4
 for <linux-amlogic@lists.infradead.org>; Thu, 09 Jan 2020 10:48:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=AFKnbyhyZNGBZVJ66dibHIBX9df0tTokbpfAzp91zxg=;
 b=Lw0ZM7JFUdMV6yT7I4F1Pt8oFDH5ds/xjWqTbeQ7fK+MBVghCa05WNYVhrkbuHr4gR
 D4j5nsO8obxCSS38jHZuDKA45B+GWCEXgGuodhfD5lE65AqFnhGbjSre9LUb3qnBJEiV
 2GX/FWBRHFKbsbe/7EkEHo8XCHNJwOFXLkgefMaz9MIGShm3jEG+XKWwzKU3f67Lu9HT
 wOksY0ywwDM5xfnR1a5E8+hoDGaob6BVWGgj7onPQWmv77UFq8MTxNJWNJK/VoRsYqsT
 grF9LC1MMoLOZqzyJ03Xt+0q/t4l6s/0bbF3eT2PMOAu+g1qZqJpuoL1H9us+/VpfTw2
 Dv0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version;
 bh=AFKnbyhyZNGBZVJ66dibHIBX9df0tTokbpfAzp91zxg=;
 b=qSZtK87kLUbHsVu0N4B6+B4u0f44tdIoDOJpmD4++gW1ur7xIs35tkjcgGJjjITAzC
 2HF6bfXFz1Zw3A3NEeCA4tCMU7Nb4D1isoG7BH/dJoAiIEqwi1b2Y/rDa+XQOUCuIfwt
 wpH+MLpUq7ycjL7/ezQUA3lHpJaBAYhSyaDJSBqxe4aQNN93vFSCDW2HAd3Rs132ZMRC
 +Ghh4i8fUQFcg8gG+ZkvNV+4vA1d987yzBAwf4t4VYhrDyh7S4Oo0cbPe5xFEB7FZYQ6
 Gg3Yb4ZhEVdXYEyvL5KkDjHmL/zeKABTCL2TM0UVWm83YR6ageiaCUjSHDzIcJuiYpzj
 ZZ4Q==
X-Gm-Message-State: APjAAAW+8Fa5p3SrEMYijfVukyRGTl1VFtGBdVlI4qNgN2cxW6MRjZEG
 is39cmqlY1D7EvHBR1+wZkYt4g==
X-Google-Smtp-Source: APXvYqzhhNhM4fKvpU+h5B8fuFhKma4joGE9R3gZUuxyb6oVyxScqS3M3fq9QoasYjHGpUGZXDF0KQ==
X-Received: by 2002:a17:902:b691:: with SMTP id
 c17mr13417643pls.254.1578595691527; 
 Thu, 09 Jan 2020 10:48:11 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id e16sm8248150pgk.77.2020.01.09.10.48.10
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 09 Jan 2020 10:48:11 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: soc@kernel.org
Subject: [GIT PULL] arm64: defconfig updates for v5.6
Date: Thu, 09 Jan 2020 10:48:10 -0800
Message-ID: <7hftgoeaad.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200109_104812_204904_4FE9D047 
X-CRM114-Status: UNSURE (   7.15  )
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
Cc: linux-amlogic@lists.infradead.org, arm@kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The following changes since commit e42617b825f8073569da76dc4510bfa019b1c35a:

  Linux 5.5-rc1 (2019-12-08 14:57:55 -0800)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git tags/amlogic-defconfig

for you to fetch changes up to f8683c2abdf5129ec75d35d438aeff50df4f7208:

  arm64: defconfig: enable FUSB302 as module (2019-12-16 11:34:29 -0800)

----------------------------------------------------------------
arm64: defconfig updates for v5.6
- enable FUSB302 as module

----------------------------------------------------------------
Jerome Brunet (1):
      arm64: defconfig: enable FUSB302 as module

 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
