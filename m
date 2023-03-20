Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C89BC7618D
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Mar 2023 11:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GLd+TC1G3WxJsWpMXAqJ22k5XsYdy58zHaIaHkrN6vQ=; b=vC2D8FPRqr/LoC
	qESwE1UMWHiCPu1L6ep1c2PaO3jzgEOrxaXCMzBqHBxMh2Y1x5VAUQWT60EhG4DJdhXd2maeaH38w
	/8rISSle9b2RQ86rDpNHknzyNfFnSk+PNHGQdoYgpJ51R73whnbHPWiWKqEvGuRfR/4cJl7yC7bDl
	usAukpNKrB44Y/kilmmj1vNDnyt2KONQVQpWjmgwh1K8P1jaZBagy9m1SoWRmoGr89IX9LhjI3n8B
	NFSJTCiz0dxKf6LmIVhSSdh62BOI32ZQ2ApadmC6yeHkRQ8VHBPxEYvedd4Pj6Z1UXT7fpg0a/r5M
	xvs9wcw8FMDqsowI25oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peDy1-008rnY-21;
	Mon, 20 Mar 2023 11:46:21 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peDxx-008rjz-3D
	for linux-amlogic@lists.infradead.org;
	Mon, 20 Mar 2023 11:46:19 +0000
Received: by mail-wr1-x431.google.com with SMTP id j24so1127557wrd.0
        for <linux-amlogic@lists.infradead.org>; Mon, 20 Mar 2023 04:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679312777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PtLZz3+pquEcU8HzOf+k36RUHv2uWugpdgCBCali/z8=;
        b=TdYNIQY65NwCkccTwR/6PQbHYtoBny7zsJjU8rkn/98eqEW7+s5nptS8uR4t+9OZD8
         YWB6hacVStLjykFDMxWj1uuQ03zV158F5ubtYFm6P3yjaPrLQiuTQdjc1NecAM60oL3Z
         DVeE/D6/DuV5g/bNmGCClScVF+EhYZ22QOc2AbxAa1EL4ktRjzTWRNO9gKvKisLyCFgg
         ovhaNBn3dUZrE22FfFy/fxUM13k/LmWy/6OsyFsTSh40djh0OP24Na+jK5HFtrYTyqXQ
         NF1lYXw2FRcXaywj6BN/Y9XNAofp2kPbKVDp+64Z0QeXZy+y4k59GDHibHD9GvjC9aas
         juEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679312777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PtLZz3+pquEcU8HzOf+k36RUHv2uWugpdgCBCali/z8=;
        b=QVKdcojVDAssSsGdIEhnN80SGz2X8ceRhSFR4LDQ9sNbxyn42TvJ/YZKp5iLJ/XPtn
         AdpU6fDf1BxjJTNaofVanFt2CHo1uUVktqSyRo+5zlfloqitemLj4Zx1Wq6gHO7pvwgj
         cNyOvKox4Bn8taPmHY4c+AGRxuEXaJEeN6FVBRXMkiIJn3Cs3PguvreC9OGjB+XRXwuF
         vV8LVEBlojitRNBmq/pdxUJ8A/Thfl6k6ndVSk4REdZ/GXulLP7XkuBN57T4G5zpxr2a
         PiNVyng4e0Ft9ln8Kf0gQMTAPN+vlH3CANAjtK4hZjwCxoebMcKEGGRCLJ3qJKniQ/uj
         uvfQ==
X-Gm-Message-State: AO0yUKUh54ZuiC8+WiXAvj0GVKxyiF5Dv2m3jRTvl3/Ml9fc/Pdv0mBE
	twRe51y6qnR9zLOUIauYs3Y=
X-Google-Smtp-Source: AK7set/r8yj2UwEc/KtkoH4Brxyb0Au/D6PQZQDvyeue2mv9RpUje8T/bdM0fSF2m95eLKp0S4VJxA==
X-Received: by 2002:adf:f84f:0:b0:2cf:e645:aa60 with SMTP id d15-20020adff84f000000b002cfe645aa60mr13349409wrq.19.1679312777472;
        Mon, 20 Mar 2023 04:46:17 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id w2-20020a5d6802000000b002cfe687fc7asm8669836wru.67.2023.03.20.04.46.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 04:46:17 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: u-boot@lists.denx.de,
	u-boot-amlogic@groups.io,
	linux-amlogic@lists.infradead.org
