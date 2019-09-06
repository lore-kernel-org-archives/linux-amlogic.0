Return-Path: <SRS0=Pg3q=XB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 857C6C43331
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Sep 2019 12:21:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59734206CD
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Sep 2019 12:21:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="h5GV9/Ic";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sBi5fWpL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 59734206CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FvyUCsEBWmQXNWL7gNZytGBwOrX0Lpb/hdgdzBX7XfQ=; b=h5GV9/IcQFx1Vo
	NavSmYI31d7ctoQN4W3hCKbjpf9XWhoZHg+vc5UmusyME3UCGUJNMMqreoJ5VwCmVn4YTF27C8OSo
	tl51IxWMRlxIgZUkt1Qvi889zFTNb9DaZHHovJSc7kSPxSX+7lS/Sf0x3Sy4/b5fahEtLl28e6FS8
	npIy6uKdT+Ln11DW7qb6wNkPsw35zeTXW8vAA4XSfTPdH9N/Q8xhbncYa5dNKkfMI0Mxfk73QJqIR
	ZBFXwB1noJJNBbh1Hyn7pOmDXek/oX6a1eSWjblqIbTZMyjgpvfKXEKU3bpKfu+NSBsVvKRg05bMj
	CXKxQO0h0RpKHoEApcVA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i6DEa-00068S-5z; Fri, 06 Sep 2019 12:21:00 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i6DET-00061R-G9; Fri, 06 Sep 2019 12:20:54 +0000
Received: by mail-pl1-x643.google.com with SMTP id gn20so3071952plb.2;
 Fri, 06 Sep 2019 05:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Yz8E2Km3qb90hXAs0IYE6gU7l6QgyfYQZCSLqivyf6E=;
 b=sBi5fWpLkJxLG+1JbIBpFxU2wYFj0Rs9t7FdUjuEGTXEdUskawkWs7bKLQTbSiRpG7
 qjhl0dF9LHFwxei4SsNWyHZYsRyITHY1813nt5Qmhl+ekqxXelwFqEcADBaOHIKXX/0V
 khF8myUbLbxdgH2l8IGeznwGAlWmeOPqKraFv7lW4jPV1UHxMzEYrAaMxmgXfRKklht8
 3KZpkKg8mfU/uXRHZ13pYQo24TfaYwGj180ya/4o/m81xAdpJ+HDpQ6GOZWyXCRx2kaO
 jSNd6NlTTHccjWA3MrzpQdVAtKPzijDLC9pUugAWmkipIibe5KE6wbEzDvoq8MnF4xcE
 D9zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Yz8E2Km3qb90hXAs0IYE6gU7l6QgyfYQZCSLqivyf6E=;
 b=nqsGOPgo3ErVPSPGe94gdw8R0hCUjCPNgj6UFK71IdZ9tz9Uak/ybB2yxQTREKFHxo
 RqCpJROTXcBpXIKCwb8ayJGMLbXhbY1JaVF7QSwB/wYsPY5uwnOaFTl/4HERFDPMpf4m
 +zGs/7G8LqHdfGippSqm2gpPYONsi+dD5qNr2MSV3vzNa8xQ+YpXcWgmlJqF17XaI/dh
 cJn7Ym9HjTefvdAe+gODhOpXhv+Nt14ymc79wFIsm7o8Ht38oSPUTPcGds/YBqclNoMV
 3dM/fxs/AbVo+sSUa5QE/3OLrL1UWZXbyR5eb/LiLTe3B8PWS/Fnl/XKF0stz3QcovXl
 F75g==
X-Gm-Message-State: APjAAAVzJNtrpaCQHCHJnHd3rezx9PF5QFKusgGgcS5WcrxnbACSaLBs
 OU5tfxVvZq9qfTDLlUYFLVeF8h6F
X-Google-Smtp-Source: APXvYqytNc4583TyUBAV/uTzWtXmL7i+BG+xiP2y5wuQOBP1Lr6CNp2zeZDS6Vji8zuvtspD30AQow==
X-Received: by 2002:a17:902:7b8c:: with SMTP id
 w12mr8244462pll.276.1567772452654; 
 Fri, 06 Sep 2019 05:20:52 -0700 (PDT)
Received: from localhost.localdomain ([45.114.62.203])
 by smtp.gmail.com with ESMTPSA id c23sm4944218pgj.62.2019.09.06.05.20.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Sep 2019 05:20:52 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>
Subject: [PATCHv3-next 0/3] Odroid c2 missing regulator linking
Date: Fri,  6 Sep 2019 12:20:41 +0000
Message-Id: <20190906122044.372-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190906_052053_565605_80FD43E0 
X-CRM114-Status: UNSURE (   6.74  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Below small changes help re-configure or fix missing inter linking
of regulator node.

Re-based on linux-next-20190904
Changes from previous patch's series.
Build using Cross Compiler.

Added missing Reviewed-by Neil's and Martin.
Added few suggestion from martin for rename of node.

Dependencies:
Changes based top on my previous usb fix series patch's.

[0] https://patchwork.kernel.org/patch/11113095/
[1] https://patchwork.kernel.org/patch/11113099/
[3] https://patchwork.kernel.org/patch/11113103/

Hope this series get picked up for 5.4-rc1, finger crossed.

Changes for previous changes.
Fix some typo.
Updated few patches as per Martin's suggestion.

I will try to commit less mistake in the future.

Best Regards
-Anand

Anand Moon (3):
  arm64: dts: meson: odroid-c2: Add missing regulator linked to P5V0
    regulator
  arm64: dts: meson: odroid-c2: Add missing regulator linked to
    VDDIO_AO3V3 regulator
  arm64: dts: meson: odroid-c2: Add missing regulator linked to HDMI
    supply

 .../boot/dts/amlogic/meson-gxbb-odroidc2.dts  | 53 +++++++++++++++++--
 1 file changed, 50 insertions(+), 3 deletions(-)

-- 
2.23.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
