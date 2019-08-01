Return-Path: <SRS0=NajJ=V5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41060C19759
	for <linux-amlogic@archiver.kernel.org>; Thu,  1 Aug 2019 08:29:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A6402087E
	for <linux-amlogic@archiver.kernel.org>; Thu,  1 Aug 2019 08:29:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="U6XrB5f7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=endlessm-com.20150623.gappssmtp.com header.i=@endlessm-com.20150623.gappssmtp.com header.b="VwMzOOxV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A6402087E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=endlessm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=cS/4rJ06g2rpe6TcJf0Z622DRtXHiZoVHyxngwcksx8=; b=U6X
	rB5f7s1zqGH7kCBo7isPncohRxHXYSFyoBYg3bwzqeiYnBr7lpu/cDIJ1HWt3SvWJMs7wcfx+g+BF
	O28kVb4mWO4ojJNEV+nZaKIeX/s3amTmee3rruRmxCZbEerA2VrAKSpH1zpF74q68ydULi/fWWEbE
	MmSBhqtM+vVNT05R/tm7v57v9Xi6/AgocgvWze3wFLJ5Qp7B8T8xhT+kSX/WB+AccB5D2mrTJMH9W
	Lz/XtH5ouWnNVAckKoKW1chc2BJX9qAFBrnnUbhdQCaNY/ky14K1pTyqiTFF5hSqg8euAmKrLNKmq
	swWUx1OVQOhAQU54OJ9enwpU6srV40A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1ht6Sq-0007X3-Ue; Thu, 01 Aug 2019 08:29:32 +0000
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1ht6OM-0008GA-9U
 for linux-amlogic@lists.infradead.org; Thu, 01 Aug 2019 08:24:55 +0000
Received: by mail-qk1-x732.google.com with SMTP id m14so25629225qka.10
 for <linux-amlogic@lists.infradead.org>; Thu, 01 Aug 2019 01:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=endlessm-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to;
 bh=kKZsDn2A66Xm4K7zsQxXlBFI4Qdg91orXrrMapVK5SU=;
 b=VwMzOOxVYvGIGR3te19INa6Oo/gb4Y5PB3aBl9qj2ssp5uaQvAcrcBU1KUErZoSZBG
 mltmpWE1rJOmIPLtPbMJMIO/ojnQjMVIMnf7elAMAxsC3AmbXhIPwxcCc1LkQ+qAd6eg
 jG7UqGlap7gJhlgNEJrpJi+lV/azl3Pj09bpDx2Vxh9M32WlapKgOhgWWMncUCte0gt6
 nQUDFzGucQpIZQnq1zuH48hbMsLYK90MtRfHS6ZrDKa/w4Y0dYrFwak3joHlWFxxZME9
 +FZpMK4BZlPOqd6P9MbdS/dtR2H6IxDlTzunnMdx/FFtAcZBC4e+GPwItfLhzW0z7TnE
 gMWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=kKZsDn2A66Xm4K7zsQxXlBFI4Qdg91orXrrMapVK5SU=;
 b=XYvmBpGgSd+yghrCrpIxCJ103H460wQPQM5AD6nASH3ivbgcNG3Aqus6lKH7Un5Kbv
 DN4HWqtvh6ZU27JlNAo3d3TQ7fl6vqtZMa26LU/ykvhH0bJCt2SClTslsI50VstQJOPp
 AGvfC5wtsOrbsDEM76dnvOk87d/Q/+GWNH4stZb0YfEJ+B73zU0nuMIw0A66Hl76HFRF
 FEWkC2RZXC4kQmPooV9v4z57YDmz/r++gLutZCUVAx2LgLKBF0U+/WAZRmZpoS0DVi+L
 woB8w1GLap3Gvbg03a2JhEJnju3LXUZmm21UlqTMLstTRWZtA2SGOG7umteZPWA0cfRQ
 6+GA==
X-Gm-Message-State: APjAAAVAXzN2pgSbXMr4wGt68FrfJIldmgRbt/4dHb2jgPM1W/LYkyFP
 iEh0xhnom8S5nKl+4yhYL9HMNDfBwSefPXKEyrkdtYMpfhw6Mw==
X-Google-Smtp-Source: APXvYqwDQhFbeRbQR2l5tF/bJpqOr7OCtFs++TpbdpwzQhDj/g4oD1DIxW+4/eVDCyZi1gJCyGozuD1q/TP/561hNJM=
X-Received: by 2002:ae9:eb4e:: with SMTP id b75mr82491743qkg.478.1564647892077; 
 Thu, 01 Aug 2019 01:24:52 -0700 (PDT)
MIME-Version: 1.0
From: Daniel Drake <drake@endlessm.com>
Date: Thu, 1 Aug 2019 16:24:41 +0800
Message-ID: <CAD8Lp46mjcT3mqsCcrFAcD3opqp20mGCxrd154H68XvC7haLXg@mail.gmail.com>
Subject: Using meson-tools to install u-boot
To: afaerber@suse.de, 
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190801_012454_416282_809E52BE 
X-CRM114-Status: UNSURE (   5.34  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi,

Thanks for https://github.com/afaerber/meson-tools

I'm interested in it as a way of dropping reliance on the vendor's
bitrotting uboot tree, and also because the vendor binaries are
x86_64, whereas distros benefit from running this on native arm64
build infrastructure. Is this possible with the current state of
meson-tools?

Looking at the instructions at
https://github.com/u-boot/u-boot/blob/master/board/amlogic/p212/README.libretech-cc
and your README, most of the steps appear easy to "translate" to
meson-tools.

But what about this one?
 > $FIPDIR/acs_tool.pyc fip/bl2.bin fip/bl2_acs.bin fip/acs.bin 0

Does meson-tools provide an alternative here?

Thanks
Daniel

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
