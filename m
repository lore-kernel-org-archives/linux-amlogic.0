Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93E0BC5478C
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 Feb 2024 14:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:From:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xE7uyLWPKTVI4HLoZkycsBWqAg8Pr2/nbG1RBJzF5dE=; b=OGi7oWTbOJ8w1u
	E/wl+K8IUNCpHivzJvWL2UrhJOa46f8RQuL7PMtvHjWJ+yzbFAoz8NBKi5+TdVNJjcFqvpZpcnNMj
	j8WAlvOUHurlV3RNwkFSyQjMqL0haGN0lpQEatbYMwErJn3XKj52vqb4XExQHVVS6XkqD4OEdNNiB
	dkCE6ZLIxGUJIeSLD4x4Vwh0l+SNnKsJik5+y2pcVOSlhV5THZkEhc4E/1Cz5DmIaYnEGo8SD682S
	g3Z6JyFwTyIi5UjjiV+KkHVqUEWd+pz2XwyozFya6Eb06v/wgXjfvNX2RfOk5rpbfeApLrPBGM1K7
	s16YMMc+RHa5s2EClKaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reyPF-00000005ZiZ-0pTf;
	Tue, 27 Feb 2024 14:26:05 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reyPB-00000005ZhU-3SZT
	for linux-amlogic@lists.infradead.org;
	Tue, 27 Feb 2024 14:26:03 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-512fb30dbc9so2352093e87.2
        for <linux-amlogic@lists.infradead.org>; Tue, 27 Feb 2024 06:25:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1709043957; x=1709648757; darn=lists.infradead.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QJCFpLQ4tXouiJNKrklGITbj5aNRw6ossGGBLY8/dtc=;
        b=x9+g9kzcqDY4WeFfi8o1TjJU9ZDexk7/MhhyhgH+UNL9D6ArwgKWTYo732NmQHOj6O
         5guQYH7ALWsvd5itOjsZ/pLWrtLhPUdpQKZEDXGliUVcbsgzzKbO8wdyf/k9wAiSm4i3
         AfS36dFMPwi2NOZq8I0/fvAwDCpDAhQVhMHrBuBhzVihsot2LGJoepLWa0Gb1rniErmu
         l/Pss17EXcBLjoMj5XymgIw3mlPNvlK7uX+ELoyeYuPABNpbKryK0Lf/59gK0VObadaB
         m+ppQdPlD9ykKKnp9CrfBO77GG9G5vP77qNduYvIeYmmYvKlyYVcFxl7U2WjsLDvHKVu
         0x2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709043957; x=1709648757;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QJCFpLQ4tXouiJNKrklGITbj5aNRw6ossGGBLY8/dtc=;
        b=R+XSX5AYJOKjrLP/Pf2RUB0T1IVlEk6elqyB9ckdlyvqImo8Pb5iqX8BpDeiFHSieO
         5VgcFXVe2OmyN2mPDk+ub66h+IIDzgI1UgtrsEui+PTN+AaOVWt7CCLP6/lmTrOLQePp
         yK25JuMmd2iTcxt/arEH0wgQnFdl8/A3V+AEZDeEy1c94LVUTPwU8SvLpdbCPKBu9bUJ
         lcqJHmmjr5G+gqVlTwZh3XufbOz/aaLB3O/5K4HB9PyBW0zzG++oFsG91ZO/DwLs1z4/
         p2tbw06Ty+u9d9nD97UxZQd98FtyJS8A4naGYMC3PGl1Ph0yiThBmVPqcSGiaMOZKocO
         g8ew==
X-Gm-Message-State: AOJu0Yy2c4pIdEhDkzd0GYAKF8iORZdwIpbVP2WRSBtpUvcsaUqfHJGE
	D61Kde+TOsvc9alVyM+12vmjav9nrKUt38SPZ/r/m0I6/rAmdeNI8c9Aa4/9l5s=
X-Google-Smtp-Source: AGHT+IFKZtBWKOR1C7DzZFVutoHWziZUtLM09zQ6+uLXh9aPXFcSpx72VZjyUCYRys4vyEGdoFxSIg==
X-Received: by 2002:ac2:523b:0:b0:513:1573:2dd4 with SMTP id i27-20020ac2523b000000b0051315732dd4mr249128lfl.45.1709043957235;
        Tue, 27 Feb 2024 06:25:57 -0800 (PST)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id jt2-20020a05600c568200b0041290cd9483sm15186809wmb.28.2024.02.27.06.25.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Feb 2024 06:25:56 -0800 (PST)
Message-ID: <2c244e57-2898-4f30-8823-b3d0bd856c05@freebox.fr>
Date: Tue, 27 Feb 2024 15:25:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: AML <linux-amlogic@lists.infradead.org>,
 Maxime Jourdan <mjourdan@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Pierre-Hugues Husson <phh@phh.me>
