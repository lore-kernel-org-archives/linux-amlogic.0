Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84D64C77B78
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Apr 2023 07:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:From:Date:Message-ID:Reply-To
	:Subject:To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Cua/wLIGZ/RDL4GDPwXMi37SACVQmt6Kl3Yiqv/TpMI=; b=WWgjisbLVILWC8
	GLvjwQ/GrzKin/SSUUjP9MABfKtEXKHMr4Sf0oPjH9CjMue6C3hFgJYbzXiOZVZcFaqiOEpjut84H
	DZzerQIPXq1ulFK1ltUt5HMdm3MXRY5T6tX7sxeTYhMagbo3f4i4JyGYtgYww5kIhL3GJNS3jzUES
	JkjqIwN3H5vLZCiMGi3dpseCGjdL/2fSY9gT275BCou/ibYGJNg1s2mvJmCT5xD4F7SBgtR66/rMw
	oJ0ZvsEbQAyA86b+//tJsKkFbd9657vc0FFmHLMhVspiqyFqGg6vPDh7noacR3Uy0NteoPhyfQPCx
	KUlqfdDnsTAWFDMi6yzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poJUD-00FEMU-00;
	Mon, 17 Apr 2023 07:41:17 +0000
Received: from new-shark9.inbox.lv ([194.152.32.89])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pm4hy-00GKMb-1u;
	Tue, 11 Apr 2023 03:30:15 +0000
Received: from shark4.inbox.lv (shark4 [10.0.1.84])
	by new-shark9.inbox.lv (Postfix) with ESMTP id 8A65E480AD2;
	Tue, 11 Apr 2023 06:24:29 +0300 (EEST)
Received: from shark4.inbox.lv (localhost [127.0.0.1])
	by shark4-out.inbox.lv (Postfix) with ESMTP id 7424CC007A;
	Tue, 11 Apr 2023 06:24:29 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=inbox.lv;
	s=p20220324; t=1681183469; x=1681185269;
	bh=kLlC5EhX7boxr8HaOFzHxw2ocBQaG2UFAvf0J/unxZ4=;
	h=Message-ID:Date:From:X-ESPOL:From:Date:To:Cc:Message-ID:Subject:
	 Reply-To;
	b=LPjjJkwQcDqEA59h6yp1TB3DWzeYxn+y+dZH5ycWfFYdChmW59S6HNDcCNB/MiZnH
	 HmFtSqaydbRn7JobX6oF55mFljhhodS+jtGSB3N4iRFvgl9ay+vG974SMgqLGsmcR3
	 y5OZ6yXsEguFVblQO1A1UZyf5aiu6JagTEWlTb4k=
Received: from localhost (localhost [127.0.0.1])
	by shark4-in.inbox.lv (Postfix) with ESMTP id 657B5C0050;
	Tue, 11 Apr 2023 06:24:29 +0300 (EEST)
Received: from shark4.inbox.lv ([127.0.0.1])
	by localhost (shark4.inbox.lv [127.0.0.1]) (spamfilter, port 35)
	with ESMTP id lVEZhU_MnWuK; Tue, 11 Apr 2023 06:24:29 +0300 (EEST)
Received: from mail.inbox.lv (pop1 [127.0.0.1])
	by shark4-in.inbox.lv (Postfix) with ESMTP id E55B8C00A8;
	Sun,  9 Apr 2023 20:40:09 +0300 (EEST)
Message-ID: <95908887b8303470ae95da48080a6ff7.exkcmailist@inbox.lv>
Date: Sun,  9 Apr 2023 20:40:06 +0300 (EEST)
From: exkcmailist@inbox.lv
X-Virus-Scanned: OK
X-ESPOL: AJ2EQ38VmXBDusO5Kpgfme6kmZaySiNDsCb7x6My6nVHv7Dfu99pAxyYY//ze3G0c2PD
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230410_203014_817966_9CAC215D 
X-CRM114-Status: UNSURE (   5.18  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Mon, 17 Apr 2023 00:41:15 -0700
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

From 767d273664e434a6e6975f40d63d3489efd98abe Mon Sep 17 00:00:00 2001
From: "@exkc" <exkc@exkc.moe>
Date: Mon, 10 Apr 2023 01:26:45 +0800
Subject: [PATCH v3 0/2] arm64: dts: meson-gxl: add support for Xiaomi Mibox 3

The Xiaomi Mibox 3 is a TV box based on the Amlogic S905X chipset.
There are two variants:
- 2 GiB/8GIB
- 1 GiB/4GIB

Both variants come with:
- 802.11a/b/g/n/ac wifi (BCM4345)
- HDMI , AV (CVBS) and S/PDIF optical output
- 1x USB (utilizing both USB ports provided by the SoC)

Karl Chan (2):
  dt-bindings: arm: amlogic: add Xiaomi Mibox 3 binding
  arm64: dts: meson-gxl: add support for Xiaomi Mibox 3

 .../devicetree/bindings/arm/amlogic.yaml      |   1 +
 arch/arm64/boot/dts/amlogic/Makefile          |   1 +
 .../amlogic/meson-gxl-s905x-xiaomi-mibox3.dts | 142 ++++++++++++++++++
 3 files changed, 144 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-xiaomi-mibox3.dts

-- 
2.40.0

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
