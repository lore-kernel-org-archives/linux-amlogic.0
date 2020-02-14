Return-Path: <SRS0=pzWI=4C=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51B11C2BA83
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Feb 2020 08:58:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27E8F20873
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Feb 2020 08:58:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NM7BOOwp";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QNSNL+rL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 27E8F20873
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=38BqcuOANs63sWPYuf0EVTkqvP4MT0u3Cr92ijNmB3I=; b=NM7BOOwpi9AIR/
	msoCUg7XobiHhJfinyRIygb+sXvi9fkIaINr8mNf+enW/FI/L6OHvjVjLk7kK0aSZUcLpR4lwZnEw
	Hs0DtvWKlwruYMEPGRrZi2dvX1jywQJXI1wvg/aA4iwIKbtzVJVlhd53C+r9YlZD/2uqhrJ7Dobul
	Em5OEXcH0ETfeqK7RHVqaGo1ljzBAH3SBHwpVKosWAEUO/7ZKZkAkgndlBTt57mV6hCNqPbJhERTJ
	93HewabvGCNZYJGnwk3LZX1pgqx7ftNi81vI9MVbdE4OH01doCaMI8+juRhH2k4kqyHxcGN8oR0hE
	gZfUA7Aky0ny8qekUVNw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j2Wni-0004NZ-NH; Fri, 14 Feb 2020 08:58:18 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j2Wng-0004Ks-I2
 for linux-amlogic@lists.infradead.org; Fri, 14 Feb 2020 08:58:17 +0000
Received: by mail-wr1-x443.google.com with SMTP id n10so8027308wrm.1
 for <linux-amlogic@lists.infradead.org>; Fri, 14 Feb 2020 00:58:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yQ0C2cfvwwMn2o7yU/lEkQ7YMEf3i0RTZvnkKI64a6k=;
 b=QNSNL+rLNykFchgRV/DrFjK9t/JCB785ApX8p4Y/EGA9ZdzyAG43eEMjRRUbl8CjS0
 6ko18LXph/gvjvCTB7rK68zOVC90F0ImDfg0IPYczHY9uK8ziaMk5HbQUpLRCqZXaUDi
 +LFi3gX5GFlmNT2izBO8sv38IKIP7SC1miwxTx/cTsnxi6mZ+Ie587QvaNiVqNHz6TyF
 8WW62dCS1Y06F6duOLIH8kriXsgF7ISpEvkHSBDtGQQfTGggDbq5f8/iFhg9W91Rq1iI
 a2C/W4rLyzGPCCB/K7LWyiXfyKkdXVqEztozeU3Qai/wTub03/szHq5rwykoVrfuJrq4
 7Cbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yQ0C2cfvwwMn2o7yU/lEkQ7YMEf3i0RTZvnkKI64a6k=;
 b=OQ9xjU/Av2QzPip6X7F3HG63rF1lW0Zg28rlQuF5lbCeYSeBJv6aRqU3c+Q+VUWIXf
 x8lJYp3czeZzhfTmRTVD/vLuZ/wGVy+e/77jST+bE/ZBeu7WwUkmWxkJzlpTJUzZ7Clr
 SFVfkZHBhK+IleqIuuElFoBmi0O+Rsh4buJjJ9Xdyk8aopR9BdttRC1mq795is4RkEqU
 tBPAWwzFGXxIy0CbnqbKBHrBowhNJ9ZsU442xug7nNpHfB6jj0KjbaM0eOWHzteXOLxR
 6wcl3737Kb8iJ4ZckCMeWuiJd/mp7Dblp6gQx/9hyhNWoKDMoGGOB2ugn7//i5TyLqq3
 peWA==
X-Gm-Message-State: APjAAAXxJg+jeG/7rmQl1t2exoxGPdpRbiuUkLlXe0AdcdF5afP7UQU+
 3ai7TaSZRN53tYocTkBdgEA=
X-Google-Smtp-Source: APXvYqwcae7yq515E6DyyuqdQxOHKOJomhuVpxmU5znQpy5j/SDuy3fPMOh9j/xQoLAGJpdL5fteOg==
X-Received: by 2002:adf:ed0c:: with SMTP id a12mr2854532wro.368.1581670695393; 
 Fri, 14 Feb 2020 00:58:15 -0800 (PST)
Received: from localhost ([37.237.208.38])
 by smtp.gmail.com with ESMTPSA id x6sm6211708wrr.6.2020.02.14.00.58.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2020 00:58:14 -0800 (PST)
From: Mohammad Rasim <mohammad.rasim96@gmail.com>
To: linux-media@vger.kernel.org, Sean Young <sean@mess.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org
Subject: [PATCH v5 3/3] arm64: dts: amlogic: add rc-videostrong-kii-pro keymap
Date: Fri, 14 Feb 2020 11:58:02 +0300
Message-Id: <20200214085802.28742-4-mohammad.rasim96@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200214085802.28742-1-mohammad.rasim96@gmail.com>
References: <20200214085802.28742-1-mohammad.rasim96@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200214_005816_595403_D167F28A 
X-CRM114-Status: UNSURE (   8.33  )
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
