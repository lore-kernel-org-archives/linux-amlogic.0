Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 453B7C761AF
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 Mar 2023 14:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HgYpxl0S5a9KEjVCTGqxxLxs9+zQA8J6r+xQXnSsV9E=; b=zXXMzkghp9OfMd
	bmLo9o9Rk3Xxc73rU8VxAJ6Nn+p/noGAgBA20AWzfym7OwLrughRFQL35vBPnJ522rg+Q8TzzbNmv
	eFsZ0fP3mLLStjb9rPMG/adCVEbvcVmLOOr0zWRhm0wCBVwEVVd7uOcO6TEmGMNRPnbomYtizjlzG
	lm1L+Yrp1JYQIfbaIVsLEG5l2pfnjSWiKqjG7YaU108/d//SKREeCxP6hot7noUSQqWNq1DFi8/Sr
	uDgDg3jV8AfOvCPshtjVHu25vAiBOSCGWaxxCtF7TLlkj+AQDy6+Vk/QFqodzk7RKAfCe/VyOjLbv
	XsjmSdOkRqyrCa0GvbRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfLyy-002Bej-2D;
	Thu, 23 Mar 2023 14:32:00 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfLyu-002Bak-0u
	for linux-amlogic@lists.infradead.org;
	Thu, 23 Mar 2023 14:31:58 +0000
Received: by mail-wr1-x42f.google.com with SMTP id r29so20705925wra.13
        for <linux-amlogic@lists.infradead.org>; Thu, 23 Mar 2023 07:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679581910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=epYrPSJhOhZ7K/HDQzSY0C0KHXwvBxFji3PxnRwCpZM=;
        b=hDMC7WSy5NuIMkMZZQu8EKcu4GzpJQ9i+3O7GY2ZwjRBwxoLCKuGKEjQ+XbGQbEH7c
         aHvnEZEtXw6gzj6SrJi0b9Mnb8JBMcdHDkVn2MyGyOEeabI8gDQyV5Gf4PZCC47OYh9a
         oFyaWnQTXdAw/nVFddY9CIr0K8nxVhoO7OKWY/ghon37AY0RlqqksSeblhb6B30KZpTP
         6QPN5nY8nOHV/s1YzplSF2t1gu6xzYU/waaUfquPRbbVXVqqKCSU96WEPhny1HUDDayX
         isQnwRB8HnH+8clHSODdafYcBNMQFPNAqAIbOO6KLch+eOc1mmd4FWHJWvqZwfFNiVEG
         MdHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679581910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=epYrPSJhOhZ7K/HDQzSY0C0KHXwvBxFji3PxnRwCpZM=;
        b=cjGLLaSCrf9xf0okieMQSbdJeM/wezAGHARfz51xoyI1GhMn78aSMUifKve9CzwuVM
         sh/wSs77kJPqQPEgMbrLp0kqSgSQfv2HFyHVedbHATrgvQCXvc57vGlwtJHWyeilF/x4
         Bm5+Zqm6D8dqeBeMTog+F4qhmrIq/RcJBc2H1rOAqaVxMdRKCOkiPNN0i5yCYRi+SfUD
         gj0STfH0iLXGDjIeyTtQrXl008Ff9cq0eOo1YDJLK4BGpCGSSALcWMflhqYTKsc7FrNo
         y6Js4a0bX634RnH8apXtVrzfjyzKG2jvtuoXIsit0rhmppOJmCg12PNjY++AamiukP5p
         YTQg==
X-Gm-Message-State: AAQBX9cd3z3y/sUFh+DrJDU+B4DcSpbghRZuC0kTSM/D7LARxIiF2LOz
	ujxTiabag5RaFTKtdZ8S8sAp7Z0bXLapZSCr
X-Google-Smtp-Source: AKy350Yd0oh0cvyvEZCdt8457fsLrREKb7QrrsnW173O8gLZdHI1kt6Gucxe1aYnpeUyVtgMQhDHsw==
X-Received: by 2002:adf:fc4a:0:b0:2cf:ea9e:2585 with SMTP id e10-20020adffc4a000000b002cfea9e2585mr2724203wrs.59.1679581909916;
        Thu, 23 Mar 2023 07:31:49 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id a6-20020a056000100600b002c8ed82c56csm16311242wrx.116.2023.03.23.07.31.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 07:31:49 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: u-boot@lists.denx.de,
	u-boot-amlogic@groups.io,
	linux-amlogic@lists.infradead.org
