Return-Path: <SRS0=EW34=TU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 428FDC04AAC
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 14:36:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1654B213F2
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 14:36:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kN6mEuJ2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="PmFsDusz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1654B213F2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vtHcUZGHehb10hqD0TUau3DNCwf2EbhIfguOeVmSOeI=; b=kN6mEuJ2z3v0S8
	LpzH92LZPrpG1YIq2CY7UL7Sz7tqxoH1MiommLwf688twBmTuGfDPJcJwk3r5eQZQwUatk3QBPgcp
	Phiyxx/V1LUF7JOGAnxMRZ8+TqsFc2A6xzgPZhE8xzJOwvD20Cp24PG9MDawSbgCknjIc7XZ2YZzv
	5BAzDO1nOuQBsnPoGyP3Ei7a6oZ/PpaqlMEE1PXmgr66W1xZynNVzZxsZTqDiefFASnaovlVaZiMx
	Li6lc4ls+aOO87uk4dtEwu49C20J6R+W0XHXmq92O8XOHqNnd4d63RfqnY8um14zbJzvc6LdVSqxd
	RncbubxIA7tZ0Gd2lGaw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hSjOQ-0003m9-5d; Mon, 20 May 2019 14:35:58 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hSjOO-0003l4-1n
 for linux-amlogic@lists.infradead.org; Mon, 20 May 2019 14:35:57 +0000
Received: by mail-wm1-x32d.google.com with SMTP id j187so13311781wmj.1
 for <linux-amlogic@lists.infradead.org>; Mon, 20 May 2019 07:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ejqilo1yto88LxSnrCJSQqgQ1iaCyh2m+KasJchWoQA=;
 b=PmFsDuszt8zbmDWBibaKVcHa3d90eVt4oIYeL7/WxtMyAqEGQbecyxivNB16FD1jmy
 OHpQWFInSxzYr3AAThREgWvzyqMI+SaJxcNBwZBcoBFeIvDMoe9HlOmkrBc15EgKVUuH
 Tt/f5FbDD7obeidLvSTYxokhRD4N4rjLqyXCMK9q6nxvsWr2H+mR/VgFUWGiEyrhHSes
 0FEtNlU63uUSmpRlQnApY+moyhJO2/ZlPc6SoHNLxHaqZAn+wKTgAivHht17C3UHos0w
 wHHcfwtKgT8Wee7OkOXAKp5LRgzqbXgCUN6XreuRrzjTg93nK43V3yQwDGibXoIvkOJn
 nhQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ejqilo1yto88LxSnrCJSQqgQ1iaCyh2m+KasJchWoQA=;
 b=pcp/M2mCpq0piFTCIozJNS948xjz/mDN5Y5B8SMvK2T1JzEnwWc07lG2BCAGqBEob9
 hpjECHc4d4LY022KaWYLYWxQP6JXmXewsvZjEsyX0ofnPxTUuJMFfiL/7junxeX3KhB3
 gyntih/7WCie8W4F57JVvVLMvTDb0kZP+V+CEFSIs5X9G4XNVWtgiufX+3capHrVMwmX
 XFYh/RBiDUwb8739dIVGdl0h/ttjBAWGIFwiGvHIqFZi7yYLoyUDF5bJCpbxu82OCx0E
 KAFgh/L1plpmaof4TNlJxl48axjpCx9aOtJCZ0pAtIn4JC5Nd05dObdRVRx9XnDQyI/j
 GoAg==
X-Gm-Message-State: APjAAAWGPXSRxTmc2+ZUYj9+ibCG/v4L6xzTrRz/DOfXHoFRO0viCcEH
 B++mnsBrRDZP0ZFLhXhglrvaZQ==
X-Google-Smtp-Source: APXvYqzCnbrhWCGv6z19ZfaxyrIPmjh819MAp3NfOSe8oAbofCIxL969Y+24vhzKZK1CnQnZkZVN6A==
X-Received: by 2002:a1c:7312:: with SMTP id d18mr12188411wmb.147.1558362954239; 
 Mon, 20 May 2019 07:35:54 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id j13sm14042591wru.78.2019.05.20.07.35.53
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 20 May 2019 07:35:53 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: kishon@ti.com
Subject: [PATCH 0/2] phy: amlogic: update with SPDX Licence identifier
Date: Mon, 20 May 2019 16:35:49 +0200
Message-Id: <20190520143551.2330-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190520_073556_089074_C60671A6 
X-CRM114-Status: UNSURE (   6.66  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Update the SPDX Licence identifier for the Amlogic Meson8b and GXL PHY
drivers.

Neil Armstrong (2):
  phy: amlogic: phy-meson-gxl-usb2: update with SPDX Licence identifier
  phy: amlogic: phy-meson8b-usb2: update with SPDX Licence identifier

 drivers/phy/amlogic/phy-meson-gxl-usb2.c | 8 +-------
 drivers/phy/amlogic/phy-meson8b-usb2.c   | 8 +-------
 2 files changed, 2 insertions(+), 14 deletions(-)

-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
