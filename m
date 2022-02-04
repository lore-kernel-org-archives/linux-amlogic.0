Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D972C433F5
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Feb 2022 08:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:From:MIME-Version:Date:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=G9TnI+0nreO8obRIVOzqXMqEz2WKesYk18/5Vsqh8Xo=; b=eDkn9IbxpQtosWEXYvScIMeh1D
	qGwQEYQsSKaRo7TXGnlS+F1tAGljc+/mQ2n+h5kcUbH199wHbE7hYDm7UvS/PwLKJpxMMq+Pf4z3f
	U70VuO3YjsqgeNkom9uRgNyPe3tLaA4DsE/mSELm9rTn6VmXdDf90QQbone3sccE4SA6Pp335B1oz
	IdToRspJq6QrEhdqO+TGLFqHQzGqtmOd6m+E3SU9COi0Qnj4/CXgoQmes/ODmZfizzfnnqiDnKo6S
	vYjxyrLW1Q8jbv7wN9s8lSj21jOtcrEMyQKFTtaXvDGsrJGVlRIdyu9Xs7l1jmf1JGA3+dyr3By79
	tw0ghUmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFtzF-003nN1-3M; Fri, 04 Feb 2022 08:30:33 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFtzB-003nLF-QV
 for linux-amlogic@lists.infradead.org; Fri, 04 Feb 2022 08:30:31 +0000
Received: by mail-wm1-x32d.google.com with SMTP id
 l67-20020a1c2546000000b00353951c3f62so2780455wml.5
 for <linux-amlogic@lists.infradead.org>; Fri, 04 Feb 2022 00:30:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:from:subject:to:cc
 :content-language:organization:content-transfer-encoding;
 bh=n3eiY4UY+ypB+x0APz9a4v6wlKAJG1IUhoWJAuUwkZ8=;
 b=a5jOP3KlT4ruvckUxtmgxMVm57m8VSbnvFBiPb1KUMjLTwLzKRQW0bREWTJpwcAuHU
 aspOIjZTsC+X9RWhCmZFjDwDkBKCdjQQ2u8yLD+ewYOeVFcak96FvAIbtm8qjZsB1SqT
 zXO6VaD5GxcBllVmYKfW7d1k7S6ONC2tyK490KC06w28XWW7psf1GUdKj40IOlq8IzD7
 5BHRgzn20mFRsRCaoL4XmzP8UmaiY3kOJdaV8GiklxrA4oNdL87jTTlN9sRQP3ZyLKas
 n61xkGHHrw2cXJt4zGARy1kLU+cdNo3aXTC9vTU7L7/lt4G1S9ta3HwxwwdzEsTk3tiG
 83jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:from
 :subject:to:cc:content-language:organization
 :content-transfer-encoding;
 bh=n3eiY4UY+ypB+x0APz9a4v6wlKAJG1IUhoWJAuUwkZ8=;
 b=drV7GKyU5gWlDmCcI701iGeirMFKUKe3o40H/vbZXcphvOFsj+d0960JUtF7mtRcyL
 ndLCJinxypTIMaP/T2SpmYVtL0fc5MzFtKRXgC5KteXGr/Q7+ClmZ/S71oVoeDZMb+FB
 nbq0hqLhWCPycxUaa1nDfUw0srMwn35QyK2fBKqBB9+j8u7z4LrD+yFclLPbTshdap32
 EfaCFQ2NlpCgJnBw1oyW8ASL72ZvRI8fcVjujrXlTTqgRI4jUcZG3b8dDiyGCiTNs6Fg
 6tetQxCyusbn+GdfCOyG84N/gI6gOLbSVBp1PBCmu0uSzTTpi/SiIgIouGKRUrLVZ65b
 KuQQ==
X-Gm-Message-State: AOAM532hT1KB1DKww4v3Uc7ORFbW3tzv8JDv5Xyh3X/e3lp9yQIC6p9v
 p4khO7ExKjflzRhtDgA9+s9LBdqH1+o88tsI
X-Google-Smtp-Source: ABdhPJwonSn2Lz6t7fGCm6dJtEjTJNAFwO2Sj1qk2OeVLsQMpF6FKIXNYWwPnLhzkVqhNh2ou5iJQA==
X-Received: by 2002:a7b:c744:: with SMTP id w4mr1276112wmk.113.1643963428449; 
 Fri, 04 Feb 2022 00:30:28 -0800 (PST)
Received: from ?IPV6:2001:861:44c0:66c0:3fbe:ff10:110:739?
 ([2001:861:44c0:66c0:3fbe:ff10:110:739])
 by smtp.gmail.com with ESMTPSA id m64sm960125wmm.31.2022.02.04.00.30.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Feb 2022 00:30:27 -0800 (PST)
Message-ID: <67888f6a-f4ff-9569-131a-0c7baba6ddaf@baylibre.com>
Date: Fri, 4 Feb 2022 09:30:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [GIT PULL] amlogic fixes for v5.17-rc round 2
To: soc@kernel.org, arm@kernel.org
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Language: en-US
Organization: Baylibre
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220204_003029_916570_E3589591 
X-CRM114-Status: UNSURE (   9.10  )
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

Here's a couple of ARM64 DT fixes for v5.17-rc1, they fix reserved memory zones
for the whole Amlogic SoC families, some typos for the Odroid & BananaPi board
and a reboot issue on the Odroid-C4.

Neil

The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:

   Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git v5.17/fixes

for you to fetch changes up to e6b03375132fefddc55cf700418cf794b3884e0c:

   arm64: dts: meson-sm1-odroid: fix boot loop after reboot (2022-02-04 09:20:41 +0100)

----------------------------------------------------------------
Christian Hewitt (3):
       arm64: dts: meson-gx: add ATF BL32 reserved-memory region
       arm64: dts: meson-g12: add ATF BL32 reserved-memory region
       arm64: dts: meson-g12: drop BL32 region from SEI510/SEI610

Dongjin Kim (2):
       arm64: dts: meson-g12b-odroid-n2: fix typo 'dio2133'
       arm64: dts: meson-sm1-bananapi-m5: fix wrong GPIO domain for GPIOE_2

Lutz Koschorreck (2):
       arm64: dts: meson-sm1-odroid: use correct enable-gpio pin for tf-io regulator
       arm64: dts: meson-sm1-odroid: fix boot loop after reboot

  arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi     | 6 ++++++
  arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts     | 8 --------
  arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi | 4 ++--
  arch/arm64/boot/dts/amlogic/meson-gx.dtsi             | 6 ++++++
  arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts | 2 +-
  arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi     | 2 +-
  arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts      | 8 --------
  7 files changed, 16 insertions(+), 20 deletions(-)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