Subject: [PATCH v2 02/14] docs: boards: amlogic: fix blank-line typo in recently updated docs
Date: Thu, 23 Mar 2023 14:31:30 +0000
Message-Id: <20230323143142.780306-3-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230323143142.780306-1-christianshewitt@gmail.com>
References: <20230323143142.780306-1-christianshewitt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_073156_320641_E6BEA04D 
X-CRM114-Status: UNSURE (   9.11  )
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

There needs to be a blank line between the start of the code block
and the first line of content. Fix for all recently updated docs.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 doc/board/amlogic/bananapi-cm4io.rst    | 1 +
 doc/board/amlogic/bananapi-m5.rst       | 1 +
 doc/board/amlogic/beelink-gskingx.rst   | 1 +
 doc/board/amlogic/beelink-gtking.rst    | 1 +
 doc/board/amlogic/beelink-gtkingpro.rst | 1 +
 doc/board/amlogic/jethub-j100.rst       | 1 +
 doc/board/amlogic/jethub-j80.rst        | 1 +
 doc/board/amlogic/khadas-vim.rst        | 1 +
 doc/board/amlogic/khadas-vim2.rst       | 1 +
 doc/board/amlogic/khadas-vim3.rst       | 1 +
 doc/board/amlogic/khadas-vim3l.rst      | 1 +
 doc/board/amlogic/libretech-ac.rst      | 1 +
 doc/board/amlogic/libretech-cc.rst      | 1 +
 doc/board/amlogic/nanopi-k2.rst         | 1 +
 doc/board/amlogic/odroid-c2.rst         | 1 +
 doc/board/amlogic/odroid-c4.rst         | 1 +
 doc/board/amlogic/odroid-go-ultra.rst   | 1 +
 doc/board/amlogic/odroid-hc4.rst        | 1 +
 doc/board/amlogic/odroid-n2.rst         | 1 +
 doc/board/amlogic/odroid-n2l.rst        | 1 +
 doc/board/amlogic/p200.rst              | 1 +
 doc/board/amlogic/p201.rst              | 1 +
 doc/board/amlogic/q200.rst              | 1 +
 doc/board/amlogic/radxa-zero.rst        | 1 +
 doc/board/amlogic/s400.rst              | 1 +
 doc/board/amlogic/sei510.rst            | 1 +
 doc/board/amlogic/sei610.rst            | 1 +
 doc/board/amlogic/u200.rst              | 1 +
 doc/board/amlogic/w400.rst              | 1 +
 doc/board/amlogic/wetek-core2.rst       | 1 +
 30 files changed, 30 insertions(+)

diff --git a/doc/board/amlogic/bananapi-cm4io.rst b/doc/board/amlogic/bananapi-cm4io.rst
index aabe2ef197..672cbee7d8 100644
--- a/doc/board/amlogic/bananapi-cm4io.rst
+++ b/doc/board/amlogic/bananapi-cm4io.rst
@@ -44,6 +44,7 @@ U-Boot Signing with Pre-Built FIP repo
 --------------------------------------
 
 .. code-block:: bash
+
     $ git clone https://github.com/LibreELEC/amlogic-boot-fip --depth=1
     $ cd amlogic-boot-fip
     $ mkdir my-output-dir
diff --git a/doc/board/amlogic/bananapi-m5.rst b/doc/board/amlogic/bananapi-m5.rst
index ddc14b4eef..009ea0ba94 100644
--- a/doc/board/amlogic/bananapi-m5.rst
+++ b/doc/board/amlogic/bananapi-m5.rst
@@ -33,6 +33,7 @@ U-Boot Signing with Pre-Built FIP repo
 --------------------------------------
 
 .. code-block:: bash
+
     $ git clone https://github.com/LibreELEC/amlogic-boot-fip --depth=1
     $ cd amlogic-boot-fip
     $ mkdir my-output-dir
