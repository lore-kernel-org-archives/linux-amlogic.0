Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E045FC3DA4A
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Aug 2024 10:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eeBwz13rW9wJCraYHqvHbBTdKH0KCK3zOLXmCzC3dS4=; b=hjQSbkaWCWafpo
	BcMWFoqmaDkLgR9bRWINA8B1mV2vFr87a/sHMiWqLfVVWvbXuxkBfpmuk1SQmr2P8rWysIQtMF0sm
	pmEo6zr0xTryJxKTx6vfI3QMdaDzB9XxMjw3KbQ95CAov5S222+NXhxfBU9XrC581aUkgUAlPgnv9
	v/xHvr2OkEZzG27Kg6umCPtcIN3BlS91mpdkSc2A8bo/OdqBG/tMG7CTzx9f27r3bpktMO1Dhtq5K
	nxrF8j3C3vKfeoUMQRdnTnqW0jUOb78/3jo1doVe47m+i97515XDZ0fAAn3bSpjvJIuiVt3wq4KSB
	L1b09dTu4lHCb5bGuYhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sc0NN-00000007tNo-2zq1;
	Thu, 08 Aug 2024 10:28:09 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sc0NJ-00000007tJV-0mtv
	for linux-amlogic@lists.infradead.org;
	Thu, 08 Aug 2024 10:28:07 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-368526b1333so1098214f8f.1
        for <linux-amlogic@lists.infradead.org>; Thu, 08 Aug 2024 03:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1723112883; x=1723717683; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mtmd6W76tUil0cCcam+JDZpBYdbmzTJHGckyhD7jrDk=;
        b=OpWy27lnzXixQeG5UNY5Z2nftr7+z5ku2UGDwWNKxNwyXv4wRYbCP0OQ5NWZod+AnT
         Df7oOfJRs2M7RMKOmeL3xhSN5L626jt7Uj6ZMjXnHz4p4H/4Q4Q4y5VogKkN3cmXoBcX
         0CBWK2RmWAKDsau5BE0SF3UXh7P7ctwwwqcJr6XqJz4wUOV3MkdyqV3ZGawuaCD7PZ40
         faAu6dC2OgCbd+eklNHWoCrJ1Y8Ewy4GjCfvarL8DCYx8gNxPjpj+vRnm365roc0NA38
         WPzjEqjlisgwJ7Zpo7jYBMlCWtOlgrYmMB5v+EYyQvaLjUv3ey+rWZ8FLEkWg575zy/D
         uo/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723112883; x=1723717683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mtmd6W76tUil0cCcam+JDZpBYdbmzTJHGckyhD7jrDk=;
        b=jRHbHGwcfzAgME7L2AkHXV2UtcOfKh1bhdkYNJJPTsSHLe8BT87vlIkI7xqLaLdbnW
         TaRGaX4ducauhgK4dkRNFQZt48rWgXWHeapqzQzl2NgCfufhViiEoTTvCOBi1jCN++Hp
         bjzb/3vhjZ1y4MIro8+eRmcn4/x6BoVf3Obys4vaoyGvF5YHmaG2far7RiPkkJ9upOK2
         ynivkk/kTF1M2MCJ6Z7PLuIzBF2vNjRI7L1sAyraZns7cHYK9eMOa0e3Du0FV2ZoWXjl
         v0Jah3k6vmKk4mLtvq8Fp+XJnwin81Nd+Fts9oeByTwSKC6BpyNDCSIO1pmCefLVSk5T
         vsSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWR4qIksktp1yOWiBzNFgVeUNwLdXIbIhGh2b8VtiWlVLFVyHAjSFZOoMGlVjpotz6oF/F7FVQwLdWn7QlIPx0tQot6HaJTvOZFiqK13ryDoz0=
X-Gm-Message-State: AOJu0YwbKYFKn0Am+QtCCeewNLtUfB7oGwJaSF6+snlkdnQFNVaiW1pV
	3VsaTiCZoihIoozoZYNnK2Y8BfUDZnDi1uXgu52iY+YF77dGt84C/kXU9d9xTTw=
X-Google-Smtp-Source: AGHT+IESK3Vcf6HBrh5b8hOTqs7HQ9tidPcmbWNqOL/A2DCJJeJ7YWip04j5wF2X6KBmuFiiDUvuLw==
X-Received: by 2002:adf:f012:0:b0:363:ac4d:c44f with SMTP id ffacd0b85a97d-36d2815e3dcmr1034564f8f.17.1723112883473;
        Thu, 08 Aug 2024 03:28:03 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:ae7:4e79:8821:15db])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-36d27208c98sm1454596f8f.75.2024.08.08.03.28.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 03:28:03 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v3 3/9] reset: amlogic: make parameters unsigned
Date: Thu,  8 Aug 2024 12:27:33 +0200
Message-ID: <20240808102742.4095904-4-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240808102742.4095904-1-jbrunet@baylibre.com>
References: <20240808102742.4095904-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240808_032805_294528_24D3A361 
X-CRM114-Status: GOOD (  10.36  )
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

register count and offset cannot be negative. Use unsigned integer
for this.

Suggested-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/reset/reset-meson.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/reset/reset-meson.c b/drivers/reset/reset-meson.c
index 820905779acd..460ad2f8360f 100644
--- a/drivers/reset/reset-meson.c
+++ b/drivers/reset/reset-meson.c
@@ -17,8 +17,8 @@
 #include <linux/types.h>
 
 struct meson_reset_param {
-	int reg_count;
-	int level_offset;
+	unsigned int reg_count;
+	unsigned int level_offset;
 };
 
 struct meson_reset {
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
