Return-Path: <SRS0=49YJ=DI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9AEEC4727C
	for <linux-amlogic@archiver.kernel.org>; Thu,  1 Oct 2020 13:28:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C4AF20754
	for <linux-amlogic@archiver.kernel.org>; Thu,  1 Oct 2020 13:28:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Q9I8mMte";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Nm9rn+eA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C4AF20754
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8BQSYBECFMWF0X7YWV+UWMDn0pqdji9uISNN3iCNCaE=; b=Q9I8mMten/zDIme8i5xzGhDsOu
	P2YVYQWiSEnBdL8ZskXbTzFca6mt8LC/+Nm9EmlgCxg1gkQkdTvPt3BUmcaknNZkE8Qd0sRL7Yp5P
	lBFHFZkdXnZ8MYFdHtS1lGsjtnpqg5igeBwjw0w6ju96yigUBx634dD8eK4AZgU6xxfmbkkxrdOxZ
	DKHrRzPxB4pH9Lhg4542+m/XVj3BuGzCsXbAkBxMU3NvBDXxIKL31ixItFR8VXrozt+kYdzN8Eg8n
	b5EX85v8OoBNZ/Z2AOd81Nj6zgUPK4+BiO0SSxIfL1GwkoMZSC4T251qKm0aH0DBKjWyUWQabQTQ3
	qQH30G2Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNyd7-0001uA-Vs; Thu, 01 Oct 2020 13:28:18 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNyd4-0001sA-8u
 for linux-amlogic@lists.infradead.org; Thu, 01 Oct 2020 13:28:15 +0000
Received: by mail-wm1-x343.google.com with SMTP id k18so3080118wmj.5
 for <linux-amlogic@lists.infradead.org>; Thu, 01 Oct 2020 06:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id;
 bh=cJ4glN5x+fceHO8drCanza2N1tIoBVi6ERZORMAgvMo=;
 b=Nm9rn+eArD1tlPa8xF2Q1MfLskZzb+DdmOhakgyMsWP8KPPOOZHQB9QrEdjdDkZEIH
 UxyYPBJ+m+OD98LXnxtQlBra8a9vv8F2JXveWx5BJ8iB3lPGGEPEIyZsL1hu7D76VTQv
 b04LY1JCoB/yRAY63+GFax74NGnUohIhsQCZpLDx7QpKEyEUiez40zqglIaOfTUo6Xf5
 WCF3rKl5AkS94XgdXjBVXN+u4irluOvVjWJ+6VGEsigsNO2wt//i3bxqgpu31isz+gpI
 FIWkW1fWgm5slab23uWfsXUmmpBFngZsFAFZWrFkPttt/ORO2K9ykPQWjca4E6cB5y+D
 aPuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=cJ4glN5x+fceHO8drCanza2N1tIoBVi6ERZORMAgvMo=;
 b=qamoxOFYgDEK8GwNPIZi8fOJAicToBl6zLz1foExIRP8pKopRMKqAIkwEQlwSirD3h
 gM2g+6SB6dHK5R59YMwheX/st3zCZUtQ00UvGjg8JyXgbcLQQrX2zZinMeJX7X7G0lEl
 f1Z1ItmdREvPlQdn/eIY+klzna2rg/bLSE1KRU+DlfWWPtwNjAAVtQGUM5HpnnDbhz3p
 0MXJ7kLDHDFmJMeUdTKlOL8I/dKBxVb+AAxzTD3965Cip9zVDhvghkF7dC8feu+mUZYN
 JGkGoMB3w15Iu1b1I4bLF239+YEAKhvTt2go2GgcjbsOnutAyjZhk+IxfsoPaBcO559l
 kh9Q==
X-Gm-Message-State: AOAM533lpM6NtxLBhcxcWYYblcyHQHHpIk/5ObS5NM8u/mTNtXddkKqo
 bfYpahiP5QrB5fsewVr1TYEroQ==
X-Google-Smtp-Source: ABdhPJxqWPN6haSrZ0MteEjdgcOMc9WlWpLXGGXo/0dQE9R3CbYiPB9JDg7Nt6YUIWmvZPTgcFCYmw==
X-Received: by 2002:a1c:1dd0:: with SMTP id d199mr4856wmd.7.1601558891796;
 Thu, 01 Oct 2020 06:28:11 -0700 (PDT)
