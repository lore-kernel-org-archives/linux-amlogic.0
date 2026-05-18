Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27A3FCD4F4A
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 May 2026 17:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Date:From:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/MlM+b4TNUeQ5puSCUudDTYyjRC6IwkDNGjnBylWPmY=; b=W7V/XJFnwlrUWi
	EybcLCXM7GumfbmCIyBtL7AMWygLAd9vhCgluo42VA9t63t+m5efqlXRED//mnfZsjATTl8/UKb39
	qLpyLPnH6NQNX7KeEQ+PJee+9/olb1P1gFzA4MqXArzxmXSPUEzdwcDhF5jq19YIN/rE6mWFz5MF/
	K8owg9vwLw1iZlxCupxvu09ydeU+4/sERG9cFqALnyc+zC4aVgXJauy5m7VVNw0wFzruyKK2dAnl2
	2bgjp0vaesWi9zSJaMdA2ELxChIAFT3FR/+OZX3t73gkqMtRpDkUxHIGCIam6rlaMCtMUewNGiYJQ
	9QMD96l4Zru9e405cxZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP1Px-0000000GN51-0ATY;
	Mon, 18 May 2026 17:06:13 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP1Pu-0000000GN4B-15BU
	for linux-amlogic@lists.infradead.org;
	Mon, 18 May 2026 17:06:11 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-c802803ac17so1100929a12.1
        for <linux-amlogic@lists.infradead.org>; Mon, 18 May 2026 10:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779123968; x=1779728768; darn=lists.infradead.org;
        h=cc:to:subject:date:from:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OaA3ZM2Zqnd6U5xNasrJ5HhecqWu3+FpjPtc7vgz6NU=;
        b=RwkXxUtyRNk0CK1CbgCGSPXXOKpNIOYi2XduWW8R4tO/2suxI7m6ZXK2iJYH++ZKpD
         LfT84Ig2jY4GdjrhoykaNZ1an1c/Dw22v21ryWY68snDzAMcW6jFHq+Pfx0uOLoiHv25
         saU7OxYvZObRkBrgCL11v7YVlE/i5Q8F4XcmfACXYS6ZdBy4bioeCzLDQ85NEQGUN+LG
         t8cYeawkVo5C64jz279ZUM3MJuPwsuPJxgRj0QxBBXYMuxN0B98COraWMqqzUkGZ3OGw
         09MxXdDucyrYWnZs3PapsohWqJgjQiOV0uPO49AlxF0PFC0nmO7EAdQG5n+VElr+LyNb
         F21Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779123968; x=1779728768;
        h=cc:to:subject:date:from:message-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OaA3ZM2Zqnd6U5xNasrJ5HhecqWu3+FpjPtc7vgz6NU=;
        b=j4N6W3E7XP3GIYAn43k9WI3nQhFKD81iLbYAIoIrdbCign2J7RroTepwdUtz5+oIoy
         hBvr7YpWGl3t9CWlNX2CLjK1bJoA9K6gDt6DvWK35tUPAPUYl9RP0leMyBsQjouZVe5o
         4uH+1YhN79tJxaxJWqJtzDsPWNWBqHhqG06IGD12s5GmPP0caM7aupSSxPWQIYYE+j14
         URLV02rtGmxj0G4t5dbqFN/nWE7LJHhU/ABoW6Cf+huIfh5wxQgTzwOwoDFNjSk05IIh
         Rpt3/1vJEc33U3vYf2FmUgVYYY7abNXBnejysxPm6/OXs7KmZPFQIXp2lWxs/pR4lpBj
         lGjA==
X-Forwarded-Encrypted: i=1; AFNElJ/C6MP6lxazC+YMJi3zJEPUunjCvZI8Hh7IgD+BjY7g2XJiXSCgBagMYCgbc24y5uQFcLahnfw98YfUa+LP@lists.infradead.org
X-Gm-Message-State: AOJu0YwlElxn8pMmyVnfvm42OOMAg8VmWvlX+am60wsV6FGUFM6k3b9T
	yzVa3L0hNCHIa371J3gSZ1D8whzrys2HFYEoX1BXN+e3qXr7AHaExDNJ
