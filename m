Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BE53C433F5
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Mar 2022 08:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:From:MIME-Version:Date:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bQtNCsXTn0J8m4Qzm4OYb9F6ivkthAmxryDjU+O0CRQ=; b=CPXOUi7NsU+2rqPtIxlQzy54g7
	tvKbsOCF1uDB65PyXmDzcaqkr3T8tihMTcaBg9ljjZPqso3QcU0WLftInIUFwmLhshpiQ0oEZYTkw
	UTY/cZLoPUvKKGD5RG+VdtN5R96Jbjg7P2hW7Ok5VGuWPDxxIVnSGFKrErHbjf5j8hdWTN4M+AQfP
	X5fHAWXIMWIm5n26FgS92BDypEd5n9Mcv+bj142U+Sq4KTUDBhndpdJ10WE83KS19zRbRcL05+SiN
	8rv/rwb5KFJw1C9Ci1uRWaJKDSQA1pnf3sI7SFvH4rBsZ0Be3Nd5hK132OFsFVDs1CGXcBV+KlC5T
	iswZgjhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nR905-00GWzS-Ts; Mon, 07 Mar 2022 08:45:53 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nR8zo-00GWt8-NA
 for linux-amlogic@lists.infradead.org; Mon, 07 Mar 2022 08:45:39 +0000
Received: by mail-wm1-x32d.google.com with SMTP id
 i186-20020a1c3bc3000000b003898fc06f1eso111633wma.1
 for <linux-amlogic@lists.infradead.org>; Mon, 07 Mar 2022 00:45:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:from:subject:to:cc
 :content-language:organization:content-transfer-encoding;
 bh=NNH81ZuTlZ9R6IvbjsRsCalYWZjx70C0eZ0TqIBdVik=;
 b=rTkMyox9zC1nlmU4aTFhaaPxLaxUyan3IUQoqYUR7zyC4EKLVPR9EHklZucXlReAsH
 PMe7CN1dTzfHw1cCeDjTQoX2jQ6hvMpAzQN0JfUPbInv7GsTuMrrUJjnhMUktX17fSRu
 J9A0XafEqdbUtwx6a0kZliKIux0zEx0kq5GKwasy5mvT7wuozn30PiSERDj4uAR7z9Md
 kn5d9H9pybpRM5O3jDBr0n+aUXhA4MQkhAAYN+di8V3p2gACQCb8DFUmOH+itx67tIDP
 j3M/r2R6yalrP/LV+jjZdCQ0OlhdLFZnN9/2lLpKvjeN9b2J3dVJ8pJMZ/2qEvnVTLOi
 ps5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:from
 :subject:to:cc:content-language:organization
 :content-transfer-encoding;
 bh=NNH81ZuTlZ9R6IvbjsRsCalYWZjx70C0eZ0TqIBdVik=;
 b=gRc8WENKhoLYF1Gk4IE7lsyConfutYeO1UF2lF9ydv10cCZGE+4kz7wpcrXpUn4WI1
 e57/UrvN/xD07ZIYmvDMTYyfI/OzO+H5sU29KQg0nXSx0AjAff64yFglm9hH33VUKehg
 csFueesYJCs7FoSoZ0LzE4D1+zFzs18WXDEWS8wMyr4+CfgVPALYg6e94W66SNMDnwx+
 n9P86ljG15JZJbbIHlLKs9y7+/JVsbDliNxc0Oan8KjfKh+F+8deOJ4qoUV5zoXE0nFB
 9NmNzCpGMPZXQG30R5v8Bsw7FkZhQdp1M3I/HVAzxpJhEAbtQQQWrHm4IjEHXs3XviLS
 iVlQ==
X-Gm-Message-State: AOAM530dG7soQYzJxWtvTWgBY0qj8h3jUcemiCgXLgybJ/cY64LFYlAB
 wDHEuhgClg0wUtdxA3RfxjpTOw==
X-Google-Smtp-Source: ABdhPJzBGnm3vczH9cpTvFWCECpLXeFjAwJgIl3BHH/SNEOKz4pCH74ickWXp10r4cEYNSRe3oZxqA==
X-Received: by 2002:a1c:4c0f:0:b0:382:ab63:19ac with SMTP id
 z15-20020a1c4c0f000000b00382ab6319acmr8283711wmf.121.1646642734695; 
 Mon, 07 Mar 2022 00:45:34 -0800 (PST)
Received: from ?IPV6:2001:861:44c0:66c0:1451:71b4:fefe:6096?
 ([2001:861:44c0:66c0:1451:71b4:fefe:6096])
 by smtp.gmail.com with ESMTPSA id
 bg18-20020a05600c3c9200b0037c2ef07493sm14636011wmb.3.2022.03.07.00.45.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Mar 2022 00:45:34 -0800 (PST)
Message-ID: <c7471989-d929-c744-c0c3-c8e86eaaa225@baylibre.com>
Date: Mon, 7 Mar 2022 09:45:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [GIT PULL] soc: amlogic: driver updates for v5.18
To: soc@kernel.org, "arm@kernel.org" <arm@kernel.org>
Cc: linux-amlogic@lists.infradead.org,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Language: en-US
Organization: Baylibre
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220307_004536_794506_E79031B3 
X-CRM114-Status: UNSURE (   7.83  )
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

Please find for v5.18 support for Amlogic S4 SoC in secure power domain driver.

Neil

The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:

   Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-drivers-for-v5.18

for you to fetch changes up to f2b03c1056ef5c0829678f51273eace3e6327884:

   soc: s4: Add support for power domains controller (2022-03-07 09:40:39 +0100)

----------------------------------------------------------------
Amlogic Drivers updates for v5.18:
- Add support for Amlogic S4 in meson-secure-pwrc power domain driver

----------------------------------------------------------------
Shunzhou Jiang (2):
       dt-bindings: power: add Amlogic s4 power domains bindings
       soc: s4: Add support for power domains controller

  .../bindings/power/amlogic,meson-sec-pwrc.yaml     |  3 ++-
  drivers/soc/amlogic/meson-secure-pwrc.c            | 22 ++++++++++++++++++++++
  include/dt-bindings/power/meson-s4-power.h         | 19 +++++++++++++++++++
  3 files changed, 43 insertions(+), 1 deletion(-)
  create mode 100644 include/dt-bindings/power/meson-s4-power.h

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
