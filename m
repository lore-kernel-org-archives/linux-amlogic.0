Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A2BDC05027
	for <linux-amlogic@archiver.kernel.org>; Fri,  3 Feb 2023 23:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MMSpUvq20gMKGLcqA0tCXZ9ta72QelP8yS7tb9nyltw=; b=Ui3bstG5ctVvSj
	xhYCg0Ic/YJy8nqreCqiY30xThlhq/uV9VCgq1Vhe/hCSM+kHHhWa8uvaq9F4S5PWPITBg8FkVeKc
	EpqarsYPflchudgFo4COLFz0y0RGAjcHy7l5gA4P1sZIdajHd+XrIB7dsxFVhHmrjRhnzQEOXxH51
	aDNl0kUqgGO0DwYJ2/BKu4eHKngczmJxJ9ISdUSNWbXpaSQ2IBrRzUc4TeTZJ16j6OzBvT2AIY4td
	r/CqzUJk+DkEbnvuZLOK6It7WAEozhLgqaoOwUL/SZIUVk17+64faQTjl2xDXfrqiQnkfvQrU7vfG
	kpBUiln6s+f1CCkit5Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pO5tc-0043rQ-JZ; Fri, 03 Feb 2023 23:55:08 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pO5tZ-0043p2-Gq; Fri, 03 Feb 2023 23:55:06 +0000
Received: by mail-ed1-x529.google.com with SMTP id x7so6690566edr.0;
        Fri, 03 Feb 2023 15:55:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IjF+AyumbkCroYCpRQKcqM9cxRCnUovfKnLOGpRIN+s=;
        b=FKCCAVUddag1opHQeKvMv4wdWqCwre69SRK8n27XialLZjd8H6hUcOfTvJG1KXcUaA
         tXR6HisbAoAlPxxz2fS6sm2qwptrTYIzVe4K/PVUBSPFHIkrH2P2ASQvlTDxxE4xM5Uy
         Qrx1XfN11zQb0leJtFcptPQYZCHVH1FB4Za8si9DZpFu/S7yOfloqRey3MT7FgMMgiQS
         oci9TUCK2JRiS6IA8gQZDv87KzAhiY7U4kjtAvN4xrkQXybNHqFpWsU/QTPNGwPsgbAd
         G1xUZyDFlms2Sg1jr01BH18ADmhQ2TPgr/9nKkltCMHUKOk1syS7Z9+Fc+Nl+B8eFIOM
         2riQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IjF+AyumbkCroYCpRQKcqM9cxRCnUovfKnLOGpRIN+s=;
        b=Uci8roKACfH0B6AOjK7aJ3MQNPh3g2x9xcM/LV1i59E/i9d6wBpTkFIjhEdKdWwbkv
         Mzod/EQmHPmbkHnBfkfMD31+M5CDHe/+9nQj4vc30oEFay9PBP9V7+TpwTH7KHVzq3bk
         P9h6AefZ3woigFB56ghcX7FF/T09i1zuMKVFp1vYGutmHuWbo3oCKHOrSZ9O5Hw0FNRV
         q9lSz5aYOzXD/pwGkugmoL8mxJX4g7Ez19n2W5LiDAlbxyFwNhG/oLXHK0G+ztijuq+n
         +FLqnszdbthL8pgMnezdTQcOnoQDVHs0X+rLt/jhCRjpsPPsmZj7gw0XDPYGfYeQuO/D
         PQOg==
X-Gm-Message-State: AO0yUKUHK3NLNLJ+KvKbGGHxb03xZycNdx8yl4DBEh+5/mYABzli1Yuq
	GwS9t2Aq/ej2Q67JXgTA490=
X-Google-Smtp-Source: AK7set/8EtO/rSBe+ssFcgZE1P/ihXSBguQMxtMY5jcbuGFFuR8NJaiNvM//B+KsvSsAkT7LfrU9FA==
X-Received: by 2002:a50:aacf:0:b0:49c:fdd2:a47d with SMTP id r15-20020a50aacf000000b0049cfdd2a47dmr12624790edc.37.1675468498814;
        Fri, 03 Feb 2023 15:54:58 -0800 (PST)
Received: from ?IPV6:2a01:c23:b81c:5800:95fd:ccbf:6c44:23f7? (dynamic-2a01-0c23-b81c-5800-95fd-ccbf-6c44-23f7.c23.pool.telefonica.de. [2a01:c23:b81c:5800:95fd:ccbf:6c44:23f7])
        by smtp.googlemail.com with ESMTPSA id r17-20020a05640251d100b0046c7c3755a7sm1792895edd.17.2023.02.03.15.54.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Feb 2023 15:54:58 -0800 (PST)
Message-ID: <6d8f9fdc-7c9e-8e4f-e6ef-5470b971c74e@gmail.com>
Date: Sat, 4 Feb 2023 00:53:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: [PATCH 1/2] mmc: core: add devm_mmc_alloc_host
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
References: <e7880df5-43ab-d6b5-0ac3-440adfb12808@gmail.com>
In-Reply-To: <e7880df5-43ab-d6b5-0ac3-440adfb12808@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230203_155505_593563_BDFC8593 
X-CRM114-Status: GOOD (  11.18  )
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

Add a device-managed version of mmc_alloc_host().

The argument order is reversed compared to mmc_alloc_host() because
device-managed functions typically have the device argument first.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/mmc/core/host.c  | 26 ++++++++++++++++++++++++++
 include/linux/mmc/host.h |  1 +
 2 files changed, 27 insertions(+)

diff --git a/drivers/mmc/core/host.c b/drivers/mmc/core/host.c
index d17eda753..6a7475ad7 100644
--- a/drivers/mmc/core/host.c
+++ b/drivers/mmc/core/host.c
@@ -588,6 +588,32 @@ struct mmc_host *mmc_alloc_host(int extra, struct device *dev)
 
 EXPORT_SYMBOL(mmc_alloc_host);
 
+static void devm_mmc_host_release(struct device *dev, void *res)
+{
+	mmc_free_host(*(struct mmc_host **)res);
+}
+
+struct mmc_host *devm_mmc_alloc_host(struct device *dev, int extra)
+{
+	struct mmc_host **dr, *host;
+
+	dr = devres_alloc(devm_mmc_host_release, sizeof(*dr), GFP_KERNEL);
+	if (!dr)
+		return ERR_PTR(-ENOMEM);
+
+	host = mmc_alloc_host(extra, dev);
+	if (IS_ERR(host)) {
+		devres_free(dr);
+		return host;
+	}
+
+	*dr = host;
+	devres_add(dev, dr);
+
+	return host;
+}
+EXPORT_SYMBOL(devm_mmc_alloc_host);
+
 static int mmc_validate_host_caps(struct mmc_host *host)
 {
 	struct device *dev = host->parent;
diff --git a/include/linux/mmc/host.h b/include/linux/mmc/host.h
index 8fdd3cf97..812e6b583 100644
--- a/include/linux/mmc/host.h
+++ b/include/linux/mmc/host.h
@@ -527,6 +527,7 @@ struct mmc_host {
 struct device_node;
 
 struct mmc_host *mmc_alloc_host(int extra, struct device *);
+struct mmc_host *devm_mmc_alloc_host(struct device *dev, int extra);
 int mmc_add_host(struct mmc_host *);
 void mmc_remove_host(struct mmc_host *);
 void mmc_free_host(struct mmc_host *);
-- 
2.39.1



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
