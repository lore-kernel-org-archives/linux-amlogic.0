Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 773C5C7618A
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Mar 2023 11:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lFGNoJnK8xVAMsIJ9Kipj3FAc8X7k2NmDJnuRiDVGzo=; b=gmH7U9oDyPvZXj
	djq07YqTeQil89JyTovfDZs/rgNDRgtQmrfcz8R4cxIPfTfhCMzd4FzxFfKX9f4QQwHdywlV3IgVD
	fYQARmxnGQQ42fDSRoDN6RmxzemyZ1yeOwU8K8xfE2x+jUnvlLo3hmKdrv4feL6maSff3DAOvvlsW
	juw7OLE504vcSOYlZjToB0eNxRnKPuid8A6czWsyQzAGnt8u1hkP5u3/HFyojGwJdma533QNj2Sjm
	EKzjXlFm0j8GoCvsk/zTwuXVM+47CGKlOzgdxVQo6AkHcHtoFpAT2jGmCFRuD9skwAag1z3Jynry7
	4k9iPo18bbBwNQN2R5ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peDy4-008rp5-0G;
	Mon, 20 Mar 2023 11:46:24 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peDxy-008rkn-0Z
	for linux-amlogic@lists.infradead.org;
	Mon, 20 Mar 2023 11:46:21 +0000
Received: by mail-wr1-x42a.google.com with SMTP id j24so1127465wrd.0
        for <linux-amlogic@lists.infradead.org>; Mon, 20 Mar 2023 04:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679312776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nPc4uGn1eC+DLrvkciSKBLSftxTo1x7LcT00DweY+Rk=;
        b=LOKHoAN+7jADfDSFnUivXX51V9iDLc/kYrGJ/niZ521QkHBYQR8f0hf8p9jyo/wNgD
         FhKfORuo3HN0oXrUVYqcfPg+0eGaMVig1YS6goRph8/uk8m5/75CzS9uc/pwdjccDoHZ
         61CT/oncEINfI8zMVntrddqBz4U+DwY6GuliQ2NPwI66RNHTkUe7iBnFes2Y+J9C5qLg
         XjNRXJyii2EC3OHPF+tyT6DDA7/2OP7lHhl/4eG0eLe38H9pYHFplvMr02zuXfaXspQb
         aIzp+W3bMEd0REgxmRw/4NAJo84mh/+275OEPcsBJj5eYrAo70YHq+nz5M1uDbvcDwUL
         esQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679312776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nPc4uGn1eC+DLrvkciSKBLSftxTo1x7LcT00DweY+Rk=;
        b=cKWO7QK5mLULlNUAa9g9XpgNn5Op4iKqODvoL9ELfASg3a4JmIbP848rK4mGEkzUYr
         xO8z1u8usLU/xstVmN5fGfe1uD0AECJ10E51ZEU2Ew3lzQFNsQN8jyxLqkmeTcJyHyi8
         LaNb1tynEfFI8bkzFExrVSUJz/4GVFqqUbM/cldh3RCyf1oCRfeWq6KFXu+GZt44t2Ji
         o5MZcgIIlxXpoqAJH7oCXI5Hlsv6DRf998YbzVZMcNPLfnxqQ6S6Nvw7uj0P+ksLD/ld
         HJEQHTDWicQtyG+c3q1OSK3oR4cQnQIbtoKqw6elUMd/j9FRo8Pou9zDnSmiLwlk/jON
         Xucg==
X-Gm-Message-State: AO0yUKUZooR5CoaK2LIfnP4Qw2CM78AotT8daHBkb775nIAAwHKGjB3v
	z3Jj1gWAa8Bfgs76DZPaBDT3PmuFot2KO/oq
X-Google-Smtp-Source: AK7set/JBgF54+wzF1FVL7XZ5EK3oQtTlEFg97L4kT0gzBFceQskhiJRfN4ziTe48SIsOWmqGlZxYA==
X-Received: by 2002:adf:e4c5:0:b0:2cf:ea38:973 with SMTP id v5-20020adfe4c5000000b002cfea380973mr13505002wrm.43.1679312775754;
        Mon, 20 Mar 2023 04:46:15 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id w2-20020a5d6802000000b002cfe687fc7asm8669836wru.67.2023.03.20.04.46.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 04:46:15 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: u-boot@lists.denx.de,
	u-boot-amlogic@groups.io,
	linux-amlogic@lists.infradead.org
