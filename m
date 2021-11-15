Return-Path: <SRS0=1Oxc=QC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 861BBC433EF
	for <linux-amlogic@archiver.kernel.org>; Mon, 15 Nov 2021 10:02:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 53B6261BF9
	for <linux-amlogic@archiver.kernel.org>; Mon, 15 Nov 2021 10:02:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 53B6261BF9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TtTXX6y3dMaLNMs9oftjDQECcnsIrDFPI1XC9aTb/S4=; b=1PJwkvI2QWuumU
	YQjqrrGObvofj2ienPKQh2iG4AbebxqgpZ/Nci+u1Hrbv3ndQq9TBoz9dRAub+qfZMcc79YwgyzQo
	k78hu8h7+3R4+RwuNFQ7vPBaO+v3xT3b+GAGB+qqyXozBiYMIIYWyP5G5ZwYdqBCpPhvslnzlC1Op
	dxC07sEdwQReKBpLprW71vS4xluuGJ9nj8kR3uMiYh0gUlorJnG0fxpCAajxmhYl1CdiS3dH769ux
	5smoTarg4rlsgB75BUoS6ViKpjs09DFnrr5NqnUeKy2rNmzU0S5l8nX9/hML+pjzZM1/k+3AL8kFZ
	EqPS9sdZHzVC5CLD5WrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmYof-00F43W-Hy; Mon, 15 Nov 2021 10:02:21 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmYIY-00Evh6-SV
 for linux-amlogic@lists.infradead.org; Mon, 15 Nov 2021 09:29:19 +0000
Received: by mail-wr1-x42f.google.com with SMTP id c4so29225513wrd.9
 for <linux-amlogic@lists.infradead.org>; Mon, 15 Nov 2021 01:29:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X/lC6w2Sm6M3V/VU6cEa1IPIQkx7PbctHYi9JVN8V/Q=;
 b=6gn5y7agH0Ie2+BoSZwvGJZJaqWb9lpHm16ZHqkWu0PDWzGzeSrE0JW71eDPb9VPPJ
 UYFPilnQWQnOmcby0gj4g4F2zzQv0p40pLyWkfuy4vDMdEWYreGyg4aFLA2XYbXkpICC
 d/nZYAKWnAV9cZ+CDL06KgQpfPuUVpyvS7qz05Bw2DWEzdNSWKYVR3jAbU8S2VXBukPT
 ZcWP12P8WsutgVamF/8efqt5LTKWdOB230s4//ZHA55ApWAEaNXEIG7nKAnQkG5OVllQ
 GLo++D8P7MyArtVn/6joGK/5yiaTICEedxr09p2TW26+C4CDAganhVR8DNRoAn+cVtvV
 2bpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X/lC6w2Sm6M3V/VU6cEa1IPIQkx7PbctHYi9JVN8V/Q=;
 b=uNNvj5xEwbNG6jnqKQy5x4TreycQLTzqQZLv434kz+l1ZeSbwUXe7QBO2c17AwR2TQ
 T4JEzqs66HN7X69DKzsFPQdEhNNc0YzrW76SNDDw//CfVCiuiULsS7WhpALa8Xx9kv/M
 6DamBK/KpJa3tMRtI5czkzLviq5AkPacZUzORIrDCTxZ+V1pn+vozEa6wuPjCaeMutVO
 nF03xx7z3Jw4pyb9AymVQcG8lH3/4PNkwTgVBDgIjd3P+WmQSqZS9uWOBq71piaAQFtl
 hOQtaoj4haikezHL4sEXctgAZWtrPbUtxXTaC/zreWhIfB4lIKxN+wG4qTeseJo4Cub/
 EPdg==
X-Gm-Message-State: AOAM5322BwTDvy2m9FLa0KN6d7sPjclax5UC9Z00bkCsyaHwHWv1/Yyb
 qLuYrA5RvFxG+yVTOuCAa3LilCVbuw4AnCVp
X-Google-Smtp-Source: ABdhPJyQ2Ekj5vfhzTEk7IggWtzywSx7V3NQsnNIAPgWAj0YdZH2xVxmM9nim6HNiT9IbxNBhy4NVw==
X-Received: by 2002:adf:df89:: with SMTP id z9mr44818162wrl.336.1636968549558; 
 Mon, 15 Nov 2021 01:29:09 -0800 (PST)
Received: from localhost.localdomain ([2001:861:44c0:66c0:f56f:2409:301:93ad])
 by smtp.gmail.com with ESMTPSA id
 u2sm15871407wrs.17.2021.11.15.01.29.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Nov 2021 01:29:09 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>,
 Alexander Stein <alexander.stein@mailbox.org>,
 Kevin Hilman <khilman@baylibre.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>, devicetree@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/3] arm64: dts: amlogic: meson-g12: Fix thermal-zones
 indent
Date: Mon, 15 Nov 2021 10:29:03 +0100
Message-Id: <163696851316.448838.7095083388560027600.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211026182813.900775-1-alexander.stein@mailbox.org>
References: <20211026182813.900775-1-alexander.stein@mailbox.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211115_012910_971960_A9C89AEE 
X-CRM114-Status: GOOD (  10.17  )
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

Hi,

On Tue, 26 Oct 2021 20:28:11 +0200, Alexander Stein wrote:
> This node is currently at /soc/thermal-zones, but the later introduced
> bindings in commit 1202a442a31f ("dt-bindings: thermal: Add yaml bindings
> for thermal zones") put this at /thermal-zones.
> Fix dtb_check warning by moving the thermal-zones node to /
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v5.17/dt64)

[1/3] arm64: dts: amlogic: meson-g12: Fix thermal-zones indent
      https://git.kernel.org/amlogic/c/cdc5091694595606f0e38d651135d5d67fd397d0
[2/3] arm64: dts: amlogic: meson-g12: Fix GPU operating point table node name
      https://git.kernel.org/amlogic/c/bb98a6fd0b0e227cefb2ba91cea2b55455f203b7
[3/3] arm64: dts: amlogic: Fix SPI NOR flash node name for ODROID N2/N2+
      https://git.kernel.org/amlogic/c/95d35256b564aca33fb661eac77dc94bfcffc8df

-- 
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
