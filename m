Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2E9BC433EF
	for <linux-amlogic@archiver.kernel.org>; Wed,  9 Mar 2022 20:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FkIWJH2UtdGZQ3tTf5vTR7kyBXT5lJQTiD4q0JOs73o=; b=aE6sXIPJ/dty8x
	w4a4dMhpiJiEM5Fk1gNpH36Mu49YVxHcQ1GpSb1Syg7HTywQDLRZLxs7UQ82nNTZcHr3d9WqIE189
	28ZiDaa7EB4eGZV8M/NZdXYQgbpXVfMJXXyH9VcgaC8fpLk8QLBjy+nEZp9mSi+FMVXPmbCYkeQVw
	WoW/bczimdu++JUdVpKcw3ko/Cm0Vc9i2tkb5lXGVr8fhiGNUPWO+77CdIXjsGIqrKIGNxDZod7w7
	DnXIWlV1l/ffDUETh9RA/RndGoueD0DCyS+XTSJTjUxzAsAcpSqqguJFz9aFUgEsdaMM8nrrsq3M9
	9N3ethKBJl6d6kFoollA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nS2nE-00AOqY-Rn; Wed, 09 Mar 2022 20:20:20 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nS2n2-00AOpC-U1; Wed, 09 Mar 2022 20:20:10 +0000
Received: by mail-ej1-x629.google.com with SMTP id r13so7624975ejd.5;
 Wed, 09 Mar 2022 12:20:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:from:to:cc:content-language
 :subject:content-transfer-encoding;
 bh=RcTddA3HB76ItcVFPeiGto64Ir7EMxqM0hxFlC7rmpw=;
 b=MI5qZBzailiAhneHd4+OjDfYDa5Nt50+tH+00MSA3GrfwXhJL28OMJ6j3814I2/1qp
 u8fwt39gjpQfwXpb9EQsfrzMobuGx5/D22cJC/9tBOX4TgRQRs3yOnQA8WaPl49ZQ1NG
 TIy1JO+wnUGm/bFIAk3Kh/ZDeJ7OsA5jviuL0IRhunFjXowExptQk1VskTMWPmuhd3Ir
 Clpv+pkA2NEyziBcup6nV+eHIdp8iRg1CkgH6VHG9bh2czKY4NRxXJscFuF9iwJ2EzAz
 XYIWyhuVJ5PAnNUQaAI/OcByyw5WdD75kp9OE0mN7agz0qtEgOpMNa01gZSTcieu3wr4
 kXNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:from:to
 :cc:content-language:subject:content-transfer-encoding;
 bh=RcTddA3HB76ItcVFPeiGto64Ir7EMxqM0hxFlC7rmpw=;
 b=Nql14CG5KBa9IgXeyt9AZkJFlohZYtAiVez26fC18mct2gaOxM7Ma5y93HXhLbspZW
 mWmuu5bP3yhdfnLNdIWn+K3lJe9cGLP9DSzJTKvcylt8hJjUquU1iZ5RnVKKnRhgrZhM
 bcNAcYl6PEKR24MTdj+LrRu1xFPxy0umgNKNhgvPXNXvnX6EbCeNMrC0EZgdgkDFbfTk
 2eLnH92DLysOzkxFBWnXHMu6NQMdXgqdvlPv8An5PqIBDyuMzDAUuSVhC89tOThqA1PC
 ulu96q1NomS7bbR1GK8odIQBplt5QcMYRJGuLcfn3FOUhq2vfVZwMSjpanwk/v8xRKTh
 EBFQ==
X-Gm-Message-State: AOAM531L34vncWQU4KbNsHy64K3JMrqHxnFfwIP+rIFG53rPvGiqk/hz
 4NkaJTz8QyGtb+pT7/TZ7bc=
X-Google-Smtp-Source: ABdhPJyyc4PFdseh+km03ErxkxgbvmAZ4sg5mReDbXoDuGBg9vDmkzkHCT6h3sZa4enqFieD0HBfKw==
X-Received: by 2002:a17:906:b6c7:b0:6db:2e14:875 with SMTP id
 ec7-20020a170906b6c700b006db2e140875mr1333017ejb.737.1646857206984; 
 Wed, 09 Mar 2022 12:20:06 -0800 (PST)
Received: from ?IPV6:2a01:c22:7793:600:9d6a:7788:3389:da6c?
 (dynamic-2a01-0c22-7793-0600-9d6a-7788-3389-da6c.c22.pool.telefonica.de.
 [2a01:c22:7793:600:9d6a:7788:3389:da6c])
 by smtp.googlemail.com with ESMTPSA id
 w15-20020a1709062f8f00b006cd545d4af6sm1115989eji.45.2022.03.09.12.20.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Mar 2022 12:20:06 -0800 (PST)
Message-ID: <51953618-79b6-0df7-2d28-d5dce4dc86c7@gmail.com>
Date: Wed, 9 Mar 2022 21:20:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman
 <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: alsa-devel@alsa-project.org, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
Content-Language: en-US
Subject: [PATCH v2 0/2] ASoC: meson: aiu: fix duplicate debugfs directory error
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220309_122009_014987_63EADFA9 
X-CRM114-Status: UNSURE (   8.26  )
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

On a S905W-based system I get the following error:
debugfs: Directory 'c1105400.audio-controller' with parent 'P230-Q200' already present!

Turned out that multiple components having the same name triggers this
error in soc_init_component_debugfs(). The proposed solution allows
other drivers to adopt the same approach with minimal effort.
With the patch the error is gone and that's the debugfs entries.

/sys/kernel/debug/asoc/P230-Q200/acodec:c1105400.audio-controller
/sys/kernel/debug/asoc/P230-Q200/hdmi:c1105400.audio-controller
/sys/kernel/debug/asoc/P230-Q200/cpu:c1105400.audio-controller

v2:
- Reworked approach based on [0]

[0] https://www.spinics.net/lists/arm-kernel/msg960881.html

Heiner Kallweit (2):
  ASoC: soc-core: add debugfs_prefix member to snd_soc_component_driver
  ASoC: meson: aiu: fix duplicate debugfs directory error

 include/sound/soc-component.h     | 4 ++++
 sound/soc/meson/aiu-acodec-ctrl.c | 3 +++
 sound/soc/meson/aiu-codec-ctrl.c  | 3 +++
 sound/soc/meson/aiu.c             | 3 +++
 sound/soc/soc-core.c              | 5 +++++
 5 files changed, 18 insertions(+)

-- 
2.35.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
