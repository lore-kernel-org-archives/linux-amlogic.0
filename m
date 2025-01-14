Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11E77E77188
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 Jan 2025 21:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qm7y/cxRU1vrsWLK0WOyA3DWYo/nt3xdThP/CBIXBB4=; b=wtzIb4TO7rFEp/
	Bz//9TSBAGqCXxK0Whd8cc7qIDyohlvC9Vqh2pMfA7JMGo7WvOWx7FlhMdEStDNRzQMUbO11GCeTy
	PpX8sY9r1gl2HT5UGOLNwwJHmap7qqYMfXXg4gMDu6pQ2HwUc78MpgERhArVuEgW3QRrb7n8jwjVP
	PnJ4VBRMXUfX90otHW2fHEf3F3XkfkVjipi8aOSNC28mDzgGqaZ8moCccxRAshN2dXeh5ruX8uM+c
	4ASdZQpBTY2OIzpPycnwpVYAnj/n+MYhN9FaBPqqNsR2lnY51LEcs/dd61HD4x3rwl8slncee7CA6
	rF5GA33KPqAo4pii8ETA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXotj-00000009rYq-0juB;
	Tue, 14 Jan 2025 21:56:31 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXotf-00000009rXT-2WBu
	for linux-amlogic@lists.infradead.org;
	Tue, 14 Jan 2025 21:56:29 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3862d161947so3041902f8f.3
        for <linux-amlogic@lists.infradead.org>; Tue, 14 Jan 2025 13:56:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1736891785; x=1737496585; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p2eZg1PKQqZ9YYAUBcMUhhlmqXakQ7nr/UKhPf4mHew=;
        b=gGwz/ps2MY9uEv0Ysf8iY2gK6xF9ibpDVBSJGlqvAwl9IYvFxNkAwXJsZrv/N2CDFM
         j9LeGFoZDoZSxB1eyia1FmUdewVI40ee6bxjen0r87EpCmmD4Yqgx9aqjvq8tA0pHiQ2
         SPiB/XBSvIUDLkmAWtrjqiWlbH61uAcR1nwg4iEnVbIO5FuSaHZOld5JTDpkcWWsQH3o
         W/Ux+Vv/nCN/mzS6JAiIlsHCdN2kab6UsgqB5IKPojxBURqqcsLflYETRtlEYvzEASAQ
         s8FLnqVk3jjo2vl2ms2EcyDbuN2H2NNJ5CWT/pojhA9H41+nh1EHJJCnFxLMblgBFxoU
         tKUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736891785; x=1737496585;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p2eZg1PKQqZ9YYAUBcMUhhlmqXakQ7nr/UKhPf4mHew=;
        b=rYFt/MK3EVFh/IKMOkbLICnZq7SuKQ0rUoisaQF6BLm3yCGPTaNnEJx7yMzc1p1syJ
         eRwoqhfLKt8tSkBA1hd3eCccUujdpFv91IS6i7NM9hNwal2IDHC/6HBzQHiQojxviqk8
         8bJtiBK1QEEveCLSFFbAaDxTwW74ADqvrBeIAaUxVAt+JgVQ2Qd6q/RJo7ppsymtiENC
         pxfDIsN+tgoUbsWeP+u/kVYG9zvN7p6aeZ56fNKFv/3GDJ1HnW6F4tCrUFS5ml7qTmvH
         TiJCLSQ0XecvwvT6Z+0vYFJ0idM1z1Iy615mdEyyYGMp5k6Veh13j4DTKwdLoVJ52apV
         sjYA==
X-Forwarded-Encrypted: i=1; AJvYcCXij/IB9anXUDQ27CAVIRReegtOTtgdunXcF0IXXSxcAhKbR3I/bfxcMaRD7DZysggR3E/E+iDqKzC8VQHd@lists.infradead.org
X-Gm-Message-State: AOJu0Yyxe3YCr96t7ah1PIOVGz2JGCwEWTN1Gj5UTohzEmhNakr77S4x
	n88Zrhsv0zrpRjjGmQnL1cqwuo1mONzxawuIWDtlI6RiE0skiMNM