Subject: [PATCH 03/33] doc: boards: amlogic: update documentation for pre-generated-fip's
Date: Mon, 20 Mar 2023 11:45:39 +0000
Message-Id: <20230320114609.930145-4-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230320114609.930145-1-christianshewitt@gmail.com>
References: <20230320114609.930145-1-christianshewitt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_044618_068233_D7DF293F 
X-CRM114-Status: GOOD (  16.29  )
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
 doc/board/amlogic/pre-generated-fip.rst | 138 +++++++++++++++---------
 1 file changed, 88 insertions(+), 50 deletions(-)

diff --git a/doc/board/amlogic/pre-generated-fip.rst b/doc/board/amlogic/pre-generated-fip.rst
index c63ea616b8..6a43d776d4 100644
--- a/doc/board/amlogic/pre-generated-fip.rst
+++ b/doc/board/amlogic/pre-generated-fip.rst
@@ -1,24 +1,57 @@
 .. SPDX-License-Identifier: GPL-2.0+
 
-Pre-Generated FIP file set
-==========================
+Pre-Generated FIP File Repo
+===========================
 
-The Amlogic ARMv8 based SoCs uses a vendor variant of the Trusted Firmware-A
-boot architecture.
+Pre-built Flattened Image Package (FIP) sources and Amlogic signing binaries for many
+commercially available boards and some Android STB devices are collected for use with
+distro build-systems here: https://github.com/LibreELEC/amlogic-boot-fip
 
-You can find documentation on the Trusted Firmware-A architecture on: https://www.trustedfirmware.org/projects/tf-a/
+Using the pre-built FIP sources to sign U-Boot is simple, e.g. for LePotato:
 
-The Trusted Firmware-A uses the following boot elements (simplified):
+.. code-block:: bash
+
+    $ git clone https://github.com/LibreELEC/amlogic-boot-fip --depth=1
+    $ cd amlogic-boot-fip
+    $ mkdir my-output-dir
+    $ ./build-fip.sh lepotato /path/to/u-boot/u-boot.bin my-output-dir
+
+Then write U-Boot to SD or eMMC with:
+
+.. code-block:: bash
+
+    $ DEV=/dev/boot_device
+    $ dd if=fip/u-boot.bin.sd.bin of=$DEV conv=fsync,notrunc bs=512 skip=1 seek=1
+    $ dd if=fip/u-boot.bin.sd.bin of=$DEV conv=fsync,notrunc bs=1 count=440
+
+Files Included
+--------------
+
+Amlogic ARMv8 SoCs use a vendor modified variant of the ARM Trusted Firmware-A boot
+architecture. See documentation here: https://www.trustedfirmware.org/projects/tf-a/
+
+Trusted Firmware-A uses the following boot elements (simplified):
+
+- BL1: First boot step implemented in ROM on Amlogic SoCs
+
+- BL2: Second boot step used to initialize the SoC main clocks & DDR interface. BL21
+  and ACS board-specific binaries must be "inserted" into the BL2 binary before signing
+  and packaging in order to be flashed on the platform
+
+- BL30: Amlogic Secure Co-Processor (SCP) firmware used to handle all system management
+  operations (DVFS, suspend/resume, ..)
+
+- BL301: Amlogic Secure Co-Processor (SCP) board-specific firmware "plug-in" to handle
+  custom DVFS & suspend-resume parameters
 
-- BL1: First boot step, implemented in ROM on Amlogic SoCs
-- BL2: Second boot step, used to initialize the SoC main clocks & DDR interface. The BL21 and ACS board-specific binaries are "inserted" in the BL32 binary before signing/packaging in order to be flashed on the platform.
-- BL30: Amlogic Secure Co-Processor (SCP) firmware used to handle all the system management operations (DVFS, suspend/resume, ...)
-- BL301: Amlogic Secure Co-Processor (SCP) board-specific firmware "plug-in" to handle custom DVFS & suspend-resume parameters
 - BL31: Initializes the interrupt controller and the system management interface (PSCI)
