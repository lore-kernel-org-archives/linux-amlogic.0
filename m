Return-Path: <SRS0=l5NU=HA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95AA6C433E0
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Jan 2021 20:51:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 00B8B64DE7
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Jan 2021 20:51:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 00B8B64DE7
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=mailbox.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vkOeZpldmS1Jyh2mGQ2loIPqqRL/k7A+Lz5e4Fxe26M=; b=hdQzGJ7lGptwO17Vvd0WYrnp3
	Tq3DWtjpEXZf8QJURCKBjqUhvFTl0ec7KUtwPFL6gaYbMlFCWCYLnDFBOLKn+9fkRKJ+3YMZg85Uy
	AX7I5WqxWjDPX3Bo6jTmvEHji2PsCuh3mkh4ybcD0Cz3z/qeDu26MxDsi5B+LP4YuXT4KXArVzgPQ
	Xv1/EIJEVU63T0iqKnYS5BxuUPGC143boLW1rrIoehCsL+I1GQyya/ogl7nZqT6WyYy4c9xykFtmk
	KiHQcrVkqY60J/AWVoS1One455+8Xm6MoCX+5mzE7PHvHUQEYS9ilZMHpuQBMMegYPyAege+bzSZb
	N6vf9VkFg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5aja-0003gc-DJ; Fri, 29 Jan 2021 20:51:14 +0000
Received: from mout-p-102.mailbox.org ([2001:67c:2050::465:102])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5ajW-0003f1-7g; Fri, 29 Jan 2021 20:51:11 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:2:0])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4DS8d65Z0TzQl34;
 Fri, 29 Jan 2021 21:51:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
 content-type:content-type:content-transfer-encoding:mime-version
 :references:in-reply-to:message-id:date:date:subject:subject
 :from:from:received; s=mail20150812; t=1611953462; bh=xTUSlQGlJ4
 O/glSdfwt6VTU8Y2vdtR0/SkFekJvWbtU=; b=WDD5PJtGo6eQ9lZ/cNrVq/J0y0
 FjJbauQXj/YgLkyvLOp4LquDBER7c+EFyHZvdxITalRNgQwAfQiucQl9KDUcz+Yp
 W3MWn0XYDZLuXZetcjyaDUaathqAX81gvCrvXhQGUSEax8hfvs15ZUZjLSFS9ZLZ
 gd2ICj9xH+KJSLvccIVu+4gUoTeRG4XuHkbsIIh9ibWGDrzRePatAESckT9bgoWC
 MTKhfdkaTB+oQKs2pGUnHr2hQJrGOfgQ1qh8pbj2Z1ZtVru/XuZ+6yrRgTWhJblb
 hJx/M6GHSFU+cDm8q6Ujg5wgrcmBnTXLXQLF8iEpbUxIWDpWx1HSUuHehZ4Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1611953464;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JzwsCdfVSTOtS/bF/vm3HDlF8TCyOY29JFbirc/qunM=;
 b=e8uDT7orDdDNJHq8KvDOgDe5mQ0fOeN7Dvv9fmQnwgPesvFV5NVG4r1atXu2w8WU7+yKsZ
 9MjhnR1Zq/cbY0ww/ovxGlm3yM+arY1ui4KXVClQ0Hmj6QgZIaknAU8XqO9cpfjRbQlGnk
 wBuBl16LQ3KKIC9YBzjQS5wHBhA4A8Ys2MENfTf7p3KYwrysEesQjbsIgIqI6WKZ9RHCE6
 daqTd/GDmgf5oZeP5ShMTGJsBVY0ZSWNLgR+LS7juZmVHi76wvGLkORKHnticZNDOPrvur
 pystS4OB5vnK08JgU77SGIx5rbUEMRwHJ9XrHnjR+4OjR5csGZuEMLqqWebGyg==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
 by gerste.heinlein-support.de (gerste.heinlein-support.de [91.198.250.173])
 (amavisd-new, port 10030)
 with ESMTP id bt0eZ20CUUjS; Fri, 29 Jan 2021 21:51:02 +0100 (CET)
From: Alexander Stein <alexander.stein@mailbox.org>
To: Rob Herring <robh+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 1/1] arm64: dts: meson: g12b: odroid-n2: Assign a fixed
 index to mmc devices
Date: Fri, 29 Jan 2021 21:51:01 +0100
Message-ID: <1975982.ltkoRUPMKj@kongar>
In-Reply-To: <8de4d82e-b9a5-f809-ea67-5527f9fdde5f@baylibre.com>
References: <20210127230852.66686-1-alexander.stein@mailbox.org>
 <8de4d82e-b9a5-f809-ea67-5527f9fdde5f@baylibre.com>
MIME-Version: 1.0
X-MBO-SPAM-Probability: 
X-Rspamd-Score: -3.75 / 15.00 / 15.00
X-Rspamd-Queue-Id: 627F217CC
X-Rspamd-UID: 19e790
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210129_155110_760373_129387CC 
X-CRM114-Status: GOOD (  10.98  )
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
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi,

Am Freitag, 29. Januar 2021, 09:07:45 CET schrieb Neil Armstrong:
> On 28/01/2021 00:08, Alexander Stein wrote:
> > Recently introduced async probe on mmc devices can shuffle block IDs.
> > Pin them to fixed values to ease booting in environments where UUIDs
> > are not practical. Use newly introduced aliases for mmcblk devices from 
[1].
> > [1]
> > https://patchwork.kernel.org/patch/11747669/
> 
> I understand the goal, and this should be done for _all_ boards, not only 
the Odroid-N2.

I see. So there are 2 options:
1.
Set the mapping for all 3 sd_emmc_* in the top-most .dtsi
Upside: very easy patch
Downside: When sd_emmc_a is not enabled "mmc0" will never be available.
Might be confusing.

2.
Set mapping only for enabled sd_emmc_* in the .dts[i] where it is enabled
Upside: Clean setup, only enabled sd_emmc_* have an alias
Downside: Much verbose patch(set)

Any preferences here? I honestly tend to 1. But this might break boards where
sd_emmc_a is not enabled, because the root device _will_ change in that case.

Best regards,
Alexander




_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
