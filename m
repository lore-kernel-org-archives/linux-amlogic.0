Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7019C88E53
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Sep 2026 08:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f5Rn1qx3X6b61qDsX51hkuFccFKaQ7Yw+wd59k7Fmq4=; b=DCNRdc5Ws7I4DS
	KIylzbC2wA7cXI9hAHUD9KA9E5D/ZamTuA4spfn4llB08wD/1mhayeFHDKGbPJmRSRBqLS2igLvNV
	5aecw+SEjeLDgTJr+LvPcqIy3KcWRyNVOs5fAGNxvlyrY+rnB8imTqgvjVg94sYQqg5G7FFMBHmM5
	+yCWM+IcF/XhNzvlQ11EsidqetVNvKYg3d6hdsMvKPwj3tO1Eyxoa+mqtY9brFFtKeEe2NUeCHNHA
	qUzsyyey9iB/iCzS6N3Nyl6BoaeNmj3JGgRwDSnDLjZTuV4XPsTzF8EZNH7eYv0MNyzeXdCKwnyIS
	Yf8Pu5JkGJI79wrYt0Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Obb-00000005cm8-1dUs;
	Tue, 15 Sep 2026 08:33:31 +0000
Received: from extorris.mess.org ([92.243.27.206])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6ObZ-00000005ckz-1i9o;
	Tue, 15 Sep 2026 08:33:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1789461205; bh=Uv0Yov8JAiK5YEYKgmjYw5ZlbWxjU58cDlvmzD4Dh6c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Y6yx7BwnnL5wMdDdFr2jAnR4f1XXutEVKMgKnpsizm9t28+xOyZtsyC7prM+LuVaQ
	 nkbICOyYFGzEoAadWq5lwvPJs+6uPQqMfVTqi8vt3YREI1WLCKzGrCyXHlrtsM4Idx
	 5F8HEAtXgaqpvAyjpN94sqUecu8lYbwlDbm7hh/k/Yjj87yHEOB+rt+ZfZBtzJiEzO
	 SZzJkCY1ebCGRBzCvKLdZFRfVLjoVGVSLbZFTwk4QGwUXDnozllxdnHmpK3FcNqTKi
	 gpSMhOsxOJsNz6yfi7avcvc2NqEh/QsV8hWvyCzeahXzIplMA6ecOneUPzscYxvr0t
	 RcnpQsTvv+JFg==
Received: by extorris.mess.org (Postfix, from userid 1004)
	id 808A440B86; Tue, 15 Sep 2026 09:33:25 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1789461204; bh=Uv0Yov8JAiK5YEYKgmjYw5ZlbWxjU58cDlvmzD4Dh6c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=h5oAG8H1qlsBA9WIWKR45SOMKuWvb5BiesczV9COwAlv09kLIbHTCdO7GvOUlJrxj
	 VRa6KleffZnUccPJqBhpPMFocdiQaWard2YjSOtb4Eqfq3wMw5Ti1aFaZUQytnvWOV
	 NLMpsHEc8sIXlGrxZxW4r+VE4Dvab/9cKsENBS9RDbK7oSo6U4CkRhkoYnkU/4Fcfc
	 ppmhhAB4n1ZOI7EwegZWg9koNDht0q16OeSPVaXgdbM/UmcLaQi6536zObiEFAbEPF
	 FTxIXHAP92O6i9mWzbgOOlwEiyG/65yRQOnWQjJ3Cwcljw/q+0X5R7z6jugKavNDO8
	 FPbv8SMZ2pZDg==
Received: from maru.home (host81-158-254-226.range81-158.btcentralplus.com [81.158.254.226])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by extorris.mess.org (Postfix) with ESMTPSA id 8332D40B72;
	Tue, 15 Sep 2026 09:33:24 +0100 (BST)
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org,
	Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Viktor Prutyanov <viktor.prutyanov@phystech.edu>
Cc: Rik van Riel <riel@surriel.com>,
	stable@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 20/20] media: meson-ir-tx: Prevent divide by zero in meson_irtx_prepare_pulse()
Date: Tue, 15 Sep 2026 09:32:30 +0100
Message-ID: <662a613d00359191d9debce0b5a53019070a5e44.1789460680.git.sean@mess.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1789460680.git.sean@mess.org>
References: <cover.1789460680.git.sean@mess.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_013329_624044_A0EFA0F6 
X-CRM114-Status: GOOD (  11.49  )
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

If an excesively high carrier is set, meson_irtx_prepare_pulse() will
cause a divide by zero if tb_us is 0. Prevent such a carrier from being
set.

Fixes: 49be1c78d575 ("media: rc: introduce Meson IR TX driver")
Signed-off-by: Sean Young <sean@mess.org>
Cc: stable@vger.kernel.org
---
 drivers/media/rc/meson-ir-tx.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/rc/meson-ir-tx.c b/drivers/media/rc/meson-ir-tx.c
index 1ab898069e67..a0d07da09f67 100644
--- a/drivers/media/rc/meson-ir-tx.c
+++ b/drivers/media/rc/meson-ir-tx.c
@@ -219,6 +219,9 @@ static int meson_irtx_set_carrier(struct rc_dev *rc, u32 carrier)
 	if (carrier == 0)
 		return -EINVAL;
 
+	if (!DIV_ROUND_CLOSEST(USEC_PER_SEC, carrier))
+		return -EINVAL;
+
 	ir->carrier = carrier;
 	meson_irtx_set_mod(ir);
 
-- 
2.55.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
