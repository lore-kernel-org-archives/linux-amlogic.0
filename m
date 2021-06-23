Return-Path: <SRS0=X5xV=LR=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93621C2B9F4
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Jun 2021 02:45:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 651F760E0B
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Jun 2021 02:45:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 651F760E0B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ANtg7+/V6B5ava37SWYO2OF6Xnm+YG+uZfBbPohYLvY=; b=yZQNGnoqNCO3MI
	tmG+RWRNLy+oNKHX7Ko46Qg08bCOJez5ZVFTU7dmx4gp+Nr8gyFNeI1XXP53RFXo49KDpaZxeygte
	NQ6ZUHXL1T4h2EZGf3KwMXNELgFRftw537x81lFXrjr3UsrT6X/k4VIhxhSCVZe7RLxjBjqy4dp0f
	a9ycoU/wSQHGTaV6oa5XQPGYxJJdpKxQYDEcPaivbgUr14CuBvaVwDlP2KWO8wUSU2zS9c7kcrhPL
	Kfv0OIwUK76jE22u2bjK+s7rzBuhDKOkKJj96GqYLxyQyUPgePdsxwlQDweTx1Q9rELm8zCEC9YH9
	///EKWmrQadbH1l0L5rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvst3-0093lR-VO; Wed, 23 Jun 2021 02:45:09 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvssq-0093ih-6A; Wed, 23 Jun 2021 02:44:57 +0000
Received: by mail-pf1-x42f.google.com with SMTP id y4so1126013pfi.9;
 Tue, 22 Jun 2021 19:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1t1JCMbZ7H8AYhNf5B3sG0rOvYwG5DgsfZBnh4OVPvs=;
 b=cXYORpQtVJdzCcURXhy4rLlvxgRxlfwkJBB0Nyj6MwjbG5EaNtfZx8C/S0NpjsuYNE
 pJoCGUOG+clKT4Wl9YKDIz97wLYxyLGrsyvUmSEsDckbDjaYyuolafQ/wbE16z5dhO4O
 rgr4tLiT1ALz2qE1VVgyVGMivCP9I9OjCsBQrMsSkDRMSBbCeWN/r8M6ojzD68JK9cBh
 01FM584mkb2AszQczhXnmdpMI/7CRlIXmvYWmKt9lukkfO4Jd37BbOLNApHd3tlGCaEA
 WW6MYwRfXdvKUFggSRlOxg6xy1WUVk+djvNrIpIpq3RNMNly5gdm4dr1pHJOFKjVYSFZ
 sVKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1t1JCMbZ7H8AYhNf5B3sG0rOvYwG5DgsfZBnh4OVPvs=;
 b=cEmtqP5gumS92sfRSdJyNaz82WptagYmpubQB43EX85Z/AxqjIuIUxWX2Jl7HVc2HW
 6t4yDF33ivMVJJtxUvLFhD7dC31tSPC+HLvE216OwmXjybDj7SRaFt5LbucTvKt9dzD+
 I4Hola7ffnHdlCsdrkbwYoDfcn4Fa7mkpz/ypb83tuLEfcB2jyBoWKwV1DfWVTQL53m5
 66DwpSb6pgy4h4blBbeBTDTYUcRvmf50f9M0S+i+z8p4nqURfMdPYsfWakYW1DQ19+OJ
 m2hjTpGuHr/T4zWdfxT9s8n2RrOPS8/EbCdVPrw2XdgRCDmRjcKBW592AMVxsHTd+lFi
 50JQ==
X-Gm-Message-State: AOAM531AvJC1piQk1/Agm9fFiQqrEfasC0OLLR+VCwO72DzoV+Xy02hJ
 BCmKotDid33RtwgL5dKwOAiHkCOv/C2lsKIR
X-Google-Smtp-Source: ABdhPJyZgfUKL63O+Xw5p7Bwz0pnfFl5NrhCmCzvLTq213sw02oIq14awyEbyEGd5TZLB9xKtafVhQ==
X-Received: by 2002:a63:ff1f:: with SMTP id k31mr1581554pgi.315.1624416295423; 
 Tue, 22 Jun 2021 19:44:55 -0700 (PDT)
Received: from localhost.localdomain (104.194.74.249.16clouds.com.
 [104.194.74.249])
 by smtp.gmail.com with ESMTPSA id z17sm556307pfq.218.2021.06.22.19.44.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jun 2021 19:44:54 -0700 (PDT)
From: Artem Lapkin <email2tema@gmail.com>
X-Google-Original-From: Artem Lapkin <art@khadas.com>
To: narmstrong@baylibre.com
Cc: wim@linux-watchdog.org, linux@roeck-us.net, khilman@baylibre.com,
 jbrunet@baylibre.com, christianshewitt@gmail.com,
 martin.blumenstingl@googlemail.com, linux-watchdog@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, art@khadas.com, nick@khadas.com,
 gouwa@khadas.com
Subject: [PATCH 0/5 v2] watchdog: meson_gxbb_wdt: improve
Date: Wed, 23 Jun 2021 10:44:24 +0800
Message-Id: <20210623024429.1346349-1-art@khadas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210622_194456_281117_C69DFE62 
X-CRM114-Status: UNSURE (   6.64  )
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

Try to improve meson_gxbb_wdt driver to common view:

* Remove watchdog_stop_on_reboot (still can be activated by
watchdog.stop_on_reboot=1) i think this driver configuration more useful
becouse we can get reboot waranty for abnormal situations on shutdown stage

* Added timeout module param same as in other modules
* Added nowayout module param same as in other moduels
* Added missed watchdog_stop_on_unregister call
* Print watchdog success driver start status notification

Artem Lapkin (5):
  watchdog: meson_gxbb_wdt: remove watchdog_stop_on_reboot
  watchdog: meson_gxbb_wdt: add timeout module param
  watchdog: meson_gxbb_wdt: add nowayout module param
  watchdog: meson_gxbb_wdt: add stop_on_unregister
  watchdog: meson_gxbb_wdt: add register device status notification

 drivers/watchdog/meson_gxbb_wdt.c | 24 +++++++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
