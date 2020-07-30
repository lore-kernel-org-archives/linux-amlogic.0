Return-Path: <SRS0=1HBj=BJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E3B3C433E0
	for <linux-amlogic@archiver.kernel.org>; Thu, 30 Jul 2020 10:03:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CDD6B206F5
	for <linux-amlogic@archiver.kernel.org>; Thu, 30 Jul 2020 10:02:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ci7WQXdC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OvCoa/0/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CDD6B206F5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rLDVx5J79TIw8qybwHaQ5bFu7VfV3oQDXxRl6zGx1+g=; b=Ci7WQXdC3fA+JbZpmqkgutzbN
	NuK15X86ymWSEVxqrG0/lBqPpHRiSIHDDCNAOwzJeWOdGF8gejynOylV8IPQr+aJGFmVMWBUuvyN9
	OUevvyaW9EeTP1YAo2hfZrMPj616KFk8YSVuJ5UUCDiVDm5DbwzDgKnStsa2S5L/1J7PlDH7ijTnN
	mb6mGmMrb/5uppMrntLCjb4V5ygoQvNFJ9aCjldvGMdQZIeHHFtutug98mP6VjIdGs9soG1zrk+M6
	Yo63VyNg5/dQ960QtwD8j2jM3+7a6/Fb4ZqcrSh33I+R4PmJdhpWeIxe45njrAqVOuijlN8fvizYW
	A895Uxp0Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k15Om-0002lm-AM; Thu, 30 Jul 2020 10:02:52 +0000
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k15OP-0002et-7J; Thu, 30 Jul 2020 10:02:30 +0000
Received: by mail-pj1-x1041.google.com with SMTP id t6so195907pjr.0;
 Thu, 30 Jul 2020 03:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MO72mG+dWhjXsuhz31SfGb8hRyP/pb73MD0FYQnJVGg=;
 b=OvCoa/0/2Fnldj0/k9jnjh5g6/Z2vJisXKT/w/wwIsDWGDJ+XNfIoFrMQit9Dsz6Yd
 7PzzMkxwqFk1gzXrf3tMhGKWHyrPISbRMU36uzY2U5veR4ljZjReaCDIhf98i0vJXU09
 ndyPKrpfeJUOKtfEyDpIrt7ChJcPgJytOr57lOC/JoiYGZqBEurPVrPeL7kURKYiXwEm
 cFwefFXqTrHv2dRQMLZJBcQLVSLBbCMPDE+f+oebSmyMqD8HXLdxYbXTtTC5RdabliTX
 ypYea+CJ9g5ygoH6cGOTVGb8P7XB+dtRbpOvrXAKqR4MB8A3LblfachI7dK0FX9+VCEq
 RUUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MO72mG+dWhjXsuhz31SfGb8hRyP/pb73MD0FYQnJVGg=;
 b=t+LRocoSMd6COXv4Wdb6juVCbtNW9V24eJpBnlro0kIF1VxXCUp4d/E1L8HJUwdasB
 suhAVGNzYvwZekiKDcbYJ2pZt/s5wwFv13EhXzyfiJyeHopAXvAJMnYfyt4Wb9Duu3BO
 dTepSSjzfNM+atNXxAVmGiJ/6SFb/muKWf7bJ+Nsb5ChX1b0fCai/dBmOaYLvXf4RuoA
 U5sK8Bve5wqJe3fM2MhtgGmw8eevKPO2tXCMv/bVTnJ23uKkSrWthZJga3nF2jVLqKWB
 mAHvftnEMpLSP8R1C9f34Rxgq69lU0IAqLItBhuiby6cL1fPCWopDex3xi5nUOVkdJ8n
 TySw==
X-Gm-Message-State: AOAM532MKLdMLQUWLLBPAJcnDBVIkmX4NxjzZV2qMvg25MGf42oorGxh
 3+fga/jewX/k+i7Sv+hkLjk=
X-Google-Smtp-Source: ABdhPJwV5BjFx3WacpN5lFykYkivmHIsmIGFQ4SAbnTX7iOXog/7rh1DFN895x+skrvl4wpCSq/bhQ==
X-Received: by 2002:a17:90b:1949:: with SMTP id
 nk9mr6357635pjb.185.1596103347183; 
 Thu, 30 Jul 2020 03:02:27 -0700 (PDT)
Received: from localhost.localdomain ([45.114.62.37])
 by smtp.gmail.com with ESMTPSA id d12sm5476640pfh.196.2020.07.30.03.02.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jul 2020 03:02:26 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Subject: [PATCH v1 3/3] arm64: dts: amlogic: meson-g12: add missing ethernet
 reset ID
Date: Thu, 30 Jul 2020 10:02:09 +0000
Message-Id: <20200730100209.793-4-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200730100209.793-1-linux.amoon@gmail.com>
References: <20200730100209.793-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200730_060229_468391_5212A3F0 
X-CRM114-Status: GOOD (  13.25  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add missing etherent reset ID for reset controller to reset
ethernet mac controller.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index 593a006f4b7b..7f291e6e9847 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -189,6 +189,8 @@ ethmac: ethernet@ff3f0000 {
 			clock-names = "stmmaceth", "clkin0", "clkin1";
 			rx-fifo-depth = <4096>;
 			tx-fifo-depth = <2048>;
+			resets = <&reset RESET_ETHERNET>;
+			reset-names = "stmmaceth";
 			status = "disabled";
 
 			mdio0: mdio {
-- 
2.28.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
