Return-Path: <SRS0=kcVe=53=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A383C2BB55
	for <linux-amlogic@archiver.kernel.org>; Sat, 11 Apr 2020 17:04:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E022420757
	for <linux-amlogic@archiver.kernel.org>; Sat, 11 Apr 2020 17:04:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tTsj1mVm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="Yily2VDj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E022420757
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7QN3jsgA+KDBs6MStnJNPmSyJdX6iXypxqr/hwWWjM4=; b=tTsj1mVm2lQ2iY
	V4BIRWrJrW6wJPV3vCEYlXMp0bGiuhGLHqsQC9sT3TjegOsgLeDV8WfMCsIg4wRWKAwZ80AQtZJ6G
	3uOD+NTfbrKedMOJ0ggkVhZ8pK0VdIVGCYC/mKFO1mdOQCzYsDY0jzh+fgxLVKZHWvZ11mYKFCc+B
	g8gmdnPfN2fea8udfAHKRKI/uDeU/3/c6kNmbj8jHxMo/7lJomCAUyXGElm6njiICE9l8JOCntvSS
	zrQv0dejVMa05bTl8TKvSSR/7QpvR9ouHKJ6aSaTjG2lPGHl4+BhnON0qCgEd3x82zzMIYneo5joQ
	n6mvN/yXPi4LA9d9LMRg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jNJY7-0004eM-MT; Sat, 11 Apr 2020 17:04:07 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jNJY5-0004d8-4Z; Sat, 11 Apr 2020 17:04:06 +0000
Received: by mail-wr1-x441.google.com with SMTP id f13so5582529wrm.13;
 Sat, 11 Apr 2020 10:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IOsMm1GoNxNPYYmUzD6jyXB9lWe+DZS5AsZXr/XfoUc=;
 b=Yily2VDjSsMda9iki03gFoCEaOVqcW+S746+ti6agF+KG13Utd3IY5W3YTK/aLJKEc
 79QFNOFfc+aMVMREmQ8KYlkzCsrPVhId0Myk0Id0b/oGg4RycTaAzxdP0bY60MtwvvEt
 naIVlKYlbHFIpjNmUhY5vZB3bsIGKGBBw0A4LlvmhZFWj0wg3D/rEtgTEte4pd8huIH7
 HqNhzI7qBf8F1sV/TuRsGefjKIf3k18Hzkg8EJ1s78ydC/syNA32PDUTE03R4ts38sgM
 VPukKz6XJvhay4pW1tHjGMqnRBlKTNelSBnjdntnqb2RrnRlQyJLCWemvapW/oqPg86K
 oIlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IOsMm1GoNxNPYYmUzD6jyXB9lWe+DZS5AsZXr/XfoUc=;
 b=VNSIgllaazjR6lSGmLBDcIwzhvlNyYIQvL0Y9eHNy+vNPAZmKRUSqLxTnUwVWd4grB
 ZdPDH4uSNiygmdsebr5YbgQZw1H/tWiYefnpMa0h5PJUVPH/OJSUXGZNNhNwR20oyU/1
 D5vntFy8Cm3FLXAfVxUdwWgt0SMc6zGKU75GjEeT/KhA5hFFC22upUhvuewPat2cFEW3
 gjVRZSp09QeIGKZw3h5B3w5R4L0IKd1KPiCI+0iyDkOK8Ke8Yqsxqlo9XfZaS//GnSi8
 b8MuYav7xCsbRj3VGLtl47VWFmCy9BWrdRy77ltoSCefQGF30VhmQ7NonTXBq8LZVku3
 LGRQ==
X-Gm-Message-State: AGi0Pua3+06TwPzuT3OY+Kxh++PyjKTk8qZo7qIFsBpL00gLxJChN/yg
 LY7jNsDdjVwfKbQ/sY+M8+w=
X-Google-Smtp-Source: APiQypIMueKGRpDHbSjx55N7jiNFBXeZ09WkesAqa0IiAUoyQbK4pwSfYGNHPwWisyKHBoW7d61usw==
X-Received: by 2002:adf:92c2:: with SMTP id 60mr7091115wrn.379.1586624642970; 
 Sat, 11 Apr 2020 10:04:02 -0700 (PDT)
Received: from localhost.localdomain
 (p200300F13710ED00428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:3710:ed00:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id x18sm7105067wmi.29.2020.04.11.10.04.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Apr 2020 10:04:02 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linus.walleij@linaro.org, linux-gpio@vger.kernel.org,
 linux-amlogic@lists.infradead.org
Subject: [PATCH RFC v1 0/2] pinctrl-meson: two small improvements
Date: Sat, 11 Apr 2020 19:03:54 +0200
Message-Id: <20200411170356.1578031-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200411_100405_200759_2FB08FC4 
X-CRM114-Status: UNSURE (   6.83  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

While playing with audio output on Meson8b I found out that the
vendor kernel uses a custom version of the GPIO_PULL_UP flag. I
suspect that we will need this for audio support on Meson8b and/or
Meson8m2 but I don't see it hurt other platforms.

Also while comparing the register bits with the GPIO direction (of
GPIOs exported to sysfs) I sometimes had a mismatch. This also wires
up gpio_chip.get_direction to have sysfs and the actual registers in
sync.


Martin Blumenstingl (2):
  pinctrl: meson: implement the gpio_chip get_direction callback
  pinctrl: meson: wire up the gpio_chip's set_config callback

 drivers/pinctrl/meson/pinctrl-meson.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

-- 
2.26.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
