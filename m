Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AD53C433EF
	for <linux-amlogic@archiver.kernel.org>; Wed, 12 Jan 2022 02:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X2PIPFIhh2tolzQTAnCw7PAG9z1a11DmAyOi+nbRWN8=; b=viTuYEYH1kn/l7
	nXZKqquC+m3G5nMpPXi9TQvrEO/dHqvrwUc8052ypnZjqhxdfLDXQqwdGxRTOQUqfmh2jI8ssy5zQ
	K9A+IvW7sVR/IykMugO7pQCryChKB2KwK7l9IvTxXlh596G8vBKqYfg+iDFLe3HafmBa/Kbt+Gjyh
	L8BJGFAo7cG7HVQeFoFO6TAr1xUXVHOdn9BHY5+UeIsktW/KppcpWZK1fyhIFSbpgGS1tFmKDQ1Ax
	/Cw+PRgige82asCY6PPq88NsEhhgC5jJ1mRHhH+YgbFLGNekeS/8/LWF4BptRoUbZuPS9ud99qn+7
	obzEjzTSFftU+d0cTpiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7TN5-000qzA-4S; Wed, 12 Jan 2022 02:28:19 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7TMD-000qRP-Ij; Wed, 12 Jan 2022 02:27:26 +0000
Received: by mail-ed1-x536.google.com with SMTP id b13so4162095edn.0;
 Tue, 11 Jan 2022 18:27:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=PlEFAgayS9wvBGnQ35xlD13lbXEhQawx9H/2jDhZVwA=;
 b=F0Idtq4w4h43y6NnTkDYnTEIMGQHuSUhcX3rwRiRz9x7nmBJdDvz5GnCF/nsLlxQrz
 6aYk7Fsm+q4lqOEVcmlhqW8z6k+ouMmj1qM8y0D4WMO25tGOzHBOl5+ZwgKhvc1nuuLG
 efML83vyRad8peiDHiAKR/vkYEqF7DfrI3LHAmeq6HQZWlTZBCnrkbFUo5r8cWDdKJn+
 dFJMTUkggngKSzlmCCr9mol7pJPgLr2oeLIJ6yFmC0Q1LRry5FP6kEIRMm6NmePgRqth
 yE8nqAo9EWGI05dVWSpT38aEOT9OF1JTwsEEeeZaI6EH7jXZLTkay/hf+dl1RvweyOTf
 DNXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=PlEFAgayS9wvBGnQ35xlD13lbXEhQawx9H/2jDhZVwA=;
 b=t+0B7ovtiR9a2O31Twc+lhRh6g9kJljNgf9ngUghz7hf4gxw4ElAWGdoU10G1x5X6b
 hDSEqP7SGZmSur9MQ5hyh5XDXpn+AIkmx6yumctI3jo5XT0T8fXPYlfm/QSOt82Hmifi
 qZvndCelSzdGyrF5AGxuPsHAAvt7GeoKHSJS4n0UM1mGSyA6oln6q3vE/XYsmvSC9BKE
 o6JC8Pz4no2bpsi/u/HwPQhkHrtJDN0jxvRjcO420HKpv9BV/M/Uchy0s1XXReLqi7J1
 ieq6Ygy7I3yIr+h3lp2MwTApExXzpba3uIhQC4hUqHuIJaoBN6olNJ9+wcp99iTHBfkb
 pHnQ==
X-Gm-Message-State: AOAM531ooqtoZH/NnObe5c91kxeWNoi3u3OMURD6WS5eMeXdyoLnUr9G
 9YbMVshHQzFSsWDWcmyTgck=
X-Google-Smtp-Source: ABdhPJzTiHwbHLI71BjtGxzLm805TbVAX7FBwbUpBy5XGiKkY749qvqTq2C7hLMdYFfc2YtkBI3ghg==
X-Received: by 2002:aa7:db8b:: with SMTP id u11mr7165583edt.180.1641954442963; 
 Tue, 11 Jan 2022 18:27:22 -0800 (PST)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id ky10sm4041772ejc.151.2022.01.11.18.27.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 18:27:22 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Christian Hewitt <christianshewitt@gmail.com>,
 Benoit Masson <yahoo@perenite.com>
Subject: [PATCH v3 2/9] dt-bindings: arm: amlogic: add X96-AIR bindings
Date: Wed, 12 Jan 2022 02:27:06 +0000
Message-Id: <20220112022713.25962-3-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220112022713.25962-1-christianshewitt@gmail.com>
References: <20220112022713.25962-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220111_182725_651964_D0F44A8F 
X-CRM114-Status: GOOD (  11.09  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add board bindings for the Amediatech X96-AIR STB which ships with
model variants distiguished by Ethernet configuration: models using
an external Gigabit PHY have a -gbit suffix, while models using an
internal 10/100 PHY have no suffix.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 31df120d73b0..b5b995941d3b 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -170,6 +170,8 @@ properties:
       - description: Boards with the Amlogic Meson SM1 S905X3/D3/Y3 SoC
         items:
           - enum:
+              - amediatech,x96-air
+              - amediatech,x96-air-gbit
               - bananapi,bpi-m5
               - hardkernel,odroid-c4
               - hardkernel,odroid-hc4
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