diff --git a/doc/board/amlogic/beelink-gskingx.rst b/doc/board/amlogic/beelink-gskingx.rst
index 987d358c77..8a8296e863 100644
--- a/doc/board/amlogic/beelink-gskingx.rst
+++ b/doc/board/amlogic/beelink-gskingx.rst
@@ -38,6 +38,7 @@ U-Boot Signing with Pre-Built FIP repo
 --------------------------------------
 
 .. code-block:: bash
+
     $ git clone https://github.com/LibreELEC/amlogic-boot-fip --depth=1
     $ cd amlogic-boot-fip
     $ mkdir my-output-dir
diff --git a/doc/board/amlogic/beelink-gtking.rst b/doc/board/amlogic/beelink-gtking.rst
index 342887d584..8171b698c7 100644
--- a/doc/board/amlogic/beelink-gtking.rst
+++ b/doc/board/amlogic/beelink-gtking.rst
@@ -34,6 +34,7 @@ U-Boot Signing with Pre-Built FIP repo
 --------------------------------------
 
 .. code-block:: bash
+
     $ git clone https://github.com/LibreELEC/amlogic-boot-fip --depth=1
     $ cd amlogic-boot-fip
     $ mkdir my-output-dir
diff --git a/doc/board/amlogic/beelink-gtkingpro.rst b/doc/board/amlogic/beelink-gtkingpro.rst
index 541938b103..eb0b7d4fd1 100644
--- a/doc/board/amlogic/beelink-gtkingpro.rst
+++ b/doc/board/amlogic/beelink-gtkingpro.rst
@@ -35,6 +35,7 @@ U-Boot Signing with Pre-Built FIP repo
 --------------------------------------
 
 .. code-block:: bash
+
     $ git clone https://github.com/LibreELEC/amlogic-boot-fip --depth=1
     $ cd amlogic-boot-fip
     $ mkdir my-output-dir
diff --git a/doc/board/amlogic/jethub-j100.rst b/doc/board/amlogic/jethub-j100.rst
index 0d63976789..86acdafa06 100644
--- a/doc/board/amlogic/jethub-j100.rst
+++ b/doc/board/amlogic/jethub-j100.rst
@@ -42,6 +42,7 @@ U-Boot Signing with Pre-Built FIP repo
 --------------------------------------
 
 .. code-block:: bash
+
     $ git clone https://github.com/LibreELEC/amlogic-boot-fip --depth=1
     $ cd amlogic-boot-fip
     $ mkdir my-output-dir
diff --git a/doc/board/amlogic/jethub-j80.rst b/doc/board/amlogic/jethub-j80.rst
index d20fbad4c5..9195df6905 100644
--- a/doc/board/amlogic/jethub-j80.rst
+++ b/doc/board/amlogic/jethub-j80.rst
@@ -34,6 +34,7 @@ U-Boot Signing with Pre-Built FIP repo
 --------------------------------------
 
 .. code-block:: bash
+
     $ git clone https://github.com/LibreELEC/amlogic-boot-fip --depth=1
     $ cd amlogic-boot-fip
     $ mkdir my-output-dir
diff --git a/doc/board/amlogic/khadas-vim.rst b/doc/board/amlogic/khadas-vim.rst
index f1fbe1a8a6..20370ed49a 100644
--- a/doc/board/amlogic/khadas-vim.rst
+++ b/doc/board/amlogic/khadas-vim.rst
@@ -31,6 +31,7 @@ U-Boot Signing with Pre-Built FIP repo
 --------------------------------------
 
 .. code-block:: bash
+
     $ git clone https://github.com/LibreELEC/amlogic-boot-fip --depth=1
     $ cd amlogic-boot-fip
     $ mkdir my-output-dir
diff --git a/doc/board/amlogic/khadas-vim2.rst b/doc/board/amlogic/khadas-vim2.rst
index 78d47f93fe..58f18701f7 100644
--- a/doc/board/amlogic/khadas-vim2.rst
+++ b/doc/board/amlogic/khadas-vim2.rst
@@ -32,6 +32,7 @@ U-Boot Signing with Pre-Built FIP repo
 --------------------------------------
 
 .. code-block:: bash
+
     $ git clone https://github.com/LibreELEC/amlogic-boot-fip --depth=1
     $ cd amlogic-boot-fip
     $ mkdir my-output-dir
