Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91C7EC54EBE
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Jan 2023 08:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:From:To:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=g9iS45kP3JoV+77puKUKyTV4XkGc1n3ZZdEwVVQQ01k=; b=IGfkdMTY//UWZ6
	AUH0ZErRBMh5efXMON0FsdlUJ/BpjtsogPMlrVFO+fhhe7XA8Gc6GkGnyUVs4T5vPNMNyZKU1eLAy
	eFSke30Tw9LArUuGYJ91QG5LvKlDU7kUQVyi381bwZSeaOyHcUg2bxBmCXnN3XZEYNv25QERoSbTA
	iSAQ2cPinoO9Mjgq76VAzRszWBao4sv7VuM5H0cUKugL8iqXGe/Vs3Rnw+WLUt3CsIuH2HF+r3yBr
	mBqjCHZIqj+M3c6eNh+Y/0jh7yu8xR3TIHyQjaskggSmRKJSDEJpuer5x6HekXZ5LjsWZdqHGGfrM
	QZJRbrlaUAylG8lETX+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHL4z-009CkO-UD; Mon, 16 Jan 2023 08:42:57 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pH3j2-007QMz-Ut; Sun, 15 Jan 2023 14:11:10 +0000
Received: by mail-wm1-x333.google.com with SMTP id bg13-20020a05600c3c8d00b003d9712b29d2so21877445wmb.2;
        Sun, 15 Jan 2023 06:11:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TLQqIynPN/pT84DVC6KpLTcAe3g0Vq4uxVa23539u9M=;
        b=G/gBi/0jKEHW5nAR/z/nlj9Bpa6CPim6q2mv8Q0/YLw0HzlC2Zm76NPtS0KIdsrXKw
         SK76NnemoNHV1ZTx7trelb8U2iYQRZhlnTjqu+RG4HgR1OsEC9jtYsHCB4zNty0VVXp0
         fTFe8RTUoEc22zkpR75p+MpC/wlsNXTZcYEMvwvLz/oRX0YjU4bSiRWykL05saz445M9
         o9+0Aq+9b8fw/1SRLMaFwiWaLvUrptahLa4qWmkos5dz2mSObmbVWtibZnK8ZNhL0CxT
         BC0QD+og9hhtfx9coY3tpXm/lO1vfcB7LnnmlZJRgng9AQN7XZUfnqhmYwRvO62qZNx+
         koWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TLQqIynPN/pT84DVC6KpLTcAe3g0Vq4uxVa23539u9M=;
        b=sVWDJSXps/hC9lLLvUS11wCfodBXcBFjWnM5o8UInnlthJP7ckjWMWsvKz+k8hBKb3
         w38ONq5uLh8DAw3REEU1GQsQ3SFHrucdrAoUZ/SFUqgg2fe65QkvLyZHvLoTwQ40srXf
         lSVTHO4LEKemebOJc0nIyJO3lfLPOVITaH9H3NgY9bfjP7ZeNexd4f6NTYunI7MmsQ6H
         BaQojnZ9dKt9Ab9hfntLCXUjX0hipwT9Rbavdn4XeouEMw5D5QHD172k+mehB4i9oXbM
         TPEYFLRlFfm6vIoB66RCzLbhCXYTMNIVDu+Ahd966i0T8i50HQ3HoXATdoSfXVNOe4BP
         YD6g==
X-Gm-Message-State: AFqh2krkBj4XczwORYbR2etV6k5JTtYjVHGKIfS3yoTWaDtMlIak2qAR
	iG4utXVYioYS9NtsioCW+ezkC++Ir40=
X-Google-Smtp-Source: AMrXdXuEWfpqCHwgbx+VudW4fpmSHxIYaWeJEdsTgwcbgOsIhdU39TONH2ANX5TnuWYcU2xWX+sVVA==
X-Received: by 2002:a05:600c:3596:b0:3d2:3b8d:21e5 with SMTP id p22-20020a05600c359600b003d23b8d21e5mr63073219wmq.14.1673791866372;
        Sun, 15 Jan 2023 06:11:06 -0800 (PST)
Received: from ?IPV6:2a01:c22:6e61:8c00:154f:326e:8d45:8ce7? (dynamic-2a01-0c22-6e61-8c00-154f-326e-8d45-8ce7.c22.pool.telefonica.de. [2a01:c22:6e61:8c00:154f:326e:8d45:8ce7])
        by smtp.googlemail.com with ESMTPSA id l36-20020a05600c1d2400b003d9fb59c16fsm19547251wms.11.2023.01.15.06.11.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Jan 2023 06:11:05 -0800 (PST)
Message-ID: <e7b660ff-b887-fe4b-46a5-b698c0e5142a@gmail.com>
Date: Sun, 15 Jan 2023 15:10:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH] MAINTAINERS: add PHY-related files to Amlogic SoC file list
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230115_061109_065434_93DCB892 
X-CRM114-Status: UNSURE (   6.81  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Mon, 16 Jan 2023 00:42:56 -0800
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

Add PHY-related files to the Amlogic SoC file list.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1c83c26e9..428d88195 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1909,10 +1909,12 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	linux-amlogic@lists.infradead.org
 S:	Maintained
 W:	http://linux-meson.com/
+F:	Documentation/devicetree/bindings/phy/amlogic*
 F:	arch/arm/boot/dts/meson*
 F:	arch/arm/mach-meson/
 F:	arch/arm64/boot/dts/amlogic/
 F:	drivers/mmc/host/meson*
+F:	drivers/phy/amlogic/
 F:	drivers/pinctrl/meson/
 F:	drivers/rtc/rtc-meson*
 F:	drivers/soc/amlogic/
-- 
2.39.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
