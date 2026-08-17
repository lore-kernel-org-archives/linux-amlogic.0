Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46873C5DF66
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Aug 2026 16:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9V2NMlBoJO43MzlC96amm7uFAN5vhkOQfnxEANSHYDY=; b=zxBur7tHKR2c1D
	XxJkwoND444mEdrVmB30iXkCEGW3UhXo40zqbk5JrO7ehXB9QHX5nG9k8yoOi16i6IpXbLbrVPuYn
	8lE+wEvsLyEApMYaUjdnrimhieiX/dRE40m47DssEyHfF6sk/NO4iaJVgCSStapVfo23iUZRPvEsE
	UWS6N/+5jbILSLxYOYCp1kNRjKzE+DuWvpjrvIWLNO9FIfkrVBWV4ysPzTAIlJHXkkJtm2pkMs310
	39MkI2Rc6O3+Dn+w/U/ItrLlF5Tpeu5WbWLOYNHYMEA1JPxQYXtESbJTUt/W0B6CtWDlj3gg/WHUb
	zRzePcnPIIdVXmcuT5Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww06N-00000006VGr-3G21;
	Mon, 17 Aug 2026 16:22:19 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww06L-00000006VFy-2KEB
	for linux-amlogic@lists.infradead.org;
	Mon, 17 Aug 2026 16:22:18 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-52b3934af3fso36326451cf.1
        for <linux-amlogic@lists.infradead.org>; Mon, 17 Aug 2026 09:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brivo.com; s=google; t=1786983736; x=1787588536; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ibAJzElUUKot6lni8N5t6jdT1WBvVXg5lJjweeU8WH4=;
        b=jvQ/91i0pHzY7QcRj3vaAEv25Qv2j8mBmfvvBv0fSAK7/MgobfW1fw40P3Vky60AjP
         4YO746UHHGDBpI6AZCUClZa103tTCUeUktRxH1WY3Rk3EK/enlOhAnMROXyzNsZob5Vs
         aDgXjRpKo3+CipsR+YKZbRa3vTeA+yVHF3Tox3SfSsM9kzpWOlW7RA8zzmPAMQN6DATd
         tGIClpu5AQitsvqG0MF9mMX23+NX+oFU8pcNa4FJyx65P0rVzKpsA7WgKnphYkfqArTV
         CoLd6YLeXM3lk7XkBqd7jf7u8JHoPZL8mt4vBS1LO4/BM1aOUQRyxrTQ3XpEi7TdyMSr
         JkcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786983736; x=1787588536;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ibAJzElUUKot6lni8N5t6jdT1WBvVXg5lJjweeU8WH4=;
        b=Hhp1wJ9pnCCp3q4ExfISBe/FDmsIZ6IcXu4DAcEpZ0+NHBE9RZUNGU877XD0UG9ZlH
         6lSTEqhyv0NOMzDovhqaz4UsUFeqqJ3LcQth3PXw02Mh7TMqsBWXGnYouEbcX8r6z/sT
         EhlHKKdMbia/sFTtHi9697vRYBBAqZtmUpGrnbmTeE5W8lV9UBqDHfe5NmUrw2Zlmohz
         OBEiVkl92ZN748JmQoNVW98ixcXW8OZlytNdyC75iKc2Ll+H02PWsYgUUPOyYz93oI/3
         Akk6dW1WfjpkNXvnzonb9OCXQnBa9GdP8s0hPPjOflFp+R/+4zS9LocBD7Zzk8NKzDTo
         +MxA==
X-Forwarded-Encrypted: i=1; AHgh+RrxxwJ4AgLIMMebRfYIEJJ7Qnhc7D3hl6EXVxU2Ck8LhOh/g2zhVNAvRSvYOFwbWD9riKVOGAcONBg+uU1a@lists.infradead.org
X-Gm-Message-State: AOJu0Ywom9k9nViFC6KlJ6NK+a7JaAa/pdycemHl2snmaeAMnJwbfbJi
	IMjvZloZm4mX5FZrdS6W4pvGPnzmCjkzlTmPzUCucO6akDyTle17smwJXQ2J0k831pgmq+G14Kx
	5AULJ3Hei+rg+QbCHS9CVte+qgR4xpRNoX33kSGi57vshG78zk5g1o5KJ35HUenelpQ==