Subject: [PATCH 02/33] doc: boards: amlogic: update documentation for boot-flow
Date: Mon, 20 Mar 2023 11:45:38 +0000
Message-Id: <20230320114609.930145-3-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230320114609.930145-1-christianshewitt@gmail.com>
References: <20230320114609.930145-1-christianshewitt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_044618_218480_5EB37DCA 
X-CRM114-Status: GOOD (  21.62  )
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
 doc/board/amlogic/boot-flow.rst | 178 ++++++++++++++++----------------
 1 file changed, 90 insertions(+), 88 deletions(-)

diff --git a/doc/board/amlogic/boot-flow.rst b/doc/board/amlogic/boot-flow.rst
index 2049672b1b..041297c512 100644
--- a/doc/board/amlogic/boot-flow.rst
+++ b/doc/board/amlogic/boot-flow.rst
@@ -3,132 +3,134 @@
 Amlogic SoC Boot Flow
 =====================
 
-The Amlogic SoCs have a pre-defined boot sequence in the SoC ROM code. Here are
-the possible boot sources of different SoC families supported by U-Boot:
+Amlogic SoCs follow a pre-defined boot sequence stored in SoC ROM code. The possible boot
+sequences of the different SoC families are:
 
-GX* & AXG family
+GX* & AXG Family
 ----------------
 
-+----------+--------------------+-------+-------+---------------+---------------+
-|          |   1                | 2     | 3     |    4          |     5         |
-+==========+====================+=======+=======+===============+===============+
-| S905     | POC=0: SPI NOR     | eMMC  | NAND  | SD Card       | USB Device    |
-| S905X    |                    |       |       |               |               |
-| S905L    |                    |       |       |               |               |
-| S905W    |                    |       |       |               |               |
-| S912     |                    |       |       |               |               |
-+----------+--------------------+-------+-------+---------------+---------------+
-| S805X    | POC=0: SPI NOR     | eMMC  | NAND  | USB Device    | -             |
-| A113D    |                    |       |       |               |               |
-| A113X    |                    |       |       |               |               |
-+----------+--------------------+-------+-------+---------------+---------------+
++----------+-------------------+---------+---------+---------+---------+
+|          |   1               | 2       | 3       | 4       | 5       |
++==========+===================+=========+=========+=========+=========+
+| S905     | POC=0: SPI NOR    | eMMC    | NAND    | SD      | USB     |
+| S905D    |                   |         |         |         |         |
+| S905L    |                   |         |         |         |         |
+| S905W    |                   |         |         |         |         |
+| S905X    |                   |         |         |         |         |
+| S905Y    |                   |         |         |         |         |
+| S912     |                   |         |         |         |         |
++----------+-------------------+---------+---------+---------+---------+
+| S805X    | POC=0: SPI NOR    | eMMC    | NAND    | USB     | -       |
+| A113D    |                   |         |         |         |         |
+| A113X    |                   |         |         |         |         |
++----------+-------------------+---------+---------+---------+---------+
 
 POC pin: `NAND_CLE`
 
-Some boards provide a button to force USB BOOT which disables the eMMC clock signal
-to bypass the eMMC stage. Others have removable eMMC modules; removing the eMMC and
-SDCard will allow boot from USB.
+Some boards provide a button to force USB boot by disabling the eMMC clock signal and
+allowing the eMMC step to be bypassed. Others have removable eMMC modules; removing an
+eMMC module and SD card will allow boot from USB.
 
-An exception is the lafrite board (aml-s805x-xx) which has no SDCard slot and boots
-from SPI. The only ways to boot the lafrite board from USB are:
+An exception is the Libre Computer AML-S805X-XX (LaFrite) board which has no SD card
+slot and boots from SPI. Booting a LaFrite board from USB requires either:
 
- - Erase the first sectors of SPI NOR flash
- - Insert an HDMI boot plug forcing boot over USB
+ - Erasing the first sectors of SPI NOR flash
+ - Inserting an HDMI boot plug forcing boot over USB
 
-The VIM1 and initial VIM2 boards provide a test point on the eMMC signals to block
-the storage from answering and continue to the next boot step.
+The VIM1 and initial VIM2 boards provide a test point on the eMMC signals to block the
+storage from answering, allowing boot to continue with the next boot step.
 
-The USB Device boot uses the first USB interface. On some boards this port is only
-available on an USB-A type connector and needs an special Type-A to Type-A cable to
-communicate with the BootROM.
+USB boot uses the first USB interface. On some boards this port is only available on a
+USB-A type connector and requires a special Type-A to Type-A cable to communicate with
+the BootROM.
 
