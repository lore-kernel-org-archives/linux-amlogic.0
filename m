Return-Path: <SRS0=GnnG=FE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 216F0C5519F
	for <linux-amlogic@archiver.kernel.org>; Mon, 30 Nov 2020 05:42:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A23F02074A
	for <linux-amlogic@archiver.kernel.org>; Mon, 30 Nov 2020 05:42:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qx5Pxqgt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kDOkCuF1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A23F02074A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tdnvtcJGu1Qy5Rnee84SP5CJ3ENvUuym0cH0u4Md40U=; b=qx5PxqgtSYeyNLmt6YP+QrgFPu
	v19tyVqF5vwEjAch7pPJSdYmo9rYEqQQ3SIjbFyFCH/LZMJ4F8q1fg8wKtTJqCmfkRvcOeQNEjBmA
	CzZDyDMe6oBLATgX2GA3whv11GQoiSAA34iqBYrrg3n0P/CWZbGE7UgWIZijVhM2GCrMhCdqm3mK6
	8Bj0seT86lQTPGwi6JVsW/AVmPtYUqHokBRzeFaWPUsVZD3Siztin3lZDijIUApIOVTaeBkmx9gnG
	FCnSOQLmuFDALgHZivXTGt6z5UZteChRZUQCbIaoHaLKGG2XwqtedGGAYCLD25d3ZuHImN8YcybEE
	BXXUSR4w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjbxJ-0007BC-V3; Mon, 30 Nov 2020 05:42:33 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjbxH-0007AR-18; Mon, 30 Nov 2020 05:42:31 +0000
Received: by mail-pf1-x443.google.com with SMTP id 131so9687397pfb.9;
 Sun, 29 Nov 2020 21:42:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:mime-version:content-disposition
 :user-agent; bh=Jj7pPkufdJFYA7JXeWZB2rlCobWl5PS1FAuCokbGgj8=;
 b=kDOkCuF1itdYBotj9jMsH/TWY3/i4n5JOv02oy0KFZjgMtZZfQR/z78JA9V8OZfCNh
 xd8Rt6oNmjjCr6RlRX1u6jcGaFRXS+1fZBRSaR8QVMNQZzmeljPeD7v5IzXZoJh6TZfm
 yjYsxi1lVedDKtw+pfTI2AgDH9/mSk4ypHYvgB8wdz4XNEbAMBLZpsWYNPG97taAS67U
 zMH/vCu9mFAcmUGn0qgR/L5aHM/YwmazW5VEnts9dXy8Qs0uVk98VE1zQhfdBI7n37NP
 ZWvOrx+ShTRELF3LWlsBdOPwPCJ06d2ccWpMCyvHOaAD+NFtlsaSxfjvrJQRKaEOGYUS
 5BXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=Jj7pPkufdJFYA7JXeWZB2rlCobWl5PS1FAuCokbGgj8=;
 b=kQVpBOAwtqZRNmrvju81GueLkSkgNwXbYJ2BY6x/Plt2Dco8C5zk38yE9e/WeK0unV
 rmBOwf9vftLujSF1F7sOEBVt8c8vayuJrfvXSacAggUFs7DkJ5sYEqHNRUBF3qWYKzvX
 KXnSDljPEBfNM8SgTqYfp7Fl1nprKpy7tmqIYSktzIcwX+RG1vCyCzhyk9Sf54qc99QN
 0azyJThnYTuTDruWB9deqwDxDsnzCQyUOPeeP0GRxpeptkQkKJR7AB73lMCuH0H4gJGK
 LXlfZ8a82gsfM4auSWYsaRawtIDRLparUTNiQLcakzEG7ZpzymcFGsbNGtqTZFRfGac8
 zpvA==
X-Gm-Message-State: AOAM531nZTjCVlYw+p71I1wPRMda9dGRlstJozHJB6k6fks982R5UcNt
 +2/JBlIH/42bQSBi1Zhnf3oxrQTXxwU=
X-Google-Smtp-Source: ABdhPJyVHngl3g10ZWwcaID/ZsNGS//WYaRR+cw9tRgeUHVYmz8jdEYdgJ+cvGUlxYByyKdtPVBHEw==
X-Received: by 2002:a63:5126:: with SMTP id f38mr16295073pgb.11.1606714947381; 
 Sun, 29 Nov 2020 21:42:27 -0800 (PST)
Received: from anyang-linuxfactory-or-kr ([106.250.177.234])
 by smtp.gmail.com with ESMTPSA id nm6sm5966597pjb.25.2020.11.29.21.42.24
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 29 Nov 2020 21:42:25 -0800 (PST)
Date: Mon, 30 Nov 2020 14:42:21 +0900
From: Dongjin Kim <tobetter@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: meson-sm1: fix typo in opp table
Message-ID: <20201130054221.GA25448@anyang-linuxfactory-or-kr>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201130_004231_129471_388ECA7E 
X-CRM114-Status: GOOD (  14.24  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The freqency 1500000000 should be 1512000000 in 'opp-1500000000'

Signed-off-by: Dongjin Kim <tobetter@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-sm1.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
index 71317f5aada1..aba1214c4d09 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
@@ -131,7 +131,7 @@
 		};
 
 		opp-1512000000 {
-			opp-hz = /bits/ 64 <1500000000>;
+			opp-hz = /bits/ 64 <1512000000>;
 			opp-microvolt = <800000>;
 		};
 
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
