Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71D43C636CD
	for <linux-amlogic@archiver.kernel.org>; Fri, 10 Feb 2023 12:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pT9aXbu0t6loUSZ1rwK8aQ+7bGijGqEDbFWa3Ks0JTc=; b=xJkGS8rwTfUKG+
	CPuwtGiSdQ6waQliEMEHXqrOJN2JXQV3J9e2HE1WOxDLUfnlmM6Xy33K0wBwGjS551uQQ8sRqSt+2
	mrDXAQ3VCgbLz8zl6rdf8q8jVnvEpG0cMrnsLx8xTBroHoGeWdE2Zm3VS+hhNgt3WEgrXKz79qMRh
	mc5d1lTuczYlSfLVzlyKaJct8HpFldG8iwJ1coeMKYjMkvOvtOXddKm7xzlN/89W66ZuMaY2Ah/18
	h5rE/M96igBXUWS/AXpWg//S/mwvUahwOWd+tVZoxBuYy9eVPhAl1tsHpcp3aJK/6hZILL4nxW4t3
	Oe8Dq/gFq9w8nT/pXbfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQSWN-005gX4-PU; Fri, 10 Feb 2023 12:28:55 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQSVz-005gJV-BF; Fri, 10 Feb 2023 12:28:32 +0000
Received: by mail-wr1-x42f.google.com with SMTP id r2so4901955wrv.7;
        Fri, 10 Feb 2023 04:28:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=glqZSh8z1DjmHlU5auQAlpkpEjpKVs3OPkg4NeOXn1M=;
        b=apR+vpK19609mIwWsOVMpmcME0xNCu1tzifaKj/fHrxo5zHyutgJvE/y1iksbrWioU
         7Eu/iZKcemFG1ii7R1VX7st0jR/wDAKE2UCdb6vqQWagGCzGDjsbVKSzbPZ7+plD7EN1
         13gXeoHDz43EwIy/2hdWMgBAzEhTPJNo1wg3M3V6e9j+TtxlGGqFGtqXaLquELtkKbRc
         W1eAy/AtonsgvrUOJA+9JzkHrgiQ4UJsi8WKuDNub6aNo1HN6Pxn/uqc7v05T8JqNWmO
         wEwnEdRLZRReVNWt7hVuzSLTVtWXQQJJRGVQ9hf4vvr5CUFMlbql4QkfcF4uFFthQNYD
         dQaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=glqZSh8z1DjmHlU5auQAlpkpEjpKVs3OPkg4NeOXn1M=;
        b=fGNzdIpMHQ080J/XRvH+B7bEBa5XzMdeaxHRmrnV9uk8zGvuEiI3ePgrx9iD0RLXgm
         hnHqosDtpylbHOO2l+IOUB2cV1GBxHzgKsSapdg/ZOlhJJEc10/dFT4ncOudYyhWMudU
         ehbnGf00uE5NqIF7u3BPgcWqEMZXGXpf+1mWY8SSp0QTFRcDPYt6ybUyoRpQ93cCPuqR
         isO1S1Yhc09tNHVD5HAe4qkfmbfBRc7b+K47zDzX3CpuKfZuGdVJwxFJgEzya7bN3ca2
         pRLTOWAXfoIlUdjVNj0jECWLtuc0dWFgzcpyVcDv1sPYaxr5CJwhnKQHwRVbDyOmziqf
         NwUA==
X-Gm-Message-State: AO0yUKVBoxJJXppDEN+yebCFOTx93a10qJQsf8OW2Wjw9PsBoCyCgy61
	5bA0wQ7nZiqK4XyIZz8TQUY=
X-Google-Smtp-Source: AK7set/+DWrghsFar9DtLynYL/yBNRLOaDwUQHTKmG8xM5HBuG5OrBk4olLnD9KJF9UuRbz0+Pq6zg==
X-Received: by 2002:a5d:4852:0:b0:2bf:d610:e49 with SMTP id n18-20020a5d4852000000b002bfd6100e49mr11802874wrs.16.1676032109400;
        Fri, 10 Feb 2023 04:28:29 -0800 (PST)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id i8-20020a5d4388000000b002c5493a17efsm1540989wrq.25.2023.02.10.04.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Feb 2023 04:28:28 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] arm64: dts: meson: gxbb-kii-pro: complete the bluetooth node
Date: Fri, 10 Feb 2023 12:28:16 +0000
Message-Id: <20230210122817.1027765-3-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230210122817.1027765-1-christianshewitt@gmail.com>
References: <20230210122817.1027765-1-christianshewitt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230210_042831_408711_F4282AD2 
X-CRM114-Status: UNSURE (   9.27  )
X-CRM114-Notice: Please train this message.
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
Cc: Ferass El Hafidi <vitali64pmemail@protonmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add missing content to the bluetooth node to align it with the content
used in (all) other GXBB dts files.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
Tested-by: Ferass El Hafidi <vitali64pmemail@protonmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts
index 9bfdb54d912a..435ae2aa404e 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts
@@ -72,5 +72,10 @@ &uart_A {
 
 	bluetooth {
 		compatible = "brcm,bcm4335a0";
+		shutdown-gpios = <&gpio GPIOX_20 GPIO_ACTIVE_HIGH>;
+		host-wakeup-gpios = <&gpio GPIOX_21 GPIO_ACTIVE_HIGH>;
+		max-speed = <2000000>;
+		clocks = <&wifi32k>;
+		clock-names = "lpo";
 	};
 };
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