diff --git a/doc/board/amlogic/khadas-vim3.rst b/doc/board/amlogic/khadas-vim3.rst
index 88f2e0ebbe..4959590b8b 100644
--- a/doc/board/amlogic/khadas-vim3.rst
+++ b/doc/board/amlogic/khadas-vim3.rst
@@ -53,6 +53,7 @@ U-Boot Signing with Pre-Built FIP repo
 --------------------------------------
 
 .. code-block:: bash
+
     $ git clone https://github.com/LibreELEC/amlogic-boot-fip --depth=1
     $ cd amlogic-boot-fip
     $ mkdir my-output-dir
diff --git a/doc/board/amlogic/khadas-vim3l.rst b/doc/board/amlogic/khadas-vim3l.rst
index 935f43c725..cd21466f70 100644
--- a/doc/board/amlogic/khadas-vim3l.rst
+++ b/doc/board/amlogic/khadas-vim3l.rst
@@ -53,6 +53,7 @@ U-Boot Signing with Pre-Built FIP repo
 --------------------------------------
 
 .. code-block:: bash
+
     $ git clone https://github.com/LibreELEC/amlogic-boot-fip --depth=1
     $ cd amlogic-boot-fip
     $ mkdir my-output-dir
diff --git a/doc/board/amlogic/libretech-ac.rst b/doc/board/amlogic/libretech-ac.rst
index 6ebb7f646d..fa151c0d00 100644
--- a/doc/board/amlogic/libretech-ac.rst
+++ b/doc/board/amlogic/libretech-ac.rst
@@ -32,6 +32,7 @@ U-Boot Signing with Pre-Built FIP repo
 --------------------------------------
 
 .. code-block:: bash
+
     $ git clone https://github.com/LibreELEC/amlogic-boot-fip --depth=1
     $ cd amlogic-boot-fip
     $ mkdir my-output-dir
diff --git a/doc/board/amlogic/libretech-cc.rst b/doc/board/amlogic/libretech-cc.rst
index d1d3ce49f6..08a84a41c0 100644
--- a/doc/board/amlogic/libretech-cc.rst
+++ b/doc/board/amlogic/libretech-cc.rst
@@ -41,6 +41,7 @@ U-Boot Signing with Pre-Built FIP repo
 --------------------------------------
 
 .. code-block:: bash
+
     $ git clone https://github.com/LibreELEC/amlogic-boot-fip --depth=1
     $ cd amlogic-boot-fip
     $ mkdir my-output-dir
diff --git a/doc/board/amlogic/nanopi-k2.rst b/doc/board/amlogic/nanopi-k2.rst
index 2316dae0ec..53a0a41c88 100644
--- a/doc/board/amlogic/nanopi-k2.rst
+++ b/doc/board/amlogic/nanopi-k2.rst
@@ -31,6 +31,7 @@ U-Boot Signing with Pre-Built FIP repo
 --------------------------------------
 
 .. code-block:: bash
+
     $ git clone https://github.com/LibreELEC/amlogic-boot-fip --depth=1
     $ cd amlogic-boot-fip
     $ mkdir my-output-dir
diff --git a/doc/board/amlogic/odroid-c2.rst b/doc/board/amlogic/odroid-c2.rst
index 82eea3820e..922ab0c0b4 100644
--- a/doc/board/amlogic/odroid-c2.rst
+++ b/doc/board/amlogic/odroid-c2.rst
@@ -31,6 +31,7 @@ U-Boot Signing with Pre-Built FIP repo
 --------------------------------------
 
 .. code-block:: bash
+
     $ git clone https://github.com/LibreELEC/amlogic-boot-fip --depth=1
     $ cd amlogic-boot-fip
     $ mkdir my-output-dir
diff --git a/doc/board/amlogic/odroid-c4.rst b/doc/board/amlogic/odroid-c4.rst
index 89198cda91..6994b958cf 100644
--- a/doc/board/amlogic/odroid-c4.rst
+++ b/doc/board/amlogic/odroid-c4.rst
@@ -32,6 +32,7 @@ U-Boot Signing with Pre-Built FIP repo
 --------------------------------------
 
 .. code-block:: bash