Received: from amjad-ThinkPad-T490.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id m10sm8584950wmi.9.2020.10.01.06.28.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Oct 2020 06:28:11 -0700 (PDT)
From: Amjad Ouled-Ameur <aouledameur@baylibre.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH] reset: Add reset controller API
Date: Thu,  1 Oct 2020 15:27:58 +0200
Message-Id: <20201001132758.12280-1-aouledameur@baylibre.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201001_092814_450778_3E490CBF 
X-CRM114-Status: GOOD (  21.60  )
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
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-usb@vger.kernel.org, Amjad Ouled-Ameur <aouledameur@baylibre.com>,
 linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The current reset framework API does not allow to release what is done by
reset_control_reset(), IOW decrement triggered_count. Add the new
reset_control_resettable() call to do so.

When reset_control_reset() has been called once, the counter
triggered_count, in the reset framework, is incremented i.e the resource
under the reset is in-use and the reset should not be done again.
reset_control_resettable() would be the way to state that the resource is 
no longer used and, that from the caller's perspective, the reset can be 
fired again if necessary.

This patch will fix a usb suspend warning seen on the libretech-cc
related to the shared reset line. This warning was addressed by the 
previously reverted commit 7a410953d1fb ("usb: dwc3: meson-g12a: fix shared
reset control use")

Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
Reported-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/reset/core.c  | 57 +++++++++++++++++++++++++++++++++++++++++++
 include/linux/reset.h |  1 +
 2 files changed, 58 insertions(+)

diff --git a/drivers/reset/core.c b/drivers/reset/core.c
index 01c0c7aa835c..53653d4b55c4 100644
--- a/drivers/reset/core.c
+++ b/drivers/reset/core.c
@@ -207,6 +207,19 @@ static int reset_control_array_reset(struct reset_control_array *resets)
 	return 0;
 }
 
+static int reset_control_array_resettable(struct reset_control_array *resets)
+{
+	int ret, i;
+
+	for (i = 0; i < resets->num_rstcs; i++) {
+		ret = reset_control_resettable(resets->rstc[i]);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 static int reset_control_array_assert(struct reset_control_array *resets)
 {
 	int ret, i;
@@ -324,6 +337,50 @@ int reset_control_reset(struct reset_control *rstc)
 }
 EXPORT_SYMBOL_GPL(reset_control_reset);
 
+/**
+ * reset_control_resettable - decrements triggered_count of the controlled device
+ * @rstc: reset controller
+ *
+ * On a shared reset line the actual reset pulse is only triggered once for the
+ * lifetime of the reset_control instance, except if this function is used.
+ * In fact, It decrements triggered_count that makes sure of not allowing
+ * a reset if triggered_count is not null.
+ *
+ * This is a no-op in case triggered_count is already null i.e shared reset line
+ * is ready to be triggered.
+ *
+ * Consumers must not use reset_control_(de)assert on shared reset lines when
+ * reset_control_reset has been used.
+ *
+ * If rstc is NULL it is an optional clear and the function will just
+ * return 0.
+ */
+int reset_control_resettable(struct reset_control *rstc)
+{
+	if (!rstc)
+		return 0;
+
+	if (WARN_ON(IS_ERR(rstc)))
+		return -EINVAL;
+
+	if (reset_control_is_array(rstc))
+		return reset_control_array_resettable(rstc_to_array(rstc));
+
+	if (rstc->shared) {
+		if (WARN_ON(atomic_read(&rstc->deassert_count) != 0))
+			return -EINVAL;
+
+		if (atomic_read(&rstc->triggered_count) > 0)
+			atomic_dec(&rstc->triggered_count);
+	} else {
+		if (!rstc->acquired)
+			return -EPERM;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(reset_control_resettable);
+
 /**
  * reset_control_assert - asserts the reset line
  * @rstc: reset controller
diff --git a/include/linux/reset.h b/include/linux/reset.h
index 05aa9f440f48..ffa447d0d1d6 100644
--- a/include/linux/reset.h
+++ b/include/linux/reset.h
@@ -13,6 +13,7 @@ struct reset_control;
 #ifdef CONFIG_RESET_CONTROLLER
 
 int reset_control_reset(struct reset_control *rstc);
+int reset_control_resettable(struct reset_control *rstc);
 int reset_control_assert(struct reset_control *rstc);
 int reset_control_deassert(struct reset_control *rstc);
 int reset_control_status(struct reset_control *rstc);
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
