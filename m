Return-Path: <SRS0=k9nf=62=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97966C2D0F8
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 May 2020 21:52:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 68A4020747
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 May 2020 21:52:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="D7L4Zba3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="UMQdEEEn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 68A4020747
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ilQFSIdC89eWKv+sfb6AOLY0S9s6kLy0+nrt5iIP+q8=; b=D7L4Zba3xjh9c9
	XefnLoqo3OVXsuCVRbbnh2FfP1JytGB9XL6wasPYtJhl3gHuWfp3tk9kUIBDnpXNr2w/pMheUOxxe
	S7uIV7ifX2V+Ow26MTRwNpoy8GL6PgH/2orrnXdAjbA1I+T4xDkojeTlTcLKv6KDYwQead+jE1Q/b
	yePzLlRGAZhJkbXdRMmqQnzGBS3wqMFTctftbwY+fUCfRE8hFYOoTouCwBLwk6clu4c8czq5KLFgf
	sJHdgpBUDt6NUebw9PHpno7ufLW2z+JbFIEhlQID8iToqytB+UhdMwgssypMTRBU1evyaT0ykiUvs
	iTz5PIlm8yTtdVxHeUyA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYcpB-0007sQ-AA; Tue, 12 May 2020 21:52:29 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYcoh-0007Nf-Qw; Tue, 12 May 2020 21:52:01 +0000
Received: by mail-wr1-x443.google.com with SMTP id w7so17917451wre.13;
 Tue, 12 May 2020 14:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6CrrHw2+5KWDhy3iiVXXbeJ0AsJcDeTot0gYMePzQBM=;
 b=UMQdEEEnDl8gTCVzl+ax4sDJdZbejUYeFdm0NXpvGzq7TPcWLqKL4wwxVSMNDy2K0J
 lqcgQLDp3O8W+5koPS9FNU0VNuz+P2dCb/xLkljphQyq41BwKPQUXrrG11m/uOWaN2ye
 r1WgJP1ieZJ8jcvGNI8hK2HSTAf3U2kAwycdiHV8foPiJ1sbpD8CGPNRbCCaGuAJd4Mx
 kYbBI+4uDB0rTzrGAgqK4Jjk7l0NtWVAS4TU64hwZaqve2C6fTBPtSE+8ssXrq3s5IlC
 QKmsym87IKL+ZaeP5M6tfIjowxKhLqn5+ChRsuEu5OUZj/f0QhCPu3DYYZKQgXpLW24r
 j5yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6CrrHw2+5KWDhy3iiVXXbeJ0AsJcDeTot0gYMePzQBM=;
 b=GAiiSrxT9bNKwiSgwbwD2ensMhF3eEVvnB7hPML1HozSITFBHu4StmeLG+RIlK1QVY
 QUpuYtova4wVqlm95ZaJ88KVnkMatUlRCPrADA6pnTe6u0bt+631Y+EiMm3HpCuiHH6b
 BF2KaHgumQApiVw0ASIIhMKAZe8gHSrYGxEfrBi1bPrAIRMb7MEQGJzIJDQXl0+k5ZLb
 9GkAIKxV1O4o1fUOKlz/9WbAB3/i9u+sCPrX/WigXd7XMLqRFNI1z4OFWWrKf0MvR+2S
 MrCBWTBA4ihKukJZC3wfelYRWQJYjC4Dr2YkglulVWT8l8W1QhGHA2JomAXBZV2jZACc
 5O9g==
X-Gm-Message-State: AGi0PuaEXcRkjzp0HLVGSeTAdEXMmax4ZWR977bViNXVULtrSF68YK+s
 efOeUoSjy9uN8XdWsgvRW5lh0HC5
X-Google-Smtp-Source: APiQypKNwrLxB/fB1Wzqappr40dMluVL/cCeENBj+MZBO20q6ZX7Q1C1L7w9YtBXmRqWpfe/dQ1kvA==
X-Received: by 2002:a5d:5710:: with SMTP id a16mr18085669wrv.209.1589320316098; 
 Tue, 12 May 2020 14:51:56 -0700 (PDT)
Received: from localhost.localdomain
 (p200300F137132E00428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:3713:2e00:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id d9sm9154234wmd.10.2020.05.12.14.51.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2020 14:51:55 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	khilman@baylibre.com
Subject: [PATCH 0/2] ARM: dts: meson8b/m2: RGMII improvements
Date: Tue, 12 May 2020 23:51:46 +0200
Message-Id: <20200512215148.540322-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200512_145159_879866_388BBC4A 
X-CRM114-Status: GOOD (  13.08  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, andrew@lunn.ch,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Kevin,

the fist patch in this series connects FCLK_DIV2 to the PRG_ETH
"additional" registers for the dwmac Ethernet controller.
Now that we know how RGMII and FCLK_DIV2 are connected we can
add this dependency to get rid of CLK_IS_CRITICAL for FCLK_DIV2
at some point.

The second patch fixes the RX and TX delay. The 4ns TX delay which
we have used so far is incorrect and only worked because we were
using an unsupported clock divider in the PRG_ETH registers. That
divider has been fixed with commit bd6f48546b9c ("net: stmmac:
dwmac-meson8b: Fix the RGMII TX delay on Meson8b/8m2 SoCs").
Instead of "just" fixing the TX delay we can even do better and
switch to phy-mode = "rgmii-id" to let the PHY generate the RX
and TX delay. However, previously we didn't know that there was
an RX delay applied by the MAC on these boards. Only the additional
information from Jianxin in the other series [0] made us aware
of this. Without the other series there will be a 4ns RX delay
(2ns from the MAC and additional 2ns from the PHY). Due to this
dependency I did not add a Fixes tag, because backporting these
.dts patches without their runtime dependency will break stable
kernels.

TL;DR:
Ethernet TX throughput on my Odroid-C1 improved from <200Mbit/s
to >700Mbit/s (measured with iperf3)


Dependencies:
This series has a runtime dependency on v7 of the series called
"dwmac-meson8b Ethernet RX delay configuration" [0]


[0] https://patchwork.kernel.org/cover/11543997/


Martin Blumenstingl (2):
  ARM: dts: meson: Add the Ethernet "timing-adjustment" clock
  ARM: dts: meson: Switch existing boards with RGMII PHY to "rgmii-id"

 arch/arm/boot/dts/meson8b-odroidc1.dts    | 3 +--
 arch/arm/boot/dts/meson8b.dtsi            | 5 +++--
 arch/arm/boot/dts/meson8m2-mxiii-plus.dts | 4 +---
 arch/arm/boot/dts/meson8m2.dtsi           | 5 +++--
 4 files changed, 8 insertions(+), 9 deletions(-)

-- 
2.26.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
