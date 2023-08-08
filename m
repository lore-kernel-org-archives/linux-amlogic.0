Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A39CEB64DD
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Aug 2023 03:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ImMdkY9LM+FqyvEKghcFTeI1s23QpjGFTbiSc0wgbLQ=; b=mrtEjom+s4fKy/
	gyXnS7N8I6F2ihLvmafaTpzzggAWVQhfUhgqp5EByvZpuwQdKtu8Iwu4fIxHMrJqMB1txD2WLx7sk
	GWqywT+Uha0HpRWryjAwZDa5DOAl8xzK4thxWdR0uZRbgOgwpFf49xrhgI4CuA5mT+VjI+hYCzEz9
	crjTFi9slFu4dqe2UYfoNKQxfNCgcdH7H/HNX7JRsoaNcKRWk0p80MgPp5F7MqV9lFloTpyv8le9I
	CrAzxeyVsBJEHynbT6IRK4uUho1gRK2Co0Nj7NwZxquKk7TVG96ecAbRUDQSkbO5QMTMgaB1xqfYR
	bJDXJMgYX41wh+BGY9gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTDPh-001deu-22;
	Tue, 08 Aug 2023 03:29:41 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTDPe-001deF-2q
	for linux-amlogic@lists.infradead.org;
	Tue, 08 Aug 2023 03:29:40 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-4fe61ae020bso4251791e87.2
        for <linux-amlogic@lists.infradead.org>; Mon, 07 Aug 2023 20:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=libre.computer; s=google; t=1691465374; x=1692070174;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w2a2fi6fo8O2qphEYAkmBRgnh3Id5Qk5HANh3JTmLrk=;
        b=Hv0EkMFwuoyzbj7wybAw2sah1r5PcEsI9FNN9nLIlvkNEpHSFHw4jcZKq/NkXGTw6z
         H42R1MPcMSc8IIbKlAyXG1c0yacNizA221RfmnShj84TS/hy3iWPjxmdPyQv7ZxU8TG7
         hpT6Z4tY0EZoJoyg6WfiTFEaPLh6C+jhz6GHGqJVIafQ68XNayOBx0xe/m5BsTf3D1HI
         j/rN/NYIuWU98uIvWBgGI0u17/cRIekusBpWhj45eIhdqLWoop2D5lE7uBdJ1OaeFKnx
         SQMjWMbfBsMbDrTnG5IAIcQnZd+a+ujSMOvp0lA9QUDdDk24tLRY/H73PpTXxQW61bd9
         Xujg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691465374; x=1692070174;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w2a2fi6fo8O2qphEYAkmBRgnh3Id5Qk5HANh3JTmLrk=;
        b=gEuaOo7DG4SX6p4T/2NbdnDyTRktrKXxfuKzTe+VhUaELghs1fWb/C355JB/QBgnKg
         U4Em3bwQ7Sgtjc5B+bEeZTMI7yqNpFee8Iubl0PUaCy1MrAFNARKXxFYEOFcrI0hXySW
         LvnMGfy36+S7T8o3BaopHLSfhdKhVuY0oRAqEUfhAIxySpm40yN8OwE8+t+XGbbL8i3e
         g7Lnflv9MRtreaq9at4A/wZZwZAIAdwHjgF81qipUjDzTitPTmyMkepibnXO3m9tqpeO
         TKjbL5F8m5cq8kXX0zcows2tHr2ZXNZ4jUv4wSHpJr1WaGSccrElZ35eL3z4pK4ckmji
         gpGQ==
X-Gm-Message-State: AOJu0YzbS9Yd9dFRW+APa18PbFpMqrayEoiJR9EE3q4kiNlCeLYBV+Ju
	kqGjDNL0CvW/zWOXidFLV1absA==
X-Google-Smtp-Source: AGHT+IHUJlcYJA5OEaih3/uCPH2RSh8acayw3bMZ9xFGDbb2rx6os6/zhDaz9FaWTAYH/lOAbrlTdA==
X-Received: by 2002:a05:6512:34c2:b0:4fd:fe8f:4108 with SMTP id w2-20020a05651234c200b004fdfe8f4108mr6732753lfr.62.1691465374338;
        Mon, 07 Aug 2023 20:29:34 -0700 (PDT)
Received: from bear.local ([69.165.74.129])
        by smtp.gmail.com with ESMTPSA id a3-20020a056512020300b004fcdd81355csm1715321lfo.269.2023.08.07.20.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Aug 2023 20:29:34 -0700 (PDT)
From: Luke Lu <luke.lu@libre.computer>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	linux-usb@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Da Xue <da@libre.computer>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Luke Lu <luke.lu@libre.computer>
Subject: [PATCH] usb: dwc3: meson-g12a: do post init to fix broken usb after resumption
Date: Tue,  8 Aug 2023 03:25:10 +0000
Message-Id: <20230808032510.31754-1-luke.lu@libre.computer>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230807_202938_993937_0C2436C9 
X-CRM114-Status: UNSURE (   9.10  )
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

Device connected to usb otg port of GXL-based boards can not be
recognised after resumption, doesn't recover even if disconnect and
reconnect the device. dmesg shows it disconnects during resumption.

[   41.492911] usb 1-2: USB disconnect, device number 3
[   41.499346] usb 1-2: unregistering device
[   41.511939] usb 1-2: unregistering interface 1-2:1.0

Calling usb_post_init() will fix this issue, and it's tested and
verified on libretech's aml-s905x-cc board.

Signed-off-by: Luke Lu <luke.lu@libre.computer>
---
 drivers/usb/dwc3/dwc3-meson-g12a.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-meson-g12a.c b/drivers/usb/dwc3/dwc3-meson-g12a.c
index e99c7489dba0..2c07c038b584 100644
--- a/drivers/usb/dwc3/dwc3-meson-g12a.c
+++ b/drivers/usb/dwc3/dwc3-meson-g12a.c
@@ -926,6 +926,12 @@ static int __maybe_unused dwc3_meson_g12a_resume(struct device *dev)
 			return ret;
 	}
 
+	if (priv->drvdata->usb_post_init) {
+		ret = priv->drvdata->usb_post_init(priv);
+		if (ret)
+			return ret;
+	}
+
 	return 0;
 }
 
-- 
2.40.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
