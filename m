Return-Path: <SRS0=YAuX=24=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4515DC282DD
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Jan 2020 23:07:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 164E120715
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Jan 2020 23:07:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="O16WwQ1Z";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="SzQP3Mkk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 164E120715
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hiIE3j2pFodsMYO1t+jbIlLKSEn+gVgymKHDpvm2P84=; b=O16WwQ1ZwfmETQ
	r13CbttkLRkEFCbT/Rws0jOgTtlU7VNCRIQhzwHxBi+NFoLdXrccwdejqnt8Oe7K53/o4WXIO9dPW
	vDfINu49cwEXIzDopUCdw7vuAnefkgFHHO/pU2KH+BHtP4mWsUAjX1CNHLu79FBoj9+rTODZ5Ntjk
	yxAUgWp60ckrE2hePDGCcQaGjuFROSElGlCOxfN8HuX7mbe2cvojcGHrzbrVQBMyhv5bJ5+UyUTbv
	oquj2pNsI4IUbrZPPokz8O2FI5hLV5owySN8dac0hA4K0S0CVwAUrOM9eBhMO2eBdqijjoZNiaW2S
	MlbnXpG7cr/Hcm23ACKA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ioxwE-0004A9-HC; Tue, 07 Jan 2020 23:07:02 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ioxw4-0003xU-NE; Tue, 07 Jan 2020 23:06:54 +0000
Received: by mail-wr1-x441.google.com with SMTP id g17so1435237wro.2;
 Tue, 07 Jan 2020 15:06:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UXJ/0vyPOcylwX7dQ7AqYqzbWcm6Xny6nu2+z0FOmf4=;
 b=SzQP3MkkW9JiVVLB0Q5AWl9ynYczk1eWo56lKzhjHMYAgL4dqVwYVe+d4zLq7IGG+E
 6sjyRLDJcEljD4GDsoPqvuOXsfPBIXaZlV/7JQOkyCuXehAwjJhNybHUYy5Z5vlzNnDZ
 ojm8VASMXfBBnvdvuzRV37VlFgzD5KE4fzvicM94upMV58FI4Iz7SwtNdHRMPFmsse7V
 TAIL1Kz1SjxRxXsrpRd8sbRc/pyYzPY08UVCol5DeDNVgOzhjeB1iuSUkO+ZbVO0xDl8
 rT/WVhULD1GLl7l7FXJord3q/+308mnMIkdoHgox2+tnRgVZhARDTbdy+O32aBsGmQQM
 Mkgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UXJ/0vyPOcylwX7dQ7AqYqzbWcm6Xny6nu2+z0FOmf4=;
 b=GQTPp137L0UnPnPjJdGhTHgOO3N+JUU8HJfd9F2mkCXyhLmP4oSuKDf6ReL7c4LjYf
 5mlJnbCZM/6SWc5xm+rk6BzSHU7K5R2unu1hoBrTtv/j5qRa5CUs+RezmZV++UFW+aby
 fx8v+TlwZKqcllX58urpyU+3qd/k1RzI3RaLqG9iORZlsND0iEZRcw2zBOPKZ1oi73Y8
 nfI+9Pmji3KWUGIh/hJw1MiZPp4kNwNyI8DDtc1IEBUgtj+l3Z321RcRM1PMLz/pzlCI
 N1VMBkzYtcssSDV7kTZaRnG1z33iUna9ZAk3PZ0ClkkxUr8VpFIUY7HApjJcQK/fb2zM
 EJ7w==
X-Gm-Message-State: APjAAAUMoCnFgk3q+uYR6N1tKC4akxf8C8+p7KeXoYsKsD8iAC5x/b0E
 urxHn4QAjJlq1ecwV9faqpY=
X-Google-Smtp-Source: APXvYqyTpkD+YLeAxyWAoG8+IkEVG2zuH4q7SHZOXRueqxuzGo3+htimrqNb87QNSjKXFAZDdhKYXw==
X-Received: by 2002:a5d:4984:: with SMTP id r4mr1253219wrq.137.1578438411229; 
 Tue, 07 Jan 2020 15:06:51 -0800 (PST)
