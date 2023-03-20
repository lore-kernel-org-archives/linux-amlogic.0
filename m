Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 445AEC7618D
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Mar 2023 13:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4EHXPQvqrvSs3QAIoixdR+XU0xcYTSDHtSjVSfDsoGE=; b=kq7RvGcREAszbs
	iXKn8SivPC210ieGkWfuoI4cZtz5ig8pT33WnRWpxAHnQECLpMavcxUFqaxwOtVT0RWtAe0hYvio5
	djjUtOdZ6yxGkGBrIOHrYPUu9gXlzu5Rr/nhVDsP9tQqQ4MVuchnSdnh0ju4fIRMkrCbQs12eBcVF
	pFrHpalJItG0kcT2Xq9o0l72ciT+5qcXvwMPomKfVy0sTtcLFfzrDEB1KxJOCD2KSNta3iSpOY1NI
	oqEP7h0QFHDMFM4QghbaDkycbmXXcT1KRXPFC0gu7Q5aTUQikhSkuDfv/2XYdWPhGLTjR3nrZL5yu
	1MZmkJ62yx2MuEltXx/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peF7c-00928q-0s;
	Mon, 20 Mar 2023 13:00:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peDyT-008sA1-10
	for linux-amlogic@bombadil.infradead.org;
	Mon, 20 Mar 2023 11:46:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=K8RZphyBX8i1O0montdtL5/Jas1xXVgSIZdOxXX4/e0=; b=A6bcaCqtnO7nWAjyJXOI8Vv3yu
	koCm5Z/ZlD8uSjhvsoxGTPzsgSc2Cye/LKCEWHHgJRIc4tDPa5tX+eKSRvy+g71oyJemPBdkrBddg
	VdZHYGtk3ahAMIB9FJCdGguFd/+uWY+rrXC000pmGSP2AIUMHF1+rcb6Q57H1w48GDcVQdJW5Sar9
	fqz3kWmRQ3mUVRJhAlWCkTuwWj4Z54C3jz/ulrvvzm8v0DD/WWdMDJXcNZuU9vbeSbiOsi0jnvOa1
	cqc8Il8sFWrmtja1cJKgJujNKhF0hOcEqLNiYgqqT7Jt3PBHh5ZETYj9wmhEVFhkLB9EBG1hfw6T/
	Szo4FJFw==;
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peDyO-003uDy-2Z
	for linux-amlogic@lists.infradead.org;
	Mon, 20 Mar 2023 11:46:47 +0000
Received: by mail-wm1-x329.google.com with SMTP id iw17so1943416wmb.0
        for <linux-amlogic@lists.infradead.org>; Mon, 20 Mar 2023 04:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679312800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K8RZphyBX8i1O0montdtL5/Jas1xXVgSIZdOxXX4/e0=;
        b=VY9XJ+CGZDVB3V3QR7JXxW499vtk1P2wkMT1TLNEvjXV/nHRj6B719no8+r/e1X8zF
         +1+YgHFn1DGVN8ZEmqv394mO4vjAk3hrGG7ZApaeTFhEIX/VkTcGNpkhVlg+H397Msch
         n+JOtQNq/8pHOUoW9CP8FZukUSdw7FsYutrNnESNGrNz3CSkZ8TpPBiSkHfNOycJjzbC
         hNQ6X2TV5DvoEul4O1UmpRFAXr9VwJe/cE57zfZxjgoLIBdDfx11iRinQ/1gTpTtNIyj
         SaQSAHy81XV6ahfbVlC1Afp7TUvnibggPUTJU8z+azMQoIcJUin84EhxEUbhyOwTdaXw
         beHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679312800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K8RZphyBX8i1O0montdtL5/Jas1xXVgSIZdOxXX4/e0=;
        b=eAaCy3bPncyh//qLUs6jLSCvAQds0TnKgpOYjUasAt0wb5BRfkd2Dr1ClyE0ahsL0n
         JResFu2OS02WBleYt9hfKGzYFR66TjC2SbK11dwG34RcHp3nWtwAiccuN8j6p1nL1NT8
         8WfKIkNokxNjpzFZk9ZkgJZTmE99kY1vKPh+F6m6GOOv+zw2eI64zHnFZD8SJX5aYou1
         +daAO2fi/rrpPQ7a5NV0Qn7fWHiszNRwfQQx1k3VCI5g+kUvys+g9p3zrMJGthnuRVTa
         aUQ3sELHobseszyQtlevR4LwTXGgO+oOBfpkJopbUCx+yRhMri1aNwxqvBJ/C1tT71rw
         1tog==