From: Marc Gonzalez <mgonzalez@freebox.fr>
Subject: [RFC WIP PATCH v2] Load VDEC FW from TEE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240227_062602_133857_BD13D224 
X-CRM114-Status: GOOD (  22.43  )
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

Preliminary support for loading VDEC FW through TEE.

TODO:
- split the patch in 2 (or more?)
  - DT binding amlogic,tee-loads-vdec-fw
  - driver code
- test how long the delays need to be (after load & after start)
- add the DT prop to arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am.dts


---
 Documentation/devicetree/bindings/media/amlogic,gx-vdec.yaml |  4 ++++
 drivers/staging/media/meson/vdec/Makefile                    |  1 +
 drivers/staging/media/meson/vdec/optee.c                     | 50 ++++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/staging/media/meson/vdec/optee.h                     |  5 +++++
 drivers/staging/media/meson/vdec/vdec.c                      |  3 +++
 drivers/staging/media/meson/vdec/vdec.h                      |  2 ++
 drivers/staging/media/meson/vdec/vdec_1.c                    | 14 +++++++++++++-
 drivers/staging/media/meson/vdec/vdec_hevc.c                 |  9 ++++++++-
 8 files changed, 86 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/amlogic,gx-vdec.yaml b/Documentation/devicetree/bindings/media/amlogic,gx-vdec.yaml
index 55930f6107c9c..543a90e83bfdc 100644
--- a/Documentation/devicetree/bindings/media/amlogic,gx-vdec.yaml
+++ b/Documentation/devicetree/bindings/media/amlogic,gx-vdec.yaml
@@ -82,6 +82,10 @@ properties:
     description: should point to a canvas provider node
     $ref: /schemas/types.yaml#/definitions/phandle
 
+  amlogic,tee-loads-vdec-fw:
+    type: boolean
+    description: Linux must request FW load from TEE
+
 allOf:
   - if:
       properties:
diff --git a/drivers/staging/media/meson/vdec/Makefile b/drivers/staging/media/meson/vdec/Makefile
index 6e726af84ac9b..41e5006fa6294 100644
--- a/drivers/staging/media/meson/vdec/Makefile
+++ b/drivers/staging/media/meson/vdec/Makefile
@@ -4,5 +4,6 @@
 meson-vdec-objs = esparser.o vdec.o vdec_helpers.o vdec_platform.o
 meson-vdec-objs += vdec_1.o vdec_hevc.o
 meson-vdec-objs += codec_mpeg12.o codec_h264.o codec_hevc_common.o codec_vp9.o
+meson-vdec-objs += optee.o
 
 obj-$(CONFIG_VIDEO_MESON_VDEC) += meson-vdec.o
diff --git a/drivers/staging/media/meson/vdec/optee.c b/drivers/staging/media/meson/vdec/optee.c
new file mode 100644
index 0000000000000..00ea935f7656a
--- /dev/null
+++ b/drivers/staging/media/meson/vdec/optee.c
@@ -0,0 +1,50 @@
+// SPDX-License-Identifier: GPL-2.0+
+// Copyright (c) 2024 Freebox SAS
+
+#include "optee.h"
+#include <linux/arm-smccc.h>
+
+#define TEE_SMC_FAST_CALL_VAL(func_num) \
+	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL, ARM_SMCCC_SMC_32, ARM_SMCCC_OWNER_TRUSTED_OS, func_num)
+
+static void request_fw_from_optee(struct device *dev, int fw_id)
+{
+	struct arm_smccc_res res;
+	arm_smccc_smc(TEE_SMC_FAST_CALL_VAL(15), fw_id, 0, 0, 0, 0, 0, 0, &res);
+	dev_dbg(dev, "VDEC FW ID %d: %lu\n", fw_id, res.a0);
+}
+
+/* VDEC FW IDs */
+#define VDEC_MPEG12	0
+#define VDEC_H264	11
+#define VDEC_HEVC	16
+#define VDEC_HEVC_MMU	17
+#define VDEC_VP9	18
+#define VDEC_VP9_MMU	19
+
+int amvdec_load_firmware_optee(struct amvdec_session *sess)
+{
+	struct device *dev = sess->core->dev_dec;
+	u32 pixfmt = sess->fmt_out->pixfmt;
+	int fw_id = 1;
+
+	// Load wrong firmware to make TEE reset HW component for us
+	request_fw_from_optee(dev, fw_id);
+
+	if (pixfmt == V4L2_PIX_FMT_MPEG1 || pixfmt == V4L2_PIX_FMT_MPEG2)
+		fw_id = VDEC_MPEG12;
+
+	if (pixfmt == V4L2_PIX_FMT_H264)
+		fw_id = VDEC_H264;
+
+	if (pixfmt == V4L2_PIX_FMT_HEVC)
+		fw_id = VDEC_HEVC_MMU;
+
+	if (pixfmt == V4L2_PIX_FMT_VP9)
+		fw_id = VDEC_VP9_MMU;
+
+	request_fw_from_optee(dev, fw_id);
+	msleep(100); /*** REQUIRED??? ***/
+
+	return 0;
+}
diff --git a/drivers/staging/media/meson/vdec/optee.h b/drivers/staging/media/meson/vdec/optee.h
new file mode 100644
index 0000000000000..f4e209850ad8a
--- /dev/null
+++ b/drivers/staging/media/meson/vdec/optee.h
@@ -0,0 +1,5 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+#include "vdec.h"
+
+int amvdec_load_firmware_optee(struct amvdec_session *sess);
diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index de3e0345ab7c6..9acdbb0d53340 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -1029,6 +1029,9 @@ static int vdec_probe(struct platform_device *pdev)
 	of_id = of_match_node(vdec_dt_match, dev->of_node);
 	core->platform = of_id->data;
 
