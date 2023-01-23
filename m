Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80D3DC54E94
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Jan 2023 14:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sZktr4Ec20JkvbvNUUkJiKEUQoiF9qiBWS6Akqdx5Qw=; b=N3U2gAmvK5jHp7
	sCBVIheHS9OtT2eO6g8XPUjoheZ984uC07fBIwefA5x8NIUwrTid3vTAciAxNZyBAvkxFMunZBsDS
	5Sstr1LFpk0pRtgTKMQ7rSC3XuoAZF28SxUwu6csj7xExOqMnSnsrg7SIdyN9epa+29P8dUP6C3D0
	A3wJG6nXDY0G2J7EtbTKSe9qmC75p0o/9kDlJGN61x+8fB3IKrslUku8f5SkKIcOzzguCmhCMAo5J
	MUvln13e/X5tZUYUd9scTxpXLVpyeJVKiOm8tZ6R90x1/b8i+g1mn7PNaeJ4iKaEF1nmnfavDJ0L3
	etZ9zM3oPIRC9ituumZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJxUF-00HVyr-PS; Mon, 23 Jan 2023 14:07:51 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJxTq-00HVou-Es
	for linux-amlogic@lists.infradead.org; Mon, 23 Jan 2023 14:07:29 +0000
Received: by mail-wm1-x32d.google.com with SMTP id j17so9140707wms.0
        for <linux-amlogic@lists.infradead.org>; Mon, 23 Jan 2023 06:07:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4mmthz0s8OqDS9LcQFBQmN/W5rI53YEoPrPOHEdAQ3c=;
        b=rd8QCH4i37iqGUZEDJjNBq8bpO6hkW7AfySdfhBhsEit9scjXNOfovcqO28KeDEW1V
         lzm1jhgBjZd2ugzwQuHB0CnfPElOKEhSTKiN1IpLEnOGQOTCWSsGe0cUKRp5IQuHswaG
         2QGIKf+LMKzqtrcUuUo0ybjz8yA6EuDLaoi1z6TQ534eSLD4+NqEnoaNWg21rfzNWJAO
         psOaPjL6cZ070BmKCj6LOUwEemQ/7s1wXU42l9p7MkrAXR+VwFdHKiCH4ipsB7+9IRno
         x9pEf/4wGywoL+eut/JHhRpD4HTxG6n71Evq6osVx8BWc8UQK17e9woEmzryqK6L9bMw
         gGSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4mmthz0s8OqDS9LcQFBQmN/W5rI53YEoPrPOHEdAQ3c=;
        b=DPdLIXz9UIn/szLd1Dhva/a66Lv3PoyOEo6kRvoG7e9Rr8xUZfd4lRFENzF86BXj0f
         yECUSjRVHgUMSYhcjxLBjLqXPv2DYVbmaT+G/l7zzfz7HrzuIkuPYe5GAGjEgY+KSjdN
         ltT+NZ/+SC+aGnP/KlVmOejPCQZyoMKY7sId6bj2FXUeq+uBxQJXSLqS4DouNrMV64Yc
         somfe8BmwCydWVdUSHRwXCWH5ZVu8plz8TEYbnQf85ZeelB22tXu3BYvGcuSAbHAUH4W
         sV99BImrbvP7mUAumLJGdjyjXFMvZYTYF9qXJrf5sPzOneNivy3aXlpL0BMWPQxF4cKK
         mbPQ==
X-Gm-Message-State: AFqh2kr5acMT9ljKEdyaRjmDLUwTcA5PB79F8gC4A/qkpOTDxImFCdSd
	ZjnUE43fllHn5n+buqEKBw1xFA==
X-Google-Smtp-Source: AMrXdXuiJsbkEguxp4te7mOTpepXLy/AzWUC2thPk4yOb/qOQt775rI9bY38mOM0K7l0QqKy611Y7Q==
X-Received: by 2002:a05:600c:198e:b0:3db:1d7e:c429 with SMTP id t14-20020a05600c198e00b003db1d7ec429mr16925888wmq.40.1674482843150;
        Mon, 23 Jan 2023 06:07:23 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id q7-20020a05600c46c700b003c6bbe910fdsm13841655wmo.9.2023.01.23.06.07.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 06:07:22 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 23 Jan 2023 15:07:16 +0100
Subject: [PATCH 1/3] dt-bindings: arm: amlogic: document Odroid-N2L
MIME-Version: 1.0
Message-Id: <20230122-topic-odroid-n2l-upstream-initial-v1-1-1ce5e08039d0@linaro.org>
References: <20230122-topic-odroid-n2l-upstream-initial-v1-0-1ce5e08039d0@linaro.org>
In-Reply-To: <20230122-topic-odroid-n2l-upstream-initial-v1-0-1ce5e08039d0@linaro.org>
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 Dongjin Kim <tobetter@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_060726_690877_05278B7E 
X-CRM114-Status: GOOD (  10.27  )
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

ODROID-N2L is a variant SBC in small form factor and some peripherals
are removed from ODROID-N2PLUS based on S922X SoC.

- On-board ethernet is removed
- On-board RTC is removed
- USB 3.0 hub is removed, so one USB 2.0 and one USB 3.0 host ports
are available
- Huge heatsink is replaced with 40x40mm heatsink, 5V active heatsink
is recommended or a tall passive sink is optional
- 3.5mm earjack is removed
- IR remote receiver is removed
- MIPI DSI port is added

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index e16b5fa55847..8aa6b6a92c29 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -165,6 +165,7 @@ properties:
               - azw,gtking-pro
               - hardkernel,odroid-go-ultra
               - hardkernel,odroid-n2
+              - hardkernel,odroid-n2l
               - hardkernel,odroid-n2-plus
               - khadas,vim3
               - ugoos,am6

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
