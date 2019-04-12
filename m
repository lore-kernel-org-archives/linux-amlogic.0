Return-Path: <SRS0=tjuu=SO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3A44C10F0E
	for <linux-amlogic@archiver.kernel.org>; Fri, 12 Apr 2019 10:05:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A54F42084D
	for <linux-amlogic@archiver.kernel.org>; Fri, 12 Apr 2019 10:05:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uZMD56vP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="t3TeMuZJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A54F42084D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cpSWm/xsyyTZdcXyUWLcc+QQS62djXian8K4XAngmOw=; b=uZMD56vPJuAotb
	n9eLNg1y5DH0sUfFudZfA8P9+1biJxNXtixv5NMQUWWun2PDpZOJ9A8zA2sthYN9+0bqS/2dmWQEw
	/5h6ghaAVZalMIU0tgPAWf6/LdsWxoBIJvywHp5LV9TzD9BSvXGSGZjNZqCKf0HE9Wd54Ru8Gf7fU
	IoZKcbvG2HgDczMKnpNM/uB0SYYaXBZntmItAbp3QW2NEfYbH+/TI7o8BS4b23dD/OpDRbjA7wA06
	bG3J9Ov2lKSPFX9mRDiw5ajlexT0cXoT7KOFvFUaRT5dp79f5l3DZIV8rhI0LC9rpdYBuPMeoJY7H
	sK9aVg7lF+9hWc+D22hQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEt3j-0001nM-HD; Fri, 12 Apr 2019 10:05:23 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEt3h-0001mH-SZ
 for linux-amlogic@lists.infradead.org; Fri, 12 Apr 2019 10:05:23 +0000
Received: by mail-wm1-x341.google.com with SMTP id q16so10476933wmj.3
 for <linux-amlogic@lists.infradead.org>; Fri, 12 Apr 2019 03:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=h9oRU67TXfzeCkq2JVzW+KPcLdM2vd0o+Xe4sIhUQ0Y=;
 b=t3TeMuZJhreM+IMmCK7XXWabF0K1fk+4iC5ZqaPY4p4ZZJX0RMYZ5L10jL4Gz3lbm2
 wAh+T9S9lDdw38kSJ/r6OmUrrFNpNwb/NYi6d+kJB5JCKzu9xlYoZ9w0eM3S3Yj3eiqd
 D/7crDj4jOqvOnkWolbZVhzDKE3/BmOLWzC3aRy48MsPqIGx/L3DD+FKePXHV6MGvA7i
 lwQGa7KklkaMuqsgVpxlAbRthGrXYaDgkObHWK+9RVXvNe6EfVWcj6vEfyuwS2a1m4wD
 6nBCdgnAjsNlPiujTVM3gct3LkH7plsMwYXDOuwzJKMe7v8RWdxtegizwALlB9DNAiLG
 uApg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=h9oRU67TXfzeCkq2JVzW+KPcLdM2vd0o+Xe4sIhUQ0Y=;
 b=HmURURufr5wamXWzhNLaQ5SJ8P3wTzh+M0m/2q/s3C5D+pF2nE7vn0A+d7AfIoOwjz
 X4Er5rXzjhE2dCdx3uXzIOnG08qUfcZRCskh0jbXM5WCiUDFiwmikRqQFcXWdID52QzE
 HI/9MI0L/mNFPfSbncrri5PUMA5argAsGSfUD4pNZPwUhm8gA+BdIfPxk5EtzBflP9zl
 p4ld3LKL3gNtMVReej1q2RpyMKKCUiWtrIK/lGjJ3po47mtdLOStiYr/bszhp+t/yNp1
 fpZA3sFiocIJKmEsBxuQt4RGFid6ri5o4sCLawQBNQN/m6Ng3pyk7KaWa5JmThftGjTH
 5amA==
X-Gm-Message-State: APjAAAXioTMJbXI9A/FaCqtcI9JG4tpjuY2F8BREf6FxXsDoCVmzsuID
 0cHnt5vNkV76DSno21dZ3LZfNQ==
X-Google-Smtp-Source: APXvYqzvCkhWmt4EPwvJ6bwcIPF7UffB7hQRZHVhI03hbEURPw95CowtQWLw6eN3XaZd24YmaaKqeQ==
X-Received: by 2002:a1c:a00a:: with SMTP id j10mr10997480wme.15.1555063520140; 
 Fri, 12 Apr 2019 03:05:20 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id s10sm10545602wmh.0.2019.04.12.03.05.19
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 12 Apr 2019 03:05:19 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 0/3] arm64: meson-g12a: Add Infrared Decoder support
Date: Fri, 12 Apr 2019 12:05:15 +0200
Message-Id: <20190412100518.24470-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190412_030521_932592_F1FCE63C 
X-CRM114-Status: UNSURE (   7.09  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: baylibre-upstreaming@groups.io, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add Infrared Decoder support for the Amlogic G12A and enable it on the
X96 Max and U200 Reference Design boards.

Neil Armstrong (3):
  arm64: dts: meson-g12a: Add IR nodes
  arm64: dts: meson-g12a-x96-max: enable IR decoder
  arm64: dts: meson-g12a-u200: enable IR decoder

 arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts    |  6 ++++++
 arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts |  6 ++++++
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi        | 14 ++++++++++++++
 3 files changed, 26 insertions(+)

-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