+	if (of_property_read_bool(dev->of_node, "amlogic,tee-loads-vdec-fw"))
+		core->use_optee = true;
+
 	if (core->platform->revision == VDEC_REVISION_G12A ||
 	    core->platform->revision == VDEC_REVISION_SM1) {
 		core->vdec_hevcf_clk = devm_clk_get(dev, "vdec_hevcf");
diff --git a/drivers/staging/media/meson/vdec/vdec.h b/drivers/staging/media/meson/vdec/vdec.h
index 0906b8fb5cc60..274e8dae8c386 100644
--- a/drivers/staging/media/meson/vdec/vdec.h
+++ b/drivers/staging/media/meson/vdec/vdec.h
@@ -66,6 +66,7 @@ struct amvdec_session;
  * @v4l2_dev: v4l2 device
  * @cur_sess: current decoding session
  * @lock: video device lock
+ * @use_optee: request FW load from Trusted Execution Environment
  */
 struct amvdec_core {
 	void __iomem *dos_base;
@@ -91,6 +92,7 @@ struct amvdec_core {
 
 	struct amvdec_session *cur_sess;
 	struct mutex lock;
+	bool use_optee;
 };
 
 /**
diff --git a/drivers/staging/media/meson/vdec/vdec_1.c b/drivers/staging/media/meson/vdec/vdec_1.c
index 3fe2de0c9331f..0b46d72a5e0aa 100644
--- a/drivers/staging/media/meson/vdec/vdec_1.c
+++ b/drivers/staging/media/meson/vdec/vdec_1.c
@@ -13,6 +13,7 @@
 #include "vdec_1.h"
 #include "vdec_helpers.h"
 #include "dos_regs.h"
+#include "optee.h"
 
 /* AO Registers */
 #define AO_RTI_GEN_PWR_SLEEP0	0xe8
@@ -209,7 +210,11 @@ static int vdec_1_start(struct amvdec_session *sess)
 
 	vdec_1_stbuf_power_up(sess);
 
-	ret = vdec_1_load_firmware(sess, sess->fmt_out->firmware_path);
+	if (core->use_optee)
+		ret = amvdec_load_firmware_optee(sess);
+	else
+		ret = vdec_1_load_firmware(sess, sess->fmt_out->firmware_path);
+
 	if (ret)
 		goto stop;
 
@@ -232,6 +237,13 @@ static int vdec_1_start(struct amvdec_session *sess)
 	/* Let the firmware settle */
 	usleep_range(10, 20);
 
+	/*
+	 * When running secure boot, it looks like the codec needs
+	 * more time to settle (perhaps to authenticate the image?)
+	 */
+	if (core->use_optee)
+		msleep(100); /*** REQUIRED??? ***/
+
 	return 0;
 
 stop:
diff --git a/drivers/staging/media/meson/vdec/vdec_hevc.c b/drivers/staging/media/meson/vdec/vdec_hevc.c
index afced435c9070..6d9141c5f3163 100644
--- a/drivers/staging/media/meson/vdec/vdec_hevc.c
+++ b/drivers/staging/media/meson/vdec/vdec_hevc.c
@@ -14,6 +14,7 @@
 #include "vdec_hevc.h"
 #include "hevc_regs.h"
 #include "dos_regs.h"
+#include "optee.h"
 
 /* AO Registers */
 #define AO_RTI_GEN_PWR_SLEEP0	0xe8
@@ -204,7 +205,10 @@ static int vdec_hevc_start(struct amvdec_session *sess)
 
 	vdec_hevc_stbuf_init(sess);
 
-	ret = vdec_hevc_load_firmware(sess, sess->fmt_out->firmware_path);
+	if (core->use_optee)
+		ret = amvdec_load_firmware_optee(sess);
+	else
+		ret = vdec_hevc_load_firmware(sess, sess->fmt_out->firmware_path);
 	if (ret)
 		goto stop;
 
@@ -220,6 +224,9 @@ static int vdec_hevc_start(struct amvdec_session *sess)
 	/* Let the firmware settle */
 	usleep_range(10, 20);
 
+	if (core->use_optee)
+		msleep(100); /*** REQUIRED??? ***/
+
 	return 0;
 
 stop:
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
