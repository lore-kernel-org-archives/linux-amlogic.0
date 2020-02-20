Return-Path: <SRS0=VXFk=4I=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5346C11D05
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Feb 2020 15:39:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7089B2071E
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Feb 2020 15:39:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fRD/hjuA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SWh6C6VJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7089B2071E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=EK2vY5ygxTxtEq4SS1GRvMNFrUwTUKcc0PonRDsZYH8=; b=fRD
	/hjuAzfOt8J6Ic7EgFHlvMfZkkQZqbQJO3SGXfwliIB8j6FR0Ljk+K+VjdyClimOjYADseB6IZuVS
	mzokqmVpmTz1mxXhuHD0Sv2hVfkxw3pJ/4QSlBqdKCsN2F0Q2QykjhsA96OCExU0cIXAc9Evcx2Y3
	q76K6T4tDi7bl8sxMQG2eLQosxgHYD3Mcvdw+Zm4caZe11Q6Hvv6KFjwP3cy12nIrd9wOrG9KPNOG
	bVxmIj/d+8+XZbsYnic7O1IAVQzhqc3FuDnaD7hSesBleUo4D9FBiWP2HOvBTNAuW6fiYKmZCESiO
	JsIPryhOLIHkzSou1oDZ8yZU/C11O7A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4nuq-0001c1-EG; Thu, 20 Feb 2020 15:39:04 +0000
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4nuj-0001VM-10; Thu, 20 Feb 2020 15:38:58 +0000
Received: by mail-lf1-x144.google.com with SMTP id n25so3480760lfl.0;
 Thu, 20 Feb 2020 07:38:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=LTSTcBgb9GGJQllk/olrBiwlUBbpPRVx+sqTluRMzLs=;
 b=SWh6C6VJobFRpWMlRyr9Ir9oQp9/szZB1jyFZRDk+ZrhKC2bkfTXQMYeQIARVZpm0r
 TOWj0G3U9aDhmnR+8o4jlbZcdL2sRDk4+lj+C5B+MRk9b8tnmMTQMtV1PxQJNzAw2pwT
 Tx8mSXkH5ETJp6KyFGAEpyirq/WzJa9B84AWRBKl4vLKKx2nbH+eLeA4m0mCJrZlAQsl
 1IQv8vu92Opd0LdrF68FanQmRXzvMFodiA3UufFAGiByXZEEJaZxOuPcMycNhsYyCumo
 SW2QQK8xcNAmu6vt4hwdcJcab+Dh+uqtqPa22KHYu/HBc7gGoyLNhnrKnFbGvgTvOxuj
 SM2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=LTSTcBgb9GGJQllk/olrBiwlUBbpPRVx+sqTluRMzLs=;
 b=XrgPj/RfiF5COe2W/t01JHbsJv/upgKdISUgQmTJwE0jXaTWF7fGqklnlozsAVvHuY
 LpAg0j5CcvnBJ99ogoTxGKGe8hVb1OU2NW/ZTQ6FfkAcOJbQCeGEEZ1OG3EynxYbwAQe
 w5gtKqD+4007wYAmCZFuuiJY7+DfnNRBK6qhxY1HMojhLk/x6g7Zag8CoVEX8IPiG0+5
 vLemDLKcHPUo9Aj4Af+BxvL0OFBK8CVRcOSydd8zL0ZV5SfqJd9sHgvH1vyleOpSTXtQ
 9mLPyJ9n4D3ZjAhOXye0NjIvrmgLQ3C9u//+LXF1Uq0mgsWSVpX4Bscje4aIJS4rRAy/
 aXGg==
X-Gm-Message-State: APjAAAUwsZaP6B8GxCCH+MMLQD3YEY8JzoHUh6YU1U8Pa2ZUQM0TgWA2
 eM2ZxVA0sbi0jrBkEvuwl48=
X-Google-Smtp-Source: APXvYqyxn2s0jyOgdFy3o8g+SEhzmAWcmuIT+Q8DAV3EzVkzptKp/H9zuaGay43R3j85QjPRMaUAeQ==
X-Received: by 2002:a05:6512:6cb:: with SMTP id
 u11mr7885481lff.69.1582213135029; 
 Thu, 20 Feb 2020 07:38:55 -0800 (PST)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id f26sm2000083ljn.104.2020.02.20.07.38.52
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 20 Feb 2020 07:38:54 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: meson-gxbb-odroid-c2: add rc-odroid ir keymap
Date: Thu, 20 Feb 2020 19:38:05 +0400
Message-Id: <1582213085-11656-1-git-send-email-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200220_073857_068596_78DD43A8 
X-CRM114-Status: GOOD (  11.17  )
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
Cc: Christian Hewitt <christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add the rc-odroid keymap to the Odroid C2 device-tree.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
index 6ded279..b46ef98 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
@@ -248,6 +248,7 @@
 	status = "okay";
 	pinctrl-0 = <&remote_input_ao_pins>;
 	pinctrl-names = "default";
+	linux,rc-map-name = "rc-odroid";
 };
 
 &gpio_ao {
-- 
2.7.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
