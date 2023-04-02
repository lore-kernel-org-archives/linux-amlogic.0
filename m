Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA8EBC7619A
	for <linux-amlogic@archiver.kernel.org>; Sun,  2 Apr 2023 08:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:
	From:MIME-Version:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UI1HumEMovqwAxOwEfi4jR8TUeO9vJp7oDDTN+gkoSQ=; b=kbGBsGGKAsZHZ9
	SsoloXnhlbyCU4udNFRr8Q7Mb4SFE41RyQpsmky50EpaozTeoHWhQbwuDRWvnPKQ92sjV/QivpCIY
	82484fqTtQ7Rj652Pv+ytiZlWEhxH6DivudxVvzAE0N8mh/G0BmwL30/udNe8Ors/y3LfeHaraEru
	Iw8/wLcp5feDclFYP0MHGLc//LFj1OsO5pHzSvK4PHPOFHwETwpRipRUNTepoo/hcBBkIXQlCAhSy
	vNzpJIXk5cwxLi/UwPBW8uplofzz56rQEjTzDQP7B2Xa699YNmWPvjyjgQagau9k1F4FJsnVHg1BV
	f8H6jj/GKCVU//uECwQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pisnb-00C1L2-3D;
	Sun, 02 Apr 2023 08:10:52 +0000
Received: from mail-ot1-f54.google.com ([209.85.210.54])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pisnZ-00C1Kb-1T
	for linux-amlogic@lists.infradead.org;
	Sun, 02 Apr 2023 08:10:50 +0000
Received: by mail-ot1-f54.google.com with SMTP id a30-20020a9d3e1e000000b006a13f728172so10958065otd.3
        for <linux-amlogic@lists.infradead.org>; Sun, 02 Apr 2023 01:10:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680423048;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=29YYJrYDhT+9UyWZEkCjUn9HsfHoLWU9D1aux/U2VU4=;
        b=Tb9rn0pewnbf75JttW71ME8fFog/YQCP4sPHfNaSLaBsxOxvhW5CsGRLhYonWVwkP1
         iqcH8eEVk9n10HQFCBVJdB8nSvUpF6chOAp94TCNaG60xKZ+/ENKbs1GbywRo5XPlUDg
         JZBx8kB8+5S8s5OqEDKi3DxmsVN4CEnXqJf05BabI0a8xUVt6SajAB0lggQ6hN81MWYQ
         EgpwYriqroceMYlLn8es7+ZqGaoX8tevJT1OEJ3HlBUVqY0Rh6cYe078P1R5uEiv6sv5
         AylIYPvF3qWI8jlJiEqebSxUILpQyfNTCFgjJQnnC1HSK2qKDwwpthuOMStoxkLhQPwv
         kboQ==
X-Gm-Message-State: AO0yUKWQB54Vh4t7XZYrjGUI76UaBlztenB94BkzpCz+OpyI/DHl75kC
	rhrXdy81/09kzTR/l1qbpv8/XCivDgEpXA==
X-Google-Smtp-Source: AK7set8+6ZjV/toJH15q0+ReaZANOtVbPO+sOBI6fq5hnpxmNdzOgR/xheB/tcDMG3LYlLxWN/lJwA==
X-Received: by 2002:a9d:6b07:0:b0:69f:8859:9fd3 with SMTP id g7-20020a9d6b07000000b0069f88599fd3mr16187767otp.14.1680423047731;
        Sun, 02 Apr 2023 01:10:47 -0700 (PDT)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com. [209.85.160.46])
        by smtp.gmail.com with ESMTPSA id e193-20020a4a55ca000000b005255e556399sm2730288oob.43.2023.04.02.01.10.47
        for <linux-amlogic@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Apr 2023 01:10:47 -0700 (PDT)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-17aaa51a911so27670920fac.5
        for <linux-amlogic@lists.infradead.org>; Sun, 02 Apr 2023 01:10:47 -0700 (PDT)
X-Received: by 2002:a05:687c:19c:b0:17b:5f31:7ae3 with SMTP id
 yo28-20020a05687c019c00b0017b5f317ae3mr7868128oab.5.1680423046878; Sun, 02
 Apr 2023 01:10:46 -0700 (PDT)