+
     $ git clone https://github.com/LibreELEC/amlogic-boot-fip --depth=1
     $ cd amlogic-boot-fip
     $ mkdir my-output-dir
diff --git a/doc/board/amlogic/odroid-go-ultra.rst b/doc/board/amlogic/odroid-go-ultra.rst
index 50d91394d4..c5bce32333 100644
--- a/doc/board/amlogic/odroid-go-ultra.rst
+++ b/doc/board/amlogic/odroid-go-ultra.rst
@@ -31,6 +31,7 @@ U-Boot Signing with Pre-Built FIP repo
 --------------------------------------
 
 .. code-block:: bash
+
     $ git clone https://github.com/LibreELEC/amlogic-boot-fip --depth=1
     $ cd amlogic-boot-fip
     $ mkdir my-output-dir
diff --git a/doc/board/amlogic/odroid-hc4.rst b/doc/board/amlogic/odroid-hc4.rst
index 94c3312022..1d37be2d80 100644
--- a/doc/board/amlogic/odroid-hc4.rst
+++ b/doc/board/amlogic/odroid-hc4.rst
@@ -33,6 +33,7 @@ U-Boot Signing with Pre-Built FIP repo
 --------------------------------------
 
 .. code-block:: bash
+
     $ git clone https://github.com/LibreELEC/amlogic-boot-fip --depth=1
     $ cd amlogic-boot-fip
     $ mkdir my-output-dir
diff --git a/doc/board/amlogic/odroid-n2.rst b/doc/board/amlogic/odroid-n2.rst
index 8ca1f89699..883720f8fb 100644
--- a/doc/board/amlogic/odroid-n2.rst
+++ b/doc/board/amlogic/odroid-n2.rst
@@ -34,6 +34,7 @@ U-Boot Signing with Pre-Built FIP repo
 --------------------------------------
 
 .. code-block:: bash
+
     $ git clone https://github.com/LibreELEC/amlogic-boot-fip --depth=1
     $ cd amlogic-boot-fip
     $ mkdir my-output-dir
diff --git a/doc/board/amlogic/odroid-n2l.rst b/doc/board/amlogic/odroid-n2l.rst
index b264ace7f5..6d58175974 100644
--- a/doc/board/amlogic/odroid-n2l.rst
+++ b/doc/board/amlogic/odroid-n2l.rst
@@ -30,6 +30,7 @@ U-Boot Signing with Pre-Built FIP repo
 --------------------------------------
 
 .. code-block:: bash
+
     $ git clone https://github.com/LibreELEC/amlogic-boot-fip --depth=1
     $ cd amlogic-boot-fip
     $ mkdir my-output-dir
diff --git a/doc/board/amlogic/p200.rst b/doc/board/amlogic/p200.rst
index b5c6ad096e..e223897a19 100644
--- a/doc/board/amlogic/p200.rst
+++ b/doc/board/amlogic/p200.rst
@@ -31,6 +31,7 @@ U-Boot Signing with Pre-Built FIP repo
 --------------------------------------
 
 .. code-block:: bash
+
     $ git clone https://github.com/LibreELEC/amlogic-boot-fip --depth=1
     $ cd amlogic-boot-fip
     $ mkdir my-output-dir
diff --git a/doc/board/amlogic/p201.rst b/doc/board/amlogic/p201.rst
index b3dce4204e..28aae98d99 100644
--- a/doc/board/amlogic/p201.rst
+++ b/doc/board/amlogic/p201.rst
@@ -31,6 +31,7 @@ U-Boot Signing with Pre-Built FIP repo
 --------------------------------------
 
 .. code-block:: bash
+
     $ git clone https://github.com/LibreELEC/amlogic-boot-fip --depth=1
     $ cd amlogic-boot-fip
     $ mkdir my-output-dir
diff --git a/doc/board/amlogic/q200.rst b/doc/board/amlogic/q200.rst
index c304980579..32ea4722e4 100644
--- a/doc/board/amlogic/q200.rst
+++ b/doc/board/amlogic/q200.rst
@@ -31,6 +31,7 @@ U-Boot Signing with Pre-Built FIP repo
 --------------------------------------
 
 .. code-block:: bash
