Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10A59EB64DD
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Aug 2023 10:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4t/ySGvBWbijskkOiYkrOGG7GCZ7PEA1tD1bsLIVjt4=; b=aO8gOL/ptdgkkl
	MP/kSMySvOKuqiOCR+5xjXIb8Dn1iSHW7K2N7rsqkgrogTjfbBtEYjB2SgLNbSunPq1NR7gS7TSLO
	o6L74PnC+M2XRdui2d0AOheO9+F8K17cIy/xpydLLbBB0xjse4LEDke3gcFwAYwkdHojvfeRdyXlv
	HI7sMN+K5hUakj9wl6j+FcIr9FQJCAgjReNk6vxKe2RkbckQlanj8bEIVIwNvxnzqjDGXuzzDqz8d
	+U/rOo2DtkQmAJan+pZwLddXwWeSlIZtPVfY7ve/wOd/P75S1gsetHFkCW+AnLwKZQhMUKf7nDbWu
	j2fVNSWnf+8ABNDv82ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qSxsY-00Gvf2-25;
	Mon, 07 Aug 2023 10:54:26 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qSxsU-00Gvbm-2v;
	Mon, 07 Aug 2023 10:54:25 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-3fe426b8583so37702135e9.2;
        Mon, 07 Aug 2023 03:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691405654; x=1692010454;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UKxx/3gVhDKeQ+5Xp1I2ndcs8RM4CqYRJfi33pczdYw=;
        b=ai+xBYASjmix6+fhq4OpsVE7Bl8u5Z2vA69XGfyE39TdYmf7Kwlgn+wPoELh/FW/qF
         HE+3SstGf2Qe8PXkMNX52eQBJatXmP6KUNfHa/Nra6VrspmO7fUKeLKeXxfQnaVQlTmT
         iJ1HWBYFxRC4bHbmkuJoWQaa4JFpf8byan82Hs0Y7yQc06bhx7rkJ7my7i0Iup8WIUUk
         zR1I1PvhsTzZ2/vQx7eoa4sNvvOGRxSrL7M5CQN2rgXm4+9EAvsjaBkzaL+y0P9Yw5+z
         f4jl/VeupN9F7GbwbpoApWXcy60qxmH/sd57hpFU9DjfWMfUSHYZ0XUkvGeYpswZxBEi
         VUzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691405654; x=1692010454;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UKxx/3gVhDKeQ+5Xp1I2ndcs8RM4CqYRJfi33pczdYw=;
        b=apY19mCv0sdMKBOnwpqfQwd7D61/uN/8Nr/yl0Ku8XNNi9UdlfaBNIGg2Pvx0CaFik
         UhMEb9YJXWvGhipcSkj/ioOiiFZdriA0McGjo64AySfTM+Phf0b30U6uN+Vyq4pG355c
         68GNCRJPfba3OaTd4VHd9YiqLO+EeUJt9y+yeqYRoni9JYg05EzEF1CSjUxBw43oH9tU
         vrE05AtlEKU5zGuSI1PHntBXeCX7gd5xD+IAnnPK1ygWq2cG+a+2YI2/Cu9i/akHSy4Z
         8S00zKl7kw1cW+8XuNJQ46gymKuCv3bVG6wpcM+i7tO8etbySQAsFH6riq9ugfe2Hw9N
         nHmA==
X-Gm-Message-State: AOJu0Yx40zfpo65Zyhod53pUaKFVsB0uyza6YjoKmZB4oRApV8AemPMF
	XsaLw8sMJXg379maU+tNYgc=
X-Google-Smtp-Source: AGHT+IF+aqfX0z4y8+FcFdisghKRm5Jv45soYTVWt/c6AH2z4wv/T8nCxMSOKJJweVpRn4ujDE/zFg==
X-Received: by 2002:adf:ec01:0:b0:313:fe1b:f441 with SMTP id x1-20020adfec01000000b00313fe1bf441mr6769979wrn.29.1691405653677;
        Mon, 07 Aug 2023 03:54:13 -0700 (PDT)
Received: from localhost.localdomain ([92.85.190.61])
        by smtp.gmail.com with ESMTPSA id d18-20020adffbd2000000b003176c6e87b1sm10104646wrs.81.2023.08.07.03.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Aug 2023 03:54:13 -0700 (PDT)
From: Andrei Coardos <aboutphysycs@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Cc: martin.blumenstingl@googlemail.com,
	jbrunet@baylibre.com,
	khilman@baylibre.com,
	neil.armstrong@linaro.org,
	p.zabel@pengutronix.de,
	Andrei Coardos <aboutphysycs@gmail.com>,
	Alexandru Ardelean <alex@shruggie.ro>
Subject: [PATCH] reset: meson: remove unneeded call to platform_set_drvdata()
Date: Mon,  7 Aug 2023 13:54:00 +0300
Message-Id: <20230807105400.11560-1-aboutphysycs@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230807_035422_940558_CC4CD177 
X-CRM114-Status: GOOD (  11.11  )
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

This function call was found to be unnecessary as there is no equivalent
platform_get_drvdata() call to access the private data of the driver. Also,
the private data is defined in this driver, so there is no risk of it being
accessed outside of this driver file.

Reviewed-by: Alexandru Ardelean <alex@shruggie.ro>
Signed-off-by: Andrei Coardos <aboutphysycs@gmail.com>
---
 drivers/reset/reset-meson.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/reset/reset-meson.c b/drivers/reset/reset-meson.c
index 13878ca2779d..e35c3364e722 100644
--- a/drivers/reset/reset-meson.c
+++ b/drivers/reset/reset-meson.c
@@ -129,8 +129,6 @@ static int meson_reset_probe(struct platform_device *pdev)
 	if (!data->param)
 		return -ENODEV;
 
-	platform_set_drvdata(pdev, data);
-
 	spin_lock_init(&data->lock);
 
 	data->rcdev.owner = THIS_MODULE;
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
