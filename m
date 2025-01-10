Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CD51E7719C
	for <linux-amlogic@archiver.kernel.org>; Fri, 10 Jan 2025 21:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jXH4ZvXrU+5pL6/WpYOTnPoIcx1HIOAmjEx+4H16J3o=; b=4ew1qAEYX8Lv+u
	tIaYA2QegF5lyN7A3dLQXWRpkrqDyAR+zbqfE1V9kR7H1HJoU9PuN7KeO1dBn2telcPXa8Hlfr4Jq
	iwT9LRXsgV0U4GvVgT/DfOhLOwjjVAAupmVJj3tDsock+suuXNIGjltdp/r9avdtWt6rEuB2WzcA/
	T/Udo7Jd2hdYPSKCeJ3lmoQLSleQArkzxCMKDf4xlIFGqz1aLwBXqOOEFQU5ZW/OvNHbUgQCvGarK
	s0Ct9i38wBs2AoLSW7iN1vJyp2RWocmS0jT/dGq+KUekbcMTFWutuNq9kCewNaXlLUCsyYxqg58Jr
	FYU4aUgrK7lUnz3JULmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWMEL-0000000GyVf-3fcb;
	Fri, 10 Jan 2025 21:07:45 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWMEJ-0000000GyU6-2gWe
	for linux-amlogic@lists.infradead.org;
	Fri, 10 Jan 2025 21:07:44 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-5d3e6f6cf69so3981402a12.1
        for <linux-amlogic@lists.infradead.org>; Fri, 10 Jan 2025 13:07:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1736543262; x=1737148062; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G+2E4XF4R2L7U4jDZMfpOUeLdApfDnqjbzX1VGK6SNk=;
        b=DmyDpG9IjtFqQA8Eugd6oDgBAu866QcUsgbE1cirAdVx0/qKuhBrNfOd1WlED25+pU
         ZnyWRmHgivLHpUedgspIPRXfnb0EtwvuH6mYBz/vPuidF0TELSFKtALLrWjeL63Pmqlg
         aZXQVyKEOtepWEYj7hbAkHxDkmTg4V8FVrpN7LG8uBPvPg4/sIDMVumk1Mdsno8jUDhS
         XM6ZXH91DJduJTEHky4DGJdGUEhcExwrzHrIiOLFBTY5En8OoQWb269jWoE+nPD5tO+B
         KGDbNp5IIJ2kYFRX1Q/Ev8YLMXSO6PIKxN9pppCNcg2nasZhDM/dj63vCcgrZysuQXKf
         VyFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736543262; x=1737148062;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G+2E4XF4R2L7U4jDZMfpOUeLdApfDnqjbzX1VGK6SNk=;
        b=jfmHR/NFt6kz2gKtYYg6RI1Djgm8otdPVlyOlw+HgiRwDxfAjphgB7mll/9fG+Sitw
         fSNdmtBftyRJNn9PV8JdkW1gZc56IjRwdg+7uuFXFx1YrkV/5AiF6syUP4cTX8OJz3G6
         Qr43gyhUTY0hC5OTAUxV36vfTAQ7pHjLj+iMpssmKN/vojvrJJdCRi1fenOs6NYu8vb5
         myUwz0PGyoGbSmVTKNd5WCUVRPcjonIIlQCmYWDyrTlgX9BGBP9x8pMoFMcStwrHP60V
         6kzcSl6qKSMT2SEncEnZoQzCZKVfK2QHKuwe2x5E6VZdYrAVc/39KNPHgTdNcjzTiPJk
         q09w==
X-Forwarded-Encrypted: i=1; AJvYcCVrLM4XjGF9RMVHVxbmVLEmXRdiQ5kvghsijR2RzXtaD3+A+mco31SkP0xbW8L0iM6SMHvj1bxBPjwVRxwL@lists.infradead.org
X-Gm-Message-State: AOJu0YyoBcwhG5+3+GA5P7UL1HNOs8Y8dhGWSYWpCcOT6PoDUrBj+m1U
	ijZvtgm3rpYlJFaUzODT54pTbdlUajnCyElS8mlYF/1NhTZ/v7wxGoYOimUR
X-Gm-Gg: ASbGncvrFj132VtwJrtkpI4cJajvOd2UznVaheMLZrvlJa+XQXg7lCYW2rLT3WjtnAg
	P1DJ9I8fVbeBN5vG1OCHSmwpX0rGYWpH2oxwFrgXuKE4mRIqcKmwPBXkgC0QK+r9tWfJ7TF6Wr/
	CUAOiSMTj1cwho/gLnwHRHxGe8YNul4xdTci0VSKNu/XbMvDZmNxfHu5O/Nb/BiQilJdIFccRGc
	ltRwuWRhjjOr4+EoXZEYSPWtwtyoghIYpkhtFU6yrSOM3KYVA0EEC5PuKoW1fjZZVhauMZK0Huh
	AU9PTnDVZHS1dKLaWsWh3ENZ7n8AFlpSXb52mLHyYrqE0F1J2lQuYlH+Lz23pjOBGQCv9W94ZEA
	Y9b10ysRJ2ZmWlDtJlbCGdIAs
X-Google-Smtp-Source: AGHT+IHyUhpuKiJImObkWg/lNo1hgMitMJ7DYUlKMmVG3Hzv/f6Npg00kC5fb9KJ8mLKeTnMZthLuA==
X-Received: by 2002:a17:907:72d0:b0:aa6:aa8a:9088 with SMTP id a640c23a62f3a-ab2abc789bbmr1170872866b.41.1736543261408;
        Fri, 10 Jan 2025 13:07:41 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a02-3100-a97f-2b00-1e86-0bff-fe2f-57b7.310.pool.telefonica.de. [2a02:3100:a97f:2b00:1e86:bff:fe2f:57b7])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-ab2c905e2ebsm207172966b.10.2025.01.10.13.07.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 13:07:39 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-sound@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Cc: s.nawrocki@samsung.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	linux-kernel@vger.kernel.org,
	jbrunet@baylibre.com,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [RFC v2 0/2] ASoC: prepare streams on codec-to-codec links
Date: Fri, 10 Jan 2025 22:07:28 +0100
Message-ID: <20250110210730.705613-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_130743_676633_EC5AF534 
X-CRM114-Status: GOOD (  14.15  )
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

Changes since v1 at [3]:
- updated patch #2 to also prepare the source side of the link for
  consistency reasons (as suggested by Jerome and Mark)


[0] https://lore.kernel.org/dri-devel/20241224-drm-bridge-hdmi-connector-v10-0-dc89577cd438@linaro.org/
[1] https://lore.kernel.org/linux-amlogic/CAFBinCDdiJ3UNVUcShjq=7U2=oUwT3ciYdKSuZ5TdcrikxFBpg@mail.gmail.com/
[2] https://lore.kernel.org/linux-amlogic/1ja5c4b4rt.fsf@starbuckisacylon.baylibre.com/
[3] https://lore.kernel.org/linux-sound/20250106141316.375984-1-martin.blumenstingl@googlemail.com/


Martin Blumenstingl (2):
  ASoC: soc-dai: add snd_soc_dai_prepare() and use it internally
  ASoC: dapm: add support for preparing streams

 include/sound/soc-dai.h |  3 +++
 sound/soc/soc-dai.c     | 27 +++++++++++++++++++--------
 sound/soc/soc-dapm.c    | 12 ++++++++++++
 3 files changed, 34 insertions(+), 8 deletions(-)

-- 
2.47.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
