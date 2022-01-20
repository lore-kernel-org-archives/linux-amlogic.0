Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A417C433EF
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Jan 2022 08:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VJPlPKeu3/ti76nWYqjLd2hLljvHopH7EIpPTCzrF8Y=; b=aShF3BeJuIHgxF
	3beCImcHkBqfPwDlwTSLFPAZyo+HX55m4epAhKLY9golT28dlVoQb1HKWLzcDK3Qtmzxoq2KoBtZC
	/HZExO6Ir08t4BolGJtTe7keeoLxJzHEW9wRet1YFFwc+svgGZUh+aZPQh+F+HbClmRALE+nxK9Gv
	onf+xyOgl7K898HTGAGvIyJcTT+M8nLatvBWRV2/pQWRmy1ONUxWlE9Xa0yBvYU0HBSIc8mYn6Jza
	hQT1GSmYRUR9bES6mlDNvLYUau4fRYDwyXu4f1hORjQd3CV2R4d1d4ahQCg7C4TW+tlrsC/vdgO/G
	6I9TN/2/qrmUkIow6C8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nASuV-009nrZ-Ee; Thu, 20 Jan 2022 08:35:11 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nASte-009nGz-0N
 for linux-amlogic@lists.infradead.org; Thu, 20 Jan 2022 08:34:21 +0000
Received: by mail-wm1-x335.google.com with SMTP id w26so10461339wmi.0
 for <linux-amlogic@lists.infradead.org>; Thu, 20 Jan 2022 00:34:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GvjXEzwWw5DOsC2FUoSljhwKoxA/3Cn53z/Kd2Lx0u8=;
 b=JU+IO6Cx0jCaHDcsGI7ReJv+X5sha07aDJGj86ypoJpui2OnOD2gyViNsH3Q9ML7PC
 E8gcD/Yn7Csi7VJLFsaPAmDa83lvqz4Rmmh8KP5AYBEekJRvbINH2hv+foTDjQDSV+1W
 FC8E/soVvyoIFwB96X/05YHJGQ7UBB9lm6ujxnjXLCblRtTJ3cA8Duj4TrMBymHyQSWC
 jIthTRsLKRRrzgyFdLP4ojr9lzsqcqLfpYVEeN+FMt8jlK4hbZI+RQLObTF3X0abfGrV
 tmtCdTTFDZ8yrNGeu9higSRugui968uoWCZgq1P5OmIiD09cYOZe5BaXX2B5GHo2T4Zw
 reEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GvjXEzwWw5DOsC2FUoSljhwKoxA/3Cn53z/Kd2Lx0u8=;
 b=d1WhSJ7eQQQHyHwwoFxaGihNeoKd0yxLPJO9OJfzDSpXsqjGzmuS4i7tS+8ZP5UJ4h
 TLoeJv7KvNL/MDuI6oP0Kr1cDDkjwWIiBNbhvX64h9pMBOUlbowFWiHUsEnL+jx/zB6Z
 XE0UPfhLm7AxCscWWvE4MvFBJyjS/GQy9qY8HRQsjV/TeSCpXc+febyEMfyL4P1gQQh4
 UH8QVlTb7IOW2pAC1dRxQ3+QAoi+E7NsSxzEFpJzJkEFgqci83Kg000Yyh1Deikvm9PN
 DsxcZ26WWCglSjf59DxDc+pjoHbvW1BsyQ2MGSl0LVzK8SmI+WlDtdMrxt8LB2BpXZPb
 f4FA==
X-Gm-Message-State: AOAM532l7iyXly4mLUYSrl0djtoKj6+hyWxz0U07UNJ5YUYQhaSlzoEr
 6wGD0o2XB9iZHd9CZBcoDjfK/o3pxaYa+g==
X-Google-Smtp-Source: ABdhPJwHLKU/98zgMK0292ggxvlMh7IrxcozTV7SPl1uJN57B/NU3j/oH1nyXXoI20JwH36XyzMePg==
X-Received: by 2002:a5d:5712:: with SMTP id a18mr11942346wrv.30.1642667655995; 
 Thu, 20 Jan 2022 00:34:15 -0800 (PST)
