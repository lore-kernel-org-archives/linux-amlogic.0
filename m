Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CB3CC77B60
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Mar 2023 17:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2XELO3GezYS/Tl/EfTyMQemY0fk7za8YTay9+1FSZIs=; b=kxGgFon67lG9bm
	gaUYpGQb0MYvb5V/QL6C73zPhDxzZG+M2A8RfBg6+isOyrkCWtQsTmv6Iq+GpCZRytcH+ysifsG8s
	g+8CbOWv8JBFbDY6yXSRBWj9l97E4Wpj45H3DZbCHSwRCddcsDedJMkCmqlE5dQ1/U2YT30Y+WhbW
	2sY7eB8Lr5+PMDbNczm6p0Ng+i/nZGBgtenPB/YGE4VXX5oP2YmvyPBO64MMwvsPSmPQQrvbExv3S
	4xzYn6Nc12QbUo4CiU1woeU+EhgER002J8u9GNYQSvDjY/xof29RUgpR5B7PcnV5Tuy0Pg6scNDrN
	b1u7wdp2dqHAjqaoMYPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pefXb-00DBYR-0y;
	Tue, 21 Mar 2023 17:12:55 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pefXT-00DBTf-1n;
	Tue, 21 Mar 2023 17:12:50 +0000
Received: by mail-ed1-x52b.google.com with SMTP id cy23so62410729edb.12;
        Tue, 21 Mar 2023 10:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112; t=1679418760;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=u17vmZyfy9dal6qK63POybZ13EfyIridDcw13EXlO4M=;
        b=W4qm9akF9juiuXaVT6glKvmi0z/19+DnQysJlCdUFHKPJtdR+0d44A2QGDy0t1GihG
         nifsjFwOn3UVP9s7E7KLx1PzdOiQDyZL3oPG02ee5O+csxIHVxZ6jbdmhmwxxBCm0TPH
         Wi/Q9iqIYZAF23VZH/g5Nm9d73gLSwAz2Vu8ECnWYUjOC27SQJM08DDtX10lW9xOHQ10
         w7KYiXLQDpucPQwqlCQtQ4CjtzDaGjO9S18gWB3xiUpNbnAITZSK2bOvi+70gfmnpUFG
         RcWPpFQhfXHor/38op4w2Pd35LnBl3iwm9CtVHeLqFq36MqF+Bf6zHK1Y9m4ZIU/C9QR
         zS5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679418760;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u17vmZyfy9dal6qK63POybZ13EfyIridDcw13EXlO4M=;
        b=vvpNYIe1mHuFWCq9toxuba05MgCNenD9gnTNa8hb2s665gMzM+nO2LHeASE118j3FD
         KLHPgD91AB5jcekqMzUzOsu8oHrTLbCnCwLYQzpOXOw8xBM3DqNCG4Yxtuh1/tzPYVyy
         Rxcvaf2uDUgvjcUe8V9pY+RH1FzNVE5PpfCGp7R4ye7+7P0dVUi06Jo3Z92Mqc3Ns3kf
         6R+P+MUSoQ3VORUI9wJTa+u+zUgJ73A9WiQJNPuoejal5ZuzBu+dFQOxx7gAla7yJPIa
         o7RKMs0CxKVsHDty2eSG16FtUn9Rs00R8EvRyGMOHGrsoecicrG9+WowH9821n31jH7r
         zvkA==
X-Gm-Message-State: AO0yUKUTmBA/Kad7Xunqp1lQNnW25xQYxq+Bgbo/YLZZNGrxlcrMhRii
	6k4LyrDTSqY8AAtQs9lcAA+Z6D0Fd1M=
X-Google-Smtp-Source: AK7set87eu8TVE1uR+HziZluiDi+FIovip8LKHrk156iTChkOxm5IL0b3BhpBhsZ5rtlD7TwJiEaAA==
X-Received: by 2002:a05:6402:54b:b0:4fb:6357:f393 with SMTP id i11-20020a056402054b00b004fb6357f393mr3974740edx.1.1679418760450;
        Tue, 21 Mar 2023 10:12:40 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a01-0c23-bc57-1c00-0000-0000-0000-0e63.c23.pool.telefonica.de. [2a01:c23:bc57:1c00::e63])
        by smtp.googlemail.com with ESMTPSA id c14-20020a509f8e000000b005003fd12eafsm6474959edf.63.2023.03.21.10.12.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 10:12:40 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	neil.armstrong@linaro.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v1 0/3] ARM: dts: Enable WiFi and Bluetooth support on MXIII-Plus
Date: Tue, 21 Mar 2023 18:12:10 +0100
Message-Id: <20230321171213.2808460-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_101247_751613_329A0952 
X-CRM114-Status: GOOD (  10.55  )
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

MXIII-Plus comes with a Ampak AP6330 Bluetooth and WiFi combo chip.
The 32kHz clock is provided by the SoC and is enabled by simply using
the correct pin mux.
Also this is the first board which uses the SDXC_A for connecting to
the SDIO chip.

Other than the two new pin muxes this is just a matter of describing
the hardware in meson8m2-mxiii-plus.dts.


Martin Blumenstingl (3):
  ARM: dts: meson8: add the xtal_32k_out pin
  ARM: dts: meson8: add the SDXC_A pins
  ARM: dts: meson8m2: mxiii-plus: Enable Bluetooth and WiFi support

 arch/arm/boot/dts/meson8.dtsi             | 17 ++++++++
 arch/arm/boot/dts/meson8m2-mxiii-plus.dts | 48 ++++++++++++++++++++++-
 2 files changed, 64 insertions(+), 1 deletion(-)

-- 
2.40.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
