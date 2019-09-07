Return-Path: <SRS0=mB3M=XC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19D96C43331
	for <linux-amlogic@archiver.kernel.org>; Sat,  7 Sep 2019 16:52:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E10F621835
	for <linux-amlogic@archiver.kernel.org>; Sat,  7 Sep 2019 16:52:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Xan5vKR4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rJO3Xx+L"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E10F621835
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TI2VMKEdUwpeQ1Fu0OvhNtRQPn/bs5jYW5BUK452TLc=; b=Xan5vKR4hvIW88
	F2v5wPrTK/APK5LqORU5AFYmEWeZIBnxSZj8jNi3KQqhyqFL7ircWZU0vF5WVFXTGZP1QvbvGEgIv
	Yj3rUkOPcSX0eitznNl6DDSO/MzN6WDpvEuS+pgPVchnwVMRVok7whXZBarEnOFiBIAtwae0fOlNM
	syR3kSJiVUCoaXBgekWoHeWmrUCiVz8OKOzG1fggWjeItQb+nfyZ9BJ+PMHwUdo4BOYEj4EFJVglN
	OAd1Vk02viMpiZSE6B/nDZTW3U6lgSjenqK9jU1Kosj8L6o+66T9L52+HKQKOp0Mdp9TdDAlTnwoY
	NBDF5Zbqhxtp39x2rddA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i6dwM-0004K6-Il; Sat, 07 Sep 2019 16:51:58 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i6dw9-0004AK-AA; Sat, 07 Sep 2019 16:51:46 +0000
Received: by mail-pl1-x62d.google.com with SMTP id y1so4601502plp.9;
 Sat, 07 Sep 2019 09:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XqUaOhrKnokp+U3BIhPoQDVqzR2PKGp9qPpm7e89sj8=;
 b=rJO3Xx+LJilHSOb9TezJLprHbKLa2dVOr3TaqvRVliNReXln4ikSTBUFy1tINhdqbJ
 3nKy9dg+tTVf3PB4Q5TT7gmvcrI4S+fonQh0IeQ+3PyyCxK8PERFscpbBQCdyP9kvwtD
 j5dKgwau3ziI1vhYat1Mf0s84GvZUKlFEb2tLczomkR8g+BAGq4PVN9Nzt8Fw6KPhlfj
 WxWpGpNFrSnLkhqKZwOv3wCv1c9LppF7TgesGuEQ/qDa4q2fVdTi497CoXWq10A8tfxE
 EUgumPkeV8CHvoYTlkpL8yyLFWysH49yvmanA7lpEocj1Gw/MboNRnbIy9M5S20xBOXu
 HQkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XqUaOhrKnokp+U3BIhPoQDVqzR2PKGp9qPpm7e89sj8=;
 b=P5EF2tqNrDQNS+34+z+T/G6I2K5WLeFEwi22rnah8CAie6Ld5GiTXLz2d2uUjck/9n
 BqrI+5qGpwZXw4W7YJA4HbQ+WDqmKohuOO4QiFWJx9EN4QQIycwjv0rRi18C6wDgj4Ib
 xEuCt89tF5vTUN/PoPJNuM3EgHKcF8My/9baw8f6s8W2xemghFCUFfQpoFgBibY8E6bp
 Cibj3sQnDTGr/aziNj9oXWGikkvKGWl+vV7P+9KHB+MILNdqoxo23YW1N+9Uu03OrzcM
 0Fe4jiLpH/6LDdwdRGG/2YVTLOsGC8f5Gknj1f5CSK0aS5aShswWeqRy3rYaC5cQEUn9
 LKdg==
X-Gm-Message-State: APjAAAV0Rp2ubBm9ap5LM4j0adpfycTmW7UEb4d7CLnw781sEB2t+6Z+
 9a+AJVgQKmFPtWdoZd3/cec=
X-Google-Smtp-Source: APXvYqzvVkIDHOF9Yw52KIee27ayrvwR/SoHofhN/T9/LVtP7i2DCkkwvkpYy39Yp0g2ee8MuwIUZQ==
X-Received: by 2002:a17:902:be12:: with SMTP id
 r18mr14697890pls.341.1567875103917; 
 Sat, 07 Sep 2019 09:51:43 -0700 (PDT)
Received: from localhost.localdomain ([45.114.62.203])
 by smtp.gmail.com with ESMTPSA id v27sm20028215pgn.76.2019.09.07.09.51.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Sep 2019 09:51:43 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>
Subject: [RFCv1 0/1] Odroid C2: Enable DVFS for cpu
Date: Sat,  7 Sep 2019 16:51:31 +0000
Message-Id: <20190907165132.464-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190907_095145_354494_408516E3 
X-CRM114-Status: UNSURE (   8.35  )
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
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This patch enable DVFS on GXBB Odroid C2.

DVFS has been tested by running the arm64 cpuburn
[1] https://github.com/ssvb/cpuburn-arm/blob/master/cpuburn-a53.S
PM-QA testing
[2] https://git.linaro.org/power/pm-qa.git [cpufreq testcase]

Tested on latest U-Boot 2019.07-1 (Aug 01 2019 - 23:58:01 +0000) Arch Linux ARM

Patch based on my linu-next-20190904 on top of my previous patch's.

Best Regards
-Anand

Anand Moon (1):
  arm64: dts: meson: odroid-c2: Enable SCPI DVFS for cpu

 arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.23.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
