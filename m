Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ABF7CD4F50
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 May 2026 17:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Date:From:
	References:In-Reply-To:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+ftkmn7lYNrk4ICNOrR0EKqKX85+2KStAqysi151y9o=; b=SCzCaN34VKYS+u
	aiGiIbSSv6Nz3Fifrm4ZSeeWwEW0S21MI/hSV4ODrJ/8O+tspNJ3HG2p23SG8EBrNBlDEO+wz91zt
	ROYwt487w5JynWH1FUuDO79OQC57FfZ7uGHy/83FU+zz7pvuW8PeiLUQ/TT7LykaE8cGqHH4vUKVO
	UTZFw5uZ4uV4sHn50s0hxqJpbgD8Fa5begyvHtfLqTWQ66Zs6y/5+jkXGUghS0D/+4J6zxcn9W45W
	bljIalb7W5SV131lJs3hUd4RtEOkv/sVlPiS5cc4xUTbUmaZm9H+VLtDg4imjaVk/pbDBY95AM5zF
	4ByV8HavMHvSEyTDeNrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP1Q2-0000000GN7A-0hob;
	Mon, 18 May 2026 17:06:18 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP1Pz-0000000GN5t-15gP
	for linux-amlogic@lists.infradead.org;
	Mon, 18 May 2026 17:06:16 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-c80291e6237so1936668a12.0
        for <linux-amlogic@lists.infradead.org>; Mon, 18 May 2026 10:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779123975; x=1779728775; darn=lists.infradead.org;
        h=cc:to:subject:date:from:references:in-reply-to:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zllnXd80rkp5aHt7G7/Ts91W3aw+U7xcISZlpRJwkn8=;
        b=FUgxldQfrSwUJQ68LsfDrJxDFeVI57Da5VAeIeVlDbqm/d1UE6Tm3wYd3QB9fcedDI
         KvBllUK6GSV32CJU/jmmRbsoRdpUCFWxaVUxqLFMkksV2tH8yBA85NeOdklWzTRVpqn0
         IFfS9aR+J1we1w57SX0JXJIwD/bRh/Ku56nIYaqfkqBk27u28wwCrZhMkTB1wVU+5qmx
         4DncYgRYj9x5WmGpYefksqn1t0Nxd4aiauu4niGI5IQxUWwLMC5lR5ol8QvM/sc5/lxm
         PdpcqTi5A4ncCBydlSMzDh6iq8LiYHBrHvjvpBJ6Pq6X37dmD/+yiatfDm0ote7xlCxJ
         eYoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779123975; x=1779728775;
        h=cc:to:subject:date:from:references:in-reply-to:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zllnXd80rkp5aHt7G7/Ts91W3aw+U7xcISZlpRJwkn8=;
        b=bNR8r8gSOsg8nmk7idAEBVTpHFSEMGZjTpOR2OLDYIVEMw7T7BsdCfMi+9+hz0DxpB
         x6vHY5NoV/nESwhDlFJJV7L08IEBbwpka32rqRMYaeJ/Xr9gzc3ND6EC+qR8VNTdjlCN
         P1SL7siWM47vg+FNJkLqTFpuMWGNDWHDg2ztrjFcIKYD86XCECPos8IZ06vU4HrOQ5vi
         zNPI9TYJVSsSJG6THoABCkbWsNtqZO9EMXYeWf+Gcl4VpLAiLmkAxh5QZ8RoIc/3pb9H
         ErXUkxZYZ3qFkSRlMjHmD1t2rXKvJIiPVMmWMobl72S1SMwuZH/lh7RNtks5bBkE0iqt
         5ZqA==
X-Forwarded-Encrypted: i=1; AFNElJ+3qtiOw5FBEArS08xqxJBzRvzw9UzrLyfjtL15G7K7gtmnC92SvlhlwLvinFh29bPF4G3Rz/t1pDxep5hu@lists.infradead.org
X-Gm-Message-State: AOJu0YwdFsUCCbl0HxZ3ntwJindKCIC6+DVo/2aj2wrUr4MKvjluvP+n
	/GmmoIrMwX9B23KrUkziU7DMywfeARSiQGtkzFM+QU/k2+dBSjDiPbJY
