Return-Path: <SRS0=BQut=RS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DD67C43381
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 Mar 2019 13:43:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21EB82186A
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 Mar 2019 13:43:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dCjOFbU4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="vljJxcwy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 21EB82186A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UIa4eAg8Mzr+tKMaY5/Q8WhtW9iNhBUQoZI2D1/fvCk=; b=dCjOFbU4XeGILs
	LBzSHwioHXPpG6U0H5PP3c8fg4qv3wF45cN88jNFLEjNEGyqPwa3qWeYo9C37xXD+3C85slQwBUrQ
	h4JU8ikJpAi+qavTMGEj7d+sBGk3UHSsD8T7jwkBoUcRyJdWC0W59hvOQzxyEo0Wm60rz1uLAhJn1
	ZBUC8C+HRpZdHJ3fY19B1rdrx8QR5ZR2/T7YwHkKY+kitvNq2RhbBRoRs1w9kUwg2yEh0ZH62Aij5
	nwLwnuKbUh/SoHuk3aLmZ067XPH+sv5Vrl7FF2eL+JrTqXhW2rP2kG7UfGursn7bYYpkt/fcygW0O
	lR1SoNO4zcXh8bxLZYvw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h4n6t-0006dP-Kb; Fri, 15 Mar 2019 13:42:55 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h4n6q-0006bw-Gf
 for linux-amlogic@lists.infradead.org; Fri, 15 Mar 2019 13:42:54 +0000
Received: by mail-wm1-x343.google.com with SMTP id e74so6535048wmg.3
 for <linux-amlogic@lists.infradead.org>; Fri, 15 Mar 2019 06:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uM0s9S7vXv3GaljebP63J+EXUbxskzR577CHIKCJygg=;
 b=vljJxcwyIz1T8MjotFTCUWy+GOpcrS+yczFqjCEFqb0DyZb8H1evSnHSk7hkKk7lAt
 UIg2oARBfkeT1fbDP1OVXqLKD8qWUkgtwd5F2mgold5nTnJjARiOL7tXYzVf6qUDIdgk
 ArTzIRVsd9QrA9EZYgjsrk543c6AKJwpbDz+bo3mzEuU//0kYHoE2BbP8lsIZhK6OQ4+
 ql3CxssMQfQXxu7GOds0fW63t4IcpX9g4kItu74rkk5c0YmGZBRJWJm9a9/jPSQClOMR
 FReit//JpjmubaJugnNGmy1Xbcgwt3vsvOMBmiBNrlYwOpAEaPxDC3sb47u/Tspllyav
 OjwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uM0s9S7vXv3GaljebP63J+EXUbxskzR577CHIKCJygg=;
 b=Pd/rRgdQhjv7+DS0G5AL3E28gz+ZLjVIpjakIcT1+tHoQwiRRmmn/RYGhWC+jsXLGn
 m39fuddDWKKIdVzZNAWtgWJHWeaW4eQmtbef2LjaAGa2cbLY1F4mp7AOD1W6IWtNUs5E
 qlfkxlTtiGZzgwNIEXSHCD22xo1jaHfZEvY2jRfLOtCuuaYk5eG3MdVSRGgCB7hMI87m
 yWhD+DTfwf0fOe8PBlM3SVjUw2yKCWptSnGQMOOH0K9gx2dXQ5/djxHt8iA3m8VPPEKG
 fRGkTmGwpcLczOAjZ7JCgH3Z4JVHsrtjNTp0k7N/7kP5uxZY8wOaJ1x7jnJlXOdBLZ9F
 s//A==
X-Gm-Message-State: APjAAAX7VaR86Ppw93+LzqMfeKOBR6X6ogBO+1pIRpZuCO32zw6d/Wpx
 S+GpCC8MfmFHaQSMMNMLtWIBdQ==
X-Google-Smtp-Source: APXvYqzaCVBzGct+nK2d7TGr+O02Pa7sptZZ/tPLUkYTi0w5SmCKlbpZuYPuboXebpaKIcLlJ2USkg==
X-Received: by 2002:a1c:1cf:: with SMTP id 198mr2117187wmb.52.1552657370820;
 Fri, 15 Mar 2019 06:42:50 -0700 (PDT)
Received: from boomer.local ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.googlemail.com with ESMTPSA id x17sm4616143wrd.95.2019.03.15.06.42.48
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 15 Mar 2019 06:42:49 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 0/2] arm64: dts: meson: g12a: add secure monitor and efuse
Date: Fri, 15 Mar 2019 14:42:42 +0100
Message-Id: <20190315134244.14141-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190315_064252_596624_0331AB7D 
X-CRM114-Status: UNSURE (   6.95  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This patchset adds the secure monitor and efuse to the g12a SoC family.
These are sent together because the secure monitor is required for the
efuse driver to work properly. This is probably something the bindings
should show but it was not designed that way when the secure monitor was
introduced ... something to look at someday.

Jerome Brunet (2):
  arm64: dts: meson: g12a: add secure monitor
  arm64: dts: meson: g12a: add efuse

 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
