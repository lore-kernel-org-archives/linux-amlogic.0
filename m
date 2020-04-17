Return-Path: <SRS0=ZPw0=6B=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 636BFC2D0EF
	for <linux-amlogic@archiver.kernel.org>; Fri, 17 Apr 2020 18:34:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E54A20780
	for <linux-amlogic@archiver.kernel.org>; Fri, 17 Apr 2020 18:34:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UQSdAzzX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="bojG319N"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2E54A20780
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=C48Rte7jtvpv8uz3J5h6n12d+fzErwJNM4Li6W2+QjE=; b=UQSdAzzXMhLkTz
	dRazyj71VVjIb4ogi0k4Hp2XCIybkSnKjIygrekw8AouxBUyGdqMRCSqMdqcXxZqw6GyB8u2E2sjy
	76JuPr8HGGtu/ZwVrmdBsLtoAwpL0vRrAiH+N8iuZrL59OHlXSxWbZRgf2MTtTMXlkjJ5ZhYg+RIG
	PFaNaqC9LBwuVZrGaPeBW8X+TEQEgMxfqsEGG0PeNApnH8F/nUZbJCVJOMNPANMkFmeL8FCoqf6I0
	F2H5c9kBeXP7biAOGjnrrmGEN6y57cm1Qz8nynjYY0VMXnqsMEi98ED0Qds0y8etz9DIH9J25KaVG
	pya/+w6xfyxBT+LnjaVw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jPVoX-0008IH-7l; Fri, 17 Apr 2020 18:34:09 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jPVoU-0008Gp-4k; Fri, 17 Apr 2020 18:34:07 +0000
Received: by mail-wr1-x444.google.com with SMTP id k13so2958472wrw.7;
 Fri, 17 Apr 2020 11:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HscwK37cFKMub3BOfrP9Hc3SiCJrLqjZW3xZhk6qI2w=;
 b=bojG319NgtlkmTI7fGKzyA3aVCpaJ72KnmzPfwmdX98DNtqGu52+YZO0jEYJx14DUV
 0UdRwgovBE4uF3rYGkGa0veuWdTk0KtjapL6E/KH+XF45W2hOuuB/ZDdQyyoFUDpLmER
 rXUHhb7xW8cXpDW1mL6eng/NpL66M8c/0lNO3f69ju6HCLcVCOuKKQmXyNQeuMZ4WA63
 enPL2hlKsmIjp7gPiEdE1cCmttEnIkij5Z+v7gioM65U8o2hDS9BVzda80BZVAeRRGih
 gplpdez6CT5dyOG8KIBuMSYxst7NDLKViV4FewZrh4qA63JRfeezF0+BYto7AE8dGNBq
 CZKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HscwK37cFKMub3BOfrP9Hc3SiCJrLqjZW3xZhk6qI2w=;
 b=dBusPbxbiTlVPEltWfvxOpYPz5H/rTjBWeLZsgdhAUfBrLBGosPDksNDloJkjoPhLs
 IU3vzAYOqXR2rQoNdy+839iDMQGF0Zk87zSvptFJvzs0ZJkWQX4/saOJ7qYb824A1dNo
 fGjVlruU/XwtgDDq6oey407GCqzDG3SMk0/l2nrcosoML0R0s8dpY8p5el/upaSyKjYW
 ayhuzzldfuU/xx2xV/wiWBDZJ/p3IFgB126B3/ns2FAMrzJNJmldoZvSkpm35VwwgFJk
 H/SyZiVK3u8lbuTyBSIoiowIJNC2QgYWdegot+OLHW4ZuFYOtoumg/NcrwOEyDqJrtVr
 lpyQ==
X-Gm-Message-State: AGi0PubFi/4OIfjxVnBqodwhF4rB5g9Zpm6e+cAuMUqliYpT4buF03dz
 F0cScwtVLxWGxJ0B2Ty6VfI=
X-Google-Smtp-Source: APiQypLijZgFjxv4x89tuM/h2XT9WSLRN+Fy5h09T4tZQq+JQ6uZXZRDgovMQuFHwHCvNlKO23KWTQ==
X-Received: by 2002:a5d:42c7:: with SMTP id t7mr3138328wrr.336.1587148443929; 
 Fri, 17 Apr 2020 11:34:03 -0700 (PDT)
Received: from localhost.localdomain
 (p200300F137142E00428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:3714:2e00:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id o7sm3074994wmh.46.2020.04.17.11.34.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2020 11:34:03 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linus.walleij@linaro.org, linux-gpio@vger.kernel.org,
 linux-amlogic@lists.infradead.org
Subject: [PATCH RESEND v2 0/2] pinctrl-meson: two small improvements
Date: Fri, 17 Apr 2020 20:33:47 +0200
Message-Id: <20200417183349.1283092-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200417_113406_210271_667E64CB 
X-CRM114-Status: UNSURE (   9.17  )
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
 khilman@baylibre.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
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


Changes since v1 from [0]:
- re-send as non-"RFC" because I only got one comment in the past week
  for patch #2. Jerome pointed out an alternative way to GPIO_PULL_UP
  and GPIO_PULL_DOWN. However, this doesn't invalidate the patch, it
  just means that there are two ways to achieve the same goal.


[0] https://patchwork.kernel.org/cover/11484185/


Martin Blumenstingl (2):
  pinctrl: meson: implement the gpio_chip get_direction callback
  pinctrl: meson: wire up the gpio_chip's set_config callback

 drivers/pinctrl/meson/pinctrl-meson.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

-- 
2.26.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
