Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A2B2C79F8B
	for <linux-amlogic@archiver.kernel.org>; Sat,  5 Sep 2026 15:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bJcWhotoeLFdEKzbwkvMzS8/ejOx6v/LKLBivz8Q/rU=; b=4OryCXCBA5kUCL
	kMjFKGIL4irIgTXDCfz2DOxv69nooCfe/m5jXluSqF/HhLKx3aac4q3kVU8WGdsM2tCZEns9l9ds0
	YKZIyI/zt3SDaAYSw+aZPiJ40L46k2xTelKrj3Yw4uFjy388WTsJpGW0RleC61ZxKQp8MGp/hs4QA
	xjZzFiThWW7uANXF6kYOPLxCOdlCAv8lFtNkB2LGrxv4HKd1r5v3nKJJpL+rrYxsqNEAcTynwq4Ly
	hxKwXRvPMs3xlTz2WDGZsOGhNAjTXQ/BsXSgNlG1zI2q6Zk9/YUKMJ3JCPP8NzfQdBzdnAyWn2emv
	uANjDY4u3LzlA0MTWTkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2sNp-00000004Cni-1EXU;
	Sat, 05 Sep 2026 15:32:45 +0000
Received: from mail-wr1-f47.google.com ([209.85.221.47])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2sNl-00000004CjL-16KM
	for linux-amlogic@lists.infradead.org;
	Sat, 05 Sep 2026 15:32:42 +0000
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-47ddf7b09e5so2173449f8f.1
        for <linux-amlogic@lists.infradead.org>; Sat, 05 Sep 2026 08:32:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788622360; x=1789227160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rBqYYCS5py1zvvdbPLcK4Z1TQdgdHGp93LoH6od28Gw=;
        b=OjnnGNgZC/W5PWi4V/eewNc4rvj+ApApFDXSVTd0SCKnKAj8JLB0xWU2qxDkQmU/LR
         0rhHTmzI7jkn5rfE9As/YRj9pAozqDnLVEXoAOcVMVP3tvFJhVR2EfGDjYFFM75OUOEy
         bEPUMeGA94xrC+CLqnjoglXonNCvUlhVsgmiiBKUKL6v8E8Dqvb1YAFevRKla6ujrjxr
         4mViewf97wSVIbMBzrxMP7/Z9ljFHquGn61JbWG9F9e87ZK4EX7zxTksPhLwHEkt5QCg
         DBo5UaNG31VcVhKI9TJEEjGjc2Ik9ZNXtwKSs49gM1vj/jA4gfDMLP/lsDBXb8ScVbGn
         tySA==
X-Forwarded-Encrypted: i=1; AKwUvBwrvytjEnE5d51KuarZRx/UkHXEjeG6NhQRJIhSxegyXqmVrvyqCQa+VOjQky/2y95rVWnMCJeDi1ZYt//0@lists.infradead.org
X-Gm-Message-State: AFuF++nv4oLv6iFHYauL9WFk7NOSbnOVGrSUTso5qrQ7ju9OcL32WLiC
	j6vp1Tnlk8B2Zox57LGWviLDCMYbikrZ7l8DaT06cgOYapJvlBMqibFW
X-Gm-Gg: AYBFou32y/IX3nXAUD3qruQRRXVdUf8k9mkCbNWooYS3KVUfsSuGn7tEasvF9jwKn0F
	wZtOXsu8ePmQkWbL0fbq154lZmfXhBsVPItDDCrpmUIDLkAE5c3sc3+m6kTN3993doM+nQKboF9
	IXNTssw+BwvhJ98rPY7roaan3Oi61lqPpei0xbDT381unkC46m0nZfCSMNboJ2f+0l3ECpsP9uV
	wC5w85SYxgG2ahCZZwHbYliirMTNy8suKyfLzoRsu9X/m/GHAdbBOSDjHXWVdkPmOn0ARsLBqJa
	WGMDyzX+qbt5H93OMSSPoiQTo4gPYWfmyMYblFFxH8LonXaA4j3BcfMNTxO1A30mn7ltD5+Mvhn
	auG+YHJkzov+iq7/e02kahrJK7i+CBg9q6wZtS0P9ReTaCD72KfYN1bg8irrXkP0HY/IrkcbJO6
	4T05zQPJ6Uosgqx8RVXQvRDhz+SLiahdsBnly5jCo902YfBMfCLtmDRQWOETP6oWZdQEdSQ4Sp4
	NE/c6nW8isLJaFjv7r0DC7Rgw==
