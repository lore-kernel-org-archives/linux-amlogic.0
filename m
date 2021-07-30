Return-Path: <SRS0=tAAW=MW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F716C4320A
	for <linux-amlogic@archiver.kernel.org>; Fri, 30 Jul 2021 04:14:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F41DB60FED
	for <linux-amlogic@archiver.kernel.org>; Fri, 30 Jul 2021 04:14:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F41DB60FED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bvKLxCvj+WHbBvGO1U1DtIsElasRztMsJ30IkHjrV+w=; b=AqgsO7PozvRozg
	Pv3vrrsUaL+S8oiaSKRKtFuAzsaFqxsqyxdYicnozl5PZPgA5VQAPYK/6VXAvTwf+ZzUoz75mnVea
	WTUcT9dt9APaKrXdAcRSDTsuQnYptMUOvH1OCY/j2E/xEnli1Yu0828LKsD59vgKWJ/o/j4BA+xQh
	ZoyXVynUZ3asNIo0OvGwDMA8Gqa8Ldu1cZo6JGG5RNlLl33gqpvmHycBUsFTsq8AAgWOWEMk1oyzi
	iYf2AuT5EB6pmcDmu21pDcFRsXxQTFjfcfnThwP7qlzoptZLlZ/uBNBLcKVkg+0aAAEAq9F+Jp0Lg
	7YbKRP2gb7EzdK5oUs8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9Juh-0073Ju-KR; Fri, 30 Jul 2021 04:14:23 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m9JuT-0073G4-5c; Fri, 30 Jul 2021 04:14:10 +0000
Received: by mail-pj1-x1034.google.com with SMTP id
 ds11-20020a17090b08cbb0290172f971883bso18946967pjb.1; 
 Thu, 29 Jul 2021 21:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FvBye5rA/i9gJCLB0CYRwCAx++TS4yW2nWLT0eFIDrs=;
 b=LM53Mom3pAe12LlSUSgtZ5ylKfMyFJjf5WMVbBecCzsYqGT6TJwMrbkAGzm5GuglFC
 J5J+NyaD9DARU7gJak+K+kpsn8LgqMus75VKWHz8FdoQaTPJRzUYW/ATfFVPbk6Qht8n
 xw00ZlNgJXoL8dwYgdKd+CUYFsS7uMlyY6SCog/flKzdX/5ktIqytA2KmnRt3q9GH+iB
 2smWWuvjScseZ5auSrwwYY1RcubGLQndhrtJ1xG5RtE65K6q3RMr7kKWMyEXk/BM2Ovj
 uTHFrhYKsCEuyD8yGpziNWPWEvWmcCiz9A95/fM5eqonSjAm/YoCwG+at48mj4keZo88
 KYKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FvBye5rA/i9gJCLB0CYRwCAx++TS4yW2nWLT0eFIDrs=;
 b=ahm+rMc5TuTVl6RrpjbuipshznK0HRXM5RPsZsPIBWOl15nhXOvIPH/+PZb6S0wYEg
 pnLobzxKCNqDCfkUgXlbVLosT2W6XMz7Xg3PG++R7bXtWDhq/9bnMG1Qgkb9QtpIQH1V
 U1cpxMOR1FDzPp6pLJamqL9XqH1m6c7ljvEv3gKVkNxrHuEd2pHdbhnmgLbeNFAYo7sE
 hYFN8I2ngSM9+l9htOQCOdLLjpW35zXSXr+G/Jhq1od9tA1m0Jdmfssu9Yr5LxbL2krQ
 qMS0ftpXJaav6VJo2jukfZfHoWu98tEcNIFYJZuip4Ct5gq2IZoGId0g4RdwGhrpVWuj
 kxQg==
X-Gm-Message-State: AOAM531NTcwYAolXXEmxu5a0j/kvAW+kW1sdiQPLFxS39PZZC86iZe41
 NtCypJwfs6GH8NBpeFKs7UdUn17yyRe/FR37
X-Google-Smtp-Source: ABdhPJxj+dPUybLbzjGkjBAZMwKOW+2eA2JMyK/N7eKR/7OU03jVYZtj58Mg0Tkhs3MQukajGNwvbg==
X-Received: by 2002:a17:902:e9c4:b029:12c:9108:d85 with SMTP id
 4-20020a170902e9c4b029012c91080d85mr645895plk.28.1627618448302; 
 Thu, 29 Jul 2021 21:14:08 -0700 (PDT)
Received: from localhost.localdomain (104.194.74.249.16clouds.com.
 [104.194.74.249])
 by smtp.gmail.com with ESMTPSA id x4sm440943pfb.27.2021.07.29.21.14.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 21:14:07 -0700 (PDT)
From: Artem Lapkin <email2tema@gmail.com>
X-Google-Original-From: Artem Lapkin <art@khadas.com>
To: narmstrong@baylibre.com
Cc: wim@linux-watchdog.org, linux@roeck-us.net, khilman@baylibre.com,
 jbrunet@baylibre.com, christianshewitt@gmail.com,
 martin.blumenstingl@googlemail.com, linux-watchdog@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, art@khadas.com, nick@khadas.com,
 gouwa@khadas.com
Subject: [PATCH v4 0/3] watchdog: meson_gxbb_wdt: improve
Date: Fri, 30 Jul 2021 12:13:52 +0800
Message-Id: <20210730041355.2810397-1-art@khadas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210729_211409_252746_66E0782E 
X-CRM114-Status: UNSURE (   6.01  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

* Added nowayout module parameter
* Added timeout module parameter
* Removed watchdog_stop_on_reboot

https://lore.kernel.org/linux-watchdog/20210729072308.1908904-1-art@khadas.com/T/#t

Artem Lapkin (3):
  watchdog: meson_gxbb_wdt: add nowayout parameter
  watchdog: meson_gxbb_wdt: add timeout parameter
  watchdog: meson_gxbb_wdt: remove stop_on_reboot

 drivers/watchdog/meson_gxbb_wdt.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
