Return-Path: <SRS0=rXaj=A2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE0B0C433E2
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 Jul 2020 16:02:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 89A2020658
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 Jul 2020 16:02:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="wSEd66YH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jE7dK7a5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 89A2020658
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NUeSJe1T+MW3y3cZEgbA3i9XXWHC3UgJ+K+tFgtO/XM=; b=wSEd66YHsyxpTVQLXZ9BOVRbd9
	26MIw8o8yTbK/8E5yGJVj947PFowqRj5K/CjToAypFnGJTRt6X9DBVEbuKVHoHZg+YRK77tgkDK0Z
	JG8BbEUgz6Yt6dZv67ojd7GSIecw0GXVweB+cZjLJJkUYgQtdjKzv9Y/do1dChuQr2IMHrVcVv7ZV
	7azCzXdR/NqUKL8t5/oTMZH4XPASle+ceMT1A8lVh/vmfAGGWrn4SVE/SY4IY1jZfdcA1+AuzpuD3
	/wz7N9yHD+/zjbBQT8mewtwL63f0DP6V4LSQS2ZUCOKzoSzA6G5THfoK5QHsVdQgzKQtyMuC9dm+s
	Vp1LZ6vA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvjrV-0008Cx-IV; Wed, 15 Jul 2020 16:02:25 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvjrR-0008C4-LG; Wed, 15 Jul 2020 16:02:22 +0000
Received: by mail-pg1-x529.google.com with SMTP id p3so3300520pgh.3;
 Wed, 15 Jul 2020 09:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hzwdaSJqXx3p3pleSnirAKc5FuZuMmD64i/5xQ4XNio=;
 b=jE7dK7a5lhTtjrQLAsCwCspzIedtM/RdEOZA7aQDY8KSIQAh5tOi9EzKzN2MVp7xmk
 U6KixMBnY4Eb80roYMY9aQ47Ovx7D6zwsohn3H9DppKCQT6Evysny3M/mSA2EkRvmlcF
 vaQV4qxXLCT5cbEA1HoU+Px/knDoi55/JU46TYRwVwwboIuP0y5mqduAk6ZOVOMxA2oV
 s3zR/AVB3lWrbQM0WmKfkzu6qBbMQd9TBRzVt/BcrEYcei9vmJQh3NruUj8M04KHAGht
 idJzYwWYmMfzJWjubiAsTG/f+rge59fTd00EbGWKNsTNxl97UPoFX8CW0BSldgzNwJ0g
 vecw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hzwdaSJqXx3p3pleSnirAKc5FuZuMmD64i/5xQ4XNio=;
 b=qFjI2yycXwIdnR9J3KMO8sL3Yx6C/RQyOiiM58slfu9mr4Ua0o+inQDbK33G9VWASs
 VMBf4gc9OTFOB1bUbbl6zVvoyAEhg3yHU+cN4GCr3nETu1W8qos1KWrLM6xaYuR2LQKb
 wyriWOabqf0RDZjDn4G5gDVYnZyZ353T/zhqCLxwxgthBs8is9hmtgdQk3jMZxnvAgjr
 sU0OkpAoPWXdVioKTvuj9aUFO4EvtfRv8q6za6PblP0WAStJ/zExHncdvC6eJrnaPeyM
 wd/D/QQxALX3YIKGmsSh3NGkKxB5rYRuxD9c6XNSaxt0MiROnnW4mzyWpuJbtLozoB9x
 YwnQ==
X-Gm-Message-State: AOAM530dLHEl4dEBnbxaLBkrlOEx6hgcvvPKndNc1LwfKPsCevkcJmAX
 jYOAhxFOeZo605GZIf/OIq0=
X-Google-Smtp-Source: ABdhPJz4CQCJOkCHojwVDLWtNcmCdZv764QmOe880vUng49/spIODUdMB9fwR87vn3J3xg/sM54wbw==
X-Received: by 2002:a05:6a00:2292:: with SMTP id
 f18mr11595pfe.192.1594828937689; 
 Wed, 15 Jul 2020 09:02:17 -0700 (PDT)
Received: from localhost.localdomain ([103.51.74.198])
 by smtp.gmail.com with ESMTPSA id 4sm2520157pgk.68.2020.07.15.09.02.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jul 2020 09:02:16 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Subject: [PATCHv1 0/3] Enable RTC on Odroid N2
Date: Wed, 15 Jul 2020 16:02:06 +0000
Message-Id: <20200715160209.652-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200715_120221_705111_A466EE03 
X-CRM114-Status: UNSURE (   9.94  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Inoder for test suspend resume feature on Odroid N2
we need to enable RTC module on this device.

Following patches enable rtc on Odroid N2
but sill rtcwakeup is not working se bellow.
Any inputs are welcome.

# sudo hwclock -r && date
2020-07-15 15:53:27.706883+00:00
Wed Jul 15 15:53:27 UTC 2020

# echo 1 > /sys/power/pm_debug_messages
bash: /sys/power/pm_debug_messages: Permission denied
# time rtcwake -s 30 -m mem
rtcwake: /dev/rtc0 not enabled for wakeup events

real    0m0.003s
user    0m0.003s
sys     0m0.000s
#

-Anand

Anand Moon (3):
  arm64: dts: meson-g12b-odroid-n2: Enable RTC controller node
  arm64: dts: meson-g12b-odroid-n2: Disable virtual wake RTC
  arm64: defconfig: Enable RTC devices for Amlogic boards

 .../boot/dts/amlogic/meson-g12b-odroid-n2.dts  | 18 ++++++++++++++++++
 arch/arm64/configs/defconfig                   |  1 +
 2 files changed, 19 insertions(+)

-- 
2.27.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
