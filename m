Return-Path: <SRS0=Dn2N=WI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 009EAC31E40
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Aug 2019 17:50:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C5C6D206C2
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Aug 2019 17:50:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uGjO2BYb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="Or8HpsYZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C5C6D206C2
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DXVM8E3CUHHPHCSDQ9D84a5U9h6nSbXVVgU5yRl+G64=; b=uGjO2BYbnVE3NO
	6ty6Xw3405J6dkXfnLC7AJRADYxgr+ZwdNJkNMLOkaadnpBQLSg2m69qkYhD9HVfVGu1A2uzP5ysW
	m1foPbb7Y4iTi9g02CPgwlU5TiBQhy7lyvTV28UHzHc5eS+wmub3D4zqUn79M+T8odTxqRgvyBNID
	LCnFyiCLFAKmUX7t8F5LFg8SH1OuIomFWH9ZhKKSATuIzhwwYMumY2AadD+/f868e1YjbL7EB2X8l
	2/m54b2CQi5kYBe4qvK+fquufCIWaOQtK9aAxijnulAHMCWxLWHaMP7Vkihttx0IxtLYFLGz3Y2dC
	1WK9T2KRuFz0TrxG1Dbg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hxESj-0007YJ-9H; Mon, 12 Aug 2019 17:50:29 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hxESg-0007XL-De; Mon, 12 Aug 2019 17:50:27 +0000
Received: by mail-wr1-x442.google.com with SMTP id q12so15070609wrj.12;
 Mon, 12 Aug 2019 10:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=stBKKVsI+4UvfEdFNUUprqBQVBNTUmemikvPps8gLE8=;
 b=Or8HpsYZpLiaPQQNpEID7tVw7MxJmfcAKHT4O/iVrJgsBwWJShl/XcOewcvSHSVEDQ
 k1pnMrQ9FnGFQurkDorTlrcEdAqBwoO1n4I4dbDkMJISpj0YCXjfFb28ieOiL5NRjTtt
 89Sxl690KoN0W+p4ouvNXnqEsBFxEBi13nDzOYF/8/YaaMEkeA0zG05dgPcPDc+f+l0D
 3r9FvjHSccqzm5ydUyCW9wytjP3QoQNJD43V2k0wPkGFCjvZ6sWcQb7mTmMzDlqOm1e4
 jUeuY2lNdxLKeA2OVP0l4rNY9UsW8qIrb+GdKrL6d9G6m+nOW4OZSzbcC4sIz+sllNX3
 dbWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=stBKKVsI+4UvfEdFNUUprqBQVBNTUmemikvPps8gLE8=;
 b=aUDlr6owokODMRRSqNnKx/OIFy2LKfYfH0Dvs+MpwHAEhGgHcbFo3dvqkY98bKYmaY
 QstWINLmPzC8M15MF6yKOjR1DRvHrzhfRx0DWabHvsPIzz/emEJrUz5o9GKZfQwHDcxh
 5MQ8SDqCJa57DrNTHrWS92UQ4dpnUJG92YXQFWJzvF9xYziE+9NT1dn5bIcuXddunYn+
 e02moac/GHjccLV9TI3y+b0tSX7he/I0s9KT7WkL5Ds7Sdb+nwxpdNP1rcS3Is3Jx7J2
 qT5YFViBpB7eB1rSJVsGbZezZCUvDYm2bxNeIbi1xYB9+bthLU2kP9ayjnn0X2RKPB2G
 rgcQ==
X-Gm-Message-State: APjAAAXRrocL5ilnon3N36Mn6DbOic1qy8lxkT3ye4OO3OBV0Zsqvofs
 fXMuhJ3+4uWIdwPhdCJJtaeAu4Ze
X-Google-Smtp-Source: APXvYqxZ085YucVRWLR7bncRkqmFLN0Av/atoYmK+5kGSsLcfHbtwGk/UrRgTGET2hkx+86R75kfkw==
X-Received: by 2002:adf:9b9d:: with SMTP id d29mr19369660wrc.132.1565632223084; 
 Mon, 12 Aug 2019 10:50:23 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300F133C1F600059A26DE113A463E.dip0.t-ipconnect.de.
 [2003:f1:33c1:f600:59a:26de:113a:463e])
 by smtp.googlemail.com with ESMTPSA id u7sm4084858wrp.96.2019.08.12.10.50.20
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 12 Aug 2019 10:50:21 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	khilman@baylibre.com
Subject: [PATCH 0/1] ARM: dts: meson8b: persistent MAC address for Odroid-C1
Date: Mon, 12 Aug 2019 19:50:03 +0200
Message-Id: <20190812175004.24943-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190812_105026_464199_C8B95C6F 
X-CRM114-Status: UNSURE (   7.99  )
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
Cc: narmstrong@baylibre.com, linux.amoon@gmail.com, ottuzzi@gmail.com,
 linux-kernel@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This series makes Odroid-C1 use the MAC address which is programmed into
the eFuse.

build-time dependencies:
none

runtime dependencies (without these a random MAC address is assigned,
just like before these patches), both are already part of -next:
- "nvmem: meson-mx-efuse: allow reading data smaller than word_size"
  from [1]
- "net: stmmac: manage errors returned by of_get_mac_address()" from [1]


Changes since v1 at [2]:
- only add the nvmem cell to meson8b-odroidc1.dts as suggested by Neil.
  It turns out that neither MXQ and EC-100 have the MAC address in eFuse
  (which means only 1/3 boards has it at the given eFuse offset, so it's
  not worth having it the common .dtsi)

Kevin: you already have v1 of this series in your tree. Feel free to
replace the two patches from v1 with this single one.


[0] https://patchwork.kernel.org/patch/11062659/
[1] https://patchwork.kernel.org/patch/11062657/
[2] https://patchwork.kernel.org/cover/11062663/


Martin Blumenstingl (1):
  ARM: dts: meson8b: odroidc1: use the MAC address stored in the eFuse

 arch/arm/boot/dts/meson8b-odroidc1.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
