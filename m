Return-Path: <SRS0=5fWL=4J=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28451C35658
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Feb 2020 15:36:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F1F81208E4
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Feb 2020 15:36:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HUr4oh/W";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="YJwIqRv9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F1F81208E4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=40C6HyvD/lLZJwcyKTFEnIssyDXGODZ3vKTuUJw0r+o=; b=HUr4oh/W8gKkD7
	//469beQsby/yQWaWkiEzAxmaD57CWMJZfCEa/K+Q48AfuQu92W+JaM76soW3XNx4wNsir9TLj+yf
	H0PVSWY/QFp6SbcX9T4e0cffaSrf+o0qPAsZdbAzwHhKk83EmF8fMcNH7RavR3qhdNcagkXydDXXf
	Ai7ikMyMhOArlTS/Ssq2Qq7hm3GSft68r8q1/oq67k9yQV5FJGFxQMRDzc3wLzSft5WXrNnocEtt+
	6xv1OomqCst23cNo/i6m4cdb2x8u7yc/wR7B+jyiM+sIZQ/dH6kySP4NL+7Hc+uLq2/pXMxA2UN3v
	0uk3E6I1LwLoVHHGUV8Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j5ALo-0006GC-Ep; Fri, 21 Feb 2020 15:36:24 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j5ALk-00069v-Cm
 for linux-amlogic@lists.infradead.org; Fri, 21 Feb 2020 15:36:21 +0000
Received: by mail-wm1-x343.google.com with SMTP id c84so2369654wme.4
 for <linux-amlogic@lists.infradead.org>; Fri, 21 Feb 2020 07:36:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eFN2VKHrE+JD0cGAI+3A9MIQDzvF5Lgt98hOYp/CejM=;
 b=YJwIqRv9ZAZT+JufvECzrUvECj3c7vl3DwyjpavnRiTUC+BT5MwCGuUuHrmuPh5Qdx
 2k2nK57li5jZtok/isZ8Y1ljxslqxASi+smgJ7u9748rS31vEE6rk1FFWUbLXsNaFofV
 WC9+91sUznQKJ4ukv+rpRKMuxbM8RZgHoBZyWBPbD0POsX8WiOb+0mYGMRZ4w9iu5anB
 PV2NTKPrVoTm9H6mFTrDDZISPtGpVmOjN6OQMXYBeRUeZh21ze7FU98JEInnGCL2lpOo
 CK7zxw0pRThM7dM1fWfJlbzxNQP95XAMC63rKo7kS7d/iCJPCdB1RkSa+kMv8AtG/3Si
 M6ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eFN2VKHrE+JD0cGAI+3A9MIQDzvF5Lgt98hOYp/CejM=;
 b=snv0gzaPSUFCzAc7D/iVka7vB9c0xhRY+OCynQA3Hs7GdTdF5M4EFxVE+GgGwQoNIY
 gVVJYjh7UcuMQjAk4YSYZW7vUe2ovzPR/NMhqAWWvhcpzUPXYTubKBLkC0sUJu3kyFPn
 lwZomCA28OxyPOooVk4JtjYIw3kaRpWNW7yCbxCrMND4o6NW/kplSBFdxMBSKunalmzA
 34fSzIhGGWEk14GcRJhWE3zIoxAZRj/lDrPp7mfLxLuhw/LcymSYfa58+twfJjximTQU
 O5YfolWvzAJeQf6+BEtFNRe+N16nHTLptbLruVgumLVSDZA7p0lQDmSVBL4bNJp1m3ru
 BDJg==
X-Gm-Message-State: APjAAAUpqRGE8/FsYrHyJNu6H6XPw0yMyx/wN2JWHBRnlZbjmQDuXxs1
 O9zqDV28WmuwrzlHEv9iCKrnstABM/s=
X-Google-Smtp-Source: APXvYqyKrZMlHSg/htp/5+30XIfFhh5aJwM5uacnmK48s3KUO/TfzxUThJS8Jhao+rZrzsLIALqGhQ==
X-Received: by 2002:a7b:c14d:: with SMTP id z13mr4597867wmi.71.1582299379163; 
 Fri, 21 Feb 2020 07:36:19 -0800 (PST)
Received: from localhost.localdomain (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.googlemail.com with ESMTPSA id z25sm4198782wmf.14.2020.02.21.07.36.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2020 07:36:18 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v2 3/3] ASoC: meson: axg-card: add toacodec support
Date: Fri, 21 Feb 2020 16:36:07 +0100
Message-Id: <20200221153607.1585499-4-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200221153607.1585499-1-jbrunet@baylibre.com>
References: <20200221153607.1585499-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200221_073620_444757_954E49D1 
X-CRM114-Status: GOOD (  10.50  )
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Make sure the axg audio card driver recognise the dai_link as a
codec-to-codec link if the cpu dai is the internal dac glue.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/axg-card.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/meson/axg-card.c b/sound/soc/meson/axg-card.c
index 372dc696cc8e..48651631bdcf 100644
--- a/sound/soc/meson/axg-card.c
+++ b/sound/soc/meson/axg-card.c
@@ -303,7 +303,8 @@ static int axg_card_cpu_is_tdm_iface(struct device_node *np)
 
 static int axg_card_cpu_is_codec(struct device_node *np)
 {
-	return of_device_is_compatible(np, DT_PREFIX "g12a-tohdmitx");
+	return of_device_is_compatible(np, DT_PREFIX "g12a-tohdmitx") ||
+		of_device_is_compatible(np, DT_PREFIX "g12a-toacodec");
 }
 
 static int axg_card_add_link(struct snd_soc_card *card, struct device_node *np,
-- 
2.24.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
