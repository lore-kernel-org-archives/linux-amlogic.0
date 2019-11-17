Return-Path: <SRS0=wynk=ZJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52A37C432C0
	for <linux-amlogic@archiver.kernel.org>; Sun, 17 Nov 2019 14:27:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B87E2075C
	for <linux-amlogic@archiver.kernel.org>; Sun, 17 Nov 2019 14:27:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uISoYgN3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="OvfyMqRL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B87E2075C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=n1Ya1fumExewvIIYUd90BLRH9iMwuMT4EuGbLrh0bNg=; b=uISoYgN3PXgbQR
	5EYPaqycyDmGzQce9z/HMtk+qtwykri1nfHidaAAPvQqIODWE+PsFNRadu5GVuuA9pGdw7fhlS9TB
	9JE2Fercuix2JFmsxjrxO+Qyvc/++UdOvga1TktgG1CLnNK2tLvPHaAU8UKjCp20phrpQ+F3uNzTj
	YFI37CliX4C7qrfiEB4bgjRsPc55APN9HXCEHbG8J7hcOzUeFAM/OTGfJVbo5gAv+MoNTYryagH2o
	MBgLM4RcDz5t0gXQagSBzLFBDSmGq1No/Wqi7K4ERyKQ2ZkOE7WTeGG44BAEUn3CqbwcbO4kPulEP
	fWu6e0GDGZpRHIs2l8GA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iWLWW-00040w-AC; Sun, 17 Nov 2019 14:27:32 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iWLWU-00040M-56; Sun, 17 Nov 2019 14:27:31 +0000
Received: by mail-wr1-x441.google.com with SMTP id w9so16445287wrr.0;
 Sun, 17 Nov 2019 06:27:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lO0ksvtY9zH08AEg8nMyPZuqK7PCO3+wK/C9fssW7po=;
 b=OvfyMqRL7cZ3gebd6XwHEtVV9YVnBnpmUQ+SGXLKpFtR+NrDinyEXHs1csdkoydp8q
 Pz76g1Xstz23VWOmKek8l1li8ywKoeE91ym2jWw5r0salZd2DyYTtQDTJZD3EZqLK+Wr
 rZfRQfXX4Pd02T1ESdgH3cO+K1M+ipl06n/5SGW7RSR6nCFkVMX+eIk3fHU3q4bKITzN
 qcOEy1X6k8BlmtyeRq4P9eNBUMNO8ilWvlM6OY3sCi/uKnNkDLw81zLflSH/5Ar9DrZp
 1nC6TsOAY5vZzPe1eTTfPvKLr2qxbOphRb4PmqLerXtD+tHrXowmqJB58gpfshhQh2PU
 tKKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lO0ksvtY9zH08AEg8nMyPZuqK7PCO3+wK/C9fssW7po=;
 b=Wbm8OGmBSpqFXBSzG2+6ihnt7X0W1sc0J8TZtJ4vbiOJJ5SiMaOey2kZPWKr/pPPmk
 fKthQ3JO1mRT+S3ZG/oX/f3LvF/vb2XDYYGKsJiI1KBBYTs/xbJy9aNSouSkhf8YUaM1
 TaRmYxIgledjs1QbEvJYjQHsanh2C2JybAn/JxyrHwUy7FnvTRXLSIA3KVCaY6HcOrOD
 DtP66FT+Y3QB7qiz7uEMpKOVAAChmPohMAdj/jgcd8LQ/E5cIXROElohbLbtM+qtqxNU
 iTEA2NFHHM1qPFeOBsSitlZze/5Bn1MufDCFQOmK7v8j5+FNAHumV3P+5XPpAVXPP7V+
 CTIw==
X-Gm-Message-State: APjAAAUhzX+xTxZ1nZS0lVZ4ucfXQINvyXzBhm2vhVABBqJ5ehyshN/j
 yTcqw5erXbIITMs14i6LOz89wpTv
X-Google-Smtp-Source: APXvYqzEOXSm+kKjgZdpqwrHaA8h04j+OEbYC2GEcLTVyczWFWgQ3/gy003iaQEgrZvvJmrJxZk5ag==
X-Received: by 2002:adf:ed48:: with SMTP id u8mr24028265wro.28.1574000848452; 
 Sun, 17 Nov 2019 06:27:28 -0800 (PST)
Received: from localhost.localdomain
 (p200300F1371CB100428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:371c:b100:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id y6sm19298404wrw.6.2019.11.17.06.27.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Nov 2019 06:27:27 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-mmc@vger.kernel.org, robh+dt@kernel.org, ulf.hansson@linaro.org
Subject: Amlogic 32-bit Meson SoC SDHC MMC controller driver
Date: Sun, 17 Nov 2019 15:27:14 +0100
Message-Id: <20191117142716.154764-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191117_062730_195292_A26853FC 
X-CRM114-Status: GOOD (  14.15  )
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
 linux-kernel@vger.kernel.org, yinxin_1989@aliyun.com,
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