X-Gm-Message-State: AO0yUKWECcvzAulx6UEHK0utBQwAV2N7t85xQXfWm8oSRF57dLZwur+P
	WG19nihzC/D1uwnsVFsQZFQ=
X-Google-Smtp-Source: AK7set/LcodvJfuvwQe0xgAbjvoh1I2lS79YV4RIfRg+IphvsKGMB9pZsgDCbdd1nBNzWC0kJT+1Jg==
X-Received: by 2002:a05:600c:d0:b0:3ee:36f:3485 with SMTP id u16-20020a05600c00d000b003ee036f3485mr1631695wmm.8.1679312799936;
        Mon, 20 Mar 2023 04:46:39 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id w2-20020a5d6802000000b002cfe687fc7asm8669836wru.67.2023.03.20.04.46.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 04:46:39 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: u-boot@lists.denx.de,
	u-boot-amlogic@groups.io,
	linux-amlogic@lists.infradead.org
Subject: [PATCH 17/33] doc: boards: amlogic: update documentation for ODROID GO ULTRA
Date: Mon, 20 Mar 2023 11:45:53 +0000
Message-Id: <20230320114609.930145-18-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230320114609.930145-1-christianshewitt@gmail.com>
References: <20230320114609.930145-1-christianshewitt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_114645_095665_1F99CA3B 
X-CRM114-Status: UNSURE (   7.84  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Improve documentation.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 doc/board/amlogic/odroid-go-ultra.rst | 25 ++++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/doc/board/amlogic/odroid-go-ultra.rst b/doc/board/amlogic/odroid-go-ultra.rst
index 8df9e0cb79..50d91394d4 100644
--- a/doc/board/amlogic/odroid-go-ultra.rst
+++ b/doc/board/amlogic/odroid-go-ultra.rst
@@ -1,10 +1,9 @@
 .. SPDX-License-Identifier: GPL-2.0+
 
-U-Boot for ODROID-GO-ULTRA
+U-Boot for ODROID-GO-ULTRA (S922X)
 ==========================
 
-The Odroid Go Ultra is a portable gaming device with the following
-characteristics:
+The ODROID GO ULTRA is a portable gaming device with the following characteristics:
 
  - Amlogic S922X SoC
  - RK817 & RK818 PMICs
@@ -19,7 +18,7 @@ characteristics:
  - 2x ADC Analog Joysticks
  - USB-C Port for USB2 Device and Charging
 
-U-Boot compilation
+U-Boot Compilation
 ------------------
 
 .. code-block:: bash
@@ -28,7 +27,19 @@ U-Boot compilation
     $ make odroid-go-ultra_defconfig
     $ make
 
-Image creation
---------------
+U-Boot Signing with Pre-Built FIP repo
+--------------------------------------
 
-Pleaser refer to :doc:`pre-generated-fip` with codename `odroid-go-ultra`
+.. code-block:: bash
+    $ git clone https://github.com/LibreELEC/amlogic-boot-fip --depth=1
+    $ cd amlogic-boot-fip
+    $ mkdir my-output-dir
+    $ ./build-fip.sh odroid-go-ultra /path/to/u-boot/u-boot.bin my-output-dir
+
+Then write the image to SD or eMMC with:
+
+.. code-block:: bash
+
+    $ DEV=/dev/boot_device
+    $ dd if=fip/u-boot.bin.sd.bin of=$DEV conv=fsync,notrunc bs=512 skip=1 seek=1
+    $ dd if=fip/u-boot.bin.sd.bin of=$DEV conv=fsync,notrunc bs=1 count=440
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