+
     $ git clone https://github.com/LibreELEC/amlogic-boot-fip --depth=1
     $ cd amlogic-boot-fip
     $ mkdir my-output-dir
diff --git a/doc/board/amlogic/radxa-zero.rst b/doc/board/amlogic/radxa-zero.rst
index e8a8d87320..14ce3cfd49 100644
--- a/doc/board/amlogic/radxa-zero.rst
+++ b/doc/board/amlogic/radxa-zero.rst
@@ -32,6 +32,7 @@ U-Boot Signing with Pre-Built FIP repo
 --------------------------------------
 
 .. code-block:: bash
+
     $ git clone https://github.com/LibreELEC/amlogic-boot-fip --depth=1
     $ cd amlogic-boot-fip
     $ mkdir my-output-dir
diff --git a/doc/board/amlogic/s400.rst b/doc/board/amlogic/s400.rst
index b00fe64e1b..59dda82375 100644
--- a/doc/board/amlogic/s400.rst
+++ b/doc/board/amlogic/s400.rst
@@ -31,6 +31,7 @@ U-Boot Signing with Pre-Built FIP repo
 --------------------------------------
 
 .. code-block:: bash
+
     $ git clone https://github.com/LibreELEC/amlogic-boot-fip --depth=1
     $ cd amlogic-boot-fip
     $ mkdir my-output-dir
diff --git a/doc/board/amlogic/sei510.rst b/doc/board/amlogic/sei510.rst
index 09b0f53e16..87cb701a08 100644
--- a/doc/board/amlogic/sei510.rst
+++ b/doc/board/amlogic/sei510.rst
@@ -27,6 +27,7 @@ U-Boot Signing with Pre-Built FIP repo
 --------------------------------------
 
 .. code-block:: bash
+
     $ git clone https://github.com/LibreELEC/amlogic-boot-fip --depth=1
     $ cd amlogic-boot-fip
     $ mkdir my-output-dir
diff --git a/doc/board/amlogic/sei610.rst b/doc/board/amlogic/sei610.rst
index 84aaeff4ed..64f62575e2 100644
--- a/doc/board/amlogic/sei610.rst
+++ b/doc/board/amlogic/sei610.rst
@@ -29,6 +29,7 @@ U-Boot Signing with Pre-Built FIP repo
 --------------------------------------
 
 .. code-block:: bash
+
     $ git clone https://github.com/LibreELEC/amlogic-boot-fip --depth=1
     $ cd amlogic-boot-fip
     $ mkdir my-output-dir
diff --git a/doc/board/amlogic/u200.rst b/doc/board/amlogic/u200.rst
index 6d1d66b4ea..8254d4dfdb 100644
--- a/doc/board/amlogic/u200.rst
+++ b/doc/board/amlogic/u200.rst
@@ -32,6 +32,7 @@ U-Boot Signing with Pre-Built FIP repo
 --------------------------------------
 
 .. code-block:: bash
+
     $ git clone https://github.com/LibreELEC/amlogic-boot-fip --depth=1
     $ cd amlogic-boot-fip
     $ mkdir my-output-dir
diff --git a/doc/board/amlogic/w400.rst b/doc/board/amlogic/w400.rst
index 634fe1298d..d2a8107b58 100644
--- a/doc/board/amlogic/w400.rst
+++ b/doc/board/amlogic/w400.rst
@@ -32,6 +32,7 @@ U-Boot Signing with Pre-Built FIP repo
 --------------------------------------
 
 .. code-block:: bash
+
     $ git clone https://github.com/LibreELEC/amlogic-boot-fip --depth=1
     $ cd amlogic-boot-fip
     $ mkdir my-output-dir
diff --git a/doc/board/amlogic/wetek-core2.rst b/doc/board/amlogic/wetek-core2.rst
index 5eba566af4..137262ec30 100644
--- a/doc/board/amlogic/wetek-core2.rst
+++ b/doc/board/amlogic/wetek-core2.rst
@@ -31,6 +31,7 @@ U-Boot Signing with Pre-Built FIP repo
 --------------------------------------
 
 .. code-block:: bash
+
     $ git clone https://github.com/LibreELEC/amlogic-boot-fip --depth=1
     $ cd amlogic-boot-fip
     $ mkdir my-output-dir
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
