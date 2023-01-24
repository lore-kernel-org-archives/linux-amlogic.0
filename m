Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC898C25B50
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Jan 2023 11:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YdtUkBqWxZIZNhgbljIGl+KrptMzH2kiSxOAFMWgtf4=; b=tsYSe4bq6vr9ly
	afXNePH4hRrI/RR9GnLQ+k9HKsBd9sBP6bUH9AGzTJtV6iqrdOoBe/qzjTQ5fwkFjZjGkHlEQvTmf
	NTmWpq5LjAstJHmHnlnHyqGCbr3b8WYzojm3wxf1f9ppfY6I7W1yRgtsW3JgeDWExK51Gt55kqXm2
	FnLQ2C92A5fEwLbvGDZAXE2U2mGoL/hkrQfcu7AWmMd4WvTAnySYVM/VwLE/z3EZFKAwjl+wLnQOJ
	vd5sVgu7nMNPoaIOP/AfIsKGZQ9wAJD6ooiQ/+EjjqyUaqpMnm9NXkszomEG+LtFxgDr8K2ZmnBCt
	o4lxwIPWVMjLBTV+ZCqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKHkP-003Vv8-E1; Tue, 24 Jan 2023 11:45:53 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKGdJ-00397v-Hh
	for linux-amlogic@lists.infradead.org; Tue, 24 Jan 2023 10:34:31 +0000
Received: by mail-wr1-x430.google.com with SMTP id r9so13403470wrw.4
        for <linux-amlogic@lists.infradead.org>; Tue, 24 Jan 2023 02:34:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2CdaMRLtCzvC4WyHAWjK2icYqsTTFGLirCU0OUkXnrU=;
        b=F7LwakyB36sQ2v7h89kpCl+MxGZk+CUGrAvrQQaNXEXGuJlSTeVnumKUtldxoWUe2o
         cK1Iou5OLHdKEHSjApqYVNiTbX1r9GFxlVdDybXaGf+N+2RLqdO+iMX811kzIhViBLoO
         eW79J9i/ucZgViJXSfU9EqSTTVcgkTybNJOeNg3GtjAixX/es+nxNdpdfBbH9UJEvMLa
         RMIdqD60pEAhojQqjnxJI+eLLa0E1DTkkE1wgZxr3W/hhjygojmVpNNcieiboLOt8zL9
         v1ctY0n+AZ3BV59RQw1JL+1xY3uCrVG322+Rcyaxm4FAnfOdcwNxb9lUs49hyniTUn3J
         b8rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2CdaMRLtCzvC4WyHAWjK2icYqsTTFGLirCU0OUkXnrU=;
        b=Dqcyx1xr0g4GoQJRhkAbJxwfCZuJ6ufVqxMvP0L3EyKSvSsI+V0Y3HqOT2cGrWsZu+
         HUvQDJILX19C94OF3MuhmbqAi5U1uT8jRyezUwPofv3s8FjLXf9Bif51c6wGzglBjX6U
         pho7oeCNUeOhg+Yww3NnOd7bb80xAr+hS7nRhKkmzodHouPi2zXVmUIATv1LqmJmSdxp
         WlNKGz9iLbtqqUIg1pz0xKxF8WrdXfzZ9qPVW1eFPKDy8AeSGI09UbetLjhr0tjJUKFQ
         eKz7HI9MCxkzdq1ccog/Twbh390IiL6wd23akGRDTaM/PhIje5vaihPSXk7Q5oj0MgWN
         aMww==
X-Gm-Message-State: AO0yUKW8SzZ/+3RlGwlkXRvwi/rfW3s4wfVdByxzAnz+rDyFtX4/Ls3u
	rkbzu9lcQfoKMPnHog/nd9IjPw==
X-Google-Smtp-Source: AK7set9c1iFpfv9PuITSfLVkzCEGSfcyTNpeWyeUIerUpyQfvxOMz6/lwJEmu5OVlnGsHOozxVXx/A==
X-Received: by 2002:adf:a34d:0:b0:2bf:ad61:6023 with SMTP id d13-20020adfa34d000000b002bfad616023mr2471268wrb.71.1674556467288;
        Tue, 24 Jan 2023 02:34:27 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id q6-20020adfcd86000000b002bded7da2b8sm1551889wrj.102.2023.01.24.02.34.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 02:34:26 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 24 Jan 2023 11:34:24 +0100
Subject: [PATCH 03/14] arm64: dts: amlogic: meson-gx: add missing SCPI
 sensors compatible
MIME-Version: 1.0
Message-Id: <20230124-b4-amlogic-bindings-fixups-v1-3-44351528957e@linaro.org>
References: <20230124-b4-amlogic-bindings-fixups-v1-0-44351528957e@linaro.org>
In-Reply-To: <20230124-b4-amlogic-bindings-fixups-v1-0-44351528957e@linaro.org>
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230124_023429_614590_0C6C95CD 
X-CRM114-Status: GOOD (  10.61  )
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

Fixes:
scpi: sensors:compatible: 'oneOf' conditional failed, one must be fixed:
	['amlogic,meson-gxbb-scpi-sensors'] is too short
	'arm,scpi-sensors' was expected

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index 13f8d483c61a..cac8a2e0bf96 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -162,7 +162,7 @@ scpi_dvfs: clocks-0 {
 		};
 
 		scpi_sensors: sensors {
-			compatible = "amlogic,meson-gxbb-scpi-sensors";
+			compatible = "amlogic,meson-gxbb-scpi-sensors", "arm,scpi-sensors";
 			#thermal-sensor-cells = <1>;
 		};
 	};

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