Received: from localhost.localdomain
 (p200300F1373A1900428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:373a:1900:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id g21sm1335912wmh.17.2020.01.07.15.06.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2020 15:06:50 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: dri-devel@lists.freedesktop.org, alyssa@rosenzweig.io,
 steven.price@arm.com, tomeu.vizoso@collabora.com, robh@kernel.org
Subject: [PATCH RFT v1 3/3] drm/panfrost: Use the mali-supply regulator for
 control again
Date: Wed,  8 Jan 2020 00:06:26 +0100
Message-Id: <20200107230626.885451-4-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200107230626.885451-1-martin.blumenstingl@googlemail.com>
References: <20200107230626.885451-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200107_150652_754237_134CC1F2 
X-CRM114-Status: GOOD (  16.44  )
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-rockchip@lists.infradead.org, daniel@ffwll.ch,
 linux-amlogic@lists.infradead.org, robin.murphy@arm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

dev_pm_opp_set_rate() needs a reference to the regulator which should be
updated when updating the GPU frequency. The name of the regulator has
to be passed at initialization-time using dev_pm_opp_set_regulators().
Add the call to dev_pm_opp_set_regulators() so dev_pm_opp_set_rate()
will update the GPU regulator when updating the frequency (just like
we did this manually before when we open-coded dev_pm_opp_set_rate()).

Fixes: 221bc77914cbcc ("drm/panfrost: Use generic code for devfreq")
Reported-by: Robin Murphy <robin.murphy@arm.com>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/gpu/drm/panfrost/panfrost_devfreq.c | 22 ++++++++++++++++++++-
 drivers/gpu/drm/panfrost/panfrost_device.h  |  1 +
 2 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_devfreq.c b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
index 170f6c8c9651..4f7999c7b44c 100644
--- a/drivers/gpu/drm/panfrost/panfrost_devfreq.c
+++ b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
@@ -74,6 +74,7 @@ static struct devfreq_dev_profile panfrost_devfreq_profile = {
 int panfrost_devfreq_init(struct panfrost_device *pfdev)
 {
 	int ret;
+	struct opp_table *opp_table;
 	struct dev_pm_opp *opp;
 	unsigned long cur_freq;
 	struct device *dev = &pfdev->pdev->dev;
@@ -84,9 +85,24 @@ int panfrost_devfreq_init(struct panfrost_device *pfdev)
 		/* Optional, continue without devfreq */
 		return 0;
 
+	opp_table = dev_pm_opp_set_regulators(dev,
+					      (const char *[]){ "mali" },
+					      1);
+	if (IS_ERR(opp_table)) {
+		ret = PTR_ERR(opp_table);
+
+		/* Continue if the optional regulator is missing */
+		if (ret != -ENODEV)
+			return ret;
+	} else {
+		pfdev->devfreq.regulators_opp_table = opp_table;
+	}
+
 	ret = dev_pm_opp_of_add_table(dev);
-	if (ret)
+	if (ret) {
+		dev_pm_opp_put_regulators(pfdev->devfreq.regulators_opp_table);
 		return ret;
+	}
 
 	panfrost_devfreq_reset(pfdev);
 
@@ -95,6 +111,7 @@ int panfrost_devfreq_init(struct panfrost_device *pfdev)
 	opp = devfreq_recommended_opp(dev, &cur_freq, 0);
 	if (IS_ERR(opp)) {
 		dev_pm_opp_of_remove_table(dev);
+		dev_pm_opp_put_regulators(pfdev->devfreq.regulators_opp_table);
 		return PTR_ERR(opp);
 	}
 
@@ -106,6 +123,7 @@ int panfrost_devfreq_init(struct panfrost_device *pfdev)
 	if (IS_ERR(devfreq)) {
 		DRM_DEV_ERROR(dev, "Couldn't initialize GPU devfreq\n");
 		dev_pm_opp_of_remove_table(dev);
+		dev_pm_opp_put_regulators(pfdev->devfreq.regulators_opp_table);
 		return PTR_ERR(devfreq);
 	}
 	pfdev->devfreq.devfreq = devfreq;
@@ -124,6 +142,8 @@ void panfrost_devfreq_fini(struct panfrost_device *pfdev)
 	if (pfdev->devfreq.cooling)
 		devfreq_cooling_unregister(pfdev->devfreq.cooling);
 	dev_pm_opp_of_remove_table(&pfdev->pdev->dev);
+	if (pfdev->devfreq.regulators_opp_table)
+		dev_pm_opp_put_regulators(pfdev->devfreq.regulators_opp_table);
 }
 
 void panfrost_devfreq_resume(struct panfrost_device *pfdev)
diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
index 06713811b92c..4878b239e301 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.h
+++ b/drivers/gpu/drm/panfrost/panfrost_device.h
@@ -85,6 +85,7 @@ struct panfrost_device {
 
 	struct {
 		struct devfreq *devfreq;
+		struct opp_table *regulators_opp_table;
 		struct thermal_cooling_device *cooling;
 		ktime_t busy_time;
 		ktime_t idle_time;
-- 
2.24.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
