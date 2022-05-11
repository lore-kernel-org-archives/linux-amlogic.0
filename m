Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C69EFC433F5
	for <linux-amlogic@archiver.kernel.org>; Wed, 11 May 2022 05:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Bt9sL0NKsH6SmH9WOL07oBBMZi6zigf3SCBBsTYe9bA=; b=YIr1IdCyznWKzg
	XT4wvfB+Fpa2G8whcfe329pE3fTFbPlwQ1aBcJrfvI26EUAb0sM9UYrKy7NDy3rzc6PUhXgEFt4Ot
	EsechjcoKAzEhbvmj82QWgajwL9Og5U/Zp0Jfr3HwIxxYqwpiL64UIG7DXPgN8zbMV+f48JsnZu0e
	/ELVjC2xVSJYWGaHdr91AupyyaN+1FTlF/6sNltcWZ/ygQE4IiHQzgOBJwI6oeeOcS7aNzjhjqygw
	DCVh5EsxrigC3Jql+M1jgcbR0cS+vguPyCHKKinZqD6vq/iTXSPf/atJbrigtB0ZWnOaJBYWfkkkL
	qhWVa7aL4s+A/QL2wVxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nof5s-005Iob-G3; Wed, 11 May 2022 05:41:04 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nof5q-005Io1-3v; Wed, 11 May 2022 05:41:03 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 7so845924pga.12;
 Tue, 10 May 2022 22:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yXF3SCNfjM2bxLwQ5AjghUOySdcJkYrZZ8M04WZEgOE=;
 b=je2OkTXoLAiJsYF6ntKWkXMs5+pyupPPj6tCBhGU4fGDuWvUG10HQ0BqCMmSaUA5YX
 tXf1U6mKLkDBRGx5eW6S6uconZii8wv4a2pMYNv799tH9Qqt/KcmfzF3ZbfGGMrgNhTr
 KmRxZla6QKPpnw9wUoXoDmACI0tmIBBKs4PuuqjSNvT6BPINoH8w2ftMVsH9U/GN/S+u
 cnFkluyiZ5jsPtVzFtHl6EYQaAVaijYDfifiA2+YhZXtkPdksSOyaU/H6xCmd8iYsg5k
 utWCOxed4g2PcsPd2RHU/ew5XSyPFWPuJvUwN8XXRuw9kWQa69naewIi9ULUljOm212V
 ArnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yXF3SCNfjM2bxLwQ5AjghUOySdcJkYrZZ8M04WZEgOE=;
 b=ZtG70A4pss65YgA4/DOE1orjnK0EzWfVobER7NXOFk7cOaKr7ZNwsuYQ00Ec5+BkI/
 j48T5WiGVyrW6Ee+qrknixbqgd/5RUW7Gz16b1MBKubGovIDThwHzsWwKG6SmbNb7ZrG
 gDKxvgCySBdRzgGbFEPGo1OS+IjDIjNVPSo/06UhXGS9jP+jKK5ehacKJjwSDlrCP1ki
 Qs4dtOc/dVYOFhmCB7cMC+5JTYDhZuarfmjb6VNm2ZGVZgvxfTp2o5AiU9zUYFNKjxFL
 J1vEiVHxSM2WO19COG0MDhzfYX08lJXkCGv48928+/m6CfGamJ3CN0X0xaCgXXy2SHam
 E16w==
X-Gm-Message-State: AOAM530GHaFLmKuYWmsXvahSFYDCNeoTP4KpSYFV+HPnkAF+IZK+1c+h
 i0dOcuOO0C2YPWNMbBFBJ8c=
X-Google-Smtp-Source: ABdhPJw7a6nCTB9DlRmTN0EmUxMmxzMov1YhkKH8myZAr3gidDhmH5/zIHIY+HZx3JcDbV79Xk2ULw==
X-Received: by 2002:a05:6a00:21c8:b0:4fd:f89f:ec0e with SMTP id
 t8-20020a056a0021c800b004fdf89fec0emr23243222pfj.83.1652247661317; 
 Tue, 10 May 2022 22:41:01 -0700 (PDT)
Received: from localhost.localdomain ([202.120.234.246])
 by smtp.googlemail.com with ESMTPSA id
 r17-20020a170903021100b0015e8d4eb20bsm673772plh.85.2022.05.10.22.40.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 May 2022 22:41:00 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: linmq006@gmail.com
Subject: [PATCH] drm/meson: Fix refcount leak in meson_encoder_hdmi_init
Date: Wed, 11 May 2022 09:40:51 +0400
Message-Id: <20220511054052.51981-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220510_224102_215115_3059E083 
X-CRM114-Status: GOOD (  12.21  )
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

of_find_device_by_node() takes reference, we should use put_device()
to release it when not need anymore.
Add missing put_device() in error path to avoid refcount
leak.

Fixes: 0af5e0b41110 ("drm/meson: encoder_hdmi: switch to bridge DRM_BRIDGE_ATTACH_NO_CONNECTOR")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 drivers/gpu/drm/meson/meson_encoder_hdmi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
index 5e306de6f485..de87f02cd388 100644
--- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
@@ -435,8 +435,10 @@ int meson_encoder_hdmi_init(struct meson_drm *priv)
 		cec_fill_conn_info_from_drm(&conn_info, meson_encoder_hdmi->connector);
 
 		notifier = cec_notifier_conn_register(&pdev->dev, NULL, &conn_info);
-		if (!notifier)
+		if (!notifier) {
+			put_device(&pdev->dev);
 			return -ENOMEM;
+		}
 
 		meson_encoder_hdmi->cec_notifier = notifier;
 	}
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