-- BL32 (Optional): Is the Trusted Environment Execution (TEE) Operating System to run secure Trusted Apps, e.g. OP-TEE
+
+- BL32 (Optional): Is the Trusted Environment Execution (TEE) Operating System used to
+  run secure Trusted Apps, e.g. OP-TEE
+
 - BL33: Is the last non-secure step, usually U-Boot which loads Linux
 
-Amlogic provides in binary form:
+Amlogic sources provide the following binaries:
 
 - bl2.bin
 - bl30.bin
@@ -26,10 +59,50 @@ Amlogic provides in binary form:
 - bl31.img
 - bl32.bin
 
-And for lastest SoCs, Amlogic also provides the DDR drivers used by the BL2 binary.
+For G12A/B and SM1 Amlogic also provides DDR drivers used by the BL2 binary:
+
+- ddr4_1d.fw
+- ddr4_2d.fw
+- ddr3_1d.fw
+- piei.fw
+- lpddr4_1d.fw
+- lpddr4_2d.fw
+- diag_lpddr4.fw
+- aml_ddr.fw
+
+The following files are generated from the Amlogic U-Boot fork:
+
+- acs.bin: Contains the PLL & DDR parameters for the board
+- bl301.bin: Contains the DVFS & suspend-resume handling code for the board
+- bl33.bin: U-boot binary image
+
+The acs.bin and bl301.bin files use U-Boot GPL-2.0+ headers and U-Boot build system and
+are thus considered to be issued from GPL-2.0+ source code.
+
+Amlogic alo provides pre-compiled x86_64 and Python2 binaries:
 
-The licence of these files wasn't clear until recently, the currently Amlogic distribution licence
-is the following:
+- aml_encrypt_gxb
+- aml_encrypt_gxl
+- aml_encrypt_g12a
+- aml_encrypt_g12b
+- acs_tool.pyc
+
+The repo replaces the pre-compiled acs_tool.pyc with a Python3 acs_tool.py that can be
+used with modern build hosts.
+
+The repo also provides the following files used with GXBB boards:
+
+- bl1.bin.hardkernel
+- aml_chksum
+
+The repo also supports the open-source 'gxlimg' signing tool that can be used to sign
+U-Boot binaries for GXL/GXM/G12A/G12B/SM1 boards: https://github.com/repk/gxlimg
+
+Licensing
+---------
+
+The licence of Amlogic provided binaries was not historically clear but has now been
+clarified. The current Amlogic distribution licence is below:
 
 .. code-block:: C
 
@@ -56,38 +129,3 @@ is the following:
     // THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
     // (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
     // OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
-
-The following files are generated from the Amlogic U-Boot fork:
-
-- acs.bin: contains the PLL & DDR parameters for the board
-- bl301.bin: contains the DVFS & suspend-resume handling code for the board
-- bl33.bin: U-boot binary image
-
-The acs.bin & bl301.bin uses the U-Boot GPL-2.0+ headers & build systems, thus those
-are considered issued from GPL-2.0+ source code.
-
-The tools used to sign & package those binary files are delivered in binary format
-for Intel x86-64 and Python 2.x only.
-
-A collection of pre-built with the corresponding Amlogic binaries for the common
-commercially available boards were collected in the https://github.com/LibreELEC/amlogic-boot-fip
-repository.
-
-Using this collection for a commercially available board is very easy.
-
-Here considering the Libre Computer AML-S905X-CC, which codename is `lepotato`:
-
-.. code-block:: bash
-
-    $ git clone https://github.com/LibreELEC/amlogic-boot-fip --depth=1
-    $ cd amlogic-boot-fip
-    $ mkdir my-output-dir
-    $ ./build-fip.sh lepotato /path/to/u-boot/u-boot.bin my-output-dir
-
-and then write the image to SD with:
-
-.. code-block:: bash
-
-    $ DEV=/dev/your_sd_device
-    $ dd if=my-output-dir/u-boot.bin.sd.bin of=$DEV conv=fsync,notrunc bs=512 skip=1 seek=1
-    $ dd if=my-output-dir/u-boot.bin.sd.bin of=$DEV conv=fsync,notrunc bs=1 count=444
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