-G12* & SM1 family
+G12* & SM1 Family
 -----------------
 
-+-------+-------+-------+---------------+---------------+---------------+---------------+
-| POC0  | POC1  | POC2  | 1             | 2             | 3             | 4             |
-+=======+=======+=======+===============+===============+===============+===============+
-| 0     | 0     | 0     | USB Device    | SPI NOR       | NAND/eMMC     | SDCard        |
-+-------+-------+-------+---------------+---------------+---------------+---------------+
-| 0     | 0     | 1     | USB Device    | NAND/eMMC     | SDCard        | -             |
-+-------+-------+-------+---------------+---------------+---------------+---------------+
-| 0     | 1     | 0     | SPI NOR       | NAND/eMMC     | SDCard        | USB Device    |
-+-------+-------+-------+---------------+---------------+---------------+---------------+
-| 0     | 1     | 1     | SPI NAND      | NAND/eMMC     | USB Device    | -             |
-+-------+-------+-------+---------------+---------------+---------------+---------------+
-| 1     | 0     | 0     | USB Device    | SPI NOR       | NAND/eMMC     | SDCard        |
-+-------+-------+-------+---------------+---------------+---------------+---------------+
-| 1     | 0     | 1     | USB Device    | NAND/eMMC     | SDCard        | -             |
-+-------+-------+-------+---------------+---------------+---------------+---------------+
-| 1     | 1     | 0     | SPI NOR       | NAND/eMMC     | SDCard        | USB Device    |
-+-------+-------+-------+---------------+---------------+---------------+---------------+
-| 1     | 1     | 1     | NAND/eMMC     | SDCard        | USB Device    | -             |
-+-------+-------+-------+---------------+---------------+---------------+---------------+
-
-The last option (1/1/1) is the normal default seen on production devices.
++-------+-------+-------+------------+------------+------------+-----------+
+| POC0  | POC1  | POC2  | 1          | 2          | 3          | 4         |
++=======+=======+=======+============+============+============+===========+
+| 0     | 0     | 0     | USB        | SPI-NOR    | NAND/eMMC  | SD        |
++-------+-------+-------+------------+------------+-------------+----------+
+| 0     | 0     | 1     | USB        | NAND/eMMC  | SD         | -         |
++-------+-------+-------+------------+------------+------------+-----------+
+| 0     | 1     | 0     | SPI-NOR    | NAND/eMMC  | SD         | USB       |
++-------+-------+-------+------------+------------+------------+-----------+
+| 0     | 1     | 1     | SPI-NAND   | NAND/eMMC  | USB        | -         |
++-------+-------+-------+------------+------------+------------+-----------+
+| 1     | 0     | 0     | USB        | SPI-NOR    | NAND/eMMC  | SD        |
++-------+-------+-------+------------+------------+------------+-----------+
+| 1     | 0     | 1     | USB        | NAND/eMMC  | SD         | -         |
++-------+-------+-------+------------+------------+------------+-----------+
+| 1     | 1     | 0     | SPI-NOR    | NAND/eMMC  | SD         | USB       |
++-------+-------+-------+------------+------------+------------+-----------+
+| 1     | 1     | 1     | NAND/eMMC  | SD         | USB        | -         |
++-------+-------+-------+------------+------------+------------+-----------+
+
+The last option (1/1/1) is the normal default seen on production devices:
 
  * POC0 pin: `BOOT_4` (0 and all other 1 means SPI NAND boot first)
  * POC1 pin: `BOOT_5` (0 and all other 1 means USB Device boot first
  * POC2 pin: `BOOT_6` (0 and all other 1 means SPI NOR boot first)
 
 Most boards provide a button to force USB BOOT which lowers `BOOT_5` to 0. Some boards
-provide a test point on the eMMC or SPI NOR clock signals to block the storage from
-answering and continue to the next boot step.
+provide a test point on eMMC or SPI NOR clock signals to block storage from answering
+and allowing boot to continue from the next boot step.
 
-The Khadas VIM3/3L boards embed a microcontroller which sets POC signals according
-to its configuration or a specific key press sequence to either boot from SPI NOR
-or eMMC then SDCard, or boot as an USB Device.
+The Khadas VIM3/3L boards embed a microcontroller which sets POC signals according to
+its configuration or a specific key press sequence to either boot from SPI NOR or eMMC
+then SD card, or boot as a USB device.
 
-The Odroid N2/N2+ has a hardware switch to select between SPI NOR or eMMC boot.
+The Odroid N2/N2+ has a hardware switch to select between SPI NOR or eMMC boot. The
+Odroid HC4 has a button to disable SPI-NOR allowing boot from SD card.
 
 Boot Modes
 ----------
 
- * SDCard
+ * SD
 
-The BootROM fetches the first SDCard sectors in one sequence, then checks the content
-of the data. The BootROM expects to find the FIP binary in sector 1, 512 bytes offset
-from the start.
+The BootROM fetches the first SD card sectors in one sequence then checks the content of
+the data. It expects to find the FIP binary in sector 1, 512 bytes offset from the start.
 
  * eMMC
 
-The BootROM fetches the first sectors in one sequence, first on the main partition,
-and then on the Boot0 followed by Boot1 HW partitions. After each read, the BootROM
-checks the data and looks to the next partition if it fails. The BootROM expects to
-find the FIP binary in sector 1, 512 bytes offset from the start.
+The BootROM fetches the first sectors of the main partition in one sequence then checks
+the content of the data. On GXL and newer boards it expects to find the FIP binary in
+sector 1, 512 bytes offset from the start. If not found it checks the boot0 partition,
+then the boot1 partition. On GXBB it expects to find the FIP binary at an offset that
+conflicts with MBR partition tables, but this has been worked around (thus avoiding the
+need for a partition scheme that relocates the MBR). For a more detailed explanation
+please see: https://github.com/LibreELEC/amlogic-boot-fip/pull/8
 
- * SPI NOR
+ * SPI-NOR
 
-The BootROM fetches the first SPI NOR sectors in one sequence, then checks the content
-of the data. The BootROM expects to find the FIP binary in sector 1, 512 bytes offset
-from the start.
+The BootROM fetches the first SPI NOR sectors in one sequence then checks the content of
+the data. It expects to find the FIP binary in sector 1, 512 bytes offset from the start.
 
- * NAND & SPI NAND
+ * NAND & SPI-NAND
 
 These modes are rarely used in open platforms and no details are available.
 
- * USB Device
+ * USB
 
-The BootROM sets the USB Gadget interface to serve a custom USB protocol with the
-USB ID 1b8e:c003. The Amlogic `update` utility is designed to use this protocol. It
-is also implemented in the Amlogic Vendor U-Boot.
+The BootROM supports a custom USB protocol and sets the USB Gadget interface to use the
+USB ID 1b8e:c003. The Amlogic `update` utility uses this protocol. It is also supported
+in the Amlogic vendor U-Boot sources.
 
-The open-source `pyamlboot` utility https://github.com/superna9999/pyamlboot also
-implements this protocol and can load U-Boot in memory in order to start the SoC
-without any attached storage or to recover from a failed/incorrect image flash.
+The `pyamlboot` utility https://github.com/superna9999/pyamlboot is open-source and also
+implements the USB protocol. It can load U-Boot into memory to start the SoC without the
+storage being attached, or to recover the device from a failed/incorrect image flash.
 
-HDMI Recovery
--------------
+HDMI Recovery Dongle
+--------------------
 
-The BootROM also briefly reads 8 bytes at address I2C 0x52 offset 0xf8 (248) on the
-HDMI DDC bus. If the content is `boot@USB` it will force USB boot mode. If the content
-is `boot@SDC` it will force SDCard boot mode.
+The BootROM also reads 8 bytes at address I2C 0x52 offset 0xf8 (248) on the HDMI DDC bus
+during startup. The content `boot@USB` forces USB boot. The content `boot@SDC` forces SD
+card boot. The content `boot@SPI` forces SPI-NOT boot. If an SD card or USB device does
+not enumerate the BootROM continues with the normal boot sequence.
 
-If USB Device doesn't enumerate or SD Card boot step doesn't work, the BootROM will
-continue with the normal boot sequence.
+HDMI boot dongles can be created by connecting a 256bytes EEPROM set to answer on address
+0x52, with `boot@USB` or `boot@SDC` or `boot@SPI` programmed at offset 0xf8 (248).
 
-Special boot dongles can be built by connecting a 256bytes EEPROM set to answer on
-address 0x52, and program `boot@USB` or `boot@SDC` at offset 0xf8 (248).
-
-Note: If the SoC is booted with USB Device forced at first step, it will keep the boot
-order on warm reboot. Only cold reboot (power removed) will reset the boot order.
+If the SoC is booted with USB Device forced at first step, it will retain the forced boot
+order on warm reboot. Only cold reboot (removing power) will reset the boot order.
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
