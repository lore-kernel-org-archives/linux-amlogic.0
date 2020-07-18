Return-Path: <SRS0=xEby=A5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B1ADC433E5
	for <linux-amlogic@archiver.kernel.org>; Sat, 18 Jul 2020 05:01:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E5B120809
	for <linux-amlogic@archiver.kernel.org>; Sat, 18 Jul 2020 05:01:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="A+OoaJo5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dIll9+b0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E5B120809
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=giq9jtMtVwec5hmGiN9K3I7kjPgdoyrQ7eT0yucZlfY=; b=A+OoaJo5dgxCk93ODwqr+EKHlP
	hw1EVNxO8HEConqJhX0nSn5k9Dc++Nkqu/dRQnWHVbdFqUiuESaZsBEf8lxJd/OoSOph2L060knuz
	jW1JUBjSAkmieePlpY8sxNo9mRIBxDwKAfgC1S+HDBsgojLjjUn8pW2BYEhrdrG3ayIQyXS5tMOCN
	QtqXI3QCvRb6T+tu2PQZO4SxqQ/jzfBkksGeNQ+gSS24ODBRxxnYEBEsNqfSyv5eIZ4Vml6VA+yhJ
	nq2yrMj5WN7TrHlYeqTk8I6gprMLctMRxp0JMTH0vaOzNruNewdV24hVKSTIp1ylWDzOPhMyDbyJH
	Dcffgfvg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jweyF-00071N-Pk; Sat, 18 Jul 2020 05:01:11 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jwey9-0006zf-E8; Sat, 18 Jul 2020 05:01:06 +0000
Received: by mail-wr1-x42b.google.com with SMTP id o11so13115468wrv.9;
 Fri, 17 Jul 2020 22:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=EfRpQHmTESiZa6dhnw2iqpiFLGjitNFlRILsGoZarsc=;
 b=dIll9+b0ojdGaPeKMBKId83+B8KbMveTAmCWS1sIQmbKhYv8QwbEcBX88GtnAtcDKv
 FUoewwWUnKer4iV05EGQsLinBue5HL6U3sa3SkxirQYiFaLEPnWGGMjqM5e8CYhve+JS
 ix6Hk77ztollOD1W1ESVneu68fgPsY64nA3lRp9oyT3QQ5Celvfl8a0acW3e+r7EmjBw
 8cJc7YYUhQRhKjQZBc17hsOOx5t01JHiPKQ70IYwT4vek02kRYfAtXE9p0anP+h9y+Mc
 +SZesfDtM7OHablnUiOHNlNunhjbByEecKA1j1qoxm/WV2WoIr5mYC4HA4OlQ4I0oE8n
 c9BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=EfRpQHmTESiZa6dhnw2iqpiFLGjitNFlRILsGoZarsc=;
 b=WKxpIl+0ZwYosGCT4x8OHz1uAWloBYWZUiUhf/wKxTu6H8uiraTXyFwJRer7Gjea0I
 eC9FBz1/XBSiEYaqKkl2Y9FUUqE++F+XJ3VTutjy+7ZAGRMKSyOw0rSV6eWzpGUZP/if
 biveSV28EgNtgbrxVgvZGEsSthWivMIO+X7lGvHbVR3DkG27h/17cfzxiCgVeYDQ5bYa
 i7mEKCXpdQd/b+e17rCoQzWjnpf7fsj/YBR7IUEEsLv5cb7J7mWQ40bVXG0hvvMxVe0P
 XqP7jrduTnc3O9pEAi651Z5syzeR7VQjUSsFfTtk59t4p2Dvz8GYw5rULasS/2MZSi2u
 g+tA==
X-Gm-Message-State: AOAM531pLaprBiiAtIkHVsyOTUAd/a0gGV6U5/VnvPfVjhvj2BQNq0SL
 KQtBqTtQo+wiLC2n7ga3A7W1xUa1
X-Google-Smtp-Source: ABdhPJx/2ArNMwm6dr01jNjTNfwVaYpjTt1gM76uZewiIW0Z7JUdHnjE5jkMaZ8Q+8Ht+cjuxUblGA==
X-Received: by 2002:a5d:4c82:: with SMTP id z2mr12728799wrs.287.1595048459891; 
 Fri, 17 Jul 2020 22:00:59 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id 68sm18179815wmz.40.2020.07.17.22.00.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jul 2020 22:00:59 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: arm: amlogic: add support for the WeTek Core
 2
Date: Sat, 18 Jul 2020 05:00:55 +0000
Message-Id: <20200718050056.1713-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200718_010105_511470_35D9A22F 
X-CRM114-Status: GOOD (  11.68  )
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
Cc: Christian Hewitt <christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The WeTek Core 2 is a commercial Android device based on the Amlogic Q200
reference design using the S912-H chipset. Specs:

3GB DDR3 RAM
32GB eMMC storage
10/100 Ethernet using Realtek RTL8152 (internal USB)
802.11 a/b/g/n/ac + BT 4.1 sdio wireless module (AP6356S)
2x single colour LEDs to indicate power
1x power button
1x reset button on the underside of the box
HDMI 2.0 (4k@60p) video
Composite video + 2-channel audio output on 3.5mm jack
S/PDIF audio output
2x USB 2.0 ports
1x USB OTG port (internal)
1x micro SD card slot
UART pins (internal)
IR Sensor

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 378229fa8310..5eba9f48823e 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -121,6 +121,7 @@ properties:
               - libretech,aml-s912-pc
               - nexbox,a1
               - tronsmart,vega-s96
+              - wetek,core2
           - const: amlogic,s912
           - const: amlogic,meson-gxm
 
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