Received: from localhost.localdomain ([2001:861:44c0:66c0:ced2:397a:bee8:75f5])
 by smtp.gmail.com with ESMTPSA id u16sm1821975wmq.24.2022.01.20.00.34.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 00:34:12 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: dri-devel@lists.freedesktop.org,
	martin.blumenstingl@googlemail.com
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 Rob Herring <robh@kernel.org>
Subject: [PATCH v2 2/6] dt-bindings: display: meson-vpu: add third DPI output
 port
Date: Thu, 20 Jan 2022 09:33:53 +0100
Message-Id: <20220120083357.1541262-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220120083357.1541262-1-narmstrong@baylibre.com>
References: <20220120083357.1541262-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1046; h=from:subject;
 bh=2wZSM1EervZhwHtMBGn08hG3brA9cSnePHawMs4IXC0=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBh6R2HtHaHBO8Gcc5g0igET0IHjMAz8H0lZXLXk1xA
 yY8RtBiJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCYekdhwAKCRB33NvayMhJ0bU+D/
 45LoaRuAytDfAtfN56uznx2Rj7lc4OpHd42sWi6Fb32dnXa/sstxDfZ3S9VHBkcWyIiIWmrFmTOSo/
 P8Ng9Dx1oU4sz/SJyrNaqWtGEWVhtAa/M54zbhpP3Aeuu7uO3XCvIMdgHlh/pbsstE+1yzBjA/ePdW
 dgx11LGFg0C8nssB62wSjfXtis7EizziWpXOJDeZhvmuA2WVz4i/kjmCwmoV3zayeM3tkMUEht3abF
 c4TFr9TFc9DrwTLvRW5p/WBKIu5KqXJqZBxtJ0tHUG1tAt0OwjVlK0pUPWjR4FcI2o+GpnrGtd0Yed
 yyn7c22w2Ezhjj5+GEBn6V82iJAQaYfIzA45ovJtupai6f7DOqGeo+2Pq64DLoWjRW7wdo+ux5lk/k
 GX6iBqzZcveCC+kSjeeIPPmWcVrAzFTLuP/Subdl8u2SdPyoEtBCQU7advcHWlV+i3JcrlQbsNyNxe
 bVX8cI7k5IJ2uEvYi7WlATT0lzh5D3usM1hu4RFbhIWpsPjsGwEnugYeBW1OVnzwB2NwqZ1BHeeBS1
 1980joW3wENyS/o9VbXzhHL3yG+5aEJWC9E8h6VEY2i00dGIqxjEW7Rg3wRsrxgheom9qBfo4WuSh/
 bOlkcPjlMCIikIr99V6MsA30DJc7sncBiRv6RNTdZy5JUxfSp8ivX07U3URg==
X-Developer-Key: i=narmstrong@baylibre.com; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220120_003418_099728_9B53291C 
X-CRM114-Status: UNSURE (   8.99  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add third port corresponding to the ENCL DPI encoder used to connect
to DSI or LVDS transceivers.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/display/amlogic,meson-vpu.yaml       | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/amlogic,meson-vpu.yaml b/Documentation/devicetree/bindings/display/amlogic,meson-vpu.yaml
index 851cb0781217..525a01a38568 100644
--- a/Documentation/devicetree/bindings/display/amlogic,meson-vpu.yaml
+++ b/Documentation/devicetree/bindings/display/amlogic,meson-vpu.yaml
@@ -92,6 +92,11 @@ properties:
     description:
       A port node pointing to the HDMI-TX port node.
 
+  port@2:
+    $ref: /schemas/graph.yaml#/properties/port
+    description:
+      A port node pointing to the DPI port node (e.g. DSI or LVDS transceiver).
+
   "#address-cells":
     const: 1
 
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
