Return-Path: <SRS0=AlqK=2A=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6672DC00454
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Dec 2019 20:01:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 19F132077B
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Dec 2019 20:01:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oEabbkJL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="BiS1cDh+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 19F132077B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sik85o6X3uXaIah4GihO600MHiGDwW2jWAyu8qnonkM=; b=oEabbkJL1s6VIL
	T4sxJTTyxBAet+ZfmokMdPkUz+oD3RABSmHhZuQ3evgiEWwmmt09GbJowg2WAsCFGJZAjmpUp+qpn
	KSwLvBOBLOjFbHZ13urYJiI9a3IFk4OZsMlp6xgpt6qZBtApIytGjApTZ7KT0DNYw/dJJskdQOXiV
	qiB3KNXmvR61IDaelFmDLKVmlwX3GkdjuETmj87JC5dMBlZhE7rYRfx1cOT0BK8/8yN0/eORyN17W
	IiHlvMYUtmX9fdUc2fY1k947IYJns4NXIo78b+kYWBA8Qmphr+Ec2ay7ibH/4MX+szT1dSum6vvsf
	zPIFCa/s9I/FCoaxmc1w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ielgs-0003mj-VT; Tue, 10 Dec 2019 20:01:03 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ielgQ-0003QM-AW; Tue, 10 Dec 2019 20:00:50 +0000
Received: by mail-wr1-x442.google.com with SMTP id c14so21506089wrn.7;
 Tue, 10 Dec 2019 12:00:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+xeCGefpGQy2sjgNGOl+Y50d//RwjlVI7sRbqcHrAp4=;
 b=BiS1cDh+P9bCWW2ka7NcIQDHU99Kn5O7ZAiRBjLegvHkYyubb9sankMnNyOIadKGtj
 sipBJHj72DaqrBpuSGE2i1gnbMh+2SPZWmzWWn7kvwwtXAftCIp+/Dy0TFdbAPNB3nap
 uz0VMQlUU5KpSY0lSU8FRmcC9eL2PfqFKvV4GMf/TaUxKkF7km3Z/NqrhCLSVeittWVO
 C890+Y3XjK2L1aa5Lr40eSOdznCUEt7P4HhBWwNRcK/wziGaudjuvXmARbN6ukznGH3y
 9MjTcMUFVHBhu4uWmjeD0UgYLDKKM0txxMrfChn8EjPe5YgrrI+D1xsL6q4kmV95R0mT
 XQKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+xeCGefpGQy2sjgNGOl+Y50d//RwjlVI7sRbqcHrAp4=;
 b=IthRT8+6lyJoL/w3NJGUl3J6Q7+Q5Q5rRQFzuSwrB83T4DuPopd5WGk3bHlbEX+WQ1
 TpuTDhMlGfMNfazgkFg1qlYpNa+Y1fEA12QBCQxGqbkuZ94qjqbLXR3YVL9y84MszKxy
 nfbQJZ8ldErQ4uC73GwolgcVG5s34cOGkvoScZdp7s8apaV1dR/i/4fwwZkhcaL+tlLj
 n7o4/99syh4lS1vswTQveiF+q7SV3w7Yn0klNXdYtAL5zyWc+kxHAZ+c+hWFr9hXIM+3
 im/RFOP8iy8kC0IRG/BFDq2NVPNYFQ3jejhOV0RE2u8V9OTGTf5EzJCLKV/YZtfLFzYm
 LFgA==
X-Gm-Message-State: APjAAAVvFYow6wj0OuP/N70zqNGgUCFpfLzK++yaDRYmIOXp/4+7xImM
 KD85KDWDTmbZpsufvRPyLoPK9dxv
X-Google-Smtp-Source: APXvYqzpu8OOo+U+YwFj7SHZFDBR48BOqfZIl7wVK/FMuNySRzX9p5e7U6/uTahIjSPirfINT95Mrw==
X-Received: by 2002:adf:9c8f:: with SMTP id d15mr1530407wre.390.1576008031386; 
 Tue, 10 Dec 2019 12:00:31 -0800 (PST)
