Return-Path: <SRS0=Clcc=SP=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D884DC10F14
	for <linux-amlogic@archiver.kernel.org>; Sat, 13 Apr 2019 16:36:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A71BF21721
	for <linux-amlogic@archiver.kernel.org>; Sat, 13 Apr 2019 16:36:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="elZLtUQH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="EqmMlP68"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A71BF21721
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=f8G3k0YN99jESapWhMilWEQHs94EcUR+k5U/hN/g4nU=; b=elZLtUQHlQJkdr
	yvF2AoT3OKv2wTq/2BpRqGkPZy6cdZyPz2KoKI0JyTOBjk/qMk7QqkqmsRXTmJ9m9O2ZF0ppq16M7
	KaSjqS0qtQ9jjXlbJiVOZ1SwNYdXpYjT3lRnNkknEX0WFUXBMDTn4t8DnNeXgYWnSQjrKSOalyrN1
	z4OqjeHr1vPGu8gveDVWcHF/MRfWbMMMgIMCsxKC7DyHi7pmIyTXj+QUzSeSZUSlo3SKAfICHJ5JU
	6DOcYND/T3J3b+CgpkGXn1FB6c1g/4BaoQYWlVldKWpOM/RH2i98IJecX5PfCdiii1xHKTySw5qAA
	uwDAjnBEV2Kf/qb0tXfw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hFLdw-0001B6-QP; Sat, 13 Apr 2019 16:36:40 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hFLdu-0001AC-5w; Sat, 13 Apr 2019 16:36:39 +0000
Received: by mail-wr1-x443.google.com with SMTP id s15so15895472wra.12;
 Sat, 13 Apr 2019 09:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eUlrZNmzEIhs7/anF1YSLhB9mWOmJ5DjO2LhLTU+ow8=;
 b=EqmMlP682lgyqRc3Nd3Gtx0Y58CU2naPNN0Y2efrH4jKu6osJ4o+gYv+0DQlXHXERG
 X3jijZ9lTNSYM5V4YqyHTvXPHRIzep0rlQJwFFN7hRadYhOBwMr5crHydTC7p+AucD5v
 tBnvAtn0GuYrrVUL8vhlwZwPY3vk3o6mUrQs20ayQJ2EP7AWmJh5JBfBmbgdwWYEZhvR
 0FXyKPzgbTHxDwxn19DcRyRIOMS84QgKtG73OJaqwdgjogdp2s0iBoEZMdNQxT0Z301x
 uIqa68wp5UjTk+aIW79uUP1VsNdBg1ZYggi/76EWcvP8ji5tYX/UAqfFySRIdBZWEahN
 JM7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eUlrZNmzEIhs7/anF1YSLhB9mWOmJ5DjO2LhLTU+ow8=;
 b=bn8adQ4Kbm+YbWxesas8EtZTwvXz4LByI1ikmnlJFJp+HILLaO/lfBtShka1y/G2ht
 Dod1K+kESCc+HySn6oIY/l1rJRkcWc26NngS67OxGhwVhWJCQ4M115d6Ikc9ACqfZn2A
 h0JANCshsw7+FNk4zSAZrn76wrbp/+4v3qe76n22660bAAy3IAKUPF9wNXgoao3X75uR
 r41OYwR9COT6G0pyjJHPnDmqolbXBZ48NrBTUHYNCD4/WsEZgS3lbVV+WwEuzWMHd1Cq
 boT1swqW+uTDm8w/AESBlJ8yPoQCyR1mH1x9recvKai1LBvEkxmyzs/5JyAAID/RDOz5
 itYw==
X-Gm-Message-State: APjAAAWsE5KJO3DM665kyw7LZtHDIyhS6sGaQG7fi59EaCk4s+plXnRf
 O2dx379puZa5Fwlq91AKVOHGOiDg
X-Google-Smtp-Source: APXvYqxMBvHoLeBzMx8VHk8xicAgEWnIX21exRLPUtQqjMRcCSFtPqruqVsddJO8tLHx6fe7/fuEUA==
X-Received: by 2002:adf:f286:: with SMTP id k6mr37373261wro.137.1555173395877; 
 Sat, 13 Apr 2019 09:36:35 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300F133C8AD00714E418F6C82D049.dip0.t-ipconnect.de.
 [2003:f1:33c8:ad00:714e:418f:6c82:d049])
 by smtp.googlemail.com with ESMTPSA id j3sm106200069wre.51.2019.04.13.09.36.34
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 13 Apr 2019 09:36:35 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	khilman@baylibre.com
Subject: [PATCH 0/3] Meson8b: add support for the RTC on EC-100 and Odroid-C1
Date: Sat, 13 Apr 2019 18:34:20 +0200
Message-Id: <20190413163423.15149-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190413_093638_256970_7A855DF6 
X-CRM114-Status: UNSURE (   9.15  )
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
 jianxin.pan@amlogic.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, ccaione@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This adds support for the RTC on the Meson8b EC-100 and Odroid-C1
boards. Example kernel log snippet while booting my EC-100:
  [    5.713750] meson-rtc c8100740.rtc: setting system clock to 2019-04-13T16:21:48 UTC (1555172508)

I am only 99% sure about the naming of the clock in patch 2 and 3.
The public S805 datasheet from Hardkernel shows (on page 24 for example)
that clk81 can use "XTAL/32khz" as clock input. That "XTAL/32khz" clock
is described as a mux between 24MHz (our main XTAL) and 32kHz ("that
other XTAL").
I believe that this other 32kHz XTAL is NOT the RTC32K crystal because:
- schematics of the EC-100 and Odroid-C1 clearly show that the SoC input
  for the RTC32K clock is labeled RTC32K_XI / RTC32K_XO
- GPIOAO_6 has a CLK_32KIN function (shows in EC-100 and Odroid-C1
  schematics as well as the public S805 datasheet)
- Always On domain PWR_CNTL0[11:10] (public S805 datasheet page 19)
  describes it as "Alternate 32khz input clock select from GPIO pad"

Thus I believe that the naming of the RTC32K clock is correct, but I
wanted to point out that I'm only 99% (instead of 100%) sure.
Jianxin, please let me know if you disagree with my findings.


Martin Blumenstingl (3):
  ARM: dts: meson: add support for the RTC
  ARM: dts: meson8b: ec100: enable the RTC
  ARM: dts: meson8b: odroid-c1: prepare support for the RTC

 arch/arm/boot/dts/meson.dtsi           |  9 +++++++++
 arch/arm/boot/dts/meson8.dtsi          |  5 +++++
 arch/arm/boot/dts/meson8b-ec100.dts    | 14 ++++++++++++++
 arch/arm/boot/dts/meson8b-odroidc1.dts | 14 ++++++++++++++
 arch/arm/boot/dts/meson8b.dtsi         |  5 +++++
 5 files changed, 47 insertions(+)

-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