X-Gm-Gg: Acq92OEz65+oDRY+4vqZ0xDg0YqIeWoimfmFkzkeU31MCpsO8L642xMUil1AMHb0Owc
	C/zNbGQmsr4P0toQ23BWjrvGEhvh82oYbQ/pUaDj9QO8e5nqD7S1FM7Y0yywkcMOQ09vxEN1PNb
	swvRUmegNqSjBzNjr+43bE+bHnC1NKXIk/R6RRuymgkY0vMQgHeuBhPhCygvo8QJRqcMY2XeDec
	XAnOgRxGuUz1gGhstkhtL3n07sb0Dgb+U1apJ4hImb+AHJGZlO/jn3n6f3uhs6mQ2K7mZY9Gppl
	v9eXjUnquU968soHQEg5nD4bvcSU/xZG3PwIAIeiPJ8N2Bh4DgHM1bXf7O3RCLTaD/VAF8lvSzI
	e6ynElt+1/GJ5bFDJ6Xr40INNW7LHLDevJfGDtR1dcGTJ43olmIHW3TbV4wDMuSHi9Mf+iU//k3
	d8jzB/x3aXteF5GvTKW1V6gQw6E4O/qx1t/lSwxkP53yAu56Cwu4RBy7IqlSIHl0iQGAZpfV4Il
	BQy/J4Vc2EAeoW1Lw==
X-Received: by 2002:a05:6a21:6d94:b0:3a2:dafd:3c02 with SMTP id adf61e73a8af0-3b22ea861a4mr18190165637.19.1779123968468;
        Mon, 18 May 2026 10:06:08 -0700 (PDT)
Received: from 1.0.0.127.in-addr.arpa ([110.44.115.146])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19c7ed3fsm14932377b3a.45.2026.05.18.10.06.01
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 May 2026 10:06:08 -0700 (PDT)
Message-ID: <0f97352506d8d813f70f441de4d63fcd5b7d1c3e.1779123847.git.shuvampandey1@gmail.com>
From: Shuvam Pandey <shuvampandey1@gmail.com>
Date: Mon, 18 May 2026 22:44:17 +0545
Subject: [PATCH 1/2] PCI: dwc: Guard RAS DES debugfs deinit
To: Jingoo Han <jingoohan1@gmail.com>,
    Manivannan Sadhasivam <mani@kernel.org>,
    Lorenzo Pieralisi <lpieralisi@kernel.org>,
    =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
    Bjorn Helgaas <bhelgaas@google.com>,
    Yue Wang <yue.wang@Amlogic.com>,
    Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>,
    Kevin Hilman <khilman@baylibre.com>,
    Jerome Brunet <jbrunet@baylibre.com>,
    Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
    Fan Ni <fan.ni@samsung.com>,
    Shradha Todi <shradha.t@samsung.com>,
    Hanjie Lin <hanjie.lin@amlogic.com>,
    linux-pci@vger.kernel.org,
    linux-amlogic@lists.infradead.org,
    linux-arm-kernel@lists.infradead.org,
    linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_100610_302569_6B0CDDF6 
X-CRM114-Status: UNSURE (   8.12  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

dwc_pcie_rasdes_debugfs_init() returns success when the controller has
no RAS DES capability, leaving pci->debugfs->rasdes_info unset. The
common debugfs teardown path still calls
dwc_pcie_rasdes_debugfs_deinit(), which dereferences rasdes_info
unconditionally.

Return early when no RAS DES state was allocated. In that case no RAS DES
mutex was initialized, so there is nothing to destroy.

Fixes: 4fbfa17f9a07 ("PCI: dwc: Add debugfs based Silicon Debug support for DWC")
Signed-off-by: Shuvam Pandey <shuvampandey1@gmail.com>
---
 drivers/pci/controller/dwc/pcie-designware-debugfs.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-designware-debugfs.c b/drivers/pci/controller/dwc/pcie-designware-debugfs.c
index d0884253b..c3671cb2f 100644
--- a/drivers/pci/controller/dwc/pcie-designware-debugfs.c
+++ b/drivers/pci/controller/dwc/pcie-designware-debugfs.c
@@ -557,6 +557,9 @@ static void dwc_pcie_rasdes_debugfs_deinit(struct dw_pcie *pci)
 {
 	struct dwc_pcie_rasdes_info *rinfo = pci->debugfs->rasdes_info;
 
+	if (!rinfo)
+		return;
+
 	mutex_destroy(&rinfo->reg_event_lock);
 }
 
-- 
2.50.1 (Apple Git-155)


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