X-Gm-Gg: AR+sD13jOxME4Qdy0Z7cskNDDaEIJL+ZvnDiJepuYI7ZLyMgJlJpT4C/6430liiLK0E
	iYLrf/8w/qJpJYFU+f9G0n4jhrBA6NUGtrlPkwgeLyu1wh4pS3SmvH0ERmnkH1M+cIr91vAKL4q
	g4mvcIOWS1fd0PI4cslgvkDQkjAJguT+nQmv0nXCgZbBp+O04LRX+Zju9S/nhcIsyjDvNR/+t3P
	GCj06J2aPxEHuCMRGi2m0Oy/tCJ/x9yiJ3mL7pnkdpkV7SKSHuEBRMDx0YU+txBSFlXB9hDRhKF
	URtkZL+3//O8zCrgOBEibbg7FmLnorhOXrSPwMzu8WuNZcE871SajCg+aFgTbNYleZGIaqV45C7
	cDSVyee2w9nUBM3pTe8DDgxHsNpl17vrMXfZ9Pe28n3vwD5ei+9hdCDMoNX6AFekenBCwBwLhul
	SzNV3OdztNwk4QVT+adq76ZMu25yO3DZBkIMnle5lIkQNxnj3uLfFi3wS6lC2thc6Iy1S50+4+J
	pbYQCcy0QniQz7ZbPMszRBsMbxcPZF9EEGf/rs=
X-Received: by 2002:a05:622a:1a88:b0:51c:51e:661c with SMTP id d75a77b69052e-52d8543f3c0mr276688621cf.25.1786983735767;
        Mon, 17 Aug 2026 09:22:15 -0700 (PDT)
Received: from strozzi (ec2-54-236-161-35.compute-1.amazonaws.com. [54.236.161.35])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52db6136569sm18142461cf.12.2026.08.17.09.22.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 09:22:15 -0700 (PDT)
From: Sean Anderson <sanderson@brivo.com>
To: Linus Walleij <linusw@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-gpio@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-arm-kernel@lists.infradead.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-kernel@vger.kernel.org,
	Qianggui Song <qianggui.song@amlogic.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Sean Anderson <sanderson@brivo.com>
Subject: [PATCH] pinctrl: meson: Fix typo in s4 group name
Date: Mon, 17 Aug 2026 12:22:11 -0400
Message-ID: <20260817162212.1890616-1-sanderson@brivo.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_092217_616826_65D4068D 
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

One of the i2c pin groups has some junk at the end. The name should be
i2c2_scl_h1, and indeed that's the name used by i2c2_pins3 in
meson-s4.dtsi.

Fixes: 775214d389c25 ("pinctrl: meson: add pinctrl driver support for Meson-S4 Soc")
Signed-off-by: Sean Anderson <sanderson@brivo.com>
---

 drivers/pinctrl/meson/pinctrl-meson-s4.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/meson/pinctrl-meson-s4.c b/drivers/pinctrl/meson/pinctrl-meson-s4.c
index 872948699e9fe..365dafe457a9f 100644
--- a/drivers/pinctrl/meson/pinctrl-meson-s4.c
+++ b/drivers/pinctrl/meson/pinctrl-meson-s4.c
@@ -854,7 +854,7 @@ static const char * const i2c1_groups[] = {
 static const char * const i2c2_groups[] = {
 	"i2c2_sda_d", "i2c2_scl_d",
 	"i2c2_sda_h8", "i2c2_scl_h9",
-	"i2c2_sda_h0", "i2c2_scl_h1l,"
+	"i2c2_sda_h0", "i2c2_scl_h1",
 };
 
 static const char * const i2c3_groups[] = {
---
base-commit: 3b5f4b83c4abc0c9b0a7b9e2b44e816611b7f2ec
branch: meson_pinctrl_group

-- 
2.53.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
