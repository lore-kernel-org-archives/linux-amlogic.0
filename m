Return-Path: <SRS0=OcNe=WV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2BD8C3A5A1
	for <linux-amlogic@archiver.kernel.org>; Sun, 25 Aug 2019 04:04:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A4FB621744
	for <linux-amlogic@archiver.kernel.org>; Sun, 25 Aug 2019 04:04:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dQbiUZYZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="adjbLfK8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A4FB621744
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=DXOj1SC4o5HJB7lr3swxdOK1ffGh9GmOlt26XcNtGmw=; b=dQbiUZYZz4O0Bl3oXUGYoKDeZO
	N/hXs67GmuVJDn4N4ma/BtJdjxvRkIrlSiZpt528+3OYPd0XhdApz882Ufvt9bVSqRVgK7XHuEUuB
	rx7SQMX20lKjC4d5afqSTghbIRygnSU+ombgr8j69V2/hOdBarKwDBAo4E/5ntcAmi4QRdq2O4wIi
	y7l0VKhUiStZ74XgZQSzw2QApjWOlmYcKEz0pTojc95EVkkk3ttxxSHGxPMRvEQZK8qmoSGrA9374
	seqwYyJXIVqYVclKb+q+jLoC+PLz+ryfkeI+/Yux9eFpz40RKg9BSVzbLV/4ozQ1096Q0+lJaCu3R
	tqEQeqQg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i1jkw-0006jR-Tw; Sun, 25 Aug 2019 04:03:55 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i1jjX-0005gd-VM; Sun, 25 Aug 2019 04:02:29 +0000
Received: by mail-wm1-x341.google.com with SMTP id p74so12335332wme.4;
 Sat, 24 Aug 2019 21:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=zELEUgSsCN+8CRAOeDo9/h1leFLyd06lkasS5K9oq38=;
 b=adjbLfK8fidX/mMusGXjbEyvbhpLmfP04BYSiiwz0j3ALh42WU/gfYLDnik2D9ViPZ
 Z1601BUxrJD3wVL+8UTRUOcLekPV9VOFO8HA7Lqtixzkxki56TLAgkkcP+EcNytqvfXx
 jWYFLpe1evjM6sYocwV40uE5J6KZZ34WJ8Lz/IZZUUlIkmkb3gmIjNe7B50r9smKqqHs
 DA2TGBkKZIREM6sAZ6Bfb97Jvl8u3Y3PB6o45kjHWEZUoVVrLZ3M8PP+zYXDypq9RpL9
 HfT4NdfnSZMfV/6JGpSKzRFeFmLUXv2U9XjVkQcEUNAEM1wdjhJR4OrKBkIfWDs49D+E
 FZoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=zELEUgSsCN+8CRAOeDo9/h1leFLyd06lkasS5K9oq38=;
 b=pnYf4aJygu471TikTcdLsbTL9UCVJdgg+BPQAQ7Vbc0tRtA/u6Kv0/LmouwGy6ng/m
 hcZhUVvDpe80P+naqzaxGrXEmXUYWqeE0p/15gxKeVoEQNgR8ekb8ClzpWzFZgi74Y7i
 LPX9C23Cz2FM25+kVT8rr69VEvGSqwH/Aeg5hn44HIQxgV1hJf329SdDcoVkNJRiehfL
 gDolxyeSKbsqMcSXzZf+o/dEhb5NkKtAXxfY7+iKg/hDuSO7jX5zZirLJkuk/uwAT9em
 p211VTKmrzT1smkAEoRdwKuWuTUxjzqTNScdXanPYtFSm14gj/8C1R81fSM+2iLPLTCB
 Ae1Q==
X-Gm-Message-State: APjAAAUepiiM6aNzutx71FuGrS+OeNT53lUGqLstKWYuFImYYBZhDEho
 OGM5dZONfSS7gF2OAWW0aaA=
X-Google-Smtp-Source: APXvYqx4cizF/w/NxjuQDhehIndoZo3vHd5SzkH1pDdj55nTy14mvcbc2b5y15qoEMJmPp4mbQ91iQ==
X-Received: by 2002:a1c:9a46:: with SMTP id c67mr13836550wme.152.1566705746188; 
 Sat, 24 Aug 2019 21:02:26 -0700 (PDT)
Received: from localhost.localdomain ([94.204.252.234])
 by smtp.gmail.com with ESMTPSA id a6sm6820985wmj.15.2019.08.24.21.02.24
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sat, 24 Aug 2019 21:02:25 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 3/7] arm64: dts: meson-gxbb-wetek-hub: add rc-wetek-hub keymap
Date: Sun, 25 Aug 2019 08:01:24 +0400
Message-Id: <1566705688-18442-4-git-send-email-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1566705688-18442-1-git-send-email-christianshewitt@gmail.com>
References: <1566705688-18442-1-git-send-email-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190824_210228_015392_03C4299C 
X-CRM114-Status: UNSURE (   9.97  )
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
Cc: Chrisitian Hewitt <christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

add the rc-wetek-hub keymap to the ir node

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-hub.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-hub.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-hub.dts
index 2bfe699..83b985b 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-hub.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-hub.dts
@@ -12,3 +12,7 @@
 	compatible = "wetek,hub", "amlogic,meson-gxbb";
 	model = "WeTek Hub";
 };
+
+&ir {
+	linux,rc-map-name = "rc-wetek-hub";
+};
-- 
2.7.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