MIME-Version: 1.0
From: Lucas Tanure <tanure@linux.com>
Date: Sun, 2 Apr 2023 09:10:36 +0100
X-Gmail-Original-Message-ID: <CAJX_Q+1Tjc+-TjZ6JW9X0NxEdFe=82a9626yL63j7uVD4LpxEA@mail.gmail.com>
Message-ID: <CAJX_Q+1Tjc+-TjZ6JW9X0NxEdFe=82a9626yL63j7uVD4LpxEA@mail.gmail.com>
Subject: Kernel Panic - V6.2 - Reseved memory issue
To: kernelnewbies <kernelnewbies@kernelnewbies.org>, Rob Herring <robh+dt@kernel.org>, 
	Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230402_011049_520061_289A1882 
X-CRM114-Status: GOOD (  15.51  )
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
Reply-To: tanure@linux.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi,

I am trying to fix a kernel panic I am seeing on my vim3 board (Amlogic A311D).
I don't have enough knowledge about this area, but my current guess is
the kernel is using a piece of memory belonging to ARM-trusted
firmware that I shouldn't.
Log:

[ 9.792966] SError Interrupt on CPU3, code 0x00000000bf000000 -- SError
[ 9.792980] CPU: 3 PID: 3471 Comm: kded5 Tainted: G C 6.2.0 #1
[ 9.792985] Hardware name: Khadas VIM3 (DT)
[ 9.792987] pstate: 20000005 (nzCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[ 9.792991] pc : kmem_cache_free_bulk.part.98+0x1f0/0x528
[ 9.793004] lr : kmem_cache_free_bulk.part.98+0x2f8/0x528
[ 9.793008] sp : ffff80000a2eb7f0
[ 9.793009] x29: ffff80000a2eb7f0 x28: ffff00001f358518 x27: ffff000000008800
[ 9.793016] x26: ffff00000262b300 x25: ffff00000262b300 x24: 0000000000000001
[ 9.793019] x23: ffff00000262b000 x22: 0000000000000000 x21: ffff00001f358538
[ 9.793022] x20: fffffc0000098ac0 x19: 0000000000000004 x18: 0000000000000040
[ 9.793025] x17: 0000000000000018 x16: 00000000000007f8 x15: 0000000000000003
[ 9.793028] x14: 0000000000000006 x13: ffff800008e48550 x12: 0000ffff9dc91fff
[ 9.793031] x11: 0000000000000004 x10: 0000000000000001 x9 : ffff000007e93680
[ 9.793035] x8 : 0000000000000020 x7 : ffff000001d2b100 x6 : 0000000000000007
[ 9.793037] x5 : 0000000000000020 x4 : ffff000000008800 x3 : 0000000000000001
[ 9.793040] x2 : 0000000000000007 x1 : 0000000000000000 x0 : ffff00001f358540
[ 9.793045] Kernel panic - not syncing: Asynchronous SError Interrupt

This doesn't happen with downstream Khadas 6.2 kernel, and that's
because the downstream kernel removed this from
early_init_dt_reserve_memory (drivers/of/fdt.c):

/*
* If the memory is already reserved (by another region), we
* should not allow it to be marked nomap, but don't worry
* if the region isn't memory as it won't be mapped.
*/
if (memblock_overlaps_region(&memblock.memory, base, size) &&
    memblock_is_region_reserved(base, size))
          return -EBUSY;


And this causes 3 MiB of memory belonging to ARM Trusted firmware to
be reserved.

arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi :
/* 3 MiB reserved for ARM Trusted Firmware (BL31) */
secmon_reserved: secmon@5000000 {
        reg = <0x0 0x05000000 0x0 0x300000>;
        no-map;
};

And the mainline kernel fails to reserve that memory:
[    0.000000] OF: fdt: Reserved memory: failed to reserve memory for
node 'secmon@5000000': base 0x0000000005000000, size 3 MiB

It fails to reserve because memblock_overlaps_region and
memblock_is_region_reserved return one.
I think memblock_is_region_reserved is saying the memory is already
reserved by uboot and shouldn't be nomap, but it should.

Is there a bug here?
Why the kernel is failing to reserve this memory?
Is this an u-boot issue?

I would appreciate any help. The current mainline kernel fails 90% of
the time to boot into the Vim3 board.

Best Regards
Lucas Tanure

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