X-Received: by 2002:a5d:5f09:0:b0:484:3332:d1ce with SMTP id ffacd0b85a97d-48586bf9cfdmr14652908f8f.0.1788622359412;
        Sat, 05 Sep 2026 08:32:39 -0700 (PDT)
Received: from threads.localdomain ([84.68.179.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c6ba4sm16691913f8f.25.2026.09.05.08.32.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 08:32:39 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: Ulf Hansson <ulfh@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <bmasney+clk@redhat.com>,
	Chuan Liu <chuan.liu@amlogic.com>,
	Jian Hu <jian.hu@amlogic.com>,
	Ronald Claveau <linux-kernel-dev@aliel.fr>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/4] clk: meson: t7: don't mark sys_ampipe_nand as critical
Date: Sat,  5 Sep 2026 16:32:34 +0100
Message-ID: <20260905153234.133217-5-tanure@linux.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260905153234.133217-1-tanure@linux.com>
References: <20260905153234.133217-1-tanure@linux.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_083241_334966_C868D10E 
X-CRM114-Status: GOOD (  14.19  )
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

sys_ampipe_nand clocks the pipeline stage inserted in the bus path
between the SD/eMMC controllers and the NIC_MATRIX fabric. It does have
identifiable consumers - the three MMC controllers - so marking it
critical was the wrong tool: the clock should be referenced from the
consumer nodes and claimed by the mmc driver instead.

Drop the CLK_IS_CRITICAL flag and update the comment accordingly.
sys_am2axi0..2 remain critical as they clock the AXI DMA bus itself and
have no single identifiable consumer.

Assisted-by: Claude:claude-fable-5
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
This patch depends on the MMC controllers actually referencing the clock:
the dt-bindings, mmc driver and t7 DTS changes adding the "pipeline"
clock must land before this patch, otherwise the boot hangs and memory
corruption this clock caused are reintroduced.

 drivers/clk/meson/t7-peripherals.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/meson/t7-peripherals.c b/drivers/clk/meson/t7-peripherals.c
index 55d09e78593b..2f429ea86796 100644
--- a/drivers/clk/meson/t7-peripherals.c
+++ b/drivers/clk/meson/t7-peripherals.c
@@ -945,13 +945,13 @@ static T7_SYS_PCLK(sys_aucpu,		SYS_CLK_EN0_REG0, 14,	0);
 static T7_SYS_PCLK(sys_cec,		SYS_CLK_EN0_REG0, 16,	0);
 static T7_SYS_PCLK(sys_gdc,		SYS_CLK_EN0_REG0, 17,	0);
 static T7_SYS_PCLK(sys_deswarp,		SYS_CLK_EN0_REG0, 18,	0);
+static T7_SYS_PCLK(sys_ampipe_nand,	SYS_CLK_EN0_REG0, 19,	0);
+static T7_SYS_PCLK(sys_ampipe_eth,	SYS_CLK_EN0_REG0, 20,	0);
 /*
- * NOTE: sys_ampipe_nand and sys_am2axi0..2 provide the clock to the AXI bus
- * used for DMA between the peripherals and the DRAM. After the clocks are
- * disabled, a device that starts a transfer cannot complete it.
+ * NOTE: sys_am2axi0..2 provide the clock to the AXI bus used for DMA between
+ * the peripherals and the DRAM. After the clocks are disabled, a device that
+ * starts a transfer cannot complete it.
  */
-static T7_SYS_PCLK(sys_ampipe_nand,	SYS_CLK_EN0_REG0, 19,	CLK_IS_CRITICAL);
-static T7_SYS_PCLK(sys_ampipe_eth,	SYS_CLK_EN0_REG0, 20,	0);
 static T7_SYS_PCLK(sys_am2axi0,		SYS_CLK_EN0_REG0, 21,	CLK_IS_CRITICAL);
 static T7_SYS_PCLK(sys_am2axi1,		SYS_CLK_EN0_REG0, 22,	CLK_IS_CRITICAL);
 static T7_SYS_PCLK(sys_am2axi2,		SYS_CLK_EN0_REG0, 23,	CLK_IS_CRITICAL);
-- 
2.55.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
