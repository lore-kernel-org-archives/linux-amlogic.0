Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DB2CC9831C
	for <linux-amlogic@archiver.kernel.org>; Thu, 24 Sep 2026 11:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SnOxMg02YyW0zuzfiPbj3rfXnVrIL3qAVEKam/vLxQI=; b=0iVie4Mr8a1EMs
	8I/SkfuYGYIKVq1GhNQl7JulMnxp9HyZlwwJOKOiB7EVODn7ze9huiOBsrJbQF226EC3kD3IwWM2w
	L4aapfcalhmncBchvUyYsvKxrButlTzEFn8L5HrZEnBRp/G0Uajt+jNqRppaAiIrX0A1IY/W94Y0a
	e8vv+xrJS4DdN8SQmDFEneQqLKEqWTKbZMwZXN4pSaCngCy1sEsjFI0F2k8uOiezh0lYrSZb9OErc
	i+GsXYLNJVoQSSi4DZQa4eisEnmtZxIS7B478DsPpwZj+OSIBdNsZm2QvxzoCAgtkOR9B9MeRI2Bv
	mbAPWzhVygwuoQIIANAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9hFt-0000000AoIf-1q9z;
	Thu, 24 Sep 2026 11:04:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9hFs-0000000AoIH-3Zoy
	for linux-amlogic@bombadil.infradead.org;
	Thu, 24 Sep 2026 11:04:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=BQaBTh1+PqRhhhrSlt9lMnh9oT4JHlghqyyhXL51U2o=; b=iguLbD8pw5nLomhga44z0cCQKv
	/Rvw4Un5K/+7zg6TSU5qUbw5pWlBVLceVb4viNJKrFeY8BO4GWH5Zjrnazn1uF5WOhyFMwHjX9s9N
	xcdFY8pJBTYZDQnJsui3/SksQda6Xh05DMXB9f+EnRW2CtauhQX4umZsTiY39Ugz2H8DDV+qiuG8V
	JSUy4b7yjmyg4/6IoC1ERER9jf0id7xAoKyKQ3LLnnDCyToQXpoZJbc/4B/qLbwAADlyZdV/JzBlu
	SLdNiNeU4tuUDz99ehWxkxxiik4b4pO3qNeA4yQLw0OUr+fjL6eJ3Gb3lp/ZKIs5lgRy1+w0WWxlo
	d0IEOXAw==;
