Return-Path: <SRS0=EW34=TU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 215C8C04AAC
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 19:44:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F31D1206BA
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 19:44:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GtLa7U5/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="kyYql0N/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F31D1206BA
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nn1PC6XshHRlm4nNwig611P8Tz93+nTGddXN1rhaPmc=; b=GtLa7U5/R87SvB
	rdgWWEp+i6w0JHm+kmbPVo8OFTE2BbrJm7ld0tXVlS2I/2rKZ8V5DX3dIOUq/fWygWrRjXqBtTCxl
	qzfLoCbTQxx7+6NYqrxENS8lBcXAzjU49AazyITnrpHhLCr3CeNxxgMcSR/BTFhORIzNoBEAFJv27
	pVrZF3e0Yi9Y8SQ0WlgxZvE48qnEUV8PWCn06rOAuM5v0psOVTb6REzdscvEin3G5cRUidRgkhNuL
	6LYhYXYg7ViNkK4hrERjFWmIGwt+h05KxKG0fg+WHUexTrSSSVzGfW1foMcdIpI/K+g68NSOyD5+t
	o0zmilWfWl7ymwBRQCqA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hSoDJ-0001ez-Da; Mon, 20 May 2019 19:44:49 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hSoCh-0000nY-84; Mon, 20 May 2019 19:44:14 +0000
Received: by mail-wm1-x341.google.com with SMTP id j187so672128wma.1;
 Mon, 20 May 2019 12:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cerp4BVz6jg3tc4rdBJfzN6XOYaVzz+u0Df3uTDWRZE=;
 b=kyYql0N/INbJltmfL4wFEOR+NsMXKiaRLatSdnJCMyxaA4MIIcyUUCEHtSsgERHE7/
 S/hoOwAe1IXGGrqMuJ4LFzQ//JAB8NAAT9hcwrAMLJk5ca+nMQiCNDdjJ/eg0h4wPqmk
 ad84lRW4KWxKwTNWjd6i9rn+LXgH70sP+aO9K4aZfogHpeE13o6TdQQPqLQ2H2FN/FVt
 0vnpHxxu5ly+oVB03lXLmvCBoNjgr7HlM0hDVBc/OTRYdxBUjHly+K/W5Spbb08tGYo1
 LWvKe8pPuKhXH9+/krespj+/cG2GWWN4nDzWRdFqVrpDddLVhtYUJvvxBOIBt8Nx2RmD
 n89Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cerp4BVz6jg3tc4rdBJfzN6XOYaVzz+u0Df3uTDWRZE=;
 b=i1ZtipblP9lT3I9P5+pYeiXJL1EIh5UZhbOvz1zV8ly+iK53DQklQTI1MfDzvkwehW
 veJDiP4Xx4gmfWw5cwvTgtmehUmpmJQT0eFgHxSDckay4P7T3HslyAzq3+56CUNx/5iu
 yt9Unvqih/1HQDSC4r6LTAt5jPc7LZOlVUb2LUqUvJk8AgJ//huUYD7TmilYyzzfRmA9
 9CkB60J7Smdg9MYaJDVhlnIHHagpk5a7SqBEWGxNMQjec373wHINeT2EqQrJe/FhZOgC
 F4lumiL67GlyIbiBlL1dcYxyxCbPrOKoCdVObMh5SdkcktOSFo8e9+hk+B35jZEqESJp
 2EWg==
X-Gm-Message-State: APjAAAV1VX992NTRbkSCr38FjFv526dMLHfiJJZdAmtXy8Ch0Z4XJByo
 h2bkBCorQz4zt3tNLNryiCt911fv
X-Google-Smtp-Source: APXvYqz6TjOgiMXyvvY45YMYM5QAQd+aEkZPv3dGBlfGkdv3uVfPB9l0UQz9qje2U4+bNqxrMirqJg==
X-Received: by 2002:a7b:c939:: with SMTP id h25mr612524wml.7.1558381449221;
 Mon, 20 May 2019 12:44:09 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300F133EE71009C356FA1F0E19AF9.dip0.t-ipconnect.de.
 [2003:f1:33ee:7100:9c35:6fa1:f0e1:9af9])
 by smtp.googlemail.com with ESMTPSA id p8sm9135352wro.0.2019.05.20.12.44.08
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 20 May 2019 12:44:08 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org, khilman@baylibre.com,
 mjourdan@baylibre.com, robh+dt@kernel.org, mark.rutland@arm.com,
 devicetree@vger.kernel.org
Subject: [PATCH v2 5/5] ARM: dts: meson8b: add the canvas module
Date: Mon, 20 May 2019 21:43:53 +0200
Message-Id: <20190520194353.24445-6-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190520194353.24445-1-martin.blumenstingl@googlemail.com>
References: <20190520194353.24445-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190520_124411_688283_476B651B 
X-CRM114-Status: GOOD (  10.70  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
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
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add the canvas module to Meson8b because it's required for the VPU
(video output) and video decoders.

The canvas module is located inside the "DMC bus" (where also some of
the memory controller registers are located). The "DMC bus" itself is
part of the so-called "MMC bus".

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm/boot/dts/meson8b.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
index ec67f49116d9..e4134c63a48c 100644
--- a/arch/arm/boot/dts/meson8b.dtsi
+++ b/arch/arm/boot/dts/meson8b.dtsi
@@ -205,6 +205,28 @@
 		};
 	};
 
+	mmcbus: bus@c8000000 {
+		compatible = "simple-bus";
+		reg = <0xc8000000 0x8000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0x0 0xc8000000 0x8000>;
+
+		dmcbus: bus@6000 {
+			compatible = "simple-bus";
+			reg = <0x6000 0x400>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x0 0x6000 0x400>;
+
+			canvas: video-lut@48 {
+				compatible = "amlogic,meson8b-canvas",
+					     "amlogic,canvas";
+				reg = <0x48 0x14>;
+			};
+		};
+	};
+
 	apb: bus@d0000000 {
 		compatible = "simple-bus";
 		reg = <0xd0000000 0x200000>;
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