Received: from localhost.localdomain
 (p200300F1371AD700428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:371a:d700:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id t81sm4428610wmg.6.2019.12.10.12.00.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2019 12:00:30 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-mmc@vger.kernel.org, ulf.hansson@linaro.org
Subject: [PATCH v3 0/2] Amlogic 32-bit Meson SoC SDHC MMC controller driver
Date: Tue, 10 Dec 2019 21:00:20 +0100
Message-Id: <20191210200022.29696-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191210_120034_505050_C749F8CF 
X-CRM114-Status: GOOD (  15.56  )
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
Cc: mark.rutland@arm.com, jianxin.pan@amlogic.com,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, yinxin_1989@aliyun.com, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, lnykww@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hello,

this is the first non-RFC version of the driver for the Amlogic "SDHC"
MMC controller found on Meson6, Meson8, Meson8b and Meson8m2 SoCs.

The public S805 (Meson8b) datasheet has some documentation starting on
page 74: [0]

It's performance is still not as good as the driver from Amlogic's 3.10
kernel, but it does not corrupt data anymore (as RFC v1 did).

Special thanks to the people who supported me off-list - you are
amazing and deserve to be mentioned here:
- Xin Yin who helped me fix two more write corruption problems. I am
  hoping that he will reply with Reviewed-by, Tested-by and Bug-fixed-by
- Jianxin Pan for sharing some of the internal workings of this MMC
  controller with me
- Wei Wang for spotting the initial write corruption problem and helping
  test this driver on his board. I have his permission to add his
  Tested-by (off-list, he's Cc'ed so if there's any problem he can speak
  up)


Changes since v2 at [2]:
- rebased on top of v5.5-rc1
- added Rob's and Xin Yin's Reviewed-by and Tested-by (thank you!)
- (note: Kevin had v2 of this series in -next for a few days so the
   build test robots could play with it. I haven't received any negative
   feedback in that time)

Changes since RFC v1 at [1]:
- don't set MESON_SDHC_MISC_MANUAL_STOP to fix one of three write
  corruption problems. the out-of-tree 3.10 "reference" driver doesn't
  set it either
- check against data->flags instead of cmd->flags when testing for
  MMC_DATA_WRITE as spotted by Xin Yin (many thanks!). This fixes
  another write corruption problem
- clear the FIFOs after successfully transferring data as suggested by
  Xin Yin (many thanks!). This is what the 3.10 driver did and fixes yet
  another write corruption problem
- integrate the clock suggestions from Jianxin Pan so the driver is now
  able to set up the clocks correctly for all known cases. documentation
  is also added to the patch description. Thank you Jianxin for the
  help!
- set the correct max_busy_timeout as suggested by Jianxin Pan (thanks!)
- convert the dt-bindings to .yaml (which is why I didn't add Rob's
  Reviewed-by)
- switch to struct clk_parent_data as part of newer common clock
  framework APIs to simplify the clock setup
- dropped CMD23 support because it seems to hurt read and write
  performance by 10-20% in my tests. it's not clear why, but for now we
  can live without this.
- use devm_platform_ioremap_resource instead of open-coding it


[0] https://dn.odroid.com/S805/Datasheet/S805_Datasheet%20V0.8%2020150126.pdf
[1] https://patchwork.kernel.org/cover/11035505/
[2] http://lists.infradead.org/pipermail/linux-amlogic/2019-November/014576.html


Martin Blumenstingl (2):
  dt-bindings: mmc: Document the Amlogic Meson SDHC MMC host controller
  mmc: host: meson-mx-sdhc: new driver for the Amlogic Meson SDHC host

 .../bindings/mmc/amlogic,meson-mx-sdhc.yaml   |   64 +
 drivers/mmc/host/Kconfig                      |   14 +
 drivers/mmc/host/Makefile                     |    1 +
 drivers/mmc/host/meson-mx-sdhc.c              | 1174 +++++++++++++++++
 4 files changed, 1253 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mmc/amlogic,meson-mx-sdhc.yaml
 create mode 100644 drivers/mmc/host/meson-mx-sdhc.c

-- 
2.24.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