Received: from mail-pz2-x10.google.com ([2607:f8b0:4864:3b::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9hFo-0000000Fsb9-3m2s
	for linux-amlogic@lists.infradead.org;
	Thu, 24 Sep 2026 11:04:43 +0000
Received: by mail-pz2-x10.google.com with SMTP id 41be03b00d2f7-cc1cea4c79fso600416a12.0
        for <linux-amlogic@lists.infradead.org>; Thu, 24 Sep 2026 04:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790247876; x=1790852676; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BQaBTh1+PqRhhhrSlt9lMnh9oT4JHlghqyyhXL51U2o=;
        b=o4i8hUW/RMrVaIglsZD05CMEtll5SVaZ506PT/HfN4l9ZFGbYSkzHtdSLuoR+Mcr3v
         Tj3nXdZrkYPqf/WUBHulP8eMERGOyvLoZ4mRWEVW26q41b5JRTgQkMAdTmjmO39oY4Em
         wAOpEQNayRvJdxAFh/t1KstOD8GS6GYXMBCdRlN9RD6jyb4obwpGpQEqsQvqOM/DDO/G
         +JQ1UR9DKUJs1nmROkKrt1UUgpQbWw1xImVKqPZzVCuoNVrvWbRn+T0tPZpnIUJLGCOe
         Vk9NbZgNbYU0lgw1Ox38NKZuZhnkF0+9bgE1vmj7MNTLq0nsHzO4UC2KtMb5tHxAgQQB
         lvzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790247876; x=1790852676;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BQaBTh1+PqRhhhrSlt9lMnh9oT4JHlghqyyhXL51U2o=;
        b=Y1aS0BJ6DwkA1dXOMiqbFFp0SjvoXXM/kDUbo6nK9vCNHQSag9Js7xsEdVvkEtEv2J
         00SZeer47VM+/gwYqpgrgN9y7l1jfMXvWxAhB9M3srAN9+Nm+XHqULY5jUpaQv2eRUEa
         mRvo/NSTaNZzgHECX9/TNtqAAeBVLPudX+gVaOJ5+IL1XGd5/GuSASvuOuyBHa+zuioD
         /IC9MCmU8o/CEGO+WcxLIgR40drb87HAHbdvDxrRUtFB9ZwZ86ohnS9Z6hoOmNLTwBmM
         blwwrM/ehZWcGPqNznt1QjCM11zQnTH2hu3iGl2LiiA5dL8zfbQyqDu+h0ur1gYxtrp0
         RS9w==
X-Forwarded-Encrypted: i=1; AKwUvBy26lRzNTdhszA+BedGSXRKSAfI9lwr3JDsUVfPoHpIwvEwAx94v29gWgLKjCibJnKqwl4rpoPIAOoA0Qdu@lists.infradead.org
X-Gm-Message-State: AFuF++n/Pim3XUmkzVsxSVu+7R2Fxmr1WBCrDl7FO9d4VXRQK4psnHb3
	IGRD8mixh6ncGw7soSwnJSxfmuvWlVtv3GwJfMxik1TYaqXB+kIS/ONL
X-Gm-Gg: AYBFou2FIbMO3Ws+ySeCsmsebzKRWJry188qs5BWax+o9zVNF7qSXcXWbppsV4epW01
	p2osU2ppqOlFhPlMncN0bNcv/ilwbmQ495tqiUW2oaGWek6Yf0uhDkAvYqrYVy14HK6l9YurnVD
	QvUXp+vQAD86E/ecYJqPk5bArx7NoiQy781xg5xBs2UuvkvOkJEviSRIPX5LalvJIMeFdyGhqBd
	Njzsoer2FPrzNwjArFP1HqSJzcNmGXp+pYSWP3ZqD19KixR5AunncHhy3rin+ovo6Vi8F/RvrP1
	eEe3uTfNNL4eKmtPJnDhUhyw4Nd3AfLyGfrPNH/zoZ/5pltQ+1WfZd51EZtft1V6irs4DtpPIyo
	wUFIpfOWmaOl7lz5+InyLOtGbsAD9ylsfbmo6oZWzrl/J1Owu1/L0iQdmRMIucyyInqmFEkogli
	ddRq1yMBViT/QpjKTf/hDSQdx2Fe6FjSuXJlPaH9fnrKjKwnany5hb7jQ=
X-Received: by 2002:a17:90a:cf84:b0:3a0:9eb1:7300 with SMTP id 98e67ed59e1d1-3a09eb175a7mr737462a91.49.1790247876472;
        Thu, 24 Sep 2026 04:04:36 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0974ec5dfsm4356860a91.3.2026.09.24.04.04.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 04:04:36 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Thinh.Nguyen@synopsys.com,
	gregkh@linuxfoundation.org,
	neil.armstrong@linaro.org,
	khilman@baylibre.com
Cc: linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	felipe.balbi@linux.intel.com,
	lgs201920130244@gmail.com
Subject: [PATCH] usb: dwc3: meson-g12a: disable VBUS regulator on remove
Date: Thu, 24 Sep 2026 19:04:29 +0800
Message-ID: <20260924110429.1557653-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_120442_273443_6106B868 
X-CRM114-Status: UNSURE (   9.11  )
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

dwc3_meson_g12a_probe() enables priv->vbus when the optional regulator is
present, but dwc3_meson_g12a_remove() does not perform the matching
regulator_disable(). The probe error path already disables the regulator
before rearming the reset control.

Disable priv->vbus in the remove path before reset_control_rearm() to
match the cleanup performed by the probe error path.

Fixes: c99993376f72 ("usb: dwc3: Add Amlogic G12A DWC3 glue")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/usb/dwc3/dwc3-meson-g12a.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-meson-g12a.c b/drivers/usb/dwc3/dwc3-meson-g12a.c
index 4d611c08e8a4..7ca6fb89027f 100644
--- a/drivers/usb/dwc3/dwc3-meson-g12a.c
+++ b/drivers/usb/dwc3/dwc3-meson-g12a.c
@@ -851,6 +851,9 @@ static void dwc3_meson_g12a_remove(struct platform_device *pdev)
 	pm_runtime_put_noidle(dev);
 	pm_runtime_set_suspended(dev);
 
+	if (priv->vbus)
+		regulator_disable(priv->vbus);
+
 	reset_control_rearm(priv->reset);
 
 	clk_bulk_disable_unprepare(priv->drvdata->num_clks,

base-commit: f03c39de3a1307371a4032757cd1732e91087c7d
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
