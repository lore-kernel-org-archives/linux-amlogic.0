Return-Path: <SRS0=WuYP=CR=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11F7BC433E2
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Sep 2020 07:54:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B569E20C09
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Sep 2020 07:54:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GmcXjJV+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="MxNjfFU5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B569E20C09
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/WM1fX57xrfJjX0f1V6dGoJ/ek0k6VclXKv8gkf9I7A=; b=GmcXjJV+dDroERHinf04Mwh6G
	58Z97WbxnKbHDBiqqmoiDdPGOW9uK9DFXKz8KRWV0qtcXw8nhl+YBvbV67tcUw2vIVPO6UPr4MobM
	vSZaa8P0WB1dgfpuIuIDC7uO1lzE0wzLDVFC7zQoOMxUaN+TxJr2a1tSllqUWFx+wPrxBuYuMF7b7
	T1vMbouwKy68wAg+mlDNhHnchWZMsHiS9uElwfnraY7X/AtLosswoJG4F16OIqNQVKl1qvP6AOivc
	4Xq/hsNtkFbPnBDhfyH4tEXzQyaQhkiHFdcpsUA2ImBEwC8lDZmNEvPxVIxTUZsjw+aTxjr5haG0J
	MQWzmrJgQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFYSY-0007N2-7l; Tue, 08 Sep 2020 07:54:34 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFYSV-0007L4-7j
 for linux-amlogic@lists.infradead.org; Tue, 08 Sep 2020 07:54:32 +0000
Received: by mail-wm1-x331.google.com with SMTP id c19so13748126wmd.1
 for <linux-amlogic@lists.infradead.org>; Tue, 08 Sep 2020 00:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/f+R+j91elfFPYf4zfHO7Bzdv43BgZ5CODvbZ0Vzlb0=;
 b=MxNjfFU5x28KJlZdrPqrtuP/t/v6fpMsOEGKTByYw9wYcIW0u58tAcThwi5E3fhxqB
 h21f/DHXzKl4OvbTBs3aSplhH2HVm6KfAHFRK5SZUmHpJR1dta3Aj0gP5K5CbBkPqK9z
 0x2pd1lMp81JR0y7njeN0eyfuVcHKkSKMFviptB0N2mLXjOWQ4tpYGJGg9BgWrEGv740
 Q1lfR/LQhdaE7+f41hH2B4x8Zm9GU2tWmojTn1qlBm3qzwcRnyR9ySDG+xvRyZ6DtsDw
 vxtKdPOFunXKV4iEh70MZOt8aCBPi89cWCv7xWN6VH0CoLMosxpvCCF4nyG2bA2GK5iM
 vAPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/f+R+j91elfFPYf4zfHO7Bzdv43BgZ5CODvbZ0Vzlb0=;
 b=AM8iqJv7b1lkt1AlWJzvX+AVknqXfoxcKDQx9QmdrclgFmGSDgmB7X2rYKVYrrqZB9
 8Vc+yEcCZ0k9ZaLa0U9f24a+kjPuLkyXuBuiUWTWmWXd7A+bXfxWLFepQ12jlIdXUYAJ
 z/FasNPGwK2b0ijp2Ho1OG09Y4YjBWd61pPPfu274QUMYKSw6zhFwlilQyZMPHy1E4Ti
 MQ/jtIwSsFqamX5gdbT1z7820a0tgtZn6CowNJuPGYYfGHbS27qIEr05MeoNXdVff19s
 xupLEemkOFcc5gtYVOsFyva6kFcV+J5mCfY71imDFkquRpsS2dvsoErV8ma4RMnDGXoL
 whug==
X-Gm-Message-State: AOAM53201qYvETl5f/QwY2bSmG7z0rAVI5l1rVWwV3FsI51aK/XE+4Pl
 YHddMZNovjUavldbc93V9RcCQcBxtNowlNj5
X-Google-Smtp-Source: ABdhPJw2+vRPCVSoCJ8uTyZkM4qdXjUF9o+idDfbH3aRRZ1MhJ6/KLpRbqP0cqmVYb5dpgJwHdOuUg==
X-Received: by 2002:a1c:4303:: with SMTP id q3mr3013678wma.158.1599551669694; 
 Tue, 08 Sep 2020 00:54:29 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5405:9623:e2f1:b2ac])
 by smtp.gmail.com with ESMTPSA id f14sm33788291wrv.72.2020.09.08.00.54.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2020 00:54:29 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: thierry.reding@gmail.com,
	sam@ravnborg.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 2/4] dt-bindings: display: panel-simple-dsi: add optional
 reset gpio
Date: Tue,  8 Sep 2020 09:54:19 +0200
Message-Id: <20200908075421.17344-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200908075421.17344-1-narmstrong@baylibre.com>
References: <20200908075421.17344-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200908_035431_317258_7C6B28CD 
X-CRM114-Status: GOOD (  10.88  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Simple DSI panels can also have a reset GPIO signal in addition/instead of an
enable GPIO signal.

This adds an optional reset-gpios property.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../devicetree/bindings/display/panel/panel-simple-dsi.yaml      | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
index c0dd9fa29f1d..4d08e746cb21 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
@@ -54,6 +54,7 @@ properties:
 
   backlight: true
   enable-gpios: true
+  reset-gpios: true
   port: true
   power-supply: true
 
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
