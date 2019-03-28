Return-Path: <SRS0=2qxk=R7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9F0BC43381
	for <linux-amlogic@archiver.kernel.org>; Thu, 28 Mar 2019 20:51:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BEF0A20823
	for <linux-amlogic@archiver.kernel.org>; Thu, 28 Mar 2019 20:51:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JkllDEGj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="ISwu6sbc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BEF0A20823
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Y3w6UgIRSC5VPA35UzLnhKe043RRae8/TM7k1Nnm7YI=; b=JkllDEGjE+pNus
	DtE9yZvGoC2be8xRynp5oAA+ceVjlAwbl+8Tud6rAm59yzwGLSggbddBxtxIuEr7bt25vBm/iQ5J1
	sW3jhXgcVQsihUdKWjEPQCI+NEtwCdSGMVxfwzBenGB/RKs3dhEFtT+c6wk3UbVODdTNKsTlW0YV4
	E7IdL5Lr/HfPdiD7tkStyKRTMy2Y/RLwdcXWz0j65p9OZc5pzs4nYIg0t6HIupS8LZ/9At9KknkcQ
	bgHqRyBSK/Z3pTv6SMmmD3OY8L+LccPyjf4Crk9b5wO6zvvKnXk1tP1sXUpSwwstPCMdaUCWfHS71
	M8ET5fHd42Fz04wzRzbQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9c08-0006u4-Dx; Thu, 28 Mar 2019 20:51:52 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9c06-0006tF-7Z; Thu, 28 Mar 2019 20:51:51 +0000
Received: by mail-wm1-x342.google.com with SMTP id z6so8163524wmi.0;
 Thu, 28 Mar 2019 13:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6AZlRPvy4bz4vMcSu+kCq42rB+53+hRMtcQHdtCzPdA=;
 b=ISwu6sbcgNcmBdqUxz8m+j8/+rHJuGuVHp+E1Yc5VAzu0S2F0Io68uNpQK8pRC0YDB
 WOIfotcqbgZdt7tet3b6ybbee7+u/9ar4ZxqXgiCwgZxo9E0TkRqgOug/lpYvJLp3cd2
 fZHoTf4tS8R7Xsr0OZV+SOJno3HkoZ+QrrdbVrwVru+DSy9qe2Fr/1ux2yMGgcZHHcMu
 KzYBef/090gpVAVHQZATEcM4b/AXLsuOxQhDBpHkfl2VrZvrXVnTmS6grcGQIpiTO64y
 +edDYw/Z5m2bfu3GjuMPmo2JKF7Ipf5hF3q6fh4sa9LYvAZVAj+//OixhmaipXczp/ym
 tMTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6AZlRPvy4bz4vMcSu+kCq42rB+53+hRMtcQHdtCzPdA=;
 b=lrgXqwXV3dfm6vpZHzo4ljy+ZoXugJ96tjYAVRex9doucpY4lfxCE9QzI9Z6LDQhFs
 4aoWJlcy6liK4xNtEqcsqKdSXrWmvqIsBJ+t41CE0grd4EWch+T5FOYLbLwUb959bxgE
 WPGGXPSZUEQXoO3CrUW/xo+a1Bte7q7lI1m3lY8pUmq/RsblENU7U+ruDm8ISPeRkmFh
 2BZzPU2sX6LtL+V1RsnHNwRb6yvmS61NKFj4o3ZmuehpVYasYYeIzVemZmSa32bjAvFm
 M8/Mwurrcf6ZGphe3U3AGhsmTS4Yjy2IioO/hcS7zMNN4e5kZsW+iNPwVt2xknsh7L/f
 R7KQ==
X-Gm-Message-State: APjAAAUYSw8md9YpGWIDikjMimVrktn+JT/+7Dmo8gqHlZ/UGTsqYrBS
 xDaFPWwndCdbaIs3eTXlsDCxaVFS
X-Google-Smtp-Source: APXvYqzFqFZKu9lBgqtgV89zfsHEdXdz9Rz66JOMjoYUHyuRFYAqLiBYCBQibZDCqNHVQzz9VWGzBA==
X-Received: by 2002:a1c:c910:: with SMTP id f16mr1188931wmb.47.1553806307345; 
 Thu, 28 Mar 2019 13:51:47 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300DCD73999007CF185662A5FF671.dip0.t-ipconnect.de.
 [2003:dc:d739:9900:7cf1:8566:2a5f:f671])
 by smtp.googlemail.com with ESMTPSA id c10sm94375wrt.65.2019.03.28.13.51.46
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 28 Mar 2019 13:51:46 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/1] Amlogic: update multi_v7_defconfig for the temperature
 sensor
Date: Thu, 28 Mar 2019 21:51:21 +0100
Message-Id: <20190328205122.27092-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190328_135150_271843_07D190BF 
X-CRM114-Status: UNSURE (   9.13  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Linux 5.1 gained support for the temperature sensor on the 32-bit
Amlogic SoCs. This requires the eFuse driver and the SAR ADC driver to
be enabled in the kernel config. This last bit was missing so far.

Three boards already have a iio-hwmon node defined. The driver for this
is already enabled in multi_v7_defconfig: CONFIG_SENSORS_IIO_HWMON


Martin Blumenstingl (1):
  ARM: multi_v7_defconfig: enable the Amlogic Meson ADC and eFuse
    drivers

 arch/arm/configs/multi_v7_defconfig | 2 ++
 1 file changed, 2 insertions(+)

-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