X-Gm-Gg: Acq92OGkqd6dAg8ETtju73bnyCiAifQTUuQZJ9cuQJc6El3F7eZrVOhiT0syFtF6CO1
	ohJjhXbk1zxgKrtnSgCOXuW1W92hiF3to6ZomxvrikgicA5CvQvTOsA2H3+KZmK1U0j5BK30KVD
	N8aeVmubQKN8hSjUcmuvBInvUY8GEE2vrxtRxDdriRgYxpGxshmAG2XL2+FVEjQh8XW4d9QkAVD
	6u6EnFuDCvFdxbmOeSKqcvYzx01JdR8umYYkmb+3vn0oeXdjfKQsYCSUXZe3g0ivtt7bQVgpZj8
	/O8tzUJVBvTXOhXoEOSxEHgWWbSQ8/Qwm8Gf5mtc5wqmcR5gLOwaloD/L5406M2ri/SPas7bAGN
	nrTkH86xRieAQl/3XntsPH2R/97cPF0mnAJGhzl/cE1bs05jd6pWi5zvNrefzBn+5KLH5C6+p/b
	Is3lFZhpe4QaUpGHSWzlrYx+P/13XHq7na6IdYSttYUa0aUGZpRbLjx8qWS2SuE34W0ZnFNuZKn
	bONPQFaRQ5MNoAz5w==
X-Received: by 2002:aa7:88d1:0:b0:83d:b0a0:90e3 with SMTP id d2e1a72fcca58-83f33c344a1mr16612881b3a.31.1779123974543;
        Mon, 18 May 2026 10:06:14 -0700 (PDT)
Received: from 1.0.0.127.in-addr.arpa ([110.44.115.146])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19c7ed3fsm14932377b3a.45.2026.05.18.10.06.08
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 May 2026 10:06:14 -0700 (PDT)
Message-ID: <1a0c86ab264cdc1c79c917e984b90991af51d827.1779123847.git.shuvampandey1@gmail.com>
In-Reply-To: =?utf-8?q?=3C0f97352506d8d813f70f441de4d63fcd5b7d1c3e=2E1779123?=
 =?utf-8?q?847=2Egit=2Eshuvampandey1=40gmail=2Ecom=3E?=
References: =?utf-8?q?=3C0f97352506d8d813f70f441de4d63fcd5b7d1c3e=2E17791238?=
 =?utf-8?q?47=2Egit=2Eshuvampandey1=40gmail=2Ecom=3E?=
From: Shuvam Pandey <shuvampandey1@gmail.com>
Date: Mon, 18 May 2026 22:44:18 +0545
Subject: [PATCH 2/2] PCI: meson: Add missing remove callback
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
X-CRM114-CacheID: sfid-20260518_100615_309968_55FAF4EA 
X-CRM114-Status: GOOD (  12.01  )
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

meson_pcie_probe() powers on the PHY and registers the DesignWare host
bridge with dw_pcie_host_init(), but the driver has no remove callback.
On driver unbind or module unload, the driver core therefore proceeds to
devres cleanup without first unregistering the host bridge or powering off
the PHY.

Add a remove callback that deinitializes the DesignWare host bridge and
powers off the PHY while device-managed resources are still valid.

Fixes: 9c0ef6d34fdb ("PCI: amlogic: Add the Amlogic Meson PCIe controller driver")
Signed-off-by: Shuvam Pandey <shuvampandey1@gmail.com>
---
 drivers/pci/controller/dwc/pci-meson.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/pci/controller/dwc/pci-meson.c b/drivers/pci/controller/dwc/pci-meson.c
index 0694084f6..c96e2244a 100644
--- a/drivers/pci/controller/dwc/pci-meson.c
+++ b/drivers/pci/controller/dwc/pci-meson.c
@@ -451,6 +451,14 @@ static int meson_pcie_probe(struct platform_device *pdev)
 	return ret;
 }
 
+static void meson_pcie_remove(struct platform_device *pdev)
+{
+	struct meson_pcie *mp = platform_get_drvdata(pdev);
+
+	dw_pcie_host_deinit(&mp->pci.pp);
+	meson_pcie_power_off(mp);
+}
+
 static const struct of_device_id meson_pcie_of_match[] = {
 	{
 		.compatible = "amlogic,axg-pcie",
@@ -464,6 +472,7 @@ MODULE_DEVICE_TABLE(of, meson_pcie_of_match);
 
 static struct platform_driver meson_pcie_driver = {
 	.probe = meson_pcie_probe,
+	.remove = meson_pcie_remove,
 	.driver = {
 		.name = "meson-pcie",
 		.of_match_table = meson_pcie_of_match,
-- 
2.50.1 (Apple Git-155)


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
