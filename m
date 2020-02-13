Return-Path: <SRS0=deyy=4B=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1766DC352A3
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Feb 2020 22:15:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA2962086A
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Feb 2020 22:15:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GG2wXLgt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qxk/vv+/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA2962086A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=38BqcuOANs63sWPYuf0EVTkqvP4MT0u3Cr92ijNmB3I=; b=GG2wXLgtQWfl/0
	f1wwM3xHjETYU557lj+LUms/13UtUjEJ9yWKQ1sWZShBcyh8IIClXTHJlOpQvDw+LT1917ytDrlXd
	s3LCcQvVLZoQ2/8ZmFfB51rquWH2Gq6EYhTZNa26H86eEQpm0kOmy+B+HjKocNy8jx1PlzeJkTXR/
	GOM31qNcEKp+2i3JX6WSUV4DCwMxP1fB0EHuNd13WLvGfqbB247LcGM5079DZrQ+pRWyaAUu7qK3S
	+L6V6LJ/ITNEpRRHrernTilJR63ey33yUotQQGxbQYY22pHVhS+cauY9AvBK8bS0MDfXg1zQMcNCt
	eFU+724OSVXLE+EXQM4Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j2Mlh-0006CD-ID; Thu, 13 Feb 2020 22:15:33 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j2Mlf-00066s-DH
 for linux-amlogic@lists.infradead.org; Thu, 13 Feb 2020 22:15:32 +0000
Received: by mail-wr1-x444.google.com with SMTP id w12so8658296wrt.2
 for <linux-amlogic@lists.infradead.org>; Thu, 13 Feb 2020 14:15:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yQ0C2cfvwwMn2o7yU/lEkQ7YMEf3i0RTZvnkKI64a6k=;
 b=Qxk/vv+/pfXlynmEbStefcryWvLac8Shtjt++iSXucyPkgVu7Xo0xRfupHMoeRLI3n
 HSfnbB2ow7tUDAGvr4li3eMazQZxhMJhM5SllFukQO+E5QA7tSrCxElZO9CTntIqyUMG
 yiTG0HaqW5CSqXzExRbEeA2dm9JKRCEghdxuxgH3lbxhi3gbJ4LSNhohLOl++AtKB1gu
 4FwQKlsKjdYsugjZlz2XrGocnBn5ftbKU7LnjDjvB0YRE8cWBelCEDAiuNOCPnBQ+2GN
 PQQQLUD6m09+AJwSK6NHcokQsDr2RjEsqUCiWTC5vzrCU26babaR81muYNH3C9qbK0bC
 gtlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yQ0C2cfvwwMn2o7yU/lEkQ7YMEf3i0RTZvnkKI64a6k=;
 b=R/U4FgubIGJT3pczvz+fkPTthPjoY8xAUdFgMkZ+AzpWa0SF8hoXNpJWmRv0APCZgp
 keV65QzGgkElrxIl4trd9Y8bpASMJ9bC1i6qIe7JGK8SxaoDKvttaZYcsouxL6GSuEEK
 MNMs5MLRaM7di6ME6ISLBiKNpi7RCM6480llF4sNfh864HWYuMWahbXLAi76112y7JnC
 7oHA1Yef04YyqzA7282GshAQlevApBOwrgj18Qb2J9zveGl9IdU2Kkgq6+8SP2uRqMhm
 JWtSrn4azLQcJTKsv+YV5s5CSSiLV2YMpNIuaHimnH5ETZo738FLWGZVIgokHqRH5d4a
 0Hhg==
X-Gm-Message-State: APjAAAVG2Qc1Cwbecy/l3Xy72QX/VHjsqEKnxCGQao4CCWk8tAlNmYFh
 9H/WS9jogzKiKp0XBb25SwI=
X-Google-Smtp-Source: APXvYqwF2lwLH4spgKrrMqfBSLvwOzqLL4eIGW/caQW5KAtAtH3BYcD7drIWZai+drBKPMOLDGRV8Q==
X-Received: by 2002:adf:f310:: with SMTP id i16mr24807473wro.326.1581632129861; 
 Thu, 13 Feb 2020 14:15:29 -0800 (PST)
Received: from localhost ([37.237.208.38])
 by smtp.gmail.com with ESMTPSA id z6sm4513288wrw.36.2020.02.13.14.15.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2020 14:15:29 -0800 (PST)
From: Mohammad Rasim <mohammad.rasim96@gmail.com>
To: linux-media@vger.kernel.org, Sean Young <sean@mess.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 linux-amlogic@lists.infradead.org
Subject: [PATCH v4 2/2] arm64: dts: amlogic: add rc-videostrong-kii-pro keymap
Date: Fri, 14 Feb 2020 01:15:13 +0300
Message-Id: <20200213221513.28540-3-mohammad.rasim96@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200213221513.28540-1-mohammad.rasim96@gmail.com>
References: <20200213221513.28540-1-mohammad.rasim96@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200213_141531_448258_802201C0 
X-CRM114-Status: UNSURE (   7.89  )
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
Cc: Mohammad Rasim <mohammad.rasim96@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

videostrong kii pro comes with a nec rc, add the keymap to the dts

Signed-off-by: Mohammad Rasim <mohammad.rasim96@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts
index 2f1f829450a2..6c9cc45fb417 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts
@@ -76,3 +76,7 @@ eth_phy0: ethernet-phy@0 {
 		};
 	};
 };
+
+&ir {
+	linux,rc-map-name = "rc-videostrong-kii-pro";
+};
--
2.25.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