X-Gm-Gg: ASbGncsV3Yw+b1/BCzE6YSYDrurl+mz+3kvjsHCRw/FePs4L3iEB2jE48OXdEeYN9cb
	Emzi2yBn4J3apAJdaXmSDMzPkVZM3oI20fLzZOLiqRBK+GBSRUJ/ZZD2I0hX9pHHAoVsrOEJEom
	vg+WxK/z9eMrQOHDZuweZ5H1jAC5trw/t6BEztn210F1OvcvPjDgmIcUUPqLhah4JWgZsKTqUtM
	BeA/5pnaHL2Pf662gzNRmg6DyTIzN0WcmuyP3O68q6+2+MmuhZtW0QWUXFkHt2jZL/jDG3ckEPD
	EanbnVIJpq5YN3gN+D/Ov5/3zJBtwPYe1t3HwIPWW/xuP7PML46K24JOSzo4YifncMaUm5SoRUF
	rFM7Wh6bR8iW3xu7S0Vdxr7sy
X-Google-Smtp-Source: AGHT+IH3l/c6QJbI2r9eoREI4drK7rOHvPwd5jsNZKRYlZkJfY19djGYlMRF8kwqOLR/O9llaVmJYg==
X-Received: by 2002:a5d:6da6:0:b0:385:f573:1f78 with SMTP id ffacd0b85a97d-38a8730abc6mr21681017f8f.24.1736891785176;
        Tue, 14 Jan 2025 13:56:25 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a02-3100-aca8-de00-1e86-0bff-fe2f-57b7.310.pool.telefonica.de. [2a02:3100:aca8:de00:1e86:bff:fe2f:57b7])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38bddbf50a2sm5483918f8f.43.2025.01.14.13.56.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 13:56:24 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-sound@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Cc: s.nawrocki@samsung.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	linux-kernel@vger.kernel.org,
	jbrunet@baylibre.com,
	ckeepax@opensource.cirrus.com,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v3 0/2] ASoC: prepare streams on codec-to-codec links
Date: Tue, 14 Jan 2025 22:56:15 +0100
Message-ID: <20250114215617.336105-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.48.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_135627_640139_D2035113 
X-CRM114-Status: GOOD (  14.32  )
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

Hello,

the DRM subsystem has recently gained a HDMI audio codec framework [0].
This is already queued for Linux 6.14.

I want to implement a HDMI controller driver for the Amlogic
Meson8/8b/8m2 SoCs using the DRM HDMI audio codec framework. Internally
the DRM HDMI audio codec framework relies on hdmi-codec's .prepare
callback to be called. This unfortunately is not happening on Amlogic
Meson8/8b/8m2 platforms [1].

Jerome suggested that this may be because of the codec-to-codec link on
our Amlogic AIU audio driver [2]. He encouraged me to send this series
to allow hdmi-codec's .prepare() callback to be called - even on
platforms that connect it via a codec-to-codec link.

The reason why this series is marked as RFC is that I'm not familiar
with the ASoC subsystem and lot of the functionality and terminology
is new to me.

Also I Cc'ed Sylwester Nawrocki (Samsung maintainer) as codec-to-codec
links seem to be most heavily used on Samsung and Amlogic platforms.

Changes since v2 at [4]:
- add Reviewed-by from Charles and Jerome (thank you!)
- dropped RFC status

Changes since v1 at [3]:
- updated patch #2 to also prepare the source side of the link for
  consistency reasons (as suggested by Jerome and Mark)


[0] https://lore.kernel.org/dri-devel/20241224-drm-bridge-hdmi-connector-v10-0-dc89577cd438@linaro.org/
[1] https://lore.kernel.org/linux-amlogic/CAFBinCDdiJ3UNVUcShjq=7U2=oUwT3ciYdKSuZ5TdcrikxFBpg@mail.gmail.com/
[2] https://lore.kernel.org/linux-amlogic/1ja5c4b4rt.fsf@starbuckisacylon.baylibre.com/
[3] https://lore.kernel.org/linux-sound/20250106141316.375984-1-martin.blumenstingl@googlemail.com/
[4] https://lore.kernel.org/linux-sound/20250110210730.705613-1-martin.blumenstingl@googlemail.com/


Martin Blumenstingl (2):
  ASoC: soc-dai: add snd_soc_dai_prepare() and use it internally
  ASoC: dapm: add support for preparing streams

 include/sound/soc-dai.h |  3 +++
 sound/soc/soc-dai.c     | 27 +++++++++++++++++++--------
 sound/soc/soc-dapm.c    | 12 ++++++++++++
 3 files changed, 34 insertions(+), 8 deletions(-)

-- 
2.48.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
